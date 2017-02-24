Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20170222200947.3ikrhvv76ymfu5tv@lukather>
References: <20170222152310.3719-5-icenowy@aosc.xyz>
 <20170222200947.3ikrhvv76ymfu5tv@lukather>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 24 Feb 2017 07:30:36 -0600
Message-ID: <CAL_JsqKY1sXT9g9wHhQEt9-x32PaY0yQi8++bTajcEVk1x8E_w@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2 mixers and
 display engines
To: Maxime Ripard <maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Francois Moine <moinejf@free.fr>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 22, 2017 at 2:09 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Wed, Feb 22, 2017 at 11:23:06PM +0800, Icenowy Zheng wrote:
>> Allwinner have a new "Display Engine 2.0" in there new SoCs, which comes
>> in a new "Display Engine" (mixers instead of old backends and
>> frontends).
>>
>> Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>> ---

[...]

>> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> new file mode 100644
>> index 000000000000..9427b57240d3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
>> @@ -0,0 +1,417 @@
>> +/*
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.xyz>
>> + *
>> + * Based on sun4i_backend.c, which is:
>> + *   Copyright (C) 2015 Free Electrons
>> + *   Copyright (C) 2015 NextThing Co
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation; either version 2 of
>> + * the License, or (at your option) any later version.
>> + */
>> +
>> +#include <drm/drmP.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_plane_helper.h>
>> +
>> +#include <linux/component.h>
>> +#include <linux/reset.h>
>> +#include <linux/of_device.h>
>> +
>> +#include "sun8i_mixer.h"
>> +#include "sun4i_drv.h"
>> +
>> +#define SUN8I_DRAM_OFFSET 0x40000000
>
> PHYS_OFFSET?

PHYS_OFFSET is not portable. __pa(PAGE_OFFSET) instead.

If your DMA addresses are different from CPU addresses (i.e. have some
offset), then use "dma-ranges" in DT.

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
