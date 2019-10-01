Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CB2C388F3
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B844D21906
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 09:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M0h6gfuI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbfJAJCQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 05:02:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34338 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729787AbfJAJCQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 05:02:16 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9192DTV062246;
        Tue, 1 Oct 2019 04:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569920534;
        bh=1LIrEVB/cTTEe3Y4N3QDV4IeJar+cAiaCmpmr/BpVyo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=M0h6gfuInet0nNxPDCo5zklZZrBpA8j4Dke47zXYfUmfU7mbzky2QEF4Bhjd+e99U
         DwqTpiPRGGBIUVBRzI22YRPB/WJ0ZWWI6W1FMs/syHJRkysaoD8IgHFSmQWIPzc2LW
         Y0opig6I0YSs0eOkG3sMl4IAjxkWEZI1d+5gnPx0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9192DQa073793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 04:02:13 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 04:02:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 04:02:03 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x919290J032920;
        Tue, 1 Oct 2019 04:02:11 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tomi.valkeinen@ti.com>
Subject: [PATCH 1/4] clk: debug: add support for setting clk_rate from debugfs
Date:   Tue, 1 Oct 2019 12:01:59 +0300
Message-ID: <20191001090202.26346-2-t-kristo@ti.com>
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

Debugfs entries for clock drivers don't allow writing to the nodes by
default. Add support for writing to clk_rate nodes via debugfs, this
basically adds a nice debugging capability for testing clk_set_rate
functionality directly from userspace. As this can be considered
dangerous, add a separate Kconfig entry for enabling this feature, and
make it default as not enabled.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/Kconfig |  9 +++++++++
 drivers/clk/clk.c   | 27 +++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 801fa1cd0321..4815ed5248c5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -23,6 +23,15 @@ config COMMON_CLK
 menu "Common Clock Framework"
 	depends on COMMON_CLK
 
+config COMMON_CLK_DEBUGFS_WRITE_ACCESS
+	bool "Clock debugfs write access enable"
+	depends on DEBUG_FS
+	default n
+	---help---
+	  Enables write access to debugfs entries. This is very useful
+	  for debugging purposes but can be dangerous, thus the default
+	  setting is n.
+
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ca99e9db6575..b0e82193a63d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3093,6 +3093,28 @@ static int clk_duty_cycle_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(clk_duty_cycle);
 
+#ifdef CONFIG_COMMON_CLK_DEBUGFS_WRITE_ACCESS
+static int clk_dbg_rate_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->rate;
+
+	return 0;
+}
+
+static int clk_dbg_rate_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+
+	clk_core_set_rate_nolock(core, val);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(clk_dbg_option_rate, clk_dbg_rate_get, clk_dbg_rate_set, "%llu\n");
+#endif
+
 static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *root;
@@ -3103,7 +3125,12 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	root = debugfs_create_dir(core->name, pdentry);
 	core->dentry = root;
 
+#ifdef CONFIG_COMMON_CLK_DEBUGFS_WRITE_ACCESS
+	debugfs_create_file("clk_rate", 0644, root, core,
+			    &clk_dbg_option_rate);
+#else
 	debugfs_create_ulong("clk_rate", 0444, root, &core->rate);
+#endif
 	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
 	debugfs_create_u32("clk_phase", 0444, root, &core->phase);
 	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
