Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16152E6CC4;
	Mon,  2 Feb 2026 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029063; cv=none; b=hWjONkKIhHVNOTlQ2AzgLKHBR5ESSfKqO1S4vW03oJz5tD9enkyyiNk0tZDUux7SrDcnupUoPH2AXWL5Xug1WhM3b80ZKGhMD8Rw1v/x66VsukoMcatXrwywgI44MVzIiI8broBb3oo3HmaI8pSDxVpdPFTHJ32ZOofq2LzdmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029063; c=relaxed/simple;
	bh=AaVe1pjaER66BSebJZWxUmfJ2o8xzxozlDgG45+LDuk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C86IgwmmJO1TBK9FLmVNQpF5Pa7K7JGJfpBPbjwRceiLTg0C0OdNT2F9s0fJZf2asVT29ZcAy7V5FgCNqhAlE9iD2NiRfdhrQvOE2dgA0Ap4tZAojMeJoWvSmiB+ZHJ0HYWgfC9+r3JfVcYkQGJtfVbIpNdyAfUaw8vpzpc0cWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=oUtk7MDf; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="oUtk7MDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770029062; x=1801565062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AaVe1pjaER66BSebJZWxUmfJ2o8xzxozlDgG45+LDuk=;
  b=oUtk7MDfMcOMLyzsO/C68sStIabWO9wIAHGsNMr7YEs2UlSLbE/UfTxj
   a2fT8q+H+c0Z3sZFvpXIbAtxLEUbpslrH0Z12cTKPS75DPRxTbGxkctpj
   HyaNVeBBNHHUdcyT+gP2Z1NTt6rVgEEFS0ZuAeAfs4mhUAqXuhH/OkUHs
   TNiQ884f40DfR9aMfAzE+/87GdzAvhnSXE3xFxp9yTOlG82GGytRZhV3K
   ifrRw5LXD8OBBpTgeMJMm9LeSC7hcQgLmOmW6ortQQeoJ/AJ88wS8sKuE
   neucrylJxcLm+/IW3LKBSH4s4qIUP6tSGAwLoJo0Rf4Sr7NO2M69ny328
   g==;
X-CSE-ConnectionGUID: DSQwcYL0TyCoxPqC95EJag==
X-CSE-MsgGUID: xxR6AZGYSNq5/76nmJyAdA==
X-IronPort-AV: E=Sophos;i="6.21,268,1763449200"; 
   d="scan'208";a="52769520"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Feb 2026 03:41:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Feb 2026 03:40:41 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Feb 2026 03:40:38 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/5] clk: at91: sam9x7: Remove gmac peripheral and generic clock entries with ID 67
Date: Mon, 2 Feb 2026 12:40:21 +0200
Message-ID: <20260202104025.3781-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202104025.3781-1-mihai.sain@microchip.com>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
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
2.52.0

