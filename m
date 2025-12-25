Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D497FBAC
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766690436; cv=none; b=S46+hD+iNz/LjThrK6k7IStb/JhZQFS4ttck8mmsJJjNtzsUlHr4pbGuNrxp86KVXrSXYqbPEIjggLjJGu4fsEfHz/Q/QSXpaYpJ6Xuw2aAZS98SRNoiGTz4Ff+Ni8+OF1qnpIBoo12SMXbYG6qsJu7Ro/x9DFLQTw7zyQUAcXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766690436; c=relaxed/simple;
	bh=0PfIin8bEwrQB3wJ7TGQjFSnwfk4p56z0vNr2dH6Apc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXmEWrQ3e5FK6cO8dbbJCDKS0z3L3D/tjKnFFOXQ5fnWP772wqb5mgLqLSZnzOEVdiDxDgNqmdxOxXtWqQT9q/JoJu7hzj1b+A8swN0MB3ws1UxEsPdmVzS8NZCqptLmgHsp238h6tijT2PmhdUHMGEvFSPYiIWMRDTZXAEFwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2y9snkm; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2y9snkm"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64d80a47491so7255954a12.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 11:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766690432; x=1767295232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ual+W6DDkJtt+syVHuGALj1VtGBu5zyBQ1OOhp1LPA=;
        b=A2y9snkmmsnJY/cOUgeTe62vEitTiGSsTkxDqvr3hgISQzZaWWKrZV1Wjn/RZj2bIP
         aHEcH9qJzTY/Au4mxI0qaTIxPEyQtbggC6ZIqOYyU1yeTRVlvifGE0L3jJZr9cpVDIwI
         54+lONwgSe4+bhvkUBaP4k1VNbr220evN5vikAvFo92zJtTrljPmGQBbU/KHw7Izu+h+
         x/laF9gQ75wRnMgRp623QXm7DG9nC/K2QM2fIxW4xnPJeyG6eqy9XxYk5vfYOyzdIAGc
         kwnimTu7Z7e2smlrAXHQFHWStt/+6V9/XbMxxgi5JJ5DqGDqx3bLTFawNGtF8YMkPzus
         tO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766690432; x=1767295232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ual+W6DDkJtt+syVHuGALj1VtGBu5zyBQ1OOhp1LPA=;
        b=CYcMOYWCLIzXaBPAKwbOW2DMCdNnNO5iGZPvmobVzWc4k+0z8u7RTJlIgrGSOj76Lh
         73VZwhLqS6Ft2tvS2d3JErsECUTZsZGKugaAkl9YqVhyZZzfE6Sih5tGH+erebyub9UA
         mwbCVJ7P/KZ3FEkTvPL74mqPt9TV0LGxNPpvvohfeAYxT1o7IIjq9de50CYWgM1Js/aL
         QV+EefzxpWMwP3JBu4WHGhLaWLRZj0CN8Asu3pxLJQ48oTB2WNpE+REcSMRNdhgLR3NZ
         8cUwRmR06ISkK4tyGG0yOrT9SZXCkSGU8Qx6/7dQ5p5feZgNaMu7y9+462xcfypdU2Tk
         lmeA==
X-Forwarded-Encrypted: i=1; AJvYcCX3dm7v1wKX3vR6bU5k3GYHhJ8SzLm+RRiTm0qcJ+g1wuckXLqZsBi+VOeDxRY8caJzFcaIZxSzwkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3HDtcFI8lMlplqtCzuisHq/hFhLZq0OQP8D/Ml/+Cq5gVkuE
	JYsPld2Z1KEUtwAuYy0Yls3P1cZaMiKf7t1fRBe9+KitlNHwpsPGSy3a
