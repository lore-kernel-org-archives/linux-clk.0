Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7966BC433DB
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:37:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23F2164FBD
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhBEDhw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 22:37:52 -0500
Received: from mail-bn8nam11on2053.outbound.protection.outlook.com ([40.107.236.53]:16608
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230086AbhBEDgv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 22:36:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIvhio54AqVJVmaf8BzHevRjaYQq823OhRN1CqVTK7kaL5VMgkiq1bzvjRn5bMoGj3ObhcIndQVgiNfgjtVCvI3bn6ohDUVmICOKAVmMiYbXoaplk6bpReDcpUv09BULxTSjVKKtggmFFO9GnJidjLeNyV0OAZ9tHzd+z7uxtyj+X/OBG8nDbeGhK2iWo9WWOaa67PyhKgw9pUDHwKXIgMqfNv1jbvYLU3kEhzkm8xg3aHUiZMWH0WO5NDUiW/oJdLb9btX/CBEqgX6PKbHaT2CCf7lt4DkQgpurGsl2GZwM9KRcIJmKlgFafTtEeEFtTkwPhuSorPE4m9Uh2/+v0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzWpoEg9ePlhAJDPVNMW6jmZje8cAPEzos4OM4ug4AE=;
 b=YRPMOQM6MJHO2na8vc5B+wB6Orl57qYKp9eRlL2ezheqAzH8O/hEGA8FjYm++SzqPrZx13aGX+1X6Ik+VvEYWbg9eeaMz4RjtSM4V88b59YqY1HFrZ4iQ17gJeu+2Q/ngyYULndsOk4ktMVqfQHqIEDz0ucCllwhHyHM4XVqERQ/0TAOhgp+Ghwf0XyPM+dg9IYgZux8YBMe142ugY9ZQ5WNa+hob9CbSe04L5qGVbl7iK36DokxRTWulFSmDSKr/gqqXd8fzPgw8XrDH5cKuzMhjZkdiJU/5TtNTO0/I0DBG6woj8QvSeysJBwPrX+Mpd4QJOv5RqJhZEc1EgEWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzWpoEg9ePlhAJDPVNMW6jmZje8cAPEzos4OM4ug4AE=;
 b=s+PL7+sYiCTIr2A6Nug6EXHYNZxxBt1rUj+0ptZ8m9oXdgbgVIIlWRQA7s7ikvCbplStbepML50rC3TPloCoXCbSQ1tRqY2YPBXgVp0JTvfqF2/NQhijis79VV3ZnelXgpc3Ce1c8JbApuADLWCwoFs4RE0JTboR7iYiNcKtOR0=
Received: from SA9PR13CA0061.namprd13.prod.outlook.com (2603:10b6:806:23::6)
 by PH0PR02MB7237.namprd02.prod.outlook.com (2603:10b6:510:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 03:35:43 +0000
Received: from SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:23:cafe::79) by SA9PR13CA0061.outlook.office365.com
 (2603:10b6:806:23::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Fri, 5 Feb 2021 03:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT013.mail.protection.outlook.com (10.152.72.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 5 Feb 2021 03:35:43 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 19:35:42 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 19:35:42 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org
Received: from [172.19.2.30] (port=57600 helo=xsjsaeedn50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <saeed.nowshadi@xilinx.com>)
        id 1l7ruH-0000iH-4i; Thu, 04 Feb 2021 19:35:41 -0800
From:   Saeed Nowshadi <saeed.nowshadi@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <git-dev@xilinx.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        "Michal Simek" <michal.simek@xilinx.com>
Subject: [PATCH 2/2] clk: si570: Skip NVM to RAM recall operation if an optional property is set
Date:   Thu, 4 Feb 2021 19:35:04 -0800
Message-ID: <1612496104-3437-3-git-send-email-saeed.nowshadi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com>
References: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 461c4ee2-4b69-4ffa-53a9-08d8c9871e13
X-MS-TrafficTypeDiagnostic: PH0PR02MB7237:
X-Microsoft-Antispam-PRVS: <PH0PR02MB72378D508DB1A71A21427C6BAFB29@PH0PR02MB7237.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLRlYg160p79cJXv8PEMkyw0cBDiSQpYjsrB9gqrPg2SXCZaSQlVJd1klYy7NBMc4JPco+2XmlgZ5Lk3DA8OvmfRwC3hgd6qxdGWBauqEVXZvirxPUWYyOvaagv7KLoAkDVw0Eu4M7dEsTZlEJckBZ/kO1A3/knbsMIwFNGPQ2Gemzy6AhQfQqa0PCWtZDO+Erg42P4WB112Nm/g6+j5tXZw/2Ul48vH66+BpBtKq34bZSlxPVy+13I8suXp09IqDoRlAvNWh1VaP1+1sUWMlgKQq18UqoCAoxvejCmiwCnUq+m4IDAvBJ2b1SKiiUxjOu8WKnRiRyLCHTyWxOGLhlwNRtIX+/qJh3vV9rTEC6WY+MgO9gNTnx0vwDb6kdJwsYjRuKnQRybaW8keUSoFSmzG36/DzlNRrZAI6depb4l0Hb9HFiQNiPuOpeu4NjrFIoI2VrTNEIY+fUr4naWRKLJt2ul7llI/fSUigswZ91bmpflAn2ALANVBGt1VJvgI4rIHztndhwLjR4G98E4xo+SBSKEsArJ8Aa25xHSGfpLpH4AVwpeP4r0TOJoDqh5UzCcr4pBRTpBO5j4lbBTeZcPABypWvPnnl6NnEN3dlAxycD5BLkW/CAQLZC/hTXKOgkRLmcX+jItwV66+h+1wV7L4OKuKqpCoSDjfRkuzi8Vch8D9ttvECtnafmcmQ8Lc
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(36840700001)(6666004)(110136005)(478600001)(36906005)(107886003)(54906003)(316002)(426003)(70586007)(186003)(26005)(82310400003)(7696005)(4326008)(83380400001)(36756003)(7636003)(8936002)(47076005)(36860700001)(336012)(44832011)(8676002)(2616005)(9786002)(70206006)(5660300002)(82740400003)(2906002)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 03:35:43.4476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 461c4ee2-4b69-4ffa-53a9-08d8c9871e13
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7237
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Recalling NVM data into RAM during probe() initiates a re-calibration of
the clock. If the clock is already in-use, the recall operation can cause
a glitch on the frequency out. At power on, the factory data are loaded
from NVM into RAM by default. If the clock frequency has been changed
since power on, the recall operation can be used to re-initialize the clock
to factory setting.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 drivers/clk/clk-si570.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index 34b2560..eea5012 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2010, 2011 Ericsson AB.
  * Copyright (C) 2011 Guenter Roeck.
- * Copyright (C) 2011 - 2013 Xilinx Inc.
+ * Copyright (C) 2011 - 2021 Xilinx Inc.
  *
  * Author: Guenter Roeck <guenter.roeck@ericsson.com>
  *	   Sören Brinkmann <soren.brinkmann@xilinx.com>
@@ -123,14 +123,18 @@ static int si570_get_divs(struct clk_si570 *data, u64 *rfreq,
  * si570_get_defaults() - Get default values
  * @data:	Driver data structure
  * @fout:	Factory frequency output
+ * @skip_recall:	If true, don't recall NVM into RAM
  * Returns 0 on success, negative errno otherwise.
  */
-static int si570_get_defaults(struct clk_si570 *data, u64 fout)
+static int si570_get_defaults(struct clk_si570 *data, u64 fout,
+			      bool skip_recall)
 {
 	int err;
 	u64 fdco;
 
-	regmap_write(data->regmap, SI570_REG_CONTROL, SI570_CNTRL_RECALL);
+	if (!skip_recall)
+		regmap_write(data->regmap, SI570_REG_CONTROL,
+			     SI570_CNTRL_RECALL);
 
 	err = si570_get_divs(data, &data->rfreq, &data->n1, &data->hs_div);
 	if (err)
@@ -400,6 +404,7 @@ static int si570_probe(struct i2c_client *client,
 	struct clk_si570 *data;
 	struct clk_init_data init;
 	u32 initial_fout, factory_fout, stability;
+	bool skip_recall;
 	int err;
 	enum clk_si570_variant variant = id->driver_data;
 
@@ -441,6 +446,9 @@ static int si570_probe(struct i2c_client *client,
 		return err;
 	}
 
+	skip_recall = of_property_read_bool(client->dev.of_node,
+					    "silabs,skip-recall");
+
 	data->regmap = devm_regmap_init_i2c(client, &si570_regmap_config);
 	if (IS_ERR(data->regmap)) {
 		dev_err(&client->dev, "failed to allocate register map\n");
@@ -448,7 +456,7 @@ static int si570_probe(struct i2c_client *client,
 	}
 
 	i2c_set_clientdata(client, data);
-	err = si570_get_defaults(data, factory_fout);
+	err = si570_get_defaults(data, factory_fout, skip_recall);
 	if (err)
 		return err;
 
-- 
2.7.4

