Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 29 Jun 2017 13:53:57 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: Andre Przywara <andre.przywara@arm.com>, plaes@plaes.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 5/6] ARM: sun7i: Convert to CCU
Message-ID: <20170629115357.sxs3tjmhfncfvtpj@flea>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
 <ac9cc7f0a67d3e9e5edd0d5eb21cc60820c2b457.1498422562.git-series.plaes@plaes.org>
 <a08cbe0d-dad4-7d0c-9845-452e0d6e3f03@arm.com>
 <20170629132812.52ce1214d6967b82da52123e@bidouilliste.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="peq7wjbm7zxjedk7"
In-Reply-To: <20170629132812.52ce1214d6967b82da52123e@bidouilliste.com>
List-ID: <linux-clk.vger.kernel.org>


--peq7wjbm7zxjedk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2017 at 01:28:12PM +0200, Emmanuel Vadot wrote:
> On Thu, 29 Jun 2017 11:57:05 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
>=20
> > Hi,
> >=20
> > On 25/06/17 21:45, Priit Laes wrote:
> > > Convert sun7i-a20.dtsi to new CCU driver.
> >=20
> > I know that some people hat^Wget annoyed by me asking this, but anyway:
> >=20
> > Why do we actually need this?
>=20
>  No. I can understand the need for clkng/sunxi-ng/whatever you call it,
> it's not that bad (but see below) to add a new SoC on FreeBSD now that
> I've added the framework, but breaking old SoC that were perfectly fine
> isn't acceptable.

We haven't broken it.

>  It also mean that, on FreeBSD, we still have patches for sun7i dts to
> add hdmi support (which we have since a year or so) because last time
> someone (I think plaes) wanted to add clock node for it, it was said
> that it was needed to move to clkng first.

This is a circular argument. It wouldn't have been the case with
sunxi-ng, since we would have had that clock from the start...

> > This ultimately makes the DT incompatible with older kernels (as
> > actually shipped by distros today).
>=20
>  Yes, right now sun5i support is broken in FreeBSD because I couldn't
> find the time to make a driver for it yet.

Probably because you merged new DTs without updating the code. That
has nothing to do with backward compatibility, the old DT would still
work fine.

> > So if we for instance use UEFI boot or otherwise just use "one golden
> > DT" to drive all kernels (like using the DT from U-Boot), we now don't
> > have one good DT that fits all. This is really a showstopper for boards
> > which ship a DT in firmware (in SPI flash, for instance, or on some eMM=
C).
> > So:
> > - Do we actually need to change the .dtsi? The old .dtsi should still w=
ork.
> > - Is there anything that the new and fancy clocks gives us over the
> > existing clocks? If yes, that should be a  stated in the commit message
> > or cover letter.
> > - Why do we change the clocks for those older SoCs in the first place?
> > Can't we just keep on using what worked for years? I think we really
> > can't remove the old code anyway.
> >=20
> > The new clock driver moves information from the DT into the kernel. That
> > means it is no longer available for a DT consumer and the SoC details
> > (which clocks is located where, for instance), have to be replicated to
> > other DT users (U-Boot, *BSD, you-name-it). We already came across this
> > issue when looking at converting U-Boot over to use DT clocks.
> > Also it ultimately requires kernel changes for each new SoC, even if it
> > only differs in some detail which could be perfectly modelled in DT
> > (think of H3 vs. H5).
>=20
>  The last point is very interesting, before adding a new Allwinner SoC
> was just a matter of maybe handling one/two new clocks (at least to
> have something that 'just boots'), now it's a whole new big boring file
> to write while reading datasheet.

You can definitely do that with sunxi-ng bindings if you want. You
just have to populate only the IDs that are of interest to you.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--peq7wjbm7zxjedk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZVOpVAAoJEBx+YmzsjxAgMcEP/juatuVT29xQPy4FEJ+D2snk
gNNW9WVQwDcsbSC9qJbC6etbqMIb81lRT0z9/zxhN9a7MmRQrSvConSXpi0MbT2/
1BLWS3puckMzuOd+g9MRwAJXI5DnWmU0q4wD98JFt53qTeyH44ZgcieuI6HFKapY
mblx5Ftqb8dIcHaesHzMjYKKhrJ9hDNK+GospmcTij+e2fUwZvU08gN8SgLzURUG
INtGdc7WNph7V2RBh0abSMibZ599g02/8eq1J7bUQu9xB+lZMziXYX+ymrd8Iwkl
epy5NEXSrqAJEz5csRyl79LRrPv3+8ndiEBPhUzBe1/bSQNeAJRwnMAlEetHIZKe
mFDhDvnXeW9jHwO5jkwgLBzmjWH9gE+3dNOO6aDqkD54jmeRR1G67+v06ogTOML0
057pwl3IhubCqlZjMI8i8j10SEUNkxdhk5acF7wf6TW7P7XC8W4y8oJAO0YeGJKQ
4380NSjwFf9CEOlVwg4W6R5yvuX50cfnf5yMZX8ZM0CAG/zJsxjyuqE/+YMob1UN
uONfpHKnBNVekTOiOhAnadaNIfWROgTwpWACLE6nGILLCObex1BwPFmFUAc+9dT+
cqsmXa0Ej9S9Z3FXMuuV4rrcXnJNg1rUX+PRfJX/U1wzGYWOrSHrt0ahyWK769Cd
qQDNAMQzP6wgXDw+PC2z
=i9Iv
-----END PGP SIGNATURE-----

--peq7wjbm7zxjedk7--
