Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DAF192B62
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617056; cv=none; b=oTNEgEZKKPBsHxbbZCEL22R4BykI91BWm3SKCBqqtstV5V5QzepIVr1ZIc6yTKmf4/9Q9MuWYlizlSGyfKPMYyJtNsYRPSNLqkwHovUmv2tUODWON8rYZF/PZO8DQUYZ6hp5nyymNCo5X3SK9e9QdnuO5mWMEYSt7BQAOT4Ea74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617056; c=relaxed/simple;
	bh=M40v1S90URYO+AMa8R2GFOh3eRwpbMW52zNqbJQCY8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZrgPZT0ry06FaXut/4dyLiZewkbGGIXffRagBGM4dpHJsi3Yk/S3fHwtyf/YUVzkKd7caHPPHFlg2lQDCZGZ7cfPU62vB0hoKQjMU9kmlO8yyaAatpiamwwp2ayrdPi1nIh7nV6O99ZOwL5HaOkNb+a7/OV7qSnW3SNgHDSNbP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by laurent.telenet-ops.be with bizsmtp
	id lpAp2C00A4znMfS01pApEx; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5f-001cT4-PY;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQBg-Cf;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/14] clk: renesas: rcar-gen4: Clarify custom PLL clock support
Date: Wed, 10 Jul 2024 15:10:36 +0200
Message-Id: <c2ab25a0c1bbbfa1ecd756dff8ff193fd4d8935e.1720616233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720616233.git.geert+renesas@glider.be>
References: <cover.1720616233.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The custom clock driver that models the PLL clocks on R-Car Gen4 assumes
the integer and fractional[*] multiplication field sizes as used on
R-Car V4H and V4M, representing a fractional 8.25 number.

Rename the related definitions, functions, and structures to clarify
this, and to prepare for the advent of support for the different field
sizes on R-Car S4-8.

[*] The fractional part is not yet supported.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 32 +++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 72c740f18ac9b370..cd8799e04b37556e 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -45,7 +45,6 @@ static u32 cpg_mode __initdata;
 #define CPG_PLL6CR1		0x8d8
 
 #define CPG_PLLxCR0_KICK	BIT(31)
-#define CPG_PLLxCR0_NI		GENMASK(27, 20)	/* Integer mult. factor */
 #define CPG_PLLxCR0_SSMODE	GENMASK(18, 16)	/* PLL mode */
 #define CPG_PLLxCR0_SSMODE_FM	BIT(18)	/* Fractional Multiplication */
 #define CPG_PLLxCR0_SSMODE_DITH	BIT(17) /* Frequency Dithering */
@@ -53,6 +52,9 @@ static u32 cpg_mode __initdata;
 #define CPG_PLLxCR0_SSFREQ	GENMASK(14, 8)	/* SSCG Modulation Frequency */
 #define CPG_PLLxCR0_SSDEPT	GENMASK(6, 0)	/* SSCG Modulation Depth */
 
+/* Fractional 8.25 PLL */
+#define CPG_PLLxCR0_NI8		GENMASK(27, 20)	/* Integer mult. factor */
+
 /* PLL Clocks */
 struct cpg_pll_clk {
 	struct clk_hw hw;
@@ -63,19 +65,19 @@ struct cpg_pll_clk {
 
 #define to_pll_clk(_hw)   container_of(_hw, struct cpg_pll_clk, hw)
 
-static unsigned long cpg_pll_clk_recalc_rate(struct clk_hw *hw,
-					     unsigned long parent_rate)
+static unsigned long cpg_pll_8_25_clk_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
 	unsigned int mult;
 
-	mult = FIELD_GET(CPG_PLLxCR0_NI, readl(pll_clk->pllcr0_reg)) + 1;
+	mult = FIELD_GET(CPG_PLLxCR0_NI8, readl(pll_clk->pllcr0_reg)) + 1;
 
 	return parent_rate * mult * 2;
 }
 
-static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
-				      struct clk_rate_request *req)
+static int cpg_pll_8_25_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	unsigned int min_mult, max_mult, mult;
 	unsigned long prate;
@@ -93,8 +95,8 @@ static int cpg_pll_clk_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long parent_rate)
+static int cpg_pll_8_25_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
 {
 	struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
 	unsigned int mult;
@@ -106,8 +108,8 @@ static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (readl(pll_clk->pllcr0_reg) & CPG_PLLxCR0_KICK)
 		return -EBUSY;
 
-	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_NI,
-		       FIELD_PREP(CPG_PLLxCR0_NI, mult - 1));
+	cpg_reg_modify(pll_clk->pllcr0_reg, CPG_PLLxCR0_NI8,
+		       FIELD_PREP(CPG_PLLxCR0_NI8, mult - 1));
 
 	/*
 	 * Set KICK bit in PLLxCR0 to update hardware setting and wait for
@@ -128,10 +130,10 @@ static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				  val & pll_clk->pllecr_pllst_mask, 0, 1000);
 }
 
-static const struct clk_ops cpg_pll_clk_ops = {
-	.recalc_rate = cpg_pll_clk_recalc_rate,
-	.determine_rate = cpg_pll_clk_determine_rate,
-	.set_rate = cpg_pll_clk_set_rate,
+static const struct clk_ops cpg_pll_v8_25_clk_ops = {
+	.recalc_rate = cpg_pll_8_25_clk_recalc_rate,
+	.determine_rate = cpg_pll_8_25_clk_determine_rate,
+	.set_rate = cpg_pll_8_25_clk_set_rate,
 };
 
 static struct clk * __init cpg_pll_clk_register(const char *name,
@@ -151,7 +153,7 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	init.ops = &cpg_pll_clk_ops;
+	init.ops = &cpg_pll_v8_25_clk_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-- 
2.34.1

