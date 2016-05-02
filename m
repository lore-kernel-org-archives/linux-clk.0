Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V4 1/2] clk: bcm2835: mark enabled clocks with CLK_IS_CRITICAL
In-Reply-To: <1461951756-16804-2-git-send-email-kernel@martin.sperl.org>
References: <1461951756-16804-1-git-send-email-kernel@martin.sperl.org> <1461951756-16804-2-git-send-email-kernel@martin.sperl.org>
Date: Mon, 02 May 2016 08:36:18 -0700
Message-ID: <87zis8h3pp.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> The bcm2835 firmware enables several clocks and plls before
> booting the linux kernel.
>
> These plls should never get disabled as it may result in a
> stopped system clock and more.
>
> So during probing we check if the clock is enabled
> and if it is then mark that clock with CLK_IS_CRITICAL.
>
> As a consequence this will also enable the corresponding
> parent plls and pll-divs.
>
> This is intended as a stop-gap until CLK_ENABLE_HAND_OFF
> becomes available, at which point it should be used instead.
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

I still think that we don't want this patch.  We should be able to
disable clocks that the firmware turned on, unless they really need to
stay on.  If you have troubles on the upstream DT, let's talk about
individual clocks.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXJ3PyAAoJELXWKTbR/J7o6A8QALiioJr7U8xDbwn22NphL4lV
h+YvfkyUH6fAosD/MqMPvGuB/GYA8ZC6WBe88RQb1pAn3NgiJ5RuyIZCerlGa/sX
ZBcbZLEy4NZa8G9eY0/VhlVAkaZUrhfltTyINTEPay+aJblXXrg7HEnqdsIM7vsf
1ffBPCyZJjNRozhLbkQsALOb3pgEYBYcp2unhLSzsiwqI7VZ8gZ4V1ySWuA2Jnet
U6lHkBgzFbYhBzNWOQWooaqf/DleIUUPoy2cm2tG7xuJyw006E+0Y7snW/c54Pcj
fkKoHcytm3i7ydSZcWpBTEhTd+a1NakJOJ8deKRRCmYLs0O3utgt691eSbHsFGZo
lzSRBVcKdQWw5o99P4cjthOq+WHJNDQR9PLyEgHnB8VuUr7kg3yca9FI7fd07auL
KimXlzPoZoZIcwCjOy7TSu+epYQSHucMgLxUROi4ZXaqnqg80BrfejojAWh66jPD
Vy45NNxd3DZr3R2JQ/6lVfKCch7ARBqz2byv2tKqjqPiS6bngv2bLCNFFLCkgaEs
2Q7dukExcD70CC7Q61a1L1SWbBBLgUDI0n6gvBlZTv9g0NG7dxX6iaUJLLDOJsgo
xvHpjBB0pr+GklFDHXLjW/cIhAtcMmohxoepjVXwqO4W1of0rDe7F4BfbjHWbJ2F
qdDGoEyedXWAVVrHCsN3
=PBZ/
-----END PGP SIGNATURE-----
--=-=-=--
