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

## Install

In Zed, open the Extensions page (`cmd-shift-x`), search for **OBO** and click
**Install**. Then open any `.obo` file.

### Install from source (dev extension)

1. Clone this repository.
2. In Zed, open the command palette and run **zed: install dev extension**.
3. Select the cloned `zed-obo` folder.

Zed needs Rust installed (via `rustup`) to install dev extensions.

## Layout

```
zed-obo/
├── extension.toml          # Zed extension manifest (points to the grammar repo + rev)
└── languages/obo/          # Zed language config + queries
    ├── config.toml
    ├── highlights.scm
    ├── outline.scm
    └── brackets.scm
```

The Tree-sitter grammar lives in its own repository:
[azankl/tree-sitter-obo](https://github.com/azankl/tree-sitter-obo).

## Changing the grammar

```sh
git clone https://github.com/azankl/tree-sitter-obo
cd tree-sitter-obo
npm install
npx tree-sitter generate
npx tree-sitter parse path/to/file.obo
git commit -am "..." && git push
```

Then put the new commit SHA into `rev` in `extension.toml` and click
**Rebuild** next to the extension in Zed's Extensions page.

## License

MIT