X-Gm-Gg: AY/fxX6zcPzHBDrLyDSp+/Vp24YMm+craUrKyRThDmfhSCtQPF4nLp3yp5UTj7MtnVh
	t8EAiEjpeeet2HRkFNMm7CdNiHbZjoT3VpHmyzTXIvruU+58J6c/jy6POWfv/tXnihoxhJlSYTF
	9aCALqLRAO3pVyKyLXUgmRjrNKPhS/eu3No0GKnyum5MLX0XhrSK/4MskzgYuQDshCaVmcveXwy
	K4wbxjpU7LYH2LT8r7RtSho+GNTiXOw7v7JXR3hv4DnnLtqhivbioGm9FgLGBTyigCxNmPxUdkK
	/y0FxMgZZhxNLUD2mP6I4El8V4D4rCBQKJuCZVVZCdBpjLfezLTmZbdWBgL9oNMfNe/9AIoAbxw
	j6K6MyETQC4EjNP1SsRkVV6hAQZY76IEWyi5X4gsMGw5oJF2giecLZ9OKO7VtcX8T8kTR8drP9b
	318gW5+sNFGKnG+iaznUoCoxyEvB461UNz
X-Google-Smtp-Source: AGHT+IG3koG/3abxHLtWkZ337VV1CmsvGGyayKli2Quehqnffrl9OvRiJwbUvz3ehq/xnRoimTHc8Q==
X-Received: by 2002:a05:6402:2808:b0:647:5f97:ab37 with SMTP id 4fb4d7f45d1cf-64b8cd31acfmr22428490a12.2.1766690432300;
        Thu, 25 Dec 2025 11:20:32 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm20550613a12.8.2025.12.25.11.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:20:31 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/sun4i: switch DE33 to new bindings
Date: Thu, 25 Dec 2025 20:20:29 +0100
Message-ID: <3684052.iIbC2pHGDl@jernej-laptop>
In-Reply-To:
 <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-8-jernej.skrabec@gmail.com>
 <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 10:49:47 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> <jernej.skrabec@gmail.com> wrote:
