Return-Path: <jdelvare@suse.de>
Date: Thu, 12 Jan 2017 09:40:11 +0100
From: Jean Delvare <jdelvare@suse.de>
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
 <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Erin Lo
 <erin.lo@mediatek.com>, "Stephen Boyd" <sboyd@codeaurora.org>, Shunli Wang
 <shunli.wang@mediatek.com>, Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
Message-ID: <20170112094011.0e0a32e6@endymion>
In-Reply-To: <1484192392.26901.12.camel@mtksdaap41>
References: <20170109113621.31d384c9@endymion>
	<c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
	<20170110130300.167d215b@endymion>
	<1484099788.26901.8.camel@mtksdaap41>
	<20170111134146.36878e01@endymion>
	<1484192392.26901.12.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi James,

On Thu, 12 Jan 2017 11:39:52 +0800, James Liao wrote:
> On Wed, 2017-01-11 at 13:41 +0100, Jean Delvare wrote:
> >  config COMMON_CLK_MT8173
> >  	bool "Clock driver for Mediatek MT8173"
> > -	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
> >  	select COMMON_CLK_MEDIATEK
> > -	default ARCH_MEDIATEK
> > +	default y
> >  	---help---
> >  	  This driver supports Mediatek MT8173 clocks.
> 
> Although MT8173 is a 64-bit SoC, but 32-bit kernel can run on it. So I
> think it no need to limit COMMON_CLK_MT8173 only be enabled on ARM64
> platform.

OK, I'll leave that one alone then, thanks for the information.

-- 
Jean Delvare
SUSE L3 Support
