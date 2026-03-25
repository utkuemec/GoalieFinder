from __future__ import annotations
import math
from pathlib import Path
import imageio.v2 as imageio
import numpy as np
from PIL import Image, ImageDraw, ImageFilter, ImageFont

W, H = 1080, 1920
FPS = 30

WHITE = (255, 255, 255)
LIGHT = (210, 220, 235)
GREEN = (16, 185, 129)
GREEN2 = (52, 211, 153)
DARK = (6, 10, 18)

SAFE_T = 200
SAFE_B = 1600

SD = Path("/var/folders/sy/cb1y90yn1hvgy7hf_zsf9m6m0000gn/T/cursor/screenshots")


def _f(sz, b=False):
    for p in (["/System/Library/Fonts/Supplemental/Arial Bold.ttf"] if b
              else ["/System/Library/Fonts/Supplemental/Arial.ttf",
                    "/System/Library/Fonts/Helvetica.ttc"]):
        if Path(p).exists():
            try: return ImageFont.truetype(p, size=sz)
            except: pass
    return ImageFont.load_default()

FB = _f(84, True); FM = _f(52, True); FR = _f(38, False); FS = _f(30, False); FX = _f(22, False); FXT = _f(24, True)


def eio(t):
    t = max(0., min(1., t))
    return .5 - math.cos(t * math.pi) / 2

def tw(d, t, f): return d.textbbox((0, 0), t, font=f)[2]

def wrap(d, t, f, mw):
    ws = t.split()
    if not ws: return []
    ls, c = [], ws[0]
    for w in ws[1:]:
        x = f"{c} {w}"
        if d.textbbox((0, 0), x, font=f)[2] <= mw: c = x
        else: ls.append(c); c = w
    ls.append(c); return ls

def rmask(sz, r):
    m = Image.new("L", sz, 0)
    ImageDraw.Draw(m).rounded_rectangle((0, 0, sz[0], sz[1]), radius=r, fill=255)
    return m

def bg():
    c = Image.new("RGBA", (W, H), DARK)
    g = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    d = ImageDraw.Draw(g)
    d.ellipse((-250, -250, 550, 450), fill=(16, 185, 129, 30))
    d.ellipse((550, 1350, 1450, 2150), fill=(16, 185, 129, 20))
    g = g.filter(ImageFilter.GaussianBlur(120))
    c.alpha_composite(g)
    return c

_bg_cache = None
def cached_bg():
    global _bg_cache
    if _bg_cache is None:
        _bg_cache = bg()
    return _bg_cache.copy()

