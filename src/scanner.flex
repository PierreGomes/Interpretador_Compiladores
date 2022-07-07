import java_cup.runtime.Symbol;

/*
Directivas:
public: classe publica
cup: compatibilidade com cup
full: estende o alfabeto com todos os valores de 8 bits
linha: adicionar a variável int yyline, para indicar a linha do lexema
char: adicionar a variável int yychar, para indicar o índice do primeiro caractere do lexema
ignorecase: validar, independentemente de a letra ser maiúscula ou minúscula
eofval: especifica um valor de retorno no final do arquivo
*/

%%

%class Scanner
%cup
%full
%line
%char
%ignorecase
%eofval{
	return new Symbol(Tokens.EOF,new String("Fim do arquivo"));
%eofval}

digito = [0-9]
letra = [a-zA-Z]
id = {letra}({letra}|{digito}|"_")*
espaco = \t|\f|" "|\r|\n
mais = ["qual"]
%%

";"			{return new Symbol(Tokens.SEMI, yytext());}
"=="		{return new Symbol(Tokens.IGUAL, yytext());}
"!="		{return new Symbol(Tokens.DIFERENTE, yytext());}
"="			{return new Symbol(Tokens.ATRIB, yytext());}
"-"			{return new Symbol(Tokens.MENOS, yytext());}
"+"			{return new Symbol(Tokens.MAIS, yytext());}
"*"			{return new Symbol(Tokens.VEZES, yytext());}
"/"			{return new Symbol(Tokens.DIVIDIDO, yytext());}
"("			{return new Symbol(Tokens.LPAREN, yytext());}
")"			{return new Symbol(Tokens.RPAREN, yytext());}
"{"			{return new Symbol(Tokens.LCOL, yytext());}
"}"			{return new Symbol(Tokens.RCOL, yytext());}
"["			{return new Symbol(Tokens.LSER, yytext());}
"]"			{return new Symbol(Tokens.RSER, yytext());}
","         {return new Symbol(Tokens.VIRGULA, yytext());}
"\n"        {return new Symbol(Tokens.LINHA, yytext());}
// mais      {System.out.println("DEBUG:" + yytext());return new Symbol(Tokens.QUAL, yytext());}

