# Common Lisp Script

Common Lisp Script provides isomorphism between browser side and server side to Common Lisp as javascript's node.js and Clojure's ClojureScript.

## To be achieved

- Isomorphism in Common Lisp between browser side and server side.
- Proper interbridging between Common Lisp and javascript.
- Separate compilation and dependency management.
- Integration management into HTML files.

## Scoping

Common Lisp Script targets the second of following considerable scopes.

- Abstraction including HTML and CSS, not only javascript.
- **Isomorphism in Common Lisp between browser side and server side.**
- Expressing javascript in S-expression (Parenscript).

## Based on

- Common Lisp Script will be based on [jscl](https://github.com/davazp/jscl), so its specification compliance depends on jscl.

## Milestones

1. Bootstrapping
  - jscl already provides bootstrapping.

2. Compiling a file
  - Compile a Common Lisp source file with bootstrapping to get a javascript source file.

3. Compiling a package, that is, multiple files
  - Compile a package, containing multiple files, based on their dependency.

4. Compiling multiple packages
  - Compile multiple packages based on their dependency.

5. Bridging from Common Lisp to javascript
  - Invoke javascript functions from Common Lisp.
  - jscl already provides FFI from Common Lisp to javascript.

6. Bridging from javascript to Common Lisp
  - Invoke Common Lisp functions from javascript.

7. Integration into web application framework
  - Integrate into web application framework.

8. Dead code elimination
  - Dead code elimination to get smaller target code.

9. Increasing specification compatibility
  - Contribute to jscl to increase its Common Lisp specification compatibility.
