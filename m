Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836C2C43444
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4831C20827
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iqCPygxk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfAHNbq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jan 2019 08:31:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33336 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfAHNbq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jan 2019 08:31:46 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x08DVYKl070017;
        Tue, 8 Jan 2019 07:31:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1546954294;
        bh=KLUDPgiqB2RNqQgymE+6+90cu36gYyuW3rKexeJElss=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=iqCPygxknmCdN6bSCSj8Uoh9A128i0gpGf4cRaEQnNk/a/5GK4l5TfNUCpb0HA51v
         FgRALXB/HSmHJG6TnZWtfkOkor8h8eceQPQ8kMDDXHmWfV2WDLPY8dbALZcbNZomzx
         UHgmsrEHTAGHCdTh8WnA3gi27DazHx7g1RbZkSrM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x08DVX5S120735
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Jan 2019 07:31:34 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 8
 Jan 2019 07:31:32 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 8 Jan 2019 07:31:32 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x08DVMug011668;
        Tue, 8 Jan 2019 07:31:28 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh+dt@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/3] clk: keystone: sci-clk: add support from parsing clock info from DT
Date:   Tue, 8 Jan 2019 15:30:22 +0200
Message-ID: <1546954223-9738-3-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the sci-clk driver queries clock data from the firmware, which
can be pretty slow operation in certain cases. Add an option for the
driver to probe the available clocks from DT also, in this case the
number of clocks probed from firmware gets cut down drastically. To
enable the feature, a new flag ti,scan-clocks-from-dt can be added
under the clock provider node.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Andreas Dannenberg <dannenberg@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 188 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 159 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 4cb70be..d1d6dc8 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/bsearch.h>
+#include <linux/list_sort.h>
 
 #define SCI_CLK_SSC_ENABLE		BIT(0)
 #define SCI_CLK_ALLOW_FREQ_CHANGE	BIT(1)
@@ -52,6 +53,7 @@ struct sci_clk_provider {
  * @num_parents: Number of parents for this clock
  * @provider:	 Master clock provider
  * @flags:	 Flags for the clock
+ * @node:	 Link for handling clocks probed via DT
  */
 struct sci_clk {
 	struct clk_hw hw;
@@ -60,6 +62,7 @@ struct sci_clk {
 	u8 num_parents;
 	struct sci_clk_provider *provider;
 	u8 flags;
+	struct list_head node;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -353,6 +356,15 @@ static int _cmp_sci_clk(const void *a, const void *b)
 	return -1;
 }
 
+static int _cmp_sci_clk_list(void *priv, struct list_head *a,
+			     struct list_head *b)
+{
+	struct sci_clk *ca = container_of(a, struct sci_clk, node);
+	struct sci_clk *cb = container_of(b, struct sci_clk, node);
+
+	return _cmp_sci_clk(ca, &cb);
+}
+
 /**
  * sci_clk_get - Xlate function for getting clock handles
  * @clkspec: device tree clock specifier
@@ -404,22 +416,8 @@ static int ti_sci_init_clocks(struct sci_clk_provider *p)
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
@@ -430,18 +428,7 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
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
@@ -502,13 +489,156 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 
 	devm_kfree(dev, clks);
 
+	return 0;
+}
+
+static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
+{
+	struct device *dev = provider->dev;
+	struct device_node *np = NULL;
+	int ret;
+	int index;
+	struct of_phandle_args args;
+	struct list_head clks;
+	struct sci_clk *sci_clk, *prev;
+	int num_clks = 0;
+	int num_parents;
+	int clk_id;
+
+	INIT_LIST_HEAD(&clks);
+
+	while (1) {
+		np = of_find_node_with_property(np, "clocks");
+		if (!np)
+			break;
+
+		index = 0;
+
+		do {
+			ret = of_parse_phandle_with_args(np, "clocks",
+							 "#clock-cells", index,
+							 &args);
+			if (ret)
+				break;
+
+			if (args.args_count == 2 && args.np == dev->of_node) {
+				sci_clk = devm_kzalloc(dev, sizeof(*sci_clk),
+						       GFP_KERNEL);
+				if (!sci_clk)
+					return -ENOMEM;
+
+				sci_clk->dev_id = args.args[0];
+				sci_clk->clk_id = args.args[1];
+				sci_clk->provider = provider;
+				provider->ops->
+					get_num_parents(provider->sci,
+							sci_clk->dev_id,
+							sci_clk->clk_id,
+							&sci_clk->num_parents);
+				list_add_tail(&sci_clk->node, &clks);
+
+				num_clks++;
+
+				num_parents = sci_clk->num_parents;
+				if (num_parents == 1)
+					num_parents = 0;
+
+				clk_id = args.args[1] + 1;
+
+				while (num_parents--) {
+					sci_clk = devm_kzalloc(dev,
+							       sizeof(*sci_clk),
+							       GFP_KERNEL);
+					if (!sci_clk)
+						return -ENOMEM;
+					sci_clk->dev_id = args.args[0];
+					sci_clk->clk_id = clk_id++;
+					sci_clk->provider = provider;
+					list_add_tail(&sci_clk->node, &clks);
+
+					num_clks++;
+				}
+			}
+
+			index++;
+		} while (args.np);
+	}
+
+	list_sort(NULL, &clks, _cmp_sci_clk_list);
+
+	provider->clocks = devm_kmalloc_array(dev, num_clks, sizeof(sci_clk),
+					      GFP_KERNEL);
+	if (!provider->clocks)
+		return -ENOMEM;
+
+	num_clks = 0;
+	prev = NULL;
+
+	list_for_each_entry(sci_clk, &clks, node) {
+		if (prev && prev->dev_id == sci_clk->dev_id &&
+		    prev->clk_id == sci_clk->clk_id)
+			continue;
+
+		provider->clocks[num_clks++] = sci_clk;
+		prev = sci_clk;
+	}
+
+	provider->num_clocks = num_clks;
+
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
+	if (of_property_read_bool(np, "ti,scan-clocks-from-dt")) {
+		ret = ti_sci_scan_clocks_from_dt(provider);
+		if (ret) {
+			dev_err(dev, "scan clocks from DT failed: %d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = ti_sci_scan_clocks_from_fw(provider);
+		if (ret) {
+			dev_err(dev, "scan clocks from FW failed: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = ti_sci_init_clocks(provider);
 	if (ret) {
-		pr_err("ti-sci-init-clocks failed.\n");
+		dev_err(dev, "init-clocks failed: %d\n", ret);
 		return ret;
 	}
 
-	return of_clk_add_hw_provider(np, sci_clk_get, provider);
+	return of_clk_add_hw_provider(dev->of_node, sci_clk_get, provider);
 }
 
 /**
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
