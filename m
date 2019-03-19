Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5981BC10F10
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 257D62133D
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfCSKBv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:01:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41473 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727479AbfCSKBv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:01:51 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ7-0003II-CI; Tue, 19 Mar 2019 11:01:49 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ6-00016w-Mv; Tue, 19 Mar 2019 11:01:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 4/4] clk: zynqmp: use structs for clk query responses
Date:   Tue, 19 Mar 2019 11:01:47 +0100
Message-Id: <20190319100147.4178-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190319100147.4178-1-m.tretter@pengutronix.de>
References: <20190319100147.4178-1-m.tretter@pengutronix.de>
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

The driver retrieves the clock try by querying the ATF for the clock
names, the clock topology, the parents and other attributes. The driver
needs to unmarshal the responses.

The definition of the fields in the firmware responses to the queries is
inconsistent. Some are specified as a mask, some as a shift, and by the
length of the previous field.

Define C structs for the entire firmware responses to avoid passing
pointers to arrays of an implicit size and make the format of the
responses to the queries obvious.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v1 -> v2:
- define structs for firmware responses
- fix size of CLK_TYPOLOGY_FLAGS
---
 drivers/clk/zynqmp/clk-zynqmp.h |   6 --
 drivers/clk/zynqmp/clkc.c       | 146 +++++++++++++++++++-------------
 2 files changed, 85 insertions(+), 67 deletions(-)

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
index d3d4ce305e71..b6a9e1f6c438 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -21,24 +21,6 @@
 #define MAX_NODES			6
 #define MAX_NAME_LEN			50
 
-#define CLK_TYPE_SHIFT			2
-
-#define PM_API_PAYLOAD_LEN		3
-
-#define NA_PARENT			0xFFFFFFFF
-#define DUMMY_PARENT			0xFFFFFFFE
-
-#define CLK_TYPE_FIELD_LEN		4
-#define CLK_TOPOLOGY_NODE_OFFSET	16
-#define NODES_PER_RESP			3
-
-#define CLK_TYPE_FIELD_MASK		0xF
-#define CLK_FLAG_FIELD_MASK		GENMASK(21, 8)
-#define CLK_TYPE_FLAG_FIELD_MASK	GENMASK(31, 24)
-
-#define CLK_PARENTS_ID_LEN		16
-#define CLK_PARENTS_ID_MASK		0xFFFF
-
 /* Flags for parents */
 #define PARENT_CLK_SELF			0
 #define PARENT_CLK_NODE1		1
@@ -52,7 +34,10 @@
 #define END_OF_PARENTS			1
 #define RESERVED_CLK_NAME		""
 
