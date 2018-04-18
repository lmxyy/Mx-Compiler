package com.lmxyy.mxcompiler.ast;

public class StringliteralNode extends ExprNode {
    private String val;
    private Location location;

    public StringliteralNode(String _val) {
        val = _val;
    }
    public void setLocation(Location _location) {
        location = _location;
    }

    public String getVal() {
        return val;
    }

    @Override
    public Location location() {
        return location;
    }
    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this);
    }
}
