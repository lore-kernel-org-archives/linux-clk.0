Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9F6C47088
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 16:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69B1E613E1
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 16:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbhEZQzp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 May 2021 12:55:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51412 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233527AbhEZQzo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 May 2021 12:55:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QGs8rR035434;
        Wed, 26 May 2021 11:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622048048;
        bh=phsL4IoMhofPkv4a5CvgMkrcVPeflbcMwWccMeJ25/c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pTQURAg7oy9TdHbEmzrorKiF8vYyz/E28tT7Y42IjAP0pi0zxog4PxbRcrZE+XEHN
         F8wmG5ZNw2pFcMI1s4XOvfLootK+TYuc+bLEio3Y5Dn+4Xk4mdzLG8RnzQmqZNrQak
         XS5vS6W3QserfconDpxbYrg7YmR5i1FfOOh3K3Ug=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QGs8Ut070193
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 11:54:08 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 11:54:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 11:54:08 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QGruiH097418;
        Wed, 26 May 2021 11:54:05 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        <ssantosh@kernel.org>, Vignesh R <vigneshr@ti.com>,
        <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 2/2] clk: keystone: syscon-clk: Add support for AM64 specific ehrpwm-tbclk
Date:   Wed, 26 May 2021 22:23:56 +0530
Message-ID: <20210526165356.22690-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526165356.22690-1-lokeshvutla@ti.com>
References: <20210526165356.22690-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

AM64 has 9 instances of EPWM modules. And each instance has a clk to
Timer-Base sub-module that can be controlled by Control module. Update
the driver with all the 9 instance of clocks associated to
ti,am64-ehrpwm-tbclk.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/clk/keystone/syscon-clk.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index 5b3d36462174..c55a8ec249d1 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -149,11 +149,28 @@ static const struct ti_syscon_gate_clk_data am654_clk_data[] = {
 	{ /* Sentinel */ },
 };
 
+static const struct ti_syscon_gate_clk_data am64_clk_data[] = {
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk0", 0x0, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk1", 0x4, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk2", 0x8, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk3", 0xc, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk4", 0x10, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk5", 0x14, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk6", 0x18, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk7", 0x1c, 0),
+	TI_SYSCON_CLK_GATE("ehrpwm_tbclk8", 0x20, 0),
+	{ /* Sentinel */ },
+};
+
 static const struct of_device_id ti_syscon_gate_clk_ids[] = {
 	{
 		.compatible = "ti,am654-ehrpwm-tbclk",
 		.data = &am654_clk_data,
 	},
+	{
+		.compatible = "ti,am64-ehrpwm-tbclk",
+		.data = &am64_clk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ti_syscon_gate_clk_ids);
-- 
2.31.1

