Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 14 Feb 2017 10:39:48 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: sunxi-ng: gate: Support common pre-dividers
Message-ID: <20170214093948.d46xkfunpuj3nn7l@lukather>
References: <20170214033526.16977-1-wens@csie.org>
 <20170214033526.16977-3-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rb7bp35wck23qqme"
In-Reply-To: <20170214033526.16977-3-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--rb7bp35wck23qqme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 11:35:23AM +0800, Chen-Yu Tsai wrote:
> Some clock gates have a pre-divider between the source input and the
> gate itself. A notable example is the HSIC 12 MHz clock found on the
> A83T, which has the 24 MHz main oscillator as its input, and a /2
> pre-divider.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rb7bp35wck23qqme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYotBgAAoJEBx+YmzsjxAgZTQQAKx29QIN9m2BZs1iob9W5pPc
X0LNKs4ZMtjKt1NL5J3l4njtt3SsKqPBxWRv5tw128HqYAEa6LFJ8dilpGCIPygq
6L2QJ5X1FzFYs5nBQiHdOGSURsVXYtbvwmaK2EohPAxtUoq4adt5cR7d+ImrRQZG
C9qd7BL69bnEgq1xmjz29sz8lkYoSciL9GICedl8Wd7bAYAg19Jq1bn6Aw4gBqux
o2MjnMw3Pek++XzwW1YEUlO++wCTmpAuW2Qc63Xi7KaQPjFG6ocPK+QPpkpC2L6Y
HbhevneVLvp1QtzoU7gbEY6IDUGYS28TRn8szh8Kyqu5ME/KR7WuKTXlcJA8eOyE
4SBQqjEuWyARgN9zmThn9GGhvW8EJ+zkNtuVBbiM3t8RcLl0Nw3o9iSUPsaxc/j+
z0Zu4e0h7aTa+BPyCI0bU0CozLUFceWRwuxY5eGitMp/OdmSfS/Th0ROSXh7txkH
tFGZ0tz8vLAyDvR4f2YbzS3JM/yj40vECpgEyLwMuQcRlx/LTVDWIsPUSKt5Eiyp
PDvek5M+bADCq4EtPBc0+wukWkAaDJsNyoKfx1Tkncczan7EezxyNu2WUiliKqej
y+uHFQT7p1RyzDwDojOEISMxXiIlaAGo2yUI7qVZadSZ0uel+zYor3I+MI/GFmGS
vaCIoOg2wGiob45csSjI
=ZiG1
-----END PGP SIGNATURE-----

--rb7bp35wck23qqme--
