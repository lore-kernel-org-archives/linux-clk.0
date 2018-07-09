Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alberto Panizzo <alberto@amarulasolutions.com>
Cc: Anthony Brandon <anthony@amarulasolutions.com>, linux-rockchip@lists.infradead.org, mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: rockchip: rk3399: fix returning correct value on clk_i2sout get_rate [with GET_RATE_NOCACHE]
Date: Mon, 09 Jul 2018 19:37:21 +0200
Message-ID: <1620037.vMucPAgRgB@diego>
In-Reply-To: <20180709161620.GA12454@change>
References: <1530883132-17678-1-git-send-email-anthony@amarulasolutions.com> <4069085.blmd9nAIm0@phil> <20180709161620.GA12454@change>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 9. Juli 2018, 18:16:21 CEST schrieb Alberto Panizzo:
> Hi Heiko,
> 
> On Sun, Jul 08, 2018 at 11:32:19AM +0200, Heiko Stuebner wrote:
> > Hi,
> > 
> > Am Freitag, 6. Juli 2018, 15:18:52 CEST schrieb Anthony Brandon:
> > > From: Alberto Panizzo <alberto@amarulasolutions.com>
> > > 
> > > clk_i2sout can be used as codec mclk.
> > > On simple audio card clk_i2sout is just enabled/disabled while the rate
> > > is decided on parent clock by i2s driver.
> > > Without setting CLK_GET_RATE_NOCACHE flag, the get_rate function on
> > > clk_i2sout would return incorrect values after clk_i2sout's parents
> > > update.
> > 
> > Can you elaborate a bit more on the issue you see please?
> > Because as far as I remember the clock-framework should already
> > update child-clocks when the rate of their parent changed.
> > 
> > So even the cached rate should be correct after the parent changes,
> > so I don't really understand in what case you would get a wrong rate.
> 
> You are right, I'm sorry this patch were coming from days of long test and
> checks to understand why clk_get_rate were returning 0 while parents clocks
> were set.
> (And working with a codec which does not offer deterministic results)
> 
> Especially, after having found and fixed the bits misconfigurations, a
> clk_get_rate on clk_i2sout before the first clk_i2s0 set_rate is
> returning 0.
> 
> But clk_i2s0_mux results unparented before first clk_i2s0 set_rate and with
> or without NOCACHE, until a set_rate is called on clk_i2s0, a get_rate on
> clk_i2sout will return 0.
> 
> This does not prevent good behavior after first _hw_params()
> so please, drop this patch.

great to hear that :-)

> But patch 1/2 is necessary, please apply.

already done yesterday.


Heiko
