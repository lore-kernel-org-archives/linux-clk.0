Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1E2C10F0C
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 11:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84A4A20883
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 11:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbfCLLAX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 07:00:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41793 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfCLLAU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Mar 2019 07:00:20 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h3f8s-0005o0-Bx; Tue, 12 Mar 2019 12:00:18 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h3f8r-0007bY-JW; Tue, 12 Mar 2019 12:00:17 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 4/5] clk: zynqmp: cleanup sizes of firmware responses
Date:   Tue, 12 Mar 2019 12:00:15 +0100
Message-Id: <20190312110016.29174-5-m.tretter@pengutronix.de>
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

The queries for the clock name, clock topology, clock parents, and clock
attributes return a specified count of values, whose type and number
depends on the query. Properly separate the number of values per query,
make it dependent on the returned type values and get rid of leftover
hard coded sizes.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/clk/zynqmp/clk-zynqmp.h |  6 ------
 drivers/clk/zynqmp/clkc.c       | 32 +++++++++++++++++++-------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-zynqmp.h b/drivers/clk/zynqmp/clk-zynqmp.h
index 7ab163b67249..fec9a15c8786 100644
--- a/drivers/clk/zynqmp/clk-zynqmp.h
+++ b/drivers/clk/zynqmp/clk-zynqmp.h
@@ -10,12 +10,6 @@
 
 #include <linux/firmware/xlnx-zynqmp.h>
 
-/* Clock APIs payload parameters */
-#define CLK_GET_NAME_RESP_LEN				16
-#define CLK_GET_TOPOLOGY_RESP_WORDS			3
-#define CLK_GET_PARENTS_RESP_WORDS			3
-#define CLK_GET_ATTR_RESP_WORDS				1
-
 enum topology_type {
 	TYPE_INVALID,
 	TYPE_MUX,
diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index d3d4ce305e71..573c3c58dbbc 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -23,14 +23,11 @@
 
 #define CLK_TYPE_SHIFT			2
 
-#define PM_API_PAYLOAD_LEN		3
-
 #define NA_PARENT			0xFFFFFFFF
 #define DUMMY_PARENT			0xFFFFFFFE
 
 #define CLK_TYPE_FIELD_LEN		4
 #define CLK_TOPOLOGY_NODE_OFFSET	16
-#define NODES_PER_RESP			3
 
 #define CLK_TYPE_FIELD_MASK		0xF
 #define CLK_FLAG_FIELD_MASK		GENMASK(21, 8)
@@ -54,6 +51,11 @@
 
 #define CLK_VALID_MASK			0x1
 
+#define CLK_GET_NAME_RESP_LEN		16
+#define CLK_GET_TOPOLOGY_RESP_WORDS	3
+#define CLK_GET_PARENTS_RESP_WORDS	3
+#define CLK_GET_ATTR_RESP_WORDS		1
+
 enum clk_type {
 	CLK_TYPE_OUTPUT,
 	CLK_TYPE_EXTERNAL,
@@ -215,7 +217,8 @@ static int zynqmp_pm_clock_get_name(u32 clock_id, char *name)
 	qdata.arg1 = clock_id;
 
 	eemi_ops->query_data(qdata, ret_payload);
-	memcpy(name, ret_payload, CLK_GET_NAME_RESP_LEN);
+	memcpy(name, ret_payload,
+	       CLK_GET_NAME_RESP_LEN * sizeof(*name));
 
 	return 0;
 }
@@ -248,7 +251,8 @@ static int zynqmp_pm_clock_get_topology(u32 clock_id, u32 index, u32 *topology)
 	qdata.arg2 = index;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
-	memcpy(topology, &ret_payload[1], CLK_GET_TOPOLOGY_RESP_WORDS * 4);
+	memcpy(topology, &ret_payload[1],
+	       CLK_GET_TOPOLOGY_RESP_WORDS * sizeof(*topology));
 
 	return ret;
 }
@@ -321,7 +325,8 @@ static int zynqmp_pm_clock_get_parents(u32 clock_id, u32 index, u32 *parents)
 	qdata.arg2 = index;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
-	memcpy(parents, &ret_payload[1], CLK_GET_PARENTS_RESP_WORDS * 4);
+	memcpy(parents, &ret_payload[1],
+	       CLK_GET_PARENTS_RESP_WORDS * sizeof(*parents));
 
 	return ret;
 }
@@ -345,7 +350,8 @@ static int zynqmp_pm_clock_get_attributes(u32 clock_id, u32 *attr)
 	qdata.arg1 = clock_id;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
-	memcpy(attr, &ret_payload[1], CLK_GET_ATTR_RESP_WORDS * 4);
+	memcpy(attr, &ret_payload[1],
+	       CLK_GET_ATTR_RESP_WORDS * sizeof(*attr));
 
 	return ret;
 }
@@ -364,7 +370,7 @@ static int __zynqmp_clock_get_topology(struct clock_topology *topology,
 {
 	int i;
 
-	for (i = 0; i < PM_API_PAYLOAD_LEN; i++) {
+	for (i = 0; i < CLK_GET_TOPOLOGY_RESP_WORDS; i++) {
 		if (!(data[i] & CLK_TYPE_FIELD_MASK))
 			return END_OF_TOPOLOGY_NODE;
 		topology[*nnodes].type = data[i] & CLK_TYPE_FIELD_MASK;
@@ -392,10 +398,10 @@ static int zynqmp_clock_get_topology(u32 clk_id,
 				     u32 *num_nodes)
 {
 	int j, ret;
-	u32 pm_resp[PM_API_PAYLOAD_LEN] = {0};
+	u32 pm_resp[CLK_GET_TOPOLOGY_RESP_WORDS] = {0};
 
 	*num_nodes = 0;
-	for (j = 0; j <= MAX_NODES; j += 3) {
+	for (j = 0; j <= MAX_NODES; j += CLK_GET_TOPOLOGY_RESP_WORDS) {
 		ret = zynqmp_pm_clock_get_topology(clk_id, j, pm_resp);
 		if (ret)
 			return ret;
@@ -422,7 +428,7 @@ static int __zynqmp_clock_get_parents(struct clock_parent *parents, u32 *data,
 	int i;
 	struct clock_parent *parent;
 
-	for (i = 0; i < PM_API_PAYLOAD_LEN; i++) {
+	for (i = 0; i < CLK_GET_PARENTS_RESP_WORDS; i++) {
 		if (data[i] == NA_PARENT)
 			return END_OF_PARENTS;
 
@@ -454,7 +460,7 @@ static int zynqmp_clock_get_parents(u32 clk_id, struct clock_parent *parents,
 				    u32 *num_parents)
 {
 	int j = 0, ret;
-	u32 pm_resp[PM_API_PAYLOAD_LEN] = {0};
+	u32 pm_resp[CLK_GET_PARENTS_RESP_WORDS] = {0};
 
 	*num_parents = 0;
 	do {
@@ -467,7 +473,7 @@ static int zynqmp_clock_get_parents(u32 clk_id, struct clock_parent *parents,
 						 num_parents);
 		if (ret == END_OF_PARENTS)
 			return 0;
-		j += PM_API_PAYLOAD_LEN;
+		j += CLK_GET_PARENTS_RESP_WORDS;
 	} while (*num_parents <= MAX_PARENT);
 
 	return 0;
-- 
2.20.1

