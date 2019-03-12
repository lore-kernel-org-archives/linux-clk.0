Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B00BC4360F
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 11:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 606292147C
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 11:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfCLLAW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 07:00:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56791 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfCLLAU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Mar 2019 07:00:20 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h3f8s-0005o2-Bw; Tue, 12 Mar 2019 12:00:18 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h3f8r-0007bb-KB; Tue, 12 Mar 2019 12:00:17 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 5/5] clk: zynqmp: make field definitions of query responses consistent
Date:   Tue, 12 Mar 2019 12:00:16 +0100
Message-Id: <20190312110016.29174-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190312110016.29174-1-m.tretter@pengutronix.de>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The definition of the fields in the firmware responses to the queries is
inconsistent. Some are specified as a mask, some as a shift, and some by
the length of the previous field.

Specify all of them as bit masks and access the fields using the
FIELD_GET macro.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/clk/zynqmp/clkc.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 573c3c58dbbc..b4e13b8618b2 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -21,20 +21,18 @@
 #define MAX_NODES			6
 #define MAX_NAME_LEN			50
 
-#define CLK_TYPE_SHIFT			2
-
 #define NA_PARENT			0xFFFFFFFF
 #define DUMMY_PARENT			0xFFFFFFFE
 
-#define CLK_TYPE_FIELD_LEN		4
-#define CLK_TOPOLOGY_NODE_OFFSET	16
+#define CLK_TOPOLOGY_TYPE		GENMASK(3, 0)
+#define CLK_TOPOLOGY_FLAGS		GENMASK(21, 8)
+#define CLK_TOPOLOGY_TYPE_FLAGS		GENMASK(31, 24)
 
-#define CLK_TYPE_FIELD_MASK		0xF
-#define CLK_FLAG_FIELD_MASK		GENMASK(21, 8)
-#define CLK_TYPE_FLAG_FIELD_MASK	GENMASK(31, 24)
+#define CLK_PARENTS_ID			GENMASK(15, 0)
+#define CLK_PARENTS_FLAGS		GENMASK(31, 16)
 
-#define CLK_PARENTS_ID_LEN		16
-#define CLK_PARENTS_ID_MASK		0xFFFF
+#define CLK_ATTR_VALID			BIT(0)
+#define CLK_ATTR_TYPE			BIT(2)
 
 /* Flags for parents */
 #define PARENT_CLK_SELF			0
@@ -49,8 +47,6 @@
 #define END_OF_PARENTS			1
 #define RESERVED_CLK_NAME		""
 
-#define CLK_VALID_MASK			0x1
-
 #define CLK_GET_NAME_RESP_LEN		16
 #define CLK_GET_TOPOLOGY_RESP_WORDS	3
 #define CLK_GET_PARENTS_RESP_WORDS	3
@@ -369,15 +365,16 @@ static int __zynqmp_clock_get_topology(struct clock_topology *topology,
 				       u32 *data, u32 *nnodes)
 {
 	int i;
+	u32 type;
 
 	for (i = 0; i < CLK_GET_TOPOLOGY_RESP_WORDS; i++) {
-		if (!(data[i] & CLK_TYPE_FIELD_MASK))
+		type = FIELD_GET(CLK_TOPOLOGY_TYPE, data[i]);
+		if (type == TYPE_INVALID)
 			return END_OF_TOPOLOGY_NODE;
-		topology[*nnodes].type = data[i] & CLK_TYPE_FIELD_MASK;
-		topology[*nnodes].flag = FIELD_GET(CLK_FLAG_FIELD_MASK,
-						   data[i]);
+		topology[*nnodes].type = type
+		topology[*nnodes].flag = FIELD_GET(CLK_TOPOLOGY_FLAGS, data[i]);
 		topology[*nnodes].type_flag =
-				FIELD_GET(CLK_TYPE_FLAG_FIELD_MASK, data[i]);
+				FIELD_GET(CLK_TOPOLOGY_TYPE_FLAGS, data[i]);
 		(*nnodes)++;
 	}
 
@@ -433,12 +430,12 @@ static int __zynqmp_clock_get_parents(struct clock_parent *parents, u32 *data,
 			return END_OF_PARENTS;
 
 		parent = &parents[i];
-		parent->id = data[i] & CLK_PARENTS_ID_MASK;
+		parent->id = FIELD_GET(CLK_PARENTS_ID, data[i]);
 		if (data[i] == DUMMY_PARENT) {
 			strcpy(parent->name, "dummy_name");
 			parent->flag = 0;
 		} else {
-			parent->flag = data[i] >> CLK_PARENTS_ID_LEN;
+			parent->flag = FIELD_GET(CLK_PARENTS_FLAGS, data[i]);
 			if (zynqmp_get_clock_name(parent->id, parent->name))
 				continue;
 		}
@@ -638,9 +635,9 @@ static void zynqmp_get_clock_info(void)
 		if (ret)
 			continue;
 
-		clock[i].valid = attr & CLK_VALID_MASK;
-		clock[i].type = attr >> CLK_TYPE_SHIFT ? CLK_TYPE_EXTERNAL :
-							CLK_TYPE_OUTPUT;
+		clock[i].valid = FIELD_GET(CLK_ATTR_VALID, attr);
+		clock[i].type = FIELD_GET(CLK_ATTR_TYPE) ?
+			CLK_TYPE_EXTERNAL : CLK_TYPE_OUTPUT;
 	}
 
 	/* Get topology of all clock */
-- 
2.20.1

