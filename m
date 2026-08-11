Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DEA37F8D7
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472870; cv=none; b=csv9BgCbAUiUDxlv79iTEpnYNYnzjxf3MzD8+qeb4ln2iV/M8OkxC8cZjTwqEDRYRg9KXyV6gEEyD7QmObQPnShfMJEPbEUnTqLVtrDe9KcDgEZq5knztKbBV/x9Irk6pncIPYJdrAD0YggS/FUFVOAZfP81IBzVUPn9u8aMsJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472870; c=relaxed/simple;
	bh=wGpyHaaFxhSkwNklGezxw3kS81xmHkcDmSbp9gMN37s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZIDQ86BnEbBTD4R04q4rkssVF7s7+nbHrrQSIZlVB09OmA0QDrIxsMb/N1Sci8Qcz35yo5IaNPUuLS7cZEmSDaP2GsAuVXIrI9fAdvLEtt9NeyVv2G7srWwkJwXL3F3cwhsDKfOOoyW6MSIvslJ8nhZ4O4whuhwrr+PASEvKPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQh6RFeR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQh6RFeR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4980dc26022so1038375e9.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472859; x=1787077659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0sE0V4BfmXy/Ih+5dsRlbd9vHkXF+1X8Hzp5PM/42Wg=;
        b=IQh6RFeRUjz0jrhWer4IkaGy3z9AykgWBcAiv/lVGwhgdlQl5NDL+QJOzDPO7TMTM+
         xDldYufzqu83S3kS1DAUOKBJ6E7QixpBSOUNFAlcN3uy3pxd+f6osCvrb7vMFuS0gbez
         BHwQUSQLMAqWb8t0NrMhL6jo6GCOtCTlG7F0yj3JNf6YhO3x+yTzgcon5zbHOB/PCtTu
         q2qR+zLgCD6mLkRnAQkh33nhmKgWaSwAT3WT255AMnzLb99afKpnpPOv8xt6E+3jcJhw
         5HGRr+HSvycYi+CVLrz/KdVWwtcLLe34iX5KtZCigMl7IJudEFJikODuePq75K8UPOoB
         1m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472859; x=1787077659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0sE0V4BfmXy/Ih+5dsRlbd9vHkXF+1X8Hzp5PM/42Wg=;
        b=tVQugQMz/FPwoMSgjGYwePO3D23tKxgo3qbOBf+7KV5km+eW9aLPo0vpsMotchaTBn
         GD0s+fYpPM3nHTomAJF8gJ4uZBmBGskqMZy/jDSZezg5xhJYwRQRwl78KKHCfq/uc9DA
         QmffeBcWGekYZMgUwxZ0eNK+QMq+Db3hShlHOcnebLte4DROpLHVHtOump0GkcCz9kdk
         Shd8IMQjCyxqVL1bMxkT5xzTS0sSEcBwCQdk119HHREXVCRTRn0BPAv70SrmidL8G9b1
         25Tkyl14RqtL5cjT8VuCMe5tJFTW63VOp4pyXowcsZN4g1ELUifEl1pVYYyjwt5W3S8O
         2cyg==
X-Forwarded-Encrypted: i=1; AHgh+RoLpnYi2y8HkKC3UYqkACyUvf46lcj7+m24tShezOO/uYo6T0iP0hSK9aq4iYs3LwzfwY5BU3MI5uY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhuABGA2ENIDwCIMYeI0vRmw+CJh7s+f7cEgAdIXuVzJC4EDL
	6wMDT9x7M/W0Tku8LjYy7pMcrsmlGKH0MPo3XsoVwccRnSciaMfphpBK
X-Gm-Gg: AR+sD10ZMFD0En+NBzfooRb40pt9G9as5Tfr94vVZeuSVUHVZ62Nw7Pvk5hALimGvpj
	6lAzXECBb36COtzoEb/jpjcVkw8JFXeSubw0CpkVuC2ny2Iq9HIk/2TcGdgCSh04r0QE2EccUIe
	EzTwIWudO9f5f40MgkFfF43jFgMEI5W2/DI2M9FaaCxjgh0n3pIV8MX5sQyf0gQViFUrPr5GThe
	C7eO3vBAhIz5QW5KGJj2Ni0P1adqomcgeoyVuAm23vj0TRBvXZJHK3MmGIaXnMjC+ct9C/4QJJH
	IEUWW7KS939j+cKBvEKmjKdQhaFqajNeU2RqEgbW6cLYM3QZfTTuwGrEsHztC8R8V0RbFZGRRhV
	rWOkURPZwY3nfDo2u4xFdaQcQhOnYL/n64uYmkiSr2MmiSKQuBsomuUypcqWgMUYCs12kAgP0c4
	9s4a2GH7Em2tL3zQgCaL0v2Hvb0j712EyUBOzbaYCmc5hBXda8EnrWuegh/tb0VaT/7GOTPsPvR
	dr7oIPXHCzH
