Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add display clock controller driver for
 SDM845
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1529763567-13131-1-git-send-email-tdas@codeaurora.org>
 <1529763567-13131-4-git-send-email-tdas@codeaurora.org>
 <153109408562.143105.15954380130353645468@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <10f87216-caa2-d523-e134-6cf3acd268a7@codeaurora.org>
Date: Mon, 9 Jul 2018 09:08:03 +0530
MIME-Version: 1.0
In-Reply-To: <153109408562.143105.15954380130353645468@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

Thanks for your review comments.

On 7/9/2018 5:24 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-06-23 07:19:27)
>> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
>> new file mode 100644
>> index 0000000..af437e0
>> --- /dev/null
>> +++ b/drivers/clk/qcom/dispcc-sdm845.c
>> @@ -0,0 +1,674 @@
>> +// SPDX-License-Identifier: GPL-2.0
> [...]
>> +static struct clk_alpha_pll disp_cc_pll0 = {
>> +       .offset = 0x0,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "disp_cc_pll0",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>> +       .cmd_rcgr = 0x20d0,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_byte0_clk_src",
>> +               .parent_names = disp_cc_parent_names_0,
>> +               .num_parents = 4,
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> 
> Why is there the no cache flag? Last time I asked I don't think I got
> any answer, and there isn't a comment here so please at least add a
> comment to the code so we don't forget.
>

I think you missed my comment from the earlier email. I would add the 
comment and submit again.

 > Why is the nocache flag needed? Applies to all clks in this file.
 >

This flag is required for all RCGs whose PLLs are controlled outside the 
clock controller. The display code would require the recalculated rate 
always.

>> +               .ops = &clk_byte2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
>> +       .cmd_rcgr = 0x20ec,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_byte1_clk_src",
>> +               .parent_names = disp_cc_parent_names_0,
>> +               .num_parents = 4,
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
>> +               .ops = &clk_byte2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_disp_cc_mdss_esc0_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>> +       .cmd_rcgr = 0x2108,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_esc0_clk_src",
>> +               .parent_names = disp_cc_parent_names_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>> +       .cmd_rcgr = 0x2120,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_0,
>> +       .freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_esc1_clk_src",
>> +               .parent_names = disp_cc_parent_names_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
> [...]
>> +
>> +MODULE_LICENSE("GPL v2");
> 
> MODULE_DESCRIPTION?
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
