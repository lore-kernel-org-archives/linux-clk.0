Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Douglas Anderson <dianders@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, jwerner@chromium.org, hl@rock-chips.com, dbasehore@chromium.org, zhengxing@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: rockchip: Set "ignore unused" for PMU M0 clocks on rk3399
Date: Wed, 15 Feb 2017 18:01:25 +0100
Message-ID: <1716357.fXUCSFMPB6@diego>
In-Reply-To: <CABxcv=kzW9SvrWYNasqCDkV7D6Y2zq+oRuqoPFdWuaWUhPehEA@mail.gmail.com>
References: <20170214210114.5846-1-dianders@chromium.org> <CABxcv=kzW9SvrWYNasqCDkV7D6Y2zq+oRuqoPFdWuaWUhPehEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 15. Februar 2017, 12:27:59 CET schrieb Javier Martinez Canillas:
> Hello Doug,
> 
> On Tue, Feb 14, 2017 at 6:01 PM, Douglas Anderson <dianders@chromium.org> 
wrote:
> > The PMU Cortex M0 on rk3399 is intended to be used for things like
> > DDRFreq transitions, suspend/resume, and other things that are the
> > purview of ARM Trusted Firmware and not the kernel.  As such, the
> > kernel shouldn't be messing with the clocks.  Add CLK_IGNORE_UNUSED to
> > these clocks.
> 
> Isn't CLK_IS_CRITICAL a more suitable flag for this case?

>From the patch description it looks like the clock is expected to be 
controlled from firmware in most cases as I guess the Cortex M0 will be used 
for that all the time now. And the clock is not expected to run all the time.

So I'd think clk_ignore_unused is the correct one. The whole clock-subtree for 
these clocks also does not get affected by other clocks, as it is 
independendly coming from PLLs.


Heiko
