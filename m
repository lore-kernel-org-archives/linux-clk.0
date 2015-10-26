Return-Path: <sboyd@codeaurora.org>
Date: Mon, 26 Oct 2015 15:43:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/8] clk: qcom: msm8916: Set the parent of xo to
 xo_board
Message-ID: <20151026224352.GJ19782@codeaurora.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
 <1445360280-2347-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445360280-2347-3-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/20, Georgi Djakov wrote:
> Remove the hard-coded clock rate from the driver and set the XO
> parent to the on-board XO oscillator that is defined in the DT.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8916.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index d0a0313d6bef..3c0668b12142 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -3360,7 +3360,7 @@ static int gcc_msm8916_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  
>  	/* Temporary until RPM clocks supported */
> -	clk = clk_register_fixed_rate(dev, "xo", NULL, CLK_IS_ROOT, 19200000);
> +	clk = clk_register_fixed_factor(dev, "xo", "xo_board", 0, 1, 1);

Sorry, I'd prefer to not take any DT changes through clk tree if
we can avoid it. So we need to write some code to figure out if
the xo_board clock is present, and keep registering this clock as
the root clk if it isn't there.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
