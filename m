Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BCE16D31F
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649560; cv=none; b=BtV4FPCzWn9vLrnJypp9AEr7UO7gg7QoI60a2TS4ksQjRnB4N918vYZ92QankeDIo2tdQx8f5FBN8vlGxv1I61LiOoJd+Vn1m8NHIf6UpggHu5QnMMZxVbX3JrkT6KF3FGZkgRJATzZ9k2SE5kojNBYAD9Vl6AL2tmWfiXh93yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649560; c=relaxed/simple;
	bh=1JGBM2c2i0taYR3WRvlCq854iuRTAD2V7HF0ASv/PVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B73/Q0KBBtnqQsCfmjsabUYNgXVi5IJ33tHY8bclZSud9mxh3yyvQLCAvTgKqwmXp21ToHH2TC6jBL6g9biQVu0RaDk+7vLuDoYx0KW6oXzi1I4GziupcX5ztbQWXCwpiKwGunsxYW8TdfOqzqJUaKSTpAK/yDpLU2VtIGUqa9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4WSJWS2YRPz4x1Pd
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 13:50:44 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by laurent.telenet-ops.be with bizsmtp
	id qbqd2C0051wvoRx01bqdRA; Mon, 22 Jul 2024 13:50:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYY-002zB6-En;
	Mon, 22 Jul 2024 13:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrYq-0020iX-UQ;
	Mon, 22 Jul 2024 13:50:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 14/15] clk: renesas: rcar-gen4: Remove unused fixed PLL clock types
Date: Mon, 22 Jul 2024 13:50:34 +0200
Message-Id: <c0229eb3518444f61173c6fb83bdcedb058dd079.1721648548.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721648548.git.geert+renesas@glider.be>
References: <cover.1721648548.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All users of the fixed default PLL2/3/4/6 clock types have been
converted to fixed or variable fractional PLL clock types.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 20 --------------------
 drivers/clk/renesas/rcar-gen4-cpg.h |  4 ----
 2 files changed, 24 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 2a0f520d56b5aa96..31aa790fd003d45e 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -440,31 +440,11 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll1_div;
 		break;
 
-	case CLK_TYPE_GEN4_PLL2:
-		mult = cpg_pll_config->pll2_mult;
-		div = cpg_pll_config->pll2_div;
-		break;
-
-	case CLK_TYPE_GEN4_PLL3:
-		mult = cpg_pll_config->pll3_mult;
-		div = cpg_pll_config->pll3_div;
-		break;
-
-	case CLK_TYPE_GEN4_PLL4:
-		mult = cpg_pll_config->pll4_mult;
-		div = cpg_pll_config->pll4_div;
-		break;
-
 	case CLK_TYPE_GEN4_PLL5:
 		mult = cpg_pll_config->pll5_mult;
 		div = cpg_pll_config->pll5_div;
 		break;
 
-	case CLK_TYPE_GEN4_PLL6:
-		mult = cpg_pll_config->pll6_mult;
-		div = cpg_pll_config->pll6_div;
-		break;
-
 	case CLK_TYPE_GEN4_PLL2X_3X:
 		value = readl(base + core->offset);
 		mult = (FIELD_GET(CPG_PLLxCR_STC, value) + 1) * 2;
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 2dadacacf3f911e2..fccc3090c7c34b70 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -12,12 +12,8 @@
 enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
 	CLK_TYPE_GEN4_PLL1,
-	CLK_TYPE_GEN4_PLL2,
 	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
-	CLK_TYPE_GEN4_PLL3,
-	CLK_TYPE_GEN4_PLL4,
 	CLK_TYPE_GEN4_PLL5,
-	CLK_TYPE_GEN4_PLL6,
 	CLK_TYPE_GEN4_PLL_F8_25,	/* Fixed fractional 8.25 PLL */
 	CLK_TYPE_GEN4_PLL_V8_25,	/* Variable fractional 8.25 PLL */
 	CLK_TYPE_GEN4_PLL_F9_24,	/* Fixed fractional 9.24 PLL */
-- 
2.34.1

