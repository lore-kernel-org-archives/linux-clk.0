Return-Path: <albeu@free.fr>
Date: Mon, 1 Feb 2016 12:03:00 +0100
From: Alban <albeu@free.fr>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Aban Bedel <albeu@free.fr>, linux-mips@linux-mips.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring
 <robh+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC v3 01/14] WIP: clk: add Atheros AR724X/AR913X/AR933X SoCs
 clock driver
Message-ID: <20160201120300.3d6fd1b3@tock>
In-Reply-To: <20160131234155.eee918745880878963c044aa@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
	<1453580251-2341-2-git-send-email-antonynpavlov@gmail.com>
	<20160125232156.35c0ce3f@tock>
	<20160131234155.eee918745880878963c044aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Sun, 31 Jan 2016 23:41:55 +0300
Antony Pavlov <antonynpavlov@gmail.com> wrote:

> > > +	ath79_clks[ATH79_CLK_REF] = ath79_add_sys_clkdev("ref", ref_rate);
> > > +	ath79_clks[ATH79_CLK_CPU] = ath79_add_sys_clkdev("cpu", cpu_rate);
> > > +	ath79_clks[ATH79_CLK_DDR] = ath79_add_sys_clkdev("ddr", ddr_rate);
> > > +	ath79_clks[ATH79_CLK_AHB] = ath79_add_sys_clkdev("ahb", ahb_rate);
> > > +	ath79_clks[ATH79_CLK_WDT] = ath79_add_sys_clkdev("wdt", ahb_rate);
> > > +	ath79_clks[ATH79_CLK_UART] = ath79_add_sys_clkdev("uart", ahb_rate);  
> > 
> > You shouldn't add ref, wdt and uart, they are not needed and make the
> > driver incompatible with the current DT bindings.  
> 
> Please describe the situation then this incompatibility does matter.
> 
> Current ath79 dt support is very preliminary and the only dt user
> is 5-years old TP-Link WR1043ND so it's near impossible to break somethink.
> 
> Anyway current ath79 dt binding is somewhat broken (see __your__ message
> 'Re: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more
> devicetree-friendly' from 'Thu, 21 Jan 2016 12:03:20 +0100').

The point is that DT is about describing the hardware in a consistent
and OS independent manner. It shouldn't be modeled just to suit some
existing code. So it is no big deal if the code doesn't use all the
informations provided by the DT, like here where the input clock is not
*yet* used by the code. However it is a no-go to extend the binding to
add things that don't exists in the hardware just to suit some old code.

I agree we might need to clear a few things regarding the UART clock in
the newer SoC, in particular if the UART use the output of the PLL
pre-divider or something similar. Then we would need to rework the DT
binding for the those SoC. However with the current knowledge I don't
see any need to change the biding yet.

Alban
