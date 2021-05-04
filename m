Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A07C433ED
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 10:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0008E613BE
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 10:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhEDKJQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 06:09:16 -0400
Received: from mail-bn7nam10on2083.outbound.protection.outlook.com ([40.107.92.83]:48609
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230092AbhEDKJQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 May 2021 06:09:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPTg1/XxIyFbK/cWEU8r8cpX/qqZ8ZyZ16z6f7ON6YjbqfayetHqZBiM9HHuvC4rgs6C3DtsYOFLAYXxCMeiwW9D26Cdf8FinLiJO37K7eYjubUKD7uSaMzed3Da4oduD/oxhW6kwG+Uegjn0MpSN5FvUL3o76ipOZAUaVYq57YkUR6Ke1IaaBkCvYDdytZr+vWGPOQ3APQOiGh0hwp4/d/8k7lPpuz8EQnz8Vd3jkKGNpx7ma2kyAPKYtcshwVh4ZdU7Zgz+8Wpdq/mZP+sRWcSGjfie8P0Ubf5RsJCpgFZ/MhejksHs/OrVezTbhtkIshLBGupgsYIt2JFt1gFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03gSwVqZidXKIHY0bMimCfcr55hHt+Lr4VkdgjpL4FU=;
 b=jS1T8UAJWtv6AR0N9kyhYtKOeIgIaqloijU2tjFZ8U9+PpVXkYKyyhrFFrcAFdMydNZOcUmOplMh6tV2bi6tQ7L1ke34aDsgJKqfuLaQKUH5LnVo8Qc00Op51bz1AhAyeUpWiDzOcxpXx6m1dI4p9pFf/2d9oqmW1gKCpw1QviWCSsYyHAmJQsl1DjiNVPCUjFWc7A4EYL4ZDzadG8Wk8axZXkuPiMVVNZabJtFDrCpjrbO8Iv6nbGgt0KYoJ2AwWKz/pTL4xseh0QzQE9xr2D7I5WSWahgBm/898tlSU62RACh2OtbHL1z/dL8blYBjp+PVrlN9QfoRJo473xmkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03gSwVqZidXKIHY0bMimCfcr55hHt+Lr4VkdgjpL4FU=;
 b=ieUxgOkUVNXQdCBfk9zUpuH9x5KOEnmmElbxdEvs8DPwFO0czwNGUC806a/gZ1VsExXfDFlaFvZQC90WRmYQdwQTVXF4oJqeq22t0f0acA4Ja02baOwOjrTXcYxHm6l4uJwbcvuqm25YLhUZXdY6rRNDYIqC+D5jjUOzL7cFeBk=
Received: from CY4PR22CA0056.namprd22.prod.outlook.com (2603:10b6:903:ae::18)
 by BYAPR02MB5464.namprd02.prod.outlook.com (2603:10b6:a03:95::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 4 May
 2021 10:08:18 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ae:cafe::a9) by CY4PR22CA0056.outlook.office365.com
 (2603:10b6:903:ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Tue, 4 May 2021 10:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Tue, 4 May 2021 10:08:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 4 May 2021 03:08:10 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 4 May 2021 03:08:10 -0700
Envelope-to: linux-clk@vger.kernel.org,
 mturquette@baylibre.com,
 shubhrajyoti.datta@gmail.com,
 git@xilix.com
Received: from [10.140.6.59] (port=46644 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1ldryM-0007OW-0r; Tue, 04 May 2021 03:08:10 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@gmail.com>, <git@xilix.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] clk: zynqmp: Check the return type
Date:   Tue, 4 May 2021 15:38:06 +0530
Message-ID: <1620122886-13349-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed9a21e6-d3d1-4428-6772-08d90ee48a22
X-MS-TrafficTypeDiagnostic: BYAPR02MB5464:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5464B823EC7F513322C79F8DAA5A9@BYAPR02MB5464.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1veb+Z7J9k1ikidrriGNR51GU+29TxF6h6AR/r23taSSkqyaWB84s90ot4BKL4vzLNnn2IQE2PkNdxgGE8lP4UofpGyUH9XWhMr4d7GxdzlF2iaYGsurhs1S/qu0vbvoNzaUSO7GN/nHSijDWwq6BAEv5dygUpvWHTMSgFQOD7OhZiViBuhujtai6gtMlPxia1YaLS/lcPej20xY1ibhTVws9Ct4KxPeHcWha9Ens6my5Kc0ndJA97YJQ7JBB7CZJGJudjc1GGDvMcSC2ZgyLuYsqcRbdmZDvieH84vkd+T3yYNCmGRxN9fkHMyBLm5BFLqnjDlCV5gMAys1hxhqHfPLO1IUNcQcxbu86pjmDG8OewN6SWfS8AdJLikdqcVyD47MeHBnAb3zH8O8I+LSIeJG7/uu4su4FibVPpLq2wOszjRBiDdMBLwjyY6bY/BqQSuXpjvR86NocVKJg4fHW2B5VQzUwtgy0ErYBKNBjyLnm7HxDDP8nS35utgCgqM6ZPjUG8EnlS/qb0kfLr14ezs2uGLUncRYdycqLndfHIJJ/pq72bzrcsFrDF1K9mBxhkV3CGj/oy8Qy09jBuZNca+o/aooB9aRPKO6Vv0fr8ALiju37xroKQcFpmhJWdQlx3uyzsXajzTLxB0dmTIXb6JRBZ3dWmkSqYHXYise9l/gdyFOG2/oqsHTaLuEPYP3
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(46966006)(36840700001)(336012)(8936002)(2616005)(4326008)(478600001)(9786002)(6666004)(26005)(70586007)(6916009)(54906003)(186003)(7696005)(83380400001)(316002)(36756003)(2906002)(82740400003)(36906005)(8676002)(47076005)(70206006)(82310400003)(426003)(356005)(36860700001)(44832011)(5660300002)(4744005)(107886003)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 10:08:18.1848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9a21e6-d3d1-4428-6772-08d90ee48a22
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5464
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the return value of of_clk_add_hw_provider is ignored.
lets check and return value.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index db8d0d7..5f674c5 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -739,9 +739,7 @@ static int zynqmp_clk_setup(struct device_node *np)
 	zynqmp_register_clocks(np);
 
 	zynqmp_data->num = clock_max_idx;
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_data);
-
-	return 0;
+	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_data);
 }
 
 static int zynqmp_clock_probe(struct platform_device *pdev)
-- 
2.1.1

