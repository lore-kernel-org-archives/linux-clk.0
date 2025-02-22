Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4111D7E42;
	Sat, 22 Feb 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216641; cv=none; b=NyO1njDb0sb5hfoJFIMDA9P0VyifqMHLzZ6nXU9CXFCAyCdHD/M0FshoyVui3fEw1SwoxJhko6AeQmdqWopoPBYXl8KWQyHJyhzimzzshXpSVDnK35W1iQoLWS8O0Pyas8/MsgCb7xlSqvonZCm+emxslE22rOuOAwWMfKpDl2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216641; c=relaxed/simple;
	bh=ohDuKgeYqsp+9JhZO++8jr92MnlHbq65lbOggkplOMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r8bnZt4E2gcB4ucIUQjf3D9r5w0kZEWyF75RcFBxdbqf4wgbEdhCMld+6anUxr8xb9WA7lWwF3HYi7YsIlKuzka5nZwTY1/mbILm1LqDgSiejjmkqf806LLtLVR0FZRAWayiNwlbPDvc04Sm65Myqd2AVszKboEuLvGkZ7YLFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKMZp71y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKMZp71y"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f488f3161so1476691f8f.3;
        Sat, 22 Feb 2025 01:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216638; x=1740821438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9F20fzricZrTGW+QeF883b7IwAmdJ0gyJoHIxyxNBc=;
        b=VKMZp71yNa0qWdUIJNJzmWMZCX1Q5pTN6BLPmWyM7mHpJJMvImvRHbqrpPPPpq8K3c
         Zkdqvr+pg2+yCPi9BgjxBoyiWQVuPUSzb1JZYf9KKcaQJAbn/Xye/81VlM6Z/8mpmeat
         bcPdwscGNAoGwRqXq9jT1INLYlaF0ZiIuZF5pmPR0/ozGbCYYTEHLGQDDZvvY5EMl9Oq
         vg6fpQmKpUX0D/C/VeUOZ3MedeJynFiWxsyHCnMVNJQtGHmGYrT3Fsms+N7iuE6JdyDY
         Nv5mZyVQ4ZzqQ6XVA0YfVmummBbovCim59IUZ8cPx4j8gy2FO0Y6ocknmAN9QNKOiCB3
         hISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216638; x=1740821438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9F20fzricZrTGW+QeF883b7IwAmdJ0gyJoHIxyxNBc=;
        b=kM1Od0ccdwWBBgxULHc4MruPQLzytXO7RLWYVzD9DUjYSGecLgkJdr6ONHsfU1tZga
         2LV/oHVA9s6g34wtkPARlsXmAGf68wWymLqaSMLMXLTsu0G5OG6obJtKxarnFURtDGgY
         4YD6jp1sXs8oCLxw5JZWq/1OLrrJalrzO/PlfY3E9YYVAgaQavdQeTgGwMqXK6msTB/E
         juOKlE2sxAUOS2AAxSY0pyjIYg10pqhbOl9xDSjb34Rjt3PyA87+oQmHnqT4HQ4/PawO
         UuC8fMrnKWs5Q2hVHKYTwhR+Qt83pxxkE/5BSwCR4uXQnEa482EiWZcqK4fSWE8baqzy
         uOqA==
X-Forwarded-Encrypted: i=1; AJvYcCUoNkOLIVlqLRyk+t7cWlDntDCqrvkji01iqKUMv/fyJjfDw+sd/xZY9rZEuCSbbN4tHZ2qrUnSRNcI@vger.kernel.org, AJvYcCVluzBBOiEQW2PBJ/06LBmsoWQWkMaxpoYez8OVeqf+94cmgQ//jxy9L0cthzQK1R5LlL/FXwQNJU0E@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPbsgSuY26UYD8KI2vmRrO+2zApWe/AZXxUCqAI4NxLssBbqa
	3O/5LSL7tvJ9AtipISLeloOsynpQzEndIenwjwoumJZdb59FAHBR
X-Gm-Gg: ASbGncvrRn50NHH/u3okwzTuQI7vkZan9nuQgIOrQbRqcWI3/LwjScv+3VLL+dJhyWD
	gAt+WjD8jBowDLcbzTtzRCWeNQWz8Q+7FsPNdFDeHUlNVryq1LHCCzwEz0Hz3SOJMlbBHBUauSw
	VxrgKKaq2FiLTV72l/fBsJxZayNR+kx4F8DRSzya0KVyAdbTiIbuQnHxjSFhfhSlfM+x4Wc6ijZ
	UKB129eIai2rq9u848SeGJYy64Fef+INFIqhwg+WHRo+5K66T+zgnywLW0fCAyWoZ05mj/EZJSd
	oXNcH7aV+xZpas6jx7wrkL7KDJPIMoYuVYWsu/ewfRoZVht7w4Pu88PVlvxnH7wOFlX/lzBTOMv
	2cg==
