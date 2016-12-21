Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Dec 2016 15:56:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com,
	robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org,
	pradeepb@codeaurora.org, snlakshm@codeaurora.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/6] clk: qcom: ipq4019: Add the cpu clock frequency
 change notifier
Message-ID: <20161221235627.GI8288@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
 <1480088493-4590-7-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1480088493-4590-7-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/25, Abhishek Sahu wrote:
> @@ -1736,13 +1737,55 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  };
>  MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
>  
> +/* Contains index for safe clock during APSS freq change */
> +static int gcc_ipq4019_cpu_safe_parent;
> +static int
> +gcc_ipq4019_cpu_clk_notifier_fn(struct notifier_block *nb,
> +				unsigned long action, void *data)
> +{
> +	int err = 0;
> +
> +	if (action == PRE_RATE_CHANGE)
> +		err = clk_rcg2_ops.set_parent(&apps_clk_src.clkr.hw,
> +					      gcc_ipq4019_cpu_safe_parent);

Why can't we hardcode this? It's not like this safe parent is
going to change across boards.

> +
> +	return notifier_from_errno(err);
> +}
> +
> +static struct notifier_block gcc_ipq4019_cpu_clk_notifier = {
> +	.notifier_call = gcc_ipq4019_cpu_clk_notifier_fn,
> +};
> +
>  static int gcc_ipq4019_probe(struct platform_device *pdev)
>  {
> -	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
> +	int err;
> +
> +	err = qcom_cc_probe(pdev, &gcc_ipq4019_desc);
> +	if (err)
> +		return err;
> +
> +	gcc_ipq4019_cpu_safe_parent = qcom_find_src_index(&apps_clk_src.clkr.hw,
> +						apps_clk_src.parent_map,
> +						P_FEPLL500);
> +	if (gcc_ipq4019_cpu_safe_parent < 0)
> +		err = gcc_ipq4019_cpu_safe_parent;

Then we don't need to do this.

> +
> +	if (!err)
> +		err = clk_notifier_register(apps_clk_src.clkr.hw.clk,
> +				      &gcc_ipq4019_cpu_clk_notifier);
> +
> +	return err;
> +}
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
