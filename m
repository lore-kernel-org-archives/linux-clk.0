Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81501C6FD20
	for <linux-clk@archiver.kernel.org>; Fri, 24 Mar 2023 10:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjCXKuG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Mar 2023 06:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjCXKuF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Mar 2023 06:50:05 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B1A21A13
        for <linux-clk@vger.kernel.org>; Fri, 24 Mar 2023 03:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECTkO5sa98bdu8gX/pEJbEJ1UI8n1HRMFg4CAoChNYRSbFIClBMDzOjy9f6hBZBM4WNlSvLkg+dK+rwXctlyXpZij5wBvyBJgeiYPRao4Ygtor+VoPmkSy1uZGAzLJNKJ5keZJN6xYdnfd1mKd3yZS0gkXD6HLHUzPs56gMTEg5bNp95uu3gxWhlNkLv0bdJMlML2zi0LH5wYrYonqBAyaxL+asVTphzgPt2b/72GMVMhawAFXlikte6aoAI1jowBOh1pb84+jb4TTdDZ4c5DMELFugFDhZHQ+kvH+oCOgrcUX9h9Oaqb8HpuaMvsm/efod1z8RXsr4H9Ip0+P4RzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYNLOFkVHIaA2G1xmPzzijbemTcBS6PM+sL5M0IHWbs=;
 b=ToL5HJGXHJYXx1sUeD9YrR8feV5SaXKvE3S/tL1H9HlDUJkms5pyiD3DvQ9TJe5Ionj1PJa//6fQnl1qrark+6bSOqp0N7bjMHGC5QvjIqYeOOTbKNaQyieK4G9FyOH3HKJ2PyUQ9p+Y3ZWyyaqMB1u7viz8YwP//m6jp6nFScfov2DXLZE+rohv+61eIbNwIFLdOj+Pa88XHz+g5VI1pLLjGKe8MiR5Y+XM8fdsPVZ0usri5LTZDPrQZtopuGnwXaET5ELvWsrqonNwZD796enR9JtAZWRclkf/b4srNllcIV4RVtEmiw4qvRD1HY6hZlMzu4Ht9C/5oySV+10cxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYNLOFkVHIaA2G1xmPzzijbemTcBS6PM+sL5M0IHWbs=;
 b=FTI9GSjZbih2rMmf15KkZZmlEnyWpD+L5Ytk/4uEgPNl9rPyolY4JnqSq8VWXl9XB/oYKCBXwCnpN3Qdm2D/4Aep+6FYdbneiDleA8Gw9HCvG9NbLdfkI1U+cEWuctFS/eYOAM5g+VRwbCBdFesxIsPdbDJ1lw1DiUynG92+naA=
Received: from MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::30)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 10:50:02 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::25) by MW4P223CA0025.outlook.office365.com
 (2603:10b6:303:80::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.39 via Frontend
 Transport; Fri, 24 Mar 2023 10:50:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.22 via Frontend Transport; Fri, 24 Mar 2023 10:50:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Mar
 2023 05:50:01 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 24 Mar 2023 05:49:59 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <michal.simek@xilinx.com>
Subject: [PATCH] clk: zynqmp: pll: Remove the limit
Date:   Fri, 24 Mar 2023 16:19:58 +0530
Message-ID: <20230324104958.25099-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT021:EE_|SA0PR12MB4557:EE_
X-MS-Office365-Filtering-Correlation-Id: 33889418-c878-47cf-851d-08db2c55853d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rhRfQ6z7pxryaSbJXLmxp0XGyfGcPXOK4HPQpC0ujSrtST4sKkKKxYeo/VSlEnO6VXnybj8GDcmCSh8vMeNZuSRB/M8pyyAzsT8dAsOp4oiLbFVXCQt03XgXs2JWa7F6163EhFKHxk6WI7RrRDZejB9Toah/2DLaqA3cDd3ssS/viCdD4rJYx5TnJjyzHmLm1b92mNPBaEVnKMNeWvGRiklpZUw1x0L4DeAUHPJhMnGu6zVHNdVB52VtCT+DbnYbvhsn88TthrrEWhyuHm7FQxsbf17/WerAI1G9L4E9as9/XtRIDr/Dgr/SitmYiyfp4KUxkYfDvwEJj5RaoUF1W4/Qlj9O/owT3+1rmRiiWGFbalfgW8gzcQ2fC4vsEh7gk/iYrBHfP4ckuTW98nosbUCMMXdbbYNE8EEWcvBIpYmmaFl+/MZZcO1G6u1UQgPpLvPuYY22jPQlbdT0xMxqqbvjnp1JDlBQsHGuXxMcO4AdJjuve3AYgkMMvBwqHR6/fwUNiQ803tBfcWYjdUow/m9rQ4OFrdLOtUYKQLBmnt/Zu7UoNe4ybarLhNphUhVuicWM05mbSbsmVc9Mc6HV65wJkVWOY60vYHtU92IfswwOtpTETWklc3j1dUwvCGnEBDyarV3x1zg2w2IFfF1hetTWsI7r0lV+XiKCH+pyr5VHqRxHHceW2uJgye3aj8zK/QZvlYyc2h6uQBykT87zL7gq8ShSkyRQI5ogswh54Fc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(356005)(40480700001)(2906002)(40460700003)(2616005)(336012)(478600001)(82310400005)(186003)(316002)(36756003)(83380400001)(86362001)(54906003)(8676002)(4744005)(6916009)(36860700001)(70206006)(70586007)(4326008)(41300700001)(47076005)(1076003)(426003)(8936002)(26005)(81166007)(82740400003)(44832011)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 10:50:02.0582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33889418-c878-47cf-851d-08db2c55853d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The range is taken care in the zynqmp_pll_round_rate. Remove the rate range
in the zynqmp_clk_register_pll() to prevent the early truncation of the
frequencies and also allow multiple combinations of child and parent to get
more accurate rates.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/zynqmp/pll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index 0d3e1377b092..7411a7fd50ac 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -341,7 +341,5 @@ struct clk_hw *zynqmp_clk_register_pll(const char *name, u32 clk_id,
 		return ERR_PTR(ret);
 	}
 
-	clk_hw_set_rate_range(hw, PS_PLL_VCO_MIN, PS_PLL_VCO_MAX);
-
 	return hw;
 }
-- 
2.17.1

