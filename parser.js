const nearley = require("nearley");
const grammar = require("./grammar2.js");

// Create a Parser object from our grammar.
const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar));

// Parse something!
try {
    parser.feed('2*11+3-1+2+3*4/2+2/2-1+2/2*4-2*11+3-1+2+3*4+2-1+2*2*4/4');
    
    // parser.results is an array of possible parsings.
    console.log(parser.results[0]); 
} catch (error) {
    console.error('Invalid Formular')
}
