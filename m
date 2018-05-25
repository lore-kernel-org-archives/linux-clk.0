Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 25 May 2018 11:18:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
	srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v2 2/3] clk: qcom: Register the gdscs before the clocks
Message-ID: <20180525181851.GF14924@minitux>
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-3-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180323082616.10142-3-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri 23 Mar 01:26 PDT 2018, Rajendra Nayak wrote:

> We have atleast some instances of ALWAYS_ON gdscs, which need to
> be turned ON *before* some clocks within the gdsc domain marked
> with a CLK_IS_CRITICAL can be turned ON.
> To facilitate this sequence, register the GDCSs (and hence handle
> the ALWAYS_ON gdscs) before we register clocks (and handle the
> clocks marked as CLK_IS_CRITICAL)
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/common.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b8064a336d46..39ce64c2783b 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -228,22 +228,6 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	if (!cc)
>  		return -ENOMEM;
>  
> -	cc->rclks = rclks;
> -	cc->num_rclks = num_clks;
> -
> -	for (i = 0; i < num_clks; i++) {
> -		if (!rclks[i])
> -			continue;
> -
> -		ret = devm_clk_register_regmap(dev, rclks[i]);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> -	if (ret)
> -		return ret;
> -
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
>  	reset->rcdev.ops = &qcom_reset_ops;
> @@ -272,6 +256,22 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  			return ret;
>  	}
>  
> +	cc->rclks = rclks;
> +	cc->num_rclks = num_clks;
> +
> +	for (i = 0; i < num_clks; i++) {
> +		if (!rclks[i])
> +			continue;
> +
> +		ret = devm_clk_register_regmap(dev, rclks[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
