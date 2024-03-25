Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B21B963;
	Mon, 25 Mar 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395375; cv=none; b=s9ai3LUIZ01ZV5G4Nsj8ePQaYLHBu7a7RcGsUwDArBVXAOoskachu3QH0hA2wfKGBdNkfga4q8OguxX+1SMI9q5z5XHPzCfZLWV+9XVyDjAqiRvAYEr4Hj2FedZU7pU6r4Sk+Ce7gaa5vWilQFzIyUVyAvii8HryCv0a2R9bN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395375; c=relaxed/simple;
	bh=hIbZvUZlHw7fmj6qBOn3/XbqSdr2jxJFNOopoKSQ+O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOB21aiKtIFQ0utBFvNgv7yThpitmfCcJBkylv7+mcUrp5YmD0Tcj6TFnc533ZZFhuwcG68MiBnLQElAetR9jjuYP8XuBXXKEledAOiqsspjdf+UatF7OqpgQ2yuxgil0/+ket/2yDEgzIEhxVC9p7Q9M8rCZRB5/EnGZfBL0lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pzA2ubbS; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pzA2ubbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711395371;
	bh=hIbZvUZlHw7fmj6qBOn3/XbqSdr2jxJFNOopoKSQ+O8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pzA2ubbSxhbGt88YQybkILlXt3nGcctaKpJwrmh4Jc51bAu5wq/TqdpP8/FMYptav
	 WD4/faLH8aKlhRxRzg/EOzJO9BJu7jH8umvhscIGUpOAOAk0BKbkzfH2vuWXjDm5GF
	 7cutM4QVBUj7s2d2z99u0SYgh7i+j/zM/ZjsZ/v0O1SpMhqZ1DaZwY6pG50NpqwblX
	 YTD1HFOCWaUgVMV/hMoiebK0dgDVDw0nktQcpS0hl0lla4EYmsprMGm4ZWt1rjzwMM
	 3MNtC/dV+6lKN/jq2YGMJryT9YX8wj7tfMFaHs+FWEH+gxNTHKY+dVi4FwGuupcBAh
	 67uyheEaGJEpg==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7CE1037820EE;
	Mon, 25 Mar 2024 19:36:11 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 144F24800D0; Mon, 25 Mar 2024 20:36:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
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
Subject: [PATCH v9 3/7] clk: rockchip: rk3588: register GATE_LINK later
Date: Mon, 25 Mar 2024 20:33:34 +0100
Message-ID: <20240325193609.237182-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325193609.237182-1-sebastian.reichel@collabora.com>
References: <20240325193609.237182-1-sebastian.reichel@collabora.com>
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
 drivers/clk/rockchip/clk-rk3588.c | 64 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 74051277ecea..29f31a5526fa 100644
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
@@ -2453,14 +2457,18 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
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
@@ -2473,6 +2481,7 @@ static void __init rk3588_clk_init(struct device_node *np)
 		iounmap(reg_base);
 		return;
 	}
+	early_ctx = ctx;
 
 	rockchip_clk_register_plls(ctx, rk3588_pll_clks,
 				   ARRAY_SIZE(rk3588_pll_clks),
@@ -2491,14 +2500,53 @@ static void __init rk3588_clk_init(struct device_node *np)
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
-
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
2.43.0

