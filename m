Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:36710 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750739AbdFGH6q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 03:58:46 -0400
Date: Wed, 7 Jun 2017 09:58:33 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: icenowy@aosc.io
Cc: devicetree <devicetree@vger.kernel.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>, wens@csie.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 07/11] drm: sun4i: add support for
 the TV encoder in H3 SoC
Message-ID: <20170607075833.gazygmkckyycszzg@flea.lan>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <1958057.WDKm0nQKgW@jernej-laptop>
 <CAGb2v66aD=G+V75N-_nYo=dGqhxpKhadM84h9G-B34=dnDwCbg@mail.gmail.com>
 <3164416.5xR36OcyjH@jernej-laptop>
 <20170523125321.t7y7yfrrfokpkzgd@flea.home>
 <98c3572beee0a81755994b4bdc508b18@aosc.io>
 <20170524073019.bl6rojc2srrigalp@flea.home>
 <861ead704cc7d1bc0983d0f01138f190@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="msiknyznkpcrkhss"
In-Reply-To: <861ead704cc7d1bc0983d0f01138f190@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--msiknyznkpcrkhss
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2017 at 10:29:29PM +0800, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-05-24 15:30=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Tue, May 23, 2017 at 09:00:59PM +0800, icenowy@aosc.io wrote:
> > > =E5=9C=A8 2017-05-23 20:53=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=
=EF=BC=9A
> > > > On Mon, May 22, 2017 at 07:55:56PM +0200, Jernej =C5=A0krabec wrote:
> > > > > Hi,
> > > > >
> > > > > Dne sobota, 20. maj 2017 ob 03:37:53 CEST je Chen-Yu Tsai napisal=
(a):
> > > > > > On Sat, May 20, 2017 at 2:23 AM, Jernej =C5=A0krabec <jernej.sk=
rabec@siol.net>
> > > > > wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > Dne petek, 19. maj 2017 ob 20:08:18 CEST je Icenowy Zheng nap=
isal(a):
> > > > > > >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=
=B8=8A=E5=8D=882:03:30, Maxime Ripard <maxime.ripard@free-
> > > > > > >
> > > > > > > electrons.com> =E5=86=99=E5=88=B0:
> > > > > > >> >On Thu, May 18, 2017 at 12:43:50AM +0800, Icenowy Zheng wro=
te:
> > > > > > >> >> Allwinner H3 features a TV encoder similar to the one in =
earlier
> > > > > > >> >
> > > > > > >> >SoCs,
> > > > > > >> >
> > > > > > >> >> but with some different points about clocks:
> > > > > > >> >> - It has a mod clock and a bus clock.
> > > > > > >> >> - The mod clock must be at a fixed rate to generate signa=
l.
> > > > > > >> >
> > > > > > >> >Why?
> > > > > > >>
> > > > > > >> It's experiment result by Jernej.
> > > > > > >>
> > > > > > >> The clock rates in BSP kernel is also specially designed
> > > > > > >> (PLL_DE at 432MHz) in order to be able to feed the TVE.
> > > > > > >
> > > > > > > My experiments and search through BSP code showed that TVE se=
ems to have
> > > > > > > additional fixed predivider 8. So if you want to generate 27 =
MHz clock,
> > > > > > > unit has to be feed with 216 MHz.
> > > > > > >
> > > > > > > TVE has only one PLL source PLL_DE. And since 216 MHz is a bi=
t low for
> > > > > > > DE2,
> > > > > > > BSP defaults to 432 MHz for PLL_DE and use divider 2 to gener=
ate 216 MHz.
> > > > > > > This clock is then divided by 8 internaly to get final 27 MHz.
> > > > > > >
> > > > > > > Please note that I don't have any hard evidence to support th=
at, only
> > > > > > > experimental data. However, only that explanation make sense =
to me.
> > > > > > >
> > > > > > > BTW, BSP H3/H5 TV driver supports only PAL and NTSC which bot=
h use 27 MHz
> > > > > > > base clock. Further experiments are needed to check if there =
is any
> > > > > > > possibility to have other resolutions by manipulating clocks =
and give
> > > > > > > other proper settings. I plan to do that, but not in very nea=
r future.
> > > > > >
> > > > > > You only have composite video output, and those are the only 2 =
standard
> > > > > > resolutions that make any sense.
> > > > >
> > > > > Right, other resolutions are for VGA.
> > > > >
> > > > > Anyway, I did some more digging in A10 and R40 datasheets. I think
> > > > > that H3 TVE
> > > > > unit is something in between. R40 TVE has a setting to select "up
> > > > > sample".
> > > >
> > > > That might be just another translation of oversampling :)
> > > >
> > > > I didn't know it could be applied to composite signals though, but I
> > > > guess this is just another analog signal after all.
> > > >
> > > > > Possible settings are 27 MHz, 54 MHz, 108 MHz and 216 MHz. BSP
> > > > > driver on R40
> > > > > has this setting enabled only for PAL and NTSC and it is always 2=
16
> > > > > MHz. I
> > > > > think that H3 may have this hardwired to 216 MHz and this would be
> > > > > the reason
> > > > > why 216 MHz is needed.
> > > > >
> > > > > Has anyone else any better explanation?
> > > >
> > > > That's already a pretty good one.
> > > >
> > > > Either way, wether this is upsampling, oversampling or just a
> > > > pre-divider, this can and should be dealt with in the mode_set
> > > > callback, and not in the probe.
> > >=20
> > > I got a better idea -- let TVE driver have the CLK_TVE as an
> > > input and create a subclock output with divider 16, and feed this
> > > subclock to TCON lcd-ch1.
> > >=20
> > > This is a model of the real hardware -- the clock divider is in
> > > TVE, not TCON.
> >=20
> > That's definitely not a good representation of the hardware. There's
> > one clock, it goes to the TCON, period.
> >=20
> > However, the TV encoder has a constraint on that clock rate. This can
> > be easily implemented using a custom encoder state where you'd set the
> > multiplier to set on that clock, and the TCON will use it.
>=20
> P.S. how to do such a custom state?
>=20
> Should I do the multiplying in sun4i_tv_mode_to_drm_mode?

