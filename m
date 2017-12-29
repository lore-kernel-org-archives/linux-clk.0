Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Dec 2017 16:00:47 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: jassisinghbrar@gmail.com, bjorn.andersson@linaro.org,
	mturquette@baylibre.com, robh@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v11 6/6] clk: qcom: Add APCS clock controller support
Message-ID: <20171229000047.GZ7997@codeaurora.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171205154701.27730-7-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171205154701.27730-7-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/05, Georgi Djakov wrote:
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap.h"
> +#include "clk-regmap-mux-div.h"
> +
> +enum {
> +	P_GPLL0,
> +	P_A53PLL,
> +};

This is always 0, 1.

> +
> +static const struct parent_map gpll0_a53cc_map[] = {
> +	{ P_GPLL0, 4 },
> +	{ P_A53PLL, 5 },

And then this is not really doing much. So I wonder why we really
even need a parent_map? More like we need a map from parent_names
to mux number. We don't need to map some random enum into another
number space like we do for RCGs. I think we may have the same
problem with another qcom clk patch (see commit df964016490b in
clk-next). We really don't need the rcg version of parent_map in
either case, more like we just need a u8 *table (or u32
whatever), and then we're done. I'm going to make that change now
because otherwise we get into a mess with the parent_map stuff in
the other branch. I'll go clean up that too so we don't move
parent_map around.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
