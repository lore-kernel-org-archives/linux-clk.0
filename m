Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EDC3A1E7B;
	Fri, 16 Jan 2026 20:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594062; cv=none; b=RfxiVlj/AcBO0U2WfaWanEZx/AXyb4tI7VcDpFEnRxJ3aLeKjjEgTPUyaqIqkBT4R5MsKIiknGZ2oWexVbca+GkMcKX/H44ww7uDFOyoZLRliT6pw6N2QpqBf7EaroGCZIt1rggMzVWYCEZI8YRcXsiblWMQnKItGwv86erxqh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594062; c=relaxed/simple;
	bh=gAK0nimLOIAx5kqVpIz48AFoNgNBNFLudz2LhKw6EFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohiVxCc6TDtPBCIDp8b3KO8iQsXqVSDCRe5QkAQhUxrU9VgE3utbRltAyNSqf9CzipHlF+CRnnZLXYAV5UTVBlcRRyZLgYPlVKz6ihhlkLqMIap4iOtNZi1wa9mny1t5Uaroi6M4narjQl+g6/WsiUISYRxC4D5oyPLCHpgD7N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=DWiweyJb; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="DWiweyJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594061; x=1800130061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gAK0nimLOIAx5kqVpIz48AFoNgNBNFLudz2LhKw6EFU=;
  b=DWiweyJbV6bsTjoRCC53GbGBVU6NTKXDb7zXznff3Krz/TXf1+ij9oin
   lmIZ/Z+apjnyskAru0Q6Lo0AoXnm7ZepM4TRK89jMVZvK84v7XJUEzV3b
   UdnhD3cIZ99Rtxa4YOwWB+2WqGlkJbntMl9bIL64Io2ChuALo9z4qp5mW
   aj3/ihV8A4mm6zLsyzX/F7ludPs3CLyUIJ60LWEan9TZfoH3zUBMxL1KD
   cDgX7b8axxPi/Y/HBm5sbK+u74cT1epXms9eoiiEVzje0ucpa7dx5IwPL
   XLkNkHJCmdSn37FPHD95lodDmcIj3a2+I+6X/WYTF1a9SZNDMhDobsuec
   Q==;
X-CSE-ConnectionGUID: MqTcJu0RSESfeq27zLZvsQ==
X-CSE-MsgGUID: TvN56jmMQXerNh5RhpRVvA==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="52013861"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2026 13:07:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Jan 2026 13:07:06 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:06 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 19/31] clk: at91: clk-smd: add support for clk_parent_data
Date: Fri, 16 Jan 2026 13:07:12 -0700
Message-ID: <92f9e1fc621d30e9692f2d398372b5a862647d40.1768512290.git.ryan.wanner@microchip.com>
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

Add support for parent_data in smd clock drivers.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-smd were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/at91sam9x5.c |  2 +-
 drivers/clk/at91/clk-smd.c    | 10 +++++++---
 drivers/clk/at91/dt-compat.c  |  2 +-
 drivers/clk/at91/pmc.h        |  3 ++-
 drivers/clk/at91/sama5d3.c    |  2 +-
 drivers/clk/at91/sama5d4.c    |  2 +-
 6 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 37280852f086..13331e015dd7 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -226,7 +226,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
+	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index 09c649c8598e..d53dc32b36be 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -111,11 +111,12 @@ static const struct clk_ops at91sam9x5_smd_ops = {
 
 struct clk_hw * __init
 at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents)
+			    const char **parent_names, struct clk_parent_data *parent_data,
+			    u8 num_parents)
 {
 	struct at91sam9x5_clk_smd *smd;
 	struct clk_hw *hw;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	smd = kzalloc(sizeof(*smd), GFP_KERNEL);
@@ -124,7 +125,10 @@ at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &at91sam9x5_smd_ops;
-	init.parent_names = parent_names;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 	init.flags = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE;
 
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 2b1aa834f111..5afd7c9f53fd 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -859,7 +859,7 @@ static void __init of_at91sam9x5_clk_smd_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	hw = at91sam9x5_clk_register_smd(regmap, name, parent_names,
+	hw = at91sam9x5_clk_register_smd(regmap, name, parent_names, NULL,
 					 num_parents);
 	if (IS_ERR(hw))
 		return;
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 3680e2d489d8..08c3138fef8f 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -280,7 +280,8 @@ at91_clk_register_sam9260_slow(struct regmap *regmap,
 
 struct clk_hw * __init
 at91sam9x5_clk_register_smd(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents);
+			    const char **parent_names, struct clk_parent_data *parent_data,
+			    u8 num_parents);
 
 struct clk_hw * __init
 at91_clk_register_system(struct regmap *regmap, const char *name,
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 7f2ac8f648dd..8326bb6a291c 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -205,7 +205,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
+	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 04c848cd7001..1ff9286148da 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -228,7 +228,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, 2);
+	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
-- 
2.43.0

