Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, stable@vger.kernel.org
Subject: Re: [PATCH] clk: bcm2835: Avoid overwriting the div info when disabling a pll_div clk
In-Reply-To: <1480620441-5442-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1480620441-5442-1-git-send-email-boris.brezillon@free-electrons.com>
Date: Thu, 01 Dec 2016 12:46:23 -0800
Message-ID: <87shq7fkdc.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> bcm2835_pll_divider_off() is resetting the divider field in the A2W reg
> to zero when disabling the clock.
>
> Make sure we preserve this value by reading the previous a2w_reg value
> first and ORing the result with A2W_PLL_CHANNEL_DISABLE.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
> Cc: <stable@vger.kernel.org>

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhAjB8ACgkQtdYpNtH8
nuirYQ/6Aj+YvupY0g9WaMjNWa8vxIlQau1z/20fv5df9rk2K5vv4qJY94Vx8tmO
zTPp3VOHcyoygDsXFD1UHk3OwgMmd8RInS7DEe+b+/Jb8cboLWmBni9ru2PVglry
eF/TDqqvgogrybWXX/Z+pWPH3gaFUxvJzfxklE5R2uKIH1DyxmJTlHAgv7mzQey/
xhE+c7lPG0M4n4vVUeVG56Sn4GjNISjt1OfIscOJk0Pu38he+iblz7GPeLPs/bPI
+vGqg6+BXXxy+wvIYalpo878OWjQLLgrFW6uY1GWm2LJfTpoqHlBbXd3YEsq+Ixr
ezGC0XLVlOqjxtrTWzBihuMTuulYccfbXkQVMVzc+P0BcIRdAdai5whjUzgVzWYj
elLcHbQr4suj1hJn46QTT2aajX981CZUbC7qE/BDL8VV+j/fODtrXDBwPjhwr2OF
yExA/CVIVrVKOxrWa0WtkNM5bMdNPz/udJO2IKbilMgOlkGlYr1zFajkfZlbmDRE
MxWa6gRg/lQcB8zEUhwBFjPcbU5n8RoZmNXh9J7++mu0c5vZ1okCoKv2s8GJskPv
8txG9nn3hlRQW+Sech5R7nHOZ9C9WbK29mHq4UBQRxRvk3jk4RJKUO91uLtZjwsE
gofoX72BS7cz6t0rHmql12Wu3fs1igDnudDbPKQKLSyqFmu7i3I=
=CoBZ
-----END PGP SIGNATURE-----
--=-=-=--
