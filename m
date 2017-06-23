Return-Path: <sboyd@codeaurora.org>
Date: Fri, 23 Jun 2017 08:47:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-clk@vger.kernel.org, Andy Gross <andy.gross@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: gcc-msm8996: Add missing lpass smmu clks
Message-ID: <20170623154736.GO4493@codeaurora.org>
References: <20170612094137.6821-1-srinivas.kandagatla@linaro.org>
 <20170620004709.GD20170@codeaurora.org>
 <9449e968-bddb-2b34-3ede-b786238b6421@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9449e968-bddb-2b34-3ede-b786238b6421@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/23, Srinivas Kandagatla wrote:
> 
> 
> On 20/06/17 01:47, Stephen Boyd wrote:
> >On 06/12, Srinivas Kandagatla wrote:
> >>This patch adds missing LPASS smmu clks which are required by the audio driver.
> >>
> >>Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>---
> >>  drivers/clk/qcom/gcc-msm8996.c               | 26 ++++++++++++++++++++++++++
> >>  include/dt-bindings/clock/qcom,gcc-msm8996.h |  2 ++
> >>  2 files changed, 28 insertions(+)
> >>
> >>diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> >>index 56e0a295c74e..6290ce551505 100644
> >>--- a/drivers/clk/qcom/gcc-msm8996.c
> >>+++ b/drivers/clk/qcom/gcc-msm8996.c
> >>@@ -2644,6 +2644,30 @@ static struct clk_fixed_factor ufs_rx_cfg_clk_src = {
> >>  	},
> >>  };
> >>+static struct clk_branch gcc_hlos1_vote_lpass_core_smmu_clk = {
> >>+	.halt_reg = 0x7d010,
> >
> >Don't we need .halt_check = BRANCH_HALT_VOTED for these?
> >
> I don't think we need it for these clks, Downstream driver has
> no_halt_check_on_disable = true for both these clks.
> 
> 

Right, no_halt_check_on_disable means we don't check the halt bit
when disabling the clk, but we _do_ check the halt bit when
enabling. In upstream clk driver that would be indicated with
BRANCH_HALT_VOTED, where we check the halt bit when enabling and
it's voted and do a small udelay() if we're disabling and it's
voted. I suppose that small udelay() could be removed because it
doesn't really matter that it turns off or not when we're
disabling a voted clk.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
