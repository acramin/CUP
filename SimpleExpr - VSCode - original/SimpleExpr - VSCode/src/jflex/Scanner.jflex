// Arquivo para o scanner a ser utilizado
package parser;
// Importar classes do cup - classe Symbol
import java_cup.runtime.*;

%%

%class Scanner
%cup
%unicode
%line
%column

%{
    // type é a classe do token
    // yyline e yycolumn são variáveis reservadas
    // do JFlex para armazenar a linha e a coluna
    // de um token encontrado na entrada (precisa
    //  usar %line e %column)
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

Id = [a-zA-Z_][a-zA-Z0-9_]*
ws = [\ \t\f\r\n]
number = [0-9]+(\.\d+)?([eE][+-]?\d+)? 

%%
"**"        { return symbol(sym.POW); }
"print"     { return symbol(sym.PRINT); }
"sin"       { return symbol(sym.SIN); }
"cos"       { return symbol(sym.COS); }
"PI"        { return symbol(sym.PI); }
";"         { return symbol(sym.SEMI); }
"+"         { return symbol(sym.PLUS); }
"-"         { return symbol(sym.MINUS); }
"*"         { return symbol(sym.TIMES); }
"/"         { return symbol(sym.DIVIDE); }
"%"         { return symbol(sym.MOD); }
"("         { return symbol(sym.LPAREN); }
")"         { return symbol(sym.RPAREN); }
"="         { return symbol(sym.EQUALS); }
{number}    { return symbol(sym.NUMBER, Double.valueOf(yytext())); }
{ws}        {/* Ignore */}
{Id}        { return symbol(sym.ID, yytext()); }
.           { throw new Error("Simbolo inválido detectado: \"" + yycharat(0) +
                "\" ( linha: " +  yyline + ", coluna: " + yycolumn + ")"); }


