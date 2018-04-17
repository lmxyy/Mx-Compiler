package com.lmxyy.mxcompiler.ast;

import java.util.List;

public class BlockNode extends StmtNode {
    private List<StmtNode> stmts;
    private Location location;

    public BlockNode(List<StmtNode> _stmts) {
        stmts = _stmts;
    }
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
