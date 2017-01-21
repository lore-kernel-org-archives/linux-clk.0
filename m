Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
Date: Sat, 21 Jan 2017 10:16:18 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Guodong Xu <guodong.xu@linaro.org>,
	John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] clk: hisilicon: fix lock assignment
Message-ID: <20170121021617.GA30253@leoy-linaro>
References: <1484727218-3499-1-git-send-email-leo.yan@linaro.org>
 <20170120225827.GB8009@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170120225827.GB8009@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 20, 2017 at 02:58:27PM -0800, Stephen Boyd wrote:
> On 01/18, Leo Yan wrote:
> > In clock driver initialize phase the spinlock is missed to assignment
> > to struct clkgate_separated, finally there have no locking to protect
> > exclusive accessing for clock registers.
> > 
> > This bug introduces the console has no output after enable coresight
> > driver on 96borads Hikey; this is because console using UART3, which
> 
> s/borads/boards/
> 
> > has shared the same register with coresight clock enabling bit. After
> > applied this patch it can assign lock properly to protect exclusive
> > accessing, and console can work well after enabled coresight modules.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Is there a Fixes: tag needed?

Thanks for reviewing, will send new patch for upper comments.

> Is coresight support merged into Linus' tree? I want to know if
> this needs to be applied for v4.10 or can wait until v4.11.

No, Coresight patch has not been merged. Should meantion one thing is:
this issue impacts all gate clocks if they share same register, there
have many such kind clocks for Hi6220. So it's not only for coresight
and uart clocks.

Thanks,
Leo Yan
