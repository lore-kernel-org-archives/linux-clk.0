Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 26 Mar 2017 15:11:57 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/3] clk: sunxi-ng: a80: Fix audio PLL comment not
 matching actual code
Message-ID: <20170326131157.4kngtrhqpme433ac@lukather>
References: <20170324083307.18338-1-wens@csie.org>
 <20170324083307.18338-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o74jroi6nporhp2j"
In-Reply-To: <20170324083307.18338-4-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--o74jroi6nporhp2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2017 at 04:33:07PM +0800, Chen-Yu Tsai wrote:
> We ignore the d1 and d2 dividers in the audio PLL, and force them to
> 1 (register value 0) at probe time. However the comment preceding the
> audio PLL definition says we enforce the default value, which is not
> the same.
>=20
> Fix the preceding comment to match what we do in code.
>=20
> Fixes: b8eb71dcdd08 ("clk: sunxi-ng: Add A80 CCU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--o74jroi6nporhp2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY174dAAoJEBx+YmzsjxAgKCoP/jW8XQJKj06pCYYXhU0lqThA
WujeV3TL9jYPm+JdjGJM6QimV37X8Fdsuv81ZqrBgIgbEd72VnIilGBmGXPBNBiq
ax7zhiilfGiIB6iPRPNlsDCWOa51nq64g7pWDsXDWuQH6Ei+kDvkd7eBoXoCxr/M
jrjJTRuQK6nFRKK5mvaE0USpaGypUDDAA5hQsaC+c6OeK/b4mFqU5o8/kO/t3rAq
0SWwIFgKI7QO7U+hp2yRLMFldnfSrvDATQXu0iaRbK6TvRs//t4sN4ftrtAYH7Av
Di4gWOma3XzjUvmPgklYjRzbIVYj87UY7v0zkovpoa2v4vxuwu77E/9DTrMReqWN
lZmmgEFCVjIu9dS3JrDe97p0ND2/y6d2XZelAV/trwd/sz1W2K+40zWlWpI27a+5
vQB2GYnvyOM4CVfwWR6ip4NQSWiSfFqxV98y/pzmvCJZEwXnWxaCvVmeuAuEBhdM
phYaaqGP3DuTmvp8UkXgS13Vd767AQKpEYay5XWdnL6qOc0Pye3V8aMPyN47nR7O
0bYBpBvmFQx/4KXNs4pQ3iDdrAlvyskiiPP+SSGYvhPnxLPvU7FDVfszrzHECh5v
Je27yEEr77eS0sCPLpTzyIPGgqKPESYesWKg2Lw8kIcXkHClLSAMI9IAeoBmfFAv
LR7Xj5u7cN4mMYITl7XZ
=ujal
-----END PGP SIGNATURE-----

--o74jroi6nporhp2j--
