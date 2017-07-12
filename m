Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:14:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, architt@codeaurora.org,
	bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-smd-rpm: Fix the initial rate of branches
Message-ID: <20170712231413.GP22780@codeaurora.org>
References: <20170704123447.25552-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170704123447.25552-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/04, Georgi Djakov wrote:
> As there is no way to actually query the hardware for the current clock
> rate, now racalc_rate() just returns the last rate that was previously
> set. But if the rate was not set yet, we return the bogus rate of 1KHz.
> 
> Knowing what the rate of XO is and that some clocks are just branches of
> it, we can do better and return that rate instead of a bogus one.
> 
> Reported-by: Archit Taneja <architt@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index d990fe44aef3..7350a43b0573 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -116,12 +116,12 @@
>  
>  #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
>  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 19200000,		      \
>  		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>  
>  #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
>  		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 19200000,		      \
>  		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
>  
>  #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)

Also, it would be better if these were children of the xo_board
clk. That way we don't have to specify a rate at all, just take
the rate from the parent (xo_board) and then things look correct
regardless of the board configuration.

So I'll drop this patch from clk-next for now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
