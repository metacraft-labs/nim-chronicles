type
  SectionRenderer* = proc(): RootRef

  Section* = object
    title*: cstring
    content*: SectionRenderer
  
when defined(createChroniclesTail):
  var
    sections* = newSeq[Section](0)

  proc addSection*(title: cstring, content: SectionRenderer) {.exportc.} =
    sections.add Section(title: title, content: content)
else:
  proc addSection*(title: cstring, content: SectionRenderer) {.importc.}
