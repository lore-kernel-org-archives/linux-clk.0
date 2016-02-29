Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: kernel@martin.sperl.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 1/2] clk: bcm2835: expose raw clock-registers via debugfs
In-Reply-To: <1456755616-2472-2-git-send-email-kernel@martin.sperl.org>
References: <1456755616-2472-1-git-send-email-kernel@martin.sperl.org> <1456755616-2472-2-git-send-email-kernel@martin.sperl.org>
Date: Mon, 29 Feb 2016 12:39:18 -0800
Message-ID: <87k2ln5k09.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> For debugging purposes under some circumstance
> it helps to be able to see the actual clock registers.
>
> E.g: when looking at the clock divider it is helpful to
> see what the actual clock divider is.
>
> This patch exposes all the clock registers specific to each
> clock/pll/pll-divider via debugfs.
>
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

This one definitely seems useful to me.  I think the debugfs bits need
to be under #ifdef CONFIG_DEBUG_FS though.

With that fixed,

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1Kx2AAoJELXWKTbR/J7oh7YP/ijhsor8TWdoTopbYqpuIJbs
F6RQWKm2kL/TpWE+8Df2g/1sBXeNUOUDxr0gTFDzWm22I2rjFW34lv6QSV7HYApA
bJSF7mBmLlhm6m/R3yZYpdphI+Do7fzLKhHhBINLvcyu49RJNkW+MDx2B4pD4EAo
ynmPDwU5em7A+RD+ZtSUpzG9WFDfB6RR/Ngibuph2cQJS10h4h56wkTb+JHyY46q
GW33aHQVRDGx379C6LNPhVkDXNf35G8rXdso3HDmhVGK6xEHZcDPTQmmMetwNy9F
8F5VRWq3K9tWmDOXJNnV3jce2SxE9YMqnp1nF3O5LbHQpnRaTPzhRz7pXZch7+9Y
sc0YhgzPZajlg75sUkMu949waXU+QvvSoubHZhdFYd1JxTWNhlbrcuHdF/hXYLiM
7vjyW6uhWvuK2MHHoj3uxalvKBvV84PYT0fLGZYkhebFoPHupS5x8FFme28UCTIR
Grw7gJGSIQ9R42iPE1pyCg4CX2e5x1b/3EO+1DWi9rWngcSUKIPhIHMdW+vfQjSQ
3awZi2la565QdDdbd3Oa9LS3RlX3o1445YN0R8+T8fzi5YUKYO6vYJL3WgTNgjGV
pDsRbBEFzCSqO5G8Q17PuVCXBj77e/GLyEEr2UwoH7FOT51+IG5uPntkEVKGrmj1
aIayADU2GCRfHg//EXJ/
=VsZl
-----END PGP SIGNATURE-----
--=-=-=--