X-Google-Smtp-Source: AGHT+IGveW3w0SKQKx8LXKO0L/gAvng9bbQi2cKgrZ9bQASh6DROV0jb7VWS/TE7EA2uJePz27ztjw==
X-Received: by 2002:a5d:47a9:0:b0:385:f249:c336 with SMTP id ffacd0b85a97d-38f70859ab3mr5498849f8f.45.1740216637740;
        Sat, 22 Feb 2025 01:30:37 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm25790168f8f.71.2025.02.22.01.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:30:37 -0800 (PST)
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
 Re: [PATCH v7 08/27] drm: sun4i: de3: add YUV support to the DE3 mixer
Date: Sat, 22 Feb 2025 10:30:35 +0100
Message-ID: <3860147.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20250216183710.8443-9-ryan@testtoast.com>
References:
 <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-9-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 16. februar 2025 ob 19:36:08 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The mixer in the DE3 display engine supports YUV 8 and 10 bit
> formats in addition to 8-bit RGB. Add the required register
> configuration and format enumeration callback functions to the mixer,
> and store the in-use output format (defaulting to RGB) and color
> encoding in the mixer configuration.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>=20
> ---
> Changelog v4..v5:
> - Remove trailing whitespace
>=20
> Changelog v5..v6:
> - Move color format and encoding flags to mixer and add struct.
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 54 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 11 ++++++
>  2 files changed, 62 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index a170f68708b1f..bc934186bfd6f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -23,7 +23,10 @@
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
> =20
> +#include <uapi/linux/media-bus-format.h>
> +
>  #include "sun4i_drv.h"
> +#include "sun50i_fmt.h"
>  #include "sun8i_mixer.h"
>  #include "sun8i_ui_layer.h"
>  #include "sun8i_vi_layer.h"
> @@ -390,12 +393,52 @@ static void sun8i_mixer_mode_set(struct sunxi_engin=
e *engine,
> =20
>  	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
>  			 interlaced ? "on" : "off");
> +
> +	if (mixer->color_model.format =3D=3D MEDIA_BUS_FMT_RGB888_1X24)
> +		val =3D SUN8I_MIXER_BLEND_COLOR_BLACK;
> +	else
> +		val =3D 0xff108080;
> +
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_BKCOLOR(bld_base), val);
> +	regmap_write(mixer->engine.regs,
> +		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
> +
> +	if (mixer->cfg->has_formatter)
> +		sun50i_fmt_setup(mixer, mode->hdisplay,
> +				 mode->vdisplay, mixer->color_model.format);
> +}
> +
> +static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, =
u32 *num)
> +{
> +	struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +	u32 *formats, count;
> +
> +	count =3D 0;
> +
> +	formats =3D kcalloc(5, sizeof(*formats), GFP_KERNEL);
> +	if (!formats)
> +		return NULL;
> +
> +	if (mixer->cfg->has_formatter) {
> +		formats[count++] =3D MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		formats[count++] =3D MEDIA_BUS_FMT_YUV8_1X24;
> +		formats[count++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
> +		formats[count++] =3D MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +	}
> +
> +	formats[count++] =3D MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	*num =3D count;
> +
> +	return formats;
>  }
> =20
>  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> -	.commit		=3D sun8i_mixer_commit,
> -	.layers_init	=3D sun8i_layers_init,
> -	.mode_set	=3D sun8i_mixer_mode_set,
> +	.commit			=3D sun8i_mixer_commit,
> +	.layers_init		=3D sun8i_layers_init,
> +	.mode_set		=3D sun8i_mixer_mode_set,
> +	.get_supported_fmts	=3D sun8i_mixer_get_supported_fmts,
>  };
> =20
>  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> @@ -484,6 +527,11 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>  	if (!mixer->cfg)
>  		return -EINVAL;
> =20
> +	/* default output format, supported by all mixers */
> +	mixer->color_model.format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +	/* default color encoding, ignored with RGB I/O */
> +	mixer->color_model.encoding =3D DRM_COLOR_YCBCR_BT601;
> +
>  	regs =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 8417b8fef2e1f..5f465a974fbdf 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <drm/drm_color_mgmt.h>
>  #include <drm/drm_plane.h>
> =20
>  #include "sunxi_engine.h"
> @@ -177,6 +178,11 @@ struct sun8i_mixer_cfg {
>  	unsigned int	scanline_yuv;
>  };
> =20
> +struct sun8i_color_model {
> +	u32			format;
> +	enum drm_color_encoding	encoding;
> +};
> +
>  struct sun8i_mixer {
>  	struct sunxi_engine		engine;
> =20
> @@ -186,6 +192,11 @@ struct sun8i_mixer {
> =20
>  	struct clk			*bus_clk;
>  	struct clk			*mod_clk;
> +
> +	struct regmap			*top_regs;
> +	struct regmap			*disp_regs;

This chunk is DE33 specific and should go in patch 24.

Best regards,
Jernej

> +
> +	struct sun8i_color_model	color_model;
>  };
> =20
>  enum {
>=20




