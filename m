Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8958346A05;
	Fri, 16 Jan 2026 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594051; cv=none; b=plIKwWs/UAKRJLPO2CcaSUaojIz3XPdhT02mFmfDYd7GfHme6OBZ4VSFwbnL7ysxm8zX/E2JscmmW8NH5mI+L/lNXyru4a0y8DUDf8ccrreHI2k9tStG2nMNOQTB6EZKWQ6lH6yKfspav8+BEUNyj83iX5tgtH8nHpoqog2+5vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594051; c=relaxed/simple;
	bh=BLTRwtz3YBs2pngVg5PWFf38tW2Rp+sMMO/EaDd4FZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7lAcheINmacdvWWriizyGvmQWCUH2ca6LMqrsfuJGPNbjQdDMqjVKuX47TSqNUGR98CT4AsIKq53CxNStFC9eLUv9XCOTcvDqDpPjXg3MdzHDFTBTA8aPe0kkLDeniUeo4Qqp/kUIDKkzNakxpxiRemLtQJopUakJUtwxR3Tss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=zQYYf40y; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="zQYYf40y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594047; x=1800130047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BLTRwtz3YBs2pngVg5PWFf38tW2Rp+sMMO/EaDd4FZk=;
  b=zQYYf40yKw5S4PYSEMgxNYkx0fihho7UVVH4el82uK7+ZjqDg6KN1Lcy
   226PpW64s7Qis6LqZfUK6A+f58Y+/qN7tqdAiIWKaVHdXz63r0k4ikFxP
   9Av8VXYvHgUORoTdBBEuWH6Q3J3VKzYTDDRnoePV9Gdn6E3vHBMZ4m9yE
   S0PF4exs5NuXjaqF/h+qGgLH7mZ8NCnoCK1mFVWVT5g8mlo+NQ9sE9/o/
   JZfp9o6OZ7SNkxB/nQSrljD853GtFE9z9WLAXYbHwUD3wbrUCyjdgzsSp
   7+DEKxWqyZyV7iwcfIaVHNdoaXr3javQKw4CP4+5Lh1ik8adRDiyxei00
   g==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: RRO7qsQtQm61jURZdILAnw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042233"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:03 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:03 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 02/31] clk: at91: pmc: Move macro to header file
Date: Fri, 16 Jan 2026 13:06:55 -0700
Message-ID: <ab320688cf0f527089254eeb242acbb87569c509.1768512290.git.ryan.wanner@microchip.com>
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

Move this macro to the header file as it is used by more than one driver
file.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h      | 3 +++
 drivers/clk/at91/sama7d65.c | 3 ---
 drivers/clk/at91/sama7g5.c  | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 1ac0f77a867a..63c028b7b54c 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -23,6 +23,9 @@
 	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
 })
 
+/* Used to create an array entry identifying a PLL by its components. */
+#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7dee2b160ffb..ec2ef1a0249a 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -432,9 +432,6 @@ static struct sama7d65_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[0..9]) description
  * @n:			clock name
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 1340c2b00619..713f5dfe7be2 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -343,9 +343,6 @@ static struct sama7g5_pll {
 	},
 };
 
-/* Used to create an array entry identifying a PLL by its components. */
-#define PLL_IDS_TO_ARR_ENTRY(_id, _comp) { PLL_ID_##_id, PLL_COMPID_##_comp}
-
 /*
  * Master clock (MCK[1..4]) description
  * @n:			clock name
-- 
2.43.0

