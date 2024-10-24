Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81371741FE;
	Thu, 24 Oct 2024 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793787; cv=none; b=m32lmeKVs4hLUVcRN+H/qpq7CEvzmZprTZVELWuHBLxnzEx+ISjnPbO4BwfKz/FbQDgR0KtvVGlK1gBdV9Md7p6aoOKc/z2Tepgcpr1+eyGW6xb9wMkLI8YOmd4E+bIPRhQ1TzOaUrCjL3F5lACxF1wxxFii00YiYfWxrr1y1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793787; c=relaxed/simple;
	bh=YPY1q8Pd1ivEfQSXE7cKl/01TFyEdU0GmKHIBC8lVbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmFeIQPZe0Bet5HCCQ8uJ3Wuchg4gt1LH7mEKPEcHwyThnF5whzUxzJ+x9ig0oP/x884gpIRb03jn6WlqekyNva482YQg20KDTx3q+JV9IYMb3xOHEGlbWJGQRHxOsDVU21Te8AZDe+BzpTqOFp+U9n8mTs9ufWPJA/gzc5APPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lbXkyGBl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lbXkyGBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729793783;
	bh=YPY1q8Pd1ivEfQSXE7cKl/01TFyEdU0GmKHIBC8lVbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbXkyGBl1jPp+FpALSjo664Ysh7xA7LZRfVkYu1iQik7FV+5pBvx+Qd3rhkMaOjhv
	 cPFVwTv6UpF2v+QBD7poC+xQocJq4t/OQsjnPAvgTkDinDRU8ym/4DRYrg7CKG6r/C
	 +oNp6z7Pc9R9PGUhb1OP+J8WfXq5B6yOdWyzjhXmN+uEoD1biaPP4mIbbWPqFxfC4T
	 PdPHFpziSn/4Yl+RFxKtwWEQZUYtyXHQZUknsJiWvSTV8wqOXu4DpL9+JlKFiBylq2
	 ailqlzIIiT1WTgQ1AjFLE6G5ksXF4kkVpAtUcNNrBjK75+I71RC5A6RkbWNxYSYGLI
	 ByW7qLzByGtbg==
Received: from jupiter.universe (dyndsl-091-248-214-110.ewe-ip-backbone.de [91.248.214.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F244817E36C7;
	Thu, 24 Oct 2024 20:16:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A67C64800F4; Thu, 24 Oct 2024 20:16:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v11 2/5] clk: rockchip: rk3588: register GATE_LINK later
Date: Thu, 24 Oct 2024 20:15:29 +0200
Message-ID: <20241024181621.210509-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024181621.210509-1-sebastian.reichel@collabora.com>
References: <20241024181621.210509-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The proper GATE_LINK implementation will use runtime PM to handle the
linked gate clocks, which requires device context. Currently all clocks
are registered early via CLK_OF_DECLARE, which is before the kernel
knows about devices.

Moving the full clocks registration to the probe routine does not work,
since the clocks needed for timers must be registered early.

To work around this issue, most of the clock tree is registered early,
but GATE_LINK clocks are handled in the probe routine. Since the resets
are not needed early either, they have also been moved to the probe
routine.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 66 +++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 0ffaf639f807..618bda0be5a4 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -266,6 +266,8 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
 	},							\
 }
 
+static struct rockchip_clk_provider *early_ctx;
+
 static struct rockchip_cpuclk_rate_table rk3588_cpub0clk_rates[] __initdata = {
 	RK3588_CPUB01CLK_RATE(2496000000, 1),
 	RK3588_CPUB01CLK_RATE(2400000000, 1),
@@ -694,7 +696,7 @@ static struct rockchip_pll_clock rk3588_pll_clks[] __initdata = {
 		     RK3588_MODE_CON0, 10, 15, 0, rk3588_pll_rates),
 };
 
-static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
+static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	/*
 	 * CRU Clock-Architecture
 	 */
@@ -2428,7 +2430,9 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(68), 5, GFLAGS),
 	GATE(ACLK_AV1, "aclk_av1", "aclk_av1_pre", 0,
 			RK3588_CLKGATE_CON(68), 2, GFLAGS),
+};
 
