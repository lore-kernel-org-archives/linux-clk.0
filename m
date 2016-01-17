Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from plaes.org ([188.166.43.21]:43486 "EHLO plaes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751369AbcAQM6s (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Sun, 17 Jan 2016 07:58:48 -0500
Message-ID: <1453035519.13209.1.camel@plaes.org>
Subject: Re: [linux-sunxi] [PATCH v2 16/26] drm: Add Allwinner A10 Display
 Engine support
From: Priit Laes <plaes@plaes.org>
To: maxime.ripard@free-electrons.com,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 17 Jan 2016 14:58:39 +0200
In-Reply-To: <1452957104.12419.12.camel@plaes.org>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1452785109-6172-17-git-send-email-maxime.ripard@free-electrons.com>
	 <1452957104.12419.12.camel@plaes.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2016-01-16 at 17:11 +0200, Priit Laes wrote:
> On Thu, 2016-01-14 at 16:24 +0100, Maxime Ripard wrote:
> > The Allwinner A10 and subsequent SoCs share the same display
> > pipeline, with
> > variations in the number of controllers (1 or 2), or the presence
> > or not of
> > some output (HDMI, TV, VGA) or not.
[...]
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> > b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> > new file mode 100644
> > index 000000000000..68072b8cddab
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sun4i/sun4i_framebuffer.c
> > @@ -0,0 +1,54 @@
> > +/*
> > + * Copyright (C) 2015 Free Electrons
> > + * Copyright (C) 2015 NextThing Co
> > + *
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> > +
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drmP.h>
> > +
> > +#include "sun4i_drv.h"
> > +
> > +static void sun4i_de_output_poll_changed(struct drm_device *drm)
> > +{
> > +	struct sun4i_drv *drv = drm->dev_private;
> > +
> > +	if (drv->fbdev)
> > +		drm_fbdev_cma_hotplug_event(drv->fbdev);
> > +}
> > +
> > +static const struct drm_mode_config_funcs
> > sun4i_de_mode_config_funcs
> > = {
> > +	.output_poll_changed	=
> > sun4i_de_output_poll_changed,
> > +	.atomic_check		= drm_atomic_helper_check,
> > +	.atomic_commit		= drm_atomic_helper_commit,
> > +	.fb_create		= drm_fb_cma_create,
> > +};
> > +
> > +struct drm_fbdev_cma *sun4i_framebuffer_init(struct drm_device
> > *drm)
> > +{
> > +	drm_mode_config_reset(drm);
> > +
> > +	drm->mode_config.max_width = 8192;
> > +	drm->mode_config.max_height = 8192;
> 
> Shouldn't these be 1920 x 1080 as per A10 User manual?

I was wrong here. 8192x8192 it is.

>

Päikest,
Priit Laes :)
