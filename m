Return-Path: <anischal@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Thu, 12 Jul 2018 18:08:16 +0530
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Andy Gross
 <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add graphics clock controller driver for
 SDM845
In-Reply-To: <153111645061.143105.8885901620675705971@swboyd.mtv.corp.google.com>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-5-git-send-email-anischal@codeaurora.org>
 <153111645061.143105.8885901620675705971@swboyd.mtv.corp.google.com>
Message-ID: <2b041e1bf8ef290889881f77712a248f@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-09 11:37, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-06-06 04:41:48)
>> diff --git a/drivers/clk/qcom/gpucc-sdm845.c 
>> b/drivers/clk/qcom/gpucc-sdm845.c
>> new file mode 100644
>> index 0000000..81f8926
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gpucc-sdm845.c
>> @@ -0,0 +1,441 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,gpucc-sdm845.h>
>> +
>> +#include "common.h"
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "gdsc.h"
>> +
>> +#define CX_GMU_CBCR_SLEEP_MASK         0xf
>> +#define CX_GMU_CBCR_SLEEP_SHIFT                4
>> +#define CX_GMU_CBCR_WAKE_MASK          0xf
>> +#define CX_GMU_CBCR_WAKE_SHIFT         8
>> +#define CLK_DIS_WAIT_SHIFT             12
>> +#define CLK_DIS_WAIT_MASK              (0xf << CLK_DIS_WAIT_SHIFT)
>> +
>> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> 
> This should be removed and series can depend on Taniya's patch.
> 

Yes sure. I will do the required change and will submit the next
patch series.

>> +
>> +enum {
>> +       P_BI_TCXO,
>> +       P_CORE_BI_PLL_TEST_SE,
>> +       P_GPLL0_OUT_MAIN,
>> +       P_GPLL0_OUT_MAIN_DIV,
> [...]
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_pll0",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct clk_div_table post_div_table_fabia_even[] = {
>> +       { 0x0, 1 },
>> +       {},
> 
> Drop the trailing comma, it's a sentinel presumably.
> 

Will fix this in the next patch series.

>> +};
>> +
>> +static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
>> +       .offset = 0x0,
>> +       .post_div_shift = 8,
>> +       .post_div_table = post_div_table_fabia_even,
>> +       .num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
>> +       .width = 4,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gpu_cc_pll0_out_even",
>> +               .parent_names = (const char *[]){ "gpu_cc_pll0" },
>> +               .num_parents = 1,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_alpha_pll_postdiv_fabia_ops,
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll gpu_cc_pll1 = {
>> +       .offset = 0x100,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_pll1",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
>> +       F(500000000, P_GPU_CC_PLL1_OUT_MAIN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gpu_cc_gmu_clk_src = {
>> +       .cmd_rcgr = 0x1120,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gpu_cc_parent_map_0,
>> +       .freq_tbl = ftbl_gpu_cc_gmu_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gpu_cc_gmu_clk_src",
>> +               .parent_names = gpu_cc_parent_names_0,
>> +               .num_parents = 6,
>> +               .ops = &clk_rcg2_shared_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
>> +       F(180000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
>> +       F(257000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
>> +       F(342000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
>> +       F(414000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
>> +       F(520000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
>> +       F(596000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
>> +       F(675000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
>> +       F(710000000, P_GPU_CC_PLL0_OUT_EVEN, 2, 0, 0),
> 
> Do we really need to encode anything here in this table? Why can't we
> have clk_ops that hardcode this clk to be a div-2 that passes the
> frequency up to the parent source? Then this frequency table doesn't
> need to be here at all, and can live in DT as an OPP table used by the
> GPU driver.
> 

Thanks for the suggestion.
I will address the same in the next patch series where
"clk_rcg2_gfx3d_determine_rate" op will always return the best parent as
‘GPU_CC_PLL0_OUT_EVEN’ and best_parent rate equal to twice of the 
requested rate.
This will eliminate the need of frequency table.

>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
>> +       .cmd_rcgr = 0x101c,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gpu_cc_parent_map_1,
>> +       .freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gpu_cc_gx_gfx3d_clk_src",
>> +               .parent_names = gpu_cc_parent_names_1,
>> +               .num_parents = 7,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_rcg2_gfx3d_ops,
> [...]
>> +static struct clk_branch gpu_cc_cx_gmu_clk = {
>> +       .halt_reg = 0x1098,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x1098,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_cx_gmu_clk",
>> +                       .parent_names = (const char *[]){
>> +                               "gpu_cc_gmu_clk_src",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
>> +       .halt_reg = 0x108c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x108c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_cx_snoc_dvm_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gpu_cc_cxo_clk = {
> 
> This isn't always on and marked critical?

No, this clock is not marked critical as GCC driver doesn't
control this clock.

> 
>> +       .halt_reg = 0x109c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x109c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_cxo_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
> [...]
>> +
>> +static struct gdsc gpu_cx_gdsc = {
>> +       .gdscr = 0x106c,
>> +       .gds_hw_ctrl = 0x1540,
>> +       .pd = {
>> +               .name = "gpu_cx_gdsc",
>> +       },
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = VOTABLE,
>> +};
>> +
>> +static struct gdsc gpu_gx_gdsc = {
>> +       .gdscr = 0x100c,
>> +       .clamp_io_ctrl = 0x1508,
>> +       .pd = {
>> +               .name = "gpu_gx_gdsc",
>> +       },
>> +       .clk_hws = {
>> +               &gpu_cc_gx_gfx3d_clk_src.clkr.hw,
> 
> Hmm alright. So basically the core GPU power domain needs the wrapper
> domain (CX) to be powered on and clocking for GX to work? Let's talk
> about it in the other patch so I can understand more.
> 

Yes, to turn on the GPU GX GDSC it requires below to be in ON state 
first.
1. GPU_CX_GDSC
2. ROOT clock GFX3D clock source.

>> +       },
>> +       .clk_count = 1,
>> +       .pwrsts = PWRSTS_OFF_ON,
>> +       .flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
>> +};
>> +
> [...]
>> +
>> +static int gpu_cc_sdm845_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       unsigned int value, mask;
>> +
>> +       regmap = qcom_cc_map(pdev, &gpu_cc_sdm845_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       clk_fabia_pll_configure(&gpu_cc_pll0, regmap, 
>> &gpu_cc_pll0_config);
>> +       clk_fabia_pll_configure(&gpu_cc_pll1, regmap, 
>> &gpu_cc_pll1_config);
>> +
>> +       /* Configure gpu_cc_cx_gmu_clk with recommended wakeup/sleep 
>> settings */
>> +       mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
>> +       mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
>> +       value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << 
>> CX_GMU_CBCR_SLEEP_SHIFT;
>> +       regmap_update_bits(regmap, 0x1098, mask, value);
>> +
>> +       /* Configure clk_dis_wait for for gpu_cx_gdsc */
> 
> s/for //
> 

I will address this in the next patch series.

>> +       regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
>> +                                               (8 << 
>> CLK_DIS_WAIT_SHIFT));
> 
> Remove extra parenthesis.

Yes sure, I will fix this in the next patch series.
> 
>> +
>> +       return qcom_cc_really_probe(pdev, &gpu_cc_sdm845_desc, 
>> regmap);
>> +}
>> +
> [...]
>> +
>> +MODULE_LICENSE("GPL v2");
> 
> MODULE_DESCRIPTION?

I will add the module description in the next patch series.
