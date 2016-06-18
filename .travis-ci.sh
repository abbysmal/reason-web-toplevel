wget https://raw.githubusercontent.com/ocaml/ocaml-travisci-skeleton/master/.travis-ocaml.sh
sh .travis-ocaml.sh

eval `opam config env`

opam pin add --yes merlin https://github.com/the-lambda-church/merlin.git#87ea0e7998c04f16e4821676c27f19d3879dc2d1
opam pin add --yes merlin_extend https://github.com/def-lkb/merlin-extend.git#ef634252a793542b05ec00a90f3c17de8fe0a357
opam pin add --yes higlo https://github.com/Engil/higlo.git#reason-lexer
opam pin add --yes reason https://github.com/Engil/reason.git#better-findlib
opam update --yes
opam pin add --yes BetterErrors https://github.com/chenglou/BetterErrors.git
opam install --yes tyxml
opam install --yes react graphics js_of_ocaml.2.7
cd toplevel
WITH_GRAPHICS=YES make
