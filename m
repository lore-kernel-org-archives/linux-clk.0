Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AC7524B0;
	Sun, 23 Feb 2025 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740294950; cv=none; b=aUUBBzno6AV8xaio/E6K1MuG82ym56BQSIG2wkRiKOuOKenc/FUGTU1752ijalRR8bvZaRwxPLqGpTbFkNnCDVHbetjPFXNJXHs9GZXy65+WDI2URe4VF8PtAgSb0qSDyWmRswPeiJru1EEi9SH7qkv1brgI0P7j+hbKnBWQETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740294950; c=relaxed/simple;
	bh=GtW0YqAz0wqbp/2dMv5lCgLoArWqqUwplSEiAR+TUpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tm4ncSA1Ht3Ekif3oQrO2pihwTyBB1bE4E7i6lS30919o04PsfJ589nYFV9uIy/KNsOvHN/3zzUmbedmlNW8O0myCL+rJ2H9RgCL2dIhNE3qgl0DIou2bcmwKExu/XYCOYIvrm9E71vArZjB2c6XodvL8HpbDVl43lNqNoF/E+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzCHSzu4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzCHSzu4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso1748136f8f.2;
        Sat, 22 Feb 2025 23:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740294947; x=1740899747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6oa/ebySssC0rK+0SrRLsb+u+tOYcxAaPGIDJxVzbs=;
        b=MzCHSzu4L3zfwTDKJafm5d8wM553thXHsqTq0LT6w0BwwSTI1iO8DHP6sDyVtmoI9I
         L9NDUSEgqUQuKPXl27q8gs6qCeCZ6Qj7CQmpRJWggIy3thsu1wx6Z01sIa9BKB6a2wwq
         cVGL1endA6lmQpmon6T4w+aXKjzVm/o1HtIE8oQ0ZmVczVwIJ0DQJZg8rPeuiElfOWwF
         g1VpEAtlypV6s+Jcvdn1QGK2J7iVmQqjLPI4SyqXk2NsF9cbBPJYg73+2if3wOFhP27a
         SdEe0lkUBRc8kY1jSm31XII7mTVJemNBOB2LWmZrNUff9F0/VTWv9JP8w4wGAo0Ow1a1
         OEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740294947; x=1740899747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6oa/ebySssC0rK+0SrRLsb+u+tOYcxAaPGIDJxVzbs=;
        b=VqwDMZ8l4X3dxKDRy9/P72iSeOQozJcxfLxlsGRP0mELHocWrUvn5sHBSJ+cnpZFQd
         mNDOsae90PNL0UJZGsXxHiFEpEyqzkpT4QsQ7/rDQ8p5SaVC2WqDgGsQ6+LQ5qT6KwQ/
         kPPUkXIMih8bZc1+E3uoqj0wdHCUcLhRE8rcj+0PWaKSpkDQl4c6W+YFJw0EAYH0kMi7
         EgpYvxRtSdvFYV4D84NlwRIgABf5MiOxsOBPdtLQQbXGV+rBaoWTuaVKfXzsHRyQFcF1
         /i7r24Pt1kqdTMq2JJoEKm78CeqaQC/qI/Ib8hfH7DD5taYd7qSsozNdSNziXYmpuMg9
         OtpQ==
X-Forwarded-Encrypted: i=1; AJvYcCULlNElzAo/auFzzy8aAKm8K/PGilxH6wWI32uwqUSr8HWQuA4rVe6lWAdPMd2zTNVdemo/CFAIg4Yi@vger.kernel.org, AJvYcCUSPnZU3FWu8dFynGt/8LLQnZUwj9KJvDpc9BsPhaKiAA6eYA1j4P9WZuWQhJ5BeHEArnaraTuUqQby@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08SzSrRrfHgiF0XIzGDIxaWcNuq0EnU/A2zPMO15n1NACJWF+
	VruLQMDl7KYfGhvIuxkWS33HJeIpjdGVpH3xOlxeO22xIxEpcXPC
X-Gm-Gg: ASbGncuJ+X9eK17FD93k4ucGwOW1r0wnsN+IG8N19i4TssMqot7l/BcLr2WUxeWSF39
	eoofPfJ3XLdeTM209JlFgbkeizqA8X9nwK67jdwfKZsro29Gx3ppxDEUpy6ErOReqLKqNzLEjBr
	SdRB8LxA9I6PLAxjCGc+fHfXUO5PY7rOh4n9sC1I1wgop5OjZjnXTD0m3sm4iKmVNCptCTMqiAS
	wZ1eJJzDnFzJ4ZGTpY7OMgiwsbJaHNm3fnn6MWhAn2VJ+o6zhAhONTg/tKdHbTbJIOF3lnfJJsU
	vTBTtBg0LValP8h57vZpQtDgFnFkegXXlWwFCOuVIBPEpDzFzvmzSvYTEGahASYyYE4voVH98J9
	N9Q==
