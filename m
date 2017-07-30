Return-Path: <absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Sun, 30 Jul 2017 18:56:20 +0530
From: Abhishek Sahu <absahu@codeaurora.org>
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: andy.gross@linaro.org, david.brown@linaro.org, rnayak@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 04/12] clk: qcom: use offset from alpha pll node
In-Reply-To: <1501153825-5181-5-git-send-email-absahu@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-5-git-send-email-absahu@codeaurora.org>
Message-ID: <976cafe0058c671f141a8af533762dff@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2017-07-27 16:40, Abhishek Sahu wrote:
> Alpha PLL is a generic name used for Qualcomm PLL’s which uses L
> and Alpha values for configuring the integer and fractional part.
> Qualcomm SoC’s use different types of Alpha PLL’s for which basic
> software configuration part is common. These PLL’s will have same
> basic registers like PLL_MODE, L_VAL, ALPHA_VAL but some of the
> register offsets are different in each PLL type.
> Also, the offsets are not same in different instances of same
> type of PLL in some cases so it’s better to get the offsets
> from PLL node itself instead of hardcoding it.
> 
> This patch adds the support for giving the PLL offsets array in
> PLL node itself and uses the same for calculating the offsets.
> Now, this offsets array will be mandatory for all alpha PLL nodes.
> This patch provides the default array of offsets which driver can use
> in case where the PLL offsets are same. Some of the existing
> Qualcomm SoC’s uses the alpha PLL nodes so this patch added the
> default offsets in its nodes.
> 

  Did more analysis for this patch. Following are the
  offsets comparison of different types of Alpha PLL
  being used in different QCOM chips.

  Offsets                   Pious  Spark   Brammo  Huayra   Fabia  APSS 
PLL

  ALPHA_MODE                0x00   0x00    0x00    0x00     0x00  0x00
  ALPHA_L_VAL               0x04   0x04    0x04    0x04     0x04  0x08
  ALPHA_ALPHA_VAL           0x08   0x08    0x08    0x08     0x38  0x10
  ALPHA_ALPHA_VAL_U         0x0c   0x0c    0x0c    NA       NA    NA
  ALPHA_PLL_USER_CTL        0x10   0x10    0x10    0x10     0x0c  0x18
  ALPHA_PLL_USER_CTL_U      0x14   0x14    NA      NA       0x10  NA
  ALPHA_CONFIG_CTL          0x18   0x18    0x18    0x14     0x14  0x20
  ALPHA_CONFIG_CTL_U        NA     NA      NA      0x18     0x18  0x24
  ALPHA_TEST_CTL            0x1c   0x1c    0x1c    0x1c     0x1c  0x30
  ALPHA_TEST_CTL_U          0x20   0x20    NA      0x20     0x20  0x34
  ALPHA_STATUS              0x24   0x24    0x24    0x24     0x24  0x28

  where
  APPS PLL is Huayra PLL and being used in IPQ8074 and MSM8953
  MSM8994 uses Pious PLL
  MSM8996 uses Spark and Huayra PLL
  IPQ8074 uses Spark, Brammo and Huayra PLL
  MSM8998 uses Fabia PLL

> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 129 
> ++++++++++++++++++++-------------------
>  drivers/clk/qcom/clk-alpha-pll.h |  28 +++++++--
>  drivers/clk/qcom/gcc-ipq8074.c   |   6 +-
>  drivers/clk/qcom/gcc-msm8994.c   |  12 ++--
>  drivers/clk/qcom/gcc-msm8996.c   |  12 ++--
>  drivers/clk/qcom/mmcc-msm8996.c  |  48 ++++++++++-----
>  6 files changed, 141 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c 
> b/drivers/clk/qcom/clk-alpha-pll.c
> index 6291048..ef24c80 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -20,7 +20,6 @@
>  #include "clk-alpha-pll.h"
>  #include "common.h"
> 
> -#define PLL_MODE		0x00
>  # define PLL_OUTCTRL		BIT(0)
>  # define PLL_BYPASSNL		BIT(1)
>  # define PLL_RESET_N		BIT(2)
> @@ -36,25 +35,12 @@
>  # define PLL_ACTIVE_FLAG	BIT(30)
>  # define PLL_LOCK_DET		BIT(31)
> 
> -#define PLL_L_VAL		0x04
> -#define PLL_ALPHA_VAL		0x08
> -#define PLL_ALPHA_VAL_U		0x0c
> -
> -#define PLL_USER_CTL		0x10
>  # define PLL_POST_DIV_SHIFT	8
>  # define PLL_POST_DIV_MASK	0xf
>  # define PLL_ALPHA_EN		BIT(24)
>  # define PLL_VCO_SHIFT		20
>  # define PLL_VCO_MASK		0x3
> 
> -#define PLL_USER_CTL_U		0x14
> -
> -#define PLL_CONFIG_CTL		0x18
> -#define PLL_CONFIG_CTL_U	0x20
> -#define PLL_TEST_CTL		0x1c
> -#define PLL_TEST_CTL_U		0x20
> -#define PLL_STATUS		0x24
> -
>  /*
>   * Even though 40 bits are present, use only 32 for ease of 
> calculation.
>   */
> @@ -62,27 +48,51 @@
>  #define ALPHA_BITWIDTH		32
>  #define ALPHA_16BIT_MASK	0xffff
> 
> +#define pll_mode(pll)		(pll->base + pll->offsets[ALPHA_PLL_MODE])
> +#define pll_l(pll)		(pll->base + pll->offsets[ALPHA_PLL_L_VAL])
> +#define pll_alpha(pll)		(pll->base + 
> pll->offsets[ALPHA_PLL_ALPHA_VAL])
> +#define pll_alpha_u(pll)	(pll->base + 
> pll->offsets[ALPHA_PLL_ALPHA_VAL_U])
> +#define pll_user_ctl(pll)	(pll->base + 
> pll->offsets[ALPHA_PLL_USER_CTL])
> +#define pll_user_ctl_u(pll)	(pll->base + 
> pll->offsets[ALPHA_PLL_USER_CTL_U])
> +#define pll_cfg_ctl(pll)	(pll->base + 
> pll->offsets[ALPHA_PLL_CONFIG_CTL])
> +#define pll_test_ctl(pll)	(pll->base + 
> pll->offsets[ALPHA_PLL_TEST_CTL])
> +#define pll_test_ctl_u(pll)	(pll->base + 
> pll->offsets[ALPHA_PLL_TEST_CTL_U])
> +#define pll_status(pll)		(pll->base + pll->offsets[ALPHA_PLL_STATUS])
> +#define pll_cfg_ctl_u(pll)	(pll->base + 
> pll->offsets[ALPHA_PLL_CONFIG_CTL_U])
> +
>  #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
>  					   struct clk_alpha_pll, clkr)
> 
>  #define to_clk_alpha_pll_postdiv(_hw) container_of(to_clk_regmap(_hw), 
> \
>  					   struct clk_alpha_pll_postdiv, clkr)
> 
> +const u8 alpha_pll_offsets[] = {
> +	[ALPHA_PLL_MODE] = 0x00,
> +	[ALPHA_PLL_L_VAL] = 0x04,
> +	[ALPHA_PLL_ALPHA_VAL] = 0x08,
> +	[ALPHA_PLL_ALPHA_VAL_U] = 0x0c,
> +	[ALPHA_PLL_USER_CTL] = 0x10,
> +	[ALPHA_PLL_USER_CTL_U] = 0x14,
> +	[ALPHA_PLL_CONFIG_CTL] = 0x18,
> +	[ALPHA_PLL_TEST_CTL] = 0x1c,
> +	[ALPHA_PLL_TEST_CTL_U] = 0x20,
> +	[ALPHA_PLL_STATUS] = 0x24,
> +};
> +
