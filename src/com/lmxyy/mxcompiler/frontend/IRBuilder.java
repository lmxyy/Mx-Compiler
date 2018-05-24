package com.lmxyy.mxcompiler.frontend;

import com.lmxyy.mxcompiler.ast.*;
import com.lmxyy.mxcompiler.ir.*;
import com.lmxyy.mxcompiler.symbol.ExprOperator;
import com.lmxyy.mxcompiler.symbol.FunctionType;
import com.lmxyy.mxcompiler.symbol.GlobalSymbolTable;
import com.lmxyy.mxcompiler.symbol.SymbolInfo;
import com.lmxyy.mxcompiler.utils.CompilerOption;
import com.lmxyy.mxcompiler.utils.WarningInfo;

import static com.lmxyy.mxcompiler.ir.BinaryOperationInstruction.Operator.*;
import static com.lmxyy.mxcompiler.symbol.ExprOperator.Operator.*;

public class IRBuilder implements ASTVisitor {
    private IRRoot irRoot = new IRRoot();
    private GlobalSymbolTable globalSymbolTable;
    private Function curFunction;
    private BasicBlock curBasicBlock;
    private BasicBlock loopStepBlock = null,loopAfterBlock = null;
    private boolean isFunArg = false,needAddr = false;
    private String className = null;

    public IRBuilder(GlobalSymbolTable _globalSymbolTable) {
        globalSymbolTable = _globalSymbolTable;
    }

    private boolean needMemoryAccess(Node node) {
        if (node instanceof VariableNode) {
            if (((VariableNode) node).getExpr() != null) return true;
            else if (((VariableNode) node).getVar() != null&&((VariableNode) node).getId() != null) return true;
            else return false;
        }
        else if (node instanceof ExpressionNode) {
            if (((ExpressionNode) node).getOp().getOp() == MEM) return true;
            else if (((ExpressionNode) node).getOp().getOp() == ARRAY) return true;
            else if (((ExpressionNode) node).getOp().getOp() == SELF
                    &&needMemoryAccess(((ExpressionNode) node).getExprs().get(0)))
                return true;
            else if (((ExpressionNode) node).getOp().getOp() == TRN&&
                    (needMemoryAccess(((ExpressionNode) node).getExprs().get(1))
                            ||needMemoryAccess(((ExpressionNode) node).getExprs().get(2))))
                return true;
            return false;
        }
        else return false;
    }

    private void assign(boolean needMem,int size,IntValue addr,int offset,ExprNode rhs) {
        if (rhs.basicBlockTrue != null) {
            // Cannot be here.
            BasicBlock merge = new BasicBlock(curFunction,null);
            if (needMem) {
                rhs.basicBlockTrue.append(new StoreInstruction(rhs.basicBlockTrue,addr,offset,size,rhs.intValue));
                rhs.basicBlockFalse.append(new StoreInstruction(rhs.basicBlockFalse,addr,offset,size,rhs.intValue));
            }
            else {
                rhs.basicBlockTrue.append(new MoveInstruction(rhs.basicBlockTrue,rhs.intValue,(Register)addr));
                rhs.basicBlockFalse.append(new MoveInstruction(rhs.basicBlockFalse,rhs.intValue,(Register)addr));
            }
            rhs.basicBlockTrue.end(new JumpInstruction(rhs.basicBlockTrue,merge));
            rhs.basicBlockFalse.end(new JumpInstruction(rhs.basicBlockFalse,merge));
            curBasicBlock = merge;
        }
        else{
            if (needMem)
                curBasicBlock.append(new StoreInstruction(curBasicBlock,addr,offset,size,rhs.intValue));
            else curBasicBlock.append(new MoveInstruction(curBasicBlock,rhs.intValue,(Register)addr));
        }
    }

