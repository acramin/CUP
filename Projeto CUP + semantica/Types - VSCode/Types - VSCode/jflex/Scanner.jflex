/* JFlex Scanner for CUP example. */
package parser;
import java_cup.runtime.*;
%%
%class Scanner
%cup
%unicode
%line
%column
%{
    private Symbol symbol(int tag) {
        return new Symbol(tag, yyline, yycolumn);
    }
    private Symbol symbol(int tag, Object value) {
        return new Symbol(tag, yyline, yycolumn, value);
    }
%}

ws = [ \t\f\r\n]
letter = [A-Za-z]
digit = [0-9]
id = {letter}({letter}|{digit}|"_")*

%%

"int"       { return symbol(sym.INT, 0); }
"float"     { return symbol(sym.FLOAT, 1); }
{id}        { return symbol(sym.ID, new Identifier(yytext()) ); }
","         { return symbol(sym.COMMA); }
";"         { return symbol(sym.SEMI); }
{ws}        { /* ignore */ }
.           { throw new Error("Símbolo ilegal: \"" + yycharat(0) + "\" em (" +
                 yyline + "," + yycolumn +")" ); }
