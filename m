Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5FF24677A
	for <linux-clk@vger.kernel.org>; Sun, 15 Feb 2026 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771139020; cv=none; b=S9JqDZMf55vOKKCNOVt2F3NLocEIJEp7pUurKHq8RQ1W/Tds4SzgReRp/wF/I1ahx2BlXlR52DFI52rUeLg0GKOfJjLrotUevYUMxaP1I9P+fYXnqd9TvnMq4zzz6wVNrAQ17T1nKDg+obdGszplNyM2aF/Krno/xRBvDbGVy/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771139020; c=relaxed/simple;
	bh=6aJthlOel/fQ4UXJiao/R4OrfMqOBdWVLslBJ1nqCDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S0TfJzkerzzYHB5st7SoZQ9/MiIDBPs/VXYjxA3GfEw7VJqbrlbswfKj9dp/QV09P0C+lvt9GmIreBbcswsbzrixCmEnIZhFNiQfKdetERuJAwsvKL6Wkb5EptbGg/VsXp7+g82SkdvzjDexIIiEHEHLRLx+slgg8oPwU9ghgpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVlFUWjw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVlFUWjw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48375f1defeso15368875e9.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Feb 2026 23:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771139017; x=1771743817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1g+0t9HyVXdFrZRpw6jgWddfRKPzWReFsz+gFXMWCcY=;
        b=VVlFUWjwj3X8XPFp5mNLyfe8zmvXy3jMUVqt/zvsec4FmW7wdwLbNyK/ONESm5/S/P
         Vepmpv7qtOOUCTMvcQGIPR4YsDWHyXnX+wIPYadcNYNW+4HV7DFTujhE0eKv14s7Llvr
         aBOrvsMxSXVK5MIGmIQ09AhCWH6KpyINMtQ7PN6bpgCz5C/eTNPuudUlY1dayhg9kvml
         dD6KAo8fm6kVucfHvTAg/ReGIlzMu7BJdhmgXUvTgELFB4pDvfHxGJGaBPp7hirpL3HB
         7pYRig5bH80N7wa48Ge3OJNzep5uNOnLpble0YZMFh2VCrB3p+MAO8L2OyZ5emEpWaNC
         abFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771139017; x=1771743817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1g+0t9HyVXdFrZRpw6jgWddfRKPzWReFsz+gFXMWCcY=;
        b=axLPYJX+sj7mzshYjv+vNPJXTBIVJbkeB1kyg+eru20/Pb/8OEWsGygQjNcPEF+Y5b
         jktTnn6XuzTPtdGsAsZEbefLxR4et3tMwDULfnZ+oHjG6hsMq7E8o8hGKX9+KlhCbeLr
         B7R61Z3eEYa3niCRU0T83lvdrmZfwb1XfOe+Lv5aL90A83o4tjXwemxd659+2+JvJrJw
         0UBeISLyw3XLB5kFKa0/W0RkUvQ/BLaa4BNOOzg/jtYQZft2gUY13gs2Wk5tHtlsezIO
         C51Z/VxfXGhc6psMD+F1PhDiHdSssJJhqmYQaoEUUDe+Tc757B/EMCSiZRM9+Y9XWX8G
         YLew==
X-Forwarded-Encrypted: i=1; AJvYcCVfz163pGZ/ueLntgG0k/0gJqro9bOA1u6VDt6E26BywIvD8lXm2GwgAxXB4xohaYmbcCMgU8C8g0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4DWsPgE+HCXO/8JBsySy02GJYOPOKSxaYyIVCL/w3clz65ixH
	0Uc60kNDQVdGRHJYE8SkB25DoDLYTEMWnWCwoJTeOq+NHQ9Fk9Yo57j1
X-Gm-Gg: AZuq6aJ+AE+4+O1SJpYJib8gQWHlaCLJuE/deB2s9kpIpd/5LiCZWwGVea732EApM6W
	oME3SKhBT/QYo/UpXN2QW3CmErXbPlPMl+1SohNTE/093eTzLwCQK60RvV3xS29+Rq+lxwtQLIH
	x7frt35pLFMwMX50hMazpv0zr/uDz9oG+SU2qQPxULbOBMrhjVtBwBsv9Yu9jPttusNEO4MOLI7
	6SbwRFCwxC4/dxCyel+z73OIG55/5+9hXlHtxjS8AC1Yzoq8f2AXR3mGV/LTWOLQQpROmf7SM3O
	QnmO+CBAjgRa4LW4wxCXtC5JpZhjdwPOlZbXUMVRLFje+UqFhjVhiSMy9jY+vFD0u4tSiORVwXo
	3pPGBTvNLJiGiHo+NXiQu8nfu3vjNWEmAYZ72z7CrqlgZRWunl8diTgCxvyyAyKgvDUI3f9ZeAM
	R7Ac8cis+KV6ODHsF+LQlIQt9hIINdms9jf9Bj3sJEmB5dDjjUoVkF4H77P2ufFeQFTHXVyQUu/
	BV35ygwAZiJLbNx9Sr/QzVTQCTx
X-Received: by 2002:a05:600c:1c22:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-48373a786f3mr128369245e9.33.1771139017090;
        Sat, 14 Feb 2026 23:03:37 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-79-213.dynamic.telemach.net. [178.79.79.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm168216905e9.2.2026.02.14.23.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 23:03:36 -0800 (PST)
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
Date: Sat, 14 Feb 2026 21:55:00 +0100
Message-ID: <5047516.GXAFRqVoOG@jernej-laptop>
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

Hi Chen-Yu,

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

Looking a bit more into this, this requires a bit more work. For example, c=
locks
can be provided by tcon-top, which are created only in bind callback. Basic=
ally,
whole sun4i-drm driver depends on devm_* calls in bind functions. This would
need careful analysis of all driver calls and then refactoring drivers one =
by one.=20

IMO tcon-top driver needs to be refactored to plain clock driver without co=
mponent
bind/unbind functions. Although this may cause slightly higher power consum=
ption
if device doesn't have display but driver is loaded nevertheless.

What do you think?

Best regards,
Jernej



