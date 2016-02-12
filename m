Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Feb 2016 16:41:26 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] clk: qcom: Add support for RPM Clocks
Message-ID: <20160212004126.GE4847@codeaurora.org>
References: <1450182602-6996-1-git-send-email-georgi.djakov@linaro.org>
 <1450182602-6996-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450182602-6996-3-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/15, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> new file mode 100644
> index 000000000000..7b0e85eefe70
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-rpm.c
> @@ -0,0 +1,290 @@
> +
> +static int clk_rpm_prepare(struct clk_hw *hw)
> +{
> +	struct clk_rpm *r = to_clk_rpm(hw);
> +	unsigned long rate = r->rate;
> +	int ret = 0;
> +
> +	mutex_lock(&rpm_clk_lock);
> +
> +	if (!rate)
> +		goto out;
> +
> +	if (r->branch)
> +		rate = !!rate;
> +
> +	ret = clk_rpm_set_rate_active(r, rate);
> +
> +	if (ret)
> +		goto out;
> +
> +out:
> +	if (!ret)
> +		r->enabled = true;
> +
> +	mutex_unlock(&rpm_clk_lock);
> +
> +	return ret;
> +}

I don't see any "peer" code in this file. Is there a reason we're
leaving out the active only vs active + sleep set style clocks?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
