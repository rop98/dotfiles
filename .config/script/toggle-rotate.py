#!/usr/bin/env python3
import subprocess

# --- set the name of the screen and the rotate direction below
screen = "LVDS1"
rotate = "right"
# ---

matchline = [
    l.split() for l in subprocess.check_output(["xrandr"]).decode("utf-8").splitlines()\
    if l.startswith(screen)
    ][0]
s = matchline[
    matchline.index([s for s in matchline if s.count("+") == 2][0])+1
    ]

rotate = "normal" if s == rotate else rotate
subprocess.call(["xrandr", "--output", screen, "--rotate", rotate])
