package com.lmxyy.mxcompiler.ir;

public abstract class IntValue {
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
