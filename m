Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 2 Sep 2015 13:31:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: Add support for RPM Clocks
Message-ID: <20150902203154.GA15099@codeaurora.org>
References: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
 <1438620489-32515-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438620489-32515-2-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/03, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> new file mode 100644
> index 000000000000..e564673ec3a5
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -0,0 +1,165 @@
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
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>

Is this include used?

> +
> +#include "clk-smd-rpm.h"
> +
> +static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
> +				       unsigned long value)
>y +{
> +	struct clk_smd_rpm_req req = {
> +		.key = QCOM_RPM_SMD_KEY_RATE,
> +		.nbytes = sizeof(u32),
> +		.value = DIV_ROUND_UP(value, 1000), /* RPM expects KHz */

s/KHz/kHz/

> +	};
> +
> +	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
> +				  r->rpm_res_type, r->rpm_clk_id, &req,
> +				  sizeof(req));
> +}
> +
> +static int clk_smd_rpm_prepare(struct clk_hw *hw)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +	struct clk_smd_rpm *peer = r->peer;
> +	u32 value;
> +	int ret = 0;
> +
> +	/* Don't send requests to the RPM if the rate has not been set. */
> +	if (!r->rate)
> +		goto out;
> +
> +	/* Take peer clock's rate into account only if it's enabled. */
> +	if (peer->enabled)

We need some sort of lock here. Please make an internal mutex
like the downstream code to protect accesses from one RPM clock
to another RPM clock.

> +		value = max(r->rate, peer->rate);
> +	else
> +		value = r->rate;
> +
> +	if (r->branch)
> +		value = !!value;
> +
> +	ret = clk_smd_rpm_set_rate_active(r, value);
> +	if (ret)
> +		goto out;
> +
> +out:
> +	if (!ret)
> +		r->enabled = true;
> +
> +	return ret;
> +}
> +
> +static void clk_smd_rpm_unprepare(struct clk_hw *hw)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +
> +	if (r->rate) {
> +		struct clk_smd_rpm *peer = r->peer;
> +		unsigned long peer_rate;
> +		u32 value;

Why not unsigned long?

> +		int ret;
> +
> +		/* Take peer clock's rate into account only if it's enabled. */
> +		peer_rate = peer->enabled ? peer->rate : 0;
> +		value = r->branch ? !!peer_rate : peer_rate;
> +		ret = clk_smd_rpm_set_rate_active(r, value);
> +		if (ret)
> +			return;
> +	}
> +	r->enabled = false;
> +}
> +
> +static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +	int ret = 0;
> +
> +	if (r->enabled) {
> +		u32 value;
> +		struct clk_smd_rpm *peer = r->peer;
> +
> +		/* Take peer clock's rate into account only if it's enabled. */
> +		if (peer->enabled)

This peer stuff almost doesn't even matter because we're only
sending active set requests. Why can't this code be updated to
send both active and sleep set requests? The sleep set stuff
won't be cached, etc., but I don't see a problem in doing both.
Otherwise we should drop all the peer stuff until we introduce
active only clocks.

> +			value = max(rate, peer->rate);
> +		else
> +			value = rate;
> +
> +		ret = clk_smd_rpm_set_rate_active(r, value);
> +		if (ret)
> +			goto out;
> +	}
> +	r->rate = rate;
> +out:
> +	return ret;
> +}
> +
> +static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long *parent_rate)
> +{

Please add a comment here like

	/*
 	 * RPM handles rate rounding and we don't have a way to
	 * know what the rate will be, so just return whatever
	 * rate is requested.
	 */

> +	return rate;
> +}
> +
> +static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
> +					     unsigned long parent_rate)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);

And something similar here...

	/*
 	 * RPM handles rate rounding and we don't have a way to
	 * know what the rate will be, so just return whatever
	 * rate was set.
	 */

> +
> +	return r->rate;
> +}
> +
> +int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
> +{
> +	int ret;
> +	struct clk_smd_rpm_req req = {
> +		.key = QCOM_RPM_SMD_KEY_ENABLE,
> +		.nbytes = sizeof(u32),
> +		.value = 1,
> +	};
> +
> +	ret = qcom_rpm_smd_write(rpm, QCOM_SMD_RPM_ACTIVE_STATE,
> +				 QCOM_SMD_RPM_MISC_CLK,
> +				 QCOM_RPM_SCALING_ENABLE_ID, &req, sizeof(req));
> +	if (ret < 0) {
> +		if (ret != -EPROBE_DEFER)

Does this API return EPROBE_DEFER?

> +			pr_err("RPM clock scaling (active set) not enabled!\n");
> +		return ret;
> +	}
> +
> +	pr_debug("%s: RPM clock scaling is enabled\n", __func__);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(clk_smd_rpm_enable_scaling);
> diff --git a/drivers/clk/qcom/clk-smd-rpm.h b/drivers/clk/qcom/clk-smd-rpm.h
> new file mode 100644
> index 000000000000..7fd67c0e31b5
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-smd-rpm.h
> @@ -0,0 +1,139 @@
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
> +#ifndef __QCOM_CLK_SMD_RPM_H__
> +#define __QCOM_CLK_SMD_RPM_H__
> +
> +#include <linux/clk-provider.h>
> +#include <linux/soc/qcom/smd-rpm.h>

Drop this include and forward declare struct qcom_smd_rpm?

> +
> +#define QCOM_RPM_KEY_SOFTWARE_ENABLE			0x6e657773
> +#define QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY	0x62636370
> +#define QCOM_RPM_SMD_KEY_RATE				0x007a484b
> +#define QCOM_RPM_SMD_KEY_ENABLE				0x62616e45
> +#define QCOM_RPM_SMD_KEY_STATE				0x54415453
> +#define QCOM_RPM_SCALING_ENABLE_ID			0x2
> +
> +struct clk_smd_rpm {
> +	const int rpm_res_type;
> +	const int rpm_key;
> +	const int rpm_clk_id;
> +	const int rpm_status_id;
> +	const bool active_only;
> +	bool enabled;
> +	bool branch;
> +	struct clk_smd_rpm *peer;
> +	struct clk_hw hw;
> +	unsigned long rate;
> +	struct qcom_smd_rpm *rpm;
> +};
> +
> +struct clk_smd_rpm_req {
> +	u32 key;
> +	u32 nbytes;
> +	u32 value;

Should all be __le32.

> +};
> +
> +extern const struct clk_ops clk_smd_rpm_ops;
> +extern const struct clk_ops clk_smd_rpm_branch_ops;
> +int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm);
> +
> +#define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)

Can we move this to the C file? We shouldn't need to use this
outside of the file that implements the ops.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
