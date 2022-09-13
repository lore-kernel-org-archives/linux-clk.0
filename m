Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC25CC54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 10:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiIMKNL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 06:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbiIMKNK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 06:13:10 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC64D5B79C;
        Tue, 13 Sep 2022 03:13:07 -0700 (PDT)
Received: from [185.122.133.20] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oY2ue-00042A-QF; Tue, 13 Sep 2022 12:13:04 +0200
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
Subject: Re: [PATCH v4 05/13] clk: rockchip: Add clock controller support for RV1126 SoC.
Date:   Tue, 13 Sep 2022 12:13:03 +0200
Message-ID: <2196383.iZASKD2KPV@phil>
In-Reply-To: <20220907160207.3845791-6-jagan@edgeble.ai>
References: <20220907160207.3845791-1-jagan@edgeble.ai> <20220907160207.3845791-6-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Jagan,

Am Mittwoch, 7. September 2022, 18:01:59 CEST schrieb Jagan Teki:
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

both of these want to be platform-drivers nowadays.

Take a look at rk3399 and rk3568 for reference.

Thanks
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




