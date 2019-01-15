Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8615C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DB3820645
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wtumu0Ak"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbfAOJPr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 04:15:47 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42746 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfAOJPr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 04:15:47 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0F9Fe0g126033;
        Tue, 15 Jan 2019 03:15:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1547543740;
        bh=YyAevtOju3LVdkVqSdHobKFV916q4x1QJDl5FXNzNo0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Wtumu0Ak5KKim1a00l/K4P2QaqKWA10ypc8wsZPuX6/En/Tr/NfcOyCtAZqOJmaw6
         JNYdnB2TzcQ+6KN+vUy4GfMtmxee2NjN2LRpAAW+N+6amrhxe4WJHvCy1A7T9srsH3
         PMdmslvhXqh947DXP+z8NLEGFyVjnvjfX0g0OukU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0F9Fep4107480
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Jan 2019 03:15:40 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 15
 Jan 2019 03:15:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 15 Jan 2019 03:15:39 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0F9FNLk016112;
        Tue, 15 Jan 2019 03:15:35 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 4/4] clk: ti: generalize the init sequence of clk_hw_omap clocks
Date:   Tue, 15 Jan 2019 11:15:15 +0200
Message-ID: <1547543715-16467-5-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a generic API for initializing clocks of clk_hw_omap type clocks,
and convert the whole TI clock driver suite to use this for registering
the clocks. Also, get rid of the now redundant API for adding the clocks
to the OMAP HW clocks list; instead this is used directly from the
register API.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/apll.c      |  4 ++--
 drivers/clk/ti/clk.c       | 31 +++++++++++++++++++++----------
 drivers/clk/ti/clock.h     |  3 ++-
 drivers/clk/ti/dpll.c      | 11 ++++-------
 drivers/clk/ti/gate.c      |  2 +-
 drivers/clk/ti/interface.c |  4 +---
 6 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
index 222f68b..015a657 100644
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -165,7 +165,7 @@ static void __init omap_clk_register_apll(void *user,
 
 	ad->clk_bypass = __clk_get_hw(clk);
 
-	clk = ti_clk_register(NULL, &clk_hw->hw, node->name);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, node->name);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(clk_hw->hw.init->parent_names);
@@ -402,7 +402,7 @@ static void __init of_omap2_apll_setup(struct device_node *node)
 	if (ret)
 		goto cleanup;
 
-	clk = clk_register(NULL, &clk_hw->hw);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, node->name);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(init);
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 05f9d1a..e26cd1d 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -520,20 +520,31 @@ struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
 }
 
 /**
- * omap2_init_clk_hw_omap_clocks - initialize an OMAP clock
- * @hw: struct clk_hw * to initialize
+ * ti_clk_register_omap_hw - register a clk_hw_omap to the clock framework
+ * @dev: device for this clock
+ * @hw: hardware clock handle
+ * @con: connection ID for this clock
  *
- * Add an OMAP clock @clk to the internal list of OMAP clocks.  Used
- * temporarily for autoidle handling, until this support can be
- * integrated into the common clock framework code in some way.  No
- * return value.
+ * Registers a clk_hw_omap clock to the clock framewor, adds a clock alias
+ * for it, and adds the list to the available clk_hw_omap type clocks.
+ * Returns a handle to the registered clock if successful, ERR_PTR value
+ * in failure.
  */
-void omap2_init_clk_hw_omap_clocks(struct clk_hw *hw)
+struct clk *ti_clk_register_omap_hw(struct device *dev, struct clk_hw *hw,
+				    const char *con)
 {
-	struct clk_hw_omap *c;
+	struct clk *clk;
+	struct clk_hw_omap *oclk;
 
-	c = to_clk_hw_omap(hw);
-	list_add(&c->node, &clk_hw_omap_clocks);
+	clk = ti_clk_register(dev, hw, con);
+	if (IS_ERR(clk))
+		return clk;
+
+	oclk = to_clk_hw_omap(hw);
+
+	list_add(&oclk->node, &clk_hw_omap_clocks);
+
+	return clk;
 }
 
 /**
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 034ff6a..1c0fac5 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -203,6 +203,8 @@ struct omap_clkctrl_data {
 
 struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
 			    const char *con);
+struct clk *ti_clk_register_omap_hw(struct device *dev, struct clk_hw *hw,
+				    const char *con);
 int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con);
 void ti_clk_add_aliases(void);
 
@@ -221,7 +223,6 @@ int ti_clk_retry_init(struct device_node *node, void *user,
 		      ti_of_clk_init_cb_t func);
 int ti_clk_add_component(struct device_node *node, struct clk_hw *hw, int type);
 
-void omap2_init_clk_hw_omap_clocks(struct clk_hw *hw);
 int of_ti_clk_autoidle_setup(struct device_node *node);
 void omap2_clk_enable_init_clocks(const char **clk_names, u8 num_clocks);
 
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 6c3329b..659dadb 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -192,10 +192,9 @@ static void __init _register_dpll(void *user,
 	dd->clk_bypass = __clk_get_hw(clk);
 
 	/* register the clock */
-	clk = ti_clk_register(NULL, &clk_hw->hw, node->name);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, node->name);
 
 	if (!IS_ERR(clk)) {
-		omap2_init_clk_hw_omap_clocks(&clk_hw->hw);
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(clk_hw->hw.init->parent_names);
 		kfree(clk_hw->hw.init);
@@ -265,14 +264,12 @@ static void _register_dpll_x2(struct device_node *node,
 #endif
 
 	/* register the clock */
-	clk = ti_clk_register(NULL, &clk_hw->hw, name);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
 
-	if (IS_ERR(clk)) {
+	if (IS_ERR(clk))
 		kfree(clk_hw);
-	} else {
-		omap2_init_clk_hw_omap_clocks(&clk_hw->hw);
+	else
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-	}
 }
 #endif
 
diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
index 1c78fff..504c0e9 100644
--- a/drivers/clk/ti/gate.c
+++ b/drivers/clk/ti/gate.c
@@ -123,7 +123,7 @@ static struct clk *_register_gate(struct device *dev, const char *name,
 
 	init.flags = flags;
 
-	clk = ti_clk_register(NULL, &clk_hw->hw, name);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(clk_hw);
diff --git a/drivers/clk/ti/interface.c b/drivers/clk/ti/interface.c
index 87e00c2..83e3442 100644
--- a/drivers/clk/ti/interface.c
+++ b/drivers/clk/ti/interface.c
@@ -57,12 +57,10 @@ static struct clk *_register_interface(struct device *dev, const char *name,
 	init.num_parents = 1;
 	init.parent_names = &parent_name;
 
-	clk = ti_clk_register(NULL, &clk_hw->hw, name);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(clk_hw);
-	else
-		omap2_init_clk_hw_omap_clocks(&clk_hw->hw);
 
 	return clk;
 }
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
