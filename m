Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A341C10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F1A420869
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CegbdyXQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfDLSWz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 14:22:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46548 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfDLSWy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 14:22:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMnVB101135;
        Fri, 12 Apr 2019 13:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555093369;
        bh=YO/7yfB16bZTH1oOk0/2djRimzzJat8moz+rKnBKPug=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=CegbdyXQ0m3rrfki0+AQ0DdbXTl6hKoKRq4ho/r6lWGipchgDP15lt6Cedv9CsuQJ
         pCVx6/neyp2N5N7zplYW1BAtcJaEffSkTuM+fTZCDrvUCoNDB1GdRP3fNoxbs+0WKr
         G/agXZrLhnD1HQTmgAOsYlS1RAgX5YUsCA/QuG1I=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3CIMn1r109659
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Apr 2019 13:22:49 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Apr 2019 13:22:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Apr 2019 13:22:46 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMYYl060123;
        Fri, 12 Apr 2019 13:22:42 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
Subject: [PATCH 3/3] clk: keystone: sci-clk: probe clocks from DT instead of firmware
Date:   Fri, 12 Apr 2019 21:22:22 +0300
Message-ID: <1555093342-428-4-git-send-email-t-kristo@ti.com>
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

Probing all the available clocks from the PM firmware takes quite a lot
of time, increasing boot time. Instead, implement functionality that
parses only the used clocks from DT, and registers these to clock core.
This way, the boot time is greatly improved.

Additionally, provide a Kconfig option for parsing all the clocks from
firmware, if someone requires this. It is mostly useful as a debugging
functionality if we want to inspect the whole clock tree.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/Kconfig   |  11 ++++
 drivers/clk/keystone/sci-clk.c | 123 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/drivers/clk/keystone/Kconfig b/drivers/clk/keystone/Kconfig
index b04927d..aaaee7d 100644
--- a/drivers/clk/keystone/Kconfig
+++ b/drivers/clk/keystone/Kconfig
@@ -14,3 +14,14 @@ config TI_SCI_CLK
 	  This adds the clock driver support over TI System Control Interface.
 	  If you wish to use clock resources from the PMMC firmware, say Y.
 	  Otherwise, say N.
+
+config TI_SCI_CLK_PROBE_FROM_FW
+	bool "Probe available clocks from firmware"
+	depends on TI_SCI_CLK
+	default n
+	help
+	  Forces the TI SCI clock driver to probe available clocks from the
+	  firmware. By default, only the used clocks are probed from DT.
+	  This is mostly only useful for debugging purposes, and will
+	  increase the boot time of the device. If you want the clocks probed
+	  from firmware, say Y. Otherwise, say N.
diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 1e465de..6e5268c 100644
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
@@ -403,6 +406,7 @@ static int ti_sci_init_clocks(struct sci_clk_provider *p)
 };
 MODULE_DEVICE_TABLE(of, ti_sci_clk_of_match);
 
+#ifdef CONFIG_TI_SCI_CLK_PROBE_FROM_FW
 static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 {
 	int ret;
@@ -479,6 +483,117 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 	return 0;
 }
 
+#else
+
+static int _cmp_sci_clk_list(void *priv, struct list_head *a,
+			     struct list_head *b)
+{
+	struct sci_clk *ca = container_of(a, struct sci_clk, node);
+	struct sci_clk *cb = container_of(b, struct sci_clk, node);
+
+	return _cmp_sci_clk(ca, &cb);
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
+		if (!of_device_is_available(np))
+			continue;
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
+#endif
+
 /**
  * ti_sci_clk_probe - Probe function for the TI SCI clock driver
  * @pdev: platform device pointer to be probed
@@ -509,11 +624,19 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 	provider->ops = &handle->ops.clk_ops;
 	provider->dev = dev;
 
+#ifdef CONFIG_TI_SCI_CLK_PROBE_FROM_FW
 	ret = ti_sci_scan_clocks_from_fw(provider);
 	if (ret) {
 		dev_err(dev, "scan clocks from FW failed: %d\n", ret);
 		return ret;
 	}
+#else
+	ret = ti_sci_scan_clocks_from_dt(provider);
+	if (ret) {
+		dev_err(dev, "scan clocks from DT failed: %d\n", ret);
+		return ret;
+	}
+#endif
 
 	ret = ti_sci_init_clocks(provider);
 	if (ret) {
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
