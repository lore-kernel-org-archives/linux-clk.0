Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2D4C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D7D56056C
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhHJH0o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 03:26:44 -0400
Received: from mail-bn8nam08on2059.outbound.protection.outlook.com ([40.107.100.59]:30318
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232851AbhHJH0i (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Aug 2021 03:26:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjtLZoCOf8GOHuoigmsUO1Gay1uWbZ4YyzKR26LQDSO2+bibRzGI6pRt8ISePbRUNdsCuxyfD+ldgtcG/C8MRjondxUYeL0rFm2PCtNksNKIs+eivSITFM1M0mzGr0r5/lhwE596Xexk3pxyRpZY/viuM7MdjJ5pkaKJn+JnZ6yWC1HwiquzSxH+EXjY1ae7lMmrRLr2zUTGwLh3VGrZkQ8y05vGwWoKrRXH8CVuDaStlQ3KVA5xpHMEKon8pCj96ZJk96NT2BY5XvR1fGfCb8UvmLf4w1e7+mhloyIZW+JMNy/Seyr1FQabh8UzBKeSXcWAAU6Tg6iElTo8l0KZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpXTjhb7XW9HKA33NAVueOtbzRSIAM+7Bv+PtxEvl5k=;
 b=SbrTvb0y0avKL/GMxHQCQOV2e+hQxETp7M8h8sRoMPPZRuk8ZRGJyUTytVARlzdMfLlmntvwlfBk5Vx5304gY1MKwX+PzrUMxA6SfG1V9Fr4R8lgcp0RZxHj0NzfvCBWtbF6dV7Ui7+ZgtyuVblV3qvpKBGgqJ24r+rm586sNurOnmc9erXtzowM2S1HjQdjuqYkG9cKc5yiYY+jvb57OFmi1BCgaXcsB6+pLip+HuBQKEbeSiPT22umNtwEL1g9wLJuDge3GogIVeKrhcdfz9nCe9elvocLfidWROMOFZnr/LHuHGSjIv7/4k8ov8Epck0DzlikiOnGyILu48y02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpXTjhb7XW9HKA33NAVueOtbzRSIAM+7Bv+PtxEvl5k=;
 b=bElz1J+8ieclX+6CvQPxYvTlx1DigMMjUCqsHkkl/mfjPxZOuYvI8x6OOOoMsj0rYyQxLhUTAJpCoDyfZU7SPXNLGsNowzK5UUyPcArEmwv3Lyesa0kBEFdcnIfU0E0pR3BkcyWODiuvnULjBj4vogvU3PSfmcnytvprGl4kzmQ=
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by CY4PR02MB2534.namprd02.prod.outlook.com (2603:10b6:903:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Tue, 10 Aug
 2021 07:26:13 +0000
Received: from BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::b5) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.4 via Frontend
 Transport; Tue, 10 Aug 2021 07:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT042.mail.protection.outlook.com (10.13.2.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 07:26:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 00:25:50 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 10 Aug 2021 00:25:50 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=48216 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mDM8y-0005zG-NW; Tue, 10 Aug 2021 00:25:49 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v12 5/5] clk: clocking-wizard: Update the compatible
Date:   Tue, 10 Aug 2021 12:55:33 +0530
Message-ID: <20210810072533.27620-6-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28b3f900-e145-4a64-5ac1-08d95bd02211
X-MS-TrafficTypeDiagnostic: CY4PR02MB2534:
X-Microsoft-Antispam-PRVS: <CY4PR02MB25347B1A77D607BEC4D63D77AAF79@CY4PR02MB2534.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ezzYnUDnS7M8MesqYr4yLiV9JZ+Ha1eD2+zI/uB6q7D5kmvxj/5y2RRFWm8wX3Zsg9beoOtX8L0JjiuqcOxAZLrkWsLiKT33nRjSzACZPGLh0u0jkfBiNM5OHLt6B50KWDBRPa2v+7lPLjWkwNBAZ/DeYXyiwzWglikV21wgTKxEmLHH5ufyodBfPZB8proh5QokG1vhVRxQB46Fp+0UUW3zGHBRl3IW3Pgl8hwJWcZcPA8rBLsUeK5FwPzivprQsQB+yAWxc+o9cTq7oR18+TuCDA9h/SvQuybsT0oiZ/r1c11TqprTph9rz6FCG+wcMaLv9Ule1t6Cqa/ZGoeGp1lC5ogRgrw2eAc1Cho6BWZ7nrwIOqfeOhCbvzQ6NvbFg+BRq0fzl133i/AZqwzZ6/dbdIeP6vkCopN9Iow1JhAT3zprB53DVyqazKHRnZBCfIKSrMjG4dMlTNZIDY3bW40uCP0GC/V4KrRr8pU1Ursr1FKGLw3FoEYnICaBxZ+AtPexc8IorDVOtHLGPDR0hqlGsOm7173ev8MYrq/0j9+7E4XiHB2mGS/N/nX3XmFKNIn0yiwZ9NuPtFz0rujqJSOVv6DS+ZTTiI+EKUni2POYX1PEkSzxlMR3svdsrraksJDi5XHaqIbiv9Fx5YqBJaXGQc+s67W1irGlilNmP9TjUfBLekz9DyM6d4RgAzDf5LuK6n3UC/rRUbzw6fInfkrhtrZU7Cj8cVQRKhu3cr4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(36906005)(316002)(36756003)(110136005)(8936002)(9786002)(478600001)(8676002)(82740400003)(70586007)(83380400001)(54906003)(6666004)(426003)(4744005)(186003)(4326008)(82310400003)(2906002)(7636003)(7696005)(47076005)(6636002)(70206006)(356005)(15650500001)(5660300002)(44832011)(336012)(26005)(1076003)(2616005)(36860700001)(107886003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:26:13.1204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b3f900-e145-4a64-5ac1-08d95bd02211
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2534
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the compatible to indicate support for both 5.2 and 6.0

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v11:
new patch
v12:
No change

 drivers/clk/clk-xlnx-clock-wizard.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 61c40e06e381..716fea83341a 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -621,6 +621,8 @@ static int clk_wzrd_remove(struct platform_device *pdev)
 
 static const struct of_device_id clk_wzrd_ids[] = {
 	{ .compatible = "xlnx,clocking-wizard" },
+	{ .compatible = "xlnx,clocking-wizard-v5-2" },
+	{ .compatible = "xlnx,clocking-wizard-v6-0" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
-- 
2.17.1

