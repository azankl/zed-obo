; ---------------------------------------------------------------------------
; OBO flat file format — syntax highlighting
; Patterns are written so each node receives exactly one capture.
; ---------------------------------------------------------------------------

; Comments ------------------------------------------------------------------
(comment) @comment

; Stanza headers: [Term] [Typedef] [Instance] --------------------------------
(stanza_header
  "[" @punctuation.bracket
  "]" @punctuation.bracket)
(stanza_type) @keyword

; Tags ------------------------------------------------------------------------
; Header-frame tags (format-version, ontology, subsetdef, ...)
(header (clause tag: (tag) @preproc))
; Stanza tags (id, name, def, is_a, ...)
(stanza (clause tag: (tag) @property))
(clause ":" @punctuation.delimiter)

; The human-readable name of a term
(clause
  tag: (tag) @_tag
  (#eq? @_tag "name")
  value: (value (text) @title))

; Literals --------------------------------------------------------------------
(string "\"" @string)
(string_content) @string
(escape_sequence) @string.escape

(url) @link_uri
(curie) @constant

; Booleans / numbers in unquoted values (is_obsolete: true, format-version: 1.4)
((text) @boolean
  (#any-of? @boolean "true" "false"))
((text) @number
  (#match? @number "^[0-9]+(\\.[0-9]+)*$"))

; Synonym scopes and other bare keywords after a quoted string
((word) @keyword
  (#any-of? @keyword "EXACT" "BROAD" "NARROW" "RELATED"))
((word) @type
  (#not-any-of? @type "EXACT" "BROAD" "NARROW" "RELATED"))

; Dbxref lists: [PMID:123 "desc", GOC:mah] ------------------------------------
(xref_list
  "[" @punctuation.bracket
  "]" @punctuation.bracket)
(xref_list "," @punctuation.delimiter)
(xref_id) @string.special

; Trailing qualifiers: {source="X", cardinality=1} -------------------------
(qualifier_block
  "{" @punctuation.bracket
  "}" @punctuation.bracket)
(qualifier_block "," @punctuation.delimiter)
(qualifier_name) @attribute
(qualifier "=" @operator)
(qualifier_value) @constant
