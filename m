Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621002;
	b=aweuFkdSn9VYwI790HAHxT3I9o6dy51xmMQl0spc95TMCZqZyBgNnXmgfP8sF5FOYUWx
	 1yQJ2dur0rBreSL1gvH6d7mnOHZyjEq7pHo1SCkG1Oib8RUHdEakZJ7xRdbI+TWN5DofN
	 Gtrz9a4g7g2RcAlu5UgmdG8UfDvySw04FlDxheJTJMc8ysieI7maW8B5LAY21BFfE9Nic
	 PWacZjgNBIFAlh5I4kmm7vCtVNwcMjbw/Q7YDjN8BLYn9RKrwIt7ZAdkHLjWm1PJcnzPz
	 FFVIWdtttHAFlD3OuOdF6fBUIGcB5/hxwdRkFF1Y2fdm/MqrolnDjpsgCxfdxlPu4Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621002;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XvTKLKhLWXrfLb9+js6MFGQ/DuZ14JfMkl8pBoukSCY=;
	b=tg01uva2DMDoQ+LzbwNU5IbngTaWprJts+9QodN6jIYa2tXNcolphSJtwnecbKYWbEY+
	 sMLa6meKelE8kTpYEMGTLO+VEyTBGHUzN2daNibGFNqht9PvkTsMdSnUlBZQRfSXjzSL0
	 gyMWtEDkvjqumfU5uZ/IJ+kIME61X1Jt/jaTNxsFJ6xkfziIqK/b7gdqoHY22kcX03MHO
	 mg0NojPCesIk90T7AIrKRcsAjJypuXXEhf2KqZ4jBYfxS9cS5yxaU25aGwpvmImwKC8wr
	 K6rj/9K36H3Cimg4BH07b0vxaJANZ6U8bRZQxF5CD8X1Jr73Bg6UnslflvqtvofJ5Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emEdo+3V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567F606A685;
	Wed, 25 Nov 2026 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emEdo+3V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD651F000C4;
	Wed, 25 Nov 2026 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621002;
	bh=XvTKLKhLWXrfLb9+js6MFGQ/DuZ14JfMkl8pBoukSCY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=emEdo+3Vcx2qcN5tLWthbYUlZmhINQbC2UlNU89hkRovj65+KivZsxrU3WoeJ41BK
	 y/6vJqmI1bE0CPRtkdSUnEO74ocgJN3Tz44xEryo5sRVt1UKFaw28FErTW3E+zgUct
	 voiZno16hkbV3bwH1PEz+SsVRNJk+fqgR1WAUPseoFYb795ongFbcZRdMfcqUNT9jz
	 x9kgSHRQ1MBdQ/0Hi7uaGLK5XEeN+vblFked2jSpxmcbSDUknLQ7xewPR8gEukVncd
	 UXJ7jNPQs0cXJAj5cETiMV+tq4BbKBfSLw3kwy8dZaoLJNth4gVvFP0Z3Hblg/NCdc
	 qSZ2pPAXE19bg==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 4/8] clk: clocking-wizard: Add static-config clock
 provider support
From: Brian Masney <masneyb@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 shubhrajyoti.datta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124035613.1968260-5-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-5-shubhrajyoti.datta@amd.com>
Date: Wed, 25 Nov 2026 10:36:33 -0500
Message-Id: <179562099316.458327.15246469960975998989.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=6645; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=w5DgWGuw/9YvYQddvv1a0z+c4zuNwaL4AFh+j4cOg9E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGZoan+rLzIl+JNzycc+vXZGGiV/03++a9vbfC4tAt
 qWu95ZVdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR+iWMDDdV7y2dpGom2vRe
 7Pd3FebbdlI/DvWVddxmVOY7FbG2+R/DPyM/RYlgzvqki0Kz7ILfTFvlpGH//vSXPcbNTFsrui7
 lMAEA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Shubhrajyoti,

