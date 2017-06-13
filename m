Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 13 Jun 2017 09:44:32 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: icenowy@aosc.io
Cc: devicetree@vger.kernel.org,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/11] drm: sun4i: add support for the TV encoder in
 H3 SoC
Message-ID: <20170613074432.btwgc4e7pndtsvbf@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-8-icenowy@aosc.io>
 <20170607093845.cu5kk55nj72roysf@flea.lan>
 <362bb72d74cd7181ae02dbf73b0e724e@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jujgstq4zz4ccqii"
In-Reply-To: <362bb72d74cd7181ae02dbf73b0e724e@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--jujgstq4zz4ccqii
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2017 at 02:43:42PM +0800, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-06-07 17:38=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Mon, Jun 05, 2017 at 12:01:45AM +0800, Icenowy Zheng wrote:
> > > Allwinner H3 features a TV encoder similar to the one in earlier SoCs,
> > > but has a internal fixed clock divider that divides the TCON1 clock
> > > (called TVE clock in datasheet) by 11.
> > >=20
> > > Add support for it.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > > ---
> > > Changes in v2:
> > > - Quirk part rewritten.
> > >=20
> > >  drivers/gpu/drm/sun4i/sun4i_tv.c | 35
> > > ++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 34 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> > > b/drivers/gpu/drm/sun4i/sun4i_tv.c
> > > index 338b9e5bb2a3..b9ff6d5ea67a 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/clk.h>
> > >  #include <linux/component.h>
> > >  #include <linux/of_address.h>
> > > +#include <linux/of_device.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/reset.h>
> > >=20
> > > @@ -169,14 +170,21 @@ struct tv_mode {
> > >  	const struct resync_parameters	*resync_params;
> > >  };
> > >=20
> > > +struct sun4i_tv_quirks {
> > > +	int fixed_divider;
> > > +};
> > > +
> > >  struct sun4i_tv {
> > >  	struct drm_connector	connector;
> > >  	struct drm_encoder	encoder;
> > >=20
> > >  	struct clk		*clk;
> > > +	struct clk		*mod_clk;
> > >  	struct regmap		*regs;
> > >  	struct reset_control	*reset;
> > >=20
> > > +	const struct sun4i_tv_quirks *quirks;
> > > +
> > >  	struct sun4i_drv	*drv;
> > >  };
> > >=20
> > > @@ -391,6 +399,12 @@ static void sun4i_tv_mode_set(struct
> > > drm_encoder *encoder,
> > >  	struct sun4i_tcon *tcon =3D crtc->tcon;
> > >  	const struct tv_mode *tv_mode =3D sun4i_tv_find_tv_by_mode(mode);
> > >=20
> > > +	if (tv->quirks->fixed_divider) {
> > > +		DRM_DEBUG_DRIVER("Applying fixed divider %d on TVE clock\n",
> > > +				 tv->quirks->fixed_divider);
> > > +		mode->crtc_clock *=3D tv->quirks->fixed_divider;
> > > +	}
> > > +
> >=20
> > You're not allowed to change the mode in mode_set, and you shouldn't
> > even change it. The output pixel clock is still 27MHz.
> >=20
> > You should implement that using the states, as we discussed already.
>=20
> After reading the comments at include/drm/drm_modeset_helper_vtables.h,
> I think the atomic_check function is allowed to directly change
> the adjust_mode of crtc_state.
>=20
> And according to other comments at include/drm/drm_modes.h, the
> crtc_clock in adjust_mode should be the clock to be really feed
> to the hardware.
>=20
> So I think I can just change this in atomic_check.
>=20
> However, the mode_set function of sun4i_tv seems to be not
> regarding adjusted_mode and still use original mode.
>=20
> So my current design is:
> - Multiply adjusted_mode in atomic_check.
> - Feed adjust_mode to TCON code in mode_set function.
>=20
> Is this proper?
>=20
> (From my own understanding to the comments I think so.)

No, it's not. The pixel clock in the mode is the pixel clock output
physically by the connector. You want to use it for an intermediate
clock in your pipeline.

This is not the same clock, and not the same frequency.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jujgstq4zz4ccqii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZP5fgAAoJEBx+YmzsjxAgYdEQAIGDtjVeVkMnmq+T0Tu8e+JP
do/cLThLwGEljNqGMX1mYGsXBoiQOtO/AlTcH34I4+tCcUNuUksqGmmabvBEPJuw
PrBA1lkxQJtviT3f2bYsLjM5euu5/PD9dbad4TcwOT8MkyHplodN2sBa4EmzNpNo
K1TOGVJgqfPFfQXcEkvtrlTXuZRChA88n4Y53ZCPYKKywE5G2F/5L/MMrYUKKHcM
1UJhhQuMUtg7KWyrNTJOvnEbhd+jw0uEfe/ib5NqjNIoBKI8qP7ZB0dGen72ltR1
a/vQa7Iq2hvFUKQcprhqDo1JlDYWGXMxBMMRAZBe2IF+taYvOWHFSDA7KtAPbVMG
+BMHqOQlXXEQb7DbJx/DYZaXNBhmOEHauoAIPOw5vth6P1+2iEal5O4sW1JArlaQ
sKUr+zRqHdhl+ed+Pgx+tY7/aRnkyuBm0SXeZ4I+gyXF1YXlOcmyKbb5QXGMlhAK
357qj9F+FcpCMTXfKhUwn2Qi8v78aJakassUEVgdCe1BicidVestIvwO6V7XIzyB
u0pWWxoXqKF2ooX6c70LVwGFzT/D9M+7K8IZnmmCJDHLkgwajvCujVPM55IH045+
DvY2E0+FkBxaABggqH5/8O7ZHNMsKtdaPEVqy0iXp0dmJuFPNwMdvmI5DI5D7K+n
agOVd2Ntreiv5XjaQwhp
=yZSm
-----END PGP SIGNATURE-----

--jujgstq4zz4ccqii--
