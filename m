Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Dec 2015 23:39:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: common: check for failure
Message-ID: <20151203073917.GE14699@codeaurora.org>
References: <1448960770-10815-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448960770-10815-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Sudip Mukherjee wrote:
> We were not checking the return from devm_add_action() which can fail.
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---
>  drivers/clk/qcom/common.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index c112eba..3541a9a 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -213,7 +213,10 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> -	devm_add_action(dev, qcom_cc_del_clk_provider, pdev->dev.of_node);
> +	ret = devm_add_action(dev, qcom_cc_del_clk_provider,
> +			      pdev->dev.of_node);
> +	if (ret)
> +		return ret;

So now we don't remove the clk provider on allocation failure?
Confused.

>  
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
> @@ -236,8 +239,12 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  			return ret;
>  	}
>  
> -	devm_add_action(dev, qcom_cc_gdsc_unregister, dev);
> -
> +	ret = devm_add_action(dev, qcom_cc_gdsc_unregister, dev);
> +	if (ret) {
> +		if (desc->gdscs && desc->num_gdscs)
> +			gdsc_unregister(dev);
> +		return ret;
> +	}
>  
>  	return 0;
>  }

You seem to have missed the reset devm action. Why?

Also, I wonder if we could have devm_add_action() or some other
new devm_add_action() wrapper that tried to add the action, and
if it failed it ran the action right there and returned the
-ENOMEM? So then we can just have:

	ret = devm_add_action_or_do_it(dev, qcom_cc_gdsc_unregister, dev)
	if (ret)
		return ret;

and we're assured that on the failure path we'll have already
called qcom_cc_gdsc_unregister.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
