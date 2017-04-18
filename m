Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 18 Apr 2017 10:55:48 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v4 05/11] drm/sun4i: abstract a engine type
Message-ID: <20170418085548.4cisone2yfcuizcp@lukather>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-6-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170416120849.54542-6-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4824089932659554726=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4824089932659554726==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4eoi5okntjngbazg"
Content-Disposition: inline


--4eoi5okntjngbazg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for that rework.

On Sun, Apr 16, 2017 at 08:08:43PM +0800, Icenowy Zheng wrote:
> As we are going to add support for the Allwinner DE2 engine in sun4i-drm
> driver, we will finally have two types of display engines -- the DE1
> backend and the DE2 mixer. They both do some display blending and feed
> graphics data to TCON, so I choose to call them both "engine" here.
>=20
> Abstract the engine type to void * and a ops struct, which contains
> functions that should be called outside the engine-specified code (in
> TCON, CRTC or TV Encoder code).
>=20
> A dedicated Kconfig option is also added to control whether
> sun4i-backend-specified code (sun4i_backend.c and sun4i_layer.c) should
> be built. As we removed the codes in CRTC code that directly call the
> layer code, we can now extract the layer part and combine it with the
> backend part into a new module, sun4i-backend.ko.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v4:
> - Comments to tag the color correction functions as optional.
> - Check before calling the optional functions.
> - Change layers_init to satisfy new PATCH v4 04/11.
>=20
>  drivers/gpu/drm/sun4i/Kconfig         | 10 ++++++++++
>  drivers/gpu/drm/sun4i/Makefile        |  6 ++++--
>  drivers/gpu/drm/sun4i/sun4i_backend.c | 26 +++++++++++++++++++-------
>  drivers/gpu/drm/sun4i/sun4i_backend.h |  5 -----
>  drivers/gpu/drm/sun4i/sun4i_crtc.c    | 14 +++++++-------
>  drivers/gpu/drm/sun4i/sun4i_crtc.h    |  7 ++++---
>  drivers/gpu/drm/sun4i/sun4i_drv.h     |  3 ++-
>  drivers/gpu/drm/sun4i/sun4i_layer.c   |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_layer.h   |  3 ++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c    |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_tv.c      | 11 ++++++-----
>  drivers/gpu/drm/sun4i/sunxi_engine.h  | 35 +++++++++++++++++++++++++++++=
++++++
>  12 files changed, 91 insertions(+), 33 deletions(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sunxi_engine.h
>=20
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index a4b357db8856..5a8227f37cc4 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -12,3 +12,13 @@ config DRM_SUN4I
>  	  Choose this option if you have an Allwinner SoC with a
>  	  Display Engine. If M is selected the module will be called
>  	  sun4i-drm.
> +
> +config DRM_SUN4I_BACKEND
> +	tristate "Support for Allwinner A10 Display Engine Backend"
> +	depends on DRM_SUN4I
> +	default DRM_SUN4I
> +	help
> +	  Choose this option if you have an Allwinner SoC with the
> +	  original Allwinner Display Engine, which has a backend to
> +	  do some alpha blending and feed graphics to TCON. If M is
> +	  selected the module will be called sun4i-backend.
> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makef=
ile
> index 59b757350a1f..1db1068b9be1 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -5,9 +5,11 @@ sun4i-tcon-y +=3D sun4i_tcon.o
>  sun4i-tcon-y +=3D sun4i_rgb.o
>  sun4i-tcon-y +=3D sun4i_dotclock.o
>  sun4i-tcon-y +=3D sun4i_crtc.o
> -sun4i-tcon-y +=3D sun4i_layer.o
> +
> +sun4i-backend-y +=3D sun4i_layer.o
> +sun4i-backend-y +=3D sun4i_backend.o
> =20
>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i-drm.o sun4i-tcon.o
> -obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i_backend.o
> +obj-$(CONFIG_DRM_SUN4I_BACKEND)	+=3D sun4i-backend.o
>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun6i_drc.o
>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i_tv.o
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4=
i/sun4i_backend.c
> index d660741ba475..a16c96a002a4 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -23,6 +23,8 @@
> =20
>  #include "sun4i_backend.h"
>  #include "sun4i_drv.h"
> +#include "sun4i_layer.h"
> +#include "sunxi_engine.h"
> =20
>  static const u32 sunxi_rgb2yuv_coef[12] =3D {
>  	0x00000107, 0x00000204, 0x00000064, 0x00000108,
> @@ -30,9 +32,10 @@ static const u32 sunxi_rgb2yuv_coef[12] =3D {
>  	0x000001c1, 0x00003e88, 0x00003fb8, 0x00000808
>  };
> =20
> -void sun4i_backend_apply_color_correction(struct sun4i_backend *backend)
> +static void sun4i_backend_apply_color_correction(void *engine)
>  {
>  	int i;
> +	struct sun4i_backend *backend =3D engine;

I'm not really fond of passing an opaque pointer here, and hope that
things will work out.

I think having a common structure, holding the common thingsand a more
specific structure for that one would work better.

Something like

struct sunxi_engine {
       struct regmap	*regs;
};

struct sun4i_backend {
       struct sunxi_engine	engine;

	struct clk		*sat_clk;
	struct reset_control	*sat_reset;
=09
};

static void sun4i_backend_apply_color_correction(struct sunxi_engine *engin=
e)
       struct sun4i_backend *backend =3D container_of(engine, struct sun4i_=
backend, engine);

=2E..

> +static const struct sunxi_engine_ops sun4i_backend_engine_ops =3D {
> +	.commit =3D sun4i_backend_commit,
> +	.layers_init =3D sun4i_layers_init,
> +	.apply_color_correction =3D sun4i_backend_apply_color_correction,
> +	.disable_color_correction =3D sun4i_backend_disable_color_correction,

Please align the values with tabs, like done in the other structures
created that way in this driver.

>  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
> @@ -56,7 +55,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *cr=
tc,
> =20
>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
> =20
> -	sun4i_backend_commit(scrtc->backend);
> +	scrtc->engine_ops->commit(scrtc->engine);

You rely on the backend having setup things properly, which is pretty
fragile. Ideally, you should have a function to check that engine_ops
and commit is !NULL, and call it, and the consumers would use that
function...

> @@ -362,7 +361,9 @@ static void sun4i_tv_disable(struct drm_encoder *enco=
der)
>  	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
>  			   SUN4I_TVE_EN_ENABLE,
>  			   0);
> -	sun4i_backend_disable_color_correction(backend);
> +
> +	if (crtc->engine_ops->disable_color_correction)
> +		crtc->engine_ops->disable_color_correction(crtc->engine);
>  }

=2E.. Instead of having to do it in some cases, but not always ...

>  static void sun4i_tv_enable(struct drm_encoder *encoder)
> @@ -370,11 +371,11 @@ static void sun4i_tv_enable(struct drm_encoder *enc=
oder)
>  	struct sun4i_tv *tv =3D drm_encoder_to_sun4i_tv(encoder);
>  	struct sun4i_crtc *crtc =3D drm_crtc_to_sun4i_crtc(encoder->crtc);
>  	struct sun4i_tcon *tcon =3D crtc->tcon;
> -	struct sun4i_backend *backend =3D crtc->backend;
> =20
>  	DRM_DEBUG_DRIVER("Enabling the TV Output\n");
> =20
> -	sun4i_backend_apply_color_correction(backend);
> +	if (crtc->engine_ops->apply_color_correction)
> +		crtc->engine_ops->apply_color_correction(crtc->engine);
> =20
>  	regmap_update_bits(tv->regs, SUN4I_TVE_EN_REG,
>  			   SUN4I_TVE_EN_ENABLE,
> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i=
/sunxi_engine.h
> new file mode 100644
> index 000000000000..a9128abda66f
> --- /dev/null
> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + */
> +
> +#ifndef _SUNXI_ENGINE_H_
> +#define _SUNXI_ENGINE_H_
> +
> +struct sun4i_crtc;
> +
> +struct sunxi_engine_ops {
> +	/* Commit the changes to the engine */
> +	void (*commit)(void *engine);
> +	/* Initialize layers (planes) for this engine */
> +	struct drm_plane **(*layers_init)(struct drm_device *drm,
> +					  struct sun4i_crtc *crtc);
> +
> +	/*
> +	 * These are optional functions for the TV Encoder. Please check
> +	 * their presence before calling them.
> +	 *
> +	 * The first function applies the color space correction needed
> +	 * for outputing correct TV signal.
> +	 *
> +	 * The second function disabled the correction.
> +	 */
> +	void (*apply_color_correction)(void *engine);
> +	void (*disable_color_correction)(void *engine);

=2E.. And have to document it.

Please also use kerneldoc for those comments.

Thanks again!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4eoi5okntjngbazg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY9dSIAAoJEBx+YmzsjxAg4lgP/1c3CdGcFEH1zaCyp1LFdv9L
KX8pwabsTJz7mi858IdRnXnGdyAuofjJL5WsClHCsovpBYhg5U1Gk/nkT1h9P8jL
pI20ZsuFSNyEsgv9YHWGWc2OUJVjIjB30LWKgUOucALWXOs5Ru2i5h3NSGfP7Km1
Sx7evdVlFnPQH5eqfejHfbeNQj326CHe6i8+Q2KrPStZPwP3Wmuwx9wKhjoTl4/Z
3sQtycy6OpdjWvGJjJeK9bPoC98iwy1iqZ1cpMsWicnCetPfLnZP+lIZC7vaZS8o
suNJ7WYUbMnNCjbsvcjkLCD+IR+GJUZqPHF/4SU5uzm+uTuzFHxU+ReGSK9JjORw
v5K/OVKish0+fVjCpwZVfBe1gd7K3zNUAw+9ekS1uRKBtbn/FvC8q1OUb1Aj6n6r
vuVnbJdMmGwVfwgQiTQOzx0f7CB+iwJt0RJ2DYRqDioyLmo5HY8bt5zIiOUZqTJH
QC1nJQQxMKF8T2exEuXPWPIzMcy0GUGBHsGbrB2f4kzOKRRTt6Ep8cmMc7aK6f8r
n7nybYGsa57GVoe4h+muE2XDX8g0RHhWSeMmqHnxqZUvBUrDJk7VJv7MeCPMf1ES
T2CM+NV/Bbs6vux3ZgBwJTsKwldhG7yAlz6EEZ+cVNq0RB78PDMBd7SGiZm9h/5j
9wNZPWj3rstuMzdFVI4x
=l71y
-----END PGP SIGNATURE-----

--4eoi5okntjngbazg--


--===============4824089932659554726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4824089932659554726==--
