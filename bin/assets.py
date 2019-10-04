#!/usr/bin/env python3

import json
import functools
import re
import sys
import os

from PyTexturePacker import Packer
from PIL import Image

OFFSET_RE = re.compile("{(?P<x>\d+),(?P<y>\d+)}")
SIZE_RE = re.compile("{(?P<width>\d+),(?P<height>\d+)}")
RECT_RE = re.compile("{{(?P<x1>\d+),(?P<y1>\d+)},{(?P<x2>\d+),(?P<y2>\d+)}}")
PNG_RE = re.compile("(?P<key>.*).png")
def save_plist(filename, plist, _):
    d = {}
    for key, data in plist["frames"].items():
        offset = OFFSET_RE.match(data["offset"]).groupdict()
        offset = { k: int(v) for k, v in offset.items() }
        size = SIZE_RE.match(data["sourceSize"]).groupdict()
        size = { k: int(v) for k, v in size.items() }
        rect = RECT_RE.match(data["sourceColorRect"]).groupdict()
        rect = { k: int(v) for k, v in rect.items() }
        frame = RECT_RE.match(data["frame"]).groupdict()
        frame = { k: int(v) for k, v in frame.items() }

        key = PNG_RE.match(key).groupdict()["key"]

        d[key] = {
            "x": int(frame["x1"]),
            "y": int(frame["y1"]),
            "w": int(size["width"]),
            "h": int(size["height"]),
            "r": 0,
        }


    with open(filename, "w") as f:
        if os.environ.get("COMPRESS") == "1":
            print(json.dumps(d), file=f)
        else:
            print(json.dumps(d, indent=2), file=f)

def pack_test(assets_path, output_path):
    # create a MaxRectsBinPacker
    packer = Packer.create(max_width=1024, max_height=1024, bg_color=0x00000000, enable_rotated=False,
            force_square=True, border_padding=0)
    # pack texture images under directory "test_case/" and name the output images as "test_case".
    # "%d" in output file name "test_case%d" is a placeholder, which is a multipack index, starting with 0.
    packer.pack("{}/".format(assets_path), output_path, save_plist_func=functools.partial(save_plist, "{}.json".format(output_path)))

def crop(filename, image_file, outfdr):
    with open(filename) as f:
        data = json.loads(f.read())

    im = Image.open(image_file)
    for fn, d in data.items():
        x = d["x"]
        y = d["y"]
        w = d["w"]
        h = d["h"]

        x, y, w, h = int(x), int(y), int(w), int(h)
        rect = (x, y, (x + w), (y + h))
        out = im.crop(rect)
        out.save("{0}/{1}.png".format(outfdr, fn), "PNG")

def print_help():
    print("[0] pack [assets path] [output path]".format(sys.argv[0]))
    print("[0] crop [configfile] [outputfdr]".format(sys.argv[0]))

if __name__ == "__main__":
    if len(sys.argv) == 1:
        print_help()
        sys.exit(0)

    if sys.argv[1] == "pack":
        if len(sys.argv[2:]) != 2:
            print_help()
            sys.exit(0)
        pack_test(sys.argv[2], sys.argv[3])
    elif sys.argv[1] == "crop":
        if len(sys.argv[2:]) != 3:
            print_help()
            sys.exit(0)
        crop(sys.argv[2], sys.argv[3], sys.argv[4])
    else:
        print_help()

