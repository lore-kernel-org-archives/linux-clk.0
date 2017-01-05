Return-Path: <sboyd@codeaurora.org>
Date: Thu, 5 Jan 2017 14:39:57 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, mturquette@baylibre.com,
	david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk: qcom: Fix a possible NULL pointer dereferencing
Message-ID: <20170105223957.GK17126@codeaurora.org>
References: <1483606525-27709-1-git-send-email-vivek.gautam@codeaurora.org>
 <20170105142002.GB5710@hector.attlocal.net>
 <9b590296-6e3a-9079-08e5-48b4af8f8f22@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9b590296-6e3a-9079-08e5-48b4af8f8f22@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/05, Vivek Gautam wrote:
> 
> On 01/05/2017 07:50 PM, Andy Gross wrote:
> >On Thu, Jan 05, 2017 at 02:25:25PM +0530, Vivek Gautam wrote:
> >>Assign num_parents as 0 while registering fixed rate clocks
> >>in _qcom_cc_register_board_clk(), to make sure the clk framework
> >>doesn't dereference parent.
> >>
> >>Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
> >>
> >>Cc: Georgi Djakov<georgi.djakov@linaro.org>
> >>Signed-off-by: Vivek Gautam<vivek.gautam@codeaurora.org>
> >>---
> >>
> >>Based on 'clk-next'. Build tested.
> >>
> >>  drivers/clk/qcom/common.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >>diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> >>index cfab7b400381..df004ead1bef 100644
> >>--- a/drivers/clk/qcom/common.c
> >>+++ b/drivers/clk/qcom/common.c
> >>@@ -157,6 +157,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> >>  		init_data.name = path;
> >>  		init_data.ops = &clk_fixed_rate_ops;
> >>+		init_data.num_parents = 0;
> >It seems like there was a initializer in the declaration but it was { } instead
> >of { 0 }.
> >
> >Was the original intent to make this structure initialized to 0?  If so, perhaps
> >it should be fixed above in the initializer.
> 
> yes, i think we intend to initialize the clock init data to 0, and thus
> we should do that during declaration.
> Will modify and re-spin the patch.
> 

What's the error exactly? Do you have some call stack/crash that
could be put in the commit text?

It was my understanding that GCC allows braces without anything
inside to initialize structures to 0, so I'm confused what's
wrong here. If this is actually a problem then we have other
places to fix this.

 $ git grep "clk_init_data.*{ *}"
 drivers/clk/bcm/clk-bcm53573-ilp.c:     struct clk_init_data init = { };
 drivers/clk/clk-gpio.c: struct clk_init_data init = {};
 drivers/clk/clk-qoriq.c:        struct clk_init_data init = {};
 drivers/clk/clk-rk808.c:        struct clk_init_data init = {};
 drivers/clk/mediatek/clk-apmixed.c:     struct clk_init_data init = {};
 drivers/clk/mediatek/clk-gate.c:        struct clk_init_data init = {};
 drivers/clk/mediatek/clk-pll.c: struct clk_init_data init = {};
 drivers/clk/qcom/common.c:      struct clk_init_data init_data = { };
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c:        struct clk_init_data bytediv_init = { };

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
