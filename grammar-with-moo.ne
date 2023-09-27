@{%
    const moo = require("moo")
    const lexer = moo.compile({
      digits: /[0-9]+/,
      plus_or_minus: ['+', '-'],
      devide_or_multiply: ['/', '*']
    })
%}

@lexer lexer

exp -> exp %plus_or_minus devide_or_multiply_exp  {%
    function(data) {
        if (data[1].value== '-') {
            return data[0] - data[2]
        }
        return data[0] + data[2]
    }
%}
| exp %plus_or_minus number  {%
    function(data) {
        if (data[1].value== '-') {
            return data[0] - data[2]
        }
        return data[0] + data[2]
    }
%}
| number {%
    function(data) {
        return data[0]
    }
%}
| devide_or_multiply_exp {%
    function(data) {
        return data[0]
    }
%}

devide_or_multiply_exp -> number %devide_or_multiply number {%
    function(data) {
        if (data[1].value == '*') {
            return data[0] * data[2]
        }
        return data[0] / data[2]
    }
%}
| devide_or_multiply_exp %devide_or_multiply number {%
    function(data) {
        if (data[1].value == '*') {
            return data[0] * data[2]
        }
        return data[0] / data[2]
    }
%}

number -> %digits {% d => parseInt(d[0].value) %}