> >
> > Now that everything is in place, switch DE33 to new bindings.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 130 +++++++++++++++-------------
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +--
> >  2 files changed, 71 insertions(+), 69 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4=
i/sun8i_mixer.c
> > index fde3b677e925..da213e54e653 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset.h>
> >
> > @@ -24,6 +25,7 @@
> >  #include <drm/drm_probe_helper.h>
> >
> >  #include "sun4i_drv.h"
> > +#include "sun50i_planes.h"
> >  #include "sun8i_mixer.h"
> >  #include "sun8i_ui_layer.h"
> >  #include "sun8i_vi_layer.h"
> > @@ -256,7 +258,6 @@ static void sun8i_mixer_commit(struct sunxi_engine =
*engine,
> >  {
> >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> >         u32 bld_base =3D sun8i_blender_base(mixer);
> > -       struct regmap *bld_regs =3D sun8i_blender_regmap(mixer);
> >         struct drm_plane_state *plane_state;
> >         struct drm_plane *plane;
> >         u32 route =3D 0, pipe_en =3D 0;
> > @@ -293,16 +294,16 @@ static void sun8i_mixer_commit(struct sunxi_engin=
e *engine,
> >                 route |=3D layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE=
_SHIFT(zpos);
> >                 pipe_en |=3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> >
> > -               regmap_write(bld_regs,
> > +               regmap_write(engine->regs,
> >                              SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpo=
s),
> >                              SUN8I_MIXER_COORD(x, y));
> > -               regmap_write(bld_regs,
> > +               regmap_write(engine->regs,
> >                              SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zp=
os),
> >                              SUN8I_MIXER_SIZE(w, h));
> >         }
> >
> > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route=
);
> > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), r=
oute);
> > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> >                      pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> >
> >         if (mixer->cfg->de_type !=3D SUN8I_MIXER_DE33)
> > @@ -317,7 +318,6 @@ static struct drm_plane **sun8i_layers_init(struct =
drm_device *drm,
> >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> >         int plane_cnt =3D mixer->cfg->ui_num + mixer->cfg->vi_num;
> >         enum drm_plane_type type;
> > -       unsigned int phy_index;
> >         int i;
> >
> >         planes =3D devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), G=
=46P_KERNEL);
> > @@ -332,12 +332,8 @@ static struct drm_plane **sun8i_layers_init(struct=
 drm_device *drm,
> >                 else
> >                         type =3D DRM_PLANE_TYPE_OVERLAY;
> >
> > -               phy_index =3D i;
> > -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > -                       phy_index =3D mixer->cfg->map[i];
> > -
> >                 layer =3D sun8i_vi_layer_init_one(drm, type, mixer->eng=
ine.regs,
> > -                                               i, phy_index, plane_cnt,
> > +                                               i, i, plane_cnt,
> >                                                 &mixer->cfg->lay_cfg);
> >                 if (IS_ERR(layer)) {
> >                         dev_err(drm->dev,
> > @@ -357,12 +353,8 @@ static struct drm_plane **sun8i_layers_init(struct=
 drm_device *drm,
> >                 else
> >                         type =3D DRM_PLANE_TYPE_OVERLAY;
> >
> > -               phy_index =3D index;
> > -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > -                       phy_index =3D mixer->cfg->map[index];
> > -
> >                 layer =3D sun8i_ui_layer_init_one(drm, type, mixer->eng=
ine.regs,
> > -                                               index, phy_index, plane=
_cnt,
> > +                                               index, index, plane_cnt,
> >                                                 &mixer->cfg->lay_cfg);
> >                 if (IS_ERR(layer)) {
> >                         dev_err(drm->dev, "Couldn't initialize %s plane=
\n",
> > @@ -376,16 +368,25 @@ static struct drm_plane **sun8i_layers_init(struc=
t drm_device *drm,
> >         return planes;
> >  }
> >
> > +static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
> > +                                            struct sunxi_engine *engin=
e)
> > +{
> > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > +
> > +       if (IS_ENABLED(CONFIG_DRM_SUN50I_PLANES))
> > +               return sun50i_planes_setup(mixer->planes_dev, drm, engi=
ne->id);
> > +
> > +       return NULL;
> > +}
> > +
> >  static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
> >                                  const struct drm_display_mode *mode)
> >  {
> >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > -       struct regmap *bld_regs;
> >         u32 bld_base, size, val;
> >         bool interlaced;
> >
> >         bld_base =3D sun8i_blender_base(mixer);
> > -       bld_regs =3D sun8i_blender_regmap(mixer);
> >         interlaced =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
> >         size =3D SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
> >
> > @@ -397,14 +398,14 @@ static void sun8i_mixer_mode_set(struct sunxi_eng=
ine *engine,
> >         else
> >                 regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZ=
E, size);
> >
> > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), siz=
e);
> > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base),=
 size);
> >
> >         if (interlaced)
> >                 val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> >         else
> >                 val =3D 0;
> >
> > -       regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> > +       regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_b=
ase),
> >                            SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
> >
> >         DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> > @@ -417,8 +418,14 @@ static const struct sunxi_engine_ops sun8i_engine_=
ops =3D {
> >         .mode_set       =3D sun8i_mixer_mode_set,
> >  };
> >
> > +static const struct sunxi_engine_ops sun50i_engine_ops =3D {
> > +       .commit         =3D sun8i_mixer_commit,
> > +       .layers_init    =3D sun50i_layers_init,
> > +       .mode_set       =3D sun8i_mixer_mode_set,
> > +};
> > +
> >  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> > -       .name           =3D "layers",
> > +       .name           =3D "display",
> >         .reg_bits       =3D 32,
> >         .val_bits       =3D 32,
> >         .reg_stride     =3D 4,
> > @@ -433,14 +440,6 @@ static const struct regmap_config sun8i_top_regmap=
_config =3D {
> >         .max_register   =3D 0x3c,
> >  };
> >
> > -static const struct regmap_config sun8i_disp_regmap_config =3D {
> > -       .name           =3D "display",
> > -       .reg_bits       =3D 32,
> > -       .val_bits       =3D 32,
> > -       .reg_stride     =3D 4,
> > -       .max_register   =3D 0x20000,
> > -};
> > -
> >  static int sun8i_mixer_of_get_id(struct device_node *node)
> >  {
> >         struct device_node *ep, *remote;
> > @@ -463,17 +462,14 @@ static int sun8i_mixer_of_get_id(struct device_no=
de *node)
> >
> >  static void sun8i_mixer_init(struct sun8i_mixer *mixer)
> >  {
> > -       struct regmap *top_regs, *disp_regs;
> >         unsigned int base =3D sun8i_blender_base(mixer);
> > +       struct regmap *top_regs;
> >         int plane_cnt, i;
> >
> > -       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> >                 top_regs =3D mixer->top_regs;
> > -               disp_regs =3D mixer->disp_regs;
> > -       } else {
> > +       else
> >                 top_regs =3D mixer->engine.regs;
> > -               disp_regs =3D mixer->engine.regs;
> > -       }
> >
> >         /* Enable the mixer */
> >         regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
> > @@ -483,25 +479,25 @@ static void sun8i_mixer_init(struct sun8i_mixer *=
mixer)
> >                 regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
> >
> >         /* Set background color to black */
> > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base=
),
> >                      SUN8I_MIXER_BLEND_COLOR_BLACK);
> >
> >         /*
> >          * Set fill color of bottom plane to black. Generally not needed
> >          * except when VI plane is at bottom (zpos =3D 0) and enabled.
> >          */
> > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(bas=
e),
> >                      SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(=
base, 0),
> >                      SUN8I_MIXER_BLEND_COLOR_BLACK);
> >
> >         plane_cnt =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
> >         for (i =3D 0; i < plane_cnt; i++)
> > -               regmap_write(disp_regs,
> > +               regmap_write(mixer->engine.regs,
> >                              SUN8I_MIXER_BLEND_MODE(base, i),
> >                              SUN8I_MIXER_BLEND_MODE_DEF);
> >
> > -       regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> > +       regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_C=
TL(base),
> >                            SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> >  }
> >
> > @@ -532,7 +528,6 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
> >         if (!mixer)
> >                 return -ENOMEM;
> >         dev_set_drvdata(dev, mixer);
> > -       mixer->engine.ops =3D &sun8i_engine_ops;
> >         mixer->engine.node =3D dev->of_node;
> >
> >         if (of_property_present(dev->of_node, "iommus")) {
> > @@ -562,6 +557,11 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct device *master,
> >         if (!mixer->cfg)
> >                 return -EINVAL;
> >
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > +               mixer->engine.ops =3D &sun50i_engine_ops;
>=20
> You're missing an IS_ENABLED() clause here if you wanted to make the DE 3=
=2E3
> planes driver optional. Though as I mentioned in the other patch, splittig
> the two modules might not work.

No, as I said in previous response, I'll merge it into sun8i-mixer.

>=20
> > +       else
> > +               mixer->engine.ops =3D &sun8i_engine_ops;
> > +
> >         regs =3D devm_platform_ioremap_resource(pdev, 0);
> >         if (IS_ERR(regs))
> >                 return PTR_ERR(regs);
> > @@ -584,17 +584,6 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct device *master,
> >                         dev_err(dev, "Couldn't create the top regmap\n"=
);
> >                         return PTR_ERR(mixer->top_regs);
> >                 }
> > -
> > -               regs =3D devm_platform_ioremap_resource_byname(pdev, "d=
isplay");
> > -               if (IS_ERR(regs))
> > -                       return PTR_ERR(regs);
> > -
> > -               mixer->disp_regs =3D devm_regmap_init_mmio(dev, regs,
> > -                                                        &sun8i_disp_re=
gmap_config);
> > -               if (IS_ERR(mixer->disp_regs)) {
> > -                       dev_err(dev, "Couldn't create the disp regmap\n=
");
> > -                       return PTR_ERR(mixer->disp_regs);
> > -               }
> >         }
> >
> >         mixer->reset =3D devm_reset_control_get(dev, NULL);
> > @@ -634,6 +623,33 @@ static int sun8i_mixer_bind(struct device *dev, st=
ruct device *master,
> >
> >         clk_prepare_enable(mixer->mod_clk);
> >
> > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> > +               struct platform_device *pdev;
> > +               struct device_node *np;
> > +               void *data;
> > +
> > +               np =3D of_parse_phandle(dev->of_node, "allwinner,planes=
", 0);
> > +               if (!np) {
> > +                       ret =3D -ENODEV;
> > +                       goto err_disable_mod_clk;
> > +               }
> > +
> > +               pdev =3D of_find_device_by_node(np);
>=20
> You need to add a matching put_device() in the unbind function.
>=20
> Side note:
>=20
> This bind function is using a lot of devm_ functions. These have the wrong
> lifetime. I think it would be better if we could move resource acquisition
> into the probe function.

Good point. This can be clean up later.

>=20
>=20
> > +               of_node_put(np);
> > +               if (!pdev) {
> > +                       ret =3D -EPROBE_DEFER;
> > +                       goto err_disable_mod_clk;
> > +               }
> > +
> > +               data =3D platform_get_drvdata(pdev);
> > +               if (!data) {
> > +                       put_device(&pdev->dev);
> > +                       return -EPROBE_DEFER;
>=20
> Should be a goto here?

Right.

Best regards,
Jernej

>=20
>=20
> ChenYu
>=20
> > +               }
> > +
> > +               mixer->planes_dev =3D &pdev->dev;
> > +       }
> > +
> >         list_add_tail(&mixer->engine.list, &drv->engine_list);
> >
> >         /* Reset registers and disable unused sub-engines */
> > @@ -668,6 +684,8 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
> >
> >         return 0;
> >
> > +err_disable_mod_clk:
> > +       clk_disable_unprepare(mixer->mod_clk);
> >  err_disable_bus_clk:
> >         clk_disable_unprepare(mixer->bus_clk);
> >  err_assert_reset:
> > @@ -863,16 +881,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixe=
r0_cfg =3D {
> >  };
> >
> >  static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg =3D {
> > -       .lay_cfg =3D {
> > -               .de_type        =3D SUN8I_MIXER_DE33,
> > -               .scaler_mask    =3D 0xf,
> > -               .scanline_yuv   =3D 4096,
> > -       },
> >         .de_type        =3D SUN8I_MIXER_DE33,
> >         .mod_rate       =3D 600000000,
> > -       .ui_num         =3D 3,
> > -       .vi_num         =3D 1,
> > -       .map            =3D {0, 6, 7, 8},
> >  };
> >
> >  static const struct of_device_id sun8i_mixer_of_table[] =3D {
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4=
i/sun8i_mixer.h
> > index e2f83301aae8..7abc88c898d9 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
> >         int                     ui_num;
> >         unsigned int            de_type;
> >         unsigned long           mod_rate;
> > -       unsigned int            map[6];
> >  };
> >
> >  struct sun8i_mixer {
> > @@ -216,7 +215,7 @@ struct sun8i_mixer {
> >         struct clk                      *mod_clk;
> >
> >         struct regmap                   *top_regs;
> > -       struct regmap                   *disp_regs;
> > +       struct device                   *planes_dev;
> >  };
> >
> >  enum {
> > @@ -252,13 +251,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
> >         return mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE3 ? DE3_BLD_BAS=
E : DE2_BLD_BASE;
> >  }
> >
> > -static inline struct regmap *
> > -sun8i_blender_regmap(struct sun8i_mixer *mixer)
> > -{
> > -       return mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33 ?
> > -               mixer->disp_regs : mixer->engine.regs;
> > -}
> > -
> >  static inline u32
> >  sun8i_channel_base(struct sun8i_layer *layer)
> >  {
> > --
> > 2.51.2
> >
> >
>=20




