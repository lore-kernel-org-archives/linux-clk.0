Return-Path: <sboyd@codeaurora.org>
Date: Tue, 27 Oct 2015 16:23:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/8] clk: qcom: Add RPM clock controller driver
Message-ID: <20151027232328.GT19782@codeaurora.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
 <1445360280-2347-7-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445360280-2347-7-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/20, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/rpmcc.c b/drivers/clk/qcom/rpmcc.c
> new file mode 100644
> index 000000000000..88283e2c95f7
> --- /dev/null
> +++ b/drivers/clk/qcom/rpmcc.c
> @@ -0,0 +1,198 @@
> +/*
> + * Copyright (c) 2015, Linaro Limited
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/soc/qcom/smd-rpm.h>

Is this include used?

Add init.h for __init usage.

> +
> +#include "clk-smd-rpm.h"
> +#include <dt-bindings/clock/qcom,rpmcc-msm8916.h>
[..]
> +
> +static struct clk_smd_rpm *rpmcc_msm8916_clks[] = {

Can this be const?

> +	[RPM_XO_CLK_SRC] = &xo,
> +	[RPM_XO_A_CLK_SRC] = &xo_a,
> +	[RPM_PCNOC_CLK] = &pcnoc_clk,
> +	[RPM_PCNOC_A_CLK] = &pcnoc_a_clk,
[..]
> +
> +static int rpmcc_probe(struct platform_device *pdev)
> +{
> +	struct clk **clks;
> +	struct clk *clk;
> +	struct clk_smd_rpm **rpm_clks;
> +	struct rpm_cc *rcc;
> +	const struct rpmcc_desc *desc;
> +	struct qcom_smd_rpm *rpm;
> +	struct clk_onecell_data *data;
> +	int ret, i;
> +	size_t num_clks;
> +	const struct of_device_id *match;
> +
> +	rpm = dev_get_drvdata(pdev->dev.parent);
> +	if (!rpm) {
> +		dev_err(&pdev->dev, "Unable to retrieve handle to RPM\n");
> +		return -ENODEV;
> +	}
> +
> +	match = of_match_device(rpmcc_match_table, &pdev->dev);

of_device_get_match_data() please

> +	if (!match)
> +		return -EINVAL;
> +
> +	desc = match->data;
> +	rpm_clks = desc->clks;
> +	num_clks = desc->num_clks;
> +
[..]
> +	}
> +
> +	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
> +				  data);
> +	if (ret)
> +		return ret;
> +
> +	return clk_smd_rpm_enable_scaling(rpm);

We should unregister the provider if clk_smd_rpm_enable_scaling()
fails.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
