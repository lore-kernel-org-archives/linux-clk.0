Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E173246797
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 19:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766691261; cv=none; b=eog1hk7MguRQOdh/fVJGIwbDbWnADxWvqeH4YhowfHQEcirmc7CXC2Xvi869r4il64yHKCQVtnYiW0XI/Q97dPVuq2NedtvQtPjcumXBXIBUznQ0b43cTK3S0L4smqY9pcvL5/YvpgMUcGOz9cNk3ZmpaEXgZxmB4hgPBW68Uvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766691261; c=relaxed/simple;
	bh=mxf3dMWJRzYjT6zau4g9jbVMGmTNMy4DyOj5iu5DTA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIFpexguhqUWcyUYuxPo3vwnf+n55ufcS4Vn34dyE/ZGYpItEJPxbewFPKggWPE9eYQzQC9Hd8kg7LbBTmxTJSBUcGI10ZYl/i3rGgsQ5zcu7Pqp2tdgGXmFQhvp0t/QbzMQZZYo97SHttkANs2vz7e6tLjA3yttZlvMIjJxDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enD9efMr; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enD9efMr"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso7014356a12.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 11:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766691258; x=1767296058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCCQe+pRYbdqDLkAr1CoQ+p6IUmQ9Qx7N3/F7dp2OrI=;
        b=enD9efMrx8W5nT7pTHgX8qsGzIzFG6vI+2mKwdeBq1qPPXfUwC0Imw03mQZhmBuZo2
         O5DRsKg/EgoqzRZDt2FoCSvr7Y0cBg4fxrZOtQoVvGnxyx65LMtmHbokOhQwfYXZLQF8
         eIHsIsBp6Fq1Ktop6viiaEdpxhTk2gNbRMknkWV/mlhD83zbuxSh4sl+THdMQJgko+4n
         vLOfH+8CqMONv214HRHgo2LBWIadIW+f2dxsAANiq/+kiGIhK1ZioguCElxJZZATNtrW
         L6T8a+ly6Pq8T60n4FaoUsD1tSAPxZ9i67qILoUJV/EpUrxT1m4aqS8HxPwnPThavRRD
         F0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766691258; x=1767296058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCCQe+pRYbdqDLkAr1CoQ+p6IUmQ9Qx7N3/F7dp2OrI=;
        b=u2+q1avKbcOeYO0vvqM0yQifqZXU5FkYXOKe0DNJWX2r2RX3axCbxwTX5zX73mHRAF
         0FXl6NM+wsIdkNgf4ITFtHl3gTiszOV1dBcLLQNJ5g+xhaXDvmbj2SvxMcrEeydNMq0C
         T3MYJx/zFJONLXgPHJdCQLxtMgCdfWzmS2nM23SuyvqNPNP4LXexJFMCuI2IKgwx92/P
         jUbFnljPaUqIxFKoSSP+/nPX/ramiyKcYEEh/Y34WOR13ihybtfy/70y5xGHRBZQVCOG
         sXJxK7z6B/nIesdYyoquG3FDckFBAl+7PR2CTuS49ZBvy/Y3G1YCJeDX56n8Ktksh9VQ
         AlvA==
X-Forwarded-Encrypted: i=1; AJvYcCV2M364UMcUxY1c9hL3CLw2fEMgI3e3vu61CvGS6r98GWuUR9wQsUasFvHVN981NJNRob2CttxGox0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQB+vozu8XgooBGB4bEr1P77h9XUuik+62C4XWk+jG7p+lzisu
	OUdjSx4s7w6bBeBXDDpingjsosHyO81A0hPYgPay/F1XgIoGST0eSknh
X-Gm-Gg: AY/fxX4D5uVXf54p/QiUafBsslC3y5JwxepMKiGWq9q+vrQ7OXzLRBg8EOzPFeSoxS7
	iOSAtxFQ0Tu8OgJ5h4uOveUfOWR7C9KlOGzaSfAV6I9uyXo6LNez9dXm+AItHeROAmck42ynfy7
	3DsfF0BK4O/VPa/aNWzx7ElFv3pbP7O99fC6pmEKqiC5gN69Vcfn6M4XEQdtgwMo9bdFGoMzna3
	tskVn80Ik5whpM0AJuf1DdI8j73vKAdXLRX087lZaHs1hvpCtRNFE/wzSywfQ54u/yzXwqgQHLb
	ZJCURsZaMc5+3u1yfNwnOdfSiULou/Mx6hiu6/JeQlCs6CMNVKIdJqrfceFALiOy1EFnd50bplb
	/gvGLRYEA0ktRmLgNiRHfIZUxXehdAlZv9xdyk+VHv35e1iIT2JDR8/mOHg7Vp01AHBr2IoaQ3N
	q+07gP9k/kVX1ur2uLLjKQYmuGfvaWf8R6
X-Google-Smtp-Source: AGHT+IGvO3IMjEj5neK9YLe7p0o8Hu6EpqYO5l2iHCHivnyYHwPQvp96m6na5gEhouJ/SSYvvXULIw==
X-Received: by 2002:a05:6402:42c4:b0:63c:eb6:65e8 with SMTP id 4fb4d7f45d1cf-64b8edb753bmr20691588a12.30.1766691257505;
        Thu, 25 Dec 2025 11:34:17 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b912534f2sm20604568a12.15.2025.12.25.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 11:34:16 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: Add planes driver
Date: Thu, 25 Dec 2025 20:34:14 +0100
Message-ID: <3333337.5fSG56mABF@jernej-laptop>
In-Reply-To:
 <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
