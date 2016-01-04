# Common Lisp Script

Common Lisp Script provides isomorphism between browser side and server side to Common Lisp as javascript's node.js and Clojure's ClojureScript.

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

## Milestones (not fixed)

1. Finding jscl can be optimized enough for practical use.
  - Raw jscl on javascript VM is a bit slow for practical use.
  - Implementing another CL-to-js compiler would take too long time.
  - Find that jscl can be optimized enough for practical use.
  - See Approaches.

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
 -  - Integrate into web application framework.

1. Optimization
 - Dead code elimination.

1. Increasing specification compatibility
 - Better Common Lisp specification compliance.

## Tasks and status

    Status ::= Open|Running|Done

|Task|Who does?|Status|
|---|---|---|
|jscl optimization|David|Running|
|Trying Google clusure compiler|N/A|Open|
|More sample applications|N/A|Open|

## Approaches

a. Based on jscl
  - Based on [jscl](https://github.com/davazp/jscl), a Lisp to javascript compiler working on javascript.
  - The browser loads the compiler as javascript source file.
  - The compiler on javascript VM evaluates jscl source codes.

b. Another Common Lisp to javascript compiler
  - Provide another Common Lisp to javascript compiler working on Common Lisp.
  - The browser loads compiled javascript source files.
  - It might be based on jscl's `:host` code.

## Futher more

- ReactCL
  - Facebook's React interface like ClojureScript's Om.
