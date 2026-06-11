
# Go Template Injections

- Provides highlighting for languages being templated,
  e.g., YAML highlighting in a Go template.
- Must build dialect for each injected file type.
- Was actually pretty tricky.
- Must generate parsers with local install of `tree-sitter`
  tool.
- Then configure `:TSUpdate` to register local parsers.
  - See `lua/plugins/treesitter.lua` for this logic.

## Generating Parsers

- Initialize the `tree-sitter-go-template` git submodule.
- For each language to inject (See `lua/plugins/treesitter.lua`):

```bash
LANG=""

test -z "$LANG" && {
  echo "LANG variable must be set"
  echo "e.g. yaml, json"
  exit 1
}

# make the dialect/query directories
mkdir -p tree-sitter/{dialects,queries}/$LANG_gotmpl

# make a grammar file for the injected language
cat << EOF > tree-sitter/dialects/$LANG_gotmpl/grammar.js
// dialects/$LANG_gotmpl/grammar.js
const make_grammar = require("./../../make_grammar")

module.exports = make_grammar('$LANG_gotmpl');
EOF

# prepare gotmpl highlights
cp tree-sitter-go-template/queries/highlights.scm \
  tree-sitter/queries/$LANG_gotmpl

# prepare injections file for the injected language
cat << EOF > tree-sitter/queries/injections.scm
((text) @injection.content
 (#set! injection.language "$LANG")
 (#set! injection.combined))
EOF

# generate the parser files and send to the proper
# dialects directory
cd tree-sitter-go-template
tree-sitter generate ../tree-sitter/dialects/$LANG_gotmpl/grammar.js \
  -o ../tree-sitter/dialects/$LANG_gotmpl/src
cd ..

```
