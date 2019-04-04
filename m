Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E215EC10F05
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0C022075E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xz+l2W48"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbfDDIM1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:12:27 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45364 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfDDIM1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 04:12:27 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x348COnP057241;
        Thu, 4 Apr 2019 03:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554365544;
        bh=u1BDcpB9Luji9THZ2a0p38Y1IcnamjpjRDhQB0NQC40=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xz+l2W48lVsx1QaK/zJyDVJGu0WWW+IJky76jdzMPwdey/dTweehrOHhlrARE6ArG
         Y5r+Cgn4dNGzMshID5b+y/LjrbXcGyNBODAr4/Ia+4A5TUSYp9i7JDQgEHlkfvpkrV
         lTQGBxNPpSV+eZ6WQuGxgINly+o2FVLO3tx7TiDQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x348COg6056191
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Apr 2019 03:12:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Apr
 2019 03:12:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Apr 2019 03:12:23 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x348C8GC093305;
        Thu, 4 Apr 2019 03:12:21 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, Eric Ruei <e-ruei1@ti.com>
Subject: [PATCH 5/6] clk: ti: am33xx: drop idlest polling from gfx clkctrl clock
Date:   Thu, 4 Apr 2019 11:11:06 +0300
Message-ID: <1554365467-1325-6-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Eric Ruei <e-ruei1@ti.com>

The GFX modules on AM33xx SoCs have a hardreset line and are controlled
by a GFX reset line. Any clkctrl enable/disable operations cannot be
checked for module enabled/disabled status independent of the reset
operation, and this causes some unwanted timeouts in the kernel and
unbalanced states for the GFX clocks. These details should be handled
by the driver integration code itself.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-33xx-compat.c | 2 +-
 drivers/clk/ti/clk-33xx.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clk-33xx-compat.c b/drivers/clk/ti/clk-33xx-compat.c
index 3e07f12..d11fb42 100644
--- a/drivers/clk/ti/clk-33xx-compat.c
+++ b/drivers/clk/ti/clk-33xx-compat.c
@@ -181,7 +181,7 @@
 };
 
 static const struct omap_clkctrl_reg_data am3_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM3_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
+	{ AM3_GFX_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "gfx_fck_div_ck" },
 	{ 0 },
 };
 
diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
index a360d31..7436e0f 100644
--- a/drivers/clk/ti/clk-33xx.c
+++ b/drivers/clk/ti/clk-33xx.c
@@ -217,7 +217,7 @@
 };
 
 static const struct omap_clkctrl_reg_data am3_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM3_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
+	{ AM3_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "gfx_fck_div_ck" },
 	{ 0 },
 };
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
