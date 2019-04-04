Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF74CC4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FF3E2075E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z24GdO1l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfDDIMb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:12:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45412 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfDDIMb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 04:12:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x348CRlf057260;
        Thu, 4 Apr 2019 03:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554365547;
        bh=TFvauUWsWvA21ez6hWIFoAZOdX/CAGXhrmUlNUztKXU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Z24GdO1lsIsuMJlvjKUraOw9eogp1KxszBGR9HljCr1gmysoYOwveVrVeXO9CrZnp
         6w39o5SkLdBGJWdMwbwt5igDn++BIRl4ARVBZd0TQy4ZZcNSnCt5MNA0PPVc+KfWJ3
         GlFKOmQMZKw2iZTzDzReXVray3D310QLS9cJJjVw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x348CRkR004977
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Apr 2019 03:12:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Apr
 2019 03:12:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Apr 2019 03:12:25 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x348C8GD093305;
        Thu, 4 Apr 2019 03:12:24 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, Eric Ruei <e-ruei1@ti.com>
Subject: [PATCH 6/6] clk: ti: am43xx: drop idlest polling from gfx clkctrl clock
Date:   Thu, 4 Apr 2019 11:11:07 +0300
Message-ID: <1554365467-1325-7-git-send-email-t-kristo@ti.com>
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

The GFX modules on AM43xx SoCs have a hardreset line and are controlled
by a GFX reset line. Any clkctrl enable/disable operations cannot be
checked for module enabled/disabled status independent of the reset
operation, and this causes some unwanted timeouts in the kernel and
unbalanced states for the GFX clocks. These details should be handled
by the driver integration code itself.

Add the CLKF_NO_IDLEST flag to the GFX clkctrl clock so that these
module status checks are skipped.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-43xx-compat.c | 2 +-
 drivers/clk/ti/clk-43xx.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clk-43xx-compat.c b/drivers/clk/ti/clk-43xx-compat.c
index 5130398..ac8117d 100644
--- a/drivers/clk/ti/clk-43xx-compat.c
+++ b/drivers/clk/ti/clk-43xx-compat.c
@@ -65,7 +65,7 @@
 };
 
 static const struct omap_clkctrl_reg_data am4_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM4_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
+	{ AM4_GFX_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "gfx_fck_div_ck" },
 	{ 0 },
 };
 
diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
index 2782d91..9882a9b 100644
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -73,7 +73,7 @@
 };
 
 static const struct omap_clkctrl_reg_data am4_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM4_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
+	{ AM4_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "gfx_fck_div_ck" },
 	{ 0 },
 };
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