X-Google-Smtp-Source: AGHT+IEnkb30SA+X9mOVEWAXsC2Ls3yn4Gcq/0XOfU7eQ65pjUWNN4Y0a8vAPgYwTx8MVDcs2UCfJA==
X-Received: by 2002:a5d:588c:0:b0:38f:4cdc:5d36 with SMTP id ffacd0b85a97d-38f6f09bc4emr7603337f8f.43.1740294946526;
        Sat, 22 Feb 2025 23:15:46 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b43d4sm27805167f8f.4.2025.02.22.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 23:15:45 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH v7 24/27] drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33)
 support
Date: Sun, 23 Feb 2025 08:15:43 +0100
Message-ID: <15402414.tv2OnDr8pf@jernej-laptop>
In-Reply-To: <20250216183710.8443-25-ryan@testtoast.com>
References:
 <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-25-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. februar 2025 ob 19:36:24 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>=20
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
> - AFBC ARM Frame Buffer Compression support
> - YUV420 input support
>=20
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>=20
> Extend the mixer to support the DE33.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>=20
> ---
> Changelog v4..v5:
> - Whitespace fixes
> - Correct strict mode warnings from checkpatch.pl
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 109 ++++++++++++++++++++++++----
>  drivers/gpu/drm/sun4i/sun8i_mixer.h |  13 +++-
>  2 files changed, 105 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index f0d48796d651f..3584b496c5d58 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -321,8 +321,12 @@ static void sun8i_mixer_commit(struct sunxi_engine *=
engine,
>  	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
>  		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> =20
> -	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> -		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_DBUFF,
> +			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);

This was my mistake. There is no such thing as SUN50I_MIXER_GLOBAL_DBUFF in=
 DE33
anymore. Values are generally applied at vblank time (I think). Above write=
 actually
writes to RCQ register, which is not great. Just drop this code and fix con=
dition to !=3D.

