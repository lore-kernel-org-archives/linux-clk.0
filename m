Return-Path: <sboyd@codeaurora.org>
Subject: Re: [RFC 01/12] clk: qcom: support for register offsets from rcg2
 clock node
To: Abhishek Sahu <absahu@codeaurora.org>, mturquette@baylibre.com
Cc: andy.gross@linaro.org, david.brown@linaro.org, rnayak@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-2-git-send-email-absahu@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <4b660d7f-17ba-e5a6-3f48-13eeb1d9f02c@codeaurora.org>
Date: Thu, 27 Jul 2017 11:44:55 -0700
MIME-Version: 1.0
In-Reply-To: <1501153825-5181-2-git-send-email-absahu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 07/27/2017 04:10 AM, Abhishek Sahu wrote:
> The current driver hardcodes the RCG2 register offsets. Some of
> the RCG2’s use different offsets from the default one.
>
> This patch adds the support to provide the register offsets array in
> RCG2 clock node. If RCG2 clock node contains the register offsets
> then this will be used instead of default one.
>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-rcg.h  | 11 +++++++
>  drivers/clk/qcom/clk-rcg2.c | 78 ++++++++++++++++++++++++++++-----------------
>  2 files changed, 60 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 1b3e8d2..54add3b 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -17,6 +17,14 @@
>  #include <linux/clk-provider.h>
>  #include "clk-regmap.h"
>  
> +enum {
> +	CLK_RCG2_CMD,
> +	CLK_RCG2_CFG,
> +	CLK_RCG2_M,
> +	CLK_RCG2_N,
> +	CLK_RCG2_D,
> +};
> +
>  struct freq_tbl {
>  	unsigned long freq;
>  	u8 src;
> @@ -154,6 +162,8 @@ struct clk_dyn_rcg {
>   * @cmd_rcgr: corresponds to *_CMD_RCGR
>   * @mnd_width: number of bits in m/n/d values
>   * @hid_width: number of bits in half integer divider
> + * @offsets: offsets of RCG2 register from cmd_rcgr.
> + *	     default will be used in case of null
>   * @parent_map: map from software's parent index to hardware's src_sel field
>   * @freq_tbl: frequency table
>   * @current_freq: last cached frequency when using branches with shared RCGs
> @@ -164,6 +174,7 @@ struct clk_rcg2 {
>  	u32			cmd_rcgr;
>  	u8			mnd_width;
>  	u8			hid_width;
> +	const u8		*offsets;
>  	const struct parent_map	*parent_map;
>  	const struct freq_tbl	*freq_tbl;
>  	unsigned long		current_freq;
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 1a0985a..7e1c8aa 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2013-2017 The Linux Foundation. All rights reserved.
>   *
>   * This software is licensed under the terms of the GNU General Public
>   * License version 2, as published by the Free Software Foundation, and
> @@ -26,7 +26,6 @@
>  #include "clk-rcg.h"
>  #include "common.h"
>  
> -#define CMD_REG			0x0
>  #define CMD_UPDATE		BIT(0)
>  #define CMD_ROOT_EN		BIT(1)
>  #define CMD_DIRTY_CFG		BIT(4)
> @@ -35,7 +34,6 @@
>  #define CMD_DIRTY_D		BIT(7)
>  #define CMD_ROOT_OFF		BIT(31)
>  
> -#define CFG_REG			0x4
>  #define CFG_SRC_DIV_SHIFT	0
>  #define CFG_SRC_SEL_SHIFT	8
>  #define CFG_SRC_SEL_MASK	(0x7 << CFG_SRC_SEL_SHIFT)
> @@ -43,22 +41,34 @@
>  #define CFG_MODE_MASK		(0x3 << CFG_MODE_SHIFT)
>  #define CFG_MODE_DUAL_EDGE	(0x2 << CFG_MODE_SHIFT)
>  
> -#define M_REG			0x8
> -#define N_REG			0xc
> -#define D_REG			0x10
> +#define rcg2_cmd(rcg, offsets)	(rcg->cmd_rcgr)
> +#define rcg2_cfg(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_CFG])
> +#define rcg2_m(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_M])
> +#define rcg2_n(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_N])
> +#define rcg2_d(rcg, offsets)	(rcg->cmd_rcgr + offsets[CLK_RCG2_D])
> +
> +#define to_rcg2_offsets(rcg)	(rcg->offsets ?		\
> +				 rcg->offsets : rcg2_default_offsets)
>  
>  enum freq_policy {
>  	FLOOR,
>  	CEIL,
>  };
>  
> +static const u8 rcg2_default_offsets[] = {
> +	[CLK_RCG2_CFG] = 0x4,
> +	[CLK_RCG2_M] = 0x8,
> +	[CLK_RCG2_N] = 0xc,
> +	[CLK_RCG2_D] = 0x10,
> +};

It looks like the two UBI clks that messed this up don't have an MN
counter, so instead of doing this maddness, just add a flag like
m_is_cfg and then make a rcg2_crmd() function that checks this flag and
returns cmd_rcg + CFG_REG or cmd_rgcr + M_REG depending on the flag. We
can also optimize further, and ifdef this whole branch out unless the
specific IPQ GCC driver is enabled. Also only update the generic RCG
code, and not the display/gpu specific ones. Then the diff is much
smaller, and we can go yell at hardware team to never do this again.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
