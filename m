Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C636213B;
	Wed, 18 Mar 2026 05:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773813211; cv=none; b=aTt9RZ2dOwvKzMQDWyAs5lrYFYEn80+zqcI4QClX609zJr3uPQum/c5+taiMqMcA+5CJGEeS1M01CB3fIuV+E9YU95IHLIv21Zz8g38DaqVMLZl+l0NNk9DeYNHu9oNCtDQf7yl4rJLFlt/ElE50XS5rJossDs8RsuIhJNbhwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773813211; c=relaxed/simple;
	bh=RPOloYqq9rrZ7VgT1x2nQRqLYrx+qWYnpICldMjEYvw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q6DuhYsF7GUq/QWRfiY0wbZrNv9nInRZvrwP0sIIlstpECXuwecrbj6sEWSO9Ewqy5tmdlBvRLq5A3ZnN2nFH83go+HdJHWmRUMcTsZwbXNTe9GIIUkmGKH0GGWIatvH11BpuDzpnzouwmg0M1bXSFNt7MyKxMslaX8XcSzpHJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=KHQyqqjN; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KHQyqqjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773813211; x=1805349211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RPOloYqq9rrZ7VgT1x2nQRqLYrx+qWYnpICldMjEYvw=;
  b=KHQyqqjNzqv5aXsby75rcKrJllEToZFYi6+QxSk2KhbozfD1kCYBnKux
   mFVRjiiWrLk+8fGrWJqi/8mLimkBs6C5x1cEGh0L6TfA1F+jTXQCWXlkU
   PEoOtVtabsSqoiiGWX2F4xANkoP1fBgo6h2fFREGi0E0hOBwKfVMQhUec
   45ohpxCljpa3bLVFC1ufsJEPFGzazY9GgZVvEunCQZfquCWfzxN+8DQum
   ddVFlPdJ9AsVV56C7meMrRqCfPOEiNo/dRPSLKhI8w+wU9AzhxmHn7ECQ
   PbHgVEj+gJQnJemdQFz8Wip2pcS7OeJDc9m5+KBMFqTvIpbWQb3N5f5Ln
   A==;
X-CSE-ConnectionGUID: TZ/u7H+YTQiHBRAlQQhOfg==
X-CSE-MsgGUID: Ul09IGzTTum2bn8E84dyIQ==
X-IronPort-AV: E=Sophos;i="6.23,126,1770620400"; 
   d="scan'208";a="286208455"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:53:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 17 Mar 2026 22:53:18 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Mar 2026 22:53:09 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <ebiggers@google.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the appropriate quirk
Date: Wed, 18 Mar 2026 11:22:28 +0530
Message-ID: <20260318055230.307030-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260318055230.307030-1-manikandan.m@microchip.com>
References: <20260318055230.307030-1-manikandan.m@microchip.com>
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

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v4:
- Remove the clock index variable MCHP_I3C_CLK_IDX

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
 drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 284f3ed7af8c..41b7737d22ac 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
@@ -950,6 +951,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
 {
 	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
 	struct i3c_hci *hci;
+	struct clk_bulk_data *clks;
 	int irq, ret;
 
 	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
@@ -981,6 +983,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
+	if (hci->quirks & HCI_QUIRK_CLK_SUPPORT) {
+		ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to get clocks\n");
+	}
+
 	ret = i3c_hci_init(hci);
 	if (ret)
 		return ret;
@@ -1008,6 +1017,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
+	{ .compatible = "microchip,sama7d65-i3c-hci",
+	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
+			   HCI_QUIRK_RESP_BUF_THLD | HCI_QUIRK_CLK_SUPPORT) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
index 9ac9d0e342f4..f01b959a28d9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/hci.h
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -150,6 +150,7 @@ struct i3c_hci_dev_data {
 #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
 #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
 #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
+#define HCI_QUIRK_CLK_SUPPORT		BIT(6)  /* Enable Clocks for Microchip platforms*/
 
 /* global functions */
 void mipi_i3c_hci_resume(struct i3c_hci *hci);
-- 
2.25.1

