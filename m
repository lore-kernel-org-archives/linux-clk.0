Return-Path: <sboyd@codeaurora.org>
Date: Fri, 8 Dec 2017 16:18:55 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] clk: qcom: support for alpha pll properties
Message-ID: <20171209001855.GL7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <1506621050-10129-4-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1506621050-10129-4-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/28, Abhishek Sahu wrote:
> Alpha PLL is a generic name used for QCOM PLL’s which uses L
> and Alpha values for configuring the integer and fractional part.
> QCOM SoC’s use different types of Alpha PLL’s for which basic
> software configuration part is common with following differences.
> 
> 1. All These PLL’s will have same basic registers like
>    PLL_MODE, L_VAL, ALPHA_VAL but some of the register offsets are
>    different in each PLL type.
> 2. PLL dynamic programming sequence will be different in some
>    of the Alpha PLL’s
> 3. Some of the PLL won’t have 64 bit config control, 64 bit
>    user control, VCO configuration etc.
> 
> Now, this patch adds the Alpha PLL type in clock node and adds
> alpha PLL properties structure inside clk-alpha-pll.c. This PLL
> property will contain everything including register offsets, clock
> operations and other properties since all these properties will be
> fixed for Alpha PLL.
> 
> This allows to support other types of Alpha PLL without addition
> of new flag and variable in structures of clk_alpha_pll.h. Also, we
> don’t have to add operation for each Alpha PLL’s and export them.
> 
> In future, we can get rid of most of the flags like following
> 
>     struct clk_alpha_pll {
>             #define SUPPORTS_OFFLINE_REQ    BIT(0)
>             #define SUPPORTS_16BIT_ALPHA    BIT(1)
>             #define SUPPORTS_FSM_MODE       BIT(2)
>             u8 flags;
>     };
> 
>     struct clk_alpha_pll_postdiv {
>             u8 width;
>     };
> 
> Since all the above properties will be always same for different
> instances of same type of Alpha PLL’s.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
