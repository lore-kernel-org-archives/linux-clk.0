Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF75277C9E
	for <linux-clk@vger.kernel.org>; Sun, 15 Feb 2026 07:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771139594; cv=none; b=F7NBcSeSTqvIkf6cVqWLmeFPbPIUSx7MJFtDFe6Hm+sLDjMXh4XytciFeHllBWZnTx15oUhf6yNbRjPr17fTYggWu6byNNTij1XpIpLSlfmbUM9cRAkt6QuH4NfQKttCBCtaMm6xx7oB4/YZWDvEOcM6lqy7sMbluj0r6aTkXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771139594; c=relaxed/simple;
	bh=T+2YgmZCyE4C+I+RkFGx+TjN0SFl1Bbne2hkNWWCq8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GM8O0KwFJrv9JUnmzy1cuqPgcIUtJ2W0ehklRihk7FAJbZseHtmf6GqRi3AEVm/SC4EKvuzPUP7gfM16qM3cFq7WsQ0j5ioPW8H61y6+QYtXBNbywDrn3F9fEQlg5ulOVuSR+mzZCjFx+3S7ypBQvgUHCi8EQS4Y5CPVDLt+SSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vATdvhTX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vATdvhTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552F0C2BC86
	for <linux-clk@vger.kernel.org>; Sun, 15 Feb 2026 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771139594;
	bh=T+2YgmZCyE4C+I+RkFGx+TjN0SFl1Bbne2hkNWWCq8I=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=vATdvhTXqdsTLkR43pbGnZgzP0fwRNukAV0UdhY6eSkl1ZsysaJb0pIvamVZT2E9z
	 gyskIQPGPKxYIpYhCA8RlI5lGEAo/xib99lySI0Gnheq6SFv5TXdKAHEKW4IP8DhXT
	 4AsggrfTo1Gmnn4B97py0+3Cmqc00IGqVloQ/DSOZLN9LhmVaYVZ7OiPZCgsmLNVpC
	 fry/0AGMXtaOeiza4bFH2VhPpg3lRJ+mUrPS/BML2SDo5qtqGX2TxYJ3nbwPGMQyd/
	 5qfw1VVWlLZhR8j8KkUIc+31eOcdubbxPmiqXpEz7u3OtHfR/QxyCJ/Vi9bx7646KJ
	 p/wWY80SJe4mw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-386714da2a2so17889341fa.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Feb 2026 23:13:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdljLl0eCNP7HLFWcGL/nZwOZQ1fD2+J4ptQbh4R9VYgCDTA01iiKLzK0YWkKVldty1nN01O6ygx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoZFjQLFhFc8Zb1EGmjMklJoN0PTBJxAy7M+e0Bb0eyYqfWTzB
	d82ygJ3pK/Zh/i3MEwZ/8pkkHlEd/ajFcAtt/B6/WyhsLMJcrLgoETz/Qlve5bblqJGBmIZCvq0
	2JxWlkWGOg8Rt/KxCvo8Y1mZnohRKo9Q=
X-Received: by 2002:a05:651c:3042:b0:385:f3df:c375 with SMTP id
 38308e7fff4ca-3881b97c4d6mr8983961fa.36.1771139592579; Sat, 14 Feb 2026
 23:13:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-8-jernej.skrabec@gmail.com> <CAGb2v67B_2SMsDbATVu51Ed+2o+6=FRLw7KmjeL1KYgxm=gyDw@mail.gmail.com>
 <5047516.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <5047516.GXAFRqVoOG@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Feb 2026 15:13:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64L1bhOTkVegmd=H83ceVkQSQCAA5h=wu_YjpDS1nuvog@mail.gmail.com>
