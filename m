Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3B5C32772
	for <linux-clk@archiver.kernel.org>; Thu, 18 Aug 2022 11:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244209AbiHRLcC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Aug 2022 07:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239816AbiHRLcB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2022 07:32:01 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ADCA030E
        for <linux-clk@vger.kernel.org>; Thu, 18 Aug 2022 04:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9UZF39A4ZbzRwbBEvphLwBZ/nUe45NTln9op7d5CDx8SkCAdFdp24VU7Qcx9uS2bxP+8acYJOeGPaAD24FdUV7KA6YC01bx8mc4Lvg4uYuaS5zJ0dV/EBiEsdm6OatfD/2b1eGE/9H6t6f79jeBsCP2qJHSJBxHY+LaFVd0sOlXD84+W5uJRPG787VqnD5NeKARy4gH15Xwn0iIULT8IQi2n36SBoBjw8tkgT6nb+vXlo1EGUpZcu8dalrlHVgOce6EtJypnv17KTJvOtxu2GTbroaJyuNQSQ1UVllBOWJt07Tfelr3qYBeRTcdnqb1GgZs1DrCLhcu+ouMy2uZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7zVThRL7aaEtWQaAx4+d91afUzRCEzCiZhfQYO3UiU=;
 b=a0lueh/F4KAwUgBCmf2Ug5hFQ+4puNADmkoF8BzYHWSTbYeXT6g8KhPRdRWA5Fu92hiSPH0Hk3keSebwZ3L5rto7IhvSxUIV/h5U/zYBR6mu1o+E822NLsetLH5JJbzlrj7WmstXGux4VAEiAFgN855PrNsW2Srlk4YvszxVVvpnpYQL4HcjLVbMOMpdWHM5yA0ARMu3ms+VBs1Fb8rdmL9PUnFG/ErujUmXAb0xM7Pe9fkyl3zJBSrqmPMSulz2zZGG+CszsPilAxF2jUn7WeAf4CHSi04QkU0ZKo/juPHVBuCixHjrhCMstqrDq7/PSUTmDsyxXQZ/amLUfT6f3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7zVThRL7aaEtWQaAx4+d91afUzRCEzCiZhfQYO3UiU=;
 b=tBUnC3c3/IY/IluaEkQ40hWE+G2D1IFx/YCF39PnxMNnmtfAiEG1Ea2S3JHXPDURi7pv+Cf988WxKm2mob1dYMFs3OQ/huCIUmTPv8C4tRlPzDnAUaDHzrswJ4+LbPbYZLcCQN+9S1tGr4sy9hxbsiCnB9wTJZQB/vTCZxyAZRI=
Received: from BN9PR03CA0740.namprd03.prod.outlook.com (2603:10b6:408:110::25)
 by SN6PR12MB2640.namprd12.prod.outlook.com (2603:10b6:805:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 18 Aug
 2022 11:31:58 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::76) by BN9PR03CA0740.outlook.office365.com
 (2603:10b6:408:110::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.18 via Frontend
 Transport; Thu, 18 Aug 2022 11:31:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 11:31:57 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 06:31:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 18 Aug
 2022 04:31:56 -0700
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 18 Aug 2022 06:31:54 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <mturquette@baylibre.com>,
        <michal.simek@xilinx.com>, <sboyd@kernel.org>
Subject: [PATCH] clk: zynqmp: make bestdiv unsigned
Date:   Thu, 18 Aug 2022 17:01:53 +0530
Message-ID: <20220818113153.14431-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44fdbf78-531f-4442-59cf-08da810d4298
X-MS-TrafficTypeDiagnostic: SN6PR12MB2640:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HeQkZO2a93UAbv729r/qHs2UtH+ObY8qo8jj1iL+Lbcf2no5DtGd9l4KGkoY35xvuDWTxXgKXAPuj1BPimSi2RQdiw0uH4jQqpHiwOYaNEuw/XdRh9KWXlGKUoxuhm7ZUEc5o3W04mBFMeG34WXEj3nOzD2yj8isk2pcl4jyR909v7GiGFv2t43CQxvfAJkL+me0Fv7XCr7MgqvB9kdWGvJu72guZZ/uR54VpGue/2DCB5QA0G8XllBPZaER+dbPri9YbaF7Kgcpdegd36l4llzF3JRbj7mjENukMD+fkd09+n5t/LpjqEmlgxpj+WxW5458Lrii7xn0rbScK45h/WXAZ6CerM3GnNhN5YfqSMr39dI+Lsqmb4RrP9xbw0uLsed7Mbkj6iSHBi41AqkwEbZtU8JYWUT46YsciH5T6Oxa2meeMdJSWmMMbumZFMs4Kjt7RG/nIuHet44bdr2H3wmrW9MQH9qFHAp4pY7rpnU7wn3dGJ6Wiaav7z1ZxtblbvaGDNHA9i6WQPUmpVy+mfIYlk+Lr2yFVPbb8fhPxOi3TjMEWcyB32CnkAiNLhUtinA6rTzZFkJ8qA3i/vE4XawSTZF5OHYE6KMNi9M+SeJ6afGtb+VIuJC4oxc0l3esWV22uVER8J3bvUk/VpK6lH5vz4vhfIY8cTRru7nxhMspRl3Qvg1wJbJdOJjEVfuaUBuMex9BIc0yE8jyHcqmxcJH+PrV3ISqSoAzQ3RN19RkV2BUUdDS4JNHtVvq2K5OfHckK1kfhgeQTibKM/387lg+1nF4uGDisNZL1fVW9w1YwUnLA2STAIEWQjqpQk47
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(26005)(356005)(81166007)(82740400003)(82310400005)(4744005)(44832011)(478600001)(40460700003)(86362001)(5660300002)(8936002)(83380400001)(2906002)(70586007)(40480700001)(36860700001)(70206006)(8676002)(1076003)(4326008)(336012)(41300700001)(47076005)(316002)(54906003)(186003)(2616005)(426003)(36756003)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 11:31:57.7560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fdbf78-531f-4442-59cf-08da810d4298
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2640
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Divisor is always positive make it u32 *.
Also the arguments passed are currently of u32 pointers.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
 drivers/clk/zynqmp/divider.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 422ea79907dd..05788d8325d4 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -113,7 +113,7 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
 static void zynqmp_get_divider2_val(struct clk_hw *hw,
 				    unsigned long rate,
 				    struct zynqmp_clk_divider *divider,
-				    int *bestdiv)
+				    u32 *bestdiv)
 {
 	int div1;
 	int div2;
-- 
2.17.1

