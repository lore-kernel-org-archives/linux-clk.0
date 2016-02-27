Return-Path: <sboyd@codeaurora.org>
Date: Fri, 26 Feb 2016 16:10:42 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: check the actual phase if get_phase is provided
Message-ID: <20160227001042.GC28849@codeaurora.org>
References: <1455759499-9622-1-git-send-email-shawn.lin@rock-chips.com>
 <20160225231458.GH28849@codeaurora.org>
 <56CFA8B4.7070600@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56CFA8B4.7070600@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/26, Shawn Lin wrote:
> On 2016/2/26 7:14, Stephen Boyd wrote:
> >On 02/18, Shawn Lin wrote:
> >>set_phase does sanity checking of degree and ask sub-driver
> 
> [...]
> 
> >>already there.
> >>
> >>Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> >>
> >>---
> >
> >Knee jerk reaction is why does the provider code set a phase that
> >isn't requested? Do we need some sort of clk_round_phase() API
> >that parallels clk_round_rate() so that drivers know what phase
> >they're going to get? Or do drivers not care what phase they get
> >when they call clk_set_phase()?
> 
> Hi Stephen,
> 
> drivers should care what phase they get when calling clk_set_phase(i.e
> the drivers setting phase to do tuning work should know what the actual
> degrees is, which is important for them to decide the sample window
> algorithm).
> 
> By looking into the two drivers who use set_phase/get_phase pair
> currently, they actually both don'e care what the actual degrees when
> they call clk_set_phase. I think that is because the drivers are used
> for specific platform which support 0~360 implicitly. But the situation
> is NOT always right for cross-platform drivers. So add some sort of
> round_phase API is probably sane ?
> 

Do you have such a platform or driver though? I'd rather not do
anything unless we actually need to.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
