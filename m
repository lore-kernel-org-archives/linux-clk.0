Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 23 May 2017 14:53:21 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: linux-sunxi@googlegroups.com, wens@csie.org,
        Icenowy Zheng <icenowy@aosc.io>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
Message-ID: <20170523125321.t7y7yfrrfokpkzgd@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <1958057.WDKm0nQKgW@jernej-laptop>
 <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg@mail.gmail.com>
 <3164416.5xR36OcyjH@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="slks72alfg3q5wiv"
In-Reply-To: <3164416.5xR36OcyjH@jernej-laptop>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--slks72alfg3q5wiv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2017 at 07:55:56PM +0200, Jernej =C5=A0krabec wrote:
> Hi,
>=20
> Dne sobota, 20. maj 2017 ob 03:37:53 CEST je Chen-Yu Tsai napisal(a):
> > On Sat, May 20, 2017 at 2:23 AM, Jernej =C5=A0krabec <jernej.skrabec@si=
ol.net>=20
> wrote:
> > > Hi,
> > >=20
> > > Dne petek, 19. maj 2017 ob 20:08:18 CEST je Icenowy Zheng napisal(a):
> > >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=
=8D=882:03:30, Maxime Ripard <maxime.ripard@free-
> > >=20
> > > electrons.com> =E5=86=99=E5=88=B0:
> > >> >On Thu, May 18, 2017 at 12:43:50AM +0800, Icenowy Zheng wrote:
> > >> >> Allwinner H3 features a TV encoder similar to the one in earlier
> > >> >
> > >> >SoCs,
> > >> >
> > >> >> but with some different points about clocks:
> > >> >> - It has a mod clock and a bus clock.
> > >> >> - The mod clock must be at a fixed rate to generate signal.
> > >> >
> > >> >Why?
> > >>=20
> > >> It's experiment result by Jernej.
> > >>=20
> > >> The clock rates in BSP kernel is also specially designed
> > >> (PLL_DE at 432MHz) in order to be able to feed the TVE.
> > >=20
> > > My experiments and search through BSP code showed that TVE seems to h=
ave
> > > additional fixed predivider 8. So if you want to generate 27 MHz cloc=
k,
> > > unit has to be feed with 216 MHz.
> > >=20
> > > TVE has only one PLL source PLL_DE. And since 216 MHz is a bit low for
> > > DE2,
> > > BSP defaults to 432 MHz for PLL_DE and use divider 2 to generate 216 =
MHz.
> > > This clock is then divided by 8 internaly to get final 27 MHz.
> > >=20
> > > Please note that I don't have any hard evidence to support that, only
> > > experimental data. However, only that explanation make sense to me.
> > >=20
> > > BTW, BSP H3/H5 TV driver supports only PAL and NTSC which both use 27=
 MHz
> > > base clock. Further experiments are needed to check if there is any
> > > possibility to have other resolutions by manipulating clocks and give
> > > other proper settings. I plan to do that, but not in very near future.
> >=20
> > You only have composite video output, and those are the only 2 standard
> > resolutions that make any sense.
>=20
> Right, other resolutions are for VGA.
>=20
> Anyway, I did some more digging in A10 and R40 datasheets. I think that H=
3 TVE=20
> unit is something in between. R40 TVE has a setting to select "up sample".

That might be just another translation of oversampling :)

I didn't know it could be applied to composite signals though, but I
guess this is just another analog signal after all.

> Possible settings are 27 MHz, 54 MHz, 108 MHz and 216 MHz. BSP driver on =
R40=20
> has this setting enabled only for PAL and NTSC and it is always 216 MHz. =
I=20
> think that H3 may have this hardwired to 216 MHz and this would be the re=
ason=20
> why 216 MHz is needed.
>=20
> Has anyone else any better explanation?

That's already a pretty good one.

Either way, wether this is upsampling, oversampling or just a
pre-divider, this can and should be dealt with in the mode_set
callback, and not in the probe.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--slks72alfg3q5wiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJDDBAAoJEBx+YmzsjxAggtAP/ilUIvayebUSJrxUtMTxy1y8
67bceUVmdT52wf2YazpruudLNyIeWbUv6uI3IA2MmyT1nChTYpYjYJ6/96ToEbwt
JOOMfkPZ7CdBls6KnSncBa9mpHprGNfWO43iSDDnWnonm45ywco+ZPllF9tZCUIz
UNYcbvb2UpTvW7fytBXhAiW6bEL5c6tghcKr+vtOPOPLM+2GuDPhPweXWGU3xS8q
kQTSjsGuxmDqMLS3MyGqlOnHmsAqi0BIqvi4MUiAg+X7+y8+1sBniTiLeDiRwNjW
BTnLtmN2mkMg43wsYQQjv03Gr08vh+xZmncTjWV2McNr/VAM2QukcjBgg/4MWets
Rab4VIy9aIjEkm4rUasEfi0mgpQntNgoeMhi9MjUTqp5BXpygAj82oWOko/liEgo
JODyKRSQMMcGPtJKDTklXJ/bQfLsdUv6OL5C0dgbjT+HENourn8b1iuwtbBX4Mof
Ry0kUdkDM8KW4GYXRGFrTFwgDLVgC9714VXtILHKyLahzYGTKD2AAacj6S3XTKmu
cLcy4pDyHnhvAzHWs+23iLB2rPcBxDll/QB9o1f77hPrZzO+oZoY3NbMm+LAxLGH
B5IvUYoue/iTQQhAJEoOs6frgk1qYU2/TR2/QpVNf9GTdjqYuVm2rw0nmIYwgxHu
OZ+YNxZFZt3t85jzhw/R
=FWve
-----END PGP SIGNATURE-----

--slks72alfg3q5wiv--
