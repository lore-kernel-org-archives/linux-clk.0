Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 17 Jan 2017 17:44:15 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	wens@csie.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	mark.rutland@arm.com, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
	thomas.petazzoni@free-electrons.com,
	alexandre.belloni@free-electrons.com
Subject: Re: [PATCH v2 02/10] clk: ccu-sun8i-a33: Add CLK_SET_RATE_PARENT to
 ac-dig
Message-ID: <20170117164415.4qseqbqkdx3e6bvt@lukather>
References: <20170117140230.23142-1-mylene.josserand@free-electrons.com>
 <20170117140230.23142-3-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pmqdesejeydvn5wu"
In-Reply-To: <20170117140230.23142-3-mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--pmqdesejeydvn5wu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 17, 2017 at 03:02:22PM +0100, Myl=E8ne Josserand wrote:
> The audio DAI needs to set the clock rates of the ac-dig clock.
> To make it possible, the parent PLL audio clock rates should
> also be changed. This is possible via "CLK_SET_RATE_PARENT" flag.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>

Please make sure to look at the prefixes usually used in the commit
titles of the area you're working on. In this case that would have
been "clk: sunxi-ng:". I fixed it, and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pmqdesejeydvn5wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfknfAAoJEBx+YmzsjxAgod0P/iLJ4CE330NecTUFveMfjllK
4vMqgy3dk0q4bHjEkwf08C5leqCmNCc0w34eXMp3NbCWn2xxvGlsRvBgvXK1Gykj
Y9Fj4Mo1mWENQjgePb1HG8uNfxb77nsq5txtBHEukZXJTyCgoQ6KeroFX8bAkcMX
lwQngZ4WDNOpB7MqINSyFQu8jU+PQU3pai0hxnI5mZeqkpSLhYS/tDBSzlr8qFwv
xPDqX41KQKPhxpUBMF0D3d5auZS/fL2cg0ny5VXFdmMlbPzvsEduEkP5twBEQP4D
PZlMYtoZ9ynk1Nv6SSw8GTCblHRGSDPaXhSCz3zw8RMoWrNZ/Jt5cUlPm6WjMz2x
okrDyZxbydkXmQMTHRyJqzEIfUEtP3bOXabdqgWuai7KHAdDn6Bk9+GmKfKFqt+a
VpHRyoD80homLb/T7EMO5Ce8CRlw2KDrB4q0AwrLoYtCVs3GaimK4LXJG7myXDMr
bzqjZC98zY9vIFmUQ8vramSKzSvG/+EfLt2ATTehWwXzDCC5u6hMJrR3fJi69v7/
UzTg9YtcZ6dV4PwpaRAQkoDjvnxCEL4/LW59vKmFg4R+lWdkHooRkFFb5fL9+qwM
BSrWlgsYBw5itfEwrK6frU14yLwkuFL+gAn8aLSSjhIXx5zC3FWIGdPurd95VYeM
Xi/mRrfsbCwHibR/bfWY
=c6v5
-----END PGP SIGNATURE-----

--pmqdesejeydvn5wu--
