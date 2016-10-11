Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 11 Oct 2016 14:50:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 9/9] arm64: dts: add Pine64 support
Message-ID: <20161011125019.GY3462@lukather>
References: <20161003080913.24197-1-maxime.ripard@free-electrons.com>
 <20161003080913.24197-10-maxime.ripard@free-electrons.com>
 <7483f6ea-3b59-46ca-fb31-f26af6ec8423@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xIVvx4XxNQcAboQ3"
In-Reply-To: <7483f6ea-3b59-46ca-fb31-f26af6ec8423@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--xIVvx4XxNQcAboQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2016 at 11:24:24AM +0100, Andre Przywara wrote:
> Hi Maxime,
>=20
> thanks for the respin!
>=20
> On 03/10/16 09:09, Maxime Ripard wrote:
> > From: Andre Przywara <andre.przywara@arm.com>
> >=20
> > The Pine64 is a cost-efficient development board based on the
> > Allwinner A64 SoC.
> > There are three models: the basic version with Fast Ethernet and
> > 512 MB of DRAM (Pine64) and two Pine64+ versions, which both
> > feature Gigabit Ethernet and additional connectors for touchscreens
> > and a camera. Or as my son put it: "Those are smaller and these are
> > missing." ;-)
> > The two Pine64+ models just differ in the amount of DRAM
> > (1GB vs. 2GB). Since U-Boot will figure out the right size for us and
> > patches the DT accordingly we just need to provide one DT for the
> > Pine64+.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > [Maxime: Removed the common DTSI and include directly the pine64 DTS]
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm64/boot/dts/Makefile                       |  1 +
> >  arch/arm64/boot/dts/allwinner/Makefile             |  5 ++
> >  .../boot/dts/allwinner/sun50i-a64-pine64-plus.dts  | 50 +++++++++++
> >  .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 74 ++++++++++++++=
+++
> >  include/dt-bindings/reset/sun50i-a64-ccu.h         | 97 +++++++++++---=
--------
>=20
> Shouldn't the changes in this file be merged into patch 6/9?

Oops, yeah, of course.

> > diff --git a/include/dt-bindings/reset/sun50i-a64-ccu.h b/include/dt-bi=
ndings/reset/sun50i-a64-ccu.h
> > index e61fac294d73..db60b29ddb11 100644
> > --- a/include/dt-bindings/reset/sun50i-a64-ccu.h
> > +++ b/include/dt-bindings/reset/sun50i-a64-ccu.h
> > @@ -46,52 +46,53 @@
> >  #define RST_USB_PHY0		0
> >  #define RST_USB_PHY1		1
> >  #define RST_USB_HSIC		2
> > -#define RST_MBUS		3
> ....
> > +#define RST_DRAM		3
> > +#define RST_MBUS		4
>=20
> So I take it that this kind of changes will not happen anymore once the
> DT has been merged?
> And this numbering is arbitrary and not connected to some hardware
> bits/register addresses at all?
> And in case we find some missing bits later we will just queue them at
> the end?

Your constant reminding of that on all the patches is getting
old. Yes, this is what we agreed on two releases ago. And since
there's already some very real bugs that can't be fixed because of
that, there's really nothing to be proud of.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xIVvx4XxNQcAboQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX/OALAAoJEBx+YmzsjxAgzqAP/04k4ytKkwWjzNKjLRgZjPTf
WtwEvWCE1w10+XTxbmFGEwYXl3Wo5T79s8BDMaPbIzSkJ+eXoo3zxa7h/aKzwuFL
OpOI9pRWqwXL8x7Mcv3rL2nNDGW7xTZ1mXR3z6blq7gMBa5MGCr78YHEDyB9hd5h
pgF06Db4rdH4xWUM2Wcv9ECxapV37CSO0gcAevr4nJ3MkKpjZMudq3J2WUHP0FGX
QG0FuKZptX1zpNxOiOw6w3DvOrcoJCFddH3cZxFMLlpC1SBgwgD4dIdMx4oeisy5
l4xt0v85AKeLM+0huiL5TOMDSE6fxhjW77ssou19P7AF7gvT0j8eQ12GYC5sQXmu
5Kv0Nhggj4R9Bh0fSHTvHwUPZHZBke44xNBdk/huIsWl9kZ9nBVnsqhJfiaZlRHh
ATRN8lv0y/7ZJeSlLSnK0lKxCwRxH0QLRCSk07mzjJOo7m/Z5XA0xXZdUBPYr0BD
ysUvJHnag3CStZkDh6lKm5K/b6UdeYRlgFYPT3tQt/vbhpaQs+UquV+PP5ExSF0B
Cz8/JLYWEbTUxK+MVTlMjcVO/ErxV7LgvOfWZdW1c2bIzhIuwTX4DZzl6+x01X2D
GW6MK/OWAQQWAjwzrc+7i6AxiCB7D95MbVxaJAmfuP/EU2re+D2eRQDyUfUP9DMG
DdXqJzsmdzQ8yMYDkwa0
=GAve
-----END PGP SIGNATURE-----

--xIVvx4XxNQcAboQ3--
