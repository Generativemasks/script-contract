/*

   _____                           _   _                               _
  / ____|                         | | (_)                             | |
 | |  __  ___ _ __   ___ _ __ __ _| |_ ___   _____ _ __ ___   __ _ ___| | _____
 | | |_ |/ _ \ '_ \ / _ \ '__/ _` | __| \ \ / / _ \ '_ ` _ \ / _` / __| |/ / __|
 | |__| |  __/ | | |  __/ | | (_| | |_| |\ V /  __/ | | | | | (_| \__ \   <\__ \
  \_____|\___|_| |_|\___|_|  \__,_|\__|_| \_/ \___|_| |_| |_|\__,_|___/_|\_\___/

This contract contains a fully on-chain migrated Generativemasks script and related information.

## About original contract and project

- Original contract is deployed at Aug-08-2021
- Project launched at Aug-17-2021

## About artist and team

### Artist

* Name: takawo
* OpenProcessing: https://openprocessing.org/user/6533
* Twitter: https://twitter.com/takawo

### Team

- Toshiaki Takase
- wildmouse

## Miscellaneous

- GitHub: https://github.com/generativemasks

*/

// SPDX-License-Identifier: MIT

pragma solidity =0.8.6;

contract GenerativemasksScript {

    address public NFT = address(0x80416304142Fa37929f8A4Eee83eE7D2dAc12D7c);

    string public constant NAME = "Generativemasks";

    string public constant CREATOR = "takawo";

    string public constant DESCRIPTION = "The inspiration for this work came from discovering a sense of life in geometric patterns that are symmetrically arranged. With unexpected shapes and patterns, I tried to express the scary yet somehow charming atmosphere of Native American totem poles and indigenous Japanese Yokai.";

    string public constant SCRIPT_LICENSE = "CC BY-NC-SA 3.0";

    string public constant USED_LIBRARY = "p5.js";

    string public constant LIBRARY_VERSION = "1.3.1";

    uint256 private constant METADATA_INDEX = 3799;

    function getMaskNumberWithTokenId(uint256 tokenId) external pure returns (uint256) {
        return (tokenId + METADATA_INDEX) % 10000;
    }

    function getTokenIdWithMaskNumber(uint256 maskNumber) external pure returns (uint256) {
        return ((maskNumber + 10000) - METADATA_INDEX) % 10000;
    }

    string public constant ORIGINAL_SCRIPT =
unicode"const urlParams = new URLSearchParams(window.location.search);"
unicode"const seed = urlParams.get('seed');"
unicode""
unicode"let palette;"
unicode"let g;"
unicode"let current = seed;"
unicode"let texture;"
unicode""
unicode"function setup() {"
unicode"  createCanvas(1600, 1600);"
unicode"  pixelDensity(1);"
unicode"  colorMode(HSB, 360, 100, 100, 100);"
unicode"  angleMode(DEGREES);"
unicode""
unicode"  texture = createGraphics(width, height);"
unicode"  texture.colorMode(HSB, 360, 100, 100, 100);"
unicode"  texture.angleMode(DEGREES);"
unicode""
unicode"  texture.stroke(0, 0, 0, 1);"
unicode"  for (let i = 0; i < (width * height * 1) / 100; i++) {"
unicode"    let x = random(width);"
unicode"    let y = random(height);"
unicode"    let angle = 90 + random(15) * (random(100) > 50 ? -1 : 1);"
unicode"    let d = width / 10;"
unicode"    texture.line("
unicode"      x + cos(angle) * d,"
unicode"      y + sin(angle) * d,"
unicode"      x + cos(angle + 180) * d,"
unicode"      y + sin(angle + 180) * d"
unicode"    );"
unicode"  }"
unicode"}"
unicode""
unicode"function draw() {"
unicode"  clear();"
unicode""
unicode"  palette = shuffle(createPalette(random(url)), true);"
unicode"  randomSeed(current);"
unicode"  noiseSeed(current);"
unicode""
unicode"  let offset = width / 10;"
unicode"  let x = offset;"
unicode"  let y = offset;"
unicode"  let w = width - offset * 2;"
unicode"  let h = height - offset * 2;"
unicode""
unicode"  let c = palette[0];"
unicode"  palette.shift();"
unicode""
unicode"  push();"
unicode"  fill(c);"
unicode"  strokeWeight(30);"
unicode"  stroke(c);"
unicode"  let nScale = random(60, 200);"
unicode"  drawShape(x + w / 2, y + h / 2, (w * 3) / 4, nScale);"
unicode"  drawingContext.clip();"
unicode"  drawGraphic(0, 0, width, height, palette, this);"
unicode"  pop();"
unicode""
unicode"  g = get();"
unicode""
unicode"  background(random(palette));"
unicode""
unicode"  let area = detectEdge(g);"
unicode"  rectMode(CORNERS);"
unicode"  let center = detectCenter(area);"
unicode"  let v = p5.Vector.sub("
unicode"    createVector(width / 2, height / 2),"
unicode"    createVector(center.x, center.y)"
unicode"  );"
unicode""
unicode"  push();"
unicode"  imageMode(CENTER);"
unicode"  translate(v.x + g.width / 2, v.y + g.height / 2);"
unicode"  drawingContext.shadowColor = color(0, 0, 0, 50);"
unicode"  drawingContext.shadowBlur = max(width, height) / 20;"
unicode"  drawingContext.shadowOffsetY = max(width, height) / 40;"
unicode""
unicode"  image(g, 0, 0);"
unicode"  pop();"
unicode"  image(texture, 0, 0);"
unicode""
unicode"  noLoop()"
unicode"}"
unicode""
unicode"function detectCenter(area) {"
unicode"  let x = lerp(area.minX, area.maxX, 0.5);"
unicode"  let y = lerp(area.minY, area.maxY, 0.5);"
unicode"  let w = abs(area.maxX - area.minX);"
unicode"  let h = abs(area.maxY - area.minY);"
unicode"  return {"
unicode"    x: x,"
unicode"    y: y,"
unicode"    w: w,"
unicode"    h: h,"
unicode"  };"
unicode"}"
unicode""
unicode"function detectEdge(g) {"
unicode"  let minX, minY, maxX, maxY;"
unicode"  minX = g.width;"
unicode"  minY = g.height;"
unicode"  maxX = 0;"
unicode"  maxY = 0;"
unicode"  g.loadPixels();"
unicode"  for (let j = 0; j < g.height; j++) {"
unicode"    for (let i = 0; i < g.width; i++) {"
unicode"      let n = i * 4 + j * g.width * 4 + 3;"
unicode"      let alpha = g.pixels[n];"
unicode"      if (alpha > 0) {"
unicode"        minX = min(minX, i);"
unicode"        minY = min(minY, j);"
unicode"        maxX = max(maxX, i);"
unicode"        maxY = max(maxY, j);"
unicode"      }"
unicode"    }"
unicode"  }"
unicode"  return {"
unicode"    minX: minX,"
unicode"    minY: minY,"
unicode"    maxX: maxX,"
unicode"    maxY: maxY,"
unicode"  };"
unicode"}"
unicode""
unicode"function drawGraphic(x, y, w, h, colors, target) {"
unicode"  let g = createGraphics(w / 2, h);"
unicode"  g.angleMode(DEGREES);"
unicode"  let gx = 0;"
unicode"  let gy = 0;"
unicode"  let gxStep, gyStep;"
unicode""
unicode"  if (random() > 0.5) {"
unicode"    while (gy < g.height) {"
unicode"      gyStep = random(g.height / 100, g.height / 5);"
unicode"      if (gy + gyStep > g.height || g.height - (gy + gyStep) < g.height / 20) {"
unicode"        gyStep = g.height - gy;"
unicode"      }"
unicode"      gx = 0;"
unicode"      while (gx < g.width) {"
unicode"        gxStep = gyStep;"
unicode"        if (gx + gxStep > g.width || g.width - (gx + gxStep) < g.width / 10) {"
unicode"          gxStep = g.width - gx;"
unicode"        }"
unicode"        drawPattern(g, gx, gy, gxStep, gyStep, colors);"
unicode"        gx += gxStep;"
unicode"      }"
unicode"      gy += gyStep;"
unicode"    }"
unicode"  } else {"
unicode"    while (gx < g.width) {"
unicode"      gxStep = random(g.width / 100, g.width / 5);"
unicode"      if (gx + gxStep > g.width || g.width - (gx + gxStep) < g.width / 20) {"
unicode"        gxStep = g.width - gx;"
unicode"      }"
unicode"      gy = 0;"
unicode"      while (gy < g.height) {"
unicode"        gyStep = gxStep;"
unicode"        if (gy + gyStep > g.height || g.height - (gy + gyStep) < g.height / 10) {"
unicode"          gyStep = g.height - gy;"
unicode"        }"
unicode"        drawPattern(g, gx, gy, gxStep, gyStep, colors);"
unicode"        gy += gyStep;"
unicode"      }"
unicode"      gx += gxStep;"
unicode"    }"
unicode"  }"
unicode""
unicode"  target.push();"
unicode"  target.translate(x + w / 2, y + h / 2);"
unicode"  target.imageMode(CENTER);"
unicode"  target.scale(1, 1);"
unicode"  target.image(g, -g.width / 2, 0);"
unicode"  target.scale(-1, 1);"
unicode"  target.image(g, -g.width / 2, 0);"
unicode"  target.pop();"
unicode"}"
unicode""
unicode"function drawPattern(g, x, y, w, h, colors) {"
unicode"  let rotate_num = (int(random(4)) * 360) / 4;"
unicode"  g.push();"
unicode"  g.translate(x + w / 2, y + h / 2);"
unicode"  g.rotate(rotate_num);"
unicode"  if (rotate_num % 180 == 90) {"
unicode"    let tmp = w;"
unicode"    w = h;"
unicode"    h = tmp;"
unicode"  }"
unicode"  g.translate(-w / 2, -h / 2);"
unicode"  g.drawingContext.shadowColor = color(0, 0, 0, 33);"
unicode"  g.drawingContext.shadowBlur = max(w, h) / 5;"
unicode"  let sep = int(random(1, 6));"
unicode""
unicode"  let c = -1,"
unicode"    pc = -1;"
unicode"  g.stroke(0, (20 / 100) * 255);"
unicode""
unicode"  switch (int(random(8))) {"
unicode"    case 0:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.fill(c);"
unicode"        g.arc(0, 0, w * 2, h * 2, 0, 90);"
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"    case 1:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.fill(c);"
unicode""
unicode"        g.push();"
unicode"        g.translate(w / 2, 0);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.arc(0, 0, w, h, 0, 180);"
unicode"        g.pop();"
unicode""
unicode"        g.push();"
unicode"        g.translate(w / 2, h);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.arc(0, 0, w, h, 0 + 180, 180 + 180);"
unicode"        g.pop();"
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"    case 2:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.fill(c);"
unicode""
unicode"        g.push();"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.arc(0, 0, w * sqrt(2), h * sqrt(2), 0, 90);"
unicode"        g.pop();"
unicode""
unicode"        g.push();"
unicode"        g.translate(w, h);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.arc(0, 0, w * sqrt(2), h * sqrt(2), 0 + 180, 90 + 180);"
unicode"        g.pop();"
unicode""
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"    case 3:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.translate(w / 2, h / 2);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.fill(c);"
unicode"        g.ellipse(0, 0, w, h);"
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"    case 4:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.fill(c);"
unicode"        g.triangle(0, 0, w, 0, 0, h);"
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"    case 5:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.fill(c);"
unicode""
unicode"        g.push();"
unicode"        g.translate(w / 2, 0);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.triangle(-w / 2, 0, w / 2, 0, 0, h / 2);"
unicode"        g.pop();"
unicode""
unicode"        g.push();"
unicode"        g.translate(w / 2, h);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.triangle(-w / 2, 0, w / 2, 0, 0, -h / 2);"
unicode"        g.pop();"
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"    case 6:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.fill(c);"
unicode""
unicode"        g.push();"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.triangle(0, 0, w * sqrt(2), 0, 0, h * sqrt(2));"
unicode"        g.pop();"
unicode""
unicode"        g.push();"
unicode"        g.translate(w, h);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.arc(0, 0, -w * sqrt(2), 0, 0, -h * sqrt(2));"
unicode"        g.pop();"
unicode""
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"    case 7:"
unicode"      for (let i = 1; i > 0; i -= 1 / sep) {"
unicode"        while (pc == c) {"
unicode"          c = random(colors);"
unicode"        }"
unicode"        pc = c;"
unicode"        g.push();"
unicode"        g.translate(w / 2, h / 2);"
unicode"        g.rotate(45);"
unicode"        g.scale(i);"
unicode"        g.strokeWeight(1 / i);"
unicode"        g.fill(c);"
unicode"        g.rectMode(CENTER);"
unicode"        g.square(0, 0, sqrt(sq(w) + sq(h)));"
unicode"        g.pop();"
unicode"      }"
unicode"      break;"
unicode"  }"
unicode"  g.pop();"
unicode"}"
unicode""
unicode"function createPalette(_url) {"
unicode"  let slash_index = _url.lastIndexOf(\"/\");"
unicode"  let pallate_str = _url.slice(slash_index + 1);"
unicode"  let arr = pallate_str.split(\"-\");"
unicode"  for (let i = 0; i < arr.length; i++) {"
unicode"    arr[i] = color(\"#\" + arr[i]);"
unicode"  }"
unicode"  return arr;"
unicode"}"
unicode""
unicode"function drawShape(cx, cy, r, nPhase) {"
unicode"  push();"
unicode"  translate(cx, cy, r);"
unicode"  rotate(-90);"
unicode"  let arr = [];"
unicode"  beginShape();"
unicode"  for (let angle = 0; angle < 180; angle += 1) {"
unicode"    let nr = map(noise(cx, cy, angle / nPhase, r), 0, 1, (r * 1) / 8, r);"
unicode"    nr = constrain(nr, 0, width / 2);"
unicode"    arr.push(nr);"
unicode"    let x = cos(angle) * nr;"
unicode"    let y = sin(angle) * nr;"
unicode"    vertex(x, y);"
unicode"  }"
unicode"  arr.reverse();"
unicode"  for (let angle = 180; angle < 180 + 180; angle += 1) {"
unicode"    let nr = arr[0];"
unicode"    arr.shift();"
unicode"    let x = cos(angle) * nr;"
unicode"    let y = sin(angle) * nr;"
unicode"    vertex(x, y);"
unicode"  }"
unicode"  endShape(CLOSE);"
unicode""
unicode"  pop();"
unicode"}"
unicode""
unicode"let url = ["
unicode"  \"202c39-283845-b8b08d-f2d492-f29559\","
unicode"  \"1f2041-4b3f72-ffc857-119da4-19647e\","
unicode"  \"2f4858-33658a-86bbd8-f6ae2d-f26419\","
unicode"  \"ffac81-ff928b-fec3a6-efe9ae-cdeac0\","
unicode"  \"f79256-fbd1a2-7dcfb6-00b2ca-1d4e89\","
unicode"  \"e27396-ea9ab2-efcfe3-eaf2d7-b3dee2\","
unicode"  \"966b9d-c98686-f2b880-fff4ec-e7cfbc\","
unicode"  \"50514f-f25f5c-ffe066-247ba0-70c1b3\","
unicode"  \"177e89-084c61-db3a34-ffc857-323031\","
unicode"  \"390099-9e0059-ff0054-ff5400-ffbd00\","
unicode"  \"0d3b66-faf0ca-f4d35e-ee964b-f95738\","
unicode"  \"177e89-084c61-db3a34-ffc857-323031\","
unicode"  \"780000-c1121f-fdf0d5-003049-669bbc\","
unicode"  \"eae4e9-fff1e6-fde2e4-fad2e1-e2ece9-bee1e6-f0efeb-dfe7fd-cddafd\","
unicode"  \"f94144-f3722c-f8961e-f9c74f-90be6d-43aa8b-577590\","
unicode"  \"555b6e-89b0ae-bee3db-faf9f9-ffd6ba\","
unicode"  \"9b5de5-f15bb5-fee440-00bbf9-00f5d4\","
unicode"  \"ef476f-ffd166-06d6a0-118ab2-073b4c\","
unicode"  \"006466-065a60-0b525b-144552-1b3a4b-212f45-272640-312244-3e1f47-4d194d\","
unicode"  \"f94144-f3722c-f8961e-f9844a-f9c74f-90be6d-43aa8b-4d908e-577590-277da1\","
unicode"  \"f6bd60-f7ede2-f5cac3-84a59d-f28482\","
unicode"  \"0081a7-00afb9-fdfcdc-fed9b7-f07167\","
unicode"  \"f4f1de-e07a5f-3d405b-81b29a-f2cc8f\","
unicode"  \"50514f-f25f5c-ffe066-247ba0-70c1b3\","
unicode"  \"001219-005f73-0a9396-94d2bd-e9d8a6-ee9b00-ca6702-bb3e03-ae2012-9b2226\","
unicode"  \"ef476f-ffd166-06d6a0-118ab2-073b4c\","
unicode"  \"fec5bb-fcd5ce-fae1dd-f8edeb-e8e8e4-d8e2dc-ece4db-ffe5d9-ffd7ba-fec89a\","
unicode"  \"e63946-f1faee-a8dadc-457b9d-1d3557\","
unicode"  \"264653-2a9d8f-e9c46a-f4a261-e76f51\","
unicode"]"
;

}