References:
 <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <2040104.PYKUYFuaPT@jernej-laptop>
 <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 20:30:23 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> On Fri, Dec 26, 2025 at 3:17=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote:
> >
> > Dne =C4=8Detrtek, 25. december 2025 ob 10:37:06 Srednjeevropski standar=
dni =C4=8Das je Chen-Yu Tsai napisal(a):
> > > On Thu, Dec 25, 2025 at 5:29=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org=
> wrote:
> > > >
> > > > On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> > > > <jernej.skrabec@gmail.com> wrote:
> > > > >
> > > > > This driver serves just as planes sharing manager, needed for Dis=
play
> > > > > Engine 3.3 and newer.
> > > > >
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/sun4i/Kconfig         |   8 +
> > > > >  drivers/gpu/drm/sun4i/Makefile        |   1 +
> > > > >  drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
> > > > >  4 files changed, 257 insertions(+)
> > > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
> > > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h
> > > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4=
i/Kconfig
> > > > > index b56ba00aabca..946dd7606094 100644
> > > > > --- a/drivers/gpu/drm/sun4i/Kconfig
> > > > > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > > > > @@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
> > > > >           TCON TOP is responsible for configuring display pipelin=
e for
> > > > >           HDMI, TVE and LCD.
> > > > >
> > > > > +config DRM_SUN50I_PLANES
> > > > > +       tristate
> > > > > +       default DRM_SUN4I if DRM_SUN8I_MIXER!=3Dn
> > > > > +       help
> > > > > +         Chose this option if you have an Allwinner Soc with the
> > > > > +         Display Engine 3.3 or newer. Planes are shared resource
> > > > > +         between multiple mixers.
> > > > > +
> > > > >  endif
> > > > > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun=
4i/Makefile
> > > > > index bad7497a0d11..03f002abef15 100644
> > > > > --- a/drivers/gpu/drm/sun4i/Makefile
> > > > > +++ b/drivers/gpu/drm/sun4i/Makefile
> > > > > @@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)   +=3D sun6i_mipi_d=
si.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_DW_HDMI)        +=3D sun8i-drm-hdmi.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_MIXER)  +=3D sun8i-mixer.o
> > > > >  obj-$(CONFIG_DRM_SUN8I_TCON_TOP) +=3D sun8i_tcon_top.o
> > > > > +obj-$(CONFIG_DRM_SUN50I_PLANES)        +=3D sun50i_planes.o
> > > >
> > > > I don't think you can have this as a separate module:
> > > >
> > > > a. You are using sun8i_vi_layer_init_one() and sun8i_ui_layer_init_=
one()
> > > >    from the sun8i-mixer module, and neither of them are exported sy=
mbols.
> > > >
> > > > b. You export sun50i_planes_setup() for sun8i-mixer to call, which =
ends
> > > >    up becoming a circular dependency.
> > > >
> > > > The easiest solution would be to just fold this into the sun8i-mixe=
r module.
> >
> > I mimicked tcon-top module, but yeah, it's much less of a hassle to fol=
d it
> > into sun8i-mixer.
> >
> > > >
> > > >
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/=
drm/sun4i/sun50i_planes.c
> > > > > new file mode 100644
> > > > > index 000000000000..a99c01122990
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> > > > > @@ -0,0 +1,205 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> =
*/
> > > > > +
> > > > > +#include <linux/device.h>
> > > > > +#include <linux/io.h>
> > > > > +#include <linux/mfd/syscon.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/of_graph.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +
> > > > > +#include "sun50i_planes.h"
> > > > > +#include "sun8i_ui_layer.h"
> > > > > +#include "sun8i_vi_layer.h"
> > > > > +
> > > > > +static bool sun50i_planes_node_is_planes(struct device_node *nod=
e)
> > > > > +{
> > > > > +       return !!of_match_node(sun50i_planes_of_table, node);
> > > > > +}
> > > > > +
> > > > > +struct drm_plane **
> > > > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > > > +                   unsigned int mixer)
> > > > > +{
> > > > > +       struct sun50i_planes *planes =3D dev_get_drvdata(dev);
> > > > > +       const struct sun50i_planes_quirks *quirks;
> > > > > +       struct drm_plane **drm_planes;
> > > > > +       const struct default_map *map;
> > > > > +       unsigned int i;
> > > > > +
> > > > > +       if (!sun50i_planes_node_is_planes(dev->of_node)) {
> > > > > +               dev_err(dev, "Device is not planes driver!\n");
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       if (!planes) {
> > > > > +               dev_err(dev, "Planes driver is not loaded yet!\n"=
);
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       if (mixer > 1) {
> > > > > +               dev_err(dev, "Mixer index is too high!\n");
> > > > > +               return NULL;
> > > > > +       }
> > > > > +
> > > > > +       quirks =3D planes->quirks;
> > > > > +       map =3D &quirks->def_map[mixer];
> > > > > +
> > > > > +       drm_planes =3D devm_kcalloc(drm->dev, map->num_ch + 1,
> > > >
> > > > Just a note: it seems we are missing the sentinel in sun8i_layers_i=
nit().
> >
> > Why do you think so? Current mainline code has mixer->cfg->vi_num +
> > mixer->cfg->ui_num + 1.
>=20
> I believe this was changed in your previous cleanups:
>=20
> https://lore.kernel.org/all/20251104180942.61538-16-jernej.skrabec@gmail.=
com/

Ah, true. I'll send fix for -rc soon.

Best regards,
Jernej



