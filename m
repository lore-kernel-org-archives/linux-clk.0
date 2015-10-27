Return-Path: <sboyd@codeaurora.org>
Date: Tue, 27 Oct 2015 16:15:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 5/8] clk: qcom: Add support for RPM Clocks
Message-ID: <20151027231556.GR19782@codeaurora.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
 <1445360280-2347-6-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445360280-2347-6-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/20, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> new file mode 100644
> index 000000000000..aa634bdf0aae
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -0,0 +1,260 @@
> +
> +static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
> +				       unsigned long value)
> +{
> +	struct clk_smd_rpm_req req = {
> +		.key = r->rpm_key,
> +		.nbytes = sizeof(u32),
> +		.value = DIV_ROUND_UP(value, 1000), /* RPM expects kHz */
> +	};
> +
> +	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
> +				  r->rpm_res_type, r->rpm_clk_id, &req,
> +				  sizeof(req));
> +}
> +
> +static int clk_smd_rpm_set_rate_sleep(struct clk_smd_rpm *r,
> +				      unsigned long value)
> +{
> +	struct clk_smd_rpm_req req = {
> +		.key = r->rpm_key,
> +		.nbytes = sizeof(u32),
> +		.value = DIV_ROUND_UP(value, 1000), /* RPM expects kHz */

Don't we need to do all the cpu_to_le32() stuff on these
structures?

> +	};
> +
> +	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_SLEEP_STATE,
> +				  r->rpm_res_type, r->rpm_clk_id, &req,
> +				  sizeof(req));
> +}
> +
[..]
> +
> +static int clk_smd_rpm_prepare(struct clk_hw *hw)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +	struct clk_smd_rpm *peer = r->peer;
> +	unsigned long this_rate = 0, this_sleep_rate = 0;
> +	unsigned long peer_rate = 0, peer_sleep_rate = 0;
> +	unsigned long active_rate, sleep_rate;
> +	int ret = 0;
> +
> +	mutex_lock(&rpm_clk_lock);
> +
> +	/* Don't send requests to the RPM if the rate has not been set. */
> +	if (!r->rate)
> +		goto out;
> +
> +	to_active_sleep(r, r->rate, &this_rate, &this_sleep_rate);
> +
> +	/* Take peer clock's rate into account only if it's enabled. */
> +	if (peer->enabled)
> +		to_active_sleep(peer, peer->rate,
> +				&peer_rate, &peer_sleep_rate);
> +
> +	active_rate = max(this_rate, peer_rate);
> +
> +	if (r->branch)
> +		active_rate = !!active_rate;
> +
> +	ret = clk_smd_rpm_set_rate_active(r, active_rate);
> +	if (ret)
> +		goto out;
> +
> +	sleep_rate = max(this_sleep_rate, peer_sleep_rate);
> +	if (r->branch)
> +		sleep_rate = !!sleep_rate;
> +
> +	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
> +	if (ret)
> +		/* Undo the active set vote and restore it */
> +		ret = clk_smd_rpm_set_rate_active(r, peer_rate);
> +
> +out:
> +	if (!ret)
> +		r->enabled = true;
> +
> +	mutex_unlock(&rpm_clk_lock);
> +
> +	return ret;
> +}
> +
> +static void clk_smd_rpm_unprepare(struct clk_hw *hw)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +
> +	mutex_lock(&rpm_clk_lock);
> +
> +	if (r->rate) {

The style is different than the prepare path here. Why? Please
use if (!r->rate) instead and move the local variables below to
the top of the function.

> +		struct clk_smd_rpm *peer = r->peer;
> +		unsigned long peer_rate = 0, peer_sleep_rate = 0;
> +		unsigned long active_rate, sleep_rate;
> +		int ret;
> +
> +		/* Take peer clock's rate into account only if it's enabled. */
> +		if (peer->enabled)
> +			to_active_sleep(peer, peer->rate, &peer_rate,
> +					&peer_sleep_rate);
> +
> +		active_rate = r->branch ? !!peer_rate : peer_rate;
> +		ret = clk_smd_rpm_set_rate_active(r, active_rate);
> +		if (ret)
> +			goto out;
> +
> +		sleep_rate = r->branch ? !!peer_sleep_rate : peer_sleep_rate;
> +		ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
> +		if (ret)
> +			goto out;
> +	}
> +	r->enabled = false;
> +
> +out:
> +	mutex_unlock(&rpm_clk_lock);
> +}
> +
> +static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +	int ret = 0;
> +
> +	mutex_lock(&rpm_clk_lock);
> +
> +	if (r->enabled) {

Same comment here. De-indent the code below.

> +		struct clk_smd_rpm *peer = r->peer;
> +		unsigned long active_rate, sleep_rate;
> +		unsigned long this_rate = 0, this_sleep_rate = 0;
> +		unsigned long peer_rate = 0, peer_sleep_rate = 0;
> +
> +		to_active_sleep(r, rate, &this_rate, &this_sleep_rate);
> +
> +		/* Take peer clock's rate into account only if it's enabled. */
> +		if (peer->enabled)
> +			to_active_sleep(peer, peer->rate,
> +					&peer_rate, &peer_sleep_rate);
> +
> +		active_rate = max(this_rate, peer_rate);
> +		ret = clk_smd_rpm_set_rate_active(r, active_rate);
> +		if (ret)
> +			goto out;
> +
> +		sleep_rate = max(this_sleep_rate, peer_sleep_rate);
> +		ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
> +		if (ret)
> +			goto out;
> +	}
> +	r->rate = rate;
> +out:
> +	mutex_unlock(&rpm_clk_lock);
> +
> +	return ret;
> +}
> +
> +
> diff --git a/drivers/clk/qcom/clk-smd-rpm.h b/drivers/clk/qcom/clk-smd-rpm.h
> new file mode 100644
> index 000000000000..d5dafad6b0fc
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-smd-rpm.h
> @@ -0,0 +1,142 @@
> +
> +#define __DEFINE_CLK_SMD_RPM(_name, active, type, r_id, stat_id, dep, key) \
> +	static struct clk_smd_rpm active; \

Can you please align the '\' at the same column on the right
side?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
