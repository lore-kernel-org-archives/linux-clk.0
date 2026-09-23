Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6405B3B2D04;
	Wed, 23 Sep 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154747; cv=none; b=YlyWOd8fMB5eAdrvWaDlfHIfeexT7ezvqdMP2icT/EqfxxKLi50SuaHPvRzRrFkhNh+gccvyEGSCoHICjn3Zfvheehd5w2tLMpzIGQMqzJxLapV8atL5UFLeiw9TjRpFu9Pon7U+i9vEkrupOSSV6UhumJW4JPeVSNs26s++B60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154747; c=relaxed/simple;
	bh=0tTdfhEMY/idwlv+Ev6plwh4HQeV4Piw+M0FylkgFoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6cLtV3TT9yUrsHCoxgg4wLjgBY53a2L81qzdhEdccdW2vl9rX5gZ/shvVjffT2FZMxt68Twrd7AeYPMq64f8hayRsmEL2fr0o2DA5WvZa3epMbVQt0g38d1Q9bvzcZiWfWloJotvrQfkxmJkjhn+gpFjedUdfivUK5PVDWJl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213471F000FF;
	Wed, 23 Sep 2026 09:12:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rzg2l: Fix internal clock names
Date: Wed, 23 Sep 2026 11:12:18 +0200
Message-ID: <8254a5b1dccf33252042a366a3839a70020d6487.1790154594.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By convention, internal clock names start with a dot and use lower-case.
Fix the outliers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v7.4.

 drivers/clk/renesas/r9a07g043-cpg.c | 12 ++++++------
 drivers/clk/renesas/r9a07g044-cpg.c | 12 ++++++------
 drivers/clk/renesas/r9a08g045-cpg.c |  6 +++---
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 59d6ee2e888fa706..f7e32abc5d0b3109 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -119,7 +119,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_400", CLK_PLL3_400, CLK_PLL3, 1, 4),
 	DEF_FIXED(".pll3_533", CLK_PLL3_533, CLK_PLL3, 1, 3),
 	DEF_MUX_RO(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3, sel_pll3_3),
