Return-Path: <SRS0=FPSA=NS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC3DC0044C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7577720862
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7577720862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbeKHDIV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Nov 2018 22:08:21 -0500
Received: from relmlor3.renesas.com ([210.160.252.173]:58195 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727722AbeKHDIV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Nov 2018 22:08:21 -0500
Received: from unknown (HELO relmlir3.idc.renesas.com) ([10.200.68.153])
  by relmlie2.idc.renesas.com with ESMTP; 08 Nov 2018 02:36:55 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir3.idc.renesas.com (Postfix) with ESMTP id 3B3574D9DB;
        Thu,  8 Nov 2018 02:36:55 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,476,1534777200"; 
   d="scan'208";a="295393486"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 08 Nov 2018 02:36:53 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.108])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 97C141F8;
        Wed,  7 Nov 2018 17:36:49 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date:   Wed,  7 Nov 2018 12:35:57 -0500
Message-Id: <20181107173558.54481-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181107173558.54481-1-chris.brandt@renesas.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The RZ/A2 has the same USB2 host controller as R-Car Gen3 with only some
minor differences.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/phy/renesas/Kconfig              |  2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index e340a925bbb1..beebeba31e84 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
 config PHY_RCAR_GEN3_USB2
 	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
 	depends on ARCH_RENESAS
-	depends on EXTCON
+	depends on EXTCON || ARCH_R7S9210
 	depends on USB_SUPPORT
 	select GENERIC_PHY
 	select USB_COMMON
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d0f412c25981..96ac75ba40ea 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -34,6 +34,7 @@
 #define USB2_VBCTRL		0x60c
 #define USB2_LINECTRL1		0x610
 #define USB2_ADPCTRL		0x630
+#define USB2_PHYCLK_CTRL	0x644
 
 /* INT_ENABLE */
 #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
@@ -88,6 +89,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool uses_usb_x1;
 };
 
 /*
@@ -326,6 +328,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	struct rcar_gen3_chan *channel = phy_get_drvdata(p);
 	void __iomem *usb2_base = channel->base;
 
+	if (channel->uses_usb_x1)
+		writel(0x00000001, usb2_base + USB2_PHYCLK_CTRL);
+
 	/* Initialize USB2 part */
 	writel(USB2_INT_ENABLE_INIT, usb2_base + USB2_INT_ENABLE);
 	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
@@ -334,6 +339,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	/* Initialize otg part */
 	if (channel->is_otg_channel)
 		rcar_gen3_init_otg(channel);
+	else
+		/* No otg, so default to host mode */
+		writel(0x00000000, usb2_base + USB2_COMMCTRL);
 
 	return 0;
 }
@@ -406,6 +414,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 }
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
+	{ .compatible = "renesas,usb2-phy-r7s9210" },
 	{ .compatible = "renesas,usb2-phy-r8a7795" },
 	{ .compatible = "renesas,usb2-phy-r8a7796" },
 	{ .compatible = "renesas,usb2-phy-r8a77965" },
@@ -471,6 +480,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
+		channel->uses_usb_x1 = true;
+
 	/*
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
-- 
2.16.1

