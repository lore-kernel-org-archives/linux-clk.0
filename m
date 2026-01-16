Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F6D3A1D1A;
	Fri, 16 Jan 2026 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594046; cv=none; b=HFBrVt6NZFM3n/0Pi24TXiLStzq8D/3s3uYrpvwBwxCUg/Ez80noum7A2fL2QgePMg6jFdDdAUIDLDlPzNpoypRMi1IuRrNR3KSUlnGS4u4qrbStTzxBR4NSK0KSxSDQuMWyh2b6fcWOlFYFelLJRFcs90T/vncOdWkXyrbdK+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594046; c=relaxed/simple;
	bh=OTMXgJdF/7MTA4sJqHAQpMGm2af+yWIy+XmatDrrxP4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mF8XSSN/WBdW4SFDxa86PP0C4C/YthUNAaDtcLOLXoZQEgh5SCQGYXqEvrz+RYJ3zL7JG0jnI9Qi/pPr73hGixP+S0xUps+OpM5Kor22s/R43dhJMPVq10iX6FmYOtCcvt7cDNRZa1/BfZ2D2Ofixhb1BzfsyTXnIiYAYdsAxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=VyNyGwAQ; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="VyNyGwAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594044; x=1800130044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OTMXgJdF/7MTA4sJqHAQpMGm2af+yWIy+XmatDrrxP4=;
  b=VyNyGwAQ40/Rg7BQKdsQGeRyJ22bHI4kh1XKn0Ge9XOim2FPePHcCiKY
   dK6rNs1xvLCpOB6srFza0TT4RmalRiVKIa1iknOZjyvVJz4E0Enfjwb79
   vUkGxlhZRCQyF5rYv57R3v1Kgw1U26+UZ3z0zLgj1kM+74NYXWiLbI3hc
   cdvYPgzmvj/UT+YEpnCECPpWxuj2rE/WGeghU6/cHH8MoWLuaZc4fIRXj
   NzpJ2/aWaMRR6ByMt+S/6M8icOJLPED0rAdkO/awtJUJsVs2UJ1h4+uQ8
   ISSwlU0z/mO2OER5qD+MoQI6qZ1vWRBBV5I54kIL2irU/9tHDAj3itlwn
   A==;
X-CSE-ConnectionGUID: +9RSiAtvRY+RhxWEUm06Wg==
X-CSE-MsgGUID: 5FgGJAS1SOCVS7wRgzOGOQ==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="283397048"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:04 -0700
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
Subject: [PATCH v5 07/31] clk: at91: clk-utmi: use clk_parent_data
Date: Fri, 16 Jan 2026 13:07:00 -0700
Message-ID: <e7757e961b1ba514bcab3178ac65b4ee8040b80c.1768512290.git.ryan.wanner@microchip.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-utmi.c | 16 ++++++++--------
 drivers/clk/at91/pmc.h      |  4 ++--
 drivers/clk/at91/sama7g5.c  | 19 ++++++++++++-------
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
index b991180beea1..38ffe4d712a5 100644
--- a/drivers/clk/at91/clk-utmi.c
+++ b/drivers/clk/at91/clk-utmi.c
@@ -144,7 +144,7 @@ static struct clk_hw * __init
 at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 				struct regmap *regmap_sfr,
 				const char *name, const char *parent_name,
-				struct clk_hw *parent_hw,
+				struct clk_parent_data *parent_data,
 				const struct clk_ops *ops, unsigned long flags)
 {
 	struct clk_utmi *utmi;
@@ -152,7 +152,7 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (!(parent_name || parent_hw))
+	if (!(parent_name || parent_data))
 		return ERR_PTR(-EINVAL);
 
 	utmi = kzalloc(sizeof(*utmi), GFP_KERNEL);
@@ -161,8 +161,8 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 
 	init.name = name;
 	init.ops = ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -185,10 +185,10 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
 		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw)
+		       struct clk_parent_data *parent_data)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, regmap_sfr, name,
-			parent_name, parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
+			parent_name, parent_data, &utmi_ops, CLK_SET_RATE_GATE);
 }
 
 static int clk_utmi_sama7g5_prepare(struct clk_hw *hw)
@@ -287,8 +287,8 @@ static const struct clk_ops sama7g5_utmi_ops = {
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap_pmc, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw)
+			       const char *parent_name, struct clk_parent_data *parent_data)
 {
 	return at91_clk_register_utmi_internal(regmap_pmc, NULL, name,
-			parent_name, parent_hw, &sama7g5_utmi_ops, 0);
+			parent_name, parent_data, &sama7g5_utmi_ops, 0);
 }
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 2d2e7c20d72d..dcb678732471 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -302,10 +302,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
 		       const char *name, const char *parent_name,
-		       struct clk_hw *parent_hw);
+		       struct clk_parent_data *parent_data);
 
 struct clk_hw * __init
 at91_clk_sama7g5_register_utmi(struct regmap *regmap, const char *name,
-			       const char *parent_name, struct clk_hw *parent_hw);
+			       const char *parent_name, struct clk_parent_data *parent_data);
 
 #endif /* __PMC_H_ */
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index d7fb42166a14..058004379ce9 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -976,7 +976,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	void **alloc_mem = NULL;
 	int alloc_mem_size = 0;
 	struct regmap *regmap;
-	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
 	struct clk_hw *td_slck_hw, *md_slck_hw;
 	struct clk_parent_data parent_data[2];
 	struct clk_hw *parent_hws[10];
@@ -1042,19 +1042,23 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_data = AT91_CLK_PD_NAME("mainck");
-					hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_data[0] = AT91_CLK_PD_NAME("mainck");
+					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
-					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
-					hw = main_xtal_hw;
+					struct clk *main_xtal;
+					main_xtal = of_clk_get_by_name(np, main_xtal_name);
+					if (IS_ERR(main_xtal))
+						goto err_free;
+					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name);
+					parent_rate = clk_get_rate(main_xtal);
+					clk_put(main_xtal);
 					break;
 				default:
 					/* Should not happen. */
 					break;
 				}
 
-				parent_rate = clk_hw_get_rate(hw);
 				if (!parent_rate)
 					return;
 
@@ -1138,7 +1142,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
 	}
 
-	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL, main_xtal_hw);
+	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
+					    &AT91_CLK_PD_NAME(main_xtal_name));
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.43.0

