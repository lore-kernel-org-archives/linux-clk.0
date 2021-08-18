Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF41C432BE
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C39B961051
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbhHRHAR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:00:17 -0400
Received: from mail-sn1anam02on2085.outbound.protection.outlook.com ([40.107.96.85]:30980
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238080AbhHRHAQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Aug 2021 03:00:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDtmheBf6fdz7vdFkYCYF2845CafCI1f4ula0lmzpczq0v9wCDCPQbYFdunI1MTP+xJSNDPV7aNZDOm1T6PFEiNZmauFuyQVDUyisdPxS8YXC76DDqoDQkIX0FUhIZHvVbIo9HiPYTaSSFgcsR3OH0eAuWeybjwPVp6H8lW+2KDPXG1PS7B2IR20vHOi6HpO1PgqyvP1+fQbt7jg7aOTlAfRAbAem+TUaf24Dsk9Ws6mRcyc3tx98v0j9IXgZaBhdNv7QFWZg7dHxkSu4t9zC4JJOA1zSirpR3F1IL0fAms+HNNCqZ1sM+MuML4EVlJcj+scm6WZDKehWEiwCsJ3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb25QNsNW9YWKZ67Aj0TmgV0keVwo19yuIqq7FWTjwc=;
 b=edVZhz9gMrkZWxqRiuxHrPwrUMWU390jFA18/CCUHdKlnkIC7DRouSZShmnRpqK0Gzj/maBOxGJydk28j2kS3HTiYOh+EBTQsEA2OeABdxcVsH9uFP1Hl4fygbu8ILsQWQFZn21RA+L0vZXc3lCfc34sroWzTthCo3PL+C8zgeFK0WukYEb+MOlyafr1cblzS7k/YGUUoe+xy+kemReB9UdAZL8ARTtTqXqF7lfVdYiXgDP3aVx9TYVCntUBHcbu3zKYkXmBelSXxlDd/b3MQODMKwTGY4ScCURaZXLeOYoE84GG0fbh8mmBCrGtnwBIbbNc0Z8OYA3gynY48R0qzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb25QNsNW9YWKZ67Aj0TmgV0keVwo19yuIqq7FWTjwc=;
 b=fCoj3zWsFxc40sHW0wNfkkgz/CMjsPlIOD/UK/30fCcoZCV90JMuSjxQXsSWuB2eynmu/W4r7tv34lIskLKCF6Fmdue+iT4VuMPtNIf1isc8FmIz7WHS4oBCxpSidM9hlNJ/e8e4XKAK1APm9iKD0ZWUFM69zMzzh0KglG3cMfE=
Received: from SN7P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::22)
 by BYAPR02MB4152.namprd02.prod.outlook.com (2603:10b6:a02:fa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Wed, 18 Aug
 2021 06:59:39 +0000
Received: from SN1NAM02FT0062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:124:cafe::f9) by SN7P222CA0005.outlook.office365.com
 (2603:10b6:806:124::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 06:59:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0062.mail.protection.outlook.com (10.97.4.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 06:59:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 Aug 2021 23:59:38 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 Aug 2021 23:59:38 -0700
Envelope-to: linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=53032 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mGFY0-000GPx-6C; Tue, 17 Aug 2021 23:59:36 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <michal.simek@xilinx.com>, <git-dev@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/3] clk: zynqmp: Check the return type
Date:   Wed, 18 Aug 2021 12:29:27 +0530
Message-ID: <20210818065929.12835-2-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com>
References: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a67542b6-c8ce-44e0-e3e4-08d96215bee0
X-MS-TrafficTypeDiagnostic: BYAPR02MB4152:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4152A0F9955620169F849B38AAFF9@BYAPR02MB4152.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbMKSz/uyVjM0W7fa/3okiArgjhzSPAe5w3aMVogd3P9HvpYp/k0cLESEpZ13UoA795MGQwrM4CsYj02uqZIQYvFFp9Pigg5ZQCo4AMIKhB943SHHeu02FFee9T+CR77r8QKJSlrSeBPjzVui0nU5UNTOJLrujlZRTSH49MhtzD8/LGvcvZy9r/vKLWQs6QDaXG2CJUneBUNbImm9l7xZ++zSDMxD0BEq9KLK58wL6qbhBpN3gI0FDV4mMTIJA1E/KRpLIxY26YRunPV3f1wd+wzug8MMzk7YizyCMQMMilDxaoi3HIoaU3N4I0XTQzf07RQoPvWGG8yuNcSakE5fo0vne7zStJ48IsnTpBEn6OrjgZMvztJ9NpUrV9NvylzU6mTa4x1J9LNdMOSk3newU19WQ/xlUfBz4F6H9NK08G9NUdbuI1eB5uc9oS//tGI0U73+O6neaP2P8InqHx+ry6dCzonf7noQnYn0Jh0jkeHOHWVj/mK4g+KBcMXjNHXvKcGOfxsCq5Flr6NPGBFpurinh79LeIxzOEz5g6ixN2QNDo+g7PZ1S4S20fqTBwSLIhpc14YP//LwH3z+gxLTv6OFBhQbq6T5fypdCpWLY1ONtu1K+gPBGl8C3oR8F02Mej8eJ3wTyvoFJqIggQ1OnUgoKlQPIX5ln8r7HUwxbfsWWsFbD755SAa9Bc3cxXQd45EsXaY0LT8WmKr1af2j1NH7aj2OLUTScCgrf0M72Y=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(70206006)(70586007)(8936002)(426003)(107886003)(36860700001)(6666004)(82740400003)(36906005)(6916009)(336012)(7696005)(8676002)(2616005)(5660300002)(7636003)(2906002)(1076003)(316002)(44832011)(478600001)(36756003)(9786002)(4326008)(356005)(26005)(82310400003)(4744005)(83380400001)(186003)(54906003)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 06:59:38.5050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a67542b6-c8ce-44e0-e3e4-08d96215bee0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4152
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
index 871184e406e1..eb25303eefed 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -762,9 +762,7 @@ static int zynqmp_clk_setup(struct device_node *np)
 	zynqmp_register_clocks(np);
 
 	zynqmp_data->num = clock_max_idx;
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_data);
-
-	return 0;
+	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, zynqmp_data);
 }
 
 static int zynqmp_clock_probe(struct platform_device *pdev)
-- 
2.17.1