You have an example of that in ebd14afe8fa7, but it basically boils
down to:
  - Create a structure subclassing drm_connector_state
  - Adding your own reset and atomic_duplicate_state callback
  - In the atomic_check, change the state to set the pre-divider, and
    then use it in TCON's mode_set.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--msiknyznkpcrkhss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZN7IpAAoJEBx+YmzsjxAgNPAQAK2QLNgIISrNDYS3vfCNGUMB
BH4XCgK5Flw+ggcs9oos5epeOrpIc0AodXbW/mPqfI8DVYy5L35TQmXAeicEupta
0rsir8bYZaCAQOtyu6HC5Tc6aYcxxTZxvVUdv3ALHoykPvOlMvwja+dNnGalHI7C
txtCO1YqFIPaDj8ndgXtwcMmpfxdwwW4o+zI2sKLIlDmH/NkTFpho4k0WaqM5cej
TPDOeiMQy5rSELXMkUmazZox5sgJPR1CHLXuP6x1nO4RSyN6mXdER5BwOZLVd2x6
G1NGMhmycmharI9n041UWP7bu4NcXvj61pduFRVxbTZ8s9WfFnn5JVTWTtxqMKdZ
l492lrBp3QeOHVrlf7ERwOfDcSDGj+nXgy7/3iGa4R47UFYYndzJ8uTO/hZFg2c5
4Wr6OUOPsUdAgdQnSJk4Z3vFoX87GkoS/m30J/t5Yg8VGN23e0tLobkyQAURYjxl
K++KV0ZCbA2/UUxVzrr3YbB6SZ2AYOwF0F8Q2BRdE/X6WEqZbZ67/qdMMZkp97UV
vxL9kWA9cbR1rQduU9zgW88xQ+FozgKy+IG2FfOG26DgCocTuzQBlaIu1g28skpY
goO+q4MlMHFP/8r/ALE+2/EJfoxvoNyv3D58Op3iFcsdh9Gh6GfPlpnUussW/YmO
nLvNjVBgmZY/6Pcudb1d
=ZcJu
-----END PGP SIGNATURE-----

--msiknyznkpcrkhss--
