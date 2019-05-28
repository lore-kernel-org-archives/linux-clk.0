Return-Path: <SRS0=Al5s=T4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F949C072B1
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 13:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68A94208C3
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 13:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gHldp5MQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfE1NKk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 May 2019 09:10:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56174 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfE1NKj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 May 2019 09:10:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAZCX121731;
        Tue, 28 May 2019 08:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559049035;
        bh=xT1JLxedLCnPoPyGzV6/VOQlGCZBRVZ5YEZbPKntjq0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gHldp5MQ3utTbzhq5FmVntIgdxlVs5Ha4qbATAouv1wVSYO57H3XcGXU8oOTj2OJq
         bspaVccWbLbEmGGE7JzIZQsm0YhG+r5r007zFgigOVQdKBwk9Y5uVFhn7ua7AuTfZr
         xhuKoWUDkNsUM/saAevYTZwiCP1uEvhttqkc0BAA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SDAZ88090391
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 08:10:35 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 08:10:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 08:10:35 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAVBv079520;
        Tue, 28 May 2019 08:10:33 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <ssantosh@kernel.org>, <nm@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCHv2 1/5] clk: keystone: sci-clk: cut down the clock name length
Date:   Tue, 28 May 2019 16:10:20 +0300
Message-ID: <1559049024-30872-2-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
References: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
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
