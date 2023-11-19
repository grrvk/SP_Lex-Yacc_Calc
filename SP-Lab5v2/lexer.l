%{
#define YYSTYPE float
#include "y.tab.h"
#include <stdlib.h>
void yyerror(char *);
%}

%%

[0-9]+(.[0-9]+)?       {
            yylval = atof(yytext);
            return INTEGER;
        }

pi {return PHI; }
exp {return EXP; }

[-+*%^/()\n]      { return *yytext; }

sin             {return SIN;}
cos {return COS;}
tan {return TAN;}
log {return LOG;}
cot {return COT;}
cosec {return COSEC;}
sec {return SEC;}
ln {return LN;}
asin {return ASIN;}
acos {return ACOS;}
atan {return ATAN;}
acot {return ACOT;}
acosec {return ACOSEC;}
asec {return ASEC;}
sqrt {return SQRT;}

[ \t]       ;       /* skip whitespace */

.           yyerror(yytext);

%%

int yywrap(void) {
return 1;
}
