Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E5EC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 07:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235224AbiEJHgU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 03:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238179AbiEJHGD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 03:06:03 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B80D5B8B1
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 00:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch85xuUPycvPZZTBoPGRcb8nSJiD0F/IjepDZnY9NkKmRComSfbD6ErtQsyD0+QIFxtifl5xqNgl25hfOIGEi5hfGlS2SeKnLJ3YwNsymFl2oxa+68nz+Dgr193bjHcQOsUvaq/ClayyqkUgH0R13pwdy1rikf6WDwO1SA6Ycp7RlXRcMHPAJk31DyFVL6yQMsrr9v30oICqNSHGgukMgBCuIO7FOicbIyzZ3+JGBUYFN3jkb/m2MzxkQ1aPRG9zRQiBf7rl20PVWyTuvW8OAjY5JgTjyTGWaJ4bEnpDO4aOhMrs7eQSz5W+OJNVK8i0WK2nqrrIsWA9Vzk1UkeFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHMFKV20UJ5J2GT8fXElGVpjuoM5YDfQA4HCEROpTmk=;
 b=PyF9M0zlnziPbqkHb42MDZsxXe4azrN+ckEY6Ehr8VcDwBtiiKr8u6uhxOHYxxh0NeLWK9b7H5o+pa/w+onRGzoTf58wFpGQ4Meba/etPrAeYCjhYMbJckJhtvu/85aEXONv9yTtzJWNEQVr4nABL8QCp0bWz18nprm1lxa5rp8y25g2bzMzs//uwbsZluzvptFKTsTiPAtF9GD8ImUOOVP4xPAkc284wXH40d+dOk/yM5W/O1F9oWqSrHXEFazXlpUDBbrbuEDQnZGx8A7jHpG9jY4FjqcQD3H/w0kFvOO1eu0P6CZ5yow++oUXExgb2v7FtxWSzFeYs0qioWVaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHMFKV20UJ5J2GT8fXElGVpjuoM5YDfQA4HCEROpTmk=;
 b=O/juhfFYNOkgDRBLCnukjngcWBRmn/PuFMpNTxLBqtnE4FYK/La5xrUPypNd8L/TiSoPzQj6748ME+MATvgACtB8fqhZHuIYwWUqXmudHSDp5axqfpnIHQfZsbgGdZ4dP7fvW5MF6X/Q8ZqT8wdqnztoT7vJQ4EjG4cBqjJof18=
Received: from DM6PR07CA0074.namprd07.prod.outlook.com (2603:10b6:5:337::7) by
 DM8PR02MB8296.namprd02.prod.outlook.com (2603:10b6:8:7::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Tue, 10 May 2022 07:02:04 +0000
Received: from DM3NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::ba) by DM6PR07CA0074.outlook.office365.com
 (2603:10b6:5:337::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25 via Frontend
 Transport; Tue, 10 May 2022 07:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT054.mail.protection.outlook.com (10.13.5.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 07:02:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 10 May 2022 00:02:01 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 10 May 2022 00:02:01 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=57472 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1noJse-00083z-Fp; Tue, 10 May 2022 00:02:00 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/2] clk: zynqmp: Replaced strncpy() with strscpy()
Date:   Tue, 10 May 2022 12:31:53 +0530
Message-ID: <20220510070154.29528-2-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com>
References: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f9c9013-3dd3-4475-f86f-08da3252fd10
X-MS-TrafficTypeDiagnostic: DM8PR02MB8296:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB829696D6DB8EDEC10C847AADAAC99@DM8PR02MB8296.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qo+YujzoOcuZUl0ZkCv7+uolIvkEKdcXROr1zBcNZyfigOOP9Ilh1fouJHL73WNB6QJSUW+Q8wBq4M6FrrmViqjpFBL3knIBTBNdIl7L92wqHi0zQvJvggBECzILyVk0S0eP6ffMxZbjjCufCnEB0yziKFdXVDBePKNp9NfxN7SU8GhRuhBkyHboztlaAkJx6hvj9+O7/ejEwNyefZumcta2IuVsR/1viXaofpIKDQOtN0SMXP/tAyM/zQ7CmS64dzfpbSbfQS2k7whv6q15GlflqnYWUg4wUxJ5OGQAm1789jFjSpBFcPY+TEz/WpvShyRrXAQCjBZs+a4RCmUyvGDaz38HcX5kdtcok2fe5QEVc6rizcvzW0SFXomQ9HdZHtbTmCwv981tle2iFxQ2p+YyZTsry1W2BVpKK43TaBy7A+mKn7r9aEkV3ocekkSyAut/m23cwQs75cJRyrGmk4fjxRaWoSrMJM+r5tFRY6NE+PMvPt+/OOG18cNKfRgHOXkI4N0Q09PPRbFZ9JN2KuthqgsOu4u73dAw6lbunJxVJDfxmxlP8CRBeOQ/vkpu8t5xWbyVCIfXZ5IT6AwT8kc0yXMTuSJZxGPnKXzgRjEv43BH1FtsOZ2I6of6csu1Huv5mLAmRHyvovCAIOjP7+p6GT+ZTsjO4H51zz3NzSpdR+DhE0WTU3zwTFdOKdCcEUv1xfe2iECemy5JJG5J8w==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2616005)(107886003)(36860700001)(40460700003)(26005)(4326008)(82310400005)(8676002)(36756003)(6916009)(336012)(426003)(47076005)(186003)(1076003)(70586007)(316002)(70206006)(54906003)(6666004)(2906002)(5660300002)(508600001)(9786002)(7696005)(8936002)(7636003)(356005)(83380400001)(44832011)(4744005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 07:02:03.9863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9c9013-3dd3-4475-f86f-08da3252fd10
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8296
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replaced strncpy() with strscpy() as the clock names are supposed to
be NULL terminated.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 6770dbf55cf8..3d406d2f0a35 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -163,7 +163,7 @@ static int zynqmp_get_clock_name(u32 clk_id, char *clk_name)
 
 	ret = zynqmp_is_valid_clock(clk_id);
 	if (ret == 1) {
-		strncpy(clk_name, clock[clk_id].clk_name, MAX_NAME_LEN);
+		strscpy(clk_name, clock[clk_id].clk_name, MAX_NAME_LEN);
 		return 0;
 	}
 
@@ -713,7 +713,7 @@ static void zynqmp_get_clock_info(void)
 		zynqmp_pm_clock_get_name(clock[i].clk_id, &name);
 		if (!strcmp(name.name, RESERVED_CLK_NAME))
 			continue;
-		strncpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
+		strscpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
 	}
 
 	/* Get topology of all clock */
-- 
2.17.1

