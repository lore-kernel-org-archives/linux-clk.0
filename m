Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894623A1E70;
	Fri, 16 Jan 2026 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594051; cv=none; b=E3n6j6BP7l4i49Yct9la+oGmV7b8F1cUjixt/7TWu60EAEgM8qpf865EPQrHgYApNLL52432XaAdIFhDAGdLfj7YDTpfOdiEn0Fx9Tf4YkKSiWLu6t8T6d6kjN2kcPNEbeGFUPs83sEJ42ThiFGX2WmSvMzO3WwQFNYmc0WmWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594051; c=relaxed/simple;
	bh=BuDLvUI0gXXL+sAMfsCM6uqttzROVeaAE5P1ijRX1/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CodgBMNcG2TkqsinEhiGCCByOg6XHe6HPohUHlu5hhUlYYkTFLkLiJoWjR7+dC85fzvPX9I6YAMbFZRpFl5+cujC40DOts/EVyZUjKnZmC4tvtkP4GNYeygPzQK50DJ4SZUGzzavG2p/Q48dWhIBvQaOGLDw9VJF2Sb8733lI2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1Hkc6fqR; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1Hkc6fqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594047; x=1800130047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BuDLvUI0gXXL+sAMfsCM6uqttzROVeaAE5P1ijRX1/0=;
  b=1Hkc6fqRiA+BuJV0dpo7fMLRX5sGElOHJL/jruI/QtwpfGsMelGquqRB
   ECowmlH0cwGchCi73Yqd4Tx7ePYukQAAiL9rr6GUhzSylQUXwG0JYdvru
   zmB6UY2wb0lJI8bI8kUertgZjARI2cXgljRNyJ5KBABKMGk1RCYk4fK1Q
   jBMS3qgLQ5EjPnSntF9pQmr9HyM1jzNzJpAOncwb3QXK0iyNXCxvF2PiL
   13IR58cfTacmvsNTKtwTV6+LnkAYHCJ763ZWI4A3yLrHotgtahL2VNvJw
   osyPLfg6S1cUpp0ZAp0wLjj8xZjGwJogPjbZDyD4W+lis4MFw4WFpk1kn
   w==;
X-CSE-ConnectionGUID: +9RSiAtvRY+RhxWEUm06Wg==
X-CSE-MsgGUID: LLerEwPyQTas4GJIqdU+8g==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="283397052"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:05 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 12/31] clk: at91: clk-system: use clk_parent_data
Date: Fri, 16 Jan 2026 13:07:05 -0700
Message-ID: <7537c90e81803116bbf440c08f883c4e0f30a28d.1768512290.git.ryan.wanner@microchip.com>
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
[ryan.wanner@microchip: Update SAM9X75 clk-system to use parent_data.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-system.c | 8 ++++----
 drivers/clk/at91/pmc.h        | 2 +-
 drivers/clk/at91/sam9x7.c     | 2 +-
 drivers/clk/at91/sama7g5.c    | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
index 90eed39d0785..55f8e46fe9c7 100644
--- a/drivers/clk/at91/clk-system.c
+++ b/drivers/clk/at91/clk-system.c
@@ -105,7 +105,7 @@ static const struct clk_ops system_ops = {
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
-			 const char *parent_name, struct clk_hw *parent_hw, u8 id,
+			 const char *parent_name, struct clk_parent_data *parent_data, u8 id,
 			 unsigned long flags)
 {
 	struct clk_system *sys;
@@ -113,7 +113,7 @@ at91_clk_register_system(struct regmap *regmap, const char *name,
 	struct clk_init_data init = {};
 	int ret;
 
-	if (!(parent_name || parent_hw) || id > SYSTEM_MAX_ID)
+	if (!(parent_name || parent_data) || id > SYSTEM_MAX_ID)
 		return ERR_PTR(-EINVAL);
 
 	sys = kzalloc(sizeof(*sys), GFP_KERNEL);
@@ -122,8 +122,8 @@ at91_clk_register_system(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &system_ops;
-	if (parent_hw)
-		init.parent_hws = (const struct clk_hw **)&parent_hw;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 238d9d06efc5..cd8f286f4711 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -283,7 +283,7 @@ at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
-			 const char *parent_name, struct clk_hw *parent_hw,
+			 const char *parent_name, struct clk_parent_data *parent_data,
 			 u8 id, unsigned long flags);
 
 struct clk_hw * __init
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 4cb0ba8b6cf9..4cc61b56a13a 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -923,7 +923,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	sam9x7_systemck[3].parent_hw = sam9x7_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(sam9x7_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sam9x7_systemck[i].n,
-					      NULL, sam9x7_systemck[i].parent_hw,
+					      NULL, &AT91_CLK_PD_HW(sam9x7_systemck[i].parent_hw),
 					      sam9x7_systemck[i].id,
 					      sam9x7_systemck[i].flags);
 		if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 252a5e9cfd3c..558406b83b5f 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1174,7 +1174,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	for (i = 0; i < ARRAY_SIZE(sama7g5_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama7g5_systemck[i].n,
-					      NULL, sama7g5_pmc->pchws[i],
+					      NULL, &AT91_CLK_PD_HW(sama7g5_pmc->pchws[i]),
 					      sama7g5_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0

