Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6994EC6FA8B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Sep 2022 06:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiIQGzQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Sep 2022 02:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiIQGzP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Sep 2022 02:55:15 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A66F37FB1;
        Fri, 16 Sep 2022 23:55:12 -0700 (PDT)
Received: from [167.98.135.4] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oZRjF-0007GC-Ap; Sat, 17 Sep 2022 08:55:05 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        Jagan Teki <jagan@edgeble.ai>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v5 4/6] clk: rockchip: Add clock controller support for RV1126 SoC.
Date:   Sat, 17 Sep 2022 08:55:03 +0200
Message-ID: <2597191.BddDVKsqQX@phil>
In-Reply-To: <20220915163947.1922183-5-jagan@edgeble.ai>
References: <20220915163947.1922183-1-jagan@edgeble.ai> <20220915163947.1922183-5-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Donnerstag, 15. September 2022, 18:39:45 CEST schrieb Jagan Teki:
> Clock & Reset Unit (CRU) in RV1126 support clocks for CRU
> and CRU_PMU blocks.
> 
> This patch is trying to add minimal Clock-Architecture Diagram's
> inferred from [1] authored by Finley Xiao.
> 
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/clk/rockchip/clk-rv1126.c
> 
> Cc: linux-clk@vger.kernel.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
> Changes for v5:
> - add platform-drivers

[...]

> +static void __init rv1126_pmu_clk_init(struct device_node *np)
> +{
> +	struct rockchip_clk_provider *ctx;
> +	void __iomem *reg_base;
> +
> +	reg_base = of_iomap(np, 0);
> +	if (!reg_base) {
> +		pr_err("%s: could not map cru pmu region\n", __func__);
> +		return;
> +	}
> +
> +	ctx = rockchip_clk_init(np, reg_base, CLKPMU_NR_CLKS);
> +	if (IS_ERR(ctx)) {
> +		pr_err("%s: rockchip pmu clk init failed\n", __func__);
> +		return;
> +	}
> +
> +	rockchip_clk_register_plls(ctx, rv1126_pmu_pll_clks,
> +				   ARRAY_SIZE(rv1126_pmu_pll_clks),
> +				   RV1126_GRF_SOC_STATUS0);
> +
> +	rockchip_clk_register_branches(ctx, rv1126_clk_pmu_branches,
> +				       ARRAY_SIZE(rv1126_clk_pmu_branches));
> +
> +	rockchip_register_softrst(np, 2, reg_base + RV1126_PMU_SOFTRST_CON(0),
> +				  ROCKCHIP_SOFTRST_HIWORD_MASK);
> +
> +	rockchip_clk_of_add_provider(np, ctx);
> +}
> +
> +CLK_OF_DECLARE(rv1126_cru_pmu, "rockchip,rv1126-pmucru", rv1126_pmu_clk_init);

this one and the one below should go away I think.

Can you check if that is the case, then I can just drop the two
CLK_OF_DECLARE lines.

Heiko

> +
> +static void __init rv1126_clk_init(struct device_node *np)
> +{
> +	struct rockchip_clk_provider *ctx;
> +	void __iomem *reg_base;
> +
> +	reg_base = of_iomap(np, 0);
> +	if (!reg_base) {
> +		pr_err("%s: could not map cru region\n", __func__);
> +		return;
> +	}
> +
> +	ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
> +	if (IS_ERR(ctx)) {
> +		pr_err("%s: rockchip clk init failed\n", __func__);
> +		iounmap(reg_base);
> +		return;
> +	}
> +
> +	rockchip_clk_register_plls(ctx, rv1126_pll_clks,
> +				   ARRAY_SIZE(rv1126_pll_clks),
> +				   RV1126_GRF_SOC_STATUS0);
> +
> +	rockchip_clk_register_armclk(ctx, ARMCLK, "armclk",
> +				     mux_armclk_p, ARRAY_SIZE(mux_armclk_p),
> +				     &rv1126_cpuclk_data, rv1126_cpuclk_rates,
> +				     ARRAY_SIZE(rv1126_cpuclk_rates));
> +
> +	rockchip_clk_register_branches(ctx, rv1126_clk_branches,
> +				       ARRAY_SIZE(rv1126_clk_branches));
> +
> +	rockchip_register_softrst(np, 15, reg_base + RV1126_SOFTRST_CON(0),
> +				  ROCKCHIP_SOFTRST_HIWORD_MASK);
> +
> +	rockchip_register_restart_notifier(ctx, RV1126_GLB_SRST_FST, NULL);
> +
> +	rockchip_clk_protect_critical(rv1126_cru_critical_clocks,
> +				      ARRAY_SIZE(rv1126_cru_critical_clocks));
> +
> +	rockchip_clk_of_add_provider(np, ctx);
> +}
> +
> +CLK_OF_DECLARE(rv1126_cru, "rockchip,rv1126-cru", rv1126_clk_init);
> +
> +struct clk_rv1126_inits {
> +	void (*inits)(struct device_node *np);
> +};
> +
> +static const struct clk_rv1126_inits clk_rv1126_pmucru_init = {
> +	.inits = rv1126_pmu_clk_init,
> +};
> +
> +static const struct clk_rv1126_inits clk_rv1126_cru_init = {
> +	.inits = rv1126_clk_init,
> +};
> +
> +static const struct of_device_id clk_rv1126_match_table[] = {
> +	{
> +		.compatible = "rockchip,rv1126-cru",
> +		.data = &clk_rv1126_cru_init,
> +	},  {
> +		.compatible = "rockchip,rv1126-pmucru",
> +		.data = &clk_rv1126_pmucru_init,
> +	},
> +	{ }
> +};
> +
> +static int __init clk_rv1126_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	const struct clk_rv1126_inits *init_data;
> +
> +	init_data = (struct clk_rv1126_inits *)of_device_get_match_data(&pdev->dev);
> +	if (!init_data)
> +		return -EINVAL;
> +
> +	if (init_data->inits)
> +		init_data->inits(np);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver clk_rv1126_driver = {
> +	.driver		= {
> +		.name	= "clk-rv1126",
> +		.of_match_table = clk_rv1126_match_table,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver_probe(clk_rv1126_driver, clk_rv1126_probe);



