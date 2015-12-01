Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 1 Dec 2015 09:41:17 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Shuge <shugelinux@gmail.com>
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
Message-ID: <20151201084117.GB29263@lukather>
References: <cover.1448263428.git.atx@atx.name>
 <b897b1c8741c8a871163b84d01b480f99329536d.1448263428.git.atx@atx.name>
 <20151123124356.GW32142@lukather>
 <a7d4e538-db64-476d-b5de-5222419229a2@googlegroups.com>
 <20151124093202.GL32142@lukather>
 <56550D70.6060109@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
In-Reply-To: <56550D70.6060109@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 25, 2015 at 09:22:56AM +0800, Shuge wrote:
> On Monday, November 23, 2015 at 17:32 UTC+8, Maxime Ripard wrote:
> > On Mon, Nov 23, 2015 at 10:51:15PM -0800, Sugar Wu wrote:
> >> On Monday, November 23, 2015 at 8:43:59 PM UTC+8, Maxime Ripard wrote:
> >>>
> >>> Hi,=20
> >>>
> >>> On Mon, Nov 23, 2015 at 09:02:48AM +0100, Josef Gajdusek wrote:=20
> >>>> Add a node describing the Security ID memory to the=20
> >>>> Allwinner H3 .dtsi file.=20
> >>>>
> >>>> Signed-off-by: Josef Gajdusek <a...@atx.name <javascript:>>=20
> >>>> ---=20
> >>>>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++=20
> >>>>  1 file changed, 7 insertions(+)=20
> >>>>
> >>>> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi=20
> >>> b/arch/arm/boot/dts/sun8i-h3.dtsi=20
> >>>> index 0faa38a..58de718 100644=20
> >>>> --- a/arch/arm/boot/dts/sun8i-h3.dtsi=20
> >>>> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi=20
> >>>> @@ -359,6 +359,13 @@=20
> >>>>                          #size-cells =3D <0>;=20
> >>>>                  };=20
> >>>>  =20
> >>>> +                sid: eeprom@01c14000 {=20
> >>>> +                        compatible =3D "allwinner,sun4i-a10-sid";=
=20
> >>>> +                        reg =3D <0x01c14000 0x400>;=20
> >>>
> >>> The datasheet says it's 256 bytes wide, while the size here is of 1kB=
,=20
> >>> is it intentional?=20
> >>
> >> SID memory map is 0x01c14000 ~ 0x01c143FF, include 2048bits efuse spac=
e.
> >> H3 efuse space is SID_SRAM, its range is  0x01c14200 ~ +0x100.
> >=20
> > Interesting, what is below the 0x200 registers?
> >
> Some control register about SID.
> offset: 0x40  SID Program/Read Control Register
> offset: 0x50  SID Program Key Value Register
> offset: 0x60  SID Read Key Value Register
> offset: 0x70  \
> offset: 0x80  SJTAG Attribute 0 Register
> offset: 0x84  SJTAG Attribute 1 Register
> offset: 0x88  SJTAG Select Register
> offset: 0x90  SID Program Ctrol register for burned timing

Thanks!

I guess the layout changed a bit from the A10 and alikes then.

Anyway, we should expose only to the nvmem framework the actual eeprom
space, so from 0x200 to 0x300 from what you're saying (just like we
should only expose the first 4 bytes in the A10 / A20)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXV0tAAoJEBx+YmzsjxAggPYP/3SmveWMuEu6JtVlbazbg5k2
tn8HKMKVSleaQsEYjrF/4+zQK+5jZC9ZuszIP0M3N7Fqa/KMXhYOwTTFMWHSWMdk
ur2wnL4LGwWUs9GXFIfCXD/5BVGn3ceWLU3EfXtACnCHKj8hJvneD1Oulx1pC2Hr
dJNnCFqK8cNH6Tvff/W8S92z8YJqfnbqH+o8q2NBukRtL3U+hCZmZyi/Etpzzlr4
8mjrcs7c72sTXMKAF7/8nh2nA+DYIgQ29xtsSr7+XtWdr8x6FWt1FRIDhPElhkQO
rGQSw7amdXNb9DOz3gHTqLD6+tkazeeXyp0SvKqrSCQYyF8DnW+l+TH6cFZjpirQ
VyH5FAV9+hEi80aAHX1TsKoxBlx9WOJ+TeXU3kndWxfCHvHWVBgmC2HGOzN1E11+
hkPfigQdzd436kYg+pfMoOFnr/YMEwAk7FUUIYMpYHml7KrpeHq+IMDDSY5Ixzl9
ZRYCEpSZJW5dl4WSk9F1maqqjXbnP8zxm2SAfFk67tMFLj92XUDERSgWpeenX0v/
w4+BphRKFr5EdOZuD3A6D+pnykdoUBMn/5HhVP+vQXxMAQB9shfBhjOsks75sxZw
LEt8Ks9Avb5YS3zB437Biw8TDuBquxUtR2iWA7LXlB4zEg+/m+J0FzK6zstQzgn3
sIZsmoiMV5ts4y127RiW
=Lely
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
