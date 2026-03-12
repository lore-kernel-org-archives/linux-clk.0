Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B08A396567;
	Thu, 12 Mar 2026 04:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289309; cv=none; b=kxRelG1pukrtii2MUh4pc1EOHHNokTYs+PU7ZFNMfQyEP14UGkQ/JFsHWK/4EXEHQRtfP28rNx3byJ02JRSFQElPXSr0HlHSExSsdN8fWaUa+XnT74wgCT2nqUZ6zvSXQr/wk0Ry2dCoX7jpxHJz4u8UrQIEwJp63azHP6KFsm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289309; c=relaxed/simple;
	bh=Mfapho4KyK74MRDmiN5G9sod8x6U/8WWa0F9VXk3Lfo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UZ8Q/IHEW4rurMKmYQZlGgsRRWc0IlR2jySvLlYwuF7UmhLrkR1NSwMobinFtvxI9RiYlStbH+7DD34HyJPqy/+lj6G27v0ey/+nyR0jtiq+uVaAdry6XqYYvHwKQMd63Xxg5WKzYeWjIeJ+M+WzhLuxN33eYgjq4kX2DRA9Vp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Ib2/Tv7g; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ib2/Tv7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773289306; x=1804825306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mfapho4KyK74MRDmiN5G9sod8x6U/8WWa0F9VXk3Lfo=;
  b=Ib2/Tv7gJbgDLUS2eAk1qK8gtXxjvY8XbdmxbEyU45OakHoJtqwaZbNJ
   K7257E83N+RXus56QzAhmZOZGFpT9P5FJKrONn19033BatUyxojVv3+vB
   nGV6FtoryvJRkt70Cxqlra0NuWBTDsofmqwtVV8hOD552Lc4tzh+YV+rH
   EaApGR3acx7FFSXu+wKSltuJKzv7KUQIV5fbft5BqgDKTzC5yBB3msv3k
   ovWBWBTCwoeHSjLgzxqeajOUYw+OqF6x2wkLuxYi6DbZu7kumnGYliRvN
   gNt2WfuV2PVa2Zxu4qGgAWzaJWHB8C6VMXYmdWOgMH3NzbuVJL70IR7JN
   A==;
X-CSE-ConnectionGUID: fvtvzCBGTY2f4cyuaBkSKA==
X-CSE-MsgGUID: hKcz80kJRvGUhvYdZ4CKGQ==
X-IronPort-AV: E=Sophos;i="6.23,115,1770620400"; 
   d="scan'208";a="54551532"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Mar 2026 21:21:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Mar 2026 21:21:39 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Mar 2026 21:21:30 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the appropriate quirk
Date: Thu, 12 Mar 2026 09:50:54 +0530
Message-ID: <20260312042056.309237-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260312042056.309237-1-manikandan.m@microchip.com>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add support for microchip sama7d65 SoC I3C HCI master only IP
with additional clock support to enable bulk clock acquisition
for Microchip platforms using HCI_QUIRK_CLK_SUPPORT quirk.
Introduce MCHP_I3C_CLK_IDX to define the maximum peripheral
clock index

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Make use of existing HCI_QUIRK_* code base
- Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Peripheral
and system generic clk in bulk

Changes in v2:
- Platform specific changes are integrated in the existing mipi-i3c-hci
driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
specific quirk files

---
 drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 5879bba78164..6b7716bd517e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
@@ -918,6 +919,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
 {
 	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
 	struct i3c_hci *hci;
+	struct clk_bulk_data *clks;
 	int irq, ret;
 
 	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
@@ -946,6 +948,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
+	if (hci->quirks & HCI_QUIRK_CLK_SUPPORT) {
+		ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+		if (ret < MCHP_I3C_CLK_IDX)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to get clocks\n");
+	}
+
 	ret = i3c_hci_init(hci);
 	if (ret)
 		return ret;
@@ -971,6 +980,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
+	{ .compatible = "microchip,sama7d65-i3c-hci",
+	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
+			   HCI_QUIRK_RESP_BUF_THLD | HCI_QUIRK_CLK_SUPPORT) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 337b7ab1cb06..2571ef6374ce 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -140,12 +140,16 @@ struct i3c_hci_dev_data {
 	void *ibi_data;
 };
 
+#define MCHP_I3C_CLK_IDX		2 /* Max peripheral clock index for Microchip platforms */
+
 /* list of quirks */
 #define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
 #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
+#define HCI_QUIRK_CLK_SUPPORT		BIT(6)  /* Enable Clocks for Microchip platforms*/
+
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
-- 
2.25.1

