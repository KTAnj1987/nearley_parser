# Nearley Parser
In web development, it is essential to implement advanced search functionality that incorporates various operators. We can provide users with a search field where they can input their own queries. For example, a query could be 

```'test OR new* AND test#3 AND !far'```

In the context of the advanced search functionality you described, the search field should retrieve data that meets the following criteria:

* Contains 'tesr' or starts with 'new'.
* Includes 'test' three times.
* Excludes 'far'.

Our goal is to convert this type of query string into an SQL query. Achieving this involves leveraging compiler theory to construct our own compiler for converting these query strings into SQL queries. Compiler theory can be a complex concept, and in the past, developing each component from scratch was a challenging task. However, it has become more accessible. **Jay Earley** has introduced a modern parser toolkit for JavaScript known as **Nearley**. Nearley allows parsers to transform strings of characters into meaningful data structures, such as a JSON object.

This is all nice in a playground web application to learn and write your grammar file, but now we need to put this to use in an application. Nearly consists of two components, the compiler and the parser. The compiler is used to compile your grammar file and can be used with the parser and your document to be parsed. Both components are available as npm packages and can be installed through npm.

I utilized Nearley to efficiently evaluate arithmetic expressions. These expressions are typically represented in what's known as Infix notation, where each operator is placed between two operands, like this: A + B * C.

In my example, I've accounted for two levels of precedence for four binary operators, as outlined below:

* Highest: Multiplication (*) and Division (/)
* Lowest: Addition (+) and Subtraction (-) 

Store the grammar as shown above into a file called grammar.ne and compile it using the following command:

```nearleyc grammar.ne -o grammar.js```

This will compile the grammar file into a JavaScript Parser module. Now we can use the test tool provided by the Nearley compiler:

``nearley-test ./grammar.js --input '2+3*4'``

Here I added parser.js to explain how we use compile this grammar in our code base. you can run this parser.js using following command, it will show the result of equation.

``node ./parser.js``

you can follow the documentation of nearley , https://nearley.js.org/docs to learn more. 

Nearley supports and recommends Moo, a super-fast lexer. Construct a lexer using moo.compile. The @lexer directive instructs Nearley to use a lexer you’ve defined inside a Javascript block in your grammar. 

[Lexing with Moo](https://nearley.js.org/docs/tokenizers)

We can tokenize **number, devide_or_multiply and plus_or_minus** with moo, You can refer to the **grammar-with-moo.ne** file to understand how to utilize Moo for this purpose. Compile it and test it for in-fix equation.

Like this we can implement own grammar which is realted to our problem, and we can build own compiler easily by utilizing Nearley.

