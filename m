Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54617 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750907AbdK1JCf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Nov 2017 04:02:35 -0500
Date: Tue, 28 Nov 2017 10:02:23 +0100
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
Message-ID: <20171128090223.mqp3v2t6koyu6hk4@flea.home>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
 <1c4f6b275597dec7d97b5c1d9f749ba27c0610f3.1511797218.git-series.maxime.ripard@free-electrons.com>
 <2744508.m82qQEPny3@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2jvhs2ny2qmgiaxy"
In-Reply-To: <2744508.m82qQEPny3@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--2jvhs2ny2qmgiaxy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 27, 2017 at 05:01:49PM +0100, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 27. november 2017 ob 16:41:35 CET je Maxime Ripard napisa=
l(a):
> > Add support for the A83T display pipeline.
> >=20
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
> >  drivers/gpu/drm/sun4i/sun4i_drv.c                             | 2 ++
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c                            | 5 +++++
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c                           | 4 ++++
> >  4 files changed, 14 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.=
txt
> > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt index
> > d4259a4f5171..d6b52e5c48c0 100644
> > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > @@ -93,6 +93,7 @@ Required properties:
> >     * allwinner,sun6i-a31s-tcon
> >     * allwinner,sun7i-a20-tcon
> >     * allwinner,sun8i-a33-tcon
> > +   * allwinner,sun8i-a83t-tcon-lcd
> >     * allwinner,sun8i-v3s-tcon
> >   - reg: base address and size of memory-mapped region
> >   - interrupts: interrupt associated to this IP
> > @@ -224,6 +225,7 @@ supported.
> >=20
> >  Required properties:
> >    - compatible: value must be one of:
> > +    * allwinner,sun8i-a83t-de2-mixer
>=20
> What will be the name of the second mixer, once support for HDMI is added=
?=20
> Should we start directly with 0 and 1 postfix ?

What are the differences exactly without the two mixers?

I was hoping to be able to cover them all using properties, indices
are usually pretty badly received in compatibles.

> >  static const struct of_device_id sun8i_mixer_of_table[] =3D {
> >  	{
> > +		.compatible =3D "allwinner,sun8i-a83t-de2-mixer",
> > +		.data =3D &sun8i_v3s_mixer_cfg,
> > +	},
> > +	{
>=20
> Maybe you want to squash 12 patch since this works only by luck.

Yeah, I totally meant to do that :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2jvhs2ny2qmgiaxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlodJhsACgkQ0rTAlCFN
r3TaTg/9FA/Swsxs9c3eVGs+2Z6OuXlfOk1vV0T6Cyvl1beXzEeDflDODZ1sUsVx
u7WzZ26J5tpWqJD4JbafKZ+EfnVTTw4JkdOvC/ECuLWN5yQFEmddm76X8mcatbMt
tGyOLyk/ijgLxQwULE4rFo9aocHNBuJsRMt7UH9jyXGMfrXDk5zlPNbN4ley1cz2
QEjjz8Unkh7Ayzl2L0EO3ZatP3vwbt+aFvQVEqTh/ajP2yAVy+G9QE11khTgJ6rB
aLR2JX2baofSVmEudY0aPeszlgp/aBdoEalvgcBbU5JmgU9X2tSIw/pCuxwTCwBV
a/cHvyjuI7K3fAHtZHWJsVoAl1tDkcFDDyCgPaJkxcYVLa0BBg7oO6fRkeLeEnCV
JjUdzZvvyftupCjJU1V4OPxMPUhaWEwP8dQewWiI0/OAwpDVFyPbgBx3zBY0GjDt
ILw3nIChu3Z1ipPFtoyPZmWGrJ+rTS5AE9I1fH6pdTCsJ60RW1iYlv4v6sFyTkJb
bKrwUwDxlRnAcUrd9v3oXzz9QV39QzMI94DMgXyniVzmTFkzQpT40sghygge/VYn
261WvIk7sSdvUjcmytawWdNXt3cRhfDqAohoypnBJ4pHKh1n0TfRnkdKCzb5G9ZX
+zthArS3XylVcdfEOg4V3ot6gBJh22CSGfIkfDz+nf6Uhxlewh8=
=qCXp
-----END PGP SIGNATURE-----

--2jvhs2ny2qmgiaxy--
