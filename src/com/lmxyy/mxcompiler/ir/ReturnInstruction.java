package com.lmxyy.mxcompiler.ir;

import java.util.Map;

public class ReturnInstruction extends EndInstruction {
    private IntValue retVal;

    public ReturnInstruction(BasicBlock _curBasicBlock,IntValue _retVal) {
        super(_curBasicBlock);
        retVal = _retVal;
    }

    public IntValue getRetVal() {
        return retVal;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    protected void reloadUsedRegisterCollection() {
        usedRegister.clear();
        if (retVal instanceof Register) usedRegister.add((Register) retVal);
        usedIntValue.clear();
        usedIntValue.add(retVal);
    }

    @Override
    public void setDefinedRegister(Register newReg) {
    }

    @Override
    public void setUsedRegister(Map<Register, Register> regMap) {
        if (retVal instanceof Register) retVal = regMap.get(retVal);
        reloadUsedRegisterCollection();
    }

    @Override
    public Register getDefinedRegister() {
        return null;
    }

    @Override
    public void replaceIntValueUse(IntValue oldValue,IntValue newValue) {
        if (retVal == oldValue) retVal = newValue;
        reloadUsedRegisterCollection();
    }
}