X-Received: by 2002:a05:600c:4ecd:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-4997913e137mr50388685e9.17.1786472859497;
        Tue, 11 Aug 2026 11:27:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 8/9] clk: renesas: r9a08g046: Add MIPI DSI and LCDC clock/reset entries
Date: Tue, 11 Aug 2026 19:27:21 +0100
Message-ID: <20260811182729.360959-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for the MIPI DSI and LCDC peripherals on the
RZ/G3L (R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced M2_DIV7->.m2_div7 as it is internal clock
 * Added DEF_G3L_LVDS_DIV for fixed factor clock with 4:7 duty cycle.
 * Prefix mipi_ added for all DSI clks.
 * Fixed commit header /r9a08g046-cpg/r9a08g046/
 * Sorted DSI entries.
---
 drivers/clk/renesas/r9a08g046-cpg.c | 62 +++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index aaf329081e15..bd3ae08e626b 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -19,26 +19,31 @@
 #define G3L_CPG_PL3_DDIV		(0x208)
 #define G3L_CPG_SDHI_DDIV		(0x218)
 #define G3L_CPG_GE3D_DDIV		(0x224)
+#define G3L_CPG_DSI_DDIV		(0x228)
 #define G3L_CPG_CA55CORE_DDIV		(0x234)
 #define G3L_CPG_RSCI_DDIV		(0x238)
 #define G3L_CPG_RSPI_DDIV		(0x23c)
 #define G3L_CPG_SDHI_DSEL		(0x244)
 #define G3L_CLKDIVSTATUS		(0x280)
 #define G3L_CLKSELSTATUS		(0x284)
+#define G3L_CPG_DSI_SSEL		(0x408)
 #define G3L_CPG_GE3D_SSEL		(0x40c)
 #define G3L_CPG_ETH_SSEL		(0x410)
 #define G3L_CPG_RSCI_SSEL		(0x414)
 #define G3L_CPG_RSPI_SSEL		(0x418)
+#define G3L_CPG_DSI_SDIV		(0x430)
 #define G3L_CPG_ETH_SDIV		(0x434)
 
 /* RZ/G3L Specific division configuration.  */
 #define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
 #define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
 #define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+#define G3L_DIVPL3B		DDIV_PACK(G3L_CPG_PL3_DDIV, 4, 2)
 #define G3L_DIV_CA55_CORE0	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
 #define G3L_DIV_CA55_CORE1	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
 #define G3L_DIV_CA55_CORE2	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
 #define G3L_DIV_CA55_CORE3	DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
+#define G3L_DIV_DSI		DDIV_PACK(G3L_CPG_DSI_DDIV, 0, 2)
 #define G3L_DIV_GE3D		DDIV_PACK(G3L_CPG_GE3D_DDIV, 0, 3)
 #define G3L_DIV_RSCI0		DDIV_PACK(G3L_CPG_RSCI_DDIV, 0, 2)
 #define G3L_DIV_RSCI1		DDIV_PACK(G3L_CPG_RSCI_DDIV, 2, 2)
@@ -50,6 +55,7 @@
 #define G3L_DIV_SDHI0		DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
 #define G3L_DIV_SDHI1		DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
 #define G3L_DIV_SDHI2		DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
+#define G3L_SDIV_DSI_C_SET	DDIV_PACK(G3L_CPG_DSI_SDIV, 8, 1)
 #define G3L_SDIV_ETH_A		DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
 #define G3L_SDIV_ETH_B		DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
 #define G3L_SDIV_ETH_C		DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
@@ -59,6 +65,7 @@
 #define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
+#define G3L_DIVPL3B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 9, 1)
 #define G3L_DIV_CA55_CORE0_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
 #define G3L_DIV_CA55_CORE1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
 #define G3L_DIV_CA55_CORE2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
@@ -74,12 +81,14 @@
 #define G3L_DIV_SDHI1_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 25, 1)
 #define G3L_DIV_SDHI2_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 26, 1)
 #define G3L_DIV_GE3D_STS	DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
+#define G3L_DIV_DSI_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 28, 1)
 
 #define G3L_SEL_SDHI0_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 16, 1)
 #define G3L_SEL_SDHI1_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
 #define G3L_SEL_SDHI2_STS	SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
 
 /* RZ/G3L Specific clocks select. */
+#define G3L_SEL_DSI		SEL_PLL_PACK(G3L_CPG_DSI_SSEL, 0, 1)
 #define G3L_SEL_ETH0_TX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)
 #define G3L_SEL_ETH0_RX		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 1, 1)
 #define G3L_SEL_ETH0_RM		SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 2, 1)
@@ -126,8 +135,11 @@ enum clk_ids {
 	CLK_PLL3_DIV2,
 	CLK_PLL3_DIV2_2,
 	CLK_PLL3_DIV3,
+	CLK_PLL3_DIV6,
 	CLK_PLL6,
 	CLK_PLL6_DIV10,
+	CLK_PLL7,
+	CLK_PLL7_DSI_SDIV,
 	CLK_SEL_ETH0_TX,
 	CLK_SEL_ETH0_RX,
 	CLK_SEL_ETH0_RM,
@@ -149,6 +161,7 @@ enum clk_ids {
 	CLK_ETH0_RM,
 	CLK_ETH1_TR,
 	CLK_ETH1_RM,
+	CLK_M2_DIV7,
 	CLK_SD0_DIV2,
 	CLK_SD1_DIV2,
 	CLK_SD2_DIV2,
@@ -165,6 +178,12 @@ static const struct clk_div_table dtable_1_4[] = {
 	{ 0, 0 },
 };
 
+static const struct clk_div_table dtable_1_2[] = {
+	{ 0, 1 },
+	{ 1, 2 },
+	{ 0, 0 },
+};
+
 static const struct clk_div_table dtable_1_8[] = {
 	{ 0, 1 },
 	{ 1, 2 },
@@ -220,7 +239,16 @@ static const struct clk_div_table dtable_8_256[] = {
 	{ 0, 0 },
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{ 0, 16 },
+	{ 1, 32 },
+	{ 2, 64 },
+	{ 3, 128 },
+	{ 0, 0 },
+};
+
 /* Mux clock names tables. */
+static const char * const sel_dsi[] = { ".m2_div7", ".pll7_dsi_div"};
 static const char * const sel_eth0_tx[] = { ".div_eth0_tr", "eth0_txc_tx_clk" };
 static const char * const sel_eth0_rx[] = { ".div_eth0_tr", "eth0_rxc_rx_clk" };
 static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
@@ -254,6 +282,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, CPG_PLL_CONF(0x50, 0),
 		    500000000UL),
 	DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2, CLK_PLL1, 1, 2),
+	DEF_G3L_PLLDSI(".pll7", CLK_PLL7, CLK_EXTAL, CPG_PLL_CONF(0x80, 0)),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll2_div2_4", CLK_PLL2_DIV2_4, CLK_PLL2_DIV2, 1, 4),
 	DEF_FIXED(".pll2_div5", CLK_PLL2_DIV5, CLK_PLL2, 1, 5),
@@ -262,6 +291,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 	DEF_FIXED(".pll3_div2_2", CLK_PLL3_DIV2_2, CLK_PLL3_DIV2, 1, 2),
 	DEF_FIXED(".pll3_div3", CLK_PLL3_DIV3, CLK_PLL3, 1, 3),
+	DEF_FIXED(".pll3_div6", CLK_PLL3_DIV6, CLK_PLL3, 1, 6),
 	DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
 	DEF_SD_MUX(".sel_sdhi0", CLK_SEL_SDHI0, G3L_SEL_SDHI0, G3L_SEL_SDHI0_STS, sel_sdhi,
 		   mtable_sd, 0, NULL),
@@ -301,6 +331,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P1", R9A08G046_CLK_P1, CLK_PLL3_DIV2, G3L_DIVPL3A, G3L_DIVPL3A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_G3S_DIV("P2", R9A08G046_CLK_P2, CLK_PLL3_DIV2, G3L_DIVPL3B, G3L_DIVPL3B_STS,
+		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
@@ -329,6 +361,15 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED(".sd0_div2", CLK_SD0_DIV2, R9A08G046_CLK_SD0, 1, 2),
 	DEF_FIXED(".sd1_div2", CLK_SD1_DIV2, R9A08G046_CLK_SD1, 1, 2),
 	DEF_FIXED(".sd2_div2", CLK_SD2_DIV2, R9A08G046_CLK_SD2, 1, 2),
+	DEF_G3S_DIV("M1", R9A08G046_CLK_M1, CLK_PLL2_DIV6, G3L_DIV_DSI, G3L_DIV_DSI_STS,
+		    dtable_16_128, 0, 0, 0, NULL),
+	DEF_DIV_FLAGS("M2", R9A08G046_CLK_M2, CLK_PLL7, G3L_SDIV_DSI_C_SET, dtable_1_2,
+		      CLK_SET_RATE_PARENT, CLK_DIVIDER_ROUND_CLOSEST),
+	DEF_G3L_LVDS_DIV(".m2_div7", CLK_M2_DIV7, R9A08G046_CLK_M2, 7),
+	DEF_G3L_DSI_DIV(".pll7_dsi_div", CLK_PLL7_DSI_SDIV, CLK_PLL7, G3L_CPG_DSI_SDIV),
+	DEF_G3L_SEL_DSI_MUX("M3", R9A08G046_CLK_M3, G3L_SEL_DSI, sel_dsi),
+	DEF_FIXED("M4", R9A08G046_CLK_M4, CLK_PLL7, 1, 1),
+	DEF_FIXED("M5", R9A08G046_CLK_M5, CLK_PLL3_DIV6, 1, 2),
 	DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
 	DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
 		      CLK_SET_RATE_PARENT),
@@ -347,6 +388,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_G3S_DIV("G", R9A08G046_CLK_G, CLK_SEL_GE3D, G3L_DIV_GE3D, G3L_DIV_GE3D_STS,
 		    dtable_1_32, 0, 0, 0, NULL),
 	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
+	DEF_FIXED("mipi_dsi_pllclk", R9A08G046_MIPI_DSI_PLLCLK, R9A08G046_CLK_M4, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -400,6 +442,22 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_VIDEO, BIT(12))),
 	DEF_MOD("ge3d_ace_clk",		R9A08G046_GE3D_ACE_CLK, R9A08G046_CLK_P1, 0x558, 2,
 					MSTOP(BUS_PERI_VIDEO, BIT(12))),
