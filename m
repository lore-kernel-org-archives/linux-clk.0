Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184A5C282CE
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA89E218C3
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 18:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QAS2lV2H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfDLSWp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 14:22:45 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46532 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfDLSWp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 14:22:45 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMcTk101094;
        Fri, 12 Apr 2019 13:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555093358;
        bh=xT1JLxedLCnPoPyGzV6/VOQlGCZBRVZ5YEZbPKntjq0=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=QAS2lV2HfHN5r2YIt7d7svODku06IB1q6qSvSQoYEPLbLjjkY3FwRPn5/+BbhDaYi
         AVY/oTmgepI4lN1w59o0aWbb6esYi7XnydcXb7yAarzGsSyTNiqdf8jBsO0FE/QLkI
         LZZaKqWlCVz5G1BIVL3EZcdt1sKJbsA47/gisZhU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3CIMcIG109575
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 12 Apr 2019 13:22:38 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Apr 2019 13:22:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Apr 2019 13:22:38 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3CIMYYj060123;
        Fri, 12 Apr 2019 13:22:36 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
Subject: [PATCH 1/3] clk: keystone: sci-clk: cut down the clock name length
Date:   Fri, 12 Apr 2019 21:22:20 +0300
Message-ID: <1555093342-428-2-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1555093342-428-1-git-send-email-t-kristo@ti.com>
References: <1555093342-428-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no need to store the full node name to the individual clocks,
as this will just consome memory and make the clock debug entries
unnecessary long. Just shorten this to "clk" for now.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 4cb70be..e737f24 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -280,8 +280,8 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 	int i;
 	int ret = 0;
 
-	name = kasprintf(GFP_KERNEL, "%s:%d:%d", dev_name(provider->dev),
-			 sci_clk->dev_id, sci_clk->clk_id);
+	name = kasprintf(GFP_KERNEL, "clk:%d:%d", sci_clk->dev_id,
+			 sci_clk->clk_id);
 
 	init.name = name;
 
@@ -306,8 +306,7 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 		for (i = 0; i < sci_clk->num_parents; i++) {
 			char *parent_name;
 
-			parent_name = kasprintf(GFP_KERNEL, "%s:%d:%d",
-						dev_name(provider->dev),
+			parent_name = kasprintf(GFP_KERNEL, "clk:%d:%d",
 						sci_clk->dev_id,
 						sci_clk->clk_id + 1 + i);
 			if (!parent_name) {
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
