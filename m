Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5562CC4338F
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4152761056
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238109AbhHRHAS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:00:18 -0400
Received: from mail-bn7nam10on2062.outbound.protection.outlook.com ([40.107.92.62]:4256
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238080AbhHRHAS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Aug 2021 03:00:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvtzguUkWYm9rjVhKwwfvzTokGr333E+OsdkT30jyDZoICwYX0h99HPVDx2uni6sIlH+tnuuc4mmyzZnyg6mKH3Y2iOg6aODKyLNphMDFrsmmhn4J2eiAZO7U+L//ysHXonC6ENB/BYcCbx3iHzIOc07TqbsgJJjiDwXMIrCaCKTdFSch+PdVSb/lTZtH5C5joSbWjXsX2B1KjO2HxAYnamyjEdYSTxe1QAiPCvGDMQMzyotLfdzBQZJL9qWR17Iz4V1NpmRmJdZdIXKebWXmLjbW3CN0D8TY1UJsR5T9TZA21RHLyHYYqJOWWNKTotCq7fJf+qupXMhq8U8uf917Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cet0Nu5Ylop2oeRaVrV9oUq89/9IpmSGUC6qWjr7+6E=;
 b=OTBOe3EfcWeQgIXVEMKT+imBbEUqyP/k3b5HkCCC961OiGbee6+FBJ+nGb5kSQMwB6w/0v2eNQEUOApphuc48jrLj1h+IBO5ICAwWf+E7C3WOUzzsQ8LO0TqFZjPL9rlEIqtBkOe0O6YoqLl4RiC4iC6g75q2/hAM+oUgEidgtD3slVmNes7bQSx9iA6G9lM1ptvGx2a09EDPG5HByy1pahQHzra5qhy74uI3YGOlnI3qa2G792JYm0q+VPO0gN5L8dYmviMV6ifHsLLTvY5YwQPyxUP28l4g0td3bMQzmsNFw3x9r/5QIio04QsRyIjFoLHlcJWRry8A8LRPjF8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cet0Nu5Ylop2oeRaVrV9oUq89/9IpmSGUC6qWjr7+6E=;
 b=WbbL9iKn7ASpuizV6W7AZQC3LetQW8Bnun9aqnQA0zA5PXTYoOPpRkg8Q8Zz7q+XWNBYfFRafDPRGbBbPs94mREHkCQHrLwtuIGwR9/+xEIh0RImu01rDFvSZr0F8NOCPBdZb2aTty1oek4n0fvjjJmafIg6JxYbhIZUuDZ4PlQ=
Received: from BN0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:e4::9)
 by BYAPR02MB4919.namprd02.prod.outlook.com (2603:10b6:a03:51::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Wed, 18 Aug
 2021 06:59:42 +0000
Received: from BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::6a) by BN0PR02CA0004.outlook.office365.com
 (2603:10b6:408:e4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 06:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT010.mail.protection.outlook.com (10.13.2.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 06:59:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 Aug 2021 23:59:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 Aug 2021 23:59:40 -0700
Envelope-to: linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=53032 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mGFY2-000GPx-OH; Tue, 17 Aug 2021 23:59:39 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <michal.simek@xilinx.com>, <git-dev@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/3] clk: zynqmp: Fix a memory leak
Date:   Wed, 18 Aug 2021 12:29:28 +0530
Message-ID: <20210818065929.12835-3-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com>
References: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d310938-8ae8-43dc-596a-08d96215c0a7
X-MS-TrafficTypeDiagnostic: BYAPR02MB4919:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4919631853A8F3AA7BDB9855AAFF9@BYAPR02MB4919.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sBPXr0Stl1UiPGxARnQXDVb7+oxqQkqJF2ZdNnO5CFEGiMfCvFDG9sGpMPvVOQnXRl0+coqtRwa9mRdGF29q3N4V50Mqh9rj6cD/ZRw8R7l72GO4Qns9uhfhwvYS7MFIn4Fi5IPEaNxz2rvcOQJOwoRezxeivjBaC2uyCx6aE3dX41My1ULsClfen5ltQnJa9teDmvJGA88tpm+HiLhHepS29KL1ghn2Bnu97fRBhODqBNOkafASlycilIQRTYs7015wqcgFh5eNECaXMmkbEUy9+/SB8D9S+VVhSFx82ilHpYj7qkheUXpbQKJyHWtsyoRrNQ6KnFEbmt41eghFM83QwV5/uGJsanDXEaxGNl5rXYf3n8vECRLn8eQSHwWf1VPO1H5NP6PhmODZODw+hjx6UWZtL0FUNNnz2Yw6qjfsG7plOJm039RedxRySVieGcsjJo2s9w9QnkctynNL1GurKLKUonS0wzkIm15/dMjwIJ2/EEpXMjVdjHBe6ncvyO1h4LeVKdUOjyrPbh+7i+R2Re2jFTHaeVliuUu+UleOEvRv0kN4DFkQX2rQq/kN4ZOqjnNSWy0cEVX8yrQ50oFMNK+CR9e7hJ2UeNVA2N6dyeEfEWgoi7dFSln/48eJ+C3fduQ4MAlOf/IiAqeAdcsbwQ9CKw3WdI/LGP4ewjNNf/Ds1C5xciv7YFTBu21/Sebs8f1QfLAOAQi9hETxebWJaTUj4RPzQjT33lFPD2M=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(36840700001)(46966006)(4744005)(4326008)(82310400003)(1076003)(83380400001)(36906005)(8676002)(26005)(9786002)(47076005)(6666004)(336012)(8936002)(107886003)(44832011)(2616005)(54906003)(426003)(316002)(82740400003)(356005)(36756003)(7636003)(2906002)(478600001)(5660300002)(70206006)(36860700001)(70586007)(7696005)(6916009)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 06:59:41.4344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d310938-8ae8-43dc-596a-08d96215c0a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4919
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix a memory leak of mux.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clk-mux-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/clk-mux-zynqmp.c b/drivers/clk/zynqmp/clk-mux-zynqmp.c
index 157d4a960bf4..17afce594f28 100644
--- a/drivers/clk/zynqmp/clk-mux-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-mux-zynqmp.c
@@ -159,7 +159,7 @@ struct clk_hw *zynqmp_clk_register_mux(const char *name, u32 clk_id,
 	hw = &mux->hw;
 	ret = clk_hw_register(NULL, hw);
 	if (ret) {
-		kfree(hw);
+		kfree(mux);
 		hw = ERR_PTR(ret);
 	}
 
-- 
2.17.1

