Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC263C282CE
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A026120869
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RXLjqTWE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfDLSWu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 14:22:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49482 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfDLSWu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 14:22:50 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMhcf088372;
        Fri, 12 Apr 2019 13:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555093364;
        bh=tDG44Vt4584Rd2sNRDh0O70euESEC+9ovgb60TrmNzk=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=RXLjqTWEhOD4RtykYQHjWnxp8MlWk/guTJfJEGytOEztQzBkaQqMF3MnMUWYPumdc
         bq5g9M4GbT/ZJsmJvfMtpS2jFtQ5YwboKpQghkN3ph+ZzKy7gJFqzrEzQUK+p9Zbtm
         OX1sga1gZmRdHZ+1fNF0RN7wY+ynnPY/TggVlSMo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3CIMhad029737
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Apr 2019 13:22:43 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Apr 2019 13:22:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Apr 2019 13:22:42 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMYYk060123;
        Fri, 12 Apr 2019 13:22:38 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
Subject: [PATCH 2/3] clk: keystone: sci-clk: split out the fw clock parsing to own function
Date:   Fri, 12 Apr 2019 21:22:21 +0300
Message-ID: <1555093342-428-3-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1555093342-428-1-git-send-email-t-kristo@ti.com>
References: <1555093342-428-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This makes it both easier to see what the probe does, and also makes it
possible to add alternative implementations for the clock data source.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 68 +++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index e737f24..1e465de 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -403,22 +403,8 @@ static int ti_sci_init_clocks(struct sci_clk_provider *p)
 };
 MODULE_DEVICE_TABLE(of, ti_sci_clk_of_match);
 
-/**
- * ti_sci_clk_probe - Probe function for the TI SCI clock driver
- * @pdev: platform device pointer to be probed
- *
- * Probes the TI SCI clock device. Allocates a new clock provider
- * and registers this to the common clock framework. Also applies
- * any required flags to the identified clocks via clock lists
- * supplied from DT. Returns 0 for success, negative error value
- * for failure.
- */
-static int ti_sci_clk_probe(struct platform_device *pdev)
+static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct sci_clk_provider *provider;
-	const struct ti_sci_handle *handle;
 	int ret;
 	int num_clks = 0;
 	struct sci_clk **clks = NULL;
@@ -429,18 +415,7 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 	int dev_id = 0;
 	u8 num_parents;
 	int gap_size = 0;
-
-	handle = devm_ti_sci_get_handle(dev);
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
-	if (!provider)
-		return -ENOMEM;
-
-	provider->sci = handle;
-	provider->ops = &handle->ops.clk_ops;
-	provider->dev = dev;
+	struct device *dev = provider->dev;
 
 	while (1) {
 		ret = provider->ops->get_num_parents(provider->sci, dev_id,
@@ -501,6 +476,45 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 
 	devm_kfree(dev, clks);
 
+	return 0;
+}
+
+/**
+ * ti_sci_clk_probe - Probe function for the TI SCI clock driver
+ * @pdev: platform device pointer to be probed
+ *
+ * Probes the TI SCI clock device. Allocates a new clock provider
+ * and registers this to the common clock framework. Also applies
+ * any required flags to the identified clocks via clock lists
+ * supplied from DT. Returns 0 for success, negative error value
+ * for failure.
+ */
+static int ti_sci_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct sci_clk_provider *provider;
+	const struct ti_sci_handle *handle;
+	int ret;
+
+	handle = devm_ti_sci_get_handle(dev);
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->sci = handle;
+	provider->ops = &handle->ops.clk_ops;
+	provider->dev = dev;
+
+	ret = ti_sci_scan_clocks_from_fw(provider);
+	if (ret) {
+		dev_err(dev, "scan clocks from FW failed: %d\n", ret);
+		return ret;
+	}
+
 	ret = ti_sci_init_clocks(provider);
 	if (ret) {
 		pr_err("ti-sci-init-clocks failed.\n");
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
