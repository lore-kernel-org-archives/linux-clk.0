Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B149C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F25864ED6
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234044AbhBXOdf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:33:35 -0500
Received: from mail-bn8nam12on2063.outbound.protection.outlook.com ([40.107.237.63]:62196
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236061AbhBXNN1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Feb 2021 08:13:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6PUqDjcaHVN1laZ50bzrZIFWUBjSvhlKVPLiVsMsnz3Wy+xF6arAIEf2xpLSl5m3lKyhwcatG7pGtlA6qGJETjVfXfB0D64qAWfsmpdY7a8rtg9xHeoJkAdZ1VyJ4JeH+ovk7PPmSwJkeBR3ozIq65cnhsbZLV33H1XnwfxBrEdhV9rqImfIppkFwrS0fJ+mlWuVwG+DSONHQQ9qPJlLncEvjdafeaFrh26nnQjhrophsEgl+Wr9n46CqAiZeiEhLqfOfDiemCEADmKBzVpo5gGrn+Gx1HBB7yNvhTn8mjXXo6yWE/yDZn2o4vOW3dOolYnzRftmUB8ribUFon1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHmNfHn56j1s7TQ3FzKChWXStJv6QD0KoFt1b6NJJAI=;
 b=J63mse+dW64jBl7OnBUpKspce7RkGd13vD+7++ghqZovGw6huMIdecfcY9UBEfV9W/dt505nyhsICNKgtxNn2AH703x7jyJAe2f9cmgZ76rv+JbIH81by4THVbnd7CMZqgE7gMVXbF+NarOhOiPtih2+KD3KLqAAYdXRvHPKbNmweOHpWbVyAohRyjiA7yWWjOfz1H+8swJ10qgCMJgOVVPZa0aF8o36rjwElgBXJDYHsWGJtL+1kTROiAUIKCF3V6nG1t7MqwLViU5hyaLMFkvxTiIQEpxamcbwrxFQ6gNPU1aJ3lbr7ICsDjwfFrnkr5tcDPIRVvXL+vlmL5sTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHmNfHn56j1s7TQ3FzKChWXStJv6QD0KoFt1b6NJJAI=;
 b=Rn7rXc49HZCU/FmtCa7gH24Funf7+xMYB/nk7PQnVgL61CNlwWEEBHTTgiAau/KA8tFtLKBah+kSCpDfUhmNNqYxD1+hBHyDbXcCdo6qswf5mk+ByI1x1ddxnfb2yuJgLLMm7lZOnACgnb5fDal7o4/cJ2sns1U8pbWfbecg/MA=
Received: from DM3PR12CA0053.namprd12.prod.outlook.com (2603:10b6:0:56::21) by
 DM6PR02MB6444.namprd02.prod.outlook.com (2603:10b6:5:158::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.33; Wed, 24 Feb 2021 13:11:27 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::ef) by DM3PR12CA0053.outlook.office365.com
 (2603:10b6:0:56::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 24 Feb 2021 13:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 13:11:27 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 24 Feb 2021 05:10:58 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 24 Feb 2021 05:10:58 -0800
Envelope-to: git@xilinx.com,
 devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,
 gregkh@linuxfoundation.org,
 robh+dt@kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com,
 devel@driverdev.osuosl.org
Received: from [10.140.6.59] (port=34848 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lEtwO-0001ry-U5; Wed, 24 Feb 2021 05:10:57 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>, <miquel.raynal@bootlin.com>,
        <devel@driverdev.osuosl.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v10 3/9] staging: clocking-wizard: Update the fixed factor divisors
Date:   Wed, 24 Feb 2021 18:40:35 +0530
Message-ID: <1614172241-17326-4-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79ebc034-dcfe-4fee-bc9c-08d8d8c5b199
X-MS-TrafficTypeDiagnostic: DM6PR02MB6444:
X-Microsoft-Antispam-PRVS: <DM6PR02MB64443F2F92D724A476CDC52BAA9F9@DM6PR02MB6444.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+VihExNE3bbnswVvIpX6gr3KCvY9Pgg1C0Ad7ZvQXLrnn6P0B7gxSJc3FyjPRTB2aRoVoGlo/KCMYRyCa21HfiF9JSlF6m1Rbk8P524GgU9igvumQxmhZntKpLo80Cwvv7+QKpVcbxxbTdXVh8/G6/Sr3bRvX0Xb0/0HkrAfCCWh74zifPbl5U6iguANjNm9cyV4wtWV0YHrg3t6h35r2N8L54NMaV3Xg1Ba1EJ1DGOOrq1N/LNZo62mmnXFW/UJkegbAKW+pPG+su3yfjnqYqSKD/4ntRJbzyaY3Xlrl/KjVZSlLWECUok4eahlqh4qnDjkiweM1jegEYZNVIJqPxwwJSI20dGHgcEdXYjBVI53RhfnM/+GE3yIXFkMg4XzlTU14l8wiasQGJABDsdF6E22SsNrtBLzZEolLAF803mxFjqzxJhWrqWy49O0yV6YZbSSOlNJOYNhh7pSRwHxOcooUIhc/KESmohOOAEbXKxtpAZ8owe2ImTwXQLHO7W1LWO1TJBxifG/GFjger7fcFqELQJYTXjWPiZ/kdKiAfrVWdk5CE13HLhuIPP8LfjNg5glBjnG+FEYnOBONoB4AILJHmu/f0H+dasplpEA1eXvxy04AhTU4QoVtDyCZioO7S6SsPnguwTPhaxHV05J4rq066cAftJ4yYKBH1QR+xxoq+6riG9mz76nVzfjghL
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(44832011)(82310400003)(83380400001)(2616005)(7636003)(107886003)(47076005)(54906003)(4326008)(36860700001)(5660300002)(336012)(15650500001)(316002)(82740400003)(8676002)(2906002)(186003)(36756003)(6666004)(356005)(478600001)(6916009)(26005)(426003)(8936002)(9786002)(70206006)(7696005)(70586007)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 13:11:27.2054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ebc034-dcfe-4fee-bc9c-08d8d8c5b199
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6444
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the fixed factor clock registration to register the divisors.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
index 57f80ba..9cc2f6d 100644
--- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
+++ b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
@@ -135,8 +135,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	u32 reg;
 	unsigned long rate;
 	const char *clk_name;
+	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
 	struct device_node *np = pdev->dev.of_node;
+	unsigned long flags = 0;
 
 	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
 	if (!clk_wzrd)
@@ -198,6 +200,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto err_disable_clk;
 	}
+
 	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clk_in1),
@@ -209,19 +212,19 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	/* register div */
-	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
-			WZRD_DIVCLK_DIVIDE_MASK) >> WZRD_DIVCLK_DIVIDE_SHIFT;
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
-			 0, 1, reg);
+			flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
+			CLK_DIVIDER_ALLOW_ZERO, &clkwzrd_lock);
 	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
 		dev_err(&pdev->dev, "unable to register divider clock\n");
 		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
-- 
2.1.1

