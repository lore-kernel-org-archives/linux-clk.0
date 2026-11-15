Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752807;
	b=yjsLpukZikxSsEjRH0ucAMLrk61K+XeXE5XSvzs6jpoAAW7H+A0bx5/EDTbaOt0WFI+Z
	 J9i7vv4huCjG3u68DH4su92NVf/tui2iMB6/KZ+XBWcmXj1TQgInXGmh76cwcJKFtxlcW
	 pfO7U6gUFBmfjIjQTpQSp60cU67OoLJPybn9t9f+WE6BAHrkddujKDtS116jvcvfzUls8
	 v0AqkhHtgIrkQSC7tnR1ES1tPuBYgaPSYca1bWGGOwb/iykpBQNFFhhYIhiKxc71e6E73
	 09yZjkRrOuErM+JxHUN9EgoNDWwafahDrYj8s63A36eFQ2M4IL4YlvYNiLTOwHi6Sww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752807;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VY80GYMWmN2X/cRBWnIR5x01adoLIi2PeDOmn18ACWo=;
	b=m0Hd2kNWMb6XD22ccYCOU59MM72bWkQ5LArlpHaCEQ+W9MBxx98CDCG8tfj0pJA+tfAO
	 /MQfHSSAbpPx0UTGLUnTiYRMyewb/LQgayaIKCbxwKjCOx5f1YcwqRL2g3EOvNxvZj74s
	 eONrApp59+AJ8igQIAaDaC5R94SJ22NHZGLa8Hf6+KzCUN7uPzs18VL/CRLubgogx2hZX
	 Xm2LFXgS0tgCl/b6tK3KnrySa+/FdcmPWeKNv5t/puqjUpsa7WbrKlkEJI74LlUat0fZZ
	 raV9zaEUyCBmQDsSc/8ilH8WCDv7PS71w3udjojT1O+7R3LhpUhUrRtsqrq4GgbhUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P87a7mX7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7380606A33A
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P87a7mX7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3ADA1F000D0
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752807;
	bh=VY80GYMWmN2X/cRBWnIR5x01adoLIi2PeDOmn18ACWo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=P87a7mX7trSCmaFCHcQyFDIH8UjDbYHKiubFgXqc/gTsY3yQkpA/dB9cGBqmVFbxX
	 Dqxfi/F/zSteHwNitFJtoynvjmCM+ozfM5mXCzGsZMVLTDIL0T+8u99p2v6FHHdq13
	 IwxtiqQ/clUTuo0ze/095tLCo9wYv1nqLk654UgsNNPE3x7j3ChAuxZWQIXR7BpNZO
	 E0ziDZXqmnvymoFPg0oclQTXlwWXH69CS2V/RvOpUjIcY24X3VQF0veaVB4Gb7/G8k
	 2PpA7Q0PKL/j15UfpIFf83IdUYNm1B+jUA4rQTJGoWL0gp5ClBqnZNacLP/ENO1lH4
	 /KXwg8m67qEXw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adfc004920so28849031fa.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:26:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH+g48DcoPsX+IzFpgcq2C4MXUx76QK/W7AUcQvtPzIo4fGksrzwkVfCpToaf029mgPty9Id/1x4eo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PACGWh62SmPZFqs6O3tIGRofyAPTqxVpYVOxhRRkG+mwMyuyX
	GZlX31LIHy75/khjj5/ERE1VPr0Ggpsbp/p52zq6qYIoPJe07Te54MaHWXYbtSu9tv480UKB/MJ
	klBQrb5McjHKU2TUZPm98KqJTxj7Rsko=
X-Received: by 2002:a05:651c:41d7:b0:3ad:de02:e9a6 with SMTP id
 38308e7fff4ca-3ae2b4cda67mr25514401fa.16.1794752806007; Sun, 15 Nov 2026
 06:26:46 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-9-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-9-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:26:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v64wZv7TV1Jb-r0qtvRz=dWWO_YkhYxMwxBNcyVUoKi9VQ@mail.gmail.com>
X-Gm-Features: AclHuK-JOP2IDOiEi7PmqaWN9O63FgTmRJcOIwMzfvjNDqgeqpiwUNzW1M1IK3U
Message-ID: <CAGb2v64wZv7TV1Jb-r0qtvRz=dWWO_YkhYxMwxBNcyVUoKi9VQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] drm/sun4i: Switch DE33 to split plane bindings
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The shared plane driver and split register resources are now in place.
> Switch DE33 mixer discovery to the new bindings and remove the legacy
> per-mixer plane setup. Mixer register space now covers only display
> blending control, so limit its regmap accordingly.
>
> The old DE33 binding is not supported anymore, since it can't describe
> shared planes and was never used by any device tree. If it's detected,
> print an error asking the user to update the device tree, instead of
> failing silently or misusing the plane register space as blender
> registers.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 195 ++++++++++++++++++++--------
>  drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +-
>  2 files changed, 140 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index dbde80b32080..0970be6aa035 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>
> @@ -25,6 +26,7 @@
>  #include <drm/drm_probe_helper.h>
>
>  #include "sun4i_drv.h"
> +#include "sun50i_planes.h"

