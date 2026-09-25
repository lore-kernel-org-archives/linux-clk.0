Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77A4D9F97;
	Fri, 25 Sep 2026 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354613; cv=none; b=NL/bOVrwMGXUcYIylqMA9lZoy5ufV//xwf/uzp8RWPX6I3gPdF6f/yBQDZRe43RSRb74cSVbYLJvdyv1CIPoShP6w3CIoCrYQWaMgcgDklRjBctPcIdLt91YuvJobUUEpULvwlbacUMqg3D/SnfJ1EqRXmvSNGL9U64Yi4dsJpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354613; c=relaxed/simple;
	bh=BBdBCSyd1YlVRWlY+Yu8Hm8YgDtYYWt9szJ6SRyPYMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjidtMBA3rujZdWD3/jTEx054I9dL7HCI4skW8AmyvuFGOKjatgq/325ejAU8cWyrQ173w3zUSq0z4P2jS6Aeuh098RyuwHqDi66gq1F6L2gj5/iY7YesByMSOJ8moXCuQntYHnTEt0P9tMC4366OEUJ/ycfeSHxDeWcU+5w1g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyS7ZofM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyS7ZofM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8DC1F00898;
	Fri, 25 Sep 2026 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354596;
	bh=tQ2KPPqaYIExgr/OjOm9DBbYGsiIV8thgR6ClSV3dlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AyS7ZofMc5tM7/7CmsI9yWgjIZI/PsLl++OMidQ+ihas5UkfysKi7aquWVxz2sbMH
	 HZZBneXoipSQbQecL2obNJXfKJCVoiBCLhykCgjAtbdIaCefSyk/cdDD/UOQWRXZfB
	 i6sKm458XuWzhNu5V7H30dYLPr+fXks64bDgTYIQTwF6oy34sVuD53howzZcCHrjGl
	 ZrOTMq+6Z8Y/J5uHvZKJfi9agUVX8ffk1FWCwa7v+x7LtyuiW7jXATMOcP5aQeexuc
	 5P3cWWsCN7au0N3NgAp+u5NmAIzP8slgQ4RQNy6wkwMtqKkeJqdKZdBlSvZM9hI26o
	 /sbEho2GRYOEA==
Date: Fri, 25 Sep 2026 11:43:12 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 27/48] clk: qcom: gcc-sm6375: Use common clock
 controller probe data
Message-ID: <arakiJMpnExvAqNz@zenbook>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
 <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-27-1479443ee016@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-27-1479443ee016@oss.qualcomm.com>

On Thu, Sep 24, 2026 at 03:06:39PM +0300, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
> clk_regs_configure callback. This preserves the existing ordering of
> enabling the always-on branches before configuring these four PLLs.

I don't see the clk_regs_configure being applied and the four
gpllNN_config definitions are dangling after this change.

(Please use "make W=1e")

I'm applying the rest of the series.

Regards,
Bjorn

> Using the alpha_plls array instead would configure the PLLs before the
> CBCR enables in the common probe path.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm6375.c | 46 ++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
> index 9c2acf8dc4b7..c67d4293c76b 100644
> --- a/drivers/clk/qcom/gcc-sm6375.c
> +++ b/drivers/clk/qcom/gcc-sm6375.c
> @@ -3853,7 +3853,30 @@ static const struct regmap_config gcc_sm6375_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const u32 gcc_sm6375_critical_cbcrs[] = {
> +	0x17028, /* GCC_CAMERA_XO_CLK */
> +	0x2b004, /* GCC_CPUSS_GNOC_CLK */
> +	0x1702c, /* GCC_DISP_XO_CLK */
> +};
> +
> +static struct clk_alpha_pll *gcc_sm6375_plls[] = {
> +	&gpll10,
> +	&gpll11,
> +	&gpll8,
> +	&gpll9,
> +};
> +
> +static const struct qcom_cc_driver_data gcc_sm6375_driver_data = {
> +	.alpha_plls = gcc_sm6375_plls,
> +	.num_alpha_plls = ARRAY_SIZE(gcc_sm6375_plls),
> +	.clk_cbcrs = gcc_sm6375_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm6375_critical_cbcrs),
> +	.dfs_rcgs = gcc_dfs_clocks,
> +	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
> +};
> +
>  static const struct qcom_cc_desc gcc_sm6375_desc = {
> +	.driver_data = &gcc_sm6375_driver_data,
>  	.config = &gcc_sm6375_regmap_config,
>  	.clks = gcc_sm6375_clocks,
>  	.num_clks = ARRAY_SIZE(gcc_sm6375_clocks),
> @@ -3871,28 +3894,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm6375_match_table);
>  
>  static int gcc_sm6375_probe(struct platform_device *pdev)
>  {
> -	struct regmap *regmap;
> -	int ret;
> -
> -	regmap = qcom_cc_map(pdev, &gcc_sm6375_desc);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
> -	if (ret)
> -		return ret;
> -
> -	/* Keep some clocks always-on */
> -	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x2b004); /* GCC_CPUSS_GNOC_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
> -
> -	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
> -	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
> -	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
> -	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
> -
> -	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6375_desc, regmap);
> +	return qcom_cc_probe(pdev, &gcc_sm6375_desc);
>  }
>  
>  static struct platform_driver gcc_sm6375_driver = {
> 
> -- 
> 2.54.0
> 
