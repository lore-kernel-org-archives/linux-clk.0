Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EB9C352AA
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B547E21906
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hpBlqfjR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733254AbfJAJCU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 05:02:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51716 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733127AbfJAJCU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 05:02:20 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9192I6N100560;
        Tue, 1 Oct 2019 04:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569920538;
        bh=CklcykHhMCVqUFfGHjw+eIZ1P4HYWotwka0v5GHMZC0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hpBlqfjRVdi2YRAuvwXZxHLVjgtugeQQ62GCyLcIhEyyPayESgqpSJI6VhtwqXWIr
         TZpabXviEABo98qC7C3pmiwyW2G3yGpDio8BHaCI7UDVDPxB8k+alhqdAAkZKiqcZQ
         jeQ7+J+mtgV8dJIdjdfIGOvSV3tYInb9MSNj6ZGs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9192Ipl122278
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 04:02:18 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:02:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:02:17 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919290M032920;
        Tue, 1 Oct 2019 04:02:16 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tomi.valkeinen@ti.com>
Subject: [PATCH 4/4] clk: keystone: sci-clk: add debugfs support for read/write of parent ID
Date:   Tue, 1 Oct 2019 12:02:02 +0300
Message-ID: <20191001090202.26346-5-t-kristo@ti.com>
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

Add parent_id node under debugfs for TI SCI clocks, that allow both
read/write operations. This can be used to read the current
parent ID, or force a change of current parent of a multi-parent clock.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 7edf8c8432b6..39255b13bdc1 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -24,6 +24,7 @@
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/bsearch.h>
 #include <linux/list_sort.h>
+#include <linux/debugfs.h>
 
 #define SCI_CLK_SSC_ENABLE		BIT(0)
 #define SCI_CLK_ALLOW_FREQ_CHANGE	BIT(1)
@@ -254,6 +255,41 @@ static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
 					      index + 1 + clk->clk_id);
 }
 
+#ifdef CONFIG_COMMON_CLK_DEBUGFS_WRITE_ACCESS
+static int dbg_pid_get(void *data, u64 *val)
+{
+	struct clk_hw *hw = data;
+
+	*val = sci_clk_get_parent(hw);
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
+	return sci_clk_set_parent(hw, val);
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(sci_parent_id_fops, dbg_pid_get, dbg_pid_set, "%llu\n");
+
+static void sci_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	debugfs_create_file("parent_id", 0644, dentry, hw, &sci_parent_id_fops);
+}
+#else
+static void sci_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+}
+#endif
+
 static const struct clk_ops sci_clk_ops = {
 	.prepare = sci_clk_prepare,
 	.unprepare = sci_clk_unprepare,
@@ -263,6 +307,7 @@ static const struct clk_ops sci_clk_ops = {
 	.set_rate = sci_clk_set_rate,
 	.get_parent = sci_clk_get_parent,
 	.set_parent = sci_clk_set_parent,
+	.debug_init = sci_clk_debug_init,
 };
 
 /**
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
