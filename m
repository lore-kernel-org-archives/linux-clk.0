Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CB3C433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D63A64F67
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236461AbhBDNzl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:55:41 -0500
Received: from mail-dm6nam12on2045.outbound.protection.outlook.com ([40.107.243.45]:50017
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236464AbhBDNzP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 08:55:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL3EL34O8kLXpt28c6l5559jHYO3uqzwhMBjr43w72Vzb4iry0oZIvepbJGe2sAhJJWZTCq2y46/heJhxrNPKEueA+TRyYwA+NWzhb9+Gbt3QuXpsWFe0p7ElTZadKuQADV+Nr45L31l68gYxwPCH5ANagmykcadqT6ITNLTXFoa2jml2V70nSVkalT1k1LqgvU/HSdHL2wzzQ81lO4TBwuJK5q1GO9Wp2q/Oxp8KVcfLz9JSE6UqQBc3QxGH8p+Ld+094hg+/cRcN8rDc73/YaAAZ0k4aOg7mKzOjUwncOYiuF72GJMHskZdLgSHAUqBbT/GTU4jVy/EJqf0wqLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPH057RPQDtOERkZ9ejyiEgSRGlW6mFd0WO963lWKw=;
 b=bJOEu52t6/v8HCma5J2OKKhiTMl6RkBK3z0wl0jcASSJp3X74JoH6vAoR8nNjrOB1xP8Cxn/P/h012IB4p2RTU0UzzczGiSTaaqUsb7UGAoWazKDrF0WSb2lTYKMFuWvsZ79MDBak8WVQyTVLI9GpPilaHR3xETIhDAmH+RvGSJQnmBMj9nclCk5G1bK8oDNiKcGOkDqqM7GopQPkJEVakVC34dDjodnwKCSWpKZHTpRraU16qmX2tSPLfFbRfsY/i2Fu8StwaJT9p0CbcJ4CvyeeY2ein/Ul8tCqz9sRSyquP+PVFkktKGYzrjYzGt+iUTx9zNeDaU6h9ObMpxv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPPH057RPQDtOERkZ9ejyiEgSRGlW6mFd0WO963lWKw=;
 b=IEDH0WVux1eW8G0x3BhzQZWMWPvGBpL9p5QLBWzp6CPpHXSLceG5xhrL95XcASjWHtprZ2vt8a51/KIfy67hIXTWrGydfazzcaDxE0MOLaNjaY0qZv1ohMZg6iCSAeLb879blJkdSF+q2GjC5NQEMSPWZPj/Q2ihm4I3BtmCJEw=
Received: from MN2PR18CA0027.namprd18.prod.outlook.com (2603:10b6:208:23c::32)
 by CY4PR02MB2806.namprd02.prod.outlook.com (2603:10b6:903:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 13:54:21 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23c:cafe::d9) by MN2PR18CA0027.outlook.office365.com
 (2603:10b6:208:23c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Thu, 4 Feb 2021 13:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 4 Feb 2021 13:54:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 05:53:52 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 05:53:52 -0800
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
        id 1l7f4x-0000Tm-0R; Thu, 04 Feb 2021 05:53:51 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git-dev@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v8 6/7] clk: clock-wizard: Remove the hardcoding of the clock outputs
Date:   Thu, 4 Feb 2021 19:23:29 +0530
Message-ID: <1612446810-6113-7-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa24f7f1-1558-4699-2dd7-08d8c9145f5b
X-MS-TrafficTypeDiagnostic: CY4PR02MB2806:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2806F805512DB96D37AD8DCEAAB39@CY4PR02MB2806.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWkNPaRlz+SnwPGusRyMFiKniL1uPu92kQoRkH8UpgaJhniGR63VsJaoVCqUIMPBiCd7jnS+TbORHOQ6+N3fw7Ne0UGUg3ptSVchLvpCkUpemm1kv/1lTx+dF42ZyOwlXmyeb7LNxiPf+stMWrpaSHDxE1sSapuo6l/rRPtbmQ06PS39YTO2VGw3mhbDauTEAv9xsRFcpcVsSqscOU2y7v3Vo3PAE9UX4obaZuZeuLBzUXj2F73Y9UrTvC1rVX3WfBnQqfvwc31566lKJcgFCavFiozec3vL0p4tRHKgo7v7XVkhLgNoMW/X7cnj+xzL+sZ0IP/vKKzLPM9LTldRpA0WkrP+3DGZUVuPy3a2ONcHQNPE4Tu3MNHQJmJrSyMZJZyywkVSvqyMZyQ7GOISkH471FJ0lgNU5f91tPS6ruhv6j2biP8BaGz/vV66LAHHsV4o8au8ywEBjYx3hmwUt52F2fDootdlt9DsH/0LSdeb6/oex+63KR6JE5GNdlRB7DaPaIqt2oe+LOw46TEaIu+8iJ126G94M5izstXN7mpp939TW9M9lUBmtFqRYjOfulAWnBDxBk5nyrlZBshD/e0elZhzXMMgBCCrpTEYCITags9b8AOJ1K6Yw734CORIaklmluuVJc1vrbtQjFKDXF/khGr7FYIJpfQxtDer4aoLKP/U/RqH4yB5nmplPSQe
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(46966006)(36840700001)(6666004)(336012)(82740400003)(47076005)(426003)(5660300002)(82310400003)(70206006)(70586007)(44832011)(7636003)(478600001)(7696005)(186003)(107886003)(6636002)(36906005)(8676002)(54906003)(110136005)(4326008)(26005)(316002)(36860700001)(2616005)(83380400001)(2906002)(36756003)(9786002)(356005)(8936002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:54:20.7845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa24f7f1-1558-4699-2dd7-08d8c9145f5b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2806
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