{id}		{

       String Identificador = yytext();

    // Debug
    // System.out.println("Identificador interpretado = \""+ Identificador +"\"");

    switch(Identificador){
        // Comandos first letter upper case
        case "Resolva"  -> {return new Symbol(Tokens.RESOLVA,   Identificador);}
        case "Guarde"   -> {return new Symbol(Tokens.GUARDE,   Identificador);}
        case "Escreva"  -> {return new Symbol(Tokens.ESCREVA,   Identificador);}
        // Comandos lower case
        case "resolva"  -> {return new Symbol(Tokens.RESOLVA,   Identificador);}
        case "guarde"   -> {return new Symbol(Tokens.GUARDE,   Identificador);}
        case "escreva"  -> {return new Symbol(Tokens.ESCREVA,   Identificador);}

        // Condicionais
        case "se"       -> {return new Symbol(Tokens.SE,        Identificador);}
        case "Se"       -> {return new Symbol(Tokens.SE,        Identificador);}
        case "entao"    -> {return new Symbol(Tokens.ENTAO,        Identificador);}
        case "senao"    -> {return new Symbol(Tokens.SENAO,        Identificador);}


        // Interrogações
        case "Qual"     -> {return new Symbol(Tokens.QUAL,      Identificador);}
        case "qual"     -> {return new Symbol(Tokens.QUAL,      Identificador);}
        case "Quanto"   -> {return new Symbol(Tokens.QUANTO,      Identificador);}
        case "quanto"   -> {return new Symbol(Tokens.QUANTO,      Identificador);}


        // Complementos upper case
        case "Eh"       -> {return new Symbol(Tokens.EH,        Identificador);}
        case "O"        -> {return new Symbol(Tokens.O,         Identificador);}
        case "Do"       -> {return new Symbol(Tokens.DO,        Identificador);}
        case "Da"       -> {return new Symbol(Tokens.DA,        Identificador);}
        case "De"       -> {return new Symbol(Tokens.DE,        Identificador);}
        case "Em"       -> {return new Symbol(Tokens.EM,        Identificador);}

        // Complementos lower case
        case "eh"       -> {return new Symbol(Tokens.EH,            Identificador);}
        case "o"        -> {return new Symbol(Tokens.O,             Identificador);}
        case "a"        -> {return new Symbol(Tokens.A,             Identificador);}
        case "do"       -> {return new Symbol(Tokens.DO,            Identificador);}
        case "da"       -> {return new Symbol(Tokens.DA,            Identificador);}
        case "de"       -> {return new Symbol(Tokens.DE,            Identificador);}
        case "em"       -> {return new Symbol(Tokens.EM,        Identificador);}

        // Fracionadores upper case
        case "Dobro"    -> {return new Symbol(Tokens.DOBRO,         Identificador);}
        case "Triplo"   -> {return new Symbol(Tokens.TRIPLO,        Identificador);}
        case "Metade"   -> {return new Symbol(Tokens.METADE,        Identificador);}
        // Fracionadores lower case
        case "dobro"    -> {return new Symbol(Tokens.DOBRO,         Identificador);}
        case "triplo"   -> {return new Symbol(Tokens.TRIPLO,        Identificador);}
        case "metade"   -> {return new Symbol(Tokens.METADE,        Identificador);}


        // Ordinarios upper case
        case "Primeiro" -> {return new Symbol(Tokens.PRIMEIRO,      Identificador);}
        case "Segundo"  -> {return new Symbol(Tokens.SEGUNDO,       Identificador);}
        case "Terceiro" -> {return new Symbol(Tokens.TERCEIRO,      Identificador);}
        // Ordinarios lower case
        case "primeiro" -> {return new Symbol(Tokens.PRIMEIRO,      Identificador);}
        case "segundo"  -> {return new Symbol(Tokens.SEGUNDO,       Identificador);}
        case "terceiro" -> {return new Symbol(Tokens.TERCEIRO,      Identificador);}


        // Listas e Elementos
        case "Elemento" -> {return new Symbol(Tokens.ELEMENTO,      Identificador);}
        case "elemento" -> {return new Symbol(Tokens.ELEMENTO,      Identificador);}
        case "Serie"    -> {return new Symbol(Tokens.SERIE,         Identificador);}
        case "serie"    -> {return new Symbol(Tokens.SERIE,         Identificador);}
        case "Valor"    -> {return new Symbol(Tokens.VALOR,         Identificador);}
        case "valor"    -> {return new Symbol(Tokens.VALOR,         Identificador);}


        // Operadores Escritos lower case
        case "Mais"        -> {return new Symbol(Tokens.MAIS,       Identificador);}
        case "Menos"       -> {return new Symbol(Tokens.MENOS,      Identificador);}
        case "Vezes"       -> {return new Symbol(Tokens.VEZES,      Identificador);}
        case "Dividido"    -> {return new Symbol(Tokens.DIVIDIDO,   Identificador);}
        // Operadores Escritos lower case
        case "mais"        -> {return new Symbol(Tokens.MAIS,       Identificador);}
        case "menos"       -> {return new Symbol(Tokens.MENOS,      Identificador);}
        case "vezes"       -> {return new Symbol(Tokens.VEZES,      Identificador);}
        case "dividido"    -> {return new Symbol(Tokens.DIVIDIDO,   Identificador);}
    }

    // System.out.println("DEBUG: identificador: " + yytext());

    // Retorna Identificador normal
    return new Symbol(
        (yytext().equals("mais")) ? Tokens.MAIS : Tokens.ID,
        (yytext().equals("mais")) ? "+" : yytext()
    );
}
{digito}+	{return new Symbol(Tokens.NUMERO, new Integer(yytext()));}
{espaco}	{}
.           { System.out.println("Caracter ilegal: " + yytext()); }
