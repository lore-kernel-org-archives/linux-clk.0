Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4893AF664;
	Tue,  5 May 2026 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965251; cv=none; b=Cv9YnMKFvbsKbhN+58TQSkJ7jwJOHSHsEKkpOI/bisNz/ticAEXm40GBNUijJaZ3prpJ0wqludqv0nf96PhP5TL/AtRqH0UqgOzywQ5+Iti8ItAy13N324Fum83iV86EcWVXI0XYKxf9/ty3y1l7Yd6bZP0sjHH6amY/56MDy/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965251; c=relaxed/simple;
	bh=2lBb5hVR2eSqgfIuR2Ak6b8AiEDcdnTXsafnRMOnZTg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fqSbF7oJ8Q+G782U/+lrSloyDGc/MKxO4nn4b8exEnrTfrxRnFbJbIG2qRUo8uQxNgBcvTHFQGMBLDDA8XE+BKSTXChgzKnOD/P18wnALYO1Zo0yT2jJ+1lchjlgBmjTU5riyLtpab3jA/vwSzv+ndNcJejMDjpYqwF5Tlyt6uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XzWQV2xe; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XzWQV2xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777965250; x=1809501250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2lBb5hVR2eSqgfIuR2Ak6b8AiEDcdnTXsafnRMOnZTg=;
  b=XzWQV2xenNsSlOIwQ3pBs9wruJ6tzFhiM3dHJ0siAsY6wRElK137Ewv0
   TbIY0NVOgdY+vh1x7ufMWqU0eOkuMTfC6Vf+IAf2RR1ZrwMRPAflQOVP7
   h7c+2jRRknwdUlzDKFhiyXl46uqKl+aynHfq3Rf5eoRDtSXxSCG6hpKUZ
   rdGHMw41LofjOZghJcOrIEenPYm6k4PsZukxX5b9Ejpyih5GHyTLEuChj
   bDT3yUwhxg2PP+Gxrwzq/z87EXBJj/Jljtds4BW373+o0Fv4EAlHUM0UN
   TGB65PWBhPiNU4F3SJvQF1e/OcJOekfLBb+y9GiXK6pt2ZJD9SBmemGJv
   A==;
X-CSE-ConnectionGUID: 0D5vLf71RqyBSSpqVg3r5g==
X-CSE-MsgGUID: Uh3vINQKS9Gh97g3+Vzllw==
X-IronPort-AV: E=Sophos;i="6.23,217,1770620400"; 
   d="scan'208";a="56268042"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:14:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 5 May 2026 00:14:08 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 00:14:00 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<adrian.hunter@intel.com>, <jarkko.nikula@linux.intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v5 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the required quirk
Date: Tue, 5 May 2026 12:43:25 +0530
Message-ID: <20260505071327.125787-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505071327.125787-1-manikandan.m@microchip.com>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
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

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v5:
- Remove HCI_QUIRK_CLK_SUPPORT quirk and call
devm_clk_bulk_get_all_enabled unconditionally

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
 drivers/i3c/master/mipi-i3c-hci/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index b781dbed2165..20d32a9eb62c 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/i3c/master.h>
@@ -970,6 +971,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
 {
 	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
 	struct i3c_hci *hci;
+	struct clk_bulk_data *clks;
 	int irq, ret;
 
 	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
@@ -1001,6 +1003,11 @@ static int i3c_hci_probe(struct platform_device *pdev)
 	if (!hci->quirks && platform_get_device_id(pdev))
 		hci->quirks = platform_get_device_id(pdev)->driver_data;
 
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get clocks\n");
+
 	ret = i3c_hci_init(hci);
 	if (ret)
 		return ret;
@@ -1031,6 +1038,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
 
 static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 	{ .compatible = "mipi-i3c-hci", },
+	{ .compatible = "microchip,sama7d65-i3c-hci",
+	  .data = (void *)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
+			   HCI_QUIRK_RESP_BUF_THLD) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
-- 
2.25.1

