# Common Lisp Script

Common Lisp Script provides isomorphism between browser side and server side to Common Lisp as javascript's node.js and Clojure's ClojureScript.

**Some of this file will be moved into Issues and Wiki.**

## To be achieved

- Isomorphism in Common Lisp between browser side and server side.
- Proper interbridging between Common Lisp and javascript.
- Separate compilation and dependency management.
- Integration management into HTML files.
- Ease of debugging.
- Profiling.
- Documemtation.

## Scoping

Common Lisp Script targets the second of following considerable scopes.

- Abstraction including HTML and CSS, not only javascript.
- **Isomorphism in Common Lisp between browser side and server side.**
- Expressing javascript in S-expression (Parenscript).

## Approaches

a. Based on jscl
  - Based on [jscl](https://github.com/davazp/jscl), a Lisp to javascript compiler working on javascript.
  - The browser loads the compiler as javascript source file.
  - The compiler on javascript VM evaluates jscl source codes.

b. Another Common Lisp to javascript compiler
  - Provide another Common Lisp to javascript compiler working on Common Lisp.
  - The browser loads compiled javascript source files.
  - It might be based on jscl's `:host` code.

c. ECL + Emscripten
  - ECL translates CL to C.
  - Emscripten compiles C/C++ (or LLVM bitcode) to Javascript.
  - Using both compiles CL to javascript. 

## Milestones (not fixed)

1. Partially works, even not efficiently enough.
  - This is already achieved with jscl, see `sample/sample01` application.
  - With partial specification compliance.
  - Take a bit long time for practical use to compile functions on jscl on javascript VM.

1. Partially works, efficiently enough.
  - Find jscl can be optimized enough for practical use.
  - With partial specification compliance.
  - Implementing another CL-to-js compiler would take too long time.
  - See 'Approaches'.

1. Compiling a file
  - Compile a Common Lisp source file to a javascript source file.

1. Compiling multiple files
  - Compile multiple Common Lisp source files to a javascript source file.

1. Compiling a system
  - Compile a ASDF system to a javascript source file with resolving dependency.

1. Compiling multiple systems
  - Compile multiple ASDF systems to a javascript source file with resolving dependency.

1. Bridging from Common Lisp to javascript
  - Invoke javascript functions from Common Lisp.

1. Bridging from javascript to Common Lisp
  - Invoke Common Lisp functions from javascript.

1. Integration into web application framework
 - Integrate into web application framework.

1. Optimization
 - Dead code elimination.

1. Increasing specification compatibility
 - Better Common Lisp specification compliance.

### Tasks and status

    Status ::= Open|Running|Done

|Milestone|Task|Who does?|Status|
|---|---|---|---|
|2.|jscl optimization|@macdavid313|Running|
|2.|jscl optimization|N/A|Open|
|2.|Trying Google clusure compiler|N/A|Open|
|2.|Trying ECL + Emscripten|N/A|Open|
|11.|Increasing jscl spec compliance|N/A|Open|
|N/A|More sample applications|N/A|Open|

### Increasing jscl's specification compliance

|CLHS Chapter|foo|Implemented|Tested|Note|
|---|---|---|---|---|
|...|...|...|...|...|
|6. Iteration|DO|Yes?|Yes?|N/A|
|6. Iteration|DO*|Yes?|Yes?|N/A|
|6. Iteration|DOTIMES|Yes?|Yes?|N/A|
|6. Iteration|DOLIST|Yes?|Yes?|N/A|
|6. Iteration|LOOP|No|No|N/A|
|6. Iteration|LOOP-FINISH|No|No|N/A|
|...|...|...|...|...|
|8. Structures|DEFSTRUCT|No|No|Now CL::DEF!STRUCT|
|8. Structures|COPY-STRUCTURE|No|No|N/A|
|...|...|...|...|...|

## Mailing list

https://groups.google.com/forum/#!forum/common-lisp-script-dev

## Futher more

- ReactCL
  - Facebook's React interface like ClojureScript's Om.
