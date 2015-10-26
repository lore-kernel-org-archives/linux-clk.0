Return-Path: <sboyd@codeaurora.org>
Date: Mon, 26 Oct 2015 15:44:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/8] clk: qcom: msm8916: Ignore sleep_clk_src
 registration errors
Message-ID: <20151026224434.GK19782@codeaurora.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
 <1445360280-2347-4-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445360280-2347-4-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/20, Georgi Djakov wrote:
> We are moving the sleep clock to the DT. While all patches
> are merged, we will ignore sleep_clk_src registration errors.
> By ignoring this error, the msm8916 boards will continue booting
> during this transition period, otherwise the clock controller
> initialization will fail.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8916.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 3c0668b12142..4bb7d8415ba7 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -3364,10 +3364,8 @@ static int gcc_msm8916_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  
> -	clk = clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
> -				      CLK_IS_ROOT, 32768);
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> +	clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
> +				CLK_IS_ROOT, 32768);
>  

And we might as well do the same check here too. We can remove
the code in a year or something.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