-	DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3, DIVPL3C, dtable_1_32),
+	DEF_DIV(".divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3, DIVPL3C, dtable_1_32),
 #ifdef CONFIG_ARM64
 	DEF_FIXED(".pll5", CLK_PLL5, CLK_EXTAL, 125, 1),
 	DEF_FIXED(".pll5_500", CLK_PLL5_500, CLK_PLL5, 1, 6),
@@ -135,7 +135,7 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_FIXED("P0_DIV2", R9A07G043_CLK_P0_DIV2, R9A07G043_CLK_P0, 1, 2),
 	DEF_FIXED("TSU", R9A07G043_CLK_TSU, CLK_PLL2_DIV2_10, 1, 1),
 	DEF_DIV("P1", R9A07G043_CLK_P1, CLK_PLL3_DIV2_4, DIVPL3B, dtable_1_32),
-	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G043_CLK_P1, 1, 2),
+	DEF_FIXED(".p1_div2", CLK_P1_DIV2, R9A07G043_CLK_P1, 1, 2),
 	DEF_DIV("P2", R9A07G043_CLK_P2, CLK_PLL3_DIV2_4_2, DIVPL3A, dtable_1_32),
 	DEF_FIXED("M0", R9A07G043_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
 	DEF_FIXED("ZT", R9A07G043_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
@@ -151,12 +151,12 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 	DEF_SD_MUX("SD1", R9A07G043_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_sdhi,
 		   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-	DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G043_CLK_SD0, 1, 4),
-	DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G043_CLK_SD1, 1, 4),
+	DEF_FIXED(".sd0_div4", CLK_SD0_DIV4, R9A07G043_CLK_SD0, 1, 4),
+	DEF_FIXED(".sd1_div4", CLK_SD1_DIV4, R9A07G043_CLK_SD1, 1, 4),
 #ifdef CONFIG_ARM64
 	DEF_FIXED("M2", R9A07G043_CLK_M2, CLK_PLL3_533, 1, 2),
-	DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G043_CLK_M2, 1, 2),
-	DEF_DSI_DIV("DSI_DIV", CLK_DSI_DIV, CLK_PLL5_FOUTPOSTDIV, CLK_SET_RATE_PARENT),
+	DEF_FIXED(".m2_div2", CLK_M2_DIV2, R9A07G043_CLK_M2, 1, 2),
+	DEF_DSI_DIV(".dsi_div", CLK_DSI_DIV, CLK_PLL5_FOUTPOSTDIV, CLK_SET_RATE_PARENT),
 	DEF_FIXED("M3", R9A07G043_CLK_M3, CLK_DSI_DIV, 1, 1),
 #endif
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 913cca6dd46fc52c..3b6d0bd1ec134ba8 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -187,7 +187,7 @@ static const struct {
 		DEF_FIXED(".pll3_div2_4", CLK_PLL3_DIV2_4, CLK_PLL3_DIV2, 1, 4),
 		DEF_FIXED(".pll3_div2_4_2", CLK_PLL3_DIV2_4_2, CLK_PLL3_DIV2_4, 1, 2),
 		DEF_MUX_RO(".sel_pll3_3", CLK_SEL_PLL3_3, SEL_PLL3_3, sel_pll3_3),
-		DEF_DIV("divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3, DIVPL3C, dtable_1_32),
+		DEF_DIV(".divpl3c", CLK_DIV_PLL3_C, CLK_SEL_PLL3_3, DIVPL3C, dtable_1_32),
 
 		DEF_FIXED(".pll5_250", CLK_PLL5_250, CLK_PLL5_FOUT3, 1, 2),
 		DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
@@ -204,7 +204,7 @@ static const struct {
 		DEF_FIXED("P0_DIV2", R9A07G044_CLK_P0_DIV2, R9A07G044_CLK_P0, 1, 2),
 		DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV2_10, 1, 1),
 		DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4, DIVPL3B, dtable_1_32),
-		DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
+		DEF_FIXED(".p1_div2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
 		DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2, DIVPL3A, dtable_1_32),
 		DEF_FIXED("M0", R9A07G044_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
 		DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
@@ -215,13 +215,13 @@ static const struct {
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
 		DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1, SEL_SDHI1_STS, sel_sdhi,
 			   mtable_sdhi, 0, rzg2l_cpg_sd_clk_mux_notifier),
-		DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
-		DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
+		DEF_FIXED(".sd0_div4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
+		DEF_FIXED(".sd1_div4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
 		DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_GPU2, DIVGPU, dtable_1_8),
 		DEF_FIXED("M1", R9A07G044_CLK_M1, CLK_PLL5_FOUTPOSTDIV, 1, 1),
 		DEF_FIXED("M2", R9A07G044_CLK_M2, CLK_PLL3_533, 1, 2),
-		DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G044_CLK_M2, 1, 2),
-		DEF_DSI_DIV("DSI_DIV", CLK_DSI_DIV, CLK_SEL_PLL5_4, CLK_SET_RATE_PARENT),
+		DEF_FIXED(".m2_div2", CLK_M2_DIV2, R9A07G044_CLK_M2, 1, 2),
+		DEF_DSI_DIV(".dsi_div", CLK_DSI_DIV, CLK_SEL_PLL5_4, CLK_SET_RATE_PARENT),
 		DEF_FIXED("M3", R9A07G044_CLK_M3, CLK_DSI_DIV, 1, 1),
 		DEF_FIXED("M4", R9A07G044_CLK_M4, CLK_DIV_DSI_LPCLK, 1, 1),
 	},
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index ea2a6a71aebd71c2..4e1cd3177ecd8615 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -167,14 +167,14 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 	DEF_FIXED("M0", R9A08G045_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
 	DEF_G3S_DIV("P1", R9A08G045_CLK_P1, CLK_PLL3_DIV2_4, DIVPL3A, G3S_DIVPL3A_STS,
 		    dtable_1_32, 0, 0, 0, NULL),
-	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A08G045_CLK_P1, 1, 2),
+	DEF_FIXED(".p1_div2", CLK_P1_DIV2, R9A08G045_CLK_P1, 1, 2),
 	DEF_G3S_DIV("P2", R9A08G045_CLK_P2, CLK_PLL3_DIV2_8, DIVPL3B, G3S_DIVPL3B_STS,
 		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G045_CLK_P3, CLK_PLL3_DIV2_4, DIVPL3C, G3S_DIVPL3C_STS,
 		    dtable_1_32, 0, 0, 0, NULL),
-	DEF_FIXED("P3_DIV2", CLK_P3_DIV2, R9A08G045_CLK_P3, 1, 2),
+	DEF_FIXED(".p3_div2", CLK_P3_DIV2, R9A08G045_CLK_P3, 1, 2),
 	DEF_FIXED("P4", R9A08G045_CLK_P4, CLK_PLL2_DIV2, 1, 5),
-	DEF_FIXED("P4_DIV2", CLK_P4_DIV2, R9A08G045_CLK_P4, 1, 2),
+	DEF_FIXED(".p4_div2", CLK_P4_DIV2, R9A08G045_CLK_P4, 1, 2),
 	DEF_FIXED("P5", R9A08G045_CLK_P5, CLK_PLL2_DIV2, 1, 4),
 	DEF_FIXED("ZT", R9A08G045_CLK_ZT, CLK_PLL3_DIV2_8, 1, 1),
 	DEF_FIXED("S0", R9A08G045_CLK_S0, CLK_SEL_PLL4, 1, 2),
-- 
2.43.0

