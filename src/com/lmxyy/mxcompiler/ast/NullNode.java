package com.lmxyy.mxcompiler.ast;

public class NullNode extends LiteralNode {
    private Location location;

    public void setLocation(Location _location) {
        location = _location;
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
