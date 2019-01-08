Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD81DC43387
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8997320827
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 13:31:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SL0UsEMn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbfAHNbq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jan 2019 08:31:46 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53510 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbfAHNbq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jan 2019 08:31:46 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x08DVa4s030076;
        Tue, 8 Jan 2019 07:31:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1546954296;
        bh=eAmFgPhGva96tsSGYPDLO5HO50MYtplOHJgyz1RyOhE=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=SL0UsEMn3V89g+/zYOzydPvpgPnVABOFxm/na3R9J9TMEHBk46yF2FbVmFdy2cJA5
         1RWV0MxNPa2+0Bc1kuyT7yv3Ar/yJFwKZUgIQDjpkYJUiluVtKqMmSKqrb9g1q1KZz
         lv9VCLig9P2Rm++AIEQKZaz3yOM+5pEq1J0XFh2s=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x08DVa4S120766
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Jan 2019 07:31:36 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 8
 Jan 2019 07:31:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 8 Jan 2019 07:31:34 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x08DVMuh011668;
        Tue, 8 Jan 2019 07:31:32 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh+dt@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] clk: keystone: sci-clk: use shorter names for clocks
Date:   Tue, 8 Jan 2019 15:30:23 +0200
Message-ID: <1546954223-9738-4-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the full device name of the clock provider is used as the initial
part of the registered clock name. This is pretty long and completely
unnecessary info in generic case, so shorten it up. Now, we only contain
the short name of the clock provider node (pOFn.)

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index d1d6dc8..57b7d02 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -283,7 +283,7 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 	int i;
 	int ret = 0;
 
-	name = kasprintf(GFP_KERNEL, "%s:%d:%d", dev_name(provider->dev),
+	name = kasprintf(GFP_KERNEL, "%pOFn:%d:%d", provider->dev->of_node,
 			 sci_clk->dev_id, sci_clk->clk_id);
 
 	init.name = name;
@@ -309,8 +309,8 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
 		for (i = 0; i < sci_clk->num_parents; i++) {
 			char *parent_name;
 
-			parent_name = kasprintf(GFP_KERNEL, "%s:%d:%d",
-						dev_name(provider->dev),
+			parent_name = kasprintf(GFP_KERNEL, "%pOFn:%d:%d",
+						provider->dev->of_node,
 						sci_clk->dev_id,
 						sci_clk->clk_id + 1 + i);
 			if (!parent_name) {
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
