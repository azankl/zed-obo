; Outline: one entry per stanza, e.g. "Term MONDO:0000001 disease"
(stanza
  (stanza_header
    type: (stanza_type) @context)
  .
  (clause
    tag: (tag) @_id
    (#eq? @_id "id")
    value: (value) @name)
  .
  (clause
    tag: (tag) @_name
    (#eq? @_name "name")
    value: (value) @name)?) @item
