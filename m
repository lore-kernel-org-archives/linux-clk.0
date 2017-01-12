Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1484192392.26901.12.camel@mtksdaap41>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
From: James Liao <jamesjj.liao@mediatek.com>
To: Jean Delvare <jdelvare@suse.de>
CC: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	<linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Erin Lo <erin.lo@mediatek.com>, "Stephen
 Boyd" <sboyd@codeaurora.org>, Shunli Wang <shunli.wang@mediatek.com>, Michael
 Turquette <mturquette@baylibre.com>
Date: Thu, 12 Jan 2017 11:39:52 +0800
In-Reply-To: <20170111134146.36878e01@endymion>
References: <20170109113621.31d384c9@endymion>
	 <c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
	 <20170110130300.167d215b@endymion>	<1484099788.26901.8.camel@mtksdaap41>
	 <20170111134146.36878e01@endymion>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

Hi Jean,

On Wed, 2017-01-11 at 13:41 +0100, Jean Delvare wrote:
> Hi James,
> 
> On Wed, 11 Jan 2017 09:56:28 +0800, James Liao wrote:
> > On Tue, 2017-01-10 at 13:03 +0100, Jean Delvare wrote:
> > > What about MT8135 and MT8173, are they 32-bit SoCs as well?
> > 
> > MT8135 is a 32-bit SoC and MT8173 is a 64-bit SoC.
> 
> OK, so would the following change make sense?
> 
> ---
>  drivers/clk/mediatek/Kconfig |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-4.10-rc2.orig/drivers/clk/mediatek/Kconfig	2017-01-09 11:17:37.542344083 +0100
> +++ linux-4.10-rc2/drivers/clk/mediatek/Kconfig	2017-01-11 13:40:21.965890913 +0100
> @@ -52,16 +52,16 @@ config COMMON_CLK_MT2701_BDPSYS
>  
>  config COMMON_CLK_MT8135
>  	bool "Clock driver for Mediatek MT8135"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on (ARCH_MEDIATEK && !ARM64) || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
> -	default ARCH_MEDIATEK
> +	default y
>  	---help---
>  	  This driver supports Mediatek MT8135 clocks.
>  
>  config COMMON_CLK_MT8173
>  	bool "Clock driver for Mediatek MT8173"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
>  	select COMMON_CLK_MEDIATEK
> -	default ARCH_MEDIATEK
> +	default y
>  	---help---
>  	  This driver supports Mediatek MT8173 clocks.
> 
> Thanks,

Although MT8173 is a 64-bit SoC, but 32-bit kernel can run on it. So I
think it no need to limit COMMON_CLK_MT8173 only be enabled on ARM64
platform.


Best regards,

James
