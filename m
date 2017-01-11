Return-Path: <jdelvare@suse.de>
Date: Wed, 11 Jan 2017 15:42:20 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: James Liao <jamesjj.liao@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 Stephen Boyd <sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, <linux-mediatek@lists.infradead.org>,
 Shunli Wang <shunli.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andreas =?UTF-8?B?RsOkcmJlcg==?=
 <afaerber@suse.de>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
Message-ID: <20170111154220.2d4c9da7@endymion>
In-Reply-To: <1484143526.8614.0.camel@mtksdaap41>
References: <20170109113621.31d384c9@endymion>
	<c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
	<20170110130300.167d215b@endymion>
	<1484099788.26901.8.camel@mtksdaap41>
	<20170111134146.36878e01@endymion>
	<1484143526.8614.0.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Joe,

On Wed, 11 Jan 2017 22:05:26 +0800, Yingjoe Chen wrote:
> On Wed, 2017-01-11 at 13:41 +0100, Jean Delvare wrote:
> > @@ -52,16 +52,16 @@ config COMMON_CLK_MT2701_BDPSYS
> >  
> >  config COMMON_CLK_MT8135
> >  	bool "Clock driver for Mediatek MT8135"
> > -	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on (ARCH_MEDIATEK && !ARM64) || COMPILE_TEST
> 
> 
> Why not just check for ARM?
> 
> +	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST

I don't know :D Andreas suggested it for MT2701, so I assumed ARM was
set also for 64-bit kernels (like X86 is set for 64-bit kernels) and
ARM64 had to be used to differentiate. But it seems ARM isn't set for
64-bit kernels, so you are right, checking for ARM should work and is
more straightforward. I'll fix it before submitting the patch.

Thanks for the review,
-- 
Jean Delvare
SUSE L3 Support