def url_badge(c, cx, cy, style="green"):
    """Draw a premium goaliefinders.com badge centered at (cx, cy)."""
    d = ImageDraw.Draw(c)
    label = "goaliefinders.com"
    arrow = "  \u2192"
    txt = label + arrow
    text_w = tw(d, txt, FM)
    bw = text_w + 80
    bh = 90
    bx = cx - bw // 2
    by = cy - bh // 2

    glow = Image.new("RGBA", c.size, (0, 0, 0, 0))
    gd = ImageDraw.Draw(glow)
    if style == "green":
        gd.rounded_rectangle((bx - 12, by - 12, bx + bw + 12, by + bh + 12),
                             radius=(bh + 24) // 2, fill=(16, 185, 129, 60))
        glow = glow.filter(ImageFilter.GaussianBlur(20))
        c.alpha_composite(glow)
        d = ImageDraw.Draw(c)
        d.rounded_rectangle((bx, by, bx + bw, by + bh), radius=bh // 2, fill=GREEN)
        d.rounded_rectangle((bx + 3, by + 3, bx + bw - 3, by + bh - 3),
                            radius=(bh - 6) // 2, outline=(52, 211, 153, 100), width=2)
        d.text((bx + 40, by + 18), label, font=FM, fill=WHITE)
        d.text((bx + 40 + tw(d, label, FM), by + 18), arrow, font=FM, fill=(200, 255, 230))
    else:
        gd.rounded_rectangle((bx - 12, by - 12, bx + bw + 12, by + bh + 12),
                             radius=(bh + 24) // 2, fill=(255, 255, 255, 50))
        glow = glow.filter(ImageFilter.GaussianBlur(20))
        c.alpha_composite(glow)
        d = ImageDraw.Draw(c)
        d.rounded_rectangle((bx, by, bx + bw, by + bh), radius=bh // 2, fill=(255, 255, 255, 240))
        d.rounded_rectangle((bx + 3, by + 3, bx + bw - 3, by + bh - 3),
                            radius=(bh - 6) // 2, outline=(16, 185, 129, 120), width=2)
        d.text((bx + 40, by + 18), label, font=FM, fill=DARK)
        d.text((bx + 40 + tw(d, label, FM), by + 18), arrow, font=FM, fill=GREEN)


def shad(c, x, y, w, h):
    s = Image.new("RGBA", c.size, (0, 0, 0, 0))
    ImageDraw.Draw(s).rounded_rectangle((x + 8, y + 18, x + w + 8, y + h + 18), radius=36, fill=(0, 0, 0, 90))
    s = s.filter(ImageFilter.GaussianBlur(28))
    c.alpha_composite(s)


def card_natural_h(shot_path, card_w):
    img = Image.open(shot_path)
    return int(img.height * (card_w - 8) / img.width) + 8


def make_card(shot_path, progress, card_w, card_h):
    shot = Image.open(shot_path).convert("RGB")
    iw = card_w - 8
    scale = iw / shot.width
    sh = int(shot.height * scale)
    shot = shot.resize((iw, sh), Image.Resampling.LANCZOS)
    ih = card_h - 8
    max_s = max(0, sh - ih)
    sy = int(eio(progress) * max_s)
    if sh <= ih:
        visible = shot
    else:
        visible = shot.crop((0, sy, iw, sy + ih))
    frame = Image.new("RGBA", (card_w, card_h), (255, 255, 255, 255))
    frame.paste(visible, ((card_w - visible.width) // 2, 4))
    mask = rmask((card_w, card_h), 36)
    return frame, mask


# ============================================================================

SCENES = [
    {"k": "hook", "dur": 2.5},
    {"k": "home", "dur": 4.0, "shot": "full-home.png"},
    {"k": "scroll", "dur": 5.0, "shot": "stitched-cities.png",
     "t1": "Pick your city", "sub": "21 cities, 102 fields across Canada."},
    {"k": "scroll", "dur": 4.5, "shot": "stitched-matchform.png",
     "t1": "Enter match details", "sub": "Choose a field, set the date and time."},
    {"k": "scroll", "dur": 5.0, "shot": "stitched-goalkeepers.png",
     "t1": "Browse goalkeepers", "sub": "Ratings, price per match, availability."},
    {"k": "split", "dur": 3.5},
    {"k": "join", "dur": 4.0, "shot": "full-join.png"},
    {"k": "cta", "dur": 3.5},
]


def r_hook(p, **_):
    c = cached_bg(); d = ImageDraw.Draw(c)
    block_h = 320
    y = SAFE_T + (SAFE_B - SAFE_T - block_h) // 2
    d.text((88, y), "No goalkeeper", font=FB, fill=WHITE)
    d.text((88, y + 104), "for tonight?", font=FB, fill=GREEN)
    for i, ln in enumerate(wrap(d, "Find a verified keeper in minutes. No sign-up needed.", FR, W - 176)):
        d.text((88, y + 264 + i * 52), ln, font=FR, fill=LIGHT)
    return c.convert("RGB")


def r_home(p, scene, **_):
    c = cached_bg(); d = ImageDraw.Draw(c)
    cw = 900
    nh = card_natural_h(SD / scene["shot"], cw)
    ch = min(nh, 820)

    y = SAFE_T
    d.text((88, y), "Find a Goalkeeper", font=FB, fill=WHITE)
    d.text((88, y + 96), "in Minutes", font=FB, fill=GREEN)
    d.text((88, y + 200), "No sign-up required for teams.", font=FR, fill=LIGHT)

    fy = y + 260
    fx = (W - cw) // 2
    shad(c, fx, fy, cw, ch)
    frame, mask = make_card(SD / scene["shot"], 0.0, cw, ch)
    c.paste(frame, (fx, fy), mask)

    feat_y = fy + ch + 50
    feats = [
        ("20+ cities", "Toronto to Vancouver"),
        ("Verified keepers", "Ratings and reviews"),
        ("Secure payments", "Pay safely with Stripe"),
    ]
    col_w = (W - 176) // 3
    for i, (title, sub) in enumerate(feats):
        fx2 = 88 + i * col_w
        d.rounded_rectangle((fx2, feat_y, fx2 + col_w - 24, feat_y + 140), radius=20,
                            fill=(255, 255, 255, 14), outline=(*GREEN, 80), width=2)
        d.text((fx2 + 16, feat_y + 20), title, font=FS, fill=GREEN)
        d.text((fx2 + 16, feat_y + 58), sub, font=FX, fill=LIGHT)

    badge_cy = feat_y + 140 + 40 + 45
    url_badge(c, W // 2, badge_cy, style="green")

    return c.convert("RGB")


def r_scroll(p, scene, **_):
    c = cached_bg(); d = ImageDraw.Draw(c)
    d.text((88, SAFE_T), scene["t1"], font=FB, fill=WHITE)
    d.text((88, SAFE_T + 100), scene["sub"], font=FR, fill=LIGHT)

    cw = 900
    card_y = SAFE_T + 170
    max_ch = SAFE_B - card_y
    natural_ch = card_natural_h(SD / scene["shot"], cw)
    ch = min(natural_ch, max_ch)
    fx = (W - cw) // 2
    sp = max(0., min(1., (p - .04) / .92))
    shad(c, fx, card_y, cw, ch)
    frame, mask = make_card(SD / scene["shot"], sp, cw, ch)
    c.paste(frame, (fx, card_y), mask)
    return c.convert("RGB")


def r_split(p, **_):
    c = Image.new("RGBA", (W, H), (0, 0, 0, 0))

    top = Image.new("RGBA", (W, H // 2), (12, 22, 40, 255))
    gt = Image.new("RGBA", (W, H // 2), (0, 0, 0, 0))
    ImageDraw.Draw(gt).ellipse((200, 100, 880, 700), fill=(16, 185, 129, 50))
    gt = gt.filter(ImageFilter.GaussianBlur(80))
    top.alpha_composite(gt)

    bot = Image.new("RGBA", (W, H // 2), (*GREEN, 255))
    gb = Image.new("RGBA", (W, H // 2), (0, 0, 0, 0))
    ImageDraw.Draw(gb).ellipse((100, 200, 900, 800), fill=(255, 255, 255, 40))
    gb = gb.filter(ImageFilter.GaussianBlur(80))
    bot.alpha_composite(gb)

    c.paste(top, (0, 0))
    c.paste(bot, (0, H // 2))

    div = Image.new("RGBA", (W, 120), (0, 0, 0, 0))
    ImageDraw.Draw(div).polygon([(0, 0), (W, 0), (W, 120), (0, 80)], fill=(*GREEN, 255))
    c.paste(div, (0, H // 2 - 60), div)

    d = ImageDraw.Draw(c)
    ty = SAFE_T + (H // 2 - SAFE_T - 180) // 2
    t1 = "Rent a Keeper"
    d.text(((W - tw(d, t1, FB)) // 2, ty), t1, font=FB, fill=WHITE)
    s1 = "Need one for tonight's game?"
    d.text(((W - tw(d, s1, FR)) // 2, ty + 110), s1, font=FR, fill=LIGHT)

    by = H // 2 + (SAFE_B - H // 2 - 180) // 2
    t2 = "Be a Keeper"
    d.text(((W - tw(d, t2, FB)) // 2, by), t2, font=FB, fill=DARK)
    s2 = "Get paid to play the sport you love."
    d.text(((W - tw(d, s2, FR)) // 2, by + 110), s2, font=FR, fill=(4, 30, 20))

    url_badge(c, W // 2, H // 2 + 30, style="white")

    return c.convert("RGB")


def r_join(p, scene, **_):
    c = cached_bg(); d = ImageDraw.Draw(c)
    cw = 900
    nh = card_natural_h(SD / scene["shot"], cw)
    ch = min(nh, 820)

    y = SAFE_T
    d.text((88, y), "Join as a Keeper", font=FB, fill=WHITE)
    d.text((88, y + 100), "Set your price. Accept bookings. Get paid.", font=FR, fill=LIGHT)

    fy = y + 170
    fx = (W - cw) // 2
    shad(c, fx, fy, cw, ch)
    frame, mask = make_card(SD / scene["shot"], 0.0, cw, ch)
    c.paste(frame, (fx, fy), mask)

    step_y = fy + ch + 40
    steps = [
        ("1", "Create your profile", "Sign up with Google or email"),
        ("2", "Set your rate", "Choose your price per match"),
        ("3", "Accept & play", "Get booking requests from teams"),
        ("4", "Get paid", "Payment released after each match"),
    ]
    for i, (num, title, sub) in enumerate(steps):
        sy = step_y + i * 85
        d.ellipse((108, sy + 6, 148, sy + 46), fill=GREEN)
        d.text((120, sy + 10), num, font=FXT, fill=WHITE)
        d.text((170, sy + 8), title, font=FS, fill=WHITE)
        d.text((170, sy + 44), sub, font=FX, fill=LIGHT)

    badge_cy = step_y + 4 * 85 + 30 + 45
    url_badge(c, W // 2, badge_cy, style="green")

    return c.convert("RGB")


def r_cta(p, **_):
    c = cached_bg(); d = ImageDraw.Draw(c)
    block_h = 700
    y = SAFE_T + (SAFE_B - SAFE_T - block_h) // 2
    l1 = "Rent a Keeper."
    d.text(((W - tw(d, l1, FB)) // 2, y), l1, font=FB, fill=WHITE); y += 104
    l2 = "Or Be One."
    d.text(((W - tw(d, l2, FB)) // 2, y), l2, font=FB, fill=GREEN2); y += 140
    sub = "20+ cities across Canada"
    d.text(((W - tw(d, sub, FR)) // 2, y), sub, font=FR, fill=LIGHT); y += 100

    bw, bh = W - 200, 130; bx = (W - bw) // 2; cy = y + 40
    d.rounded_rectangle((bx, cy, bx + bw, cy + bh), radius=bh // 2, fill=GREEN)
    t = "goaliefinders.com"
    d.text(((W - tw(d, t, FM)) // 2, cy + 36), t, font=FM, fill=WHITE)

    for i, f in enumerate(["Verified & rated keepers", "Secure Stripe payments", "No sign-up for teams"]):
        d.text(((W - tw(d, f, FS)) // 2, y + 240 + i * 48), f, font=FS, fill=LIGHT)

    return c.convert("RGB")


R = {"hook": r_hook, "home": r_home, "scroll": r_scroll, "split": r_split, "join": r_join, "cta": r_cta}


def main():
    out = Path("/Users/utkuemecan/Desktop/GoalieFinder/docs/media/goaliefinder-instagram-reel.mp4")
    fade = max(1, int(.5 * FPS))
    wr = imageio.get_writer(
        out, fps=FPS, codec="libx264", macro_block_size=1,
        output_params=["-crf", "17", "-preset", "slow", "-pix_fmt", "yuv420p",
                       "-tune", "stillimage"],
    )

    # Pre-render static scenes (everything except scroll scenes)
    # For scroll scenes, only the card content changes per frame
    try:
        for i, sc in enumerate(SCENES):
            tot = max(1, int(sc["dur"] * FPS))
            last = i == len(SCENES) - 1
            fn = R[sc["k"]]

            fade_in = fade if i > 0 else 0
            fade_out = fade if not last else 0
            body = max(1, tot - fade_in - fade_out)

            for fi in range(body):
                p = (fi + fade_in) / max(1, tot - 1)
                wr.append_data(np.asarray(fn(p, scene=sc)))

            if last:
                continue

            ns = SCENES[i + 1]; nf = R[ns["k"]]
            tot_next = max(1, int(ns["dur"] * FPS))
            for fi in range(fade):
                cp = (fade_in + body + fi) / max(1, tot - 1)
                np_ = fi / max(1, tot_next - 1)
                a = fn(cp, scene=sc)
                b = nf(np_, scene=ns)
                wr.append_data(np.asarray(Image.blend(a, b, (fi + 1) / fade)))
    finally:
        wr.close()

    print(out)


if __name__ == "__main__":
    main()
