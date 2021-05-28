Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25855C47087
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 04:58:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00FDD611BD
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 04:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbhE1E7e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 May 2021 00:59:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50794 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhE1E7d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 May 2021 00:59:33 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14S4vu8G068989;
        Thu, 27 May 2021 23:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622177876;
        bh=QCPreAPhpDAeVu5Q5cd80HQI6VTYnxg2Y9i2rn7VRu8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=X3ldozXzF+iqvC/AxEcbERCFU86xz741ZPx3A+UyTo4h6kgA1AgelMUWn17zHJwjv
         QMwY9DGrP2Td+CqIuUbOEXz68MiEDOlCFHlCxIxpQvkOXAACuoYlg2z6J3SW//teJU
         /MqGdARJbCo1luZQ9ln7gfwovxKM8hL/SVFFbW64=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14S4vuHS080713
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 May 2021 23:57:56 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 23:57:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 23:57:55 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14S4viJ4087638;
        Thu, 27 May 2021 23:57:52 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        <ssantosh@kernel.org>, Vignesh R <vigneshr@ti.com>,
        <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 2/2] clk: keystone: syscon-clk: Add support for AM64 specific epwm-tbclk
Date:   Fri, 28 May 2021 10:27:43 +0530
Message-ID: <20210528045743.16537-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528045743.16537-1-lokeshvutla@ti.com>
References: <20210528045743.16537-1-lokeshvutla@ti.com>
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
ti,am64-epwm-tbclk.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/clk/keystone/syscon-clk.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
index 5b3d36462174..aae1a4076281 100644
--- a/drivers/clk/keystone/syscon-clk.c
+++ b/drivers/clk/keystone/syscon-clk.c
@@ -149,11 +149,28 @@ static const struct ti_syscon_gate_clk_data am654_clk_data[] = {
 	{ /* Sentinel */ },
 };
 
+static const struct ti_syscon_gate_clk_data am64_clk_data[] = {
+	TI_SYSCON_CLK_GATE("epwm_tbclk0", 0x0, 0),
+	TI_SYSCON_CLK_GATE("epwm_tbclk1", 0x0, 1),
+	TI_SYSCON_CLK_GATE("epwm_tbclk2", 0x0, 2),
+	TI_SYSCON_CLK_GATE("epwm_tbclk3", 0x0, 3),
+	TI_SYSCON_CLK_GATE("epwm_tbclk4", 0x0, 4),
+	TI_SYSCON_CLK_GATE("epwm_tbclk5", 0x0, 5),
+	TI_SYSCON_CLK_GATE("epwm_tbclk6", 0x0, 6),
+	TI_SYSCON_CLK_GATE("epwm_tbclk7", 0x0, 7),
+	TI_SYSCON_CLK_GATE("epwm_tbclk8", 0x0, 8),
+	{ /* Sentinel */ },
+};
+
 static const struct of_device_id ti_syscon_gate_clk_ids[] = {
 	{
 		.compatible = "ti,am654-ehrpwm-tbclk",
 		.data = &am654_clk_data,
 	},
+	{
+		.compatible = "ti,am64-epwm-tbclk",
+		.data = &am64_clk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ti_syscon_gate_clk_ids);
-- 
2.31.1

