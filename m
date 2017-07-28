Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Jul 2017 09:40:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org
Subject: Re: [PATCH v2 4/5] clk: qcom: gcc-msm8996: Mark
 gcc_mmss_noc_cfg_ahb_clk as a critical clock
Message-ID: <20170728164058.GC2146@codeaurora.org>
References: <1500526099-9935-1-git-send-email-rnayak@codeaurora.org>
 <1500526099-9935-5-git-send-email-rnayak@codeaurora.org>
 <20170727225130.GQ2146@codeaurora.org>
 <319a0d15-354b-946b-da27-41d56fa0bb21@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <319a0d15-354b-946b-da27-41d56fa0bb21@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/28, Rajendra Nayak wrote:
> 
> On 07/28/2017 04:21 AM, Stephen Boyd wrote:
> > On 07/20, Rajendra Nayak wrote:
> >> we have gcc_mmss_noc_cfg_ahb_clk marked with a CLK_IGNORE_UNUSED. While
> >> this can prevent it from being disabled while its unused, it does not
> >> prevent it from being disabled when a child derived from the clock calls
> >> an explicit enable/disable.
> > 
> > Do you mean the config_noc_clk_src is being disabled? Who is
> 
> I think the issue I saw was after I switched the parent from
> config_noc_clk_src to the RPM controlled cnoc_clk. That had to
> be kept voted, else some other ahb clock derived from it being
> disabled was causing the vote on cnoc_clk to be dropped.

Hmm ok. Maybe we have some sort of bus driver vote from the
multimedia clk driver in downstream code? Let me check.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
