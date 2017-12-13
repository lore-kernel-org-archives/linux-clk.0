Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 13 Dec 2017 14:44:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Priit Laes <plaes@plaes.org>, Chen-Yu Tsai <wens@csie.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
	Russell King <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [linux-sunxi] [PATCH v2 3/6] ARM: sun4i: Convert to CCU
Message-ID: <20171213134446.6q3iyajqtdg7px2z@flea.lan>
References: <cover.a58841efb571d44013658505f3fa140536a89d1c.1490545262.git-series.plaes@plaes.org>
 <4357a69da97f46a324eec4c766f4bc9d9e7733ff.1490545262.git-series.plaes@plaes.org>
 <CAOi56cUjqjcZRz6VSwUWcrW=4RQyqyZHtm1vuM3HT2ypdPJ78g@mail.gmail.com>
 <20171212172635.2utwz3koyo5iwglt@plaes.org>
 <CAOi56cUeRrKQnJ-akJPB160-60aBzy64bDgFeoqMpHRJSCnDeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o4ghp3lngrezczob"
In-Reply-To: <CAOi56cUeRrKQnJ-akJPB160-60aBzy64bDgFeoqMpHRJSCnDeQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--o4ghp3lngrezczob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2017 at 01:24:52PM -0800, Kevin Hilman wrote:
> On Tue, Dec 12, 2017 at 9:26 AM, Priit Laes <plaes@plaes.org> wrote:
> > On Mon, Dec 11, 2017 at 02:22:30PM -0800, Kevin Hilman wrote:
> >> On Sun, Mar 26, 2017 at 10:20 AM, Priit Laes <plaes@plaes.org> wrote:
> >> > Convert sun4i-a10.dtsi to new CCU driver.
> >> >
> >> > Signed-off-by: Priit Laes <plaes@plaes.org>
> >>
> >> I finally got around to bisecting a mainline boot failure on
> >> sun4i-a10-cubieboard that's been happening for quite a while.  Based
> >> on on kernelci.org, it showed up sometime during the v4.15 merge
> >> window[1].  It bisected down to this commit (in mainline as commit
> >> 41193869f2bdb585ce09bfdd16d9482aadd560ad).
> >>
> >> When it fails, there is no output on the serial console, so I don't
> >> know exactly how it's failing, just that it no longer boots.
> >
> > We tried out latest 4.15 with various compilers and it works:
> > - gcc version 7.1.1 20170622 (Red Hat Cross 7.1.1-3) (GCC) - A10 Gemei =
G9 tablet
> > - gcc 7.2.0-debian - A10 Cubieboard
>=20
> And you can reproduce the bug with gcc5 or gcc6?
>=20
> Very strange that a DT only patch would cause a gcc related regression
> and if it does, it should be investigated.  I don't think requiring
> gcc7 is an appropriate solution.
>=20
> @Chen-Yu, @Maxime: are you guys OK with requiring gcc7 for working
> upstream boot for A10?

I'd rather not set that kind of constraints and fix the issue instead.

Priit, can you test with an older compiler?
You can find one here:
http://toolchains.free-electrons.com/

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--o4ghp3lngrezczob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloxLsoACgkQ0rTAlCFN
r3TahA/7BetxE9ShT3xOHs77ekpKHgm+Xz33fNf37j7jHe6rKHY+t8k0mihmErPC
dgdkavcaGsloveHx2shWUa1sL9HoEoSeR88EVwGsnokfoel+dNqRQDeKBx2hb6wC
G3WsTHrFqhC10334woIhJmWjE7K5vmYQAPCY2YxFpdkPtRXhs0o7O3Nk9hQdD1hz
xYCp072ht7T0btZMBtey+e+4oYnWCc032vtZYEmQSdLUkgvr17an12dGvUNeewW2
varHbQkbADiAa4Kspv1nuBos/dpmspACvOr+jHKRH8obPvu09aZuYId+yPDfJ1n8
y3ox5BgykdbEhNPKilAstcf1Bd8N7Nc/zocUXmU0W0KQLRYMLht64gMpFMQv0YXg
4ENYjJb7HVi6PQ0z36yoSUL74mSvooN1J0ooRiYq1wZyY4HQw+WeQ/8O9+XUjIIZ
Z4KA0lVdzGePAundbrMQhbDijYXoCJK/RCyfu9r16Ef86hD1tpEO9XZKN6LYb48p
Q2//BBXOjJuyVHp4dUaEEXElEcz24X6879KNK+zjCjYtuTGch83edR6gK1kPzBVQ
EFZnoU6Yfa9NKt7ZmFcfDQsbcY28e8oVPKz34Un8CSI6sgb8DOVkETX/EDDXNUYc
hJx0cKA8LVdoyH95WpNjg+op3Xz2QvcJpAswuiCvNrdFoEdi8Yo=
=m0Mu
-----END PGP SIGNATURE-----

--o4ghp3lngrezczob--
