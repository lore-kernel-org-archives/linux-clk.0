Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:27670 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750834AbdAaDcQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Jan 2017 22:32:16 -0500
Date: Tue, 31 Jan 2017 09:02:36 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Andre Przywara <andre.przywara@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v3 08/10] dmaengine: sun6i: allow build on ARM64
 platforms (sun50i)
Message-ID: <20170131033236.GH19244@localhost>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
 <20170129023331.62106-9-icenowy@aosc.xyz>
 <20170130164210.GD19244@localhost>
 <3729521485800635@web23g.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3729521485800635@web23g.yandex.ru>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 31, 2017 at 02:23:55AM +0800, Icenowy Zheng wrote:
> 
> 
> 31.01.2017, 00:41, "Vinod Koul" <vinod.koul@intel.com>:
> > On Sun, Jan 29, 2017 at 10:33:29AM +0800, Icenowy Zheng wrote:
> >>  As 64-bit Allwinner H5 SoC has the same DMA engine with H3, the DMA
> >>  driver should be allowed to be built for ARM64, in order to make it work on H5.
> >>
> >>  Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >>  Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >>  Acked-by: Chen-Yu Tsai <wens@csie.org>
> >>  ---
> >>  Patch introduced between v1 and v2, to satisfy the newly added H3/H5 audio
> >>  codec support.
> >>
> >>   drivers/dma/Kconfig | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>  diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> >>  index 0d6a96ee9fc7..d01d59812cf3 100644
> >>  --- a/drivers/dma/Kconfig
> >>  +++ b/drivers/dma/Kconfig
> >>  @@ -157,7 +157,7 @@ config DMA_SUN4I
> >>
> >>   config DMA_SUN6I
> >>           tristate "Allwinner A31 SoCs DMA support"
> >>  - depends on MACH_SUN6I || MACH_SUN8I || COMPILE_TEST
> >>  + depends on MACH_SUN6I || MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
> >
> > Do we really need ARM64 here? also looking at others I wonder why isn't
> > this MACH_SUNXI...?
> 
> You mean directly place "ARCH_SUNXI" here?
> 
> SUN4I/SUN5I/SUN7I do not use DMA_SUN6I, they have different DMA
> controllers.

No my question was different..

We have MACH_SUNxx for 6I and 8I, so why do we have ARCH_SUNXI and if its an
arch SUNXI, X means it can take any value...

This schema looks pretty confusing while reading

Also I had a question on usage of ARM64..

-- 
~Vinod
