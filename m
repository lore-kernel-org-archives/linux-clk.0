Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:49086 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750729AbeDXPjI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Apr 2018 11:39:08 -0400
Subject: Re: [v2 resend 03/10] mfd: mtk-mmsys: Add mmsys driver
To: matthias.bgg@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        sboyd@codeaurora.org, lee.jones@linaro.org
Cc: davem@davemloft.net, gregkh@linuxfoundation.org,
        mchehab@kernel.org, pi-cheng.chen@linaro.org,
        sean.wang@mediatek.com, linux-clk@vger.kernel.org,
        linux@armlinux.org.uk, matthias.bgg@gmail.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
 <99bef17c57ad60eff6104da780cf59b785bd3e42.1524563001.git.mbrugger@suse.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9b023ba1-fb66-a955-e54d-d0a9cbbd7b45@infradead.org>
Date: Tue, 24 Apr 2018 08:39:03 -0700
MIME-Version: 1.0
In-Reply-To: <99bef17c57ad60eff6104da780cf59b785bd3e42.1524563001.git.mbrugger@suse.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/24/2018 02:47 AM, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MMSYS subsystem includes clocks and drm components.
> This patch adds a MFD device to probe both drivers from the same
> device tree compatible.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/mfd/Kconfig     |  9 ++++++
>  drivers/mfd/Makefile    |  2 ++
>  drivers/mfd/mtk-mmsys.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 90 insertions(+)
>  create mode 100644 drivers/mfd/mtk-mmsys.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index b860eb5aa194..a2c928e26026 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -378,6 +378,15 @@ config MFD_MC13XXX_I2C
>  	help
>  	  Select this if your MC13xxx is connected via an I2C bus.
>  
> +config MFD_MEDIATEK_MMSYS
> +	tristate "Mediatek MMSYS interface"
> +	select MDF_CORE

	select MFD_CORE

tested??

> +	select REGMAP_MMIO
> +	help
> +	  Select this if you have a MMSYS subsystem in your SoC. The
> +	  MMSYS subsystem has at least a clock driver part and some
> +	  DRM components.
> +
>  config MFD_MXS_LRADC
>  	tristate "Freescale i.MX23/i.MX28 LRADC"
>  	depends on ARCH_MXS || COMPILE_TEST


-- 
~Randy
