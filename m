Return-Path: <Xiaolong.Zhang@spreadtrum.com>
Date: Sat, 22 Oct 2016 16:14:49 +0800
From: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <orson.zhai@spreadtrum.com>,
        <baolin.wang@spreadtrum.com>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ben.li@spreadturm.com>
Subject: Re: [PATCH] clk: Register clkdev after setup of fixed-rate and
 fixed-factor clocks
Message-ID: <20161022081448.GB32560@spreadtrum.com>
References: <1476184424-8528-1-git-send-email-orson.zhai@spreadtrum.com>
 <20161020230103.GD26139@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <20161020230103.GD26139@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 四, 10月 20, 2016 at 04:01:03下午 -0700, Stephen Boyd wrote:
> On 10/11, Orson Zhai wrote:
> > From: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
> > 
> > When common kernel setups fixed clock, of_clk_provider will be registerred.
> > But there is no clkdev being registerred at the same time. This will make
> > it difficult to get the clock by using clk_get(NULL, con_id).
> > 
> > Add clkdev register for fixed-rate and fixed-factor clock and ignore
> > the error if any.
> > 
> > Signed-off-by: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
> > Signed-off-by: Orson Zhai <orson.zhai@spreadtrum.com>
> > ---
> 
> Why are we using clkdev lookups for clks populated from DT?
> Shouldn't we be able to point to them from the consumers that
> would also be in DT? I'm a little lost.
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
The clk_get interface allows the first argument as NULL. We just assure
consumers can get the clock from DT or by clock name.