-#define CLK_VALID_MASK			0x1
+#define CLK_GET_NAME_RESP_LEN		16
+#define CLK_GET_TOPOLOGY_RESP_WORDS	3
+#define CLK_GET_PARENTS_RESP_WORDS	3
+#define CLK_GET_ATTR_RESP_WORDS		1
 
 enum clk_type {
 	CLK_TYPE_OUTPUT,
@@ -91,6 +76,31 @@ struct zynqmp_clock {
 	u32 num_parents;
 };
 
+struct name_resp {
+	char name[CLK_GET_NAME_RESP_LEN];
+};
+
+struct topology_resp {
+#define CLK_TOPOLOGY_TYPE		GENMASK(3, 0)
+#define CLK_TOPOLOGY_FLAGS		GENMASK(23, 8)
+#define CLK_TOPOLOGY_TYPE_FLAGS		GENMASK(31, 24)
+	u32 topology[CLK_GET_TOPOLOGY_RESP_WORDS];
+};
+
+struct parents_resp {
+#define NA_PARENT			0xFFFFFFFF
+#define DUMMY_PARENT			0xFFFFFFFE
+#define CLK_PARENTS_ID			GENMASK(15, 0)
+#define CLK_PARENTS_FLAGS		GENMASK(31, 16)
+	u32 parents[CLK_GET_PARENTS_RESP_WORDS];
+};
+
+struct attr_resp {
+#define CLK_ATTR_VALID			BIT(0)
+#define CLK_ATTR_TYPE			BIT(2)
+	u32 attr[CLK_GET_ATTR_RESP_WORDS];
+};
+
 static const char clk_type_postfix[][10] = {
 	[TYPE_INVALID] = "",
 	[TYPE_MUX] = "_mux",
@@ -199,14 +209,15 @@ static int zynqmp_pm_clock_get_num_clocks(u32 *nclocks)
 /**
  * zynqmp_pm_clock_get_name() - Get the name of clock for given id
  * @clock_id:	ID of the clock to be queried
- * @name:	Name of given clock
+ * @response:	Name of the clock with the given id
  *
  * This function is used to get name of clock specified by given
  * clock ID.
  *
- * Return: Returns 0, in case of error name would be 0
+ * Return: Returns 0
  */
-static int zynqmp_pm_clock_get_name(u32 clock_id, char *name)
+static int zynqmp_pm_clock_get_name(u32 clock_id,
+				    struct name_resp *response)
 {
 	struct zynqmp_pm_query_data qdata = {0};
 	u32 ret_payload[PAYLOAD_ARG_CNT];
@@ -215,7 +226,7 @@ static int zynqmp_pm_clock_get_name(u32 clock_id, char *name)
 	qdata.arg1 = clock_id;
 
 	eemi_ops->query_data(qdata, ret_payload);
-	memcpy(name, ret_payload, CLK_GET_NAME_RESP_LEN);
+	memcpy(response, ret_payload, sizeof(*response));
 
 	return 0;
 }
@@ -224,7 +235,7 @@ static int zynqmp_pm_clock_get_name(u32 clock_id, char *name)
  * zynqmp_pm_clock_get_topology() - Get the topology of clock for given id
  * @clock_id:	ID of the clock to be queried
  * @index:	Node index of clock topology
- * @topology:	Buffer to store nodes in topology and flags
+ * @response:	Buffer used for the topology response
  *
  * This function is used to get topology information for the clock
  * specified by given clock ID.
@@ -237,7 +248,8 @@ static int zynqmp_pm_clock_get_name(u32 clock_id, char *name)
  *
  * Return: 0 on success else error+reason
  */
-static int zynqmp_pm_clock_get_topology(u32 clock_id, u32 index, u32 *topology)
+static int zynqmp_pm_clock_get_topology(u32 clock_id, u32 index,
+					struct topology_resp *response)
 {
 	struct zynqmp_pm_query_data qdata = {0};
 	u32 ret_payload[PAYLOAD_ARG_CNT];
@@ -248,7 +260,7 @@ static int zynqmp_pm_clock_get_topology(u32 clock_id, u32 index, u32 *topology)
 	qdata.arg2 = index;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
-	memcpy(topology, &ret_payload[1], CLK_GET_TOPOLOGY_RESP_WORDS * 4);
+	memcpy(response, &ret_payload[1], sizeof(*response));
 
 	return ret;
 }
@@ -297,7 +309,7 @@ struct clk_hw *zynqmp_clk_register_fixed_factor(const char *name, u32 clk_id,
  * zynqmp_pm_clock_get_parents() - Get the first 3 parents of clock for given id
  * @clock_id:	Clock ID
  * @index:	Parent index
- * @parents:	3 parents of the given clock
+ * @response:	Parents of the given clock
  *
  * This function is used to get 3 parents for the clock specified by
  * given clock ID.
@@ -310,7 +322,8 @@ struct clk_hw *zynqmp_clk_register_fixed_factor(const char *name, u32 clk_id,
  *
  * Return: 0 on success else error+reason
  */
-static int zynqmp_pm_clock_get_parents(u32 clock_id, u32 index, u32 *parents)
+static int zynqmp_pm_clock_get_parents(u32 clock_id, u32 index,
+				       struct parents_resp *response)
 {
 	struct zynqmp_pm_query_data qdata = {0};
 	u32 ret_payload[PAYLOAD_ARG_CNT];
@@ -321,7 +334,7 @@ static int zynqmp_pm_clock_get_parents(u32 clock_id, u32 index, u32 *parents)
 	qdata.arg2 = index;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
-	memcpy(parents, &ret_payload[1], CLK_GET_PARENTS_RESP_WORDS * 4);
+	memcpy(response, &ret_payload[1], sizeof(*response));
 
 	return ret;
 }
@@ -329,13 +342,14 @@ static int zynqmp_pm_clock_get_parents(u32 clock_id, u32 index, u32 *parents)
 /**
  * zynqmp_pm_clock_get_attributes() - Get the attributes of clock for given id
  * @clock_id:	Clock ID
- * @attr:	Clock attributes
+ * @response:	Clock attributes response
  *
  * This function is used to get clock's attributes(e.g. valid, clock type, etc).
  *
  * Return: 0 on success else error+reason
  */
-static int zynqmp_pm_clock_get_attributes(u32 clock_id, u32 *attr)
+static int zynqmp_pm_clock_get_attributes(u32 clock_id,
+					  struct attr_resp *response)
 {
 	struct zynqmp_pm_query_data qdata = {0};
 	u32 ret_payload[PAYLOAD_ARG_CNT];
@@ -345,7 +359,7 @@ static int zynqmp_pm_clock_get_attributes(u32 clock_id, u32 *attr)
 	qdata.arg1 = clock_id;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
-	memcpy(attr, &ret_payload[1], CLK_GET_ATTR_RESP_WORDS * 4);
+	memcpy(response, &ret_payload[1], sizeof(*response));
 
 	return ret;
 }
@@ -354,24 +368,28 @@ static int zynqmp_pm_clock_get_attributes(u32 clock_id, u32 *attr)
  * __zynqmp_clock_get_topology() - Get topology data of clock from firmware
  *				   response data
  * @topology:		Clock topology
- * @data:		Clock topology data received from firmware
+ * @response:		Clock topology data received from firmware
  * @nnodes:		Number of nodes
  *
  * Return: 0 on success else error+reason
  */
 static int __zynqmp_clock_get_topology(struct clock_topology *topology,
-				       u32 *data, u32 *nnodes)
+				       struct topology_resp *response,
+				       u32 *nnodes)
 {
 	int i;
+	u32 type;
 
-	for (i = 0; i < PM_API_PAYLOAD_LEN; i++) {
-		if (!(data[i] & CLK_TYPE_FIELD_MASK))
+	for (i = 0; i < ARRAY_SIZE(response->topology); i++) {
+		type = FIELD_GET(CLK_TOPOLOGY_TYPE, response->topology[i]);
+		if (type == TYPE_INVALID)
 			return END_OF_TOPOLOGY_NODE;
-		topology[*nnodes].type = data[i] & CLK_TYPE_FIELD_MASK;
-		topology[*nnodes].flag = FIELD_GET(CLK_FLAG_FIELD_MASK,
-						   data[i]);
+		topology[*nnodes].type = type;
+		topology[*nnodes].flag = FIELD_GET(CLK_TOPOLOGY_FLAGS,
+						   response->topology[i]);
 		topology[*nnodes].type_flag =
-				FIELD_GET(CLK_TYPE_FLAG_FIELD_MASK, data[i]);
+				FIELD_GET(CLK_TOPOLOGY_TYPE_FLAGS,
+					  response->topology[i]);
 		(*nnodes)++;
 	}
 
@@ -392,14 +410,15 @@ static int zynqmp_clock_get_topology(u32 clk_id,
 				     u32 *num_nodes)
 {
 	int j, ret;
-	u32 pm_resp[PM_API_PAYLOAD_LEN] = {0};
+	struct topology_resp response = {0};
 
 	*num_nodes = 0;
-	for (j = 0; j <= MAX_NODES; j += 3) {
-		ret = zynqmp_pm_clock_get_topology(clk_id, j, pm_resp);
+	for (j = 0; j <= MAX_NODES; j += ARRAY_SIZE(response.topology)) {
+		ret = zynqmp_pm_clock_get_topology(clk_id, j, &response);
 		if (ret)
 			return ret;
-		ret = __zynqmp_clock_get_topology(topology, pm_resp, num_nodes);
+		ret = __zynqmp_clock_get_topology(topology, &response,
+						  num_nodes);
 		if (ret == END_OF_TOPOLOGY_NODE)
 			return 0;
 	}
@@ -411,28 +430,30 @@ static int zynqmp_clock_get_topology(u32 clk_id,
  * __zynqmp_clock_get_parents() - Get parents info of clock from firmware
  *				   response data
  * @parents:		Clock parents
- * @data:		Clock parents data received from firmware
+ * @response:		Clock parents data received from firmware
  * @nparent:		Number of parent
  *
  * Return: 0 on success else error+reason
  */
-static int __zynqmp_clock_get_parents(struct clock_parent *parents, u32 *data,
+static int __zynqmp_clock_get_parents(struct clock_parent *parents,
+				      struct parents_resp *response,
 				      u32 *nparent)
 {
 	int i;
 	struct clock_parent *parent;
 
-	for (i = 0; i < PM_API_PAYLOAD_LEN; i++) {
-		if (data[i] == NA_PARENT)
+	for (i = 0; i < ARRAY_SIZE(response->parents); i++) {
+		if (response->parents[i] == NA_PARENT)
 			return END_OF_PARENTS;
 
 		parent = &parents[i];
-		parent->id = data[i] & CLK_PARENTS_ID_MASK;
-		if (data[i] == DUMMY_PARENT) {
+		parent->id = FIELD_GET(CLK_PARENTS_ID, response->parents[i]);
+		if (response->parents[i] == DUMMY_PARENT) {
 			strcpy(parent->name, "dummy_name");
 			parent->flag = 0;
 		} else {
-			parent->flag = data[i] >> CLK_PARENTS_ID_LEN;
+			parent->flag = FIELD_GET(CLK_PARENTS_FLAGS,
+						 response->parents[i]);
 			if (zynqmp_get_clock_name(parent->id, parent->name))
 				continue;
 		}
@@ -454,20 +475,20 @@ static int zynqmp_clock_get_parents(u32 clk_id, struct clock_parent *parents,
 				    u32 *num_parents)
 {
 	int j = 0, ret;
-	u32 pm_resp[PM_API_PAYLOAD_LEN] = {0};
+	struct parents_resp response = {0};
 
 	*num_parents = 0;
 	do {
 		/* Get parents from firmware */
-		ret = zynqmp_pm_clock_get_parents(clk_id, j, pm_resp);
+		ret = zynqmp_pm_clock_get_parents(clk_id, j, &response);
 		if (ret)
 			return ret;
 
-		ret = __zynqmp_clock_get_parents(&parents[j], pm_resp,
+		ret = __zynqmp_clock_get_parents(&parents[j], &response,
 						 num_parents);
 		if (ret == END_OF_PARENTS)
 			return 0;
-		j += PM_API_PAYLOAD_LEN;
+		j += ARRAY_SIZE(response.parents);
 	} while (*num_parents <= MAX_PARENT);
 
 	return 0;
@@ -621,20 +642,23 @@ static int zynqmp_register_clocks(struct device_node *np)
 static void zynqmp_get_clock_info(void)
 {
 	int i, ret;
-	u32 attr, type = 0;
+	u32 type = 0;
+	struct attr_resp attr;
+	struct name_resp name;
 
 	for (i = 0; i < clock_max_idx; i++) {
-		zynqmp_pm_clock_get_name(i, clock[i].clk_name);
-		if (!strcmp(clock[i].clk_name, RESERVED_CLK_NAME))
+		zynqmp_pm_clock_get_name(i, &name);
+		if (!strcmp(name.name, RESERVED_CLK_NAME))
 			continue;
+		strncpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
 
 		ret = zynqmp_pm_clock_get_attributes(i, &attr);
 		if (ret)
 			continue;
 
-		clock[i].valid = attr & CLK_VALID_MASK;
-		clock[i].type = attr >> CLK_TYPE_SHIFT ? CLK_TYPE_EXTERNAL :
-							CLK_TYPE_OUTPUT;
+		clock[i].valid = FIELD_GET(CLK_ATTR_VALID, attr.attr[0]);
+		clock[i].type = FIELD_GET(CLK_ATTR_TYPE, attr.attr[0]) ?
+			CLK_TYPE_EXTERNAL : CLK_TYPE_OUTPUT;
 	}
 
 	/* Get topology of all clock */
-- 
2.20.1

