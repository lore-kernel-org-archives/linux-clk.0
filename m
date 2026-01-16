Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915313A1D1D;
	Fri, 16 Jan 2026 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594050; cv=none; b=eY0UIIOuON6dUEBJqBVs68ktRH/XBvYSAJwoA8jCRdoiLdzdBIopnttYyh4Q3TYukhIk3L4MByB9cdKsIg2e7YGXQ2uvXHqDpJ0vWsNwwBAQHs29l/0l0qVFATp63gVek7Agz8Sy4SrgMZ2jxl9F25Oi+I/V7tAcc0ipN1WhvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594050; c=relaxed/simple;
	bh=Aw/tGbpDi+/qWY26Y9sF33D9NnFYEfAjwfpj8Zdq7M8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvouabeNkDkJ7WS9NPfO1EWoslEZFIaT07nPq+kHPI3gyuKNrW73S8zd+cq+AGfc/KdYfzpDjJCJpS3K8kD13Riqjf3dAbBTE7l1WLvs0sm6GVjPImwgzVRPGbSsXrcd2UM4p7GuI8sKe8gDF1PSGmSoC9e4dtm3FuDjggY96Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kGBB8syi; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kGBB8syi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594046; x=1800130046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Aw/tGbpDi+/qWY26Y9sF33D9NnFYEfAjwfpj8Zdq7M8=;
  b=kGBB8syiA7Jkrg1bOZBPYnyLCi/In8xIDHad3jRcZJkrl28kWu9eIHzu
   mY6FA1QcXQKwRzUcZ6HbSTLamz1w1YrdgOAVG/Ahn3X3MoG/QfKBGC+zx
   bvLqu2NU+SbvruWU7kx7nhFpmlTH6mjlstGuICJK4/1/nnPA2XKCbbrDO
   jnCHdzww4OqoqvVsyCbgObRt5h+kNM4g91CThi1azuOJsD0K5l+y7MuM5
   N2jvC2T01ClZIXlr5KldnqWzE03czeYeDqQzHlaGoZu9dDJekXqI6o7gh
   df2HLOTBLlxOuA7PkRKM6txRmsVuS1PvG9Q5hyFeQaUqL93/KKZUIpDC8
   Q==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: es4YwJhhRvuprFsOtjO9Cg==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042231"
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
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 01/31] clk: at91: pmc: add macros for clk_parent_data
Date: Fri, 16 Jan 2026 13:06:54 -0700
Message-ID: <e89c803000d18109357f27bd17a86885652088dc.1768512290.git.ryan.wanner@microchip.com>
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

Add helpers to set parent_data objects in platform specific drivers.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: enclose complex macro with parentheses.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 5daa32c4cf25..1ac0f77a867a 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -15,6 +15,14 @@
 
 #include <dt-bindings/clock/at91.h>
 
+#define AT91_CLK_PD_NAME(n) ((struct clk_parent_data){ \
+	.hw = NULL, .name = (n), .fw_name = NULL, .index = -1, \
+})
+
+#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ \
+	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
+})
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
-- 
2.43.0

