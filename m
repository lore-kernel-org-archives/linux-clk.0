Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F63A1E90
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766691038; cv=none; b=hIAwW4hKHkGSPj8f89vRNFL9MHwz2WVTHkFp3XJajdXjUPke+GDlcSDecN+UAujPjNYDyI8kMlBg1+tUdMI27Hex5EKhXbfRWNDx5a4yl+wggb2gYYIifvwBsdvvaCwHHq3G3QfgmWcluM9lT0FvR266xYJfIyEIvNFsu9FRDLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766691038; c=relaxed/simple;
	bh=PNmxPF4Si5SD2RE+kviyUMmRrwxqvwurGq2l37LcOJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8uw983A8FzOPzvM0JbBh3psUXS6XsDrfje8DfZrswWYpKb3nXtY+7msVWQU/lkOfBvS68RCCe5iUgUWk4o7U0aDzfe4NBXMNTZgdEZk7SYeHgdDTyI85a8Gn0HSpXEdcdv+lc5w5kPKBLwPmNi+sMESlSDfUMmx99/BHScI8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1CMWVXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1CMWVXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05740C19423
	for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766691038;
	bh=PNmxPF4Si5SD2RE+kviyUMmRrwxqvwurGq2l37LcOJg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=o1CMWVXQxo99H1izjn8N1/tbqtlv3vzusXVACodxeanTAFC7JZ+TBsDttDP/et6/N
	 Ai5YlFqnq1QeLqau6jSMGd7cossHGyDLlGKls/hrBOrNprsuJvYmQsGoSRd8zmCF3M
	 H3sMLBJE4uycgCSL4Xr1SqSfsWPN3LLQ28rYnrsG6+S662TzgOXBphvGw8qRFIDj/j
	 5Nj3VIgN1KR2yn0eFGrl5jPspJlBRK9S9dSTLitjCV+m+8EvioH6C7zuDZb6KFAgJp
	 fqWc8tLU3zzMXHUQZTmSXlNagGf8go01sK5uAZykp/RotqJvjX0wOVzZZq/S44dOvg
	 4DAj6l4pycimQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b983fbd45so52568721fa.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Dec 2025 11:30:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVn0Sz6Ocl4qHCF2v8p7jZ9nzWLq6nFfbQXDqQS6p7OQi8YdV0fgXB7+5wWliVho2zSKFzXQegxxZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0AEtJ+fe7Cq0YJl4PQgPReXrEqpdXgw0P1CjrmiKKsTuJxBrh
	6o4by2eeuWCxMkyQFcsibF7nZc49i4EsOzwY6RwQhTnpEZ8S4L28YnTv4ouivivnEcQPMuXHTPq
	HZZKKydW9n9R0nSRDOe9EUixJSMunf30=
X-Google-Smtp-Source: AGHT+IHnQhNVHaXF+oAJMjge0nxj72QcN3sWpu+60rw59gEIIy/FqgvTvMDz0x88vWxmHDC898aYI9LXVOjeUaCkkp0=
X-Received: by 2002:a2e:a99a:0:b0:382:6067:a239 with SMTP id
 38308e7fff4ca-3826067bbe1mr8123551fa.30.1766691036284; Thu, 25 Dec 2025
 11:30:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com>
 <CAGb2v65e2a_f+UEDu-Wk3bWvgHt24erjk+iLWgMAQwB-mzcnaA@mail.gmail.com> <2040104.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <2040104.PYKUYFuaPT@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 26 Dec 2025 03:30:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
