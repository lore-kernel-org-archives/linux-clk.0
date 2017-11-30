Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:36062 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752209AbdK3PdO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Nov 2017 10:33:14 -0500
Date: Thu, 30 Nov 2017 16:33:12 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        plaes@plaes.org, icenowy@aosc.io,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 11/18] drm/sun4i: Add A83T support
Message-ID: <20171130153312.plmh2wr4n5njhlvb@flea.lan>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <2908242.WKit1ZIWoJ@jernej-laptop>
 <20171128220014.w35rcliusubfdvoe@flea.home>
 <1722782.9j9JEoLEfc@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="erfk6cip7l36ktoj"
In-Reply-To: <1722782.9j9JEoLEfc@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--erfk6cip7l36ktoj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 11:33:44PM +0100, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne torek, 28. november 2017 ob 23:00:14 CET je Maxime Ripard napisal(a):
> > On Tue, Nov 28, 2017 at 04:48:55PM +0100, Jernej =C5=A0krabec wrote:
> > > > On Mon, Nov 27, 2017 at 05:01:49PM +0100, Jernej =C5=A0krabec wrote:
> > > > > Dne ponedeljek, 27. november 2017 ob 16:41:35 CET je Maxime Ripard
> > >=20
> > > napisal(a):
> > > > > > Add support for the A83T display pipeline.
> > > > > >=20
> > > > > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > > > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > > > > ---
> > > > > >=20
> > > > > >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt =
| 3
> > > > > >  +++
> > > > > >  drivers/gpu/drm/sun4i/sun4i_drv.c                             =
| 2
> > > > > >  ++
> > > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c                            =
| 5
> > > > > >  +++++
> > > > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c                           =
| 4
> > > > > >  ++++
> > > > > >  4 files changed, 14 insertions(+)
> > > > > >=20
> > > > > > diff --git
> > > > > > a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > > > > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > > > > index
> > > > > > d4259a4f5171..d6b52e5c48c0 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm=
=2Etxt
> > > > > > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm=
=2Etxt
> > > > > >=20
> > > > > > @@ -93,6 +93,7 @@ Required properties:
> > > > > >     * allwinner,sun6i-a31s-tcon
> > > > > >     * allwinner,sun7i-a20-tcon
> > > > > >     * allwinner,sun8i-a33-tcon
> > > > > >=20
> > > > > > +   * allwinner,sun8i-a83t-tcon-lcd
> > > > > >=20
> > > > > >     * allwinner,sun8i-v3s-tcon
> > > > > >  =20
> > > > > >   - reg: base address and size of memory-mapped region
> > > > > >   - interrupts: interrupt associated to this IP
> > > > > >=20
> > > > > > @@ -224,6 +225,7 @@ supported.
> > > > > >=20
> > > > > >  Required properties:
> > > > > >    - compatible: value must be one of:
> > > > > > +    * allwinner,sun8i-a83t-de2-mixer
> > > > >=20
> > > > > What will be the name of the second mixer, once support for HDMI =
is
> > > > > added?
> > > > > Should we start directly with 0 and 1 postfix ?
> > > >=20
> > > > What are the differences exactly without the two mixers?
> > >=20
> > > Mixer properties:
> > > - mixer index (0 or 1), important for determining CCSC base (see my
> > > patches)
> > Is that the only thing we need to determine?
>=20
> For now, mixer index is important only for determining CCSC base in conju=
ction=20
> with VEP capability. Obviously, I can't exclude that there is some other =
case=20
> where that mixer index is needed.

That's unfortunate...

> Can't we just add reg property for that?

No, reg is here specifically for the bus address, not for an index,
and in general, indices are poorly perceived and have been subject to
a lot of debate in the past. Hence why I'd really like to avoid any
solution looking like this. But I guess we don't really have the
choice either.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--erfk6cip7l36ktoj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlogJLQACgkQ0rTAlCFN
r3T62w/+NaZ+cYZq1dARorAytgpZTP3extmiHl0Jq6VECBkWYoH4rNAp9PBwxY55
bsTnPTUkgHijiza0bjhLTl04GVTeD57lCa1/6HzDsGxJFga7NrEEYIBEpZxCtOba
I3f+ghyL2djCSwBeY0rBVsT6mHdlW9zYcG6o86lKAY+Or3HPJCqolw6sQzXAEFR3
uzjeZQ+v2KuKkgoyHbX2zxR+ObZfcdP51TVVyRT4vT4e0QyRMdZQeazu6PguDYPx
5kNnDraZBoOzp1bXf4NPO4wBhH/CNeJW/fLHO/K4wDW4XZM4ot0Sn2+Iph4sWATt
/H1o7jdyTNRXWxM97VzYMQbqOzVP4IQGfD4yAc7OOvNqo5WQ4+EhbMogX1USOCWV
2Nm3WIdV3/0iXFJl1tfLVbSAXfYCDi7H6MoooNU+yPHdR++nigLzir8sfI1gfMH9
kFL1ni34kHOQN1uNXP8Mv/7PgE3wDWx53xI46ctd+EzfAtGYjNA/rSl+7wdIdRrY
zOw4jJ66JZSA6JDfkSOK10NSxBnDGYfoliJA45lOohLnm6QGiKn4i5KjBFXgR2VX
NZlY/QOUoG7vHTyQpb9OfcNpp4TUwRxFY4mkgLcgDbIRc38P5JtHZZoYiPei+mxM
eyR0HArWgIoLo2Tm9ec5OuDp2C9+PqDWjQTOjjcs7yO3PWoreTo=
=gcQ3
-----END PGP SIGNATURE-----

--erfk6cip7l36ktoj--
