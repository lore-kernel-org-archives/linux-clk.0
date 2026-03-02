Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C643FD13B;
	Mon,  2 Mar 2026 14:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461250; cv=none; b=LTTtUnSDzm0lyXtRxjUdl/bDu0TVSocEBAh7bz12Dt5AGwH6gMHvO6L0XzHo5VJ5aYz8rRurbVrQdkXTSAQV6qXE1nu5YnriEZJLx32Zv/fuiksAte+Mh7TJwCe7pw2YzQc2yf6EJK9+3v0OJD+y7S+o1+9b27NHJVwLkuuYoyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461250; c=relaxed/simple;
	bh=AZMbzgF0MBXEM33A7JxLatOxJLBIUtQdFwEpG1uKRco=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjaP02FELUZGUOKKd7OxsxbII38hZftq54LmKFJJYNNEo9XQv5Gig2x6A6ZSjTHlm3iYBp63TPhgJZuG/XcM5ESBtnru3XsChYb4kl0EDy2xiqJe1tZUQQ6v6Uci9N4RStYiNgbdA+XSDIgCGmbdJtEZt4/3UXDtZVg72UC0jYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lq71oCnF; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lq71oCnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772461247; x=1803997247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AZMbzgF0MBXEM33A7JxLatOxJLBIUtQdFwEpG1uKRco=;
  b=lq71oCnFwrN+08nHz8VnQoYtnNQ9eDz9B8wlWOoxTj4+ug/PxDrNuj2R
   fx5LM3PdJcQe8wNE9bHgUqktHY5a26nCozxkuuVmh0+FulIHxa3fMgWzl
   Zhh51yRWPnI4UM190N2qPCfI/SKzE0VOEnHRpYxYvaTetJD87BleFIal+
   j0LQpfZqYVqg/I+FDFfI12vLhzRUQH/868JXMsL9VGUejHOPXv2HFx8q7
   Tiyeat9YptbsG3o5QN8h8LH71H6tm3Z7LqqYJEYjpnv+BEEEHa8t0U8wX
   hn6gVsQAUhjwKkeJ3sHntzou5pLX4H8zjpMdvjW0SZkkeckEaby5wP/mV
   w==;
X-CSE-ConnectionGUID: lE1TtW25TS6tGatQdMkbxQ==
X-CSE-MsgGUID: JtovAiLOTAKBnZLIpVdlIA==
X-IronPort-AV: E=Sophos;i="6.21,320,1763449200"; 
   d="scan'208";a="61529580"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Mar 2026 07:20:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Mar 2026 07:20:29 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 07:20:25 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 3/4] clk: at91: sam9x7: Fix gmac_gclk clock definition
Date: Mon, 2 Mar 2026 16:20:07 +0200
Message-ID: <20260302142008.3253-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302142008.3253-1-mihai.sain@microchip.com>
References: <20260302142008.3253-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

According with datasheet [1] table 12.1 the instance ID 24 is used
for gmac generic clock.
This patch adds the correct gmac_gclk entry at ID 24, aligned with the
SoC clock layout, and removes the old misplaced 67 entry.

[1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X75-SIP-Series-Data-Sheet-DS60001827.pdf

Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 32c082b4ca4b..8b52da194849 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -568,6 +568,15 @@ static const struct {
 		.pp_chg_id = INT_MIN,
 	},
 
+	{
+		.n = "gmac_gclk",
+		.id = 24,
+		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp_mux_table = { 6, 8, },
+		.pp_count = 2,
+		.pp_chg_id = INT_MIN,
+	},
+
 	{
 		.n = "lcd_gclk",
 		.id = 25,
@@ -701,15 +710,6 @@ static const struct {
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

