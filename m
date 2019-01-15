Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7006BC43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3338020645
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kDE6tL5+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbfAOJPf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 04:15:35 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42698 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfAOJPf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 04:15:35 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0F9FUQw125989;
        Tue, 15 Jan 2019 03:15:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1547543731;
        bh=dEjhObeoLYo5bkbndho3KeoPPf8I0IhddokdBIOf3mE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kDE6tL5+dqCxh11MokblBJWTQhDy7GDPClgmAzo9HQ6/gewrUYDAl+iGUdaSxqwM2
         PytJOUUh60Lj/6I3nkrYrgkQyOpID7K0zOXit+SZ96vh7C87OEY/Hc/K6j9qcQVa8/
         okgCdtIPeTZYjonn6O28KGi51n5Gs1sFnZAM6Wwc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0F9FUbU013223
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Jan 2019 03:15:30 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 15
 Jan 2019 03:15:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 15 Jan 2019 03:15:29 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0F9FNLh016112;
        Tue, 15 Jan 2019 03:15:26 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 1/4] clk: ti: move clk_hw_omap list handling under generic part of the driver
Date:   Tue, 15 Jan 2019 11:15:12 +0200
Message-ID: <1547543715-16467-2-git-send-email-t-kristo@ti.com>
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

Currently the clk_hw_omap list is handled under the autoidle code, but
it should be accessible generically. Add a few APIs towards this, and
update the autoidle code to use the generic implementations.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/autoidle.c | 65 +++++++++++++++++++----------------------------
 drivers/clk/ti/clk.c      | 42 ++++++++++++++++++++++++++++++
 drivers/clk/ti/clock.h    |  1 +
 3 files changed, 69 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/ti/autoidle.c b/drivers/clk/ti/autoidle.c
