%option yylineno

%{
    #include<stdio.h>
    #include"y.tab.h"
    #include<math.h>
%}

%%
    
"#include"([ ]+)?((<(\\.|[^>])+>)|(\"(\\.|[^"])+\"))                                              {return HEADER;}
"#define"[ ]+[a-zA-z_][a-zA-z_0-9]*                                                               {return DEFINE;}
"list"                                                                                            {return LIST;}
"vector"                                                                                          {return VECTOR;}
"auto"|"static"|"typedef"                                                                         {return storage_const;}
"void"|"char"|"short"|"int"|"long"|"float"|"double"|"bool"                                          {return type_const;}
"const"                                                                                           {return sym_const;}
"if"                                                                                              {return IF;}
"else"                                                                                            {return ELSE;}
"for"                                                                                             {return FOR;}
"do"                                                                                              {return DO;}
"while"                                                                                           {return WHILE;}
"break"                                                                                           {return BREAK;}
"struct"                                                                                          {return sym_struct;}
"return"                                                                                          {return RETURN;}
"sizeof"                                                                                          {return SIZEOF;}
"||"                                                                                              {return or_const;}
"&&"                                                                                              {return and_const;}
"=="|"!="                                                                                         {return equality_const;}
"<="|">="                                                                                         {return weak_comparison_const;}
">>"|"<<"                                                                                         {return move_const;}
"++"|"--"                                                                                         {return inc_dec_const;}
";"|"="|","|"{"|"}"|"("|")"|"["|"]"|"*"|"+"|"-"|"/"|"?"|":"|"&"|"|"|"^"|"!"|"~"|"%"|"<"|">"       {return yytext[0];}
"*="|"/="|"+="|"%="|">>="|"-="                                                                    {return ASSIGN_PUNCTUATION;}
[0-9]+                                                                                            {return int_const;}
"&*+-~!"                                                                                          {return UNARY; }
[0-9]+"."[0-9]+                                                                                   {return float_const;}
"'"."'"                                                                                           {return char_const;}
[a-zA-z_][a-zA-z_0-9]*                                                                            {return id_s;}
\"(\\.|[^\"])*\"                                                                                  {return string;}

[ \t\n]                                                                                           ;
%%

int yywrap(void)
{
    return 1;
}
