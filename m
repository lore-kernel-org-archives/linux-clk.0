Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651C33A35AC;
	Fri, 16 Jan 2026 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594063; cv=none; b=jHT0aiucetkhJj+NYVjYhfaTcfDhyIsZX9isczFL+i34PXg2JksGzijZvS1mq/97qD1NY93a4wAabMbIUkw9Az84Bcbg6OTMTzhyZCqyuOPSRu7IWvab9NuF/hYXIFbR7ZFbmV8gu4iHu1Jq/vJEQFWttJUj23zU4Wcjubwmtgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594063; c=relaxed/simple;
	bh=53DNaidMA1vaVQPCMvqJAIB1kyJdHBWN47UGR13FwEI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAk48G77hmWmjLo6QAYlSllIo4eWXzx3ibPumSI5Ne1S45+KVzPoK+JMmE9Vtu/VfnMTfO+wQBEUtmdNVCB1FfOmiex6JrGjCY28f4EbvgDChqvysL9h2Tat7eI+0Y4gs1mTLoiEhi/li1yz4IndxYykeH9AXbzFY4fAypzAy/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CSTdEjWW; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CSTdEjWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594059; x=1800130059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=53DNaidMA1vaVQPCMvqJAIB1kyJdHBWN47UGR13FwEI=;
  b=CSTdEjWWkO7OPCoZaInSyVx0U44Jh6z/A1qIUzt0kr8ysgkMKE1rZAGy
   iNME9gol3Z2qi1XJHC5DvJCjYAcmUxTaHWZ2WMpNrXzyRRJThEP8/6v7H
   MTQS24FNU8yjm6nSro0bturXKJlv4CR6w59NoU3JHa14s1/H0Vv+rYOoB
   hes8x8mHO6CmFj2LRPMcwKX3AI6cBlw4zvTMCMxwEMlZTX6bIPpWVd/UG
   NqSjSWtFH/pLGYssGLCiDYit6UI0u2yO4dUGu+VhNOdZoyozLR6jUweOM
   4kTiT+esGX61sqqDBv2HGl2Qs+f/ocfiWBEp++S0hcJ5nv5bbYDjg7K0H
   w==;
X-CSE-ConnectionGUID: 3LvvvroxTJyR6T9mab+TNA==
X-CSE-MsgGUID: fVrDNjIaRxO4fFS0CxjTTw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="51290358"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2026 13:07:33 -0700
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
Subject: [PATCH v5 04/31] clk: at91: clk-sam9x60-pll: use clk_parent_data
Date: Fri, 16 Jan 2026 13:06:57 -0700
Message-ID: <ca2a4b7196e1c8a479577ca4673f2125ff41292e.1768512290.git.ryan.wanner@microchip.com>
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
modern clk_parent_data structures. As clk-sam9x60-pll need to know
parent's rate at initialization we pass it now from SoC specific drivers.
This will lead in the end at removing __clk_get_hw() in SoC specific
drivers (that will be solved by subsequent commits).

Get the main_xtal name via of_clk_get_parent_name() to consistently get
the correct name for the main_xtal.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
 drivers/clk/at91/pmc.h             |  5 +++--
 drivers/clk/at91/sam9x60.c         |  8 +++++---
 drivers/clk/at91/sam9x7.c          | 16 +++++++++++-----
 drivers/clk/at91/sama7d65.c        | 28 +++++++++++++++++-----------
 drivers/clk/at91/sama7g5.c         | 29 ++++++++++++++++++-----------
 6 files changed, 59 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index 3b965057ba0d..bccd674bc616 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -637,19 +637,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
 
 struct clk_hw * __init
 sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
-			      const char *name, const char *parent_name,
-			      struct clk_hw *parent_hw, u8 id,
+			      const char *name, const struct clk_parent_data *parent_data,
+			      unsigned long parent_rate, u8 id,
 			      const struct clk_pll_characteristics *characteristics,
 			      const struct clk_pll_layout *layout, u32 flags)
 {
 	struct sam9x60_frac *frac;
 	struct clk_hw *hw;
 	struct clk_init_data init = {};
-	unsigned long parent_rate, irqflags;
+	unsigned long irqflags;
 	unsigned int val;
 	int ret;
 
-	if (id > PLL_MAX_ID || !lock || !parent_hw)
+	if (id > PLL_MAX_ID || !lock || !parent_data)
 		return ERR_PTR(-EINVAL);
 
 	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
@@ -657,10 +657,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	if (parent_name)
-		init.parent_names = &parent_name;
-	else
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	init.parent_data = (const struct clk_parent_data *)parent_data;
 	init.num_parents = 1;
 	if (flags & CLK_SET_RATE_GATE)
 		init.ops = &sam9x60_frac_pll_ops;
@@ -691,7 +688,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
 		 * its rate leading to enabling this PLL with unsupported
 		 * rate. This will lead to PLL not being locked at all.
 		 */
-		parent_rate = clk_hw_get_rate(parent_hw);
 		if (!parent_rate) {
 			hw = ERR_PTR(-EINVAL);
 			goto free;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 63c028b7b54c..577a6db65ed0 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -258,8 +258,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
 
 struct clk_hw * __init
 sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
-			      const char *name, const char *parent_name,
-			      struct clk_hw *parent_hw, u8 id,
+			      const char *name,
+			      const struct clk_parent_data *parent_data,
+			      unsigned long parent_rate, u8 id,
 			      const struct clk_pll_characteristics *characteristics,
 			      const struct clk_pll_layout *layout, u32 flags);
 
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index 18baf4a256f4..bee35c65aceb 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -242,7 +242,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc->chws[PMC_MAIN] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
-					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
+					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
+					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
 					   0, &plla_characteristics,
 					   &pll_frac_layout,
 					   /*
@@ -268,8 +269,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	sam9x60_pmc->chws[PMC_PLLACK] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
-					   "main_osc", main_osc_hw, 1,
-					   &upll_characteristics,
+					   &AT91_CLK_PD_HW(main_osc_hw),
+					   clk_hw_get_rate(main_osc_hw),
+					   1, &upll_characteristics,
 					   &pll_frac_layout, CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		goto err_free;
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index c48c91da914e..6ec4d09e0b56 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -752,6 +752,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	struct regmap *regmap;
 	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
+	static struct clk_parent_data parent_data;
 	struct clk_hw *parent_hws[9];
 	int i, j;
 
@@ -804,7 +805,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sam9x7_plls[i][j].n)
 				continue;
@@ -813,21 +814,26 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sam9x7_plls[i][j].p) {
 				case SAM9X7_PLL_PARENT_MAINCK:
-					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck");
+					hw = sam9x7_pmc->chws[PMC_MAIN];
 					break;
 				case SAM9X7_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
+					hw = main_xtal_hw;
 					break;
 				default:
 					/* Should not happen. */
-					parent_hw = NULL;
 					break;
 				}
 