index 7bb9afb..a129b4b 100644
--- a/drivers/clk/ti/autoidle.c
+++ b/drivers/clk/ti/autoidle.c
@@ -35,7 +35,20 @@ struct clk_ti_autoidle {
 #define AUTOIDLE_LOW		0x1
 
 static LIST_HEAD(autoidle_clks);
-static LIST_HEAD(clk_hw_omap_clocks);
+
+static int _omap2_clk_deny_idle(struct clk_hw_omap *clk)
+{
+	if (clk->ops && clk->ops->deny_idle)
+		clk->ops->deny_idle(clk);
+	return 0;
+}
+
+static int _omap2_clk_allow_idle(struct clk_hw_omap *clk)
+{
+	if (clk->ops && clk->ops->allow_idle)
+		clk->ops->allow_idle(clk);
+	return 0;
+}
 
 /**
  * omap2_clk_deny_idle - disable autoidle on an OMAP clock
@@ -45,12 +58,9 @@ struct clk_ti_autoidle {
  */
 int omap2_clk_deny_idle(struct clk *clk)
 {
-	struct clk_hw_omap *c;
+	struct clk_hw_omap *c = to_clk_hw_omap(__clk_get_hw(clk));
 
-	c = to_clk_hw_omap(__clk_get_hw(clk));
-	if (c->ops && c->ops->deny_idle)
-		c->ops->deny_idle(c);
-	return 0;
+	return _omap2_clk_deny_idle(c);
 }
 
 /**
@@ -61,12 +71,9 @@ int omap2_clk_deny_idle(struct clk *clk)
  */
 int omap2_clk_allow_idle(struct clk *clk)
 {
-	struct clk_hw_omap *c;
+	struct clk_hw_omap *c = to_clk_hw_omap(__clk_get_hw(clk));
 
-	c = to_clk_hw_omap(__clk_get_hw(clk));
-	if (c->ops && c->ops->allow_idle)
-		c->ops->allow_idle(c);
-	return 0;
+	return _omap2_clk_allow_idle(c);
 }
 
 static void _allow_autoidle(struct clk_ti_autoidle *clk)
@@ -168,26 +175,6 @@ int __init of_ti_clk_autoidle_setup(struct device_node *node)
 }
 
 /**
- * omap2_init_clk_hw_omap_clocks - initialize an OMAP clock
- * @hw: struct clk_hw * to initialize
- *
- * Add an OMAP clock @clk to the internal list of OMAP clocks.  Used
- * temporarily for autoidle handling, until this support can be
- * integrated into the common clock framework code in some way.  No
- * return value.
- */
-void omap2_init_clk_hw_omap_clocks(struct clk_hw *hw)
-{
-	struct clk_hw_omap *c;
-
-	if (clk_hw_get_flags(hw) & CLK_IS_BASIC)
-		return;
-
-	c = to_clk_hw_omap(hw);
-	list_add(&c->node, &clk_hw_omap_clocks);
-}
-
-/**
  * omap2_clk_enable_autoidle_all - enable autoidle on all OMAP clocks that
  * support it
  *
@@ -198,11 +185,11 @@ void omap2_init_clk_hw_omap_clocks(struct clk_hw *hw)
  */
 int omap2_clk_enable_autoidle_all(void)
 {
-	struct clk_hw_omap *c;
+	int ret;
 
-	list_for_each_entry(c, &clk_hw_omap_clocks, node)
-		if (c->ops && c->ops->allow_idle)
-			c->ops->allow_idle(c);
+	ret = omap2_clk_for_each(_omap2_clk_allow_idle);
+	if (ret)
+		return ret;
 
 	_clk_generic_allow_autoidle_all();
 
@@ -220,11 +207,11 @@ int omap2_clk_enable_autoidle_all(void)
  */
 int omap2_clk_disable_autoidle_all(void)
 {
-	struct clk_hw_omap *c;
+	int ret;
 
-	list_for_each_entry(c, &clk_hw_omap_clocks, node)
-		if (c->ops && c->ops->deny_idle)
-			c->ops->deny_idle(c);
+	ret = omap2_clk_for_each(_omap2_clk_deny_idle);
+	if (ret)
+		return ret;
 
 	_clk_generic_deny_autoidle_all();
 
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index d0cd585..8172843 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -31,6 +31,7 @@
 #undef pr_fmt
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
+static LIST_HEAD(clk_hw_omap_clocks);
 struct ti_clk_ll_ops *ti_clk_ll_ops;
 static struct device_node *clocks_node_ptr[CLK_MAX_MEMMAPS];
 
@@ -517,3 +518,44 @@ struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
 
 	return clk;
 }
+
+/**
+ * omap2_init_clk_hw_omap_clocks - initialize an OMAP clock
+ * @hw: struct clk_hw * to initialize
+ *
+ * Add an OMAP clock @clk to the internal list of OMAP clocks.  Used
+ * temporarily for autoidle handling, until this support can be
+ * integrated into the common clock framework code in some way.  No
+ * return value.
+ */
+void omap2_init_clk_hw_omap_clocks(struct clk_hw *hw)
+{
+	struct clk_hw_omap *c;
+
+	c = to_clk_hw_omap(hw);
+	list_add(&c->node, &clk_hw_omap_clocks);
+}
+
+/**
+ * omap2_clk_for_each - call function for each registered clk_hw_omap
+ * @fn: pointer to a callback function
+ *
+ * Call @fn for each registered clk_hw_omap, passing @hw to each
+ * function.  @fn must return 0 for success or any other value for
+ * failure.  If @fn returns non-zero, the iteration across clocks
+ * will stop and the non-zero return value will be passed to the
+ * caller of omap2_clk_for_each().
+ */
+int omap2_clk_for_each(int (*fn)(struct clk_hw_omap *hw))
+{
+	int ret;
+	struct clk_hw_omap *hw;
+
+	list_for_each_entry(hw, &clk_hw_omap_clocks, node) {
+		ret = (*fn)(hw);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 9f312a2..e5b8af3 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -301,6 +301,7 @@ long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
 				    unsigned long *parent_rate);
 int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req);
+int omap2_clk_for_each(int (*fn)(struct clk_hw_omap *hw));
 
 extern struct ti_clk_ll_ops *ti_clk_ll_ops;
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
