Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521F395252;
	Fri, 16 Jan 2026 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594050; cv=none; b=FHKxsRGUiGxd6EGq5AmPTmR71lEX8MkI1dlI8KhZtAqCH9z/mEBv/t9/MMn3T+dcnCKdpdLq+pl+WHb9UWig5K7UlOyc00xM/n+QFk7xsbaon1YeOJKvOTYCCAFX1jKHbXCaYhzStktxaUJzz/Yny8Cb4gLmVyrtw/Ft1nZhNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594050; c=relaxed/simple;
	bh=neIWWmyypnNHqZZGX8lfunmzpOCJxCwV8FKTDxUQwLE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5oogVTr9cXdWXzUu0mY78AYo6qptylEkxh0LEqcw5/WzW3BLEKmLI+4WuyfS3GcZ+c0loZDuzwuFdpZZSNn8SxVaAM937n+QkG16XO0YNZSsxun2rLpeTE3n+rFtAMYOas6BZFt5jliivgN8NLHh7aiBWdPoOe/olNcO0vGgy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=PPr8yAkh; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PPr8yAkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594048; x=1800130048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=neIWWmyypnNHqZZGX8lfunmzpOCJxCwV8FKTDxUQwLE=;
  b=PPr8yAkhx6mOx0LsgdQBiONjm78osbqE1QgBvEeaFA5JhVrp9fpE9fwd
   6f+WrGMuWLAEnM6AB6xDKiHmadYGmVI1NDySFXBLW/ffXbrxec/XZHplP
   NYMuFjQiqSGB/+tN141rjbJfS/J3JMXjqiqbQgu5tpaCBKA+JXh/aIQYh
   noRCeQrq3KdGNp1SidC9d6mMkNXETRF65n9o7wr2tc3Zjr1Wc3Zne22oF
   e/mO0S+kKZTy+BV+lzInmZrnUpbAIE2xDBGXVzj/1W53yLfeY6MKZnjbv
   OQLyB5hjSF+GWNP5+Ll+udz/qDZCWP1Q/sZAIfTLwsLZqiB1eK+uslH++
   w==;
X-CSE-ConnectionGUID: +9RSiAtvRY+RhxWEUm06Wg==
X-CSE-MsgGUID: PhczZzwKQji/3pi6D4ywRQ==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="283397053"
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
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 13/31] clk: at91: sama7d65: switch system clocks to parent_hw and parent_data
Date: Fri, 16 Jan 2026 13:07:06 -0700
Message-ID: <96e09d47cbff0fb4593d642a1151791e20c15c48.1768512290.git.ryan.wanner@microchip.com>
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Switch the system clocks to use parent_hw and parent_data. Having this
allows the driver to conform to the new clk-system API.

The parent registration is after the USBCK registration due to one of
the system clocks being dependent on USBCK.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama7d65.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 8aea926094d8..0c9d43fa01c1 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -537,23 +537,23 @@ static struct {
 /*
  * System clock description
  * @n:	clock name
- * @p:	clock parent name
+ * @p:	clock parent hw
  * @id: clock id
  */
-static const struct {
+static struct {
 	const char *n;
-	const char *p;
+	struct clk_hw *parent_hw;
 	u8 id;
 } sama7d65_systemck[] = {
-	{ .n = "uhpck",		.p = "usbck", .id = 6 },
-	{ .n = "pck0",		.p = "prog0", .id = 8, },
-	{ .n = "pck1",		.p = "prog1", .id = 9, },
-	{ .n = "pck2",		.p = "prog2", .id = 10, },
-	{ .n = "pck3",		.p = "prog3", .id = 11, },
-	{ .n = "pck4",		.p = "prog4", .id = 12, },
-	{ .n = "pck5",		.p = "prog5", .id = 13, },
-	{ .n = "pck6",		.p = "prog6", .id = 14, },
-	{ .n = "pck7",		.p = "prog7", .id = 15, },
+	{ .n = "uhpck",		.id = 6 },
+	{ .n = "pck0",		.id = 8, },
+	{ .n = "pck1",		.id = 9, },
+	{ .n = "pck2",		.id = 10, },
+	{ .n = "pck3",		.id = 11, },
+	{ .n = "pck4",		.id = 12, },
+	{ .n = "pck5",		.id = 13, },
+	{ .n = "pck6",		.id = 14, },
+	{ .n = "pck7",		.id = 15, },
 };
 
 /* Mux table for programmable clocks. */
@@ -1298,9 +1298,19 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 		sama7d65_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sama7d65_systemck[0].parent_hw = usbck_hw;
+	sama7d65_systemck[1].parent_hw = sama7d65_pmc->pchws[0];
+	sama7d65_systemck[2].parent_hw = sama7d65_pmc->pchws[1];
+	sama7d65_systemck[3].parent_hw = sama7d65_pmc->pchws[2];
+	sama7d65_systemck[4].parent_hw = sama7d65_pmc->pchws[3];
+	sama7d65_systemck[5].parent_hw = sama7d65_pmc->pchws[4];
+	sama7d65_systemck[6].parent_hw = sama7d65_pmc->pchws[5];
+	sama7d65_systemck[7].parent_hw = sama7d65_pmc->pchws[6];
+	sama7d65_systemck[8].parent_hw = sama7d65_pmc->pchws[7];
 	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
-					      sama7d65_systemck[i].p, NULL,
+					      NULL, &AT91_CLK_PD_HW(sama7d65_systemck[i].parent_hw),
 					      sama7d65_systemck[i].id, 0);
 		if (IS_ERR(hw))
 			goto err_free;
-- 
2.43.0