Nit: doesn't seem to follow the order we use elsewhere. I think we normally
would do:

    sun4i_drv.h
    sun8i_*
    sun50i_planes.h

>  #include "sun8i_mixer.h"
>  #include "sun8i_ui_layer.h"
>  #include "sun8i_vi_layer.h"

[...]

> @@ -566,12 +582,34 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
>         if (!mixer->cfg)
>                 return -EINVAL;
>
> +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> +               /*
> +                * The original DE33 binding described planes as part of
> +                * the mixer, which can't work with more than one mixer.
> +                * It was never used by any device tree, so it's not
> +                * supported.
> +                */
> +               if (of_property_match_string(dev->of_node, "reg-names",
> +                                            "layers") >=3D 0 ||

No need to wrap this bit.

> +                   !of_property_present(dev->of_node, "allwinner,planes"=
))
> +                       return dev_err_probe(dev, -EINVAL,
> +                                            "Unsupported DE33 mixer bind=
ing, please update the device tree\n");
> +
> +               mixer->engine.ops =3D &sun50i_engine_ops;
> +       } else {
> +               mixer->engine.ops =3D &sun8i_engine_ops;
> +       }
> +
>         regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(regs))
>                 return PTR_ERR(regs);
>
> -       mixer->engine.regs =3D devm_regmap_init_mmio(dev, regs,
> -                                                  &sun8i_mixer_regmap_co=
nfig);
> +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)
> +               mixer->engine.regs =3D devm_regmap_init_mmio(dev, regs,
> +                                                          &sun50i_mixer3=
3_regmap_config);
> +       else
> +               mixer->engine.regs =3D devm_regmap_init_mmio(dev, regs,
> +                                                          &sun8i_mixer_r=
egmap_config);

At some point we need to move most of the bind function to the probe functi=
on.
None of the devm_* stuff gets released if the bind function fails.

We can also switch to the combined devm_* helpers for clks and resets.

>         if (IS_ERR(mixer->engine.regs)) {
>                 dev_err(dev, "Couldn't create the mixer regmap\n");
>                 return PTR_ERR(mixer->engine.regs);
> @@ -588,17 +626,6 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>                         dev_err(dev, "Couldn't create the top regmap\n");
>                         return PTR_ERR(mixer->top_regs);
>                 }
> -
> -               regs =3D devm_platform_ioremap_resource_byname(pdev, "dis=
play");
> -               if (IS_ERR(regs))
> -                       return PTR_ERR(regs);
> -
> -               mixer->disp_regs =3D devm_regmap_init_mmio(dev, regs,
> -                                                        &sun8i_disp_regm=
ap_config);
> -               if (IS_ERR(mixer->disp_regs)) {
> -                       dev_err(dev, "Couldn't create the disp regmap\n")=
;
> -                       return PTR_ERR(mixer->disp_regs);
> -               }
>         }
>
>         mixer->reset =3D devm_reset_control_get(dev, NULL);
> @@ -638,6 +665,40 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>
>         clk_prepare_enable(mixer->mod_clk);
>
> +       if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33) {
> +               struct platform_device *pdev;
> +               struct device_link *link;
> +               struct device_node *np;
> +               void *data;
> +
> +               np =3D of_parse_phandle(dev->of_node, "allwinner,planes",=
 0);
> +               if (!np) {
> +                       ret =3D -ENODEV;
> +                       goto err_disable_mod_clk;
> +               }
> +
> +               pdev =3D of_find_device_by_node(np);
> +               of_node_put(np);
> +               if (!pdev) {
> +                       ret =3D -EPROBE_DEFER;
> +                       goto err_disable_mod_clk;
> +               }
> +               mixer->planes_dev =3D &pdev->dev;
> +
> +               data =3D platform_get_drvdata(pdev);
> +               if (!data) {

"device_is_bound(&pdev->dev)" is probably more straightforward.

> +                       ret =3D -EPROBE_DEFER;
> +                       goto err_put_device;
> +               }
> +
> +               link =3D device_link_add(dev, &pdev->dev,
> +                                      DL_FLAG_AUTOREMOVE_CONSUMER);
> +               if (!link) {
> +                       ret =3D -EINVAL;
> +                       goto err_put_device;
> +               }
> +       }
> +
>         list_add_tail(&mixer->engine.list, &drv->engine_list);
>
>         /* Reset registers and disable unused sub-engines */
> @@ -672,6 +733,10 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
>
>         return 0;
>
> +err_put_device:
> +       put_device(mixer->planes_dev);

Should you have matching "if (mixer->cfg->de_type =3D=3D SUN8I_MIXER_DE33)"
like in the .unbind callback?

Once fixed,


Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