> When xlnx,static-config is present the divider/multiplier path is
> synthesized inside the Wizard without exposing runtime MMIO
> reconfiguration, so omit the AXI register mapping and advertise each
> routed output clock as a clk_fixed_factor child of clk_in1 using the
> synthesized ratios exported through xlnx,clk-mul-div.
> 
> However the parent clock of clk_in1 can still be gated, disabled, or
> (re-)enabled after FPGA programming (typical FPGA Manager flows,
> CCF-managed parents, PLL fabric power sequencing).
> 
> Add a 10 us delay in each output clock's .enable() hook so consumers
> wait for reference settling before first access.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> (no changes since v3)
> 
> Changes in v3:
> - Removed duplicated number-of-outputs handling
> 
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 137 ++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index 649cf2d21943..31fed0e1ed30 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> @@ -114,6 +115,7 @@
>  #define VER_WZRD_O_MIN			2
>  #define VER_WZRD_O_MAX			511
>  #define WZRD_FRAC_POINTS		1000
> +#define WZRD_ENABLE_DELAY_US		10
>  
>  /* Get the mask from width */
>  #define div_mask(width)			((1 << (width)) - 1)
> @@ -833,6 +835,13 @@ static int clk_wzrd_ver_determine_rate_all(struct clk_hw *hw,
>  	return 0;
>  }
>  
> +static int clk_wzrd_enable(struct clk_hw *hw)
> +{
> +	/* Allow the output clock to settle after enable */
> +	udelay(WZRD_ENABLE_DELAY_US);

If this delay is needed, then it should use the prepare callback instead
of enable.

> +	return 0;
> +}
> +
>  static const struct clk_ops clk_wzrd_ver_divider_ops = {
>  	.determine_rate = clk_wzrd_determine_rate,
>  	.set_rate = clk_wzrd_ver_dynamic_reconfig,
> @@ -926,6 +935,85 @@ static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
>  	.recalc_rate = clk_wzrd_recalc_ratef,
>  };
>  
> +static unsigned long
> +clk_wzrd_static_factor_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> +	unsigned long long rate;
> +
> +	rate = (unsigned long long)parent_rate * fix->mult;
> +	do_div(rate, fix->div);
> +	return (unsigned long)rate;
> +}
> +
> +static int clk_wzrd_static_factor_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> +
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> +		unsigned long best_parent;
> +
> +		best_parent = (req->rate / fix->mult) * fix->div;
> +		req->best_parent_rate =
> +			clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
> +	}
> +
> +	req->rate = (req->best_parent_rate / fix->div) * fix->mult;
> +
> +	return 0;
> +}
> +
> +static int clk_wzrd_static_factor_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	return 0;
> +}
> +
> +static const struct clk_ops clk_wzrd_static_fixed_factor_ops = {

As pointed out by sashiko, can clk_fixed_factor_ops be used instead?

> +	.enable = clk_wzrd_enable,
> +	.determine_rate = clk_wzrd_static_factor_determine_rate,
> +	.set_rate = clk_wzrd_static_factor_set_rate,
> +	.recalc_rate = clk_wzrd_static_factor_recalc_rate,
> +};

> +static struct clk_hw *
> +clk_wzrd_devm_register_static_fixed_factor(struct device *dev,
> +					   const char *name,
> +					   const struct clk_parent_data *parent_data,
> +					   unsigned long flags,
> +					   unsigned int mult,
> +					   unsigned int div)
> +{
> +	struct clk_init_data init = {};
> +	struct clk_fixed_factor *fix;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	fix = devm_kzalloc(dev, sizeof(*fix), GFP_KERNEL);
> +	if (!fix)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fix->mult = mult;
> +	fix->div = div;
> +
> +	init.name = name;
> +	init.ops = &clk_wzrd_static_fixed_factor_ops;
> +	init.flags = flags;
> +	init.parent_data = parent_data;
> +	init.num_parents = 1;
> +
> +	fix->hw.init = &init;
> +
> +	hw = &fix->hw;
> +	ret = devm_clk_hw_register(dev, hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return hw;
> +}
> +
>  static struct clk_hw *clk_wzrd_register_divf(struct device *dev,
>  					  const char *name,
>  					  const char *parent_name,
> @@ -1290,9 +1378,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct clk_wzrd *clk_wzrd;
> +	const char *clk_name;
>  	unsigned long rate;
> +	struct clk_hw *hw;
>  	int nr_outputs;
> -	int ret;
> +	int ret, i;
>  
>  	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
>  	if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
> @@ -1302,6 +1392,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  				GFP_KERNEL);
>  	if (!clk_wzrd)
>  		return -ENOMEM;
> +	clk_wzrd->clk_data.num = nr_outputs;
>  	platform_set_drvdata(pdev, clk_wzrd);
>  
>  	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
> @@ -1337,7 +1428,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  		if (ret)
>  			return ret;
>  
> -		clk_wzrd->clk_data.num = nr_outputs;
>  		ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
>  						  &clk_wzrd->clk_data);
>  		if (ret) {
> @@ -1360,6 +1450,49 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  				dev_warn(&pdev->dev,
>  					 "unable to register clock notifier\n");
>  		}
> +	} else {
> +		u32 mul_div[WZRD_NUM_OUTPUTS * 2];
> +		const struct clk_parent_data parent_data = { .fw_name = "clk_in1" };
> +		int num_elems = nr_outputs * 2;
> +
> +		/*
> +		 * xlnx,clk-mul-div is a uint32-matrix of <mul div> pairs;
> +		 * FDT encodes it as a flat u32 array so we can read it directly.
> +		 */
> +		ret = of_property_read_u32_array(np, "xlnx,clk-mul-div",
> +						 mul_div, num_elems);
> +		if (ret) {
> +			dev_err(&pdev->dev, "xlnx,clk-mul-div missing or invalid\n");

The counts should be validated. Also use dev_err_probe() like the rest
of the function.

Brian

-- 
Brian Masney <masneyb@kernel.org>
