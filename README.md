# OBO for Zed

Syntax highlighting for the [OBO flat file format](https://owlcollab.github.io/oboformat/doc/obo-syntax.html)
(`.obo`, versions 1.2 and 1.4) in the [Zed](https://zed.dev) editor.

Highlights:

- stanza headers: `[Term]`, `[Typedef]`, `[Instance]`
- header tags (`format-version`, `ontology`, …) and stanza tags (`id`, `is_a`, …)
- term names
- quoted strings and escape sequences (`\"`, `\n`, `\!`)
- CURIEs (`MONDO:0000001`, `xsd:string`) and URLs
- dbxref lists: `[PMID:123 "desc", GOC:mah]`
- qualifier blocks: `{source="DOID", cardinality=1}`
- synonym scopes: `EXACT`, `BROAD`, `NARROW`, `RELATED`
- booleans, version numbers and `! comments`

The outline panel (`cmd-shift-o`) lists every stanza by id and name.

## Install (dev extension)

1. In Zed, open the command palette and run **zed: install dev extension**.
2. Select this `zed-obo` folder.
3. Open any `.obo` file.

Zed needs Rust installed (via `rustup`) to install dev extensions.

## Layout

```
zed-obo/
├── extension.toml          # Zed extension manifest
├── languages/obo/          # Zed language config + queries
│   ├── config.toml
│   ├── highlights.scm
│   ├── outline.scm
│   └── brackets.scm
└── tree-sitter-obo/        # Tree-sitter grammar (its own git repo)
    ├── grammar.js
    └── src/parser.c        # generated
```

## Changing the grammar

```sh
cd tree-sitter-obo
npm install
npx tree-sitter generate
npx tree-sitter parse path/to/file.obo
git commit -am "..."        # then put the new commit SHA into extension.toml `rev`
```

Then click **Rebuild** next to the extension in Zed's Extensions page.
