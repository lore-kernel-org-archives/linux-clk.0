Return-Path: <broonie@sirena.org.uk>
Date: Wed, 27 Apr 2016 17:41:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Wadim Egorov <w.egorov@phytec.de>, linux-rockchip@lists.infradead.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	a.zummo@towertech.it, pawel.moll@arm.com,
	rtc-linux@googlegroups.com, ijc+devicetree@hellion.org.uk,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	lgirdwood@gmail.com, alexandre.belloni@free-electrons.com,
	dianders@chromium.org, galak@codeaurora.org, zyw@rock-chips.com,
	lee.jones@linaro.org, linux-clk@vger.kernel.org
Message-ID: <20160427164114.GD3217@sirena.org.uk>
References: <E1aukkg-0007km-6s@debutante>
 <57205DC2.7070506@phytec.de>
 <20160427135048.GQ3217@sirena.org.uk>
 <13413437.Ipf2eOczfj@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A5Bs66j+yxxuoNFj"
In-Reply-To: <13413437.Ipf2eOczfj@diego>
Subject: Re: Applied "regulator: rk808: remove linear range definitions with
 a single range" to the regulator tree
List-ID: <linux-clk.vger.kernel.org>


--A5Bs66j+yxxuoNFj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 03:56:56PM +0200, Heiko St=FCbner wrote:
> Am Mittwoch, 27. April 2016, 14:50:48 schrieb Mark Brown:

> > Any ETA on a fix or should I revert?

> I guess
> 	[PATCH v4 1/7] regulator: rk808: Add rk808_reg_ops_ranges for LDO3
> from yesterday [0] might be the fix? At least it fits Wadim's description=
 above=20
> but I haven't had time to test it yet.

Oh, probably yeah.  It's easier if fixes are pulled out of serieses.

--A5Bs66j+yxxuoNFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIOupAAoJECTWi3JdVIfQ1ggH/jyCbSBG8TE/QrmwRhZYcSQz
K7uuKzfMUzBYn/TEXRrgE6sJdIb661aYpiGP9if/M3q98vytdidRcrZo8xkrXZpW
cXVRPHMSKi2kuit39nF2sSyVwtaWcoyicyLm/WhzaRYG6mRHespMixK4syf4Gu5z
ODwmOn5JzoGzdM+pwwx0yY6b1+xLnLP5tTdPlkSvCH9rHkk82MtAh3pKtg0hCcCh
kJN3a8x13ZU74qUK11opGcvP2TZ+0Gf5uX/UdmK5k7mfFs7UFGewdDx63tSwKu7L
QAHkmXcg5Xpwe38FCoglKe7DjrXjOBJACRi2UIHwvqFJiatnssYLFusXsWOk7MU=
=1PPO
-----END PGP SIGNATURE-----

--A5Bs66j+yxxuoNFj--
