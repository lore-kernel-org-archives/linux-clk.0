Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61927C4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25BD42075E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N8TEA4hR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfDDIMT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:12:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35248 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbfDDIMT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 04:12:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x348CGf2105650;
        Thu, 4 Apr 2019 03:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554365536;
        bh=Q2946IrUmlnaEqB0iIRGBbIKN7zWtT1klPpYZLnTdzs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=N8TEA4hRxEzTo+iZ0AiQvugUQV7KW2zpTsoPeqXoaKjPzDvWPyO4OSkcBSsEZu/cS
         RaeHA17m3qHkZXEyx2f7pGcbdFLJHK9DoElYEfx43ReKpsNz3DUlCXU92o8Wy/osxl
         0QdqfJzGqsvWuEZt/UjLobDB5dHwtL5fq6wn4YZQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x348CGjE073317
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Apr 2019 03:12:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Apr
 2019 03:12:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Apr 2019 03:12:14 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x348C8G9093305;
        Thu, 4 Apr 2019 03:12:13 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>
Subject: [PATCH 2/6] ARM: omap2+: hwmod: drop CLK_IS_BASIC flag usage
Date:   Thu, 4 Apr 2019 11:11:03 +0300
Message-ID: <1554365467-1325-3-git-send-email-t-kristo@ti.com>
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

CLK_IS_BASIC flag is about to get deprecated, and as such, can't be used.
Instead, the API call for checking whether a clock is of type hw_omap shall
be used, so convert the code to use this.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 3a04c73..baadddf 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -648,10 +648,10 @@ static struct clockdomain *_get_clkdm(struct omap_hwmod *oh)
 	if (oh->clkdm) {
 		return oh->clkdm;
 	} else if (oh->_clk) {
-		if (__clk_get_flags(oh->_clk) & CLK_IS_BASIC)
+		if (!omap2_clk_is_hw_omap(__clk_get_hw(oh->_clk)))
 			return NULL;
 		clk = to_clk_hw_omap(__clk_get_hw(oh->_clk));
-		return  clk->clkdm;
+		return clk->clkdm;
 	}
 	return NULL;
 }
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
