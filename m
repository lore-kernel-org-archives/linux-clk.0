Return-Path: <sboyd@codeaurora.org>
Date: Fri, 5 Jun 2015 18:41:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add MSM8916 audio clocks
Message-ID: <20150606014153.GI29237@codeaurora.org>
References: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
 <1433508036-28644-6-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433508036-28644-6-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/05, Georgi Djakov wrote:
> @@ -190,6 +193,76 @@ static const char *gcc_xo_gpll0a_gpll1_gpll2[] = {
>  	"gpll2_vote",
>  };
>  
> +static const struct parent_map gcc_xo_gpll0_gpll1_sleep_map[] = {
> +	{ P_XO, 0 },
> +	{ P_GPLL0, 1 },
> +	{ P_GPLL1, 2 },
> +	{ P_SLEEP_CLK, 6 }
> +};
> +
> +static const char *gcc_xo_gpll0_gpll1_sleep[] = {

Please make these new ones const char * const now that we've
fixed that problem in the clk framework


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
