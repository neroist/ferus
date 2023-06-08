#[
  Text label

  This code is licensed under the MIT license

  Authors: xTrayambak (xtrayambak at gmail dot com)
]#
import ../renderer/[primitives, render, fontmanager], box, node, aabb, element, pixie

type Label* = ref object of LayoutElement

method draw*(label: Label, surface: RenderImage, pos: tuple[x, y: float32]) =
  label.box.aabb.debugDraw(surface)
  label.renderer.drawText(
    label.primitive.content, 
    pos, label.primitive.dimensions,
    label.primitive.font, surface
  )

proc computeSize(textContent: string, font: Font): int {.inline.} =
  (font.size.int * textContent.len)

proc newLabel*(textContent: string, renderer: Renderer, fontMgr: FontManager): Label =
  let
    font = fontMgr.getFont("Default")
    prim = newRenderText(
      textContent,
      font,
      (w: 64f, h: 64f), (x: 64f, y: 64f)
    )
  Label(
    renderer: renderer,
    primitive: prim,
    node: newLayoutNode(
      true, false, true, false, ssNone 
    ),
    box: newBox(
      newAABB(
        prim.pos.x.int, prim.pos.y.int, computeSize(textContent, font), font.size.int
      )
    )
  )
