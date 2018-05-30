package com.lmxyy.mxcompiler.ir;


public interface IRVisitor {
    void visit(IRRoot node);
    void visit(BasicBlock node);
    void visit(Function node);

    void visit(ArithmeticInstruction node);
    void visit(UnaryOperationInstruction node);
    void visit(ComparisionInstruction node);
    void visit(CallInstruction node);
    void visit(BranchInstruction node);
    void visit(HeapAllocateInstruction node);
    void visit(JumpInstruction node);
    void visit(LoadInstruction node);
    void visit(MoveInstruction node);
    void visit(StoreInstruction node);
    void visit(ReturnInstruction node);
    void visit(TwoAddressInstruction node);
    void visit(PushInstruction node);
    void visit(PopInstruction node);
    void visit(LeaveInstruction node);

    void visit(VirtualRegister node);
    void visit(PhysicalRegister node);
    void visit(StaticSpace node);
    void visit(StaticString node);
    void visit(IntImmediate node);
    void visit(StackSlot node);
}
