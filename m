Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1485313281.1348.1.camel@mtksdaap41>
Subject: Re: [PATCH v2] clk: mediatek: Fix MT2701 dependencies
From: James Liao <jamesjj.liao@mediatek.com>
To: Jean Delvare <jdelvare@suse.de>
CC: <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Shunli Wang
	<shunli.wang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Matthias
 Brugger <matthias.bgg@gmail.com>
Date: Wed, 25 Jan 2017 11:01:21 +0800
In-Reply-To: <20170124130704.14015da3@endymion>
References: <20170124130704.14015da3@endymion>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-01-24 at 13:07 +0100, Jean Delvare wrote:
> If I say "no" to "Clock driver for Mediatek MT2701", I don't want to
> be asked individually about each sub-driver. No means no.
> 
> Additionally, this driver shouldn't be proposed at all on non-mediatek
> builds, unless build-testing.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Reviewed-by: Andreas Färber <afaerber@suse.de>
> Reviewed-by: James Liao <jamesjj.liao@mediatek.com>
> Cc: Shunli Wang <shunli.wang@mediatek.com>
> Cc: Erin Lo <erin.lo@mediatek.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>

Acked-by: James Liao <jamesjj.liao@mediatek.com>

> ---
> Changes since v1:
>  * Restrict to 32-bit ARM.
> 
>  drivers/clk/mediatek/Kconfig |   15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> --- linux-4.10-rc4.orig/drivers/clk/mediatek/Kconfig	2017-01-16 11:13:07.146675028 +0100
> +++ linux-4.10-rc4/drivers/clk/mediatek/Kconfig	2017-01-24 12:55:50.192100713 +0100
> @@ -8,44 +8,45 @@ config COMMON_CLK_MEDIATEK
>  
>  config COMMON_CLK_MT2701
>  	bool "Clock driver for Mediatek MT2701"
> +	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
> -	default ARCH_MEDIATEK
> +	default ARCH_MEDIATEK && ARM
>  	---help---
>  	  This driver supports Mediatek MT2701 basic clocks.
>  
>  config COMMON_CLK_MT2701_MMSYS
>  	bool "Clock driver for Mediatek MT2701 mmsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 mmsys clocks.
>  
>  config COMMON_CLK_MT2701_IMGSYS
>  	bool "Clock driver for Mediatek MT2701 imgsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 imgsys clocks.
>  
>  config COMMON_CLK_MT2701_VDECSYS
>  	bool "Clock driver for Mediatek MT2701 vdecsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 vdecsys clocks.
>  
>  config COMMON_CLK_MT2701_HIFSYS
>  	bool "Clock driver for Mediatek MT2701 hifsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 hifsys clocks.
>  
>  config COMMON_CLK_MT2701_ETHSYS
>  	bool "Clock driver for Mediatek MT2701 ethsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 ethsys clocks.
>  
>  config COMMON_CLK_MT2701_BDPSYS
>  	bool "Clock driver for Mediatek MT2701 bdpsys"
> -	select COMMON_CLK_MT2701
> +	depends on COMMON_CLK_MT2701
>  	---help---
>  	  This driver supports Mediatek MT2701 bdpsys clocks.
>  
> 
> 
