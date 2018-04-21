package com.lmxyy.mxcompiler.symbol;

public class Type {
    public enum Types {
        VOID,INT,BOOL,STRING,NULL,CLASS
    }
    private Types type;
    private boolean isFun;
    private int dimension;

    public Type(Types _type,boolean _isFun,int _dimension) {
        type = _type;
        isFun = _isFun;
        dimension = _dimension;
    }
    public Types getType() {
        return type;
    }
    public boolean isFun() {
        return isFun;
    }
    public int getDimension() {
        return dimension;
    }
}
