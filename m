Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 6 Feb 2017 11:52:20 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: select SUNXI_CCU_MULT for sun5i
Message-ID: <20170206105220.zplxoeckwbfypwxx@lukather>
References: <20170202143417.3514875-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6l7rwhengg7h5nch"
In-Reply-To: <20170202143417.3514875-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>


--6l7rwhengg7h5nch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 03:33:57PM +0100, Arnd Bergmann wrote:
> We get a link error when CCU_MULT is not set with the
> newly added driver:
>=20
> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.17+0x4): undef=
ined reference to `ccu_mult_ops'
> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.5+0x4): undefi=
ned reference to `ccu_mult_ops'
>=20
> Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Mike, Stephen, can you apply it directly?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6l7rwhengg7h5nch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmFVkAAoJEBx+YmzsjxAg+5YP/0RfHtouLkJBYPXqMghHuPko
i5RcdWbE9lEdDzI7rOdUmP94/LHIya/2Wad/Int1cH96Xbu06whEY6xpn57ZNoXH
k6KZCSJy5T7Bgp7SX8S6RDuZc+kG91eRDJYi8wD9Wz8BEkwWLw1NCZxhOgijudFe
vONDwai66MKpZh7GJfUsiIFeV/7MAUuSPCRN+vyHtlCuZJsnP4gzssGUG0GT91Bd
nv9Mb3W5aG4MjulGhP5aMWUYZUuih+M4VITY66wr+DTFyQ4E+hf1jaHEaxQcdWG7
YiVKf++C1I31HyEyL/a/ccZVMMSyskHJQd84hA4TRmNF0XMzp91HKsa7cVdWY7t8
HFgB1uVxOBAw01E1D1IAcunhPoxjlaMxZOpXZYF4LaDA5EHsl8wh/FP6G773mgrA
eXwF/3zhsItHdzQW7SjmIuHbe4Aj2XG/ppblPK+V+on8BvSIelQPzR2G4SWr03st
gWpMPGE689J+vy5ejqK1jel5K8/tZgIJ4jnnchO7jZAkOLa3J9e1l3dwqxf20eyv
nYJ6CeBppMyoU+P7Td8ZZY7t1pAzXaMU+3WF2UYFHH0Q5OlNo0JrHC2YUjugHDjX
MJOOEbQWHunwLYw+8ZO+99Zv3M0eE1VJEJRJ4caBw/7Kgr2WOIvXrIamQNPY2cqK
BDNRxzJ/2cNNu0L/TPuM
=kRch
-----END PGP SIGNATURE-----

--6l7rwhengg7h5nch--
