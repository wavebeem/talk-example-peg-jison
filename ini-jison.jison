%lex
%%
<<EOF>>         return 'EOF'
[\n]            return 'NL'
"="             return '='
"["             return '['
"]"             return ']'
[a-zA-Z0-9]+    return 'CHARS'
.               return 'INVALID'
/lex
%ebnf
%%

Data: Section+ EOF
    { return yy.extend.apply(null, $1) };

Section: Header Property+
    { $$ = yy.pair($1, yy.object($2)) };

Header: "[" CHARS "]" NL
    { $$ = $2 };

Property: CHARS "=" CHARS NL
    { $$ = [$1, $3] };
