Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Vladimir Zapolskiy <vz@mleia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Lee Jones <lee@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: bcm2835: fix check of error code returned by devm_ioremap_resource()
In-Reply-To: <1457227295-3093-1-git-send-email-vz@mleia.com>
References: <1457227295-3093-1-git-send-email-vz@mleia.com>
Date: Mon, 07 Mar 2016 15:27:47 -0800
Message-ID: <87d1r5yiks.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Vladimir Zapolskiy <vz@mleia.com> writes:

> The change fixes potential oops while accessing iomem on invalid
> address, if devm_ioremap_resource() fails due to some reason.
>
> The devm_ioremap_resource() function returns ERR_PTR() and never
> returns NULL, which makes useless a following check for NULL.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> Fixes: 5e63dcc74b30 ("clk: bcm2835: Add a driver for the auxiliary peripheral clock gates")

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW3g50AAoJELXWKTbR/J7oUvQP/2HuBR7sueIaUn+DyvFabZqg
zOawCSwpujq/ETmAzTUTAeVEapwg6tmPXNnu1xTlLmDWE/XyPIBKGVGxoXdEyUAb
3D5JERWec31DidJCO+dfDNhA/dwTtrNHW6XDl4hz1GU1JP9ZxnszMTU09c7I0lhY
ArWQMzQn0yRPZ5wHAfI+sp2yZetOwIm7o0l9XB2BHihHrGqsnZ7XC9KPQsYhDiey
6AMoxk+D/e4R+DVWt5gmuz+lAQR5VnZxHCOM8WsSSVXoh+1tlA0Zh0w+87/w3GYd
9rpA0kAemDX1MJ+6EcvBVZosNb8EZjjqmNsFETBtAlWPyaq40YHkWDK0ivpA736f
6Mz8sCBiBWgxxttef05Ty8VwjXyrMmVKT6HNRSQh9862f6QecwHYTIb0U+I0cn9J
CHaTTSkZqitbs5PQebgIPIsvnBGeyL/LFKJeFVsSdtmZvPcY/ltWHMjqpmQ7BdNX
fRp0ooBHmsIABC1COuMslVBoxzw7wjSb4A1btkaojqYSaHriGUK1bkw4SP1M91li
VwcCB3J8yyYaDIwjLxoWFwjyD2uTP2vgaQWAosU7T5/5PRxNTS5Kpm0TzrDzm/Z8
x9ucZpESI8e3v/tC6VM726FQvpwSDbmPpvpBob8QGlDbSYvJJ9zW/jArp0wc1Z5j
ZO4UXFDxBBlsRqfvbejA
=CzEA
-----END PGP SIGNATURE-----
--=-=-=--
