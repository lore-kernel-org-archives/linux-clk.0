Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965ACC433DB
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54D2D64F60
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236439AbhBDNz1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:55:27 -0500
Received: from mail-dm6nam08on2076.outbound.protection.outlook.com ([40.107.102.76]:65344
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236459AbhBDNzK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 08:55:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfQoUg4fHHgjO6LLJggQ4zeuD2vcU8q1DU70B0lw2CEMKbaZYyk4GoQhrezM79pWiDLpbzyVOyxDWb7Rx8UsybgBFDXbFI++MS035F+7Nd5bE5IOsKXIVrMTLcn8wdn0O7PgzVgZs9ADHVtjG0JmspkCJ6KWfEN74S0QbgRSjoql85Fe0L3YGeUtF4yig8Lbf+FsRTGrIwEOdV9VuqqTjUV++g3a4C/L0LKLuLofooTuB6IBeE3Qc7gv3iIQ1zgFXLSgBuFkPWyD/JBKSfhFAWFpVp3nGEMpflIIxUcvwj+LXTE6pyX3AHlXkuty1v+9cAvaUKn/oSGU0qVARTqOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVuuTVm4kNVjw1QohjTJFApSIi3tzsnwlDaYpbM359E=;
 b=iPENlFSy5l/b1rdhaP2VrLc0k9o0/Gol0j/WEBDZUkDy2svoIolsHLwECwXG+tfyMIokkBJLnPS4BjvadP6yPBEMZkK0va7MCbJ0kEydnEjgg+EaoUohAZD6nI+bfbj81Xw4zpL6eJAAcwbqEyrDzlrlj3V2RiiDVRtkXAesYuiIGo2toPKBZ8LQHRy/yXiuQ6FhcQ+2IfG8jupBjjsePXdvied09CIPReNRqKuRIoAWg9szd09BDgauDW2uhMwvWZ6gPdBEM6ON0OgRRu1S+pxyBPngSnm8+93zPCdc+FZ8jJswDAowFKQVRXc970rA0KbqEp0JD7iNsjll3pSyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVuuTVm4kNVjw1QohjTJFApSIi3tzsnwlDaYpbM359E=;
 b=eBZ8tWkAUUatsa5Fz70M4jp/TRcHZGyigtaWSUO5fxkPHutR81AaIrEM26u2nUg75a97ZCsucXRWIBpx9QGiWxyfaBNohhjnXf6qzhHzVWP9qcvnABBa0Sj8zXRpQ2lJfEwwNL43t4VOC7UBSlhJ6NkGsfcFKAvSe9uGH79O/iM=
Received: from MN2PR18CA0020.namprd18.prod.outlook.com (2603:10b6:208:23c::25)
 by MWHPR02MB3357.namprd02.prod.outlook.com (2603:10b6:301:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Thu, 4 Feb
 2021 13:54:14 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23c:cafe::43) by MN2PR18CA0020.outlook.office365.com
 (2603:10b6:208:23c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Thu, 4 Feb 2021 13:54:14 +0000
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
 15.20.3784.12 via Frontend Transport; Thu, 4 Feb 2021 13:54:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 05:53:44 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 05:53:44 -0800
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
        id 1l7f4o-0000Tm-IA; Thu, 04 Feb 2021 05:53:43 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git-dev@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v8 3/7] clk: clock-wizard: Fix kernel-doc warning
Date:   Thu, 4 Feb 2021 19:23:26 +0530
Message-ID: <1612446810-6113-4-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e848dc39-b083-407b-1af2-08d8c9145ba4
X-MS-TrafficTypeDiagnostic: MWHPR02MB3357:
X-Microsoft-Antispam-PRVS: <MWHPR02MB3357C3F5BDE1E302807C8F0FAAB39@MWHPR02MB3357.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gHDPp1Ix7m6xmvwrAT1jjOgRpVB6YMykxrzWC/QT25c1zVZyvLzX5GtMzFKfRGGKjCtCqPAUeTpUnf5G+Qeq63Hi9s2Cl9CyyWjd75SjbH5ofOErqpgIS6qne2K1VKNLV3wrtxa1HY7CF5+JA6/5k2K/sNQW0kis/H+23CpO6RowmGpviU4lzllBWlPPNdsYlTAmm9Z46da92MvBQ9mgddb/S0rkJV2o3IRURfjqWYhUrHH7Bfc3LoIf0J//DxwhocrnrgBupVbGtqGsDbXn8//iQXCQUY8IQDnLXg+eovdmMN/KoZG7igt2p9HzzlnVN5wloLAaCehCfuHpICFUnEGbRtjOSjeo2mvB/gSK5VEJgYPjTG6mYlTvBfEnyLI3qNyHLWiIUdPRzernkEwbPRgFRe5n4x+C6Vw6V9nQgjIBPUVRm+kcnqWDVOkJP21o1oRGevqbmJtYYRS1lZPTGGr/PDA1LqOjGaf4VP9mlCGvbVqbHxbZlO8Xooeneu7ABJ5iLut5qx5DRZhCIn2oO8d1yi2ftOmvgjCYpRImdHszowoe5s4EYEreC5Yg7A0PW661HEXqfyyeto4mN6uh41MmGNiGCv6HHttToRWYkTqjKgqJcQzfvJJpEpJiB2TDSbgnfmS84h+Bf+lCDt0keH17saCp1hbVOQSfSFsJYUF43iyjy99AmQrf/f/HiDk
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(46966006)(36840700001)(356005)(82740400003)(70586007)(70206006)(5660300002)(336012)(8676002)(54906003)(478600001)(6636002)(7636003)(2906002)(4744005)(83380400001)(36906005)(26005)(107886003)(110136005)(9786002)(47076005)(426003)(4326008)(186003)(7696005)(44832011)(82310400003)(316002)(8936002)(6666004)(36756003)(2616005)(36860700001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:54:14.5526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e848dc39-b083-407b-1af2-08d8c9145ba4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3357
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update description for the clocking wizard structure

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/clk-xlnx-clock-wizard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 1bab68e..fb2d555 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -40,7 +40,8 @@ enum clk_wzrd_int_clks {
 };
 
 /**
- * struct clk_wzrd:
+ * struct clk_wzrd - Clock wizard private data structure
+ *
  * @clk_data:		Clock data
  * @nb:			Notifier block
  * @base:		Memory base
-- 
2.1.1

