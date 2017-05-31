Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 31 May 2017 20:43:06 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com, wens@csie.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
Message-ID: <20170531184306.hzu2em35vr4qi4un@flea.lan>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <1958057.WDKm0nQKgW@jernej-laptop>
 <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg@mail.gmail.com>
 <3164416.5xR36OcyjH@jernej-laptop>
 <20170523125321.t7y7yfrrfokpkzgd@flea.home>
 <98c3572beee0a81755994b4bdc508b18@aosc.io>
 <20170524073019.bl6rojc2srrigalp@flea.home>
 <98558BA2-BC99-4D0A-A045-571C643875C5@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oxo7d4necg37sdu5"
In-Reply-To: <98558BA2-BC99-4D0A-A045-571C643875C5@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--oxo7d4necg37sdu5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2017 at 04:25:46PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
3:30:19, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Tue, May 23, 2017 at 09:00:59PM +0800, icenowy@aosc.io wrote:
> >> =E5=9C=A8 2017-05-23 20:53=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
> >> > On Mon, May 22, 2017 at 07:55:56PM +0200, Jernej =C5=A0krabec wrote:
> >> > > Hi,
> >> > >=20
> >> > > Dne sobota, 20. maj 2017 ob 03:37:53 CEST je Chen-Yu Tsai
> >napisal(a):
> >> > > > On Sat, May 20, 2017 at 2:23 AM, Jernej =C5=A0krabec
> ><jernej.skrabec@siol.net>
> >> > > wrote:
> >> > > > > Hi,
> >> > > > >
> >> > > > > Dne petek, 19. maj 2017 ob 20:08:18 CEST je Icenowy Zheng
> >napisal(a):
> >> > > > >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=
=8A=E5=8D=882:03:30, Maxime Ripard
> ><maxime.ripard@free-
> >> > > > >
> >> > > > > electrons.com> =E5=86=99=E5=88=B0:
> >> > > > >> >On Thu, May 18, 2017 at 12:43:50AM +0800, Icenowy Zheng
> >wrote:
> >> > > > >> >> Allwinner H3 features a TV encoder similar to the one in
> >earlier
> >> > > > >> >
> >> > > > >> >SoCs,
> >> > > > >> >
> >> > > > >> >> but with some different points about clocks:
> >> > > > >> >> - It has a mod clock and a bus clock.
> >> > > > >> >> - The mod clock must be at a fixed rate to generate
> >signal.
> >> > > > >> >
> >> > > > >> >Why?
> >> > > > >>
> >> > > > >> It's experiment result by Jernej.
> >> > > > >>
> >> > > > >> The clock rates in BSP kernel is also specially designed
> >> > > > >> (PLL_DE at 432MHz) in order to be able to feed the TVE.
> >> > > > >
> >> > > > > My experiments and search through BSP code showed that TVE
> >seems to have
> >> > > > > additional fixed predivider 8. So if you want to generate 27
> >MHz clock,
> >> > > > > unit has to be feed with 216 MHz.
> >> > > > >
> >> > > > > TVE has only one PLL source PLL_DE. And since 216 MHz is a
> >bit low for
> >> > > > > DE2,
> >> > > > > BSP defaults to 432 MHz for PLL_DE and use divider 2 to
> >generate 216 MHz.
> >> > > > > This clock is then divided by 8 internaly to get final 27
> >MHz.
> >> > > > >
> >> > > > > Please note that I don't have any hard evidence to support
> >that, only
> >> > > > > experimental data. However, only that explanation make sense
> >to me.
> >> > > > >
> >> > > > > BTW, BSP H3/H5 TV driver supports only PAL and NTSC which
> >both use 27 MHz
> >> > > > > base clock. Further experiments are needed to check if there
> >is any
> >> > > > > possibility to have other resolutions by manipulating clocks
> >and give
> >> > > > > other proper settings. I plan to do that, but not in very
> >near future.
> >> > > >
> >> > > > You only have composite video output, and those are the only 2
> >standard
> >> > > > resolutions that make any sense.
> >> > >=20
> >> > > Right, other resolutions are for VGA.
> >> > >=20
> >> > > Anyway, I did some more digging in A10 and R40 datasheets. I
> >think
> >> > > that H3 TVE
> >> > > unit is something in between. R40 TVE has a setting to select "up
> >> > > sample".
> >> >=20
> >> > That might be just another translation of oversampling :)
> >> >=20
> >> > I didn't know it could be applied to composite signals though, but
> >I
> >> > guess this is just another analog signal after all.
> >> >=20
> >> > > Possible settings are 27 MHz, 54 MHz, 108 MHz and 216 MHz. BSP
> >> > > driver on R40
> >> > > has this setting enabled only for PAL and NTSC and it is always
> >216
> >> > > MHz. I
> >> > > think that H3 may have this hardwired to 216 MHz and this would
> >be
> >> > > the reason
> >> > > why 216 MHz is needed.
> >> > >=20
> >> > > Has anyone else any better explanation?
> >> >=20
> >> > That's already a pretty good one.
> >> >=20
> >> > Either way, wether this is upsampling, oversampling or just a
> >> > pre-divider, this can and should be dealt with in the mode_set
> >> > callback, and not in the probe.
> >>=20
> >> I got a better idea -- let TVE driver have the CLK_TVE as an
> >> input and create a subclock output with divider 16, and feed this
> >> subclock to TCON lcd-ch1.
> >>=20
> >> This is a model of the real hardware -- the clock divider is in
> >> TVE, not TCON.
> >
> >That's definitely not a good representation of the hardware. There's
> >one clock, it goes to the TCON, period.
>=20
> No, I still think it goes to the TVE as:
>=20
> 1. it's named TVE in datasheet.

