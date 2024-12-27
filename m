Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C82BAF7;
	Fri, 27 Dec 2024 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288201; cv=none; b=WuuDKnMG8ezQK50O9QYZtGXRrOqi+WIcvz1U1eueRc2Jl0m0qaQIUjrPot+Pa7HoTTsuZohzcuBquzQZ3wr32SGplNZPGegacBu/W9L1P7wfvl2I5YeTm+sc/0Ek4diUywP0p4QMwa4PLrfCbevSVSzbprpz7EcRdvH/9shs/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288201; c=relaxed/simple;
	bh=q4BglVonBtnI/qxK5vzOvvLIE4bBQr/ItGFYCqjwiBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsniXJMEjHzEB9XjOKVrwMz6ODU5uUIA/uUYfgz3wRg6HF7E13e/Ov9xCxRkfThcfYyO24e/sTM7HrEJYAI2OmPGKzhzD7KrIWz8MmemdO+CR1lkryIiaPMMONKhtE4/m/KprOZBZBPcu8b7i23WWPfo2h7STJsMfGhepXbGcZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKQVhGMf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKQVhGMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D067DC4CED0;
	Fri, 27 Dec 2024 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288201;
	bh=q4BglVonBtnI/qxK5vzOvvLIE4bBQr/ItGFYCqjwiBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKQVhGMfDOABBq0ix8kEFLD/a1HFbBX2ROgo/rh9Dknj+2HB0H9C7kqeb9451wCvD
	 vruZGXPQJlcZhSylmX74OnVQAyPdgKC1wn0L5qJKMdB+QQ1+M3RAvgRrX2c5yfz5oK
	 h6hmqcZvbrLGcXBze/L7x1ZsVvGv4URR2uIBHnDT9FOvg9+95JGb1sc/6CvPzU3WQQ
	 PLv/zMX4vqd4Dy0lH1BQmy8gp04wmQj5BqBtX33DEaV9r+EJpNPMVelV2vAqrY2a6g
	 nBvF81XJjlVulgfdnesWuIcMsmCp07IlSao7PCGWaxV1EEPwrzsB86ytn+QC7zveSx
	 wKxbJlyflO+Wg==
Date: Fri, 27 Dec 2024 09:29:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: rockchip: Add clock controller for the RK3562
Message-ID: <drybpdss7gr5rgeuxfph5rghqymxzbqqysjbnbu6llvr4njrjn@nwqxhfiu4ttl>
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <20241224092310.3814460-3-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224092310.3814460-3-kever.yang@rock-chips.com>

On Tue, Dec 24, 2024 at 05:23:10PM +0800, Kever Yang wrote:
> +	/* PD_VO */
> +	COMPOSITE(ACLK_VO_PRE, "aclk_vo_pre", gpll_cpll_vpll_dmyhpll_p, 0,
> +			RK3562_CLKSEL_CON(28), 6, 2, MFLAGS, 0, 5, DFLAGS,
> +			RK3562_CLKGATE_CON(13), 0, GFLAGS),
> +	COMPOSITE_NOMUX(HCLK_VO_PRE, "hclk_vo_pre", "aclk_vo", 0,
> +			RK3562_CLKSEL_CON(29), 0, 5, DFLAGS,
> +			RK3562_CLKGATE_CON(13), 1, GFLAGS),
> +	GATE(ACLK_VOP, "aclk_vop", "aclk_vo", 0,
> +			RK3562_CLKGATE_CON(13), 6, GFLAGS),
> +	GATE(HCLK_VOP, "hclk_vop", "hclk_vo_pre", 0,
> +			RK3562_CLKGATE_CON(13), 7, GFLAGS),
> +	COMPOSITE(DCLK_VOP, "dclk_vop", gpll_dmyhpll_vpll_apll_p, CLK_SET_RATE_NO_REPARENT,
> +			RK3562_CLKSEL_CON(30), 14, 2, MFLAGS, 0, 8, DFLAGS,
> +			RK3562_CLKGATE_CON(13), 8, GFLAGS),
> +	COMPOSITE(DCLK_VOP1, "dclk_vop1", gpll_dmyhpll_vpll_apll_p, CLK_SET_RATE_NO_REPARENT,
> +			RK3562_CLKSEL_CON(31), 14, 2, MFLAGS, 0, 8, DFLAGS,
> +			RK3562_CLKGATE_CON(13), 9, GFLAGS),
> +};
> +
> +static void __iomem *rk3562_cru_base;

Drop, not used.

> +
> +static void __init rk3562_clk_init(struct device_node *np)
> +{
> +	struct rockchip_clk_provider *ctx;
> +	unsigned long clk_nr_clks;
> +	void __iomem *reg_base;
> +
> +	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3562_clk_branches,
> +					ARRAY_SIZE(rk3562_clk_branches)) + 1;
> +
> +	reg_base = of_iomap(np, 0);
> +	if (!reg_base) {
> +		pr_err("%s: could not map cru region\n", __func__);
> +		return;
> +	}
> +
> +	rk3562_cru_base = reg_base;
> +
> +	ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
> +	if (IS_ERR(ctx)) {
> +		pr_err("%s: rockchip clk init failed\n", __func__);
> +		iounmap(reg_base);
> +		return;
> +	}
> +
> +	rockchip_clk_register_plls(ctx, rk3562_pll_clks,
> +				   ARRAY_SIZE(rk3562_pll_clks),
> +				   RK3562_GRF_SOC_STATUS0);
> +
> +	rockchip_clk_register_branches(ctx, rk3562_clk_branches,
> +				       ARRAY_SIZE(rk3562_clk_branches));
> +
> +	rk3562_rst_init(np, reg_base);
> +
> +	rockchip_register_restart_notifier(ctx, RK3562_GLB_SRST_FST, NULL);
> +
> +	rockchip_clk_of_add_provider(np, ctx);
> +}
> +
> +CLK_OF_DECLARE(rk3562_cru, "rockchip,rk3562-cru", rk3562_clk_init);
> +
> +#ifdef MODULE
> +struct clk_rk3562_inits {
> +	void (*inits)(struct device_node *np);
> +};
> +
> +static const struct clk_rk3562_inits clk_3562_cru_init = {
> +	.inits = rk3562_clk_init,
> +};
> +
> +static const struct of_device_id clk_rk3562_match_table[] = {
> +	{
> +		.compatible = "rockchip,rk3562-cru",
> +		.data = &clk_3562_cru_init,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, clk_rk3562_match_table);
> +
> +static int clk_rk3562_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	const struct of_device_id *match;
> +	const struct clk_rk3562_inits *init_data;
> +
> +	match = of_match_device(clk_rk3562_match_table, &pdev->dev);
> +	if (!match || !match->data)
> +		return -EINVAL;
> +
> +	init_data = match->data;
> +	if (init_data->inits)
> +		init_data->inits(np);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver clk_rk3562_driver = {
> +	.probe		= clk_rk3562_probe,
> +	.driver		= {
> +		.name	= "clk-rk3562",
> +		.of_match_table = clk_rk3562_match_table,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +module_platform_driver(clk_rk3562_driver);
> +
> +MODULE_DESCRIPTION("Rockchip RK3562 Clock Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:clk-rk3562");

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.


Best regards,
Krzysztof

