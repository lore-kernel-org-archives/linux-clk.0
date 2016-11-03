Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Nov 2016 12:48:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v3 06/11] clk: qcom: Fix .set_rate to handle alpha PLLs
 w/wo dynamic update
Message-ID: <20161103194838.GY16026@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
 <1475138152-859-7-git-send-email-rnayak@codeaurora.org>
 <20161102215445.GR16026@codeaurora.org>
 <581AF517.2040907@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <581AF517.2040907@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/03, Rajendra Nayak wrote:
> 
> 
> On 11/03/2016 03:24 AM, Stephen Boyd wrote:
> > On 09/29, Rajendra Nayak wrote:
> >> Alpha PLLs which do not support dynamic update feature
> >> need to be explicitly disabled before a rate change.
> >> The ones which do support dynamic update do so within a
> >> single vco range, so add a min/max freq check for such
> >> PLLs so they fall in the vco range.
> >>
> >> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > 
> > Is Taniya the author?
> 
> ah, yes, I seem to have messed up the authorship in v3, will fix.
> 
> > 
> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> ---
> >>  drivers/clk/qcom/clk-alpha-pll.c | 49 +++++++++++++++++++++++++++++++++-------
> >>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
> >>  2 files changed, 44 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> >> index 89c7fdb..6f90a86 100644
> >> --- a/drivers/clk/qcom/clk-alpha-pll.c
> >> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> >> @@ -382,16 +382,41 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> >>  static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> >>  				  unsigned long prate)
> >>  {
> >> +	bool enabled;
> >>  	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> >>  	const struct pll_vco *vco;
> >>  	u32 l, off = pll->offset;
> >>  	u64 a;
> >>  
> >>  	rate = alpha_pll_round_rate(rate, prate, &l, &a);
> >> -	vco = alpha_pll_find_vco(pll, rate);
> >> -	if (!vco) {
> >> -		pr_err("alpha pll not in a valid vco range\n");
> >> -		return -EINVAL;
> >> +	enabled = clk_hw_is_enabled(hw);
> >> +
> >> +	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
> >> +		/*
> >> +		 * PLLs which support dynamic updates support one single
> >> +		 * vco range, between min_rate and max_rate supported
> >> +		 */
> >> +		if (rate < pll->min_rate || rate > pll->max_rate) {
> >> +			pr_err("alpha pll rate outside supported min/max range\n");
> >> +			return -EINVAL;
> >> +		}
> >> +	} else {
> >> +		/*
> >> +		 * All alpha PLLs which do not support dynamic update,
> >> +		 * should be disabled before a vco update.
> >> +		 */
> >> +		if (enabled)
> >> +			hw->init->ops->disable(hw);
> > 
> > Please just call the function directly instead of going through
> > the init structure.
> 
> But we now have 2 different versions of disable based on clk_ops,
> clk_alpha_pll_disable and clk_alpha_pll_hwfsm_disable.
> 

So have two set_rate ops that call a common function that takes a
function pointer pair of enable/disable ops to call? Or have a
flag to know which one to call? Either way, don't use the init
structure after registration time please.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
