package com.lmxyy.mxcompiler.ast;

public class WhileStmtNode extends StmtNode {
    private ExpressionNode cond;
    private StmtNode block;

    public WhileStmtNode(ExpressionNode _cond,StmtNode _block) {
        cond = _cond;
        block = _block;
    }

    public ExpressionNode getCond() {
        return cond;
    }
    public StmtNode getBlock() {
        return block;
    }

    @Override
    public Location location() {
        return cond.location();
    }
    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
