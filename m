Return-Path: <SRS0=Al5s=T4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539D7C04AB6
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 13:10:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AFCB208C3
	for <linux-clk@archiver.kernel.org>; Tue, 28 May 2019 13:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ILgDCNNJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfE1NKr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 May 2019 09:10:47 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50932 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfE1NKr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 May 2019 09:10:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAe2x060659;
        Tue, 28 May 2019 08:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559049041;
        bh=qOqfw5a/Yv52Hb5YO9NZcOBoRU8gk4OsPDad4G7Juvo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ILgDCNNJX89WBoeWBOJUvQvZM05fjkF1yRPWD6zoSuER8ikl8o7laZsE6w5HvxE6A
         niy7XshCiwR91+Osi9nzWJ+LLSPVHBgiJ4gH2N8fadDXpwUXX14Y+/C+dYmln1+ZqM
         JGPC2hqtMpXjE0xmzA0D5R9bYRr6gtYUT8zwdb00=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SDAem6090506
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 08:10:40 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 08:10:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 08:10:40 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAVC0079520;
        Tue, 28 May 2019 08:10:38 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <ssantosh@kernel.org>, <nm@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCHv2 4/5] clk: keystone: sci-clk: extend clock IDs to 32 bits
Date:   Tue, 28 May 2019 16:10:23 +0300
Message-ID: <1559049024-30872-5-git-send-email-t-kristo@ti.com>
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

Currently, the clock identifiers are limited to 255. To support future
SoCs, this muse be extended to 32 bits, which should provide way more
than enough space. Basic support for extending the clock API is going
to be implemented in the firmware driver, but there are some minor
changes that need to be done on the clock driver side first.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 76ed4cc..7edf8c8 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -58,8 +58,8 @@ struct sci_clk_provider {
 struct sci_clk {
 	struct clk_hw hw;
 	u16 dev_id;
-	u8 clk_id;
-	u8 num_parents;
+	u32 clk_id;
+	u32 num_parents;
 	struct sci_clk_provider *provider;
 	u8 flags;
 	struct list_head node;
@@ -221,11 +221,11 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 static u8 sci_clk_get_parent(struct clk_hw *hw)
 {
 	struct sci_clk *clk = to_sci_clk(hw);
-	u8 parent_id;
+	u32 parent_id = 0;
 	int ret;
 
 	ret = clk->provider->ops->get_parent(clk->provider->sci, clk->dev_id,
-					     clk->clk_id, &parent_id);
+					     clk->clk_id, (void *)&parent_id);
 	if (ret) {
 		dev_err(clk->provider->dev,
 			"get-parent failed for dev=%d, clk=%d, ret=%d\n",
@@ -233,7 +233,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
 		return 0;
 	}
 
-	return parent_id - clk->clk_id - 1;
+	parent_id = parent_id - clk->clk_id - 1;
+
+	return (u8)parent_id;
 }
 
 /**
@@ -417,13 +419,14 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 	int max_clks = 0;
 	int clk_id = 0;
 	int dev_id = 0;
-	u8 num_parents;
+	u32 num_parents = 0;
 	int gap_size = 0;
 	struct device *dev = provider->dev;
 
 	while (1) {
 		ret = provider->ops->get_num_parents(provider->sci, dev_id,
-						     clk_id, &num_parents);
+						     clk_id,
+						     (void *)&num_parents);
 		if (ret) {
 			gap_size++;
 			if (!clk_id) {
@@ -546,7 +549,7 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
 				provider->ops->get_num_parents(provider->sci,
 							       sci_clk->dev_id,
 							       sci_clk->clk_id,
-							       &sci_clk->num_parents);
+							       (void *)&sci_clk->num_parents);
 				list_add_tail(&sci_clk->node, &clks);
 
 				num_clks++;
@@ -555,6 +558,23 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
 				if (num_parents == 1)
 					num_parents = 0;
 
+				/*
+				 * Linux kernel has inherent limitation
+				 * of 255 clock parents at the moment.
+				 * Right now, it is not expected that
+				 * any mux clock from sci-clk driver
+				 * would exceed that limit either, but
+				 * the ABI basically provides that
+				 * possibility. Print out a warning if
+				 * this happens for any clock.
+				 */
+				if (num_parents >= 255) {
+					dev_warn(dev, "too many parents for dev=%d, clk=%d (%d), cropping to 255.\n",
+						 sci_clk->dev_id,
+						 sci_clk->clk_id, num_parents);
+					num_parents = 255;
+				}
+
 				clk_id = args.args[1] + 1;
 
 				while (num_parents--) {
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
