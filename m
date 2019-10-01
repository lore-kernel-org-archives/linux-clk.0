Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB62C388F3
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F256021927
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tnvp5I27"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733228AbfJAJCS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 05:02:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733127AbfJAJCS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 05:02:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9192GEO062263;
        Tue, 1 Oct 2019 04:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569920536;
        bh=r1ENYMRLgVUpW/RmGm9KhNJH01/oep4AIMwLVQcLhxc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tnvp5I27XwX3UtkjpYt44OzuSzD3fZ/rXwVBZYTSykXJnp41j0ilHRI9+7QF/DHCN
         ljmAtjp2eHPSiOGlUVK+YbuPEx3COeckXWTfhuNF4tBTeLYiMjdu9F17XGeiJ73Wog
         Na/ZgMYJDZAsyPte4CM5gF9caw3IMu8vqYc8WQ8g=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9192GsQ107618
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 04:02:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:02:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:02:06 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919290L032920;
        Tue, 1 Oct 2019 04:02:15 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tomi.valkeinen@ti.com>
Subject: [PATCH 3/4] clk: ti: mux: add debugfs support for read/write of parent ID
Date:   Tue, 1 Oct 2019 12:02:01 +0300
Message-ID: <20191001090202.26346-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001090202.26346-1-t-kristo@ti.com>
References: <20191001090202.26346-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add parent_id node under debugfs for mux clocks, that allow both
read/write operations. This can be used to read the current
parent ID, or force a change of current parent of a mux clock.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/mux.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
index 0069e7cf3ebc..f036ecc78034 100644
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -21,6 +21,8 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/clk/ti.h>
+#include <linux/debugfs.h>
+
 #include "clock.h"
 
 #undef pr_fmt
@@ -118,12 +120,48 @@ static void clk_mux_restore_context(struct clk_hw *hw)
 	ti_clk_mux_set_parent(hw, mux->saved_parent);
 }
 
+#ifdef CONFIG_COMMON_CLK_DEBUGFS_WRITE_ACCESS
+static int dbg_pid_get(void *data, u64 *val)
+{
+	struct clk_hw *hw = data;
+
+	*val = ti_clk_mux_get_parent(hw);
+
+	return 0;
+}
+
+static int dbg_pid_set(void *data, u64 val)
+{
+	struct clk_hw *hw = data;
+	struct clk_hw *parent = clk_hw_get_parent_by_index(hw, val);
+
+	if (!parent)
+		return -EINVAL;
+
+	clk_hw_reparent(hw, parent);
+
+	return ti_clk_mux_set_parent(hw, val);
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(mux_parent_id_fops, dbg_pid_get, dbg_pid_set, "%llu\n");
+
+static void clk_mux_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	debugfs_create_file("parent_id", 0644, dentry, hw, &mux_parent_id_fops);
+}
+#else
+static void clk_mux_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+}
+#endif
+
 const struct clk_ops ti_clk_mux_ops = {
 	.get_parent = ti_clk_mux_get_parent,
 	.set_parent = ti_clk_mux_set_parent,
 	.determine_rate = __clk_mux_determine_rate,
 	.save_context = clk_mux_save_context,
 	.restore_context = clk_mux_restore_context,
+	.debug_init = clk_mux_debug_init,
 };
 
 static struct clk *_register_mux(struct device *dev, const char *name,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
