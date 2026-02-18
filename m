Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50369307AF0;
	Wed, 18 Feb 2026 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412432; cv=none; b=E+m7n0Hia3ZWIAPo4W5i1BrED9RLITiAa0yg6rhwh3gjaiy2HgcMoJAVVcSln9ybybxX8aBg7rQ5bCbKlSsCDi+wPxx6vIFoL40aDT2Htm4Nr/L0fjh+aBpOfn4HoGm2gMkSqmgJ88yjpeSQXPKtYfSMNnxcpy7euRiiKbrRXtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412432; c=relaxed/simple;
	bh=VXFQL5BZy+HqvbUJeFd3eVHhL1DG76izxX4eyjkPros=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TW3jISOsmZNPdmdg/xBwMaQ3Fb8blMj3D+EpcLl04ce6ZHYmuFfjPt8vMDckzsYb756nl7S6CNjz+WyS3O2DkJylCR+TcTluPPRO0PqLZC4bzaj5RfavrjqNEMaK837T3vP2sXu0VaU2odOXqVSn9qazmaXyIqCBH8QYjMXCgSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=btc1kSqA; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="btc1kSqA"
Received: from localhost.localdomain (2A02-842b-8136-0001-B865-661d-5641-E7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id D2CF2426E9;
	Wed, 18 Feb 2026 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771412428;
	bh=VXFQL5BZy+HqvbUJeFd3eVHhL1DG76izxX4eyjkPros=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=btc1kSqAwlxWhtmsSbCiVV9OReQd9H2FZD6bLBmBJUGIbelLqDBweMEHFUQX6shyV
	 XOezvNF579a1U5DmUmQzUYZ+XgA2ZW9YKv46utTEIC1zAqXzYVSn4rS62N2XGhph8M
	 QArKE7i+cnEiuoTZ3Ba88IJyErn/t8uHpZE20mB8=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drivers: clk: meson: Add Amlogic T7 sys pll support
Date: Wed, 18 Feb 2026 12:00:15 +0100
Message-ID: <20260218110018.36348-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/t7-peripherals.c | 134 ++++++++++++++++++++++++++++-
 1 file changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 214db7850d86..de206473f3a7 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -176,6 +176,127 @@ static struct clk_regmap t7_rtc = {
 	},
 };
 
+static u32 t7_sys_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7 };
+static const struct clk_parent_data t7_sys_parents[] = {
+	{ .fw_name = "xtal", },
+	{ .fw_name = "fdiv2", },
+	{ .fw_name = "fdiv3", },
+	{ .fw_name = "fdiv4", },
+	{ .fw_name = "fdiv5", },
+	{ .fw_name = "axi_clk_frcpu", },
+	{ .hw = &t7_rtc.hw },
+};
+
+static struct clk_regmap t7_sys_a_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 10,
+		.table = t7_sys_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_a_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = t7_sys_parents,
+		.num_parents = ARRAY_SIZE(t7_sys_parents),
+	},
+};
+
+static struct clk_regmap t7_sys_a_div = {
+	.data = &(struct clk_regmap_div_data){
+	.offset = SYS_CLK_CTRL0,
+		.shift = 0,
+		.width = 10,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_a_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_a_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap t7_sys_a = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = SYS_CLK_CTRL0,
+		.bit_idx = 13,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_a",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_a_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_sys_b_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x7,
+		.shift = 26,
+		.table = t7_sys_parents_val_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_b_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_data = t7_sys_parents,
+		.num_parents = ARRAY_SIZE(t7_sys_parents),
+	},
+};
+
+static struct clk_regmap t7_sys_b_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = SYS_CLK_CTRL0,
+		.shift = 16,
+		.width = 10,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_b_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_b_sel.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_sys_b = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = SYS_CLK_CTRL0,
+		.bit_idx = 29,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_b",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_b_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_sys = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = SYS_CLK_CTRL0,
+		.mask = 0x1,
+		.shift = 15,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_clk",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_sys_a.hw,
+			&t7_sys_b.hw,
+		},
+		.num_parents = 2,
+	},
+};
+
 static struct clk_regmap t7_ceca_dualdiv_in = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = CECA_CTRL0,
@@ -824,7 +945,7 @@ static T7_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
 
 static const struct clk_parent_data t7_spicc_parents[] = {
 	{ .fw_name = "xtal", },
-	{ .fw_name = "sys", },
+	{ .hw = &t7_sys.hw },
 	{ .fw_name = "fdiv4", },
 	{ .fw_name = "fdiv3", },
 	{ .fw_name = "fdiv2", },
@@ -859,7 +980,7 @@ static T7_COMP_GATE(spicc5, SPICC_CLK_CTRL2, 22, 0);
 
 static const struct clk_parent_data t7_saradc_parents[] = {
 	{ .fw_name = "xtal" },
-	{ .fw_name = "sys" },
+	{ .hw = &t7_sys.hw },
 };
 
 static T7_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x1, t7_saradc_parents);
@@ -929,7 +1050,7 @@ static T7_COMP_SEL(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 25, 0x3, t7_pwm_parents);
 static T7_COMP_DIV(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 16, 8);
 static T7_COMP_GATE(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 24, 0);
 
-static const struct clk_parent_data t7_sys_pclk_parents = { .fw_name = "sys" };
+static const struct clk_parent_data t7_sys_pclk_parents = { .hw = &t7_sys.hw };
 
 #define T7_SYS_PCLK(_name, _reg, _bit, _flags) \
 	MESON_PCLK(t7_##_name, _reg, _bit, &t7_sys_pclk_parents, _flags)
@@ -1161,6 +1282,13 @@ static struct clk_hw *t7_peripherals_hw_clks[] = {
 	[CLKID_PWM_AO_H_SEL]		= &t7_pwm_ao_h_sel.hw,
 	[CLKID_PWM_AO_H_DIV]		= &t7_pwm_ao_h_div.hw,
 	[CLKID_PWM_AO_H]		= &t7_pwm_ao_h.hw,
+	[CLKID_SYS_A_SEL]		= &t7_sys_a_sel.hw,
+	[CLKID_SYS_A_DIV]		= &t7_sys_a_div.hw,
+	[CLKID_SYS_A]			= &t7_sys_a.hw,
+	[CLKID_SYS_B_SEL]		= &t7_sys_b_sel.hw,
+	[CLKID_SYS_B_DIV]		= &t7_sys_b_div.hw,
+	[CLKID_SYS_B]			= &t7_sys_b.hw,
+	[CLKID_SYS]				= &t7_sys.hw,
 	[CLKID_SYS_DDR]			= &t7_sys_ddr.hw,
 	[CLKID_SYS_DOS]			= &t7_sys_dos.hw,
 	[CLKID_SYS_MIPI_DSI_A]		= &t7_sys_mipi_dsi_a.hw,
-- 
2.49.0

