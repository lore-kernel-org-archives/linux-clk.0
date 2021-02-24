Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69326C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1238564EF1
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbhBXOdG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:33:06 -0500
Received: from mail-mw2nam10on2059.outbound.protection.outlook.com ([40.107.94.59]:25140
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236068AbhBXNN0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Feb 2021 08:13:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El9JogSmC5pP2aZ002WMDR4Z64g53pAMzx3vh36DppmhpLOqii8cWcdrZfI2uDEARdedC68ao+tkGkSHfBHoMI/whwMpFF5folLjlupWNSo5y685w7TahhANWHAtuLFFT7xCWMjl2Xm4Tyjlk+0ht48M57o8LoWSzeMg+C0ls/3OCwx5wMq2QMbTw/d12sWpNZu7uvNEkMmYMTItfC3AwCsCsA+GCs5NOVbtmL/CPDNDJlIS1zZrNj2U4p9qoEfMoj0ifIq8IV1Teq6Cpu9qqUg/qceNJBKZBE93WSxM+r3jNAHozvFTBJxWED6OszNUnrKgLg60+TJQfcRLZGx3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auiuu1OCZDbzXBKbZONr0sRhXxitYJBjxX3EoQi4Mys=;
 b=bsgi6yR74LRiEENaIe6EMuNNnFGGWb1laMmsoo5wRmk+GfHHhDd0EWRNXlPOXELt0ltJE5oD0FybJ1uBKwn8R/MMxI7zxQiTp7Hq/h4V9ZZ2WL8wO6h5c16YPfVn5efHYPdQMAGYl4vg8Y2NLMhlVGlQXGFIqyAjoqwwEIWxZAl5TqU/4bXby3SkBDMq+R0ILojkGD3mnopQS8k2ckD74HWs48AmElY4XILqJoPsPf0KUxMUA+oedeijqbLL17P6hJOau0+2Un5ZGkLtpA/wb8lM1fbkshssC9TNTuq5IhZmbp4/7zEGld0eorEFCAhOVodxZiu/mZsMy+hXm+7JYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auiuu1OCZDbzXBKbZONr0sRhXxitYJBjxX3EoQi4Mys=;
 b=oVLzr0oHwyI/UCIa/5K478GAgTbfVVHFmZbuDygdZrQso4gZb5zQgUd2ttQVn6CLtYTbAMve3iWVgVt2O+EXSUbYgD6Fq2iNHzJ+seXLnCrgENMntIEb8k0wPXoHTDohSSPSx0+5UtgzgkuYU5QSYk2DY6BFaIGCGx/vuysSEf8=
Received: from CY4PR14CA0044.namprd14.prod.outlook.com (2603:10b6:903:101::30)
 by SJ0PR02MB7616.namprd02.prod.outlook.com (2603:10b6:a03:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Wed, 24 Feb
 2021 13:11:32 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:101:cafe::1d) by CY4PR14CA0044.outlook.office365.com
 (2603:10b6:903:101::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 24 Feb 2021 13:11:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 13:11:31 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 24 Feb 2021 05:11:02 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 24 Feb 2021 05:11:02 -0800
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
        id 1lEtwS-0001ry-CP; Wed, 24 Feb 2021 05:11:00 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>
CC:     <linux-clk@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>, <miquel.raynal@bootlin.com>,
        <devel@driverdev.osuosl.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v10 4/9] staging: clocking-wizard: Allow changing of parent rate for single output
Date:   Wed, 24 Feb 2021 18:40:36 +0530
Message-ID: <1614172241-17326-5-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1614172241-17326-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b9644b-3c31-4cae-ed74-08d8d8c5b46c
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7616:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7616B5262486A9949753E0E3AA9F9@SJ0PR02MB7616.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jyUJ3OMhi28k05v5mBGyI1e5Ca8xktrfMxZTH8JpJdg1im0xiJhbq9tfdQeil4um55mavnCaFul4tuSjM7jlG1xhce785xinRyyaRluPVK50m2kLi92dlOW9RkSLw4G0/DNBHP2i2rhoTjq4b6T8aPtvtJ5g5tfFUv56IxXbuQAsszYhRb/Hiot8JzuM9CYgToGO7RQujLuwrtnEt3ca/Z0famTP8AFbbaeTGUekZCjg8gdUE7CQQ61djufOytaqX0OFnpm68I5QA7/BlL3U8ogiyVzj+12FL6Ug8u02+dBYWY/arfr+7tQadxA6lYxp1V+JBnufnoFLK0wQHPt3WYooLfWBH5WOHw2b+zFB1fi8S3bBXF/nZaZ0BJLbQIbxBjSfp4ks8/KsQ7xYs4k/V3e9bCSDMlaHF+M5KEEHQdzNwSX5OYbMEtSjZYvWVgBNR+GxibOmO3BLMAjWipkutS/vABUAvkFvlZ3Zg/LXTc10bP++Ak9EHn9Us8JcYVzDmwdrm8hd8pNJw/zI/FiSGlZhlVKoA99U/d5x1vBNfcX2nNdGigPKDC1jeOnCk71Ihf+PUuw1Qvx4NYGrvGIdVkDlR5xD8JjfdRFpI8Qbys1PNrn4v2gHhc4ivUliJ1F8xl71yqL88O0fK+2UY5l8EL8UbnMJppdmu/Nnz6ds+o5GmeG+0/8+X/rXiNZN+pys
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(36840700001)(8936002)(8676002)(44832011)(9786002)(54906003)(2616005)(82740400003)(7696005)(6916009)(36906005)(36860700001)(316002)(36756003)(186003)(26005)(336012)(2906002)(356005)(47076005)(478600001)(7636003)(107886003)(426003)(70206006)(6666004)(83380400001)(82310400003)(4326008)(5660300002)(70586007)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 13:11:31.9439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b9644b-3c31-4cae-ed74-08d8d8c5b46c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7616
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If there is only one output then allow changing of the parent rate.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
index 9cc2f6d..e08fc2f 100644
--- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
+++ b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
@@ -138,6 +138,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
 	struct device_node *np = pdev->dev.of_node;
+	int nr_outputs;
 	unsigned long flags = 0;
 
 	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
@@ -201,6 +202,14 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	ret = of_property_read_u32(np, "nr-outputs", &nr_outputs);
+	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+	if (nr_outputs == 1)
+		flags = CLK_SET_RATE_PARENT;
+
 	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clk_in1),
-- 
2.1.1

