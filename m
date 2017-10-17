Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42421 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756726AbdJQOjh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 10:39:37 -0400
Date: Tue, 17 Oct 2017 16:39:35 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Subject: Re: [PATCH 06/23] drm/sun4i: tcon: Don't rely on encoders to set the
 TCON mode
Message-ID: <20171017143935.hdpo5enms3qjqbcy@flea.lan>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <faa3a4d511039af1d116270dfef3a8b60ca3591e.1508231063.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v679FWRRiTfS5jReFqiAEEiqAg13wUPHOYdT_=gebh25tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qu6fj2hur7gzq52i"
In-Reply-To: <CAGb2v679FWRRiTfS5jReFqiAEEiqAg13wUPHOYdT_=gebh25tg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--qu6fj2hur7gzq52i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 05:56:47PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Just like we did for the TCON enable and disable, for historical reason=
s we
> > used to rely on the encoders calling the TCON mode_set function, while =
the
> > CRTC has a callback for that.
> >
> > Let's implement it in order to reduce the boilerplate code.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c          | 10 +++++++-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c  |  1 +-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c      |  7 +-----
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c |  1 +-
> >  drivers/gpu/drm/sun4i/sun4i_rgb.c           | 15 +-----------
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c          | 31 +++++++++++++++++-----
> >  drivers/gpu/drm/sun4i/sun4i_tcon.h          | 11 ++------
> >  drivers/gpu/drm/sun4i/sun4i_tv.c            |  6 +----
> >  8 files changed, 37 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i=
/sun4i_crtc.c
> > index e86baa3746af..5decae0069d0 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> > @@ -115,11 +115,21 @@ static void sun4i_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >         sun4i_tcon_set_status(scrtc->tcon, encoder, true);
> >  }
> >
> > +static void sun4i_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > +{
> > +       struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > +       struct drm_encoder *encoder =3D sun4i_crtc_get_encoder(crtc);
> > +       struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
> > +
> > +       sun4i_tcon_mode_set(scrtc->tcon, encoder, mode);
> > +}
> > +
> >  static const struct drm_crtc_helper_funcs sun4i_crtc_helper_funcs =3D {
> >         .atomic_begin   =3D sun4i_crtc_atomic_begin,
> >         .atomic_flush   =3D sun4i_crtc_atomic_flush,
> >         .atomic_enable  =3D sun4i_crtc_atomic_enable,
> >         .atomic_disable =3D sun4i_crtc_atomic_disable,
> > +       .mode_set_nofb  =3D sun4i_crtc_mode_set_nofb,
> >  };
> >
> >  static int sun4i_crtc_enable_vblank(struct drm_crtc *crtc)
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/d=
rm/sun4i/sun4i_hdmi_ddc_clk.c
> > index 04f85b1cf922..e826da34e919 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> > @@ -13,7 +13,6 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/regmap.h>
> >
> > -#include "sun4i_tcon.h"
> >  #include "sun4i_hdmi.h"
> >
> >  struct sun4i_ddc {
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/s=
un4i/sun4i_hdmi_enc.c
> > index 482bf03d55c1..d2eb0a60e568 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > @@ -30,7 +30,6 @@
> >  #include "sun4i_crtc.h"
> >  #include "sun4i_drv.h"
> >  #include "sun4i_hdmi.h"
> > -#include "sun4i_tcon.h"
> >
> >  static inline struct sun4i_hdmi *
> >  drm_encoder_to_sun4i_hdmi(struct drm_encoder *encoder)
> > @@ -120,15 +119,9 @@ static void sun4i_hdmi_mode_set(struct drm_encoder=
 *encoder,
> >                                 struct drm_display_mode *adjusted_mode)
> >  {
> >         struct sun4i_hdmi *hdmi =3D drm_encoder_to_sun4i_hdmi(encoder);
> > -       struct sun4i_crtc *crtc =3D drm_crtc_to_sun4i_crtc(encoder->crt=
c);
> > -       struct sun4i_tcon *tcon =3D crtc->tcon;
> >         unsigned int x, y;
> >         u32 val;
> >
> > -       sun4i_tcon1_mode_set(tcon, mode);
> > -       sun4i_tcon_set_mux(tcon, 1, encoder);
> > -
> > -       clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000);
> >         clk_set_rate(hdmi->mod_clk, mode->crtc_clock * 1000);
> >         clk_set_rate(hdmi->tmds_clk, mode->crtc_clock * 1000);
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/=
drm/sun4i/sun4i_hdmi_tmds_clk.c
> > index 1b6b37aefc38..dc332ea56f6c 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
> > @@ -12,7 +12,6 @@
> >
> >  #include <linux/clk-provider.h>
> >
> > -#include "sun4i_tcon.h"
> >  #include "sun4i_hdmi.h"
> >
> >  struct sun4i_tmds {
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/=
sun4i_rgb.c
> > index a7f297ed40c1..832f8f9bc47f 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > @@ -153,22 +153,7 @@ static void sun4i_rgb_encoder_disable(struct drm_e=
ncoder *encoder)
> >         }
> >  }
> >
> > -static void sun4i_rgb_encoder_mode_set(struct drm_encoder *encoder,
> > -                                      struct drm_display_mode *mode,
> > -                                      struct drm_display_mode *adjuste=
d_mode)
> > -{
> > -       struct sun4i_rgb *rgb =3D drm_encoder_to_sun4i_rgb(encoder);
> > -       struct sun4i_tcon *tcon =3D rgb->tcon;
> > -
> > -       sun4i_tcon0_mode_set(tcon, mode);
> > -       sun4i_tcon_set_mux(tcon, 0, encoder);
> > -
> > -       /* FIXME: This seems to be board specific */
> > -       clk_set_phase(tcon->dclk, 120);
> > -}
> > -
> >  static struct drm_encoder_helper_funcs sun4i_rgb_enc_helper_funcs =3D {
> > -       .mode_set       =3D sun4i_rgb_encoder_mode_set,
> >         .disable        =3D sun4i_rgb_encoder_disable,
> >         .enable         =3D sun4i_rgb_encoder_enable,
> >  };
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index 964cf22a1ced..7ecd4f7c8411 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -139,7 +139,6 @@ void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, in=
t channel,
> >         DRM_DEBUG_DRIVER("Muxing encoder %s to CRTC %s: %d\n",
> >                          encoder->name, encoder->crtc->name, ret);
> >  }
> > -EXPORT_SYMBOL(sun4i_tcon_set_mux);
> >
> >  static int sun4i_tcon_get_clk_delay(const struct drm_display_mode *mod=
e,
> >                                     int channel)
> > @@ -159,8 +158,8 @@ static int sun4i_tcon_get_clk_delay(const struct dr=
m_display_mode *mode,
> >         return delay;
> >  }
> >
> > -void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> > -                         struct drm_display_mode *mode)
> > +static void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> > +                                struct drm_display_mode *mode)
>=20
> This doesn't have const...
>=20
> >  {
> >         unsigned int bp, hsync, vsync;
> >         u8 clk_delay;
> > @@ -233,10 +232,9 @@ void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> >         /* Enable the output on the pins */
> >         regmap_write(tcon->regs, SUN4I_TCON0_IO_TRI_REG, 0);
> >  }
> > -EXPORT_SYMBOL(sun4i_tcon0_mode_set);
> >
> > -void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> > -                         struct drm_display_mode *mode)
> > +static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> > +                                const struct drm_display_mode *mode)
> >  {
> >         unsigned int bp, hsync, vsync, vtotal;
> >         u8 clk_delay;
> > @@ -324,7 +322,26 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> >                            SUN4I_TCON_GCTL_IOMAP_MASK,
> >                            SUN4I_TCON_GCTL_IOMAP_TCON1);
> >  }
> > -EXPORT_SYMBOL(sun4i_tcon1_mode_set);
> > +
> > +void sun4i_tcon_mode_set(struct sun4i_tcon *tcon,
> > +                        const struct drm_encoder *encoder,
> > +                        const struct drm_display_mode *mode)
>=20
> But this does...
>=20
> > +{
> > +       switch (encoder->encoder_type) {
> > +       case DRM_MODE_ENCODER_NONE:
> > +               sun4i_tcon0_mode_set(tcon, mode);
>=20
> So you're likely to get some warning about dropping const here.
>=20
> Otherwise,
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Strangely enough, it doesn't. I've fixed it and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qu6fj2hur7gzq52i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5hYnAAoJEBx+YmzsjxAgPugP/3uMxXW4U+o7deo0FQcIbsHi
ICLM1/HRe0NNWxBPIARc18TJ0GsF4cjODXcpHE/7TVhW1BpZRf0dF772JW4SCx8l
119dl1IJRmrXPavkvQ6f7I5KrAENyDcdQlSu6+2fyNWvy1vRQ8EEf8pqik0NQy7W
pSZT3NLR/r0cEU+JB3OqxR4tIUTPmxSFWuH8aT3PeEYfH6tQpECSyb02BunZI6W7
ec31t/UwUe1sIrKWjR2OyqjQPlsaEMw4GpvMNc0KOpEBVWT0BlpxuH84KNcAuYUL
wsZnWPKvAluYmSklhsm5zCFZE7mXatLrhJ/Jkas+YVjiFxUsB7Y4cDet+GwiOiO4
kkAEYds0itfcoFXC1XVKL8D8GX9BsxNuymS7nJcr9CMitQpuoE7M4Uyx6ukqeAr5
SiyEXDQEcVQnwZyXJgaEb57O7eCByul2Hvwu7mG+/5fK5jCtqa2IIIX74sYDmEFf
qFcstwHbD2D0hipepZyD2A8WrOLfdDE53S2DxkITq9O4euEzVSSnRnRSucfJ049r
MDC2+w+ZHf1x5dRWSzXXeB+lVuyD4dSj06r9vIRx++bzVhsb4cx5tBMRg9MVHzJu
SsD2EAI/YJ0L8igk7avo43fjL28IG+YJGp69kWlteL1FExQSf32W+Cexiq/PRI9G
KUG3J60k7Wu4O4KZVvQu
=adyX
-----END PGP SIGNATURE-----

--qu6fj2hur7gzq52i--
