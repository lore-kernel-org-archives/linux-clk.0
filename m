Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 24 Feb 2017 05:20:12 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, tdas@codeaurora.org
Subject: Re: [PATCH 2/7] clk: qcom: Add a custom udelay needed for some
 branch clocks
Message-ID: <20170224132012.GA29979@builder>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
 <1476876523-27378-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476876523-27378-3-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed 19 Oct 04:28 PDT 2016, Rajendra Nayak wrote:

> Some branch clocks marked with a BRANCH_HALT_DELAY might need more
> than the default 10us delay. Have a way to specify a custom delay
> in such cases
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/clk-branch.c | 5 ++++-
>  drivers/clk/qcom/clk-branch.h | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> index 26f7af31..1c11f12 100644
> --- a/drivers/clk/qcom/clk-branch.c
> +++ b/drivers/clk/qcom/clk-branch.c
> @@ -82,7 +82,10 @@ static int clk_branch_wait(const struct clk_branch *br, bool enabling,
>  		return 0;
>  
>  	if (br->halt_check == BRANCH_HALT_DELAY || (!enabling && voted)) {
> -		udelay(10);
> +		if (br->udelay)
> +			udelay(br->udelay);
> +		else
> +			udelay(10);
>  	} else if (br->halt_check == BRANCH_HALT_ENABLE ||
>  		   br->halt_check == BRANCH_HALT ||
>  		   (enabling && voted)) {
> diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
> index 284df3f..4c56a35 100644
> --- a/drivers/clk/qcom/clk-branch.h
> +++ b/drivers/clk/qcom/clk-branch.h
> @@ -26,6 +26,7 @@
>   * @halt_reg: halt register
>   * @halt_bit: ANDed with @halt_reg to test for clock halted
>   * @halt_check: type of halt checking to perform
> + * @udelay: custom udelay incase of BRANCH_HALT_DELAY, default is 10us
>   * @clkr: handle between common and hardware-specific interfaces
>   *
>   * Clock which can gate its output.
> @@ -43,6 +44,7 @@ struct clk_branch {
>  #define BRANCH_HALT_ENABLE_VOTED	(BRANCH_HALT_ENABLE | BRANCH_VOTED)
>  #define BRANCH_HALT_DELAY		2 /* No bit to check; just delay */
>  
> +	u32	udelay;
>  	struct clk_regmap clkr;
>  };
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
