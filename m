Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1501088747.2401.27.camel@baylibre.com>
Subject: Re: [PATCH v3 00/10] clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Adriana Reus
 <adi.reus@gmail.com>
Date: Wed, 26 Jul 2017 19:05:47 +0200
In-Reply-To: <20170712011604.GQ22780@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
	 <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
	 <1497955822.7387.3.camel@baylibre.com>
	 <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
	 <1497961950.7387.7.camel@baylibre.com>
	 <1498050903.7387.12.camel@baylibre.com>
	 <20170712011604.GQ22780@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-07-11 at 18:16 -0700, Stephen Boyd wrote:
> On 06/21, Jerome Brunet wrote:
> > 
> > I managed to have a run on kci - based on v4.12-rc6:
> > https://kernelci.org/boot/all/job/khilman/branch/to-build/kernel/v4.12-rc6-1
> > 0-ge
> > a373ddef830/
> > 
> > There was no build regression but kci did find one boot regression on qcom
> > platforms:
> > * qcom-apq8064-cm-qs600
> > * qcom-apq8064-ifc6410
> > 
> > it seems the problem is coming from the clock used by the mmc driver
> > (drivers/mmc/host/mmci.c)
> > 
> > the driver does following sequence:
> > * get_clk
> > * prepare_enable
> > * get_rate
> > * set_rate
> > * ...
> > 
> > with clock SDCx_clk (qcom_apq8064.dtsi:1037). This clock has
> > CLK_SET_RATE_PARENT
> > flag so it will transmit the request to its parent.
> > The parent of this clock is SDCx_src which has the CLK_SET_RATE_GATE flag.
> > 
> > This can't work with sequence above. The flag was clearly bypassed before,
> > so I
> > think it would be best to remove CLK_SET_RATE_GATE from the SDCx_src clocks
> > 
> > Stephen, would you agree ?
> > 
> > There was an issue with the chip board as well but this particular board has
> > not
> > been very reliable in this lab lately. It has failed on several other job.
> > 
> 
> Yes the flag was never working before and we've been ignoring the
> subtle problems that it causes to change the rate while the clk
> is enabled. On these older SoCs, all the clks marked with
> CLK_SET_RATE_GATE need to implement something to forcibly disable
> all child clks across the rate change. That is the hardware
> recommended procedure.

Seems that HW has been doing fine w/o recommended procedure so far ;)

> 
> So something like
> 
> 	get_clk
> 	prepare_enable
> 	get_rate
> 	set_rate
> 	 call ->set_rate() op
> 	 forcibly disable children of rcgs
> 	 actually change the rate of rcg
> 	 forcibly enable all children that were disabled
> 
> and have that happen under one big spinlock local to the qcom
> driver I suppose so that enable/disable can't leak into the rate
> change. Fun! I'll make an attempt at implementing the right
> solution tomorrow/tonight. Of course, we can remove the flag from
> qcom drivers if it's blocking this series.
> 

Yeah, it is probably blocking the series.

In the following mail, I've only replied where I wanted to discuss a bit more.
For everything else, please consider the comments agreed and the modifications
done as requested.
