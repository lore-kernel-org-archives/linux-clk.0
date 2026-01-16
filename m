Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132B3A9630;
	Fri, 16 Jan 2026 20:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594068; cv=none; b=rornZyG71VmSWJJlxISa/bVau3uj/FE/4WbhW4KjCIIRo2RjmAIXMPonJE14jH9hJoAxBLdjVtny3SdkixfwlsQ5Ibv+qYrhmN5Wt/hXlWCYfLJLNfQDhCOAp1pECbvWgaS7Fo9AsUTzGmLNUskRR0+pWfRZlChv3Br++Yz2d+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594068; c=relaxed/simple;
	bh=ZQjcyRY9e5iNE8CAhpxZuNgtiYbb5egXID9V0jq/KLA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXrL0A2O6z6BocvoVzvUQKokMp2/eimid+Fx7bXthDVHRxj3RMx/PbJQ1KblIFHzcieGDsyJUNLA3rs0b1ChX7Hmgc0s8b2j7ZJ3BAnEom4a9XQGGQ6SYS5oWLqPlJdK7zVOa1jnV1IBNiUzNupmRuwHMzXsFzc1xunQofRsB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vK1xaxNP; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vK1xaxNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594065; x=1800130065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZQjcyRY9e5iNE8CAhpxZuNgtiYbb5egXID9V0jq/KLA=;
  b=vK1xaxNP79dNCw9VBO0EWb1M7SDwV2v2iXBIGdrxNMhtsLtJWRqafKZn
   w9sXYrTHv6zvxaukMoU3+s/V11EuXxQ69P16CscGxdXmIaV5WTbjnk7OY
   EMeo8UHzA67TXq80V3lBg74x8Ze2KEbIxyWE5XpuwfKz9qQcJgDrWKDyA
   XlZzMCGPofrXXtO11qDK/SBYOaQzuedM20r8wS4pm5u/Ff37Fa1YBu2W0
   7TVePQVTLM8hlB8wi8MhECSllSzis2pvY7XfOr7rTxN9E/FY3FBt8weEH
   I40WkfSdcZ5oN/8ejB07CAhGgTfMHCO3j/Z6fIR0EbHXg05RZxA7EEzOs
   w==;
X-CSE-ConnectionGUID: 3LvvvroxTJyR6T9mab+TNA==
X-CSE-MsgGUID: HoJZ+6TzRu23azwuOoT4DA==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="51290366"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2026 13:07:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Jan 2026 13:07:04 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:04 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 09/31] clk: at91: clk-programmable: use clk_parent_data
Date: Fri, 16 Jan 2026 13:07:02 -0700
Message-ID: <6139b579434c16fefacd3635d2c7ea67b9ef7822.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Use struct clk_parent_data instead of struct parent_hw as this leads
to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
conversion of existing SoC specific clock drivers from parent_names to
modern clk_parent_data structures.

Subsequent patches will aim to completely remove __clk_get_hw().

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add the clk-programmable changes to the
SAMA7D65 and SAM9X75 SoCs.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-programmable.c |  8 ++++----
 drivers/clk/at91/pmc.h              |  2 +-
 drivers/clk/at91/sam9x7.c           | 16 ++++++++--------
 drivers/clk/at91/sama7d65.c         | 20 ++++++++++----------
 drivers/clk/at91/sama7g5.c          | 20 ++++++++++----------
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 1195fb405503..275ca701f294 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -215,7 +215,7 @@ static const struct clk_ops programmable_ops = {
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap,
 			       const char *name, const char **parent_names,
-			       struct clk_hw **parent_hws, u8 num_parents, u8 id,
+			       struct clk_parent_data *parent_data, u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table)
 {
@@ -224,7 +224,7 @@ at91_clk_register_programmable(struct regmap *regmap,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (id > PROG_ID_MAX || !(parent_names || parent_hws))
+	if (id > PROG_ID_MAX || !(parent_names || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	prog = kzalloc(sizeof(*prog), GFP_KERNEL);
@@ -233,8 +233,8 @@ at91_clk_register_programmable(struct regmap *regmap,
 
 	init.name = name;
 	init.ops = &programmable_ops;
-	if (parent_hws)
-		init.parent_hws = (const struct clk_hw **)parent_hws;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = parent_names;
 	init.num_parents = num_parents;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 24ef879c712c..3d06b1c41f13 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -266,7 +266,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 at91_clk_register_programmable(struct regmap *regmap, const char *name,
-			       const char **parent_names, struct clk_hw **parent_hws,
+			       const char **parent_names, struct clk_parent_data *parent_data,
 			       u8 num_parents, u8 id,
 			       const struct clk_programmable_layout *layout,
 			       u32 *mux_table);
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index e8005b727a6b..f98aecdd6f88 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -888,20 +888,20 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
-	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
+	parent_data[4] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    NULL, parent_hws, 7, i,
+						    NULL, parent_data, 7, i,
 						    &sam9x7_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index ccbc459edd31..988b86fb0c35 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1267,22 +1267,22 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7d65_prog_mux_table);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 74cf712f2820..b772b9e15b78 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1146,21 +1146,21 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	sama7g5_pmc->chws[PMC_UTMI] = hw;
 
-	parent_hws[0] = md_slck_hw;
-	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
-	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
-	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
-	parent_hws[6] = sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
-	parent_hws[7] = sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
-	parent_hws[8] = sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
+	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
+	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
+	parent_data[2] = AT91_CLK_PD_HW(sama7g5_pmc->chws[PMC_MAIN]);
+	parent_data[3] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
+	parent_data[4] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
+	parent_data[5] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw);
+	parent_data[6] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw);
+	parent_data[7] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw);
+	parent_data[8] = AT91_CLK_PD_HW(sama7g5_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw);
 	for (i = 0; i < 8; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
-		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
+		hw = at91_clk_register_programmable(regmap, name, NULL, parent_data,
 						    9, i,
 						    &programmable_layout,
 						    sama7g5_prog_mux_table);
-- 
2.43.0

