Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC22E8B87;
	Thu, 12 Feb 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890535; cv=none; b=NWPAIY+3q5+vg6vgZd9BfKquq1k6r7Nt2/kssm2BBrkWpxzEzAAZhgsUe95Wd7BLL6jnxb0Jx2dZLs1wvMRAYbbfOIY63R6VeHGN8lPH3ecXJmuWdQXREjGEgH9HIAH4dNtdXWyvXDNqt7tadogm0eaCP/Vn0GAtvA7ZOPzLE5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890535; c=relaxed/simple;
	bh=x7tYcKwCteLHiZwyHz4dHbxN0Th4mJJiCosWKhhKNhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQpgvMh6MRm7NLja4PD3ruC1KPsl+mUzaAPxJrmfkeamNEwdY2YtbIjgSXlwYXYw44t+2QecfQKuHzrLidJi3bWDmncQt+VOzh3FoI51oyxKGN36V0F0YGyJAvdIdnhyM4nor7F+ZvmvFDb3gb9UyPaBAH9XYSNF3dVTzNHRvps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HJgLaVER; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HJgLaVER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770890534; x=1802426534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x7tYcKwCteLHiZwyHz4dHbxN0Th4mJJiCosWKhhKNhE=;
  b=HJgLaVER5mTxyFtWXakFnTb4HLJkTgQ1w5ETQS0DFkm0C+8+b457cgCt
   kc1N06j9nFIHswxW7Qv+pboZWHPWgx7h3AI5x8aRZwhA6+0h8tbUBI02u
   iIWrTQc9fOx50VNeaUuIDrAo+WAP/Bu4JDMChs30J1GwUP8AgS2aj+CG1
   0plT+oDE1Fhp95GK3/nAkNAt8C8lxxmLhdX8z+KxYASq+9959FAmIng6s
   za+cJHQK/5JrrgnKBPfweyYE4nYxPtQXFatTKrCtz0T3IHYDNnwAy/5BP
   n8NNAwYCAv/BDCBicA2AOGgGFx6YBrRHZGxJk8r6RCxIv/sAZqCNcNj7W
   g==;
X-CSE-ConnectionGUID: J0RxFlJXSD2hBRyc9bDFXw==
X-CSE-MsgGUID: uurT8fWXRIWhSFHG2x9hgQ==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="52580034"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:02:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Thu, 12 Feb 2026 03:02:11 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 12 Feb 2026 03:02:08 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 1/4] clk: at91: sam9x7: Remove gmac peripheral and generic clock entries with ID 67
Date: Thu, 12 Feb 2026 12:01:44 +0200
Message-ID: <20260212100147.5007-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212100147.5007-1-mihai.sain@microchip.com>
References: <20260212100147.5007-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

According with datasheet table 12.1 the instance ID 67 is reserved.
This change drops the gmactsu_clk and gmac_gclk entries from
the SAM9X7 clock description tables.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..d9603f1124d0 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -420,7 +420,6 @@ static const struct {
 	{ .n = "lvdsc_clk",	.id = 56, },
 	{ .n = "pit64b1_clk",	.id = 58, },
 	{ .n = "puf_clk",	.id = 59, },
-	{ .n = "gmactsu_clk",	.id = 67, },
 };
 
 /*
@@ -702,15 +701,6 @@ static const struct {
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
 	},
-
-	{
-		.n = "gmac_gclk",
-		.id = 67,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
-		.pp_mux_table = { 6, 8, },
-		.pp_count = 2,
-		.pp_chg_id = INT_MIN,
-	},
 };
 
 static void __init sam9x7_pmc_setup(struct device_node *np)
-- 
2.53.0