X-Gm-Features: AaiRm52URlQdYETFUTCV8VojqZTbAYlBjxg9KO2lGpt3t4I6YTUR894fs5tx07g
Message-ID: <CAGb2v64L1bhOTkVegmd=H83ceVkQSQCAA5h=wu_YjpDS1nuvog@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm/sun4i: switch DE33 to new bindings
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 3:03=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> Dne =C4=8Detrtek, 25. december 2025 ob 10:49:47 Srednjeevropski standardn=
i =C4=8Das je Chen-Yu Tsai napisal(a):
> > On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> > <jernej.skrabec@gmail.com> wrote:
> > >
> > > Now that everything is in place, switch DE33 to new bindings.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 130 +++++++++++++++-----------=
--
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +--
> > >  2 files changed, 71 insertions(+), 69 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/su=
n4i/sun8i_mixer.c
> > > index fde3b677e925..da213e54e653 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/of_device.h>
> > >  #include <linux/of_graph.h>
> > > +#include <linux/of_platform.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/reset.h>
> > >
> > > @@ -24,6 +25,7 @@
> > >  #include <drm/drm_probe_helper.h>
> > >
> > >  #include "sun4i_drv.h"
> > > +#include "sun50i_planes.h"
> > >  #include "sun8i_mixer.h"
> > >  #include "sun8i_ui_layer.h"
> > >  #include "sun8i_vi_layer.h"
> > > @@ -256,7 +258,6 @@ static void sun8i_mixer_commit(struct sunxi_engin=
e *engine,
> > >  {
> > >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > >         u32 bld_base =3D sun8i_blender_base(mixer);
> > > -       struct regmap *bld_regs =3D sun8i_blender_regmap(mixer);
> > >         struct drm_plane_state *plane_state;
> > >         struct drm_plane *plane;
> > >         u32 route =3D 0, pipe_en =3D 0;
> > > @@ -293,16 +294,16 @@ static void sun8i_mixer_commit(struct sunxi_eng=
ine *engine,
> > >                 route |=3D layer->index << SUN8I_MIXER_BLEND_ROUTE_PI=
PE_SHIFT(zpos);
> > >                 pipe_en |=3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > >
> > > -               regmap_write(bld_regs,
> > > +               regmap_write(engine->regs,
> > >                              SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, z=
pos),
> > >                              SUN8I_MIXER_COORD(x, y));
> > > -               regmap_write(bld_regs,
> > > +               regmap_write(engine->regs,
> > >                              SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, =
zpos),
> > >                              SUN8I_MIXER_SIZE(w, h));
> > >         }
> > >
> > > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), rou=
te);
> > > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base),=
 route);
> > > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_bas=
e),
> > >                      pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> > >
> > >         if (mixer->cfg->de_type !=3D SUN8I_MIXER_DE33)
> > > @@ -317,7 +318,6 @@ static struct drm_plane **sun8i_layers_init(struc=
t drm_device *drm,
> > >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > >         int plane_cnt =3D mixer->cfg->ui_num + mixer->cfg->vi_num;
> > >         enum drm_plane_type type;
> > > -       unsigned int phy_index;
> > >         int i;
> > >
> > >         planes =3D devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes),=
 GFP_KERNEL);