+				parent_rate = clk_hw_get_rate(hw);
+				if (!parent_rate)
+					return;
+
 				hw = sam9x60_clk_register_frac_pll(regmap,
 								   &pmc_pll_lock,
 								   sam9x7_plls[i][j].n,
-								   NULL, parent_hw, i,
+								   &parent_data, parent_rate, i,
 								   sam9x7_plls[i][j].c,
 								   sam9x7_plls[i][j].l,
 								   sam9x7_plls[i][j].f);
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index ec2ef1a0249a..fd4bf70323ab 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1093,7 +1093,7 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
 
 static void __init sama7d65_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name = "main_xtal";
+	const char *main_xtal_name;
 	struct pmc_data *sama7d65_pmc;
 	const char *parent_names[11];
 	void **alloc_mem = NULL;
@@ -1106,11 +1106,15 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	bool bypass;
 	int i, j;
 
+	i = of_property_match_string(np, "clock-names", "main_xtal");
+	if (i < 0)
+		return;
+	main_xtal_name = of_clk_get_parent_name(np, i);
+
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!td_slck_hw || !md_slck_hw)
 		return;
 
 	regmap = device_node_to_regmap(np);
@@ -1137,10 +1141,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	parent_data.name = main_xtal_name;
-	parent_data.fw_name = main_xtal_name;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
-						 &parent_data, bypass);
+						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
@@ -1154,7 +1156,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sama7d65_plls[i][j].n)
 				continue;
@@ -1163,20 +1165,24 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7d65_plls[i][j].p) {
 				case SAMA7D65_PLL_PARENT_MAINCK:
-					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck");
+					hw = sama7d65_pmc->chws[PMC_MAIN];
 					break;
 				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
+					hw = main_xtal_hw;
 					break;
 				default:
 					/* Should not happen. */
-					parent_hw = NULL;
 					break;
 				}
+				parent_rate = clk_hw_get_rate(hw);
+				if (!parent_rate)
+					return;
 
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7d65_plls[i][j].n,
-					NULL, parent_hw, i,
+					&parent_data, parent_rate, i,
 					sama7d65_plls[i][j].c,
 					sama7d65_plls[i][j].l,
 					sama7d65_plls[i][j].f);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 713f5dfe7be2..c6550044cba1 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -971,7 +971,7 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
 
 static void __init sama7g5_pmc_setup(struct device_node *np)
 {
-	const char *main_xtal_name = "main_xtal";
+	const char *main_xtal_name;
 	struct pmc_data *sama7g5_pmc;
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
@@ -983,11 +983,15 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	bool bypass;
 	int i, j;
 
+	i = of_property_match_string(np, "clock-names", "main_xtal");
+	if (i < 0)
+		return;
+	main_xtal_name = of_clk_get_parent_name(np, i);
+
 	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
 	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
-	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
 
-	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
+	if (!td_slck_hw || !md_slck_hw)
 		return;
 
 	regmap = device_node_to_regmap(np);
@@ -1014,10 +1018,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	parent_data.name = main_xtal_name;
-	parent_data.fw_name = main_xtal_name;
 	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
-						 &parent_data, bypass);
+						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
 	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
@@ -1031,7 +1033,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
-			struct clk_hw *parent_hw;
+			unsigned long parent_rate;
 
 			if (!sama7g5_plls[i][j].n)
 				continue;
@@ -1040,20 +1042,25 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_data = AT91_CLK_PD_NAME("mainck");
+					hw = sama7g5_pmc->chws[PMC_MAIN];
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
-					parent_hw = main_xtal_hw;
+					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
+					hw = main_xtal_hw;
 					break;
 				default:
 					/* Should not happen. */
-					parent_hw = NULL;
 					break;
 				}
 
+				parent_rate = clk_hw_get_rate(hw);
+				if (!parent_rate)
+					return;
+
 				hw = sam9x60_clk_register_frac_pll(regmap,
 					&pmc_pll_lock, sama7g5_plls[i][j].n,
-					NULL, parent_hw, i,
+					&parent_data, parent_rate, i,
 					sama7g5_plls[i][j].c,
 					sama7g5_plls[i][j].l,
 					sama7g5_plls[i][j].f);
-- 
2.43.0

