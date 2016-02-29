Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 2/2] clk: bcm2835: expose current divider, parent and mash via debugfs
In-Reply-To: <1456755616-2472-3-git-send-email-kernel@martin.sperl.org>
References: <1456755616-2472-1-git-send-email-kernel@martin.sperl.org> <1456755616-2472-3-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:43:36 -0800
Message-ID: <87h9gr5jt3.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> For each clock expose the following values via debugfs:
> * current_parent - the currently selected parent
> * current_divi - the integer portion of the currently set divider
> * current_divf - the fractional portion of the currently set divider
> * current_frac - the current frac/mash settings for the divider

current_parent can already be found through /debug/clk/clk_summary quite
nicely I think.  If we wanted a per-clock parent file, that seems like
something the core ought to be doing.

current_frac is looking at a bit that doesn't exist for non-MASH clocks.

divi/divf are OK, I guess, but don't seem particularly useful given the
raw register output already.  A cooked floating point point divider
debugfs entry would be nice, but I don't know if we can do that.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1K14AAoJELXWKTbR/J7oFQsP/0yI+rjonVK+qcVe4/LyTtVp
6WaSycOu8W6OkK838aGQXfEo55YWKN7ntp5kY9S9S1rIkTXHbSf70bpwlYe9b5k+
m930MsQkKb3oiXYiI0Aj9n1QZvgFY36GLhGi0vvOZtjKvjEqVvKLEab6SjcBbCs9
CYKeFePw/wW5kSWGuztx4aHsXWlQCdbn725JnsLCa8tPnBuyXcFtG4OAnhk5ccbB
yoTW91RoyFnTH/JvRG71PlFpKhRkLrn1+mFRT5jrJRUAKow+i3b34ll/ASVnHVH2
5Tf19VdxSBOMoRLuHv3OwbQi/0EdgkOH5a0tO53kWIG31dLR0oXvMMj4QGfNVqi0
EeGLoK3O2Un2cA7YC0OhMqqJOX/HuWVZE3jArMrDzZivLOCDXnlK3DAYvSXpfmH/
DrLqjSAuECEYVxQ3WOndNuDIVQsZE22OP2PyZX/CI4zdMlGvHHgZsaQkmmIZ8DO/
K1xPOy4bORxiQ1DTO66A/d4SgFHfu6psZCWiOmPNleaaaedjhLR3M7AnqZkr4pHm
wDwR0hWAKvcqylt5yunqUyNKM8AYzbm/JKMOiq3pUPdSrAqBozFU8vIntM4oKsk/
ou7C4STcYjxtJbHsyAK0W0oGkOzEA3q9GYmutrcVBK25i7XdJEvl1gS2U9vCAl6p
PoMZT+tU9UrQoD0s8CZP
=zc4n
-----END PGP SIGNATURE-----
--=-=-=--
