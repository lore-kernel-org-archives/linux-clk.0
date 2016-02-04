Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Feb 2016 13:13:48 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, heiko@sntech.de,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 3/5] clk: sunxi: convert current clocks registration to
 CLK_OF_DECLARE
Message-ID: <20160204121348.GF4270@lukather>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-4-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
In-Reply-To: <1454402834-6385-4-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 09:47:12AM +0100, Maxime Ripard wrote:
> The current clock registration and protection code has a few drawbacks, t=
he
> two main ones being that we create a lot of orphans clock in the
> registration phase, which will be troublesome when we will start being le=
ss
> relaxed about them.
>=20
> The protection code also relies on clkdev, which we don't really use but
> for this particular case.
>=20
> Fix both at the same time by moving everyone to the CLK_OF_DECLARE that
> will probe our clock tree in the right and thus avoid orphans, and by
> protecting directly the clock returned by our registration function.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Fixed the issue reported by Andre, and applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWs0B7AAoJEBx+YmzsjxAgmbgP/0hwqQE33MwyRNmMn36kSsKn
sOUrI1t5FxLelTmyXVZObmpBb04NkLas/nteZd0smRWpDi7X0dsCS/c+Ue5kjFnV
DIuUKZQHl+IwJduq3WYx2vjwTF7DchEwykWYyJ53q822mpIQgEpkRLC4hQSKy3my
mrfxBgQvB3iN9RldierbwRyGRL6Mn+m/z8W0kZBb/wpg5wlm11AiUYXjdnA8YtBU
s7xFxTNT+vq74WJJdBmtqgZhsOenmCvRMZbMqzWHDmm19+sed+nIUm/lHNa9vaAS
HEuGNSNibRMyV1VbUREGcDryRecdjr18N0Fq1k1d3loQxEIqVWPbj9+K3eS8/yKL
330vPgOI2b6rs7xle1V5rLQirabjazu4mt42fdvRnWNBctbBiLLlZeVcEhBBLn49
XnYklzW6lip74CTDnmk4J4Jlaoi3dBykep4GxqGdxXxLHbgyhbKvcSKJtg7B1YGq
bvpiwuwqK3GyNog97GvnQWgZdLfvA1I4EYG3QpJdD1DAxiv8embhrXjnXatCLiDC
lnVDfX21zmVjLP5S52ookWKlPgJoI3ux5jO7Fyyu/sfZaoZSCRDVXUkzkhsRqflS
bgYQG50TzSZLu9eSmY8YFW6pOND1iRuOuK6yu6wLjBehTyUtdYDK2joIgxwnnXhg
OQF98Vp5BeR1u04GLW/n
=G2Hz
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--
