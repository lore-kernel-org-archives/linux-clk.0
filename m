Return-Path: <afaerber@suse.de>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
To: Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <20170109113621.31d384c9@endymion>
Cc: James Liao <jamesjj.liao@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Shunli Wang <shunli.wang@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Message-ID: <c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
Date: Mon, 9 Jan 2017 21:08:50 +0100
MIME-Version: 1.0
In-Reply-To: <20170109113621.31d384c9@endymion>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi Jean,

Am 09.01.2017 um 11:36 schrieb Jean Delvare:
> If I say "no" to "Clock driver for Mediatek MT2701", I don't want to
> be asked individually about each sub-driver. No means no.
> 
> Additionally, this driver shouldn't be proposed at all on non-mediatek
> builds, unless build-testing.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Cc: Shunli Wang <shunli.wang@mediatek.com>
> Cc: James Liao <jamesjj.liao@mediatek.com>
> Cc: Erin Lo <erin.lo@mediatek.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> ---
[...]
> As another side note, I wonder why so many clock drivers have
> "COMMON" in their symbol names. Looks wrong to me.

It refers to the Common Clock Framework:
https://www.kernel.org/doc/Documentation/clk.txt

> --- linux-4.10-rc2.orig/drivers/clk/mediatek/Kconfig	2017-01-01 23:31:53.000000000 +0100
> +++ linux-4.10-rc2/drivers/clk/mediatek/Kconfig	2017-01-09 11:17:37.542344083 +0100
> @@ -8,6 +8,7 @@ config COMMON_CLK_MEDIATEK
>  
>  config COMMON_CLK_MT2701
>  	bool "Clock driver for Mediatek MT2701"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
>  	default ARCH_MEDIATEK

Should the default then become y for simplicity?

Another aspect here is that this is a 32-bit SoC but it propagates into
the arm64 configs, so maybe (ARCH_MEDIATEK && !ARM64) || COMPILE_TEST?

Same for mt2701 pinctrl.

http://kernel.opensuse.org/cgit/kernel-source/plain/config/arm64/default?id=ff90e915117c5d7a8bb00dc0bc1d3145ebe985ec

>  	---help---
> @@ -15,37 +16,37 @@ config COMMON_CLK_MT2701
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

Anyway, a step forward,

Reviewed-by: Andreas Färber <afaerber@suse.de>

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
