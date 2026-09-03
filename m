Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9B37105A;
	Thu,  3 Sep 2026 12:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437131; cv=none; b=WXor5qxwc5EhVL/dSEJJiPNFmdsYm6ITrz4BaPmFjTCBx+Ira6hRUFrD26snjXkdhW9CglQISr39Y1zet5nFLcziiBMFK+x1IIOjGkju6jBNv7xh9mhfdFlQXvXt3y8HkX6n1Lg+0oHAK8l05SadSnwVbWpcQy17kmQ80ZNqza4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437131; c=relaxed/simple;
	bh=ThL/82cWKySZlh3QlVWCobrp2t1OrIWKJZGWRJVKYpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxJeujavGM94CvVEeEIvPOFKuzT7Ak3fUtJX7d3MOR6g9CAB2eHNysuiB6v0Q9ttJpFKP6C0GEpc1On5tnvJ03GRvnFZbLtrUxYTgr8mR911KOF56gqDx2MWg+g9CgxXNQPNxcX6xagnj7Q/MpWOs3xxzecd7okwZ2s/FJNSIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233D21F000E9;
	Thu,  3 Sep 2026 12:05:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen3: Use FIELD_GET()
Date: Thu,  3 Sep 2026 14:05:25 +0200
Message-ID: <17c50847f86b814150573e34cc64913f09598f0f.1788437047.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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
rcar-gen3-cpg.c source file out of the rcar-gen3-cpg.h header file.
Add comments where appropriate.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v7.4.

 drivers/clk/renesas/rcar-gen3-cpg.c | 15 +++++++++------
 drivers/clk/renesas/rcar-gen3-cpg.h |  3 +--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index e5b503332217dcdc..bbb76e4fa333553d 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -36,7 +36,11 @@
 
 #define CPG_PLLnCR_STC_MASK	GENMASK(30, 24)	/* PLL Circuit Mult. Ratio */
 
-#define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
+#define CPG_RPCCKCR		0x238	/* RPC-IF Clock Frequency Control Reg */
+#define CPG_RPCCKCR_DIV_RPCSRC	GENMASK(4, 3)	/* RPCSRC divider */
+
+#define CPG_RCKCR_CKSEL		BIT(15)		/* RCLK Clock Source Select */
+#define CPG_RCKCR_DIV		GENMASK(5, 0)	/* RCLK Division Ratio */
 
 /* PLL Clocks */
 struct cpg_pll_clk {
@@ -395,7 +399,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		 * the multiplier value.
 		 */
 		value = readl(base + CPG_PLL4CR);
-		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		mult = (FIELD_GET(CPG_PLLnCR_STC_MASK, value) + 1) * 2;
 		break;
 
 	case CLK_TYPE_GEN3_SDH:
@@ -420,7 +424,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 			 * RINT is default.
 			 * Only if EXTALR is populated, we switch to it.
 			 */
-			value = readl(csn->reg) & 0x3f;
+			value = readl(csn->reg) & CPG_RCKCR_DIV;
 
 			if (clk_get_rate(clks[cpg_clk_extalr])) {
 				parent = clks[cpg_clk_extalr];
@@ -496,9 +500,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		 * MD[4:1] pins and CPG_RPCCKCR[4:3] register value for
 		 * which has been set prior to booting the kernel.
 		 */
-		value = (readl(base + CPG_RPCCKCR) & GENMASK(4, 3)) >> 3;
-
-		switch (value) {
+		value = readl(base + CPG_RPCCKCR);
+		switch (FIELD_GET(CPG_RPCCKCR_DIV_RPCSRC, value)) {
 		case 0:
 			div = 5;
 			break;
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index d15a5d1df71c788b..fa25911b993edfb9 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -76,8 +76,7 @@ struct rcar_gen3_cpg_pll_config {
 	u8 osc_prediv;
 };
 
-#define CPG_RPCCKCR	0x238
-#define CPG_RCKCR	0x240
+#define CPG_RCKCR		0x240	/* RCLK Frequency Control Register */
 
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
-- 
2.43.0

