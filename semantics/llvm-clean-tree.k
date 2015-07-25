// Copyright (c) 2013-2015 K Team. All Rights Reserved.
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"
requires "llvm-standard-library-syntax.k"
requires "llvm-syscalls-syntax.k"
requires "llvm-configuration.k"

/* this module contains rules for cleaning up the AST */
module LLVM-CLEAN-TREE
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS
    imports LLVM-STANDARD-LIBRARY-SYNTAX
    imports LLVM-SYSCALLS-SYNTAX
    imports LLVM-CONFIGURATION

    rule <k> operand(Type:KResult, I:Int) => signed(Type, I) ...</k>
        when isIntegerType(Type)
    rule <k> operand(Type:KResult, V:KResult) => V ...</k>
        when notBool isIntegerType(Type)
/*
    // rule <k> Operand(Type:KResult, V:KResult) => V ...</k>

    rule GlobalVariables(L:KList) => KListToK(L)  [anywhere]
    rule Functions(L:KList) => KListToK(L)        [anywhere]
    rule Typedefs(L:KList) => KListToK(L)         [anywhere]
    rule <k> Aliases(L:KList) => KListToK(L) ...</k>
    //rule Body(L:KList) => KListToK(L)
    rule Instructions(L:KList) => KListToK(L)     [anywhere]
    rule ModuleID(S:String) => name(S)               [anywhere]
    rule values(K:K) => K                              [anywhere]
    rule Br(K:K) => K:K                               [anywhere]
    rule ReturnType(K:K) => K [anywhere]
*/


    rule
        <k> instruction(K:K, modifiers(L:Element), insMetas(L':Element)) => K ...</k>
        <currentModifiers> _ => L </currentModifiers>
        <currentMetadatas> _ => L' </currentMetadatas>
/*
    rule
        <k> Instruction(Modifiers(L:KList), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>

    rule
        <k> ConstantExpr(Modifiers(L:KList), K:K) => K ...</k>
        <currentModifiers> _ => List(L) </currentModifiers>
*/
endmodule