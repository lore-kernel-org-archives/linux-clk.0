Return-Path: <yingjoe.chen@mediatek.com>
Message-ID: <1484143526.8614.0.camel@mtksdaap41>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Jean Delvare <jdelvare@suse.de>
CC: James Liao <jamesjj.liao@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
	Stephen Boyd <sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, <linux-mediatek@lists.infradead.org>,
	Shunli Wang <shunli.wang@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Andreas =?ISO-8859-1?Q?F=E4rber?=
	<afaerber@suse.de>
Date: Wed, 11 Jan 2017 22:05:26 +0800
In-Reply-To: <20170111134146.36878e01@endymion>
References: <20170109113621.31d384c9@endymion>
	 <c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
	 <20170110130300.167d215b@endymion> <1484099788.26901.8.camel@mtksdaap41>
	 <20170111134146.36878e01@endymion>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: yingjoe.chen@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

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


Why not just check for ARM?

+	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST

Joe.C
