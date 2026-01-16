Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9563A4AAB;
	Fri, 16 Jan 2026 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594056; cv=none; b=rxLzUD+LTqXpeZB2aG9w7bRi2J09ES+qRCstGtpCEdyCMoBKlXGJlm7N3enpLYKdnTG2aapuAcity+r3/R90BGUnyxoRpZRboiZO0RoY/xu7ly4eQTjTzmElIWEp6TGTwH6lQxWPN7/J1ImQ34yfUvD65cgFNO26ssyU3A5NGZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594056; c=relaxed/simple;
	bh=4j7JJmu0bl4xjlY1WxBs2ZZlXxj0JOHqAkmnYdAEZ7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d33jwj0/oWmocE2DmNj33x8dc2nUd1mY7kpIterN5243GDjEiok2e1LG0joAWI7OolH8CpO8gP1ae/eNX2zWFCKkEPmphTd6oTPm7rNJ1QtJYEkbiiZuz4THko0aRIlW0B5PaImSk93Qk3+Q6EbXyu6a0SMFXkU6oUlcIxZvd8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tJPxidHx; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tJPxidHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594052; x=1800130052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4j7JJmu0bl4xjlY1WxBs2ZZlXxj0JOHqAkmnYdAEZ7g=;
  b=tJPxidHxhpX1g59f6Naaw6w+kcV6HWPU7eRSC3egcXS8tXfW2aY30iNK
   Lle95AGpzAJ9xEfzvLnoz3eMe1cZh4i8T2b7fSMIJ2PJPctbx3+3v506U
   Ew7t+v1SQT+AeL1ouEN1wQXviD+xqhrZO2e7e/kYbzCDaBDKrorXl5PBT
   u3zvWFEZYqKXGKQTIRKgJm5Yj0bZku11l8cx8L3OCRFIV/eznEdGPeiDN
   rOw1wv37Yi1ilw/mPm0b6a98EJXQzZtPI+618SeJdYh7CdzwhSfcpdW9S
   JN6SebPFpTD8qaGsNeI9JKgCkL8Ms5YWuqcQ6nY8XeaW3ML6zV79tJd9a
   A==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: M6+9SkXyQtu+UZN+kxO0mQ==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042241"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:06 -0700
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
Subject: [PATCH v5 18/31] clk: at91: clk-i2s-mux: add support for parent_data
Date: Fri, 16 Jan 2026 13:07:11 -0700
Message-ID: <0d5517f708a262924c6aa6f97a23d078891c218a.1768512290.git.ryan.wanner@microchip.com>
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

Add support for parent_data in i2s mux clock driver.
With this parent-child relation is described with pointers rather
than strings making registration a bit faster.

All the SoC based drivers that rely on clk-i2s-mux were adapted
to the new API change. The switch itself for SoCs will be done
in subsequent patches.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/clk-i2s-mux.c | 6 +++++-
 drivers/clk/at91/dt-compat.c   | 2 +-
 drivers/clk/at91/pmc.h         | 1 +
 drivers/clk/at91/sama5d2.c     | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/at91/clk-i2s-mux.c b/drivers/clk/at91/clk-i2s-mux.c
index fe6ce172b8b0..04d9fcf940fb 100644
--- a/drivers/clk/at91/clk-i2s-mux.c
+++ b/drivers/clk/at91/clk-i2s-mux.c
@@ -51,6 +51,7 @@ static const struct clk_ops clk_i2s_mux_ops = {
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 			  const char * const *parent_names,
+			  struct clk_parent_data *parent_data,
 			  unsigned int num_parents, u8 bus_id)
 {
 	struct clk_init_data init = {};
@@ -63,7 +64,10 @@ at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 
 	init.name = name;
 	init.ops = &clk_i2s_mux_ops;
-	init.parent_names = parent_names;
+	if (parent_data)
+		init.parent_data = (const struct clk_parent_data *)parent_data;
+	else
+		init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
 	i2s_ck->hw.init = &init;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index ccdeba3a1130..2b1aa834f111 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -239,7 +239,7 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
 			continue;
 
 		hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
-					       parent_names, 2, bus_id);
+					       parent_names, NULL, 2, bus_id);
 		if (IS_ERR(hw))
 			continue;
 
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 32bb041c1466..3680e2d489d8 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -185,6 +185,7 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
 struct clk_hw * __init
 at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
 			  const char * const *parent_names,
+			  struct clk_parent_data *parent_data,
 			  unsigned int num_parents, u8 bus_id);
 
 struct clk_hw * __init
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index 8c7ff0108b41..f5d6c7a96cf2 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -372,7 +372,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		parent_names[0] = "i2s0_clk";
 		parent_names[1] = "i2s0_gclk";
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s0_muxclk",
-					       parent_names, 2, 0);
+					       parent_names, NULL, 2, 0);
 		if (IS_ERR(hw))
 			goto err_free;
 
@@ -381,7 +381,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		parent_names[0] = "i2s1_clk";
 		parent_names[1] = "i2s1_gclk";
 		hw = at91_clk_i2s_mux_register(regmap_sfr, "i2s1_muxclk",
-					       parent_names, 2, 1);
+					       parent_names, NULL, 2, 1);
 		if (IS_ERR(hw))
 			goto err_free;
 
-- 
2.43.0