X-Gm-Features: AQt7F2oT9ruqzMhZ4RYgjgcR4oHABvtGFQjQq16-vrusHeaaLwafw6cyXZOnkGo
Message-ID: <CAGb2v64bp0BYYdCbaS+wg0H+MD27Bk-n5i8t9X5nVGTG3_hX_Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/sun4i: Add planes driver
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 3:17=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne =C4=8Detrtek, 25. december 2025 ob 10:37:06 Srednjeevropski standardn=
i =C4=8Das je Chen-Yu Tsai napisal(a):
> > On Thu, Dec 25, 2025 at 5:29=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > >
> > > On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
> > > <jernej.skrabec@gmail.com> wrote:
> > > >
> > > > This driver serves just as planes sharing manager, needed for Displ=
ay
> > > > Engine 3.3 and newer.
> > > >
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/sun4i/Kconfig         |   8 +
> > > >  drivers/gpu/drm/sun4i/Makefile        |   1 +
> > > >  drivers/gpu/drm/sun4i/sun50i_planes.c | 205 ++++++++++++++++++++++=
++++
> > > >  drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
> > > >  4 files changed, 257 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
> > > >  create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/=
Kconfig
> > > > index b56ba00aabca..946dd7606094 100644
> > > > --- a/drivers/gpu/drm/sun4i/Kconfig
> > > > +++ b/drivers/gpu/drm/sun4i/Kconfig
> > > > @@ -85,4 +85,12 @@ config DRM_SUN8I_TCON_TOP
> > > >           TCON TOP is responsible for configuring display pipeline =
for
> > > >           HDMI, TVE and LCD.
> > > >
> > > > +config DRM_SUN50I_PLANES
> > > > +       tristate
> > > > +       default DRM_SUN4I if DRM_SUN8I_MIXER!=3Dn
> > > > +       help
> > > > +         Chose this option if you have an Allwinner Soc with the
> > > > +         Display Engine 3.3 or newer. Planes are shared resource
> > > > +         between multiple mixers.
> > > > +
> > > >  endif
> > > > diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i=
/Makefile
> > > > index bad7497a0d11..03f002abef15 100644
> > > > --- a/drivers/gpu/drm/sun4i/Makefile
> > > > +++ b/drivers/gpu/drm/sun4i/Makefile
> > > > @@ -38,3 +38,4 @@ obj-$(CONFIG_DRM_SUN6I_DSI)   +=3D sun6i_mipi_dsi=
.o
> > > >  obj-$(CONFIG_DRM_SUN8I_DW_HDMI)        +=3D sun8i-drm-hdmi.o
> > > >  obj-$(CONFIG_DRM_SUN8I_MIXER)  +=3D sun8i-mixer.o
> > > >  obj-$(CONFIG_DRM_SUN8I_TCON_TOP) +=3D sun8i_tcon_top.o
> > > > +obj-$(CONFIG_DRM_SUN50I_PLANES)        +=3D sun50i_planes.o
> > >
> > > I don't think you can have this as a separate module:
> > >
> > > a. You are using sun8i_vi_layer_init_one() and sun8i_ui_layer_init_on=
e()
> > >    from the sun8i-mixer module, and neither of them are exported symb=
ols.
> > >
> > > b. You export sun50i_planes_setup() for sun8i-mixer to call, which en=
ds
> > >    up becoming a circular dependency.
> > >
> > > The easiest solution would be to just fold this into the sun8i-mixer =
module.
>
> I mimicked tcon-top module, but yeah, it's much less of a hassle to fold =
it
> into sun8i-mixer.
>
> > >
> > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/dr=
m/sun4i/sun50i_planes.c
> > > > new file mode 100644
> > > > index 000000000000..a99c01122990
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
> > > > @@ -0,0 +1,205 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
> > > > +
> > > > +#include <linux/device.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/mfd/syscon.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_graph.h>
> > > > +#include <linux/platform_device.h>
> > > > +
> > > > +#include "sun50i_planes.h"
> > > > +#include "sun8i_ui_layer.h"
> > > > +#include "sun8i_vi_layer.h"
> > > > +
> > > > +static bool sun50i_planes_node_is_planes(struct device_node *node)
> > > > +{
> > > > +       return !!of_match_node(sun50i_planes_of_table, node);
> > > > +}
> > > > +
> > > > +struct drm_plane **
> > > > +sun50i_planes_setup(struct device *dev, struct drm_device *drm,
> > > > +                   unsigned int mixer)
> > > > +{
> > > > +       struct sun50i_planes *planes =3D dev_get_drvdata(dev);
> > > > +       const struct sun50i_planes_quirks *quirks;
> > > > +       struct drm_plane **drm_planes;
> > > > +       const struct default_map *map;
> > > > +       unsigned int i;
> > > > +
> > > > +       if (!sun50i_planes_node_is_planes(dev->of_node)) {
> > > > +               dev_err(dev, "Device is not planes driver!\n");
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       if (!planes) {
> > > > +               dev_err(dev, "Planes driver is not loaded yet!\n");
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       if (mixer > 1) {
> > > > +               dev_err(dev, "Mixer index is too high!\n");
> > > > +               return NULL;
> > > > +       }
> > > > +
> > > > +       quirks =3D planes->quirks;
> > > > +       map =3D &quirks->def_map[mixer];
> > > > +
> > > > +       drm_planes =3D devm_kcalloc(drm->dev, map->num_ch + 1,
> > >
> > > Just a note: it seems we are missing the sentinel in sun8i_layers_ini=
t().
>
> Why do you think so? Current mainline code has mixer->cfg->vi_num +
> mixer->cfg->ui_num + 1.

I believe this was changed in your previous cleanups:

https://lore.kernel.org/all/20251104180942.61538-16-jernej.skrabec@gmail.co=
m/

ChenYu