Feel free to come up with a better, more sensible explanation?

> 2. Generating signal with such a low resolution but such
> a high dotclock is not a good situation.

What? What do you mean? The pixel clock is 27MHz, I'm pretty sure we
agree on that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--oxo7d4necg37sdu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZLw66AAoJEBx+YmzsjxAgIPcP/1N03GmgNfWiXlpnk/cx7Kkm
0uYCU89XZpAt4tNm/W3CUmiPMWKUJoJVyv5LMv6IJail3dIXKxdw2mUINELhUhtB
muMYy931FSXeNWX5CEVs+2kcUsrrveDq8Fsz2M7TpSWYT6w3uDWmNV41FzMy89O2
a25isxBNoc3rCxCnxdS7WV9MxbkFIgq7jhsTv1r7+XwhB+STuosrCBjTmflDy+LR
NPtoMksz6gZNfQzUnQMKHot6k1u+CQZ5TQYmV5XU/MHYndx/aOj0VVUnKq5z2fBR
dncSNx4lF5Mi9mI1k5icrn7YdgCwuuG8o9VxTBgNdG8b8HKfQ3bNdgoVnnS0M5e9
oGxfMwOZFvUY7qugJ8pgeGslZK9xVTwMyykEHlfQ+JSQNMDeKKUijtxd5RTAXzaD
3SCXMvDBBIDJLXD4ToftYfIlHwXPLh2NC8jUytO/BNU74aM2iWxYxQ6LMmHuVwLG
KdOuIpGctMFPPaKA2yn6hw2QKfKhRXllsvH538qMh1dYopS3ixAudyiwUHtEJyj4
CjwNmWAv+nuQLZzujZAtcDoucDpmye1/QcWp+3t/NpsnUZmDKmaAfHFsSTesEElo
4x8RRm/zVjCGp1WHVKvA8n0zeiHbhSfCIiXKgwMlI1Ti4jw92rjJosoaic+VmIza
uSVuGSbmhIHWJgTdAUDO
=ueB/
-----END PGP SIGNATURE-----

--oxo7d4necg37sdu5--
