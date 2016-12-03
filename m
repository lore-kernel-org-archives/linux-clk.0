Return-Path: <Xiaolong.Zhang@spreadtrum.com>
Date: Sat, 3 Dec 2016 13:46:00 +0800
From: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <orson.zhai@spreadtrum.com>,
        <ben.li@spreadtrum.com>, <baolin.wang@spreadtrum.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: Register clkdev after setup of fixed-rate and
 fixed-factor clocks
Message-ID: <20161203054600.GA8463@spreadtrum.com>
References: <1476184424-8528-1-git-send-email-orson.zhai@spreadtrum.com>
 <20161020230103.GD26139@codeaurora.org>
 <20161022081448.GB32560@spreadtrum.com>
 <20161025204008.GE26139@codeaurora.org>
 <20161112051907.GA8514@spreadtrum.com>
 <20161124003833.GF6095@codeaurora.org>
 <20161124073948.GA12946@spreadtrum.com>
 <20161129211054.GD6095@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <20161129211054.GD6095@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 二, 11月 29, 2016 at 01:10:54下午 -0800, Stephen Boyd wrote:
> On 11/24, Xiaolong Zhang wrote:
> > On 三, 11月 23, 2016 at 04:38:33下午 -0800, Stephen Boyd wrote:
> > 
> > > We're really off track now though. Can you please point to some
> > > code that needs this change? If we're using DT then we should be
> > > able to use the of_clk_*() path to find the clk.
> > >
> > 
> > Actually, the requirement is raised by our GPU driver. In the
> > early stage of the GPU DT driver, the GPU driver use the
> > clk_get(NULL, con_id) to get the clock instance for compatible
> > with non-DT GPU driver. The new driver have used the of_clk_get()
> > instead of the clk_get. And we reserved the modification in clock.
> > 
> 
> Ok the non-DT version of the GPU driver should be modified to
> call clk_get() and pass in the device. The con_id argument there
> should be something specific to the GPU device, and not a global
> name of a clock on the system. When the clkdev lookup is
> populated on the non-DT board make sure to set the dev_id string
> to match the device name of the GPU device.
>
Ok, Thanks sBoyd!
>
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