> +	else
> +		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> +			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
>  }
> =20
>  static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
> @@ -371,25 +375,33 @@ static void sun8i_mixer_mode_set(struct sunxi_engin=
e *engine,
>  				 const struct drm_display_mode *mode)
>  {
>  	struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +	struct regmap *bld_regs, *disp_regs;
>  	u32 bld_base, size, val;
>  	bool interlaced;
> =20
>  	bld_base =3D sun8i_blender_base(mixer);
> +	bld_regs =3D sun8i_blender_regmap(mixer);
>  	interlaced =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>  	size =3D SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
> =20
>  	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
>  			 mode->hdisplay, mode->vdisplay);
> =20
> -	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
> -	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33) {
> +		disp_regs =3D mixer->disp_regs;
> +		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
> +	} else {
> +		disp_regs =3D mixer->engine.regs;
> +		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
> +	}
> +	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
> =20
>  	if (interlaced)
>  		val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
>  	else
>  		val =3D 0;
> =20
> -	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
>  			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
> =20
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> @@ -400,10 +412,8 @@ static void sun8i_mixer_mode_set(struct sunxi_engine=
 *engine,
>  	else
>  		val =3D 0xff108080;
> =20
> -	regmap_write(mixer->engine.regs,
> -		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> -	regmap_write(mixer->engine.regs,
> -		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val=
);
> =20
>  	if (mixer->cfg->has_formatter)
>  		sun50i_fmt_setup(mixer, mode->hdisplay, mode->vdisplay);
> @@ -442,12 +452,29 @@ static const struct sunxi_engine_ops sun8i_engine_o=
ps =3D {
>  };
> =20
>  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> +	.name		=3D "layers",
>  	.reg_bits	=3D 32,
>  	.val_bits	=3D 32,
>  	.reg_stride	=3D 4,
>  	.max_register	=3D 0xffffc, /* guessed */
>  };
> =20
> +static const struct regmap_config sun8i_top_regmap_config =3D {
> +	.name		=3D "top",
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.max_register	=3D 0x3c,
> +};
> +
> +static const struct regmap_config sun8i_disp_regmap_config =3D {
> +	.name		=3D "display",
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.max_register	=3D 0x20000,
> +};
> +
>  static int sun8i_mixer_of_get_id(struct device_node *node)
>  {
>  	struct device_node *ep, *remote;
> @@ -470,33 +497,45 @@ static int sun8i_mixer_of_get_id(struct device_node=
 *node)
> =20
>  static void sun8i_mixer_init(struct sun8i_mixer *mixer)
>  {
> +	struct regmap *top_regs, *disp_regs;
>  	unsigned int base =3D sun8i_blender_base(mixer);
>  	int plane_cnt, i;
> =20
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33) {
> +		top_regs =3D mixer->top_regs;
> +		disp_regs =3D mixer->disp_regs;
> +	} else {
> +		top_regs =3D mixer->engine.regs;
> +		disp_regs =3D mixer->engine.regs;
> +	}
> +
>  	/* Enable the mixer */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
> +	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
>  		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
> =20
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
> +
>  	/* Set background color to black */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
>  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> =20
>  	/*
>  	 * Set fill color of bottom plane to black. Generally not needed
>  	 * except when VI plane is at bottom (zpos =3D 0) and enabled.
>  	 */
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
>  		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
> -	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
> +	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
>  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
> =20
>  	plane_cnt =3D mixer->cfg->vi_num + mixer->cfg->ui_num;
>  	for (i =3D 0; i < plane_cnt; i++)
> -		regmap_write(mixer->engine.regs,
> +		regmap_write(disp_regs,
>  			     SUN8I_MIXER_BLEND_MODE(base, i),
>  			     SUN8I_MIXER_BLEND_MODE_DEF);
> =20
> -	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> +	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
>  			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
>  }
> =20
> @@ -573,6 +612,30 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>  		return PTR_ERR(mixer->engine.regs);
>  	}
> =20
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33) {
> +		regs =3D devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(regs))
> +			return PTR_ERR(regs);
> +
> +		mixer->top_regs =3D devm_regmap_init_mmio(dev, regs,
> +							&sun8i_top_regmap_config);
> +		if (IS_ERR(mixer->top_regs)) {
> +			dev_err(dev, "Couldn't create the top regmap\n");
> +			return PTR_ERR(mixer->top_regs);
> +		}
> +
> +		regs =3D devm_platform_ioremap_resource(pdev, 2);
> +		if (IS_ERR(regs))
> +			return PTR_ERR(regs);
> +
> +		mixer->disp_regs =3D devm_regmap_init_mmio(dev, regs,
> +							 &sun8i_disp_regmap_config);
> +		if (IS_ERR(mixer->disp_regs)) {
> +			dev_err(dev, "Couldn't create the disp regmap\n");
> +			return PTR_ERR(mixer->disp_regs);
> +		}
> +	}
> +
>  	mixer->reset =3D devm_reset_control_get(dev, NULL);
>  	if (IS_ERR(mixer->reset)) {
>  		dev_err(dev, "Couldn't get our reset line\n");
> @@ -787,6 +850,18 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0=
_cfg =3D {
>  	.vi_num		=3D 1,
>  };
> =20
> +static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg =3D {
> +	.ccsc		=3D CCSC_MIXER0_LAYOUT,
> +	.de_type	=3D sun8i_mixer_de33,
> +	.has_formatter	=3D 1,
> +	.mod_rate	=3D 600000000,
> +	.scaler_mask	=3D 0xf,
> +	.scanline_yuv	=3D 4096,
> +	.ui_num		=3D 3,
> +	.vi_num		=3D 1,
> +	.map		=3D {0, 6, 7, 8},
> +};
> +
>  static const struct of_device_id sun8i_mixer_of_table[] =3D {
>  	{
>  		.compatible =3D "allwinner,sun8i-a83t-de2-mixer-0",
> @@ -832,6 +907,10 @@ static const struct of_device_id sun8i_mixer_of_tabl=
e[] =3D {
>  		.compatible =3D "allwinner,sun50i-h6-de3-mixer-0",
>  		.data =3D &sun50i_h6_mixer0_cfg,
>  	},
> +	{
> +		.compatible =3D "allwinner,sun50i-h616-de33-mixer-0",
> +		.data =3D &sun50i_h616_mixer0_cfg,
> +	},

This should go to separate patch, adding feature (DE33) and adding core sup=
port
are two distinct things.

Best regards,
Jernej

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index db962ccd66964..a8afc37dc80d5 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -22,6 +22,10 @@
>  #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
>  #define SUN8I_MIXER_GLOBAL_SIZE			0xc
> =20
> +#define SUN50I_MIXER_GLOBAL_SIZE		0x8
> +#define SUN50I_MIXER_GLOBAL_CLK			0xc
> +#define SUN50I_MIXER_GLOBAL_DBUFF		0x10
> +
>  #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
> =20
>  #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
> @@ -155,6 +159,7 @@ enum {
>  enum sun8i_mixer_type {
>  	sun8i_mixer_de2,
>  	sun8i_mixer_de3,
> +	sun8i_mixer_de33,
>  };
> =20
>  /**
> @@ -181,6 +186,7 @@ struct sun8i_mixer_cfg {
>  	unsigned int		de_type;
>  	unsigned int		has_formatter : 1;
>  	unsigned int		scanline_yuv;
> +	unsigned int		map[6];
>  };
> =20
>  struct sun8i_color_model {
> @@ -238,13 +244,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
>  static inline struct regmap *
>  sun8i_blender_regmap(struct sun8i_mixer *mixer)
>  {
> -	return mixer->engine.regs;
> +	return mixer->cfg->de_type =3D=3D sun8i_mixer_de33 ?
> +		mixer->disp_regs : mixer->engine.regs;
>  }
> =20
>  static inline u32
>  sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
>  {
> -	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de3)
> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
> +		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
> +	else if (mixer->cfg->de_type =3D=3D sun8i_mixer_de3)
>  		return DE3_CH_BASE + channel * DE3_CH_SIZE;
>  	else
>  		return DE2_CH_BASE + channel * DE2_CH_SIZE;
>=20




