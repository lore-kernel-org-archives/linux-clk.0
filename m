Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1484015574.26901.6.camel@mtksdaap41>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
From: James Liao <jamesjj.liao@mediatek.com>
To: Jean Delvare <jdelvare@suse.de>
CC: <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Shunli Wang" <shunli.wang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
	"Stephen Boyd" <sboyd@codeaurora.org>, Michael Turquette
	<mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 10 Jan 2017 10:32:54 +0800
In-Reply-To: <20170109113621.31d384c9@endymion>
References: <20170109113621.31d384c9@endymion>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

Hi Jean,

On Mon, 2017-01-09 at 11:36 +0100, Jean Delvare wrote:
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

Reviewed-by: James Liao <jamesjj.liao@mediatek.com>

> ---
> As a side note, is there any rationale for splitting this driver into
> that many small sub-drivers? Looks overengineered to me.

These are 'subsystem' clocks and can be controlled only if their
corresponding drivers are ready to control power domains and clocks.

> As another side note, I wonder why so many clock drivers have
> "COMMON" in their symbol names. Looks wrong to me.

CCF (Common Clock Framework) uses option 'COMMON_CLK', so CCF platform
drivers use 'COMMON_CLK_' to be their option prefix.

>  drivers/clk/mediatek/Kconfig |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> --- linux-4.10-rc2.orig/drivers/clk/mediatek/Kconfig	2017-01-01 23:31:53.000000000 +0100
> +++ linux-4.10-rc2/drivers/clk/mediatek/Kconfig	2017-01-09 11:17:37.542344083 +0100
> @@ -8,6 +8,7 @@ config COMMON_CLK_MEDIATEK
>  
>  config COMMON_CLK_MT2701
>  	bool "Clock driver for Mediatek MT2701"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
>  	default ARCH_MEDIATEK
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
> 
> 
