Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Nov 2016 16:38:33 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
Cc: mturquette@baylibre.com, orson.zhai@spreadtrum.com,
	baolin.wang@spreadtrum.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, ben.li@spreadtrum.com
Subject: Re: [PATCH] clk: Register clkdev after setup of fixed-rate and
 fixed-factor clocks
Message-ID: <20161124003833.GF6095@codeaurora.org>
References: <1476184424-8528-1-git-send-email-orson.zhai@spreadtrum.com>
 <20161020230103.GD26139@codeaurora.org>
 <20161022081448.GB32560@spreadtrum.com>
 <20161025204008.GE26139@codeaurora.org>
 <20161112051907.GA8514@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20161112051907.GA8514@spreadtrum.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/12, Xiaolong Zhang wrote:
> On 二, 10月 25, 2016 at 08:40:08下午 +0000, Stephen Boyd wrote:
> > On 10/22, Xiaolong Zhang wrote:
> > > On 四, 10月 20, 2016 at 04:01:03下午 -0700, Stephen Boyd wrote:
> > > > On 10/11, Orson Zhai wrote:
> > > > > From: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
> > > > > 
> > > > > When common kernel setups fixed clock, of_clk_provider will be registerred.
> > > > > But there is no clkdev being registerred at the same time. This will make
> > > > > it difficult to get the clock by using clk_get(NULL, con_id).
> > > > > 
> > > > > Add clkdev register for fixed-rate and fixed-factor clock and ignore
> > > > > the error if any.
> > > > > 
> > > > > Signed-off-by: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
> > > > > Signed-off-by: Orson Zhai <orson.zhai@spreadtrum.com>
> > > > > ---
> > > > 
> > > > Why are we using clkdev lookups for clks populated from DT?
> > > > Shouldn't we be able to point to them from the consumers that
> > > > would also be in DT? I'm a little lost.
> > > > 
> > > The clk_get interface allows the first argument as NULL. We just assure
> > > consumers can get the clock from DT or by clock name.
> > 
> > Ok. The first argument to clk_get() really shouldn't be NULL. It
> > should be the device pointer for the device that is associated
> > with the clk you want to get. The clock name (second argument to
> > clk_get()) should be device specific and not some globally unique
> > identifier. It seems that you're using the clk_get() API
> > incorrectly.
> >
> Sorry for late reply.
> There are two paths in clk_get:
> a) dev is not NULL, the calling procedure is as following
> clk_get(dev, con_id)
> --->of_clk_get_by_name(dev->of_node, con_id)
> 
> b) dev is NULL, the calling procedure is as following
> clk_dev(NULL, con_id)
> --->clk_get_sys(NULL, con_id)
>     --->clk_find(NULL, con_id)
> 
> I just cann't understand why you say the first argument shouldn't
> be NULL. Is there other consideration in CCF?
> 

Passing NULL as the first argument is allowed, but that's mostly
an artifact of the clk_get() API. If you don't have a device, you
should be calling clk_get_sys() and then a clkdev lookup should
have been added with some appropriate dev_id string that is used
in the clk_get_sys() call. At least this is my understanding of
the clkdev APIs, but Russell is the authority here.

We're really off track now though. Can you please point to some
code that needs this change? If we're using DT then we should be
able to use the of_clk_*() path to find the clk.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
