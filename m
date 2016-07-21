Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 21 Jul 2016 11:51:08 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	open list <linux-kernel@vger.kernel.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Message-ID: <20160721095108.GJ5993@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN519qCC4CN1mUcX"
In-Reply-To: <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--cN519qCC4CN1mUcX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 03:27:56PM +0200, Jean-Francois Moine wrote:
> On Fri, 15 Jul 2016 12:38:54 +0200
> Ond=C5=99ej Jirman <megous@megous.com> wrote:
>=20
> > > If so, then yes, trying to switch to the 24MHz oscillator before
> > > applying the factors, and then switching back when the PLL is stable
> > > would be a nice solution.
> > >=20
> > > I just checked, and all the SoCs we've had so far have that
> > > possibility, so if it works, for now, I'd like to stick to that.
> >=20
> > It would need to be tested. U-boot does the change only once, while the
> > kernel would be doing it all the time and between various frequencies
> > and PLL settings. So the issues may show up with this solution too.
>=20
> I don't think this is a good idea: the CPU clock may be changed at any
> time with the CPUFreq governor. I don't see the system moving from
> 1008MHz to 24MHz and then to 1200MHz when some computation is needed!

It wouldn't happen that often. The sampling rate for the governor is
1000 times the latency, so, at most, 0.1% of the time would be spent
at 24MHz.

And if you're really concerned about performances, you won't enable
cpufreq anyway.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cN519qCC4CN1mUcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkJsMAAoJEBx+YmzsjxAgpnsP/2Y+BwDtxpeO0WM//Fdx5OTJ
UUfKZ9grwq1G+MODQwJRSGAuSfJ/1jOt2FRuDyXy9LWoosDvGEdUN//ZYHqMps5I
YdTy4TWt1+Zb5phVNnHH4h3Vhim2lp98EF0ExUne+gsNUUnmM/XC+JFpqu+H1gcI
IjIkqeSfDouagPAya56gOpD9szoMYfEub7+S9yZg8VzXpT5KsgTWZpGv5Iy3TjLX
l4xkb5XR/wvuF8yzVAF819tx3BJ/S/e2R9iSlJMgcfDgoqWntKqLMGXAUedGnCAI
iDAdW4ODZd2JHRHsyN9WTHnwQA6Gt4Bn02ddgO1uQC3GXK2gFfcvfvLfWmL7lVq5
re6dKca1agctgpF5PoaID2Di6ONf8NHuA2i+Ja9goiADMOpzFWnkemQ9NRPd3YXA
laPcEEcVZdBq8PAGwJVBX1EJbQhTsZtkPp1U3kKoRgy1RAZki/ba3JdiI5e9PX8Q
2NvG+7qaFS5d8oTdNL3qv/XgOp7xgVDWaunxQ9dPnqIFwd0AtAzcKOXfh8CZJdXC
7NVcTxrWASkD93LJ8pMycf2J9p+dMoDtZ2YmQVGLynYP4K0ilqmtfa4UQVB+wm1B
9UBemYPI7Xkq9Ctvmn1yb7RrnjjVkLzt4P+wYdIhncDJuQdCEeiRMhBmwPFhRvIT
D+j+g4ngmve0xuJeuXlf
=FHNS
-----END PGP SIGNATURE-----

--cN519qCC4CN1mUcX--
