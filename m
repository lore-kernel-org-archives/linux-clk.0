Return-Path: <SRS0=ZgeQ=YA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F9FC47404
	for <linux-clk@archiver.kernel.org>; Mon,  7 Oct 2019 12:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0F532173B
	for <linux-clk@archiver.kernel.org>; Mon,  7 Oct 2019 12:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mRmZdtMg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfJGM0R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Oct 2019 08:26:17 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35608 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGM0R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Oct 2019 08:26:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CQFVT025369;
        Mon, 7 Oct 2019 07:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451175;
        bh=/qDgsQyfQBJBA2CeABJl0nuZIggHcHivQ6XH24f9Dok=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mRmZdtMg6oYnt4fuFC8enKXFKZP/o1dNAzJdsfEqwuMp9wCq++Btq3kX8HT8M5uH9
         /cJE6SYmDbDunckdCVct46qdZP21Wh7oiDhZT239BK2Z5cHrh1OABJnHhRJ1PldcOg
         b8BPs8xUbrBY8W24TsB6d6rgDe4PlH4lp3H/cJnU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CQF2h107218;
        Mon, 7 Oct 2019 07:26:15 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:26:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:26:11 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CQ8Nb085058;
        Mon, 7 Oct 2019 07:26:11 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 2/2] clk: ti: am43xx: drop idlest polling from gfx clock
Date:   Mon, 7 Oct 2019 15:26:04 +0300
Message-ID: <20191007122604.18508-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007122604.18508-1-t-kristo@ti.com>
References: <20191007122604.18508-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Due to the way ti sysc and hardreset line control is now implemented,
it is not possible to poll the clock status for gfx clock independent
of hardreset line control. Thus, add a flag to prevent handling this
status bit from clock driver. Correct sequencing of events is guaranteed
by ti-sysc bus driver.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-43xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
index 7ec8fe6aa7c1..af3e7805769e 100644
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -73,7 +73,7 @@ static const struct omap_clkctrl_reg_data am4_mpu_clkctrl_regs[] __initconst = {
 };
 
 static const struct omap_clkctrl_reg_data am4_gfx_l3_clkctrl_regs[] __initconst = {
-	{ AM4_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP, "gfx_fck_div_ck" },
+	{ AM4_GFX_L3_GFX_CLKCTRL, NULL, CLKF_SW_SUP | CLKF_NO_IDLEST, "gfx_fck_div_ck" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
