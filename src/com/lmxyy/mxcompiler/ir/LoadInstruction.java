package com.lmxyy.mxcompiler.ir;

import java.util.Map;

public class LoadInstruction extends IRInstruction {
    private Register dest;
    private int size;
    private IntValue addr;
    private int offset;
    private boolean isStaticData,isLoadAddress;

    public LoadInstruction(BasicBlock _basicBlock,Register _dest,int _size,IntValue _addr,int _offset) {
        super(_basicBlock);
        dest = _dest;
        size = _size;
        addr = _addr;
        offset = _offset;
        isStaticData = false;
        isLoadAddress = false;
    }
    public LoadInstruction(BasicBlock _basicBlock,Register _dest,int _size,StaticData _addr,boolean _isLoadAddress) {
        this(_basicBlock,_dest,_size,_addr,0);
        isLoadAddress = _isLoadAddress;
        isStaticData = true;
    }

    public Register getDest() {
        return dest;
    }

    public int getSize() {
        return size;
    }

    public IntValue getAddr() {
        return addr;
    }
    public int getOffset() {
        return offset;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    protected void reloadUsedRegisterCollection() {
        usedRegister.clear();
        if (addr instanceof Register) usedRegister.add((Register) dest);
        usedIntValue.clear();
        usedIntValue.add(addr);
    }

    @Override
    public void setDefinedRegister(Register newReg) {
        dest = newReg;
    }

    @Override
    public void setUsedRegister(Map<Register, Register> regMap) {
        if (addr instanceof Register) addr = regMap.get(addr);
        reloadUsedRegisterCollection();
    }

    @Override
    public Register getDefinedRegister() {
        return dest;
    }

    @Override
    public void replaceIntValueUse(IntValue oldValue,IntValue newValue) {
        if (addr == oldValue) addr = newValue;
        reloadUsedRegisterCollection();
    }
}
