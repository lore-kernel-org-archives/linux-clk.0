Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFD5C433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95DC664F5E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhBDNzv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:55:51 -0500
Received: from mail-bn7nam10on2045.outbound.protection.outlook.com ([40.107.92.45]:8281
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236466AbhBDNzQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 08:55:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFFglIU3ME2zZQSBGu4AdQtlwH6s+fDF8ONgGrZ4gi9wJxxtQmVC2c0p1jsT1gcd41HnaW1ETfPDuiZNs7QQsqR2Jj3B7eVgc1681BgYV0I5Z/gsnjzuc+z3P2sOgE+Fql7q8dsTTBLKZMjdaWf+87bGrjnjZk5jhGWprcHlQKGyyxQxLnIyiosZhqkPKxn564dOlB5qcptz6fk4Etb0SrmsuiEFkpxPtr0aZ+YAbz+A7WTkXJXLn38v9OXIcKpc9TC0yv85j9B028nRiiQP1U/2Zx8t/CqGXZcdFF/2jdDfWIUR8hyFYJ6jKiMIRaZPHxShpecNfxzt1BRgdNyePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roEj9Agv1RYOmPCtk4VocZviSZy/fkIAobJzO2mZ+s4=;
 b=UlLAtuW8+4ZsBmEZzN9G5ofbJscUeVBdMFAGCTIaksa8si4/QvbV9h0cyKpxgodtTlmrnJKXHyQU7HrV0ZAZeD+bFejv5tZoiPDxsQP/UlcdEgU1yEDhyYN+YIHqAIa3VtnGr2dsSUemtrPLOZrqfAMeAH22JNzdtrGD7rZVOtZ+ulNPlWwzZzy53CCMmFaZDby5NT5hGXNaSrcZ5m2nC4JaMzYlyrxITu5wN5cWFLBBmsx5YGa7+KTdEHrcb5Fdi91R3vZqm9quK/vv6NCGqYekf8xuMjUNSCWdHNtm+WGBnV1F2E3EoqzIB3zD7YjqmZEWTZQetVCGzk1+WawQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roEj9Agv1RYOmPCtk4VocZviSZy/fkIAobJzO2mZ+s4=;
 b=OC442GnMot0RprLN1Kt72APKa7pCZfdhCqOaTelVTeRtUctxlfoQFaBDJX31NIHMMAgQH4jp3zApFfrYkT58drN/tPsKVWWJxbUaNJf3b6ox5ztmi040A+vt4w1Bd0p8vFNW5BX2NQS5dMaewYA9x6wH2GNr259zHeCyATfNKLo=
Received: from MN2PR16CA0053.namprd16.prod.outlook.com (2603:10b6:208:234::22)
 by MW4PR02MB7202.namprd02.prod.outlook.com (2603:10b6:303:7b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Thu, 4 Feb
 2021 13:54:21 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:234:cafe::e2) by MN2PR16CA0053.outlook.office365.com
 (2603:10b6:208:234::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Thu, 4 Feb 2021 13:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 4 Feb 2021 13:54:21 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 05:53:55 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 05:53:55 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.140.6.59] (port=57876 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1l7f4z-0000Tm-TK; Thu, 04 Feb 2021 05:53:54 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git-dev@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v8 7/7] clk: clock-wizard: Update the fixed factor divisors
Date:   Thu, 4 Feb 2021 19:23:30 +0530
Message-ID: <1612446810-6113-8-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a63476d-0e31-4e6c-3491-08d8c9145f8c
X-MS-TrafficTypeDiagnostic: MW4PR02MB7202:
X-Microsoft-Antispam-PRVS: <MW4PR02MB7202150A7DA53E19F380E66EAAB39@MW4PR02MB7202.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ziuZJZ46NGBsz0ItYXtyX6RcCCD/aLTo2nMf/uZ/t5i2k9LJSH+qRaIiWYONVTgWyzAAuEZ/GN0k4AqxhBbqphZkhIatUeAlZgv2T9+m+lmkfOIk2MaXVv5A8mAyhQFywfPXj6ecdTNXc9Zt+SuDCMoe4v0/NuVczAH+Ab+fcHd3wZnHvSq4228sVpEek88WK34lz0xKeVT60AVhwcFHQ8lu079gtpwbMZJW2Y2IMWfRSETbzmpZUImGeKX9gan6cI7pUxAWZXeUXpJEpLu/riRbVBlob+t6/LvUptvTUU3RaGR8kX1M8d5AJknxN2yDk+WEEL7NbxQeJ3+en0aJ0AdQWD+N7JtvJFNub5w+82wJCZENWDKLVetfLOv7cP9iJ8jcSjJ2SOSxhCz5qIkxZ3uFeCww0BHLnYbMxQekcJycXzOCzdgyTGjMVf9ACa1dHaeiRzAxQttIXn1BUr9dreRpfg78GxyMb192EccpDARfC0ZV+6wO7pT8UX2pgA8a9I7vqPKqZSDxQvvxyvH5nVG/iPKo/XBOw1KGZHsDg2mLLgKsMH+c9gGmnhLz92ZLFsl7pb4djhFIc7iszI05OfqHbjrm/+naCzwxZPFT4oS3NAul3r6cYVVrczqlPwoP7E322oGPDLVP2plO9kM1lyb9uZ9GEBXP1xkgKT9+gb1eMUz/DXYyaU3r3JIJKoaw
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(36840700001)(46966006)(110136005)(36860700001)(54906003)(8936002)(36756003)(316002)(36906005)(6636002)(4326008)(7636003)(356005)(47076005)(83380400001)(2906002)(6666004)(26005)(8676002)(336012)(82310400003)(426003)(15650500001)(82740400003)(70586007)(70206006)(7696005)(44832011)(478600001)(9786002)(107886003)(5660300002)(186003)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:54:21.1058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a63476d-0e31-4e6c-3491-08d8c9145f8c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7202
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the fixed factor clock registration to register the divisors.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/clk-xlnx-clock-wizard.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index d403a74..7f09522 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -472,8 +472,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	u32 reg, reg_f, mult;
 	unsigned long rate;
 	const char *clk_name;
+	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
 	int outputs;
+	unsigned long flags = 0;
 	struct device_node *np = pdev->dev.of_node;
 
 	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
@@ -543,16 +545,17 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	}
 
 	outputs = of_property_count_strings(np, "clock-output-names");
-	/* register div */
-	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
-			WZRD_DIVCLK_DIVIDE_MASK) >> WZRD_DIVCLK_DIVIDE_SHIFT;
+	if (outputs == 1)
+		flags = CLK_SET_RATE_PARENT;
 	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
 	if (!clk_name) {
 		ret = -ENOMEM;
 		goto err_rm_int_clk;
 	}
 
-	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_fixed_factor
+	ctrl_reg = clk_wzrd->base + WZRD_CLK_CFG_REG(0);
+	/* register div */
+	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_divider
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
 			flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
@@ -577,7 +580,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		if (!i)
 			clk_wzrd->clkout[i] = clk_wzrd_register_divf
 				(&pdev->dev, clkout_name,
-				clk_name, 0,
+				clk_name, flags,
 				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
-- 
2.1.1