+	DEF_MOD("mipi_dsi_sysclk",	R9A08G046_MIPI_DSI_SYSCLK, R9A08G046_CLK_M5, 0x568, 1,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("mipi_dsi_aclk",	R9A08G046_MIPI_DSI_ACLK, R9A08G046_CLK_P1, 0x568, 2,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("mipi_dsi_pclk",	R9A08G046_MIPI_DSI_PCLK, R9A08G046_CLK_P2, 0x568, 3,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("mipi_dsi_vclk",	R9A08G046_MIPI_DSI_VCLK, R9A08G046_CLK_M3, 0x568, 4,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("mipi_dsi_lpclk",	R9A08G046_MIPI_DSI_LPCLK, R9A08G046_CLK_M1, 0x568, 5,
+					MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
+	DEF_MOD("lcdc_clk_a",		R9A08G046_LCDC_CLK_A, R9A08G046_CLK_P1, 0x56c, 0,
+					MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
+	DEF_MOD("lcdc_clk_d",		R9A08G046_LCDC_CLK_D, R9A08G046_CLK_M3, 0x56c, 1,
+					MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
+	DEF_MOD("lcdc_clk_p",		R9A08G046_LCDC_CLK_P, R9A08G046_CLK_P2, 0x56c, 2,
+					MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
 	DEF_MOD("ssi0_pclk2",		R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0,	0x570, 0,
 					MSTOP(BUS_MCPU1, BIT(10))),
 	DEF_MOD("ssi0_pclk_sfr",	R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,
@@ -537,6 +595,10 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_GE3D_RESETN, 0x858, 0),
 	DEF_RST(R9A08G046_GE3D_AXI_RESETN, 0x858, 1),
 	DEF_RST(R9A08G046_GE3D_ACE_RESETN, 0x858, 2),
+	DEF_RST(R9A08G046_MIPI_DSI_CMN_RSTB, 0x868, 0),
+	DEF_RST(R9A08G046_MIPI_DSI_ARESET_N, 0x868, 1),
+	DEF_RST(R9A08G046_MIPI_DSI_PRESET_N, 0x868, 2),
+	DEF_RST(R9A08G046_LCDC_RESET_N, 0x86c, 0),
 	DEF_RST(R9A08G046_SSI0_RST_M2_REG, 0x870, 0),
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
-- 
2.43.0

