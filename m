Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Andi Shyti <andi@etezian.org>, Michael Turquette <mturquette@baylibre.com>
Cc: andi.shyti@gmail.com, Jeffy Chen <jeffy.chen@rock-chips.com>, Xing Zheng <zhengxing@rock-chips.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: clk-rk3*: set CLK_IS_CRITICAL flag to critical clocks
Date: Tue, 28 Jun 2016 18:32:30 +0200
Message-ID: <2136865.gUkObTo8M5@phil>
In-Reply-To: <20160628160922.GN424@jack.zhora.eu>
References: <1467125137-25999-1-git-send-email-andi@etezian.org> <29356205.Gk5k6xKH6K@phil> <20160628160922.GN424@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Andi,

Am Mittwoch, 29. Juni 2016, 01:09:22 schrieb Andi Shyti:
> > >  			RK2928_CLKSEL_CON(0), 14, 2, MFLAGS, 8, 5, DFLAGS),
> > > 
> > > -	GATE(ACLK_CPU, "aclk_cpu", "aclk_cpu_src", CLK_IGNORE_UNUSED,
> > > +	GATE(ACLK_CPU, "aclk_cpu", "aclk_cpu_src",
> > > +			CLK_IS_CRITICAL | CLK_IGNORE_UNUSED,
> > 
> > - you'll never need both critical and ignore_unused
> 
> Indeed I was unsure whether I should remove the
> CLK_IGNORE_UNUSED, but then I decided to leave it because that's
> basically what the driver is currently doing. Thanks!
> 
> > Happens in some more cases below, but otherwise looks ok ... as written
> > in the cover-letter I'm just still trying to make up my mind if it's
> > worth waiting for the handoff mechanism.
> 
> You mean something similar (*)?

I actually mean 
https://lkml.org/lkml/2016/2/11/694

which received additional comments somewhere and Mike said he wanted to 
repost.


Heiko
