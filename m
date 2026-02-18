Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BAB284694;
	Wed, 18 Feb 2026 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410409; cv=none; b=sDb9ovwt9vdLVFhHrUTY0VsP0IhlLUB4ATeKfytZhpiXU6YQ+ar3PbpJLYE2PSpdQk7V4512zx6kf7M2pD0nLPQnx+eTYLQZ+mteimVYmBvoQ++0vsqo0McuCfrRdVdd+CxefzSdS6gPbXsBOtp0HDog7fXtFdkoX5pgvvApIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410409; c=relaxed/simple;
	bh=UIj7l7+c+Oryy69k5j23cX4NqnuYzH9LjKdMAwbHPXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+gFIZFNPPwCaWC5unbuWkg+s7w7p6FANak+5zsAgZhMDqOTtaxrmubP/kkVdU4TGvdOT+qdVRVPys+8t+PpOO6+i11R1sWJzvo3fvTvrjohTj9F7paSmsHEX15ctlNqVaYCaCJB1YfGwqKxWUCmO3p/dcj17mRWcumUZQ9VPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=KX9YCSzZ; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="KX9YCSzZ"
Received: from localhost.localdomain (2a02-842B-8136-0001-B865-661d-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 25F6340244;
	Wed, 18 Feb 2026 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771409845;
	bh=UIj7l7+c+Oryy69k5j23cX4NqnuYzH9LjKdMAwbHPXU=;
	h=From:To:Cc:Subject:Date;
	b=KX9YCSzZMzK2IVeM4+7eF93Vv4Uk2sxtI1Qq7uhSYQ2mHQBEcMxkpmZHTQvy6AnSY
	 TXSeJtQgOaNqPi/AKGORxFVD6BPlG3Z/fJFn3br8BV1W95vU3bMgDXn4qyyljvvQ3c
	 cOHcXCKFjC8+0kNxflZgo6k0KSAM+BjaPj3Rnbe4=
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
Subject: [PATCH 1/7] drivers: clk: meson: Add Amlogic T7 fix pll support
Date: Wed, 18 Feb 2026 11:17:06 +0100
Message-ID: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/t7-pll.c | 257 +++++++++++++++++++++++++++++++++++++
 1 file changed, 257 insertions(+)

diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
index 0a622f45fa36..3dd3aca50b7c 100644
--- a/drivers/clk/meson/t7-pll.c
+++ b/drivers/clk/meson/t7-pll.c
@@ -71,6 +71,15 @@
 #define MCLK_PLL_CNTL4		0x10
 #define MCLK_PLL_STS		0x14
 
+#define FPLL_CTRL0		0x00
+#define FPLL_CTRL1		0x04
+#define FPLL_CTRL2		0x08
+#define FPLL_CTRL3		0x0c
+#define FPLL_CTRL4		0x10
+#define FPLL_CTRL5		0x14
+#define FPLL_CTRL6		0x18
+#define FPLL_STS		0x1c
+
 static const struct pll_mult_range t7_media_pll_mult_range = {
 	.min = 125,
 	.max = 250,
@@ -1047,6 +1056,253 @@ static const struct meson_clkc_data t7_mclk_data = {
 	},
 };
 
+static struct clk_regmap t7_fpll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 0,
+			.width   = 8,
+		},
+		.n = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 10,
+			.width   = 5,
+		},
+		.frac = {
+			.reg_off = FPLL_CTRL1,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = FPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fpll_dco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "xtal",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fpll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = FPLL_CTRL0,
+		.shift = 16,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fpll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fpll_dco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv2_div = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv2 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv2_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv2p5_div = {
+	.mult = 2,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2p5_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fpll.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv2p5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 25,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv2p5",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv2p5_div.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv3_div = {
+	.mult = 1,
+	.div = 3,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv3_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv3 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 20,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv3",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv3_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv4_div = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv4_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv4 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 21,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv4",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv4_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv5_div = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv5_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv5 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 22,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv5",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv5_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_fixed_factor t7_fdiv7_div = {
+	.mult = 1,
+	.div = 7,
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv7_div",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) { &t7_fpll.hw },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap t7_fdiv7 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = FPLL_CTRL1,
+		.bit_idx = 23,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "fdiv7",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&t7_fdiv7_div.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
+	},
+};
+
+static struct clk_hw *t7_fpll_hw_clks[] = {
+	[CLKID_FPLL_DCO]	= &t7_fpll_dco.hw,
+	[CLKID_FPLL]		= &t7_fpll.hw,
+	[CLKID_FDIV2_DIV]	= &t7_fdiv2_div.hw,
+	[CLKID_FDIV2]		= &t7_fdiv2.hw,
+	[CLKID_FDIV2P5_DIV]	= &t7_fdiv2p5_div.hw,
+	[CLKID_FDIV2P5]		= &t7_fdiv2p5.hw,
+	[CLKID_FDIV3_DIV]	= &t7_fdiv3_div.hw,
+	[CLKID_FDIV3]		= &t7_fdiv3.hw,
+	[CLKID_FDIV4_DIV]	= &t7_fdiv4_div.hw,
+	[CLKID_FDIV4]		= &t7_fdiv4.hw,
+	[CLKID_FDIV5_DIV]	= &t7_fdiv5_div.hw,
+	[CLKID_FDIV5]		= &t7_fdiv5.hw,
+	[CLKID_FDIV7_DIV]	= &t7_fdiv7_div.hw,
+	[CLKID_FDIV7]		= &t7_fdiv7.hw,
+};
+
+static const struct meson_clkc_data t7_fpll_data = {
+	.hw_clks = {
+		.hws = t7_fpll_hw_clks,
+		.num = ARRAY_SIZE(t7_fpll_hw_clks),
+	},
+};
+
 static const struct of_device_id t7_pll_clkc_match_table[] = {
 	{ .compatible = "amlogic,t7-gp0-pll",	.data = &t7_gp0_data, },
 	{ .compatible = "amlogic,t7-gp1-pll",	.data = &t7_gp1_data, },
@@ -1055,6 +1311,7 @@ static const struct of_device_id t7_pll_clkc_match_table[] = {
 	{ .compatible = "amlogic,t7-mpll",	.data = &t7_mpll_data, },
 	{ .compatible = "amlogic,t7-hdmi-pll",	.data = &t7_hdmi_data, },
 	{ .compatible = "amlogic,t7-mclk-pll",	.data = &t7_mclk_data, },
+	{ .compatible = "amlogic,t7-fpll",	.data = &t7_fpll_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, t7_pll_clkc_match_table);
-- 
2.49.0

