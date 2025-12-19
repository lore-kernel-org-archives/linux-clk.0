Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF822A4D6
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766112682; cv=none; b=BxVKyXzAEDXKdcxVgBtzQJL+V6J1R4ovjB8SNuvBu5UvnVXombWeiCUf2/yQbc0qAfx1hbXz6KYUCRjPzUBaACRl1T/G9kBUWOnizR1bKJQW7x/RJOv9wQeHvKULG0cnl9VWO8gz0O4Cu32XUg+TTl5CqsLGXBWcuNDReEA44Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766112682; c=relaxed/simple;
	bh=byNlz5pb12vcgNRYGkQCwYfndFV1eWO4Z/7wEk1dE5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drUaXluUe9lxGTZOeiWemlFDKSGUhVtsL83l77KPVx9nbgsM4s5JZgq4Ev8t7LkieXcWPZYHNgLvg+eCuYSlTVdXvvQmgeW2TwHNHxJ7Xpwh0CDUqUvjK8fD2E8zCi8ijhzwy/rdciqU+NdGpKM5cga0lDnH39r6Lq/k17clrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vvX/772P; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vvX/772P"
Date: Fri, 19 Dec 2025 10:50:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766112673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MHHbOuACtVt65M/XvY+Am4aG15ahsyxIVkVopdcC560=;
	b=vvX/772PnNTxi/t0d7qcKtYhcclwLhCBP/h3L15QVwxrqGTmgOKMi7qyuIOaxGSMN/sIl0
	UIvvWIE0ee1fAJp/ZnoXf9g0oGC6DebdwBV2T4MbDmT+Ga79Y56X+Y3uYiGFy4E4+G6va0
	30aMVVfHSJwf5prig5DtbC8z356Cy5w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v8 2/3] clock: eswin: Add eic7700 clock driver
Message-ID: <aUS9bLVLhIPMOcWa@kernel.org>
References: <20251113013637.1109-1-dongxuyang@eswincomputing.com>
 <20251113013846.1222-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113013846.1222-1-dongxuyang@eswincomputing.com>
X-Migadu-Flow: FLOW_OUT

Hi Xuyang,
This is a quick review.

