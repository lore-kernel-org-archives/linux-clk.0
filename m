Return-Path: <maxime.ripard@bootlin.com>
Date: Wed, 5 Sep 2018 16:49:29 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v4 4/4] drm/sun4i: Enable DesignWare HDMI for SUN50I
Message-ID: <20180905144929.67kmbuef2ae6fm23@flea>
References: <20180904163609.10171-1-jagan@amarulasolutions.com>
 <20180904163609.10171-4-jagan@amarulasolutions.com>
 <20180905070819.gisznpkvvuqire7c@flea>
 <CAMty3ZAzjSwq86BwB8O_7DrT0jrhn3ByzN34dY37pF3ZsAZ6uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q6f2ab7olekwmy4f"
In-Reply-To: <CAMty3ZAzjSwq86BwB8O_7DrT0jrhn3ByzN34dY37pF3ZsAZ6uA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--q6f2ab7olekwmy4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 01:54:42PM +0530, Jagan Teki wrote:
> On Wed, Sep 5, 2018 at 12:38 PM, Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> > On Tue, Sep 04, 2018 at 10:06:09PM +0530, Jagan Teki wrote:
> >> Allwinner SUN50I are now using DesignWare HDMI so enable
> >> them as default. This can build DRM_SUN8I_DW_HDMI as module
> >> since DRM in arm64 has module.
> >>
> >> Making this as defult to SUN8I, may cause an issue while
> >> loading since arm32 DRM built as static.
> >
> > Uh? Why? We should fix this instead of working around it.
>=20
> I didn't dig further on this. Since ARM64 has is fine with it both
> (module and static) may be we can take this.

No, this build breakage needs to be (reported and) addressed first.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--q6f2ab7olekwmy4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluP7PgACgkQ0rTAlCFN
r3T5kw/2Od43n9hafoNg1tqco9mclwfhV/jFpSOtIcn5up/zPCDuTmICAvcrL4eR
Lp6FsVGmWDfKgVAFzbN9okOeOBb4q9UnFdxdM+kF/6Wimj6rfXXPGPZMRvrCkTe1
84jtjJqnQh7tIAA4rvnqesGrXLhGJIwK0h7j9/tuG28Yub/mVXjbHF4F8HkAeSVP
u6PCWJjWZ9UIk55hs7xcWfsojrNuue3+fkvmgZJ1bfgQ0XUQXC2bDCvU2QU6JM1h
7x2bSVoBS4mKbdoYFUmP65gqLu5jwk52ZVrU2quvTPemebEv/jhziRbPOKokNZpm
QCPkaDHZ+GGvr0yChUAhY8B2s/N7QXIyP296JZmXrzDHElri63VLWzjU2G8F80nt
wmvhRaXCyQzZHnTypR+s6OBBqn1K2Nd67zmtiiP+m0CoTLOuxj5trf7CJ/jRISR8
wIGExrVXMyWtXD+sq4tqYFyen7hitlir+suMHf5ebFg36usO4MNPfSQHSQw0QwcH
3ES/svV/xVP73hCmU6Fsd03R0pieFuqh7tXhZEPOdDbY0z4VyOQ0ZuvDL4WaS3Qd
s2xRXzjtCWyFBSIHTK9fslj8MeR5Twj9o52AANPXVzOr+Kr4ulxYypANuRwImWVz
xtYmjxMdYqY8MasOiHCCkCYzeX84xhlkbpcIf9g+H3K/8vS1Mg==
=Q3K4
-----END PGP SIGNATURE-----

--q6f2ab7olekwmy4f--
