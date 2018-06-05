package com.lmxyy.mxcompiler.ir;

import com.lmxyy.mxcompiler.ast.VartypeNode;
import com.lmxyy.mxcompiler.nasm.NASMRegisterSet;
import com.lmxyy.mxcompiler.symbol.FunctionType;
import com.lmxyy.mxcompiler.symbol.GlobalSymbolTable;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class IRRoot {
    public Map<String,Function> functions = new LinkedHashMap<>();
    public List<StaticData> dataList = new ArrayList<>();
    public Map<String,StaticString> stringPool = new LinkedHashMap<>();
    public static List<Function> builtinFunctions = new ArrayList<>();

    public IRRoot() {
        builtinFunctions.add(stringSubString);
        stringSubString.setCallName("_Z15stringSubStringPcii");
        builtinFunctions.add(stringParseInt);
        stringParseInt.setCallName("_Z14stringParseIntPc");
        builtinFunctions.add(stringConcat);
        stringConcat.setCallName("_Z12stringConcatPcS_");
        builtinFunctions.add(stringEqual);
        stringEqual.setCallName("_Z9stringEquPcS_");
        builtinFunctions.add(stringLess);
        stringLess.setCallName("_Z10stringLessPcS_");
        builtinFunctions.add(stringLeq);
        stringLeq.setCallName("_Z9stringLeqPcS_");
        builtinFunctions.add(stringOrd);
        stringOrd.setCallName("_Z9stringOrdPci");


        builtinFunctions.add(funcPrintln);
        funcPrintln.setCallName("_Z7printlnPc");
        builtinFunctions.add(funcPrint);
        funcPrint.setCallName("_Z5printPc");
        builtinFunctions.add(funcPrintlnInt);
        funcPrintlnInt.setCallName("_Z10printlnInti");
        builtinFunctions.add(funcPrintInt);
        funcPrintInt.setCallName("_Z8printInti");
        builtinFunctions.add(funcGetString);
        funcGetString.setCallName("_Z9getStringv");
        builtinFunctions.add(funcGetInt);
        funcGetInt.setCallName("_Z6getIntv");
        builtinFunctions.add(funcToString);
        funcToString.setCallName("_Z8toStringi");
        builtinFunctions.forEach(func->func.usedPhysicalGeneralRegister.addAll(NASMRegisterSet.all));
        builtinFunctions.add(funcMalloc);
    }

    public static Function stringSubString = new Function(GlobalSymbolTable.stringSubString);
    public static Function stringParseInt = new Function(GlobalSymbolTable.stringParseInt);
    public static Function stringConcat = new Function(new FunctionType(
            GlobalSymbolTable.stringType,
            "string.concat",
            new ArrayList<VartypeNode>() {{
                add(GlobalSymbolTable.stringType);
                add(GlobalSymbolTable.stringType);
            }},
            new ArrayList<String>() {{
                add("arg0");
                add("arg1");
            }})
    );
    public static Function stringEqual = new Function(new FunctionType(
            GlobalSymbolTable.stringType,
            "string.equal",
            new ArrayList<VartypeNode>() {{
                add(GlobalSymbolTable.stringType);
                add(GlobalSymbolTable.stringType);
            }},
            new ArrayList<String>() {{
                add("arg0");
                add("arg1");
            }})
    );
    public static Function stringLess = new Function(new FunctionType(
            GlobalSymbolTable.stringType,
            "string.less",
            new ArrayList<VartypeNode>() {{
                add(GlobalSymbolTable.stringType);
                add(GlobalSymbolTable.stringType);
            }},
            new ArrayList<String>() {{
                add("arg0");
                add("arg1");
            }})
    );
    public static Function stringLeq= new Function(new FunctionType(
            GlobalSymbolTable.stringType,
            "string.leq",
            new ArrayList<VartypeNode>() {{
                add(GlobalSymbolTable.stringType);
                add(GlobalSymbolTable.stringType);
            }},
            new ArrayList<String>() {{
                add("arg0");
                add("arg1");
            }})
    );
    public static Function stringOrd = new Function(GlobalSymbolTable.stringOrd);


    public static Function funcPrintln = new Function(GlobalSymbolTable.funcPrintln);
    public static Function funcPrint = new Function(GlobalSymbolTable.funcPrint);
    public static Function funcPrintlnInt = new Function(new FunctionType(
            GlobalSymbolTable.voidType,
            "printlnint",
            new ArrayList<VartypeNode>() {{
                add(GlobalSymbolTable.intType);
            }},
            new ArrayList<String>() {{
                add("arg0");
            }})
    );
    public static Function funcPrintInt = new Function(new FunctionType(
            GlobalSymbolTable.voidType,
            "printint",
            new ArrayList<VartypeNode>() {{
                add(GlobalSymbolTable.intType);
            }},
            new ArrayList<String>() {{
                add("arg0");
            }})
    );
    public static Function funcGetString = new Function(GlobalSymbolTable.funcGetString);
    public static Function funcGetInt = new Function(GlobalSymbolTable.funcGetInt);
    public static Function funcToString = new Function(GlobalSymbolTable.funcToString);
    public static Function funcMalloc = new Function(null);


    public List<Function> getBuiltinFunctions() {
        return builtinFunctions;
    }

    public static boolean isBuiltinFunction(Function function) {
        return builtinFunctions.contains(function);
    }

    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