> > > @@ -332,12 +332,8 @@ static struct drm_plane **sun8i_layers_init(stru=
ct drm_device *drm,
> > >                 else
> > >                         type =3D DRM_PLANE_TYPE_OVERLAY;
> > >
> > > -               phy_index =3D i;
> > > -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > > -                       phy_index =3D mixer->cfg->map[i];
> > > -
> > >                 layer =3D sun8i_vi_layer_init_one(drm, type, mixer->e=
ngine.regs,
> > > -                                               i, phy_index, plane_c=
nt,
> > > +                                               i, i, plane_cnt,
> > >                                                 &mixer->cfg->lay_cfg)=
;
> > >                 if (IS_ERR(layer)) {
> > >                         dev_err(drm->dev,
> > > @@ -357,12 +353,8 @@ static struct drm_plane **sun8i_layers_init(stru=
ct drm_device *drm,
> > >                 else
> > >                         type =3D DRM_PLANE_TYPE_OVERLAY;
> > >
> > > -               phy_index =3D index;
> > > -               if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > > -                       phy_index =3D mixer->cfg->map[index];
> > > -
> > >                 layer =3D sun8i_ui_layer_init_one(drm, type, mixer->e=
ngine.regs,
> > > -                                               index, phy_index, pla=
ne_cnt,
> > > +                                               index, index, plane_c=
nt,
> > >                                                 &mixer->cfg->lay_cfg)=
;
> > >                 if (IS_ERR(layer)) {
> > >                         dev_err(drm->dev, "Couldn't initialize %s pla=
ne\n",
> > > @@ -376,16 +368,25 @@ static struct drm_plane **sun8i_layers_init(str=
uct drm_device *drm,
> > >         return planes;
> > >  }
> > >
> > > +static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
> > > +                                            struct sunxi_engine *eng=
ine)
> > > +{
> > > +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > > +
> > > +       if (IS_ENABLED(CONFIG_DRM_SUN50I_PLANES))
> > > +               return sun50i_planes_setup(mixer->planes_dev, drm, en=
gine->id);
> > > +
> > > +       return NULL;
> > > +}
> > > +
> > >  static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
> > >                                  const struct drm_display_mode *mode)
> > >  {
> > >         struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> > > -       struct regmap *bld_regs;
> > >         u32 bld_base, size, val;
> > >         bool interlaced;
> > >
> > >         bld_base =3D sun8i_blender_base(mixer);
> > > -       bld_regs =3D sun8i_blender_regmap(mixer);
> > >         interlaced =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
> > >         size =3D SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
> > >
> > > @@ -397,14 +398,14 @@ static void sun8i_mixer_mode_set(struct sunxi_e=
ngine *engine,
> > >         else
> > >                 regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_S=
IZE, size);
> > >
> > > -       regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), s=
ize);
> > > +       regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base=
), size);
> > >
> > >         if (interlaced)
> > >                 val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> > >         else
> > >                 val =3D 0;
> > >
> > > -       regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_bas=
e),
> > > +       regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld=
_base),
> > >                            SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
> > >
> > >         DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\=
n",
> > > @@ -417,8 +418,14 @@ static const struct sunxi_engine_ops sun8i_engin=
e_ops =3D {
> > >         .mode_set       =3D sun8i_mixer_mode_set,
> > >  };
> > >
> > > +static const struct sunxi_engine_ops sun50i_engine_ops =3D {
> > > +       .commit         =3D sun8i_mixer_commit,
> > > +       .layers_init    =3D sun50i_layers_init,
> > > +       .mode_set       =3D sun8i_mixer_mode_set,
> > > +};
> > > +
> > >  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> > > -       .name           =3D "layers",
> > > +       .name           =3D "display",
> > >         .reg_bits       =3D 32,
> > >         .val_bits       =3D 32,
> > >         .reg_stride     =3D 4,
> > > @@ -433,14 +440,6 @@ static const struct regmap_config sun8i_top_regm=
ap_config =3D {
> > >         .max_register   =3D 0x3c,
> > >  };
> > >
> > > -static const struct regmap_config sun8i_disp_regmap_config =3D {
> > > -       .name           =3D "display",
> > > -       .reg_bits       =3D 32,
> > > -       .val_bits       =3D 32,
> > > -       .reg_stride     =3D 4,
> > > -       .max_register   =3D 0x20000,
> > > -};
> > > -
> > >  static int sun8i_mixer_of_get_id(struct device_node *node)
> > >  {
> > >         struct device_node *ep, *remote;
> > > @@ -463,17 +462,14 @@ static int sun8i_mixer_of_get_id(struct device_=
node *node)
> > >
> > >  static void sun8i_mixer_init(struct sun8i_mixer *mixer)
> > >  {
> > > -       struct regmap *top_regs, *disp_regs;
> > >         unsigned int base =3D sun8i_blender_base(mixer);
> > > +       struct regmap *top_regs;
> > >         int plane_cnt, i;
> > >
> > > -       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> > > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > >                 top_regs =3D mixer->top_regs;
> > > -               disp_regs =3D mixer->disp_regs;
> > > -       } else {
> > > +       else
> > >                 top_regs =3D mixer->engine.regs;
> > > -               disp_regs =3D mixer->engine.regs;
> > > -       }
> > >
> > >         /* Enable the mixer */
> > >         regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
> > > @@ -483,25 +479,25 @@ static void sun8i_mixer_init(struct sun8i_mixer=
 *mixer)
> > >                 regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
> > >
> > >         /* Set background color to black */
> > > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> > > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(ba=
se),
> > >                      SUN8I_MIXER_BLEND_COLOR_BLACK);
> > >
> > >         /*
> > >          * Set fill color of bottom plane to black. Generally not nee=
ded
> > >          * except when VI plane is at bottom (zpos =3D 0) and enabled=
.
> > >          */
> > > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> > > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(b=
ase),
> > >                      SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> > > -       regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0=
),
> > > +       regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLO=
R(base, 0),
> > >                      SUN8I_MIXER_BLEND_COLOR_BLACK);
> > >
> > >         plane_cnt =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
> > >         for (i =3D 0; i < plane_cnt; i++)
> > > -               regmap_write(disp_regs,
> > > +               regmap_write(mixer->engine.regs,
> > >                              SUN8I_MIXER_BLEND_MODE(base, i),
> > >                              SUN8I_MIXER_BLEND_MODE_DEF);
> > >
> > > -       regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base=
),
> > > +       regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE=
_CTL(base),
> > >                            SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> > >  }
> > >
> > > @@ -532,7 +528,6 @@ static int sun8i_mixer_bind(struct device *dev, s=
truct device *master,
> > >         if (!mixer)
> > >                 return -ENOMEM;
> > >         dev_set_drvdata(dev, mixer);
> > > -       mixer->engine.ops =3D &sun8i_engine_ops;
> > >         mixer->engine.node =3D dev->of_node;
> > >
> > >         if (of_property_present(dev->of_node, "iommus")) {
> > > @@ -562,6 +557,11 @@ static int sun8i_mixer_bind(struct device *dev, =
struct device *master,
> > >         if (!mixer->cfg)
> > >                 return -EINVAL;
> > >
> > > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> > > +               mixer->engine.ops =3D &sun50i_engine_ops;
> >
> > You're missing an IS_ENABLED() clause here if you wanted to make the DE=
 3.3
> > planes driver optional. Though as I mentioned in the other patch, split=
tig
> > the two modules might not work.
> >
> > > +       else
> > > +               mixer->engine.ops =3D &sun8i_engine_ops;
> > > +
> > >         regs =3D devm_platform_ioremap_resource(pdev, 0);
> > >         if (IS_ERR(regs))
> > >                 return PTR_ERR(regs);
> > > @@ -584,17 +584,6 @@ static int sun8i_mixer_bind(struct device *dev, =
struct device *master,
> > >                         dev_err(dev, "Couldn't create the top regmap\=
n");
> > >                         return PTR_ERR(mixer->top_regs);
> > >                 }
> > > -
> > > -               regs =3D devm_platform_ioremap_resource_byname(pdev, =
"display");
> > > -               if (IS_ERR(regs))
> > > -                       return PTR_ERR(regs);
> > > -
> > > -               mixer->disp_regs =3D devm_regmap_init_mmio(dev, regs,
> > > -                                                        &sun8i_disp_=
regmap_config);
> > > -               if (IS_ERR(mixer->disp_regs)) {
> > > -                       dev_err(dev, "Couldn't create the disp regmap=
\n");
> > > -                       return PTR_ERR(mixer->disp_regs);
> > > -               }
> > >         }
> > >
> > >         mixer->reset =3D devm_reset_control_get(dev, NULL);
> > > @@ -634,6 +623,33 @@ static int sun8i_mixer_bind(struct device *dev, =
struct device *master,
> > >
> > >         clk_prepare_enable(mixer->mod_clk);
> > >
> > > +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> > > +               struct platform_device *pdev;
> > > +               struct device_node *np;
> > > +               void *data;
> > > +
> > > +               np =3D of_parse_phandle(dev->of_node, "allwinner,plan=
es", 0);
> > > +               if (!np) {
> > > +                       ret =3D -ENODEV;
> > > +                       goto err_disable_mod_clk;
> > > +               }
> > > +
> > > +               pdev =3D of_find_device_by_node(np);
> >
> > You need to add a matching put_device() in the unbind function.
> >
> > Side note:
> >
> > This bind function is using a lot of devm_ functions. These have the wr=
ong
> > lifetime. I think it would be better if we could move resource acquisit=
ion
> > into the probe function.
>
> Looking a bit more into this, this requires a bit more work. For example,=
 clocks
> can be provided by tcon-top, which are created only in bind callback. Bas=
ically,
> whole sun4i-drm driver depends on devm_* calls in bind functions. This wo=
uld
> need careful analysis of all driver calls and then refactoring drivers on=
e by one.

Unfortunately so. However most of them just require moving the initial
context memory allocation and whatever resource acquisition over. It
shouldn't be that messy.

> IMO tcon-top driver needs to be refactored to plain clock driver without =
component
> bind/unbind functions. Although this may cause slightly higher power cons=
umption
> if device doesn't have display but driver is loaded nevertheless.
>
> What do you think?

It's just the bus clock that's enabled all the time, so I think that's fine=
.
However since it sits in the middle of the whole OF graph, you either need
to make sun4i-drm know to skip that when adding all the components, or just
keep a dummy bind callback and component to make it happy.


Thanks
ChenYu
