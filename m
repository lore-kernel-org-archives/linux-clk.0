Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 24 Nov 2015 10:32:02 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Sugar Wu <shugelinux@gmail.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, atx@atx.name,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, gpatchesrdh@mveas.com,
	mturquette@linaro.org, hdegoede@redhat.com, sboyd@codeaurora.org,
	mturquette@baylibre.com, emilio@elopez.com.ar,
	linux@arm.linux.org.uk, edubezval@gmail.com, rui.zhang@intel.com,
	wens@csie.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk,
	mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
Subject: Re: [linux-sunxi] Re: [PATCH v2 1/5] ARM: dts: sun8i: Add SID node
Message-ID: <20151124093202.GL32142@lukather>
References: <cover.1448263428.git.atx@atx.name>
 <b897b1c8741c8a871163b84d01b480f99329536d.1448263428.git.atx@atx.name>
 <20151123124356.GW32142@lukather>
 <a7d4e538-db64-476d-b5de-5222419229a2@googlegroups.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9RXjJcDGNuBviZqz"
In-Reply-To: <a7d4e538-db64-476d-b5de-5222419229a2@googlegroups.com>
List-ID: <linux-clk.vger.kernel.org>


--9RXjJcDGNuBviZqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2015 at 10:51:15PM -0800, Sugar Wu wrote:
> On Monday, November 23, 2015 at 8:43:59 PM UTC+8, Maxime Ripard wrote:
> >
> > Hi,=20
> >
> > On Mon, Nov 23, 2015 at 09:02:48AM +0100, Josef Gajdusek wrote:=20
> > > Add a node describing the Security ID memory to the=20
> > > Allwinner H3 .dtsi file.=20
> > >=20
> > > Signed-off-by: Josef Gajdusek <a...@atx.name <javascript:>>=20
> > > ---=20
> > >  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++=20
> > >  1 file changed, 7 insertions(+)=20
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi=20
> > b/arch/arm/boot/dts/sun8i-h3.dtsi=20
> > > index 0faa38a..58de718 100644=20
> > > --- a/arch/arm/boot/dts/sun8i-h3.dtsi=20
> > > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi=20
> > > @@ -359,6 +359,13 @@=20
> > >                          #size-cells =3D <0>;=20
> > >                  };=20
> > >  =20
> > > +                sid: eeprom@01c14000 {=20
> > > +                        compatible =3D "allwinner,sun4i-a10-sid";=20
> > > +                        reg =3D <0x01c14000 0x400>;=20
> >
> > The datasheet says it's 256 bytes wide, while the size here is of 1kB,=
=20
> > is it intentional?=20
>=20
> SID memory map is 0x01c14000 ~ 0x01c143FF, include 2048bits efuse space.
> H3 efuse space is SID_SRAM, its range is  0x01c14200 ~ +0x100.

Interesting, what is below the 0x200 registers?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--9RXjJcDGNuBviZqz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWVC6SAAoJEBx+YmzsjxAgwTAP/R45EtEM0V4qyz9Xbt7PVG4p
lgawU8F23DNUZm1piP9JGY/MYxUGTS1E2N3kzAnvfCXUTw9+jns57qQrOIuYTmwQ
td8D/Cnvm7xAeFCatj4k/Gs3h5YnbJ0WA8098p+0MxOZI/0VxlMALaNVhPd32piJ
+5mBPnV6vc7yjq7tP7GMwpyTgn6jeyLXRyTx8bCrQx99Bd2E/pSK4C51HP4NZGTq
S/zD6UI0ddcTIqp3/h7R/stfeAPMfG2U76xIxgIO4Ee7hBpt7n3dKLjoxQEXR9xs
d7pXouMv4qt0Dp8FQOKSO2KR/13AptiwIXAiv8pKeyvJx9jehmDBPS3zWcJRKY8F
tgMX+yw0qfm0vGUbM71MaZuuQ6p83ubxzjCXOHVeXJzpxMDTjTmjfuz+BRfijU2T
d4xA0IGY9DTFCI2tU62QZWghAXV20oNbCZfBOn2meuIw5+TR1iOV25sI46WYci+9
g3qSWeGnRXUovCSEJrPSPWGjKT29z2LoOUXZ6Gy1jHwjF+h9WelL/c0CIq8K6VIA
BBzfRa3ny7qC/i8xQRGXIXSbS+DuJB51/9r++AcJQtq9QcFnE/PDN46RvfE6fBU7
e8QI2wcWw5ff+XoZGBaDFWohL5uedLf6en883AnWbhLP7uZ2Rnh2Si6aTEnH7KVI
tuziPbgkbQid7tpiEfj5
=bhP/
-----END PGP SIGNATURE-----

--9RXjJcDGNuBviZqz--
