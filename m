Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205BCC4742C
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 15:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1D082074F
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 15:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="V4N4thh6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgKDPHz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:07:55 -0500
Received: from mail-co1nam11on2049.outbound.protection.outlook.com ([40.107.220.49]:5408
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730257AbgKDPHz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 10:07:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCWf9rSz1nMgjQuNjVJFKGpK427vUY0mjrI4XBRb1/K2a5Fk46fbUGyvs7RfDNABKnjisZiQSN5+xXVZ5+grq+0sP+J3Y7Zxs/DQUikABuYWO+L26Or9HvyEH8ue0ILH1ERe43QjbBMly4DIhM9aoKBFQ9eRLOTMLrpRkA5GGZ31xq0UlTQDYtnfvZZJ0JsZA4vPryB4kIeLWdSaFiD1c7iZxA40pfIPDNnK/34STvXYf0Z5d0MjFmzmvRC8alh64SGaAaZswwPSWUD1iFIdR25auqjyQUdKnSDuTvD5rJMgyLFfN+BuSvUjR8DqFLW5h8zliXX7+dfOdeYzdfHKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPH057RPQDtOERkZ9ejyiEgSRGlW6mFd0WO963lWKw=;
 b=QeMyeXrG0f/J+fTwXN4c78MR7rbXzmkhFWf6buggOcRlHdIsJuMDJm4QNMOXe0oTsytY29/s+0g5fLkEjp/CEaXgsSO2Vcp+LkGCk0U+DfHt5ruIaeXpb/pn0CMfF0rNpcNqQXBlkW9DIs256qwIZYTYrBO5vnRLeWr3K1CMVA2R+Ax82gOGSCFrwR95osTUdTN7UwI2o+H7jguqZhLZA+vrNxa0viA5SKhZ1DROPQk6dpKB0UVIJXgcaKVWdLM8+wKLxjTP+pxYKjaNs2i19NGZJmM7oCKPEzhvjIo96jeDzvMag6sV71E/SPdMAYhJOhC5Ksy91fvWkYA1vj9iyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPH057RPQDtOERkZ9ejyiEgSRGlW6mFd0WO963lWKw=;
 b=V4N4thh6x5gzwqA0JCzSP1FqwiJB6vHZCuCjLnQpd4WEOZEqXXD6/bKuiDGGR/EmU+2wm2yRTGjoEf9pBaUG2TXSWWHkwM0IYp4Hte5mTEXw+AhJAqDLMMbGozMDTWLyI+E6x3aryRX2QOLhFr8WjVxOGObPqWj/z59i+EcDLRQ=
Received: from BL1PR13CA0127.namprd13.prod.outlook.com (2603:10b6:208:2bb::12)
 by MWHPR02MB3280.namprd02.prod.outlook.com (2603:10b6:301:64::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 4 Nov
 2020 15:07:52 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2bb:cafe::f4) by BL1PR13CA0127.outlook.office365.com
 (2603:10b6:208:2bb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Wed, 4 Nov 2020 15:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 15:07:50 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 4 Nov 2020 07:07:10 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 4 Nov 2020 07:07:10 -0800
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 devel@driverdev.osuosl.org
Received: from [10.140.6.59] (port=49678 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1kaKNR-0007UB-8w; Wed, 04 Nov 2020 07:07:09 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@xilinx.com>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <devel@driverdev.osuosl.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v7 6/7] clk: clock-wizard: Remove the hardcoding of the clock outputs
Date:   Wed, 4 Nov 2020 20:36:46 +0530
Message-ID: <1604502407-14352-7-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05071b4b-aae2-46c5-9021-08d880d36660
X-MS-TrafficTypeDiagnostic: MWHPR02MB3280:
X-Microsoft-Antispam-PRVS: <MWHPR02MB3280110F92FEBB57A162A34BAAEF0@MWHPR02MB3280.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0leotmDTF2S5rr0F89gZDzSin1S2GuwrgrVMs23Q2oAf5acqNNiBWjEmLfmDTj5HdNEDFAPqcjLMNf4xMrQYHJQQgk+xBaY7NrV/aV0B1mtsVXVHlYjTz05pz3CwSQNE/ADPK6uhnBKsrf1zpvWNrsMY7BmkjMxdNQs7XthGS9hqt5da6WyAZswrGXV16Fb6KDT1JZWsT3Daq2fxbZFt3PppSVG4+MQgjFH3L/cJoqXcFdxL5G8Cvxvz9xCyXfE4FfRqQmCGiyoMFmA2cvM2F9IZeYCEvlLSlI1+uAGrX2h31PkOpkMV3IsxWPhoz5ufMhYGXdBpb9rYkfl0+JbZXUWdjbhK6EVHxEkrDrF7JsIyxXDnyn62D0RX4VRk1pK0c/Qj8y0Q0RVVFPlxYD9VdRCJmJr7Nwqb/ECS9fSkik=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966005)(316002)(107886003)(2906002)(186003)(36906005)(26005)(7696005)(6916009)(426003)(82310400003)(336012)(54906003)(2616005)(83380400001)(47076004)(44832011)(70586007)(8676002)(70206006)(7636003)(356005)(82740400003)(5660300002)(478600001)(9786002)(8936002)(36756003)(6666004)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 15:07:50.4080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05071b4b-aae2-46c5-9021-08d880d36660
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3280
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

