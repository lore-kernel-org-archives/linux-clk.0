Return-Path: <ukl@pengutronix.de>
Date: Fri, 5 May 2017 22:10:39 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	kernel@pengutronix.de,
	Michael Krummsdorf <michael.krummsdorf@tq-group.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
List-ID: <linux-clk.vger.kernel.org>

Hello,

(adding Michael Krummsdorf who authored a different patch for the same
problem back in 2014 which Stefan found in TQ's patch stack.)

On Fri, May 05, 2017 at 05:49:09PM +0200, Stefan Wahren wrote:
> Uwe and i made some investigations regards to this issue. The busy bit
> of the HW_CLKCTRL_SSP3 was high after boot up, but this shouldn't be the
> case. I have the suspicion that there is an issue during clock init or
> in the mxs clock driver.
> 
> Duckbill (Linux 4.11 Mainline)
> 
> HW_SSP2_TIMING    0x80014070 00000209
> HW_CLKCTRL_HBUS   0x80040060 00000003
> HW_CLKCTRL_SSP0   0x80040090 00000005
> HW_CLKCTRL_SSP1   0x800400A0 80000001
> HW_CLKCTRL_SSP2   0x800400B0 00000002
> HW_CLKCTRL_SSP3   0x800400C0 A0000001
> HW_CLKCTRL_EMI    0x800400F0 00000102
> HW_CLKCTRL_FRAC0  0x800401B0 5E5B5513
> HW_CLKCTRL_CLKSEQ 0x800401D0 00004104

Using barebox as bootloader I have this situation there:

	/ md 0x800400c0+4; md 0x800400c0+4
	800400c0: a0000005                                           ....
	800400c0: a0000005                                           ....

so I suspect the BUSY bit is set when the bootloader is started as
(TTBOMK) barebox didn't touch ssp up to this point. The description of
the busy bit is:

	This read-only bit field returns a one when the clock divider is
	busy transfering a new divider value across clock domains.

That sounds to me as if this bit shouldn't be set for longer than a few
microseconds?!

For me my patch makes the following difference (just checked the above
register set) when Linux is booted:

name              | address    | value before patch | value with patch
------------------+------------+--------------------+-----------------
HW_SSP2_TIMING    | 0x80014070 | 0x00000209         | 0x00000208
HW_CLKCTRL_HBUS   | 0x80040060 | 0x00000003         | 0x00000003
HW_CLKCTRL_SSP0   | 0x80040090 | 0x00000005         | 0x00000005
HW_CLKCTRL_SSP1   | 0x800400a0 | 0x00000005         | 0x00000005
HW_CLKCTRL_SSP2   | 0x800400b0 | 0x80000002         | 0x80000002
HW_CLKCTRL_SSP3   | 0x800400c0 | 0x80000005         | 0xa0000005
HW_CLKCTRL_EMI    | 0x800400f0 | 0x00000102         | 0x00000102
HW_CLKCTRL_FRAC0  | 0x800401b0 | 0x1e9b5513         | 0x5ede5513
HW_CLKCTRL_CLKSEQ | 0x800401d0 | 0x00000104         | 0x00000104

So ref_io1 changed from 480 * (18 / 27) MHz = 320 MHz to
480 * (18 / 30) MHz = 288 MHz (as intended) (FRAC0[16:21]). The other
changes to FRAC0 (IO1_STABLE, IO0_STABLE) don't look relevant?!

Something changed for CLKCTRL_SSP3 (BUSY) even though ssp3 isn't used on
my machine. I also tried to reproduce BUSY disappearing by doing the
same changes to io1 in barebox that Linux does, but without success.

The change to HW_SSP2_TIMING compensates the decreased io1
speed. (Changing the clock rate from

	320 MHz / (2 * 10) = 16 MHz

(which is the target rate setup by the spi-mxs driver) to

	288 MHz / (2 * 9) = 16 MHz

. So it's not actually changed.)

> @Uwe: Additionaly applying "spi: mxs: implement runtime pm" to this
> patch also doesn't fix the bit error.

ok. Would have been nice if that was the relevant difference between
your machine that still has the problem with my patch and mine where the
bug is fixed (or papered over) by my patch.

I wonder if this part of drivers/clk/mxs/clk-imx28.c:

        /*
         * 480 MHz seems too high to be ssp clock source directly,
         * so set frac0 to get a 288 MHz ref_io0 and ref_io1.
         */
        val = readl_relaxed(FRAC0);
        val &= ~((0x3f << BP_FRAC0_IO0FRAC) | (0x3f << BP_FRAC0_IO1FRAC));
        val |= (30 << BP_FRAC0_IO0FRAC) | (30 << BP_FRAC0_IO1FRAC);
        writel_relaxed(val, FRAC0);

is related to this "lowest bit is wrong"-problem and is the result from
a wrong and/or incomplete analysis. It would be nice if someone from NXP
could comment as this code was introduced (for ref_io0 only) in

	7d81397cd93d ("clk: mxs: add clock support for imx28")

by Shawn when he was still employee at Freescale.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
