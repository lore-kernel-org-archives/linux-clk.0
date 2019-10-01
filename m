Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF04C352AA
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4591321906
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZzPGefN4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729787AbfJAJCR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 05:02:17 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41696 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733127AbfJAJCQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 05:02:16 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9192F4k053846;
        Tue, 1 Oct 2019 04:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569920535;
        bh=OSpD6Z2wdlHG3EnRLjFKGmXz6KYhmI40Pfo2js+5Ad0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZzPGefN4g73n156KLZrsHxNfNl1g1xoKjQup36SXryg6xzdB6tilP9WQzVvhzttS0
         j33JiXGZYqKSoi6yPKDkdT9WY4WHG22J0E4Wq4DB9t4Mt9/iDL2YIO8VAxHoTGn4zY
         t+9LARuPFlCr3lgNzIyzAjr9Dtp8ONLgOU4N7UPs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9192Foc122212
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 04:02:15 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:02:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:02:04 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919290K032920;
        Tue, 1 Oct 2019 04:02:13 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tomi.valkeinen@ti.com>
Subject: [PATCH 2/4] clk: debug: add support for enable/disable/prep/un-prep from debugfs
Date:   Tue, 1 Oct 2019 12:02:00 +0300
Message-ID: <20191001090202.26346-3-t-kristo@ti.com>
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

The enable/prepare count variables can now be used to enable/disable/
prepare and un-prepare specific clocks. This is very useful for
debugging purposes, but can be considered dangerous. Thus, it is
protected by the same Kconfig option as the clk_rate modification
option.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/clk.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b0e82193a63d..e0ceecf727c5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3113,6 +3113,58 @@ static int clk_dbg_rate_set(void *data, u64 val)
 }
 
 DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_rate, clk_dbg_rate_get, clk_dbg_rate_set, "%llu\n");
+
+static int clk_dbg_prepare_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->prepare_count;
+
+	return 0;
+}
+
+static int clk_dbg_prepare_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+
+	if (val == 1)
+		return clk_core_prepare(core);
+
+	if (val == -1) {
+		clk_core_unprepare(core);
+		return 0;
+	}
+
+	pr_err("1: prepare, -1: unprepare\n");
+	return -EINVAL;
+}
+DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_prepare, clk_dbg_prepare_get, clk_dbg_prepare_set, "%llu\n");
+
+static int clk_dbg_enable_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->enable_count;
+
+	return 0;
+}
+
+static int clk_dbg_enable_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+
+	if (val == 1)
+		return clk_core_enable(core);
+
+	if (val == -1) {
+		clk_core_disable(core);
+		return 0;
+	}
+
+	pr_err("1: enable, -1: disable\n");
+	return -EINVAL;
+}
+DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_enable, clk_dbg_enable_get, clk_dbg_enable_set, "%llu\n");
 #endif
 
 static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
@@ -3134,8 +3186,15 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
 	debugfs_create_u32("clk_phase", 0444, root, &core->phase);
 	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
+#ifdef CONFIG_COMMON_CLK_DEBUGFS_WRITE_ACCESS
+	debugfs_create_file("clk_prepare_count", 0644,
+			    root, core, &clk_dbg_option_prepare);
+	debugfs_create_file("clk_enable_count", 0644,
+			    core->dentry, core, &clk_dbg_option_enable);
+#else
 	debugfs_create_u32("clk_prepare_count", 0444, root, &core->prepare_count);
 	debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
+#endif
 	debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count);
 	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
 	debugfs_create_file("clk_duty_cycle", 0444, root, core,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
