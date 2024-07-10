Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BFE192B69
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617061; cv=none; b=R15FNC6Xui4dGipd4+8NG3sCmaGdWUuH3oLT6A8OW3lKh2/Si0S2gXSn3rUIQtMig8927HpYVLmNIbHA1PfAgCouIeI8ThBk/hZ1IaP+bo4gver5b9CqRmtvDlskNyvNrPR0fgTuouzkLwUONPMedX0FlUagHBPo36mD2Julsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617061; c=relaxed/simple;
	bh=qc9jySmhbhghor/UZ/lBr/egEY0xGdfx8JHomyvn0FA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tEF8Y0wi2LTrBhgbo/KSa5UQTX5SpTdYHCrJbjVSyQs+ddNqwQEQinWNE4/5TiUS2f4oi3AhttxBZQlPAYQUQwyqDy3emml8HxykVeTozFACa+4qL6BtxIpRMq2bFUgo7ZPmkQkY9FX6H3KvXnKhAnWaWwcL8OfdR3CIyVefUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by baptiste.telenet-ops.be with bizsmtp
	id lpAp2C00k4znMfS01pApdG; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5g-001cTs-5q;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQCd-Ok;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 14/14] clk: renesas: rcar-gen4: Remove unused fixed PLL clock types
Date: Wed, 10 Jul 2024 15:10:48 +0200
Message-Id: <ac9ec7b9b9bb1ea4c82cf1420448aec776bb7876.1720616233.git.geert+renesas@glider.be>
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

All users of the fixed default PLL2/3/4/6 clock types have been
converted to fixed or variable fractional PLL clock types.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 20 --------------------
 drivers/clk/renesas/rcar-gen4-cpg.h |  4 ----
 2 files changed, 24 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 5fcfd0b4f1216beb..b180ca286c913c6c 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -439,31 +439,11 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
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
index 9bca280a924fde13..13f4ae28c5041433 100644
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

