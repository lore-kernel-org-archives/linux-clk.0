Return-Path: <ukl@pengutronix.de>
Date: Mon, 8 May 2017 10:24:56 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: linux-clk@vger.kernel.org,
	Michael Krummsdorf <michael.krummsdorf@tq-group.com>,
	kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170508082456.dx4rthdsidbrkxza@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
 <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
 <16216689.278511.1494157914798@email.1und1.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <16216689.278511.1494157914798@email.1und1.de>
List-ID: <linux-clk.vger.kernel.org>

Hello Stefan,

On Sun, May 07, 2017 at 01:51:54PM +0200, Stefan Wahren wrote:
> > On Fri, May 05, 2017 at 05:49:09PM +0200, Stefan Wahren wrote:
> > > Uwe and i made some investigations regards to this issue. The busy bit
> > > of the HW_CLKCTRL_SSP3 was high after boot up, but this shouldn't be the
> > > case. I have the suspicion that there is an issue during clock init or
> > > in the mxs clock driver.
> > > 
> > > Duckbill (Linux 4.11 Mainline)
> > > 
> > > HW_SSP2_TIMING    0x80014070 00000209
> > > HW_CLKCTRL_HBUS   0x80040060 00000003
> > > HW_CLKCTRL_SSP0   0x80040090 00000005
> > > HW_CLKCTRL_SSP1   0x800400A0 80000001
> > > HW_CLKCTRL_SSP2   0x800400B0 00000002
> > > HW_CLKCTRL_SSP3   0x800400C0 A0000001
> > > HW_CLKCTRL_EMI    0x800400F0 00000102
> > > HW_CLKCTRL_FRAC0  0x800401B0 5E5B5513
> > > HW_CLKCTRL_CLKSEQ 0x800401D0 00004104
> > 
> > Using barebox as bootloader I have this situation there:
> > 
> > 	/ md 0x800400c0+4; md 0x800400c0+4
> > 	800400c0: a0000005                                           ....
> > 	800400c0: a0000005                                           ....
> > 
> > so I suspect the BUSY bit is set when the bootloader is started as
> > (TTBOMK) barebox didn't touch ssp up to this point. The description of
> > the busy bit is:
> > 
> > 	This read-only bit field returns a one when the clock divider is
> > 	busy transfering a new divider value across clock domains.
> > 
> > That sounds to me as if this bit shouldn't be set for longer than a few
> > microseconds?!
> 
> This is expected behavior according to the hardware. As long the clock is gated the busy bit will never be cleared. Unfortunately the mxs clk-div doesn't handle this case properly. In case the gate is set, clk-div changes the values and waits that the busy bit become cleared. Since this will never happen, the set_rate operation runs into an unnecessary timeout.
> 
> I added a trace_printk into mxs_clk_wait and saw a timeout for changes on ssp3_div. This should be triggered by the clock change of spi-mxs on ssp2_div, because both have the same parent: ref_io1. In order to handle this properly the gate shouldn't be a child of clk-div.
> 
> > 
> > For me my patch makes the following difference (just checked the above
> > register set) when Linux is booted:
> > 
> > name              | address    | value before patch | value with patch
> > ------------------+------------+--------------------+-----------------
> > HW_SSP2_TIMING    | 0x80014070 | 0x00000209         | 0x00000208
> > HW_CLKCTRL_HBUS   | 0x80040060 | 0x00000003         | 0x00000003
> > HW_CLKCTRL_SSP0   | 0x80040090 | 0x00000005         | 0x00000005
> > HW_CLKCTRL_SSP1   | 0x800400a0 | 0x00000005         | 0x00000005
> > HW_CLKCTRL_SSP2   | 0x800400b0 | 0x80000002         | 0x80000002
> > HW_CLKCTRL_SSP3   | 0x800400c0 | 0x80000005         | 0xa0000005
> > HW_CLKCTRL_EMI    | 0x800400f0 | 0x00000102         | 0x00000102
> > HW_CLKCTRL_FRAC0  | 0x800401b0 | 0x1e9b5513         | 0x5ede5513
> > HW_CLKCTRL_CLKSEQ | 0x800401d0 | 0x00000104         | 0x00000104
> > 
> > So ref_io1 changed from 480 * (18 / 27) MHz = 320 MHz to
> > 480 * (18 / 30) MHz = 288 MHz (as intended) (FRAC0[16:21]). The other
> > changes to FRAC0 (IO1_STABLE, IO0_STABLE) don't look relevant?!
> > 
> 
> I have no idea because those flags only toggle on success.
> 
> > 
> > I wonder if this part of drivers/clk/mxs/clk-imx28.c:
> > 
> >         /*
> >          * 480 MHz seems too high to be ssp clock source directly,
> >          * so set frac0 to get a 288 MHz ref_io0 and ref_io1.
> >          */
> >         val = readl_relaxed(FRAC0);
> >         val &= ~((0x3f << BP_FRAC0_IO0FRAC) | (0x3f << BP_FRAC0_IO1FRAC));
> >         val |= (30 << BP_FRAC0_IO0FRAC) | (30 << BP_FRAC0_IO1FRAC);
> >         writel_relaxed(val, FRAC0);
> > 
> > is related to this "lowest bit is wrong"-problem and is the result from
> > a wrong and/or incomplete analysis. 
> 
> I think there are 2 possible issues with this init code. First we try to set IO0FRAC and IO1FRAC at the same time.
> 
> The other one is the order. The parent of all 4 SSP clocks are switched to ref_io, before the FRAC0 register is set up to 288 MHz. This shouldn't be a real problem as long as the bootloader init FRAC0 before.
> 
> Nevertheless i prepare a proof of concept (hacky) patch to address all 3 possible issues [1]:
> - swap FRAC0 setup and CLKSEQ bypass changes for all SSPs
> - split IO0FRAC and IO1FRAC changes into 2 separate R-M-W sequences incl. memory barrier
> - avoid clock changes to sspX_div if they are gated or busy
> - additionaly trace_printks
> 
> I tested it with Duckbill, but without a QCA7000. So i don't know if it fixes the bit errors with the QCA7000.
> 
> Uwe, could you please test it with your EEPROM but without your 2 clock patches?
> Does it have any influence on the bit errors?

The patch doesn't make the bit errors go away. The only message being
generated is:

	swapper-1     [000] .......     1.134985: clk_div_set_rate: Cannot to set ssp3_div: gated 

When I compare your clk_summary (with my patch) to my working one the
only differences are some enable/prepare counts, you have the following
clocks on while I have not:

	lradc, enet_out, lcdif_sel (also reparented), fec

while I have these clocks on and you have not:

	ssp1

There are no differences in clk freqs for clocks that we both have on
which should rule out a problem of competing clock domains.

I'm out of ideas :-(

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
