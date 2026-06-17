import java_cup.runtime.Symbol;

%%

%class Scanner
%cupsym sym
%cup
%unicode
%line
%column
%public

%{
private ListaErros listaErros;

public Scanner(java.io.FileReader in, ListaErros listaErros) {
    this(in);
    this.listaErros = listaErros;
}

public ListaErros getListaErros() {
    return listaErros;
}

public void defineErro(int linha, int coluna, String texto) {
    listaErros.defineErro(linha, coluna, texto);
}

private Symbol criaSimbolo(int code, Object value) {
    return new Symbol(code, yyline, yycolumn, value);
}

private Symbol criaSimbolo(int code) {
    return new Symbol(code, yyline, yycolumn, null);
}
%}

digito = [0-9]
letra = [a-zA-Z]
digitos = [0-9]+
Ident = {letra}({letra}|{digito})*

fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [ \t\f]

%%

"program" { return criaSimbolo(sym.KW_PROGRAM); }
"if"      { return criaSimbolo(sym.KW_IF); }
"else"    { return criaSimbolo(sym.KW_ELSE); }
"while"   { return criaSimbolo(sym.KW_WHILE); }

">=" { return criaSimbolo(sym.MAIORIGUAL); }
"<=" { return criaSimbolo(sym.MENORIGUAL); }
"==" { return criaSimbolo(sym.IGUALIGUAL); }
"!=" { return criaSimbolo(sym.DIF); }
">"  { return criaSimbolo(sym.MAIOR); }
"<"  { return criaSimbolo(sym.MENOR); }

{digitos} {
    double aux = Double.parseDouble(yytext());
    return criaSimbolo(sym.NUMBER, Double.valueOf(aux));
}

"+" { return criaSimbolo(sym.MAIS); }
"-" { return criaSimbolo(sym.MENOS); }
"/" { return criaSimbolo(sym.DIV); }
"*" { return criaSimbolo(sym.MULT); }
"%" { return criaSimbolo(sym.MOD); }

";" { return criaSimbolo(sym.PTVIRG); }

"(" { return criaSimbolo(sym.ABRE_PARENT); }
")" { return criaSimbolo(sym.FECHA_PARENT); }

"{" { return criaSimbolo(sym.ABRE_CHAVE); }
"}" { return criaSimbolo(sym.FECHA_CHAVE); }

"[" { return criaSimbolo(sym.ABRE_COLCH); }
"]" { return criaSimbolo(sym.FECHA_COLCH); }

"." { return criaSimbolo(sym.PTO); }
"," { return criaSimbolo(sym.VIRG); }

"=" { return criaSimbolo(sym.IGUAL); }

{Ident} {
    return criaSimbolo(sym.IDENT, yytext());
}

{espaco} {
    /* ignora espaços e quebras de linha */
}

[^] {
    defineErro(yyline, yycolumn, "Caractere inválido: " + yytext());
}