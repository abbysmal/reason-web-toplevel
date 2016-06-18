# reason-web-toplevel
A Reason web toplevel built using js_of_ocaml

To make this word, you need

	- The latest git version of BetterErrors: the one released on opam contains a typo preventing us to build correctly a javascript version of it.


	- This branch of my fork of Reason: https://github.com/Engil/reason/tree/better-findlib, adding a reason.parser package that does not contains Reason_utop, and also fixing the installation of some modules. (Reason_toolchain for example)


	- `js_of_ocaml` 2.7, haven't tested 2.8.


	- Higlo must be installed, preferably from this branch to get reason syntax highlighting workinig: https://github.com/Engil/higlo/tree/reason-lexer