On Thu, Nov 13, 2025 at 09:38:46AM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add clock drivers for the EIC7700 SoC. The clock controller on the ESWIN
> EIC7700 provides various clocks to different IP blocks within the SoC.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/clk/Kconfig             |    1 +
>  drivers/clk/Makefile            |    1 +
>  drivers/clk/eswin/Kconfig       |   15 +
>  drivers/clk/eswin/Makefile      |    8 +
>  drivers/clk/eswin/clk-eic7700.c | 1033 +++++++++++++++++++++++++++++++
>  drivers/clk/eswin/clk-eic7700.h |  122 ++++
>  drivers/clk/eswin/clk.c         |  481 ++++++++++++++
>  drivers/clk/eswin/clk.h         |  256 ++++++++
>  8 files changed, 1917 insertions(+)
>  create mode 100644 drivers/clk/eswin/Kconfig
>  create mode 100644 drivers/clk/eswin/Makefile
>  create mode 100644 drivers/clk/eswin/clk-eic7700.c
>  create mode 100644 drivers/clk/eswin/clk-eic7700.h
>  create mode 100644 drivers/clk/eswin/clk.c
>  create mode 100644 drivers/clk/eswin/clk.h
> 
[...]
> diff --git a/drivers/clk/eswin/clk-eic7700.c b/drivers/clk/eswin/clk-eic7700.c
> new file mode 100644
> index 000000000000..03540db9cb7d
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700.c
[...]
> +static int eic7700_clk_probe(struct platform_device *pdev)
> +{
> +	struct eswin_clock_data *clk_data;
> +	struct device *dev = &pdev->dev;
> +
> +	clk_data = eswin_clk_init(dev, EIC7700_NR_CLKS);
> +	if (!clk_data)
> +		return dev_err_probe(dev, -EAGAIN, "failed to get clk data!\n");
> +
> +	eswin_clk_register_fixed_rate(eic7700_fixed_rate_clks,
> +				      ARRAY_SIZE(eic7700_fixed_rate_clks),
> +				      clk_data, dev);
Please check returned value here and check other places.

> +
> +	eswin_clk_register_pll(eic7700_pll_clks, ARRAY_SIZE(eic7700_pll_clks),
> +			       clk_data, dev);
> +
> +	eswin_clk_register_fixed_factor(eic7700_fixed_factor_clks,
> +					ARRAY_SIZE(eic7700_fixed_factor_clks),
> +					clk_data, dev);
> +
> +	eswin_clk_register_mux(eic7700_mux_clks, ARRAY_SIZE(eic7700_mux_clks),
> +			       clk_data, dev);
> +
> +	eswin_clk_register_divider(eic7700_div_clks,
> +				   ARRAY_SIZE(eic7700_div_clks), clk_data, dev);
> +
> +	eswin_clk_register_gate(eic7700_gate_clks,
> +				ARRAY_SIZE(eic7700_gate_clks), clk_data, dev);
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   &clk_data->clk_data);
> +}
> +
[...]
> diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
> new file mode 100644
> index 000000000000..92998da98009
> --- /dev/null
> +++ b/drivers/clk/eswin/clk.c
[...]
> +static int eswin_calc_pll(u32 *frac_val, u32 *fbdiv_val, u64 rate,
> +			  const struct eswin_clk_pll *clk)
> +{
> +	u64 rem = 0;
> +	u32 tmp1 = 0, tmp2 = 0;
> +
> +	if (clk->id == EIC7700_CLK_APLL_FOUT1 ||
> +	    clk->id == EIC7700_CLK_PLL_CPU) {
clk.c appears to be a generic library for ESWIN SoCs, but it references
specific IDs (EIC7700_...) from a specific chip.

If you add the chip like EIC77XX later, will you add more if/else here?

Could you ove the algorithmic parameters (like rate * 4) into the
eswin_clk_pll structure flags or data fields. The calculation logic
should be generic based on the struct fields, not the ID.

Please check other places.
> +		rate = rate * 4;
> +		rem = do_div(rate, 1000);
> +		if (rem)
> +			tmp1 = rem;
> +
> +		rem = do_div(rate, 1000);
> +		if (rem)
> +			tmp2 = rem;
> +
> +		rem = do_div(rate, 24);
> +		/* fbdiv = rate * 4 / 24000000 */
> +		*fbdiv_val = rate;
> +		/* frac = rate * 4 % 24000000 * (2 ^ 24) */
> +		*frac_val = (u64)((1000 * (1000 * rem + tmp2) + tmp1) << 24)
> +				  / 24 / 1000000;
> +	} else {
> +		pr_err("Invalid pll set req, rate %lld, clk id %d\n", rate,
> +		       clk->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline struct eswin_clk_pll *to_pll_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct eswin_clk_pll, hw);
> +}
> +
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
> +	struct clk *clk_cpu_lp_pll = NULL;
> +	struct clk *clk_cpu_mux = NULL;
> +	struct clk *clk_cpu_pll = NULL;
> +	u32 postdiv1_val = 0, refdiv_val = 1;
> +	u32 frac_val, fbdiv_val, val;
> +	bool lock_flag = false;
> +	int try_count = 0;
> +	int ret;
> +
> +	ret = eswin_calc_pll(&frac_val,  &fbdiv_val, (u64)rate, clk);
> +	if (ret)
> +		return ret;
> +
> +	/* Must switch the CPU to other CLK before we change the CPU PLL. */
> +	if (clk->id == EIC7700_CLK_PLL_CPU) {
> +		clk_cpu_mux = __clk_lookup("mux_cpu_root_3mux1_gfree");
It seems you want to switch to a safe clock source before setting up the
PLL, right?

I am not sure whether your approach is correct, but the use of
__clk_lookup() should be avoided whenever possible. 
Would it be feasible to obtain a proper clock handle somewhere and
perform the necessary configuration from within a clk_notifier instead?
> +		if (!clk_cpu_mux) {
> +			pr_err("failed to get clk: %s\n",
> +			       "mux_cpu_root_3mux1_gfree");
> +			return -EINVAL;
> +		}
