Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6E2C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E725F64E79
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhBREvf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:51:35 -0500
Received: from mail-mw2nam12on2070.outbound.protection.outlook.com ([40.107.244.70]:56608
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230295AbhBREve (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Feb 2021 23:51:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muUqzdFLJRcqjCcjA/I18dMZdA/9HZvsOsXmSX2ojPZMJLlnyKbQI2CaKpWwDUouQ3AZBoBnfN661srOTsyLAvKvGQyIB2QbrVbOY1crwLuxmsHr/u6pKcGTWrqPw8IXY0Tnjg2TAgpL8UYWL+hCebaVty/qoK7rp1o9dhnCYSQO0m0+UqIk4NpQizIJy0PsVM/+Q/YVbbPqN1rvueTwNYlI/LzJLTGG1FVoPAkX27IlMBiZr7RdvfQFYeFrNh9lF2NlyXo9tJfCq/9avLDvKync+EtH0hm7FeGWzaGbtZI4eeu8Vwbf10sIfY00TZkPhQHjMVIeTdBZbFwyYZUR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPH057RPQDtOERkZ9ejyiEgSRGlW6mFd0WO963lWKw=;
 b=fc5+Wpho9lmALTgZwLg4mJalcHnyYt1AMEcrW05hbxv1f52AqbYWfyS+usWMRstXWWk+VrrvMPxCVdKc/GM52r4b7HT20sUE1Kz1ghAivQ1qi634Pc6H/pOAIYXaSfWwo5YIQToucnElZIdkR30EEpqRRb0zta6CWRKHVmPgE+k8+sxoCHzPc65CfHAk5Ohw8L3WI5F7RJZecEPM3pzCRf5YjbiO5HT/esoI7sida+DR8NEo9Xl11MSvpZsT0HtD+IatCxTFiYUR1zs9Ha4HcB4NsGiVU3cFSz65K3S7cu4d28S7KUXVhjo/jhxkxcKwjyJNpkYgw6/fD8r9U59QBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPH057RPQDtOERkZ9ejyiEgSRGlW6mFd0WO963lWKw=;
 b=NvddH7uZb4pHkusSYx6iKtPSTFqmesS2L4bSFk1wDfeTNsniO6QCLvZoxoiQCUTieSq0lhXdwSSN5hr9vPYSXUl6XsgLQmQp6/2QHTFRvGUWLiExOY8iAoeY8BeeocI/dY5IfLPu+c5lD7DX8ReQkR+LiTJC2JleEregEcoFSeU=
Received: from DM6PR11CA0026.namprd11.prod.outlook.com (2603:10b6:5:190::39)
 by MN2PR02MB6432.namprd02.prod.outlook.com (2603:10b6:208:181::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 04:50:40 +0000
Received: from DM3NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::e3) by DM6PR11CA0026.outlook.office365.com
 (2603:10b6:5:190::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 04:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT062.mail.protection.outlook.com (10.13.5.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 04:50:40 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Feb 2021 20:50:19 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 17 Feb 2021 20:50:19 -0800
Envelope-to: shubhrajyoti.datta@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com
Received: from [10.140.6.59] (port=35054 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lCbGc-0004qG-Ob; Wed, 17 Feb 2021 20:50:19 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <miquel.raynal@bootlin.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v9 6/7] clk: clock-wizard: Remove the hardcoding of the clock outputs
Date:   Thu, 18 Feb 2021 10:19:50 +0530
Message-ID: <1613623791-4598-7-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 830f1c74-2907-4052-581f-08d8d3c8bda2
X-MS-TrafficTypeDiagnostic: MN2PR02MB6432:
X-Microsoft-Antispam-PRVS: <MN2PR02MB64326C21C743D6ABE03F7E00AA859@MN2PR02MB6432.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+XTCSIzrbYi0sBmXnWcOt9pacpmkFBVVaMVeoyy+3rgXSs7Vhb0PsD33dQsHanVurIvU9yUwsXQl6JL1s/Be3n1fkTUBEHtjUGNNLk+rhV840xFwOeajx0gInWrG9+s+HPmrc1VhcsXsEr+b4V0Kx6zHFHqNR4z+syTW/qYUlkFiVt4WGmEJc87RagILFjrfWQQjRbjjZ2Y27bocPsi9f29SIW9lGCFGOneH/Mox5CUDgCBh9wk1lCzVk4QGsDcGq9UeyauLwKNuHAsZu3D867H3SQu8zmA/r2TfFMCXg5fev55voS8efo44w4VK1RFsIcd7OCEHxHmEvohrCVWaJtGY+8ATRI/gOOwk+g0um7tAJmLZ+ZDjaSYxxL39wdE29IFu4iQRejERY1k8fWBsmZqDkaAed1bnZ7Qc7Kf8u0r8ZbqEQt5rT/Bo40O6Il+usOPSPduCNScpsro0CdOhdqdSHB4wyMMAjMwYjZbZ0GJxdglxuo3NOnoPYs0AQD+yJX8ZR20oZvetM8s7OUKryDxg1nX/gx4+wIXuV5iF/HcNOBtqRfHyMFVJNERkS/x0jB205rV4dMz9zjT8amuhthIiHH3XFsBIAI37+0bY8JSMQW0TJE4BB/yr4EqB+JzZcqmuVNhrIzrqgo014Wm9gbDngG/VUf85rqRg1PsPj2qgxJlky1uv7Zkdr6XIzG8
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(44832011)(7636003)(316002)(8936002)(2616005)(356005)(478600001)(6666004)(8676002)(426003)(82310400003)(82740400003)(54906003)(36860700001)(70586007)(36756003)(5660300002)(7696005)(2906002)(83380400001)(4326008)(186003)(70206006)(9786002)(36906005)(336012)(6916009)(26005)(47076005)(107886003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 04:50:40.0478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830f1c74-2907-4052-581f-08d8d3c8bda2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6432
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The number of output clocks are configurable in the hardware.
Currently the driver registers the maximum number of outputs.
Fix the same by registering only the outputs that are there.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v4:
Assign output in this patch

 drivers/clk/clk-xlnx-clock-wizard.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index ed3b0ef..d403a74 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -473,6 +473,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	unsigned long rate;
 	const char *clk_name;
 	struct clk_wzrd *clk_wzrd;
+	int outputs;
 	struct device_node *np = pdev->dev.of_node;
 
 	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
@@ -541,6 +542,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	outputs = of_property_count_strings(np, "clock-output-names");
 	/* register div */
 	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
 			WZRD_DIVCLK_DIVIDE_MASK) >> WZRD_DIVCLK_DIVIDE_SHIFT;
@@ -562,7 +564,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	}
 
 	/* register div per output */
-	for (i = WZRD_NUM_OUTPUTS - 1; i >= 0 ; i--) {
+	for (i = outputs - 1; i >= 0 ; i--) {
 		const char *clkout_name;
 
 		if (of_property_read_string_index(np, "clock-output-names", i,
@@ -593,7 +595,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		if (IS_ERR(clk_wzrd->clkout[i])) {
 			int j;
 
-			for (j = i + 1; j < WZRD_NUM_OUTPUTS; j++)
+			for (j = i + 1; j < outputs; j++)
 				clk_unregister(clk_wzrd->clkout[j]);
 			dev_err(&pdev->dev,
 				"unable to register divider clock\n");
-- 
2.1.1

