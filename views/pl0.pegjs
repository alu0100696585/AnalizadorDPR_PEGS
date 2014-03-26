{
  var tree = function(f, r) {
    if (r.length > 0) {
      var last = r.pop();
      var result = {
        type:  last[0],
        left: tree(f, r),
        right: last[1]
      };
    }
    else {
      var result = f;
    }
    return result;
  }
}

program = b:block DOT { return {
                        type: "PROGRAM",
                        bloque: b };
                     }  

block = c:(const)? v:(var)? p:(proc)* s:st {
var k = new Array()
if (c){
 k.push({type: "CONST", lista: c})
}
if (v){
 k.push({type: "VAR", lista: v})
}
if (p) {
 k.push(p)
}
if (s){
 k.push(s)
}
return k}

const = CONST u:assin c:(COMA (assin))* DOTT {
var r = new Array();
r.push(u)
for ( var i = 0; i < c.length; i++)
    r.push(c[i][1]);
return r;
} 

var = VAR id: ID i:(COMA ID)* DOTT{
var r = new Array();
r.push(id);
for ( var k = 0; k < i.length; k++)
    r.push(i[k][1]);
return r;
}

proc = PROCEDURE id:ID DOTT b:block DOTT{
return { type: "PROCEDURE", name: id, subrutina: b[1]}
}
assin = i:ID ASSIGN e:exp {return {type: '=', left: i, right: e}; }

statement = 

arg = e:exp COMA a:arg { return tree(e,a);}
        / e:exp {return e}


st     = i:ID ASSIGN e:exp            
            { return {type: '=', left: i, right: e}; }
       / IF e:exp THEN st:st ELSE sf:st
           {
             return {
               type: 'IFELSE',
               c:  e,
               st: st,
               sf: sf,
             };
           }
       / IF e:exp THEN st:st    
           {
             return {
               type: 'IF',
               c:  e,
               st: st
             };
           }
exp    = t:term   r:(ADD term)*   { return tree(t,r); }
term   = f:factor r:(MUL factor)* { return tree(f,r); }

factor = NUMBER
       / ID
       / LEFTPAR t:exp RIGHTPAR   { return t; }

_ = $[ \t\n\r]*

ASSIGN   = _ op:'=' _  { return op; }
ADD      = _ op:[+-] _ { return op; }
MUL      = _ op:[*/] _ { return op; }
DOT      = _"."_
DOTT     = _";"_
COMA     = _","_
LEFTPAR  = _"("_
RIGHTPAR = _")"_
VAR      = _"var"_
CONST    = _"const"_
PROCEDURE= _"procedure"_
IF       = _ "if" _
THEN     = _ "then" _
ELSE     = _ "else" _
ID       = _ id:$([a-zA-Z_][a-zA-Z_0-9]*) _ 
            { 
              return { type: 'ID', value: id }; 
            }
NUMBER   = _ digits:$[0-9]+ _ 
            { 
              return { type: 'NUM', value: parseInt(digits, 10) }; 
            }