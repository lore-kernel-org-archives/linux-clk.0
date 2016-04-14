Return-Path: <sboyd@codeaurora.org>
Date: Wed, 13 Apr 2016 17:37:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>
Subject: Re: [PATCH] clk: disable unused clk if enable_count == 0
Message-ID: <20160414003759.GI14441@codeaurora.org>
References: <1460020558-5152-1-git-send-email-jun.nie@linaro.org>
 <5706F7F7.3030205@codeaurora.org>
 <CABymUCMLZ+UcH-Vo1i_Zj+N-r-uVeYPvnBLkJzyp1oZRRUVwjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CABymUCMLZ+UcH-Vo1i_Zj+N-r-uVeYPvnBLkJzyp1oZRRUVwjQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/08, Jun Nie wrote:
> 2016-04-08 8:14 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:
> > On 04/07/2016 02:15 AM, Jun Nie wrote:
> >> If .is_enabled callback is not implemented, clk_core_is_enabled
> >> will take software enable_count as enable status. If enable_count
> >> is zero, .disable will not be called as software assume clock
> >> is not enabled though clock may be booted with  free running state.
> >> Disable the clock in this situation.
> >>
> >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >> ---
> >
> > Why not implement the is_enabled callback then?
> 
> The is_enabled callback is not mandatory according to sanity check
> code, so there is risk that some clock is not gated even we have
> called clk_disable_unused_subtree. If is_enabled callback is mandatory
> when CLK_IGNORE_UNUSED is not set, Adding a sanity check will fill
> this gap.

The is_enabled op is technically mandatory if enable/disable ops
are implemented. We could add a sanity check, but I would guess
it will warn quite a bit because not everyone is following the
documentation.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