+static struct rockchip_clk_branch rk3588_clk_branches[] = {
 	GATE_LINK(ACLK_ISP1_PRE, "aclk_isp1_pre", "aclk_isp1_root", ACLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 6, GFLAGS),
 	GATE_LINK(HCLK_ISP1_PRE, "hclk_isp1_pre", "hclk_isp1_root", HCLK_VI_ROOT, 0, RK3588_CLKGATE_CON(26), 8, GFLAGS),
 	GATE_LINK(HCLK_NVM, "hclk_nvm", "hclk_nvm_root", ACLK_NVM_ROOT, RK3588_LINKED_CLK, RK3588_CLKGATE_CON(31), 2, GFLAGS),
@@ -2453,26 +2457,31 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 	GATE_LINK(PCLK_VO1GRF, "pclk_vo1grf", "pclk_vo1_root", HCLK_VO1, CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(59), 12, GFLAGS),
 };
 
-static void __init rk3588_clk_init(struct device_node *np)
+static void __init rk3588_clk_early_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
-	unsigned long clk_nr_clks;
+	unsigned long clk_nr_clks, max_clk_id1, max_clk_id2;
 	void __iomem *reg_base;
 
-	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3588_clk_branches,
-					ARRAY_SIZE(rk3588_clk_branches)) + 1;
+	max_clk_id1 = rockchip_clk_find_max_clk_id(rk3588_clk_branches,
+					ARRAY_SIZE(rk3588_clk_branches));
+	max_clk_id2 = rockchip_clk_find_max_clk_id(rk3588_early_clk_branches,
+					ARRAY_SIZE(rk3588_early_clk_branches));
+	clk_nr_clks = max(max_clk_id1, max_clk_id2) + 1;
+
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
 		pr_err("%s: could not map cru region\n", __func__);
 		return;
 	}
 
-	ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
+	ctx = rockchip_clk_init_early(np, reg_base, clk_nr_clks);
 	if (IS_ERR(ctx)) {
 		pr_err("%s: rockchip clk init failed\n", __func__);
 		iounmap(reg_base);
 		return;
 	}
+	early_ctx = ctx;
 
 	rockchip_clk_register_plls(ctx, rk3588_pll_clks,
 				   ARRAY_SIZE(rk3588_pll_clks),
@@ -2491,14 +2500,55 @@ static void __init rk3588_clk_init(struct device_node *np)
 			&rk3588_cpub1clk_data, rk3588_cpub1clk_rates,
 			ARRAY_SIZE(rk3588_cpub1clk_rates));
 
+	rockchip_clk_register_branches(ctx, rk3588_early_clk_branches,
+				       ARRAY_SIZE(rk3588_early_clk_branches));
+
+	rockchip_clk_of_add_provider(np, ctx);
+}
+CLK_OF_DECLARE_DRIVER(rk3588_cru, "rockchip,rk3588-cru", rk3588_clk_early_init);
+
+static int clk_rk3588_probe(struct platform_device *pdev)
+{
+	struct rockchip_clk_provider *ctx = early_ctx;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+
 	rockchip_clk_register_branches(ctx, rk3588_clk_branches,
 				       ARRAY_SIZE(rk3588_clk_branches));
 
-	rk3588_rst_init(np, reg_base);
+	rockchip_clk_finalize(ctx);
 
+	rk3588_rst_init(np, ctx->reg_base);
 	rockchip_register_restart_notifier(ctx, RK3588_GLB_SRST_FST, NULL);
 
+	/*
+	 * Re-add clock provider, so that the newly added clocks are also
+	 * re-parented and get their defaults configured.
+	 */
+	of_clk_del_provider(np);
 	rockchip_clk_of_add_provider(np, ctx);
+
+	return 0;
 }
 
-CLK_OF_DECLARE(rk3588_cru, "rockchip,rk3588-cru", rk3588_clk_init);
+static const struct of_device_id clk_rk3588_match_table[] = {
+	{
+		.compatible = "rockchip,rk3588-cru",
+	},
+	{ }
+};
+
+static struct platform_driver clk_rk3588_driver = {
+	.probe		= clk_rk3588_probe,
+	.driver		= {
+		.name	= "clk-rk3588",
+		.of_match_table = clk_rk3588_match_table,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init rockchip_clk_rk3588_drv_register(void)
+{
+	return platform_driver_register(&clk_rk3588_driver);
+}
+core_initcall(rockchip_clk_rk3588_drv_register);
-- 
2.45.2

