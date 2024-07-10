Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1D5192B69
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617057; cv=none; b=pYFgtr9wHyZjjlid8LkHrtN5ygbIifXq4aiVikQZJj0PeUh8FNv0cGkApZ7qyz9bG7dO/npQZtHTNzbt1HVmIXVqfn/h1EWpNJ05kTecKFKFyx4YBhaIqQq872bXMJyYDDCTsMi2L4DFy62DcXAJsV7Ebjs7cIbK8Tb7yNZ2v4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617057; c=relaxed/simple;
	bh=i8FmB2FewFO6W+F454TlJcpbHgBsZJrrz/h/NZvUENM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i+Sao53NFS1NvivU22WP4NUmVqAmtFHDO+7ZPi8QFF7/3ZsFmBRpS1GGEqFtT6xpzOr9c9kRhDzHBbd67NCLwUKXlcp/dyCdtNZr7ycqWj1lEfbR17I1wq4SmOd8plPEQwD58HLfau+CBkF1PvT4Q36sijOeziBS+sz0EcLGkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2340:18a1:4138:37d2])
	by laurent.telenet-ops.be with bizsmtp
	id lpAp2C00C4znMfS01pApEy; Wed, 10 Jul 2024 15:10:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5f-001cTA-R4;
	Wed, 10 Jul 2024 15:10:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRX5t-00CQBl-DI;
	Wed, 10 Jul 2024 15:10:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/14] clk: renesas: rcar-gen4: Use FIELD_GET()
Date: Wed, 10 Jul 2024 15:10:37 +0200
Message-Id: <62ef9e93807f18e62b3f58445aedd7aeaa2adf5e.1720616233.git.geert+renesas@glider.be>
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

Improve readability by using the FIELD_GET() helper instead of
open-coding the same operation, and by adding field definitions to get
rid of hardcoded values.

While at it, move register definitions that are only used inside the
rcar-gen4-cpg.c source file out of the rcar-gen4-cpg.h header file.
Add a "CPG_" prefix to SD0CKCR1.  Add comments where appropriate.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen4-cpg.c | 13 +++++++++++--
 drivers/clk/renesas/rcar-gen4-cpg.h |  3 ---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index cd8799e04b37556e..ae18470d9732ec3a 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -55,6 +55,14 @@ static u32 cpg_mode __initdata;
 /* Fractional 8.25 PLL */
 #define CPG_PLLxCR0_NI8		GENMASK(27, 20)	/* Integer mult. factor */
 
+#define CPG_PLLxCR_STC		GENMASK(30, 24)	/* R_Car V3U PLLxCR */
+
+#define CPG_RPCCKCR		0x874	/* RPC Clock Freq. Control Register */
+
+#define CPG_SD0CKCR1		0x8a4	/* SD-IF0 Clock Freq. Control Reg. 1 */
+
+#define CPG_SD0CKCR1_SDSRC_SEL	GENMASK(30, 29)	/* SDSRC clock freq. select */
+
 /* PLL Clocks */
 struct cpg_pll_clk {
 	struct clk_hw hw;
@@ -392,7 +400,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN4_PLL2X_3X:
 		value = readl(base + core->offset);
-		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		mult = (FIELD_GET(CPG_PLLxCR_STC, value) + 1) * 2;
 		break;
 
 	case CLK_TYPE_GEN4_Z:
@@ -400,7 +408,8 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
 					  base, core->div, core->offset);
 
 	case CLK_TYPE_GEN4_SDSRC:
-		div = ((readl(base + SD0CKCR1) >> 29) & 0x03) + 4;
+		value = readl(base + CPG_SD0CKCR1);
+		div = FIELD_GET(CPG_SD0CKCR1_SDSRC_SEL, value) + 4;
 		break;
 
 	case CLK_TYPE_GEN4_SDH:
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 006537e29e4eb10e..d0329ac84730d681 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -67,9 +67,6 @@ struct rcar_gen4_cpg_pll_config {
 	u8 osc_prediv;
 };
 
-#define CPG_RPCCKCR	0x874
-#define SD0CKCR1	0x8a4
-
 struct clk *rcar_gen4_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
-- 
2.34.1

