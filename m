Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCA4223323;
	Sun, 25 Jan 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769367808; cv=none; b=Y9sI7Evm3nHm+QvHXaX70tN9K9BPq853ol5SNn+UmEkeIIpq600hOGlKyZgCwCnVWPI6gGAl2NxGrsP8iyjcYAOjfiSxO+62O+qg6TzW/kA2XOLasAJGleQAmWm1Lq7GjIiMXgSHXfNw4JO5WQ35ekQkGP7WeemTzZsZLS0dOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769367808; c=relaxed/simple;
	bh=PfOGeA0P6Mmy416VcisXwcbkWxPDJeL/9GAFax4cBoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJ/6cu4Rq9ZCrK2DOgy1gmNg71No61Z/XmF3or4YHKQgfhWb6/mZHBW9FjCnCxFjRsP6Sta7L5EMGdAVJneqwrdxHxIN2AgbqGDfxYSUju1Ls7ePqIKTeOcPYMEAXqLbC/s09JmiJAAO3n19ckbWcW3mQfI1sxOSwfv2iuQVKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Jik4qdw8QB+2QUVeFq/xDg==
X-CSE-MsgGUID: 6/dgqCt5SDeT+qV7F6nbcA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2026 04:03:17 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B20E4032E06;
	Mon, 26 Jan 2026 04:03:15 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: renesas: r9a09g057: Fix ordering of module clocks array
Date: Sun, 25 Jan 2026 19:03:14 +0000
Message-ID: <20260125190314.26729-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The r9a09g057_mod_clks array is sorted by CPG_CLKON register number and
bit position. Move the RTC and RSPI module clock entries to their correct
position to restore the array sort order.

Fixes: 2efea3b35cc9 ("clk: renesas: r9a09g057: Add entries for RSCIs")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 40 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 6943cad318b5..b0e43e5e50dd 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -296,6 +296,26 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
 						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("rtc_0_clk_rtc",		CLK_PLLCM33_DIV16, 5, 3, 2, 19,
+						BUS_MSTOP(3, BIT(11) | BIT(12))),
+	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 5, 2, 21,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_0_tclk",			CLK_PLLCLN_DIV8, 5, 6, 2, 22,
+						BUS_MSTOP(11, BIT(0))),
+	DEF_MOD("rspi_1_pclk",			CLK_PLLCLN_DIV8, 5, 7, 2, 23,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 8, 2, 24,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_1_tclk",			CLK_PLLCLN_DIV8, 5, 9, 2, 25,
+						BUS_MSTOP(11, BIT(1))),
+	DEF_MOD("rspi_2_pclk",			CLK_PLLCLN_DIV8, 5, 10, 2, 26,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 11, 2, 27,
+						BUS_MSTOP(11, BIT(2))),
+	DEF_MOD("rspi_2_tclk",			CLK_PLLCLN_DIV8, 5, 12, 2, 28,
+						BUS_MSTOP(11, BIT(2))),
 	DEF_MOD("rsci0_pclk",			CLK_PLLCLN_DIV16, 5, 13, 2, 29,
 						BUS_MSTOP(11, BIT(3))),
 	DEF_MOD("rsci0_tclk",			CLK_PLLCLN_DIV16, 5, 14, 2, 30,
@@ -396,26 +416,6 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(11, BIT(12))),
 	DEF_MOD("rsci9_ps_ps1_n",		CLK_PLLCLN_DIV64, 8, 14, 4, 14,
 						BUS_MSTOP(11, BIT(12))),
-	DEF_MOD("rtc_0_clk_rtc",		CLK_PLLCM33_DIV16, 5, 3, 2, 19,
-						BUS_MSTOP(3, BIT(11) | BIT(12))),
-	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
-						BUS_MSTOP(11, BIT(0))),
-	DEF_MOD("rspi_0_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 5, 2, 21,
-						BUS_MSTOP(11, BIT(0))),
-	DEF_MOD("rspi_0_tclk",			CLK_PLLCLN_DIV8, 5, 6, 2, 22,
-						BUS_MSTOP(11, BIT(0))),
-	DEF_MOD("rspi_1_pclk",			CLK_PLLCLN_DIV8, 5, 7, 2, 23,
-						BUS_MSTOP(11, BIT(1))),
-	DEF_MOD("rspi_1_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 8, 2, 24,
-						BUS_MSTOP(11, BIT(1))),
-	DEF_MOD("rspi_1_tclk",			CLK_PLLCLN_DIV8, 5, 9, 2, 25,
-						BUS_MSTOP(11, BIT(1))),
-	DEF_MOD("rspi_2_pclk",			CLK_PLLCLN_DIV8, 5, 10, 2, 26,
-						BUS_MSTOP(11, BIT(2))),
-	DEF_MOD("rspi_2_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 11, 2, 27,
-						BUS_MSTOP(11, BIT(2))),
-	DEF_MOD("rspi_2_tclk",			CLK_PLLCLN_DIV8, 5, 12, 2, 28,
-						BUS_MSTOP(11, BIT(2))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
 	DEF_MOD("i3c_0_pclkrw",			CLK_PLLCLN_DIV16, 9, 0, 4, 16,
-- 
2.51.0

