Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E83C43612
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 723B920645
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C8TvSnW7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfAOJPk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 04:15:40 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40898 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfAOJPj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 04:15:39 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0F9FatA016112;
        Tue, 15 Jan 2019 03:15:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1547543736;
        bh=T6PjqVkgv1u1cUd6qFRSr4ittLIj0ye68XBnBrorT5g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=C8TvSnW7JCUHG3XDZ1Q7xLlstgXXMuJTSJRuAZDrb9fV8ysPEcycAWqw1mUg9uN0s
         Ot0LWkYlNIperKLq0tqXXutBOketC7hLh3k8ET9v4TWwDR8UG+rCqJDGnjDDRYcRQA
         ciwEq+d0uTDdcjh5oi9Ky1d9KAcHeJpRIoMH4b40=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0F9FaAT013313
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Jan 2019 03:15:36 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 15
 Jan 2019 03:15:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 15 Jan 2019 03:15:35 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0F9FNLj016112;
        Tue, 15 Jan 2019 03:15:32 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 3/4] clk: ti: remove usage of CLK_IS_BASIC
Date:   Tue, 15 Jan 2019 11:15:14 +0200
Message-ID: <1547543715-16467-4-git-send-email-t-kristo@ti.com>
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

Remove the usage of CLK_IS_BASIC flag completely from TI clock driver.
In most cases, the use is completely redundant, but in some cases
we need to use the new API to check if the clock is an OMAP clock or not.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/adpll.c       | 2 +-
 drivers/clk/ti/clkctrl.c     | 2 +-
 drivers/clk/ti/clockdomain.c | 2 +-
 drivers/clk/ti/divider.c     | 2 +-
 drivers/clk/ti/dpll3xxx.c    | 2 +-
 drivers/clk/ti/mux.c         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
index 688e403..0c21098 100644
--- a/drivers/clk/ti/adpll.c
+++ b/drivers/clk/ti/adpll.c
@@ -614,7 +614,7 @@ static int ti_adpll_init_clkout(struct ti_adpll_data *d,
 
 	init.name = child_name;
 	init.ops = ops;
-	init.flags = CLK_IS_BASIC;
+	init.flags = 0;
 	co->hw.init = &init;
 	parent_names[0] = __clk_get_name(clk0);
 	parent_names[1] = __clk_get_name(clk1);
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 40630eb..bf32d99 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -276,7 +276,7 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
 	init.parent_names = parents;
 	init.num_parents = num_parents;
 	init.ops = ops;
-	init.flags = CLK_IS_BASIC;
+	init.flags = 0;
 
 	clk = ti_clk_register(NULL, clk_hw, init.name);
 	if (IS_ERR_OR_NULL(clk)) {
diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
index 07a8051..423a99b 100644
--- a/drivers/clk/ti/clockdomain.c
+++ b/drivers/clk/ti/clockdomain.c
@@ -143,7 +143,7 @@ static void __init of_ti_clockdomain_setup(struct device_node *node)
 			continue;
 		}
 		clk_hw = __clk_get_hw(clk);
-		if (clk_hw_get_flags(clk_hw) & CLK_IS_BASIC) {
+		if (!omap2_clk_is_hw_omap(clk_hw)) {
 			pr_warn("can't setup clkdm for basic clk %s\n",
 				__clk_get_name(clk));
 			continue;
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 8d77090..cb5a819 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -336,7 +336,7 @@ static struct clk *_register_divider(struct device *dev, const char *name,
 
 	init.name = name;
 	init.ops = &ti_clk_divider_ops;
-	init.flags = flags | CLK_IS_BASIC;
+	init.flags = flags;
 	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
 
diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 44b6b64..3dde6c8 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -731,7 +731,7 @@ static struct clk_hw_omap *omap3_find_clkoutx2_dpll(struct clk_hw *hw)
 	do {
 		do {
 			hw = clk_hw_get_parent(hw);
-		} while (hw && (clk_hw_get_flags(hw) & CLK_IS_BASIC));
+		} while (hw && (!omap2_clk_is_hw_omap(hw)));
 		if (!hw)
 			break;
 		pclk = to_clk_hw_omap(hw);
diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
index 883bdde..b7f9a4f 100644
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -143,7 +143,7 @@ static struct clk *_register_mux(struct device *dev, const char *name,
 
 	init.name = name;
 	init.ops = &ti_clk_mux_ops;
-	init.flags = flags | CLK_IS_BASIC;
+	init.flags = flags;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