    private void processArrayAccess(ExprNode node,ExprNode array,ExprNode subscript) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }

        boolean oldNeedAddr = needAddr;

        needAddr = false;
        visit(array);
        visit(subscript);
        needAddr = oldNeedAddr;

        IntValue unitSize = new IntImmediate(node.getType().getRegisterSize());
        VirtualRegister reg = new VirtualRegister(null);

        curBasicBlock.append(
                new ArithmeticInstruction(
                        curBasicBlock,reg,MUL,
                        subscript.intValue,unitSize
                )
        );
        curBasicBlock.append(
                new ArithmeticInstruction(
                        curBasicBlock,reg,BinaryOperationInstruction.Operator.ADD,
                        array.intValue,reg
                )
        );

        if (needAddr) {
            node.address = reg;
            /*node.offset = CompilerOption.getSizeInt();*/
            node.offset = 0;
        }
        else {
            curBasicBlock.append(
                    /*new LoadInstruction(
                            curBasicBlock,reg,node.getType().getRegisterSize(),
                            reg,CompilerOption.getSizeInt()
                    )*/
                    new LoadInstruction(
                            curBasicBlock,reg,node.getType().getRegisterSize(),
                            reg,0
                    )
            );
            node.intValue = reg;
            if (node.basicBlockTrue != null)
                curBasicBlock.end(new BranchInstruction(curBasicBlock,reg,node.basicBlockTrue,node.basicBlockFalse));
        }
    }

    private void processNewExpr(ExpressionNode node) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }

        VartypeNode type = node.getType();
        VirtualRegister reg = new VirtualRegister(null);

        if (type.isClass()) {
            curBasicBlock.append(new HeapAllocateInstruction(
                    curBasicBlock,reg,
                    new IntImmediate(globalSymbolTable.getMemorySize(type.getName()))
                    )
            );
            // To add something to call the constructor.
            /* Write something here.*/
        }
        else {
            boolean oldNeedAddr = needAddr;
            needAddr = false;
            visit(node.getVartype());
            needAddr = oldNeedAddr;
            ExpressionNode dim = node.getVartype().getDims().get(0);

            IntImmediate unitSize = new IntImmediate(
                    node.getVartype().getType().getDimension() > 1?
                            CompilerOption.getSizePointer():
                            node.getVartype().getRegisterSize()
            );
            // It's highly possible to rewrite here.
            if (dim != null) {
                curBasicBlock.append(
                        new ArithmeticInstruction(
                                curBasicBlock,reg,MUL,
                                dim.intValue,unitSize
                        )
                );
                curBasicBlock.append(
                        new ArithmeticInstruction(
                                curBasicBlock,reg,BinaryOperationInstruction.Operator.ADD,
                                reg,reg
                        )
                );
                curBasicBlock.append(new HeapAllocateInstruction(curBasicBlock,reg,reg));
                curBasicBlock.append(
                        new StoreInstruction(
                                curBasicBlock,reg,0,
                                CompilerOption.getSizeInt(),dim.intValue
                        )
                );
            }
            else {
                curBasicBlock.append(
                        new ArithmeticInstruction(
                                curBasicBlock,reg,MUL,
                                new IntImmediate(0),unitSize
                        )
                );
                curBasicBlock.append(
                        new ArithmeticInstruction(
                                curBasicBlock,reg,BinaryOperationInstruction.Operator.ADD,
                                reg,reg
                        )
                );
                curBasicBlock.append(new HeapAllocateInstruction(curBasicBlock,reg,reg));
                curBasicBlock.append(
                        new StoreInstruction(
                                curBasicBlock,reg,0,
                                CompilerOption.getSizeInt(),new IntImmediate(0)
                        )
                );
            }
            // Write something to deal with the Syntactic sugar.
        }
        node.intValue = reg;
    }

    private void processSelfIncOrDec(ExpressionNode node) {
        boolean oldNeedAddr = needAddr,isMemOp = needMemoryAccess(node);
        needAddr = isMemOp;
        ExprNode oprand = node.getExprs().get(0);
        visit(oprand);
        if (isMemOp) {
            needAddr = false;
            visit(oprand);
        }
        needAddr = oldNeedAddr;

        BinaryOperationInstruction.Operator op = BinaryOperationInstruction.Operator.ADD;
        if (node.getOp().getOp() == ExprOperator.Operator.SDEC||node.getOp().getOp() == ExprOperator.Operator.PDEC)
            op = BinaryOperationInstruction.Operator.SUB;
        boolean isSuffix = true;
        if (node.getOp().getOp() == ExprOperator.Operator.PINC||node.getOp().getOp() == ExprOperator.Operator.PDEC)
            isSuffix = false;
        IntImmediate one = new IntImmediate(1);
        VirtualRegister reg;

        if (isSuffix) {
            reg = new VirtualRegister(null);
            curBasicBlock.append(new MoveInstruction(curBasicBlock,oprand.intValue,reg));
            node.intValue = reg;
        }
        else node.intValue = oprand.intValue;

        if (isMemOp) {
            IntValue addr = oprand.address;
            int offset = oprand.offset;
            reg = new VirtualRegister(null);
            curBasicBlock.append(new ArithmeticInstruction(curBasicBlock,reg,op,oprand.intValue,one));
            curBasicBlock.append(new StoreInstruction(curBasicBlock,addr,offset,CompilerOption.getSizeInt(),reg));
            if (!isSuffix) node.intValue = reg;
        }
        else {
            curBasicBlock.append(
                    new ArithmeticInstruction(
                            curBasicBlock,(Register) node.intValue,op,oprand.intValue,one
                    )
            );
        }
    }

    private void processStrOperation(ExprOperator.Operator op,ExpressionNode node) {
        ExprNode lhs = node.getExprs().get(0),rhs = node.getExprs().get(1);
        VirtualRegister reg = new VirtualRegister(null);
        node.intValue = reg;
        /* Write something here to call the builtin string method. */
    }

    private void processIntArithmeticExpr(ExprOperator.Operator op,ExpressionNode node) {
        ExprNode lhs = node.getExprs().get(0),rhs = node.getExprs().get(1);
        visit(lhs); visit(rhs);
        BinaryOperationInstruction.Operator operator = null;
        switch (op) {
            case TIMES: operator = BinaryOperationInstruction.Operator.MUL; break;
            case DIVIDE: operator = BinaryOperationInstruction.Operator.DIV; break;
            case MOD: operator = BinaryOperationInstruction.Operator.MOD; break;
            case ADD: operator = BinaryOperationInstruction.Operator.ADD; break;
            case SUB: operator = BinaryOperationInstruction.Operator.SUB; break;
            case LESH: operator = BinaryOperationInstruction.Operator.SHL; break;
            case RISH: operator = BinaryOperationInstruction.Operator.SHR; break;
            case BAND: operator = BinaryOperationInstruction.Operator.AND; break;
            case XOR: operator = BinaryOperationInstruction.Operator.XOR; break;
            case BOR: operator = BinaryOperationInstruction.Operator.OR; break;
            default: assert false; break;
        }
        VirtualRegister reg = new VirtualRegister(null);
        node.intValue = reg;
        curBasicBlock.append(new ArithmeticInstruction(curBasicBlock,reg,operator,lhs.intValue,rhs.intValue));
    }

    private void processIntRelationExpr(ExprOperator.Operator op,ExpressionNode node) {
        ExprNode lhs = node.getExprs().get(0),rhs = node.getExprs().get(1);
        visit(lhs); visit(rhs);
        BinaryOperationInstruction.Operator operator = null;
        switch (op) {
            case EQU: operator = BinaryOperationInstruction.Operator.EQU; break;
            case NEQ: operator = BinaryOperationInstruction.Operator.NEQ; break;
            case LESS: operator = BinaryOperationInstruction.Operator.LESS; break;
            case LEQ: operator = BinaryOperationInstruction.Operator.LEQ; break;
            case GRTR: operator = BinaryOperationInstruction.Operator.GRTR; break;
            case GEQ: operator = BinaryOperationInstruction.Operator.GEQ; break;
            default: assert false; break;
        }
        VirtualRegister reg = new VirtualRegister(null);
        curBasicBlock.append(new ComparisionInstruction(curBasicBlock,reg,operator,lhs.intValue,rhs.intValue));

        if (node.basicBlockTrue != null)
            curBasicBlock.end(new BranchInstruction(curBasicBlock,reg,node.basicBlockTrue,node.basicBlockFalse));
        else node.intValue = reg;
    }

    @Override
    public void visit(DefunNode node) {
        FunctionType functionType = null;
        if (className == null) {
            functionType = (FunctionType) globalSymbolTable.resolveType(node.getName());
            curFunction = new Function(functionType,null);
            irRoot.functions.put(node.getName(), curFunction);
        }
        else {
            functionType = (FunctionType) globalSymbolTable.resolveType(className + "." + node.getName());
            curFunction = new Function(functionType,new VirtualRegister(null));
            irRoot.functions.put(node.getName(), curFunction);
        }
        curBasicBlock = curFunction.startBasicBlock;
        isFunArg = true;
        node.getParameterList().forEach(param -> param.accept(this));
        isFunArg = false;

        visit(node.getBody());
        if (!curBasicBlock.isEnded()) {
            if (node.getReturnType().isVoid())
                curBasicBlock.end(new ReturnInstruction(curBasicBlock, null));
            else {
                curBasicBlock.end(new ReturnInstruction(curBasicBlock, new IntImmediate(0)));
                WarningInfo.add(node.location(), "The function doesn't have a return value.");
            }
        }

        // merge all return blocks to one block
        if (curFunction.retInstruction.size() > 1) {
            BasicBlock exitBasicBlock = new BasicBlock(curFunction, curFunction.getName() + ".exit");
            Register newRetVal = null;
            if (!node.getReturnType().isVoid())
                newRetVal = new VirtualRegister("returnValue");
            for (ReturnInstruction ret : curFunction.retInstruction) {
                BasicBlock basicBlock = ret.getBasicBlock();
                ret.remove();
                if (ret.getRetVal() != null)
                    basicBlock.append(new MoveInstruction(basicBlock, ret.getRetVal(), newRetVal));
                basicBlock.end(new JumpInstruction(basicBlock, exitBasicBlock));
            }
            curFunction.retInstruction.clear();
        } else curFunction.exitBasicBlock = curFunction.retInstruction.get(0).getBasicBlock();
        // remove unreachable block: to be completed
    }

    @Override
    public void visit(DefvarNode node) {
        SymbolInfo info = node.scope.getInfo(node.getName());
        if (node.scope == globalSymbolTable.globals) {
            StaticData data = new StaticSpace(node.getName(),info.getType().getRegisterSize());
            info.register = data; irRoot.dataList.add(data);
        }
        else {
            if (curBasicBlock.isEnded()) {
                WarningInfo.uselessStatement(node.location());
                return;
            }
            VirtualRegister reg = new VirtualRegister(node.getName());
            info.register = reg;
            if (isFunArg)
                curFunction.argVarRegList.add(reg);
            if (node.getInit() != null) {
                visit(node.getInit());
                assign(false,node.getInit().getVartype().getRegisterSize(),reg,0,node.getInit());
            }
            else if (!isFunArg)
                curBasicBlock.append(new MoveInstruction(curBasicBlock,new IntImmediate(0),reg));
        }
    }

    @Override
    public void visit(DefclassNode node) {
        className = node.getName();
        visit(node.getConstructor());
        node.getFunMembers().forEach(fun->fun.accept(this));
        className = null;
    }

    @Override
    public void visit(DefvarlistNode node) {
        if (node.scope != globalSymbolTable.globals) {
            if (curBasicBlock.isEnded()) {
                WarningInfo.uselessStatement(node.location());
                return;
            }
        }
        node.getVars().forEach(var->var.accept(this));
    }

    @Override
    public void visit(VartypeNode node) {
        // Do nothing here. Cannot reach here.
        assert false;
    }

    @Override
    public void visit(VartypePlusNode node) {
        node.getDims().forEach(dim->visit(dim));
    }

    @Override
    public void visit(IfStmtNode node) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }
        BasicBlock basicBlockTrue = new BasicBlock(curFunction,"if_true"),basicBlockFalse = null;
        BasicBlock basicBlockAfter = new BasicBlock(curFunction,"if_after");
        if (node.isHasElse())
            basicBlockFalse = new BasicBlock(curFunction,"if_false");
        node.getCond().basicBlockTrue = basicBlockTrue;
        if (node.isHasElse()) node.getCond().basicBlockFalse = basicBlockFalse;
        else node.getCond().basicBlockFalse = basicBlockAfter;
        visit(node.getCond());

        curBasicBlock = basicBlockTrue;
        visit(node.getBlock1());
        basicBlockTrue.end(new JumpInstruction(curBasicBlock,basicBlockAfter));

        if (node.isHasElse()) {
            curBasicBlock = basicBlockFalse;
            visit(node.getBlock2());
            basicBlockTrue.end(new JumpInstruction(curBasicBlock,basicBlockAfter));
        }

        curBasicBlock = basicBlockAfter;
    }

    @Override
    public void visit(WhileStmtNode node) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }
        BasicBlock basicBlockCond = new BasicBlock(curFunction,"while_cond");
        BasicBlock basicBlockLoop = new BasicBlock(curFunction,"while_loop");
        BasicBlock basicBlockAfter = new BasicBlock(curFunction,"while_after");

        BasicBlock oldLoopStepBlock = loopStepBlock;
        BasicBlock oldLoopAfterBlock = loopAfterBlock;
        loopStepBlock = basicBlockCond; loopAfterBlock = basicBlockAfter;

        curBasicBlock.end(new JumpInstruction(curBasicBlock,basicBlockCond));
        node.getCond().basicBlockTrue = basicBlockLoop;
        node.getCond().basicBlockFalse = basicBlockAfter;

        curBasicBlock = basicBlockCond;
        visit(node.getCond());

        curBasicBlock = basicBlockLoop;
        visit(node.getBlock());
        basicBlockLoop.end(new JumpInstruction(curBasicBlock,basicBlockCond));

        curBasicBlock = basicBlockAfter;
        loopStepBlock = oldLoopStepBlock; loopAfterBlock = oldLoopAfterBlock;
    }

    @Override
    public void visit(ForStmtNode node) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }
        if (node.getInit1() != null)
            visit(node.getInit1());
        else if (node.getInit2() != null)
            node.getInit2().forEach(x->x.accept(this));

        BasicBlock basicBlockCond = new BasicBlock(curFunction,"for_cond");
        BasicBlock basicBlockLoop = new BasicBlock(curFunction,"for_loop");
        BasicBlock basicBlockStep = new BasicBlock(curFunction,"for_step");
        BasicBlock basicBlockAfter = new BasicBlock(curFunction,"for_after");

        BasicBlock oldLoopStepBlock = loopStepBlock;
        BasicBlock oldLoopAfterBlock = loopAfterBlock;
        loopStepBlock = basicBlockCond; loopAfterBlock = basicBlockAfter;

        curBasicBlock.end(new JumpInstruction(curBasicBlock,basicBlockCond));
        curBasicBlock = basicBlockCond;
        if (node.getCond() != null) {
            visit(node.getCond());
            node.getCond().basicBlockTrue = basicBlockLoop;
            node.getCond().basicBlockFalse = basicBlockAfter;
        }

        curBasicBlock.end(new JumpInstruction(curBasicBlock,basicBlockLoop));
        curBasicBlock = basicBlockLoop;
        visit(node.getBlock());
        if (node.getStep() == null) curBasicBlock.end(new JumpInstruction(curBasicBlock,basicBlockCond));
        else {
            curBasicBlock.end(new JumpInstruction(curBasicBlock,basicBlockStep));
            curBasicBlock = basicBlockStep;
            node.getStep().forEach(step->step.accept(this));
            curBasicBlock.end(new JumpInstruction(curBasicBlock,basicBlockCond));
        }

        curBasicBlock = basicBlockAfter;
        loopStepBlock = oldLoopStepBlock; loopAfterBlock = oldLoopAfterBlock;
    }

    @Override
    public void visit(ContinueStmtNode node) {
        curBasicBlock.end(new JumpInstruction(curBasicBlock,loopStepBlock));
    }

    @Override
    public void visit(BreakStmtNode node) {
        curBasicBlock.end(new JumpInstruction(curBasicBlock,loopAfterBlock));
    }

    @Override
    public void visit(ReturnStmtNode node) {
        if (node.getExpr() == null)
            curBasicBlock.end(new ReturnInstruction(curBasicBlock,null));
        else {
            visit(node.getExpr());
            curBasicBlock.end(new ReturnInstruction(curBasicBlock,node.getExpr().intValue));
        }
    }

    @Override
    public void visit(BlankStmtNode node) {
        // Do nothing here.
    }

    @Override
    public void visit(BlockNode node) {
        node.getStmts().forEach(stmt->stmt.accept(this));
    }

    @Override
    public void visit(IdentifierNode node) {
        SymbolInfo info = node.scope.getInfo(node.getName());
        info.used = true;
        node.intValue = info.register;
    }

    @Override
    public void visit(StringliteralNode node) {
        StaticString staticString = irRoot.stringPool.get(node.getVal());
        if (staticString == null) {
            staticString = new StaticString(node.getVal());
            irRoot.stringPool.put(node.getVal(),staticString);
        }
        node.intValue = staticString;
    }

    @Override
    public void visit(IntegerliteralNode node) {
        node.intValue = new IntImmediate(node.getVal());
    }

    @Override
    public void visit(BooleanliteralNode node) {
        node.intValue = new IntImmediate(node.getVal()?1:0);
    }

    @Override
    public void visit(NullNode node) {
        node.intValue = new IntImmediate(0);
    }

    @Override
    public void visit(VariableNode node) {
        if (node.isThis()) {
            // To be completed here.
        }
        else if (node.getVar() == null && node.getId() != null && node.getExpr() == null) {
            visit(node.getId());
            node.intValue = node.getId().intValue;
        }
        else if (node.getVar() != null && node.getId() == null && node.getExpr() == null) {
            visit(node.getId());
            node.intValue = node.getId().intValue;
        }
        else if (node.getVar() != null && node.getId() != null && node.getExpr() == null) { // Member Access
        }
        else if (node.getVar() != null && node.getId() == null && node.getExpr() != null) // Array Access
            processArrayAccess(node,node.getVar(),node.getExpr());
        else assert false;
    }

    @Override
    public void visit(CallfunNode node) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }
        FunctionType functionType = (FunctionType)globalSymbolTable.resolveType(node.getName());
        if (globalSymbolTable.isBuiltinMethod(functionType)) {
            // BuiltinMethod
        }
        else {
            Function function = irRoot.functions.get(node.getName());
            node.getParams().forEach(param->param.accept(this));
            VirtualRegister reg = new VirtualRegister(null);
            CallInstruction callFun = new CallInstruction(curBasicBlock,reg,function);
            node.getParams().forEach(param->callFun.appendArgReg(param.intValue));
            curBasicBlock.append(callFun);
            node.intValue = reg;
        }
    }

    @Override
    public void visit(AssignmentNode node) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }

        ExpressionNode lhs = node.getVariable(),rhs = node.getExpr();
        visit(rhs);

        boolean oldNeedAddr = needAddr,isMemOp = needMemoryAccess(lhs);
        needAddr = isMemOp;
        visit(lhs);
        needAddr = oldNeedAddr;

        IntValue addr = isMemOp?lhs.address:lhs.intValue;
        int offset = isMemOp?lhs.offset:0;
        assign(isMemOp,rhs.getVartype().getRegisterSize(),addr,offset,rhs);
    }

    @Override
    public void visit(ExpressionNode node) {
        if (curBasicBlock.isEnded()) {
            WarningInfo.uselessStatement(node.location());
            return;
        }
        ExprOperator.Operator op = node.getOp().getOp();
        if (op == ExprOperator.Operator.SELF) {
            node.getExprs().get(0).basicBlockFalse = node.basicBlockFalse;
            node.getExprs().get(0).basicBlockTrue = node.basicBlockTrue;
            visit(node.getExprs().get(0));
            node.intValue = node.getExprs().get(0).intValue;
        }
        else if (op == ExprOperator.Operator.MEM) {
            ExprNode record = node.getExprs().get(0),member = node.getExprs().get(1);
            boolean oldNeedAddr = needAddr;
            needAddr = false;
            visit(record);
            needAddr = oldNeedAddr;

            if (member instanceof IdentifierNode) {
                IntValue address = record.intValue;
                int offset = globalSymbolTable.getOffset(
                        node.getVartype().getName() + "." + ((IdentifierNode) member).getName()
                );
                VartypeNode type = globalSymbolTable.resolveType(
                        node.getVartype().getName() + "." + ((IdentifierNode) member).getName()
                );
                if (member instanceof IdentifierNode) {
                    node.address = address;
                    node.offset = offset;
                } else {
                    VirtualRegister reg = new VirtualRegister(null);
                    node.intValue = reg;
                    curBasicBlock.append(new LoadInstruction(
                            curBasicBlock, reg, type.getRegisterSize(), address, offset));
                    if (node.basicBlockTrue != null)
                        curBasicBlock.end(
                                new BranchInstruction(
                                        curBasicBlock, reg, node.basicBlockTrue, node.basicBlockFalse
                                )
                        );
                }
            }
            else { //调用类内部的函数
                FunctionType functionType = (FunctionType) globalSymbolTable.resolveType(
                        node.getVartype().getName()+"."+((CallfunNode)member).getName()
                );
                Function function = irRoot.functions.get(functionType.getName());
                if (globalSymbolTable.isBuiltinMethod(functionType))
                ((CallfunNode)member).getParams().forEach(param->param.accept(this));
                VirtualRegister reg = new VirtualRegister(null);
                CallInstruction callFun = new CallInstruction(curBasicBlock,reg,function);
                ((CallfunNode)member).getParams().forEach(param->callFun.appendArgReg(param.intValue));
                curBasicBlock.append(callFun);
                node.intValue = reg;
            }
        }
        else if (op == ExprOperator.Operator.ARRAY)
            processArrayAccess(node,node.getExprs().get(0),node.getExprs().get(1));
        else if (op == ExprOperator.Operator.SINC||op == ExprOperator.Operator.SDEC
                ||op == ExprOperator.Operator.PINC ||op == ExprOperator.Operator.PDEC)
            processSelfIncOrDec(node);
        else if (op == ExprOperator.Operator.NEG||op == ExprOperator.Operator.COMP) {
            VirtualRegister reg = new VirtualRegister(null);
            UnaryOperationInstruction.Operator operator = UnaryOperationInstruction.Operator.NEG;
            if (op == ExprOperator.Operator.COMP)
                operator = UnaryOperationInstruction.Operator.COMP;
            curBasicBlock.append(
                    new UnaryOperationInstruction(
                            curBasicBlock,reg,operator,node.getExprs().get(0).intValue
                    )
            );
            node.intValue = reg;
        }
        else if (op == ExprOperator.Operator.NOT) {
            visit(node.getExprs().get(0));
            node.basicBlockFalse = node.getExprs().get(0).basicBlockTrue;
            node.basicBlockFalse = node.getExprs().get(0).basicBlockFalse;
        }
        else if (op == ExprOperator.Operator.NEW)
            processNewExpr(node);
        if (op == ExprOperator.Operator.EQU||op == ExprOperator.Operator.NEQ
                ||op == ExprOperator.Operator.LESS||op == ExprOperator.Operator.LEQ
                ||op == ExprOperator.Operator.GRTR||op == ExprOperator.Operator.GEQ) {
            ExprNode lhs = node.getExprs().get(0),rhs = node.getExprs().get(1);
            if (lhs.getType().isString())
                processStrOperation(op,node);
            else processIntArithmeticExpr(op,node);
        }
        else if (op == ExprOperator.Operator.TIMES||op == ExprOperator.Operator.DIVIDE||op == ExprOperator.Operator.MOD
                ||op == ExprOperator.Operator.ADD||op == ExprOperator.Operator.SUB
                ||op == ExprOperator.Operator.LESH||op == ExprOperator.Operator.RISH
                ||op == ExprOperator.Operator.BAND||op == ExprOperator.Operator.XOR||op == ExprOperator.Operator.BOR) {
            ExprNode lhs = node.getExprs().get(0),rhs = node.getExprs().get(1);
            if (lhs.getType().isString())
                processStrOperation(op,node);
            else processIntArithmeticExpr(op,node);
        }
        else if (op == ExprOperator.Operator.LAND) {
            ExprNode lhs = node.getExprs().get(0),rhs = node.getExprs().get(1);
            lhs.basicBlockTrue = new BasicBlock(curFunction,"lhs_true");
            lhs.basicBlockFalse = node.basicBlockFalse;
            visit(lhs);
            curBasicBlock = lhs.basicBlockTrue;

            rhs.basicBlockTrue = node.basicBlockTrue;
            rhs.basicBlockFalse = node.basicBlockFalse;
            visit(rhs);
        }
        else if (op == ExprOperator.Operator.LOR) {
            ExprNode lhs = node.getExprs().get(0),rhs = node.getExprs().get(1);
            lhs.basicBlockTrue = node.basicBlockTrue;
            lhs.basicBlockFalse = new BasicBlock(curFunction,"lhs_false");
            visit(lhs);
            curBasicBlock = lhs.basicBlockFalse;

            rhs.basicBlockTrue = node.basicBlockTrue;
            rhs.basicBlockFalse = node.basicBlockFalse;
            visit(rhs);
        }
        else if (op == TRN) {
            ExprNode cond = node.getExprs().get(0),lhs = node.getExprs().get(1),rhs = node.getExprs().get(2);
            BasicBlock basicBlockTrue = new BasicBlock(curFunction,"ternary_true");
            BasicBlock basicBlockFalse = new BasicBlock(curFunction,"ternary_false");
            BasicBlock merge = new BasicBlock(curFunction,"ternary_merge");

            cond.basicBlockTrue = basicBlockTrue;
            cond.basicBlockFalse = basicBlockFalse;
            visit(cond);

            boolean oldNeedAddr = needAddr;
            needAddr = false;
            VirtualRegister reg = new VirtualRegister(null);

            curBasicBlock = basicBlockTrue;
            visit(lhs);basicBlockTrue.append(new MoveInstruction(basicBlockTrue,lhs.intValue,reg));
            basicBlockTrue.end(new JumpInstruction(basicBlockTrue,merge));

            curBasicBlock = basicBlockFalse;
            visit(rhs);
            basicBlockFalse.append(new MoveInstruction(basicBlockFalse,rhs.intValue,reg));
            basicBlockFalse.end(new JumpInstruction(basicBlockFalse,merge));

            needAddr = oldNeedAddr;

            node.intValue = reg;
            curBasicBlock = merge;
            if (node.basicBlockTrue != null)
                curBasicBlock.end(new BranchInstruction(curBasicBlock,reg,node.basicBlockTrue,node.basicBlockFalse));
        }
    }

    @Override
    public void visit(ProgNode node) {
        node.getDefs().forEach(def -> def.accept(this));
        // To be completed here.
    }

    public void visit(Node node) {
        node.accept(this);
    }
    public void visit(StmtNode node) {
        node.accept(this);
    }
    public void visit(ExprNode node) {
        node.accept(this);
    }
}
