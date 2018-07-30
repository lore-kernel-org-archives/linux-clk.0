Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Mon, 30 Jul 2018 12:50:52 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add camera clock controller driver for
 SDM845
In-Reply-To: <153262575082.48062.16264904338225269915@swboyd.mtv.corp.google.com>
References: <1532345193-18108-1-git-send-email-anischal@codeaurora.org>
 <1532345193-18108-3-git-send-email-anischal@codeaurora.org>
 <153262575082.48062.16264904338225269915@swboyd.mtv.corp.google.com>
Message-ID: <614e462b0294a1ece78b654ad3e4553f@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-26 22:52, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-07-23 04:26:33)
>> diff --git a/drivers/clk/qcom/camcc-sdm845.c 
>> b/drivers/clk/qcom/camcc-sdm845.c
>> new file mode 100644
>> index 0000000..61e5ec2
>> --- /dev/null
>> +++ b/drivers/clk/qcom/camcc-sdm845.c
>> @@ -0,0 +1,1736 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
> 
> Is this include used?

This is not required. I will remove this in next patch series.

> 
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
>> +
>> +#include "common.h"
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "gdsc.h"
>> +
>> +enum {
>> +       P_BI_TCXO,
>> +       P_CAM_CC_PLL0_OUT_EVEN,
>> +       P_CAM_CC_PLL1_OUT_EVEN,
>> +       P_CAM_CC_PLL2_OUT_EVEN,
>> +       P_CAM_CC_PLL3_OUT_EVEN,
>> +       P_CORE_BI_PLL_TEST_SE,
>> +};
>> +
>> +static const struct parent_map cam_cc_parent_map_0[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_CAM_CC_PLL2_OUT_EVEN, 1 },
>> +       { P_CAM_CC_PLL1_OUT_EVEN, 2 },
>> +       { P_CAM_CC_PLL3_OUT_EVEN, 5 },
>> +       { P_CAM_CC_PLL0_OUT_EVEN, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const char * const cam_cc_parent_names_0[] = {
>> +       "bi_tcxo",
>> +       "cam_cc_pll2_out_even",
>> +       "cam_cc_pll1_out_even",
>> +       "cam_cc_pll3_out_even",
>> +       "cam_cc_pll0_out_even",
>> +       "core_bi_pll_test_se",
>> +};
>> +
>> +static struct clk_alpha_pll cam_cc_pll0 = {
>> +       .offset = 0x0,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "cam_cc_pll0",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct clk_div_table post_div_table_fabia_even[] = {
>> +       { 0x0, 1 },
>> +       { 0x1, 2 },
>> +       { }
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
>> +       .offset = 0x0,
>> +       .post_div_shift = 8,
>> +       .post_div_table = post_div_table_fabia_even,
>> +       .num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
>> +       .width = 4,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_pll0_out_even",
>> +               .parent_names = (const char *[]){ "cam_cc_pll0" },
>> +               .num_parents = 1,
>> +               .ops = &clk_alpha_pll_postdiv_fabia_ops,
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll cam_cc_pll1 = {
>> +       .offset = 0x1000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "cam_cc_pll1",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
>> +       .offset = 0x1000,
>> +       .post_div_shift = 8,
>> +       .post_div_table = post_div_table_fabia_even,
>> +       .num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
>> +       .width = 4,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_pll1_out_even",
>> +               .parent_names = (const char *[]){ "cam_cc_pll1" },
>> +               .num_parents = 1,
>> +               .ops = &clk_alpha_pll_postdiv_fabia_ops,
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll cam_cc_pll2 = {
>> +       .offset = 0x2000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "cam_cc_pll2",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv cam_cc_pll2_out_even = {
>> +       .offset = 0x2000,
>> +       .post_div_shift = 8,
>> +       .post_div_table = post_div_table_fabia_even,
>> +       .num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
>> +       .width = 4,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_pll2_out_even",
>> +               .parent_names = (const char *[]){ "cam_cc_pll2" },
>> +               .num_parents = 1,
>> +               .ops = &clk_alpha_pll_postdiv_fabia_ops,
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll cam_cc_pll3 = {
>> +       .offset = 0x3000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "cam_cc_pll3",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
>> +       .offset = 0x3000,
>> +       .post_div_shift = 8,
>> +       .post_div_table = post_div_table_fabia_even,
>> +       .num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
>> +       .width = 4,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_pll3_out_even",
>> +               .parent_names = (const char *[]){ "cam_cc_pll3" },
>> +               .num_parents = 1,
>> +               .ops = &clk_alpha_pll_postdiv_fabia_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
>> +       F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
>> +       F(404000000, P_CAM_CC_PLL1_OUT_EVEN, 2, 0, 0),
>> +       F(480000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
>> +       F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 cam_cc_bps_clk_src = {
>> +       .cmd_rcgr = 0x600c,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = cam_cc_parent_map_0,
>> +       .freq_tbl = ftbl_cam_cc_bps_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_bps_clk_src",
>> +               .parent_names = cam_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_shared_ops,
> 
> Why are shared ops used in this driver?
> 

As per HW design, most of the CAMCC RCGs needs to move to
XO during clock disable so because of this we have used the
shared ops.

>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_cam_cc_cci_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
>> +       F(50000000, P_CAM_CC_PLL0_OUT_EVEN, 12, 0, 0),
>> +       F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
>> +       { }
>> +};
>> +
> [...]
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_mclk0_clk_src",
>> +               .parent_names = cam_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 cam_cc_mclk1_clk_src = {
>> +       .cmd_rcgr = 0x4024,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = cam_cc_parent_map_0,
>> +       .freq_tbl = ftbl_cam_cc_mclk0_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_mclk1_clk_src",
>> +               .parent_names = cam_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 cam_cc_mclk2_clk_src = {
>> +       .cmd_rcgr = 0x4044,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = cam_cc_parent_map_0,
>> +       .freq_tbl = ftbl_cam_cc_mclk0_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_mclk2_clk_src",
>> +               .parent_names = cam_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 cam_cc_mclk3_clk_src = {
>> +       .cmd_rcgr = 0x4064,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = cam_cc_parent_map_0,
>> +       .freq_tbl = ftbl_cam_cc_mclk0_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_mclk3_clk_src",
>> +               .parent_names = cam_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(60000000, P_CAM_CC_PLL0_OUT_EVEN, 10, 0, 0),
>> +       F(66666667, P_CAM_CC_PLL0_OUT_EVEN, 9, 0, 0),
>> +       F(73846154, P_CAM_CC_PLL2_OUT_EVEN, 6.5, 0, 0),
>> +       F(80000000, P_CAM_CC_PLL2_OUT_EVEN, 6, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
>> +       .cmd_rcgr = 0x6054,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = cam_cc_parent_map_0,
>> +       .freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "cam_cc_slow_ahb_clk_src",
>> +               .parent_names = cam_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .flags = CLK_SET_RATE_PARENT,
> 
> Is CLK_SET_RATE_PARENT intentionally set on these RCGs so that they can
> reconfigure the PLL frequency? Wouldn't that be a fixed rate PLL
> frequency?
> 

PLL2_OUT_EVEN requires to be reconfigure to 480MHz so clock sources 
which
are using PLL2 in their frequency table requires 'CLK_SET_RATE_PARENT'
flag to be set.

>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
> [...]
>> +
>> +static int cam_cc_sdm845_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       struct alpha_pll_config cam_cc_pll_config = { };
>> +
>> +       regmap = qcom_cc_map(pdev, &cam_cc_sdm845_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       cam_cc_pll_config.l = 0x1f,
>> +       cam_cc_pll_config.alpha = 0x4000,
> 
> Replace these commas with semicolons.
> 

Ok sure. I will do as suggested in the next patch series.

>> +       clk_fabia_pll_configure(&cam_cc_pll0, regmap, 
>> &cam_cc_pll_config);
>> +
>> +       cam_cc_pll_config.l = 0x2a,
>> +       cam_cc_pll_config.alpha = 0x1556,
>> +       clk_fabia_pll_configure(&cam_cc_pll1, regmap, 
>> &cam_cc_pll_config);
> 
> All over this function.
> 
> Can you also add comments in the commit text and code describing why
> oddities like CLK_SET_RATE_PARENT on RCGs and shared rcg ops is used?

ok sure will add the same in the next patch series.

> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
