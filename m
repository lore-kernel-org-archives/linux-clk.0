Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C16C43600
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8420961166
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhDHM7i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 08:59:38 -0400
Received: from mail-dm6nam11on2061.outbound.protection.outlook.com ([40.107.223.61]:63011
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231509AbhDHM7f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 08:59:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEHYnppdtnXMZfx4MqHmXSj8E+4ixOdHLs32YX2MERExg08E+O/Z745sjA/BdyNFRSZ7Q9nrYq0hUcXloERjJFsvDU52zACoYCz9iNFVHIaHcZBbEJU9MWbt+BwlzRci2jFQ/TEWA5HM86glkGjFm6rQcljPl2xfPEnY860m3RbEd8ZDmRrsLHCFJ7npAhCnsDE4uf0pJCetzNJnCL7DqNXdtYEIMy7p88jwHWby38xyyEYMnttHcwB6JlK3yfym2NfjWol3vFfMeeHSHoCGCNZNhzNlx7dk0OMEqClUqKaEEc0pgstw32WXvEtxtne6V0dPuVH9GlVK8xJUROSZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Xla5MnXki0MPvy7s4hWEfysHkytGDCPMVXTpi8QXFY=;
 b=ijV5ct4Y98iq1SjxQrUFBcRaG0N7RWQzOelFHhgJZOfNUWoDhJLs3PXmj7/Doyf3CmCXeQopiyx8Zf+agRY3o0J5EinPXw0+MsprbiTvsaxwQZ5mMpuXZRtcnSGJFxp1TuTHmjRp8sVHgVmt/nDdkxxajJ6QZ/GMOS+kS91BFcvdNKgT6ld9fd8c8yKxqxY5jqEDZBoisN/e13+b96PNJgAAefOH/ncsLBuD8cTh0h/UDI41sx2izBNsJeJc0v+cybncLn7JTVKmxa5tLHMB3L/56E4KZTXntHi/yoiKbX5wtpivlgJB8jwbsvjRq1WhdKde8PS55wP5y3STbZUKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Xla5MnXki0MPvy7s4hWEfysHkytGDCPMVXTpi8QXFY=;
 b=P1bQhNcb0uLInHzESIaNi0Z/QY0dtBIwZwsJzoGPVKFmvl74/ezM8AFBOZdY/8DWNn1FJFAKCC1jJUfZfeJkmBSh0WgHVQSRqPW245tPyVc6jyDo+k90Sx1brPF4Qm56RWjNZHt1WChKfGPwfh5cW9BhveF3ZRRFCS/yKZBYW+8=
Received: from DM6PR02CA0105.namprd02.prod.outlook.com (2603:10b6:5:1f4::46)
 by CH2PR02MB6856.namprd02.prod.outlook.com (2603:10b6:610:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 12:59:23 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::5f) by DM6PR02CA0105.outlook.office365.com
 (2603:10b6:5:1f4::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 12:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 12:59:22 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 05:59:02 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 05:59:02 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev,
 zhengxunli.mxic@gmail.com
Received: from [10.140.6.59] (port=57650 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lUUFQ-0000kJ-Ok; Thu, 08 Apr 2021 05:59:00 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-staging@lists.linux.dev>, <git@xilinx.com>,
        <michals@xilinx.com>, <zhengxunli.mxic@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v11  4/5] clk: clocking-wizard: Fix the reconfig for 5.2
Date:   Thu, 8 Apr 2021 18:28:42 +0530
Message-ID: <1617886723-27117-5-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19a43c83-d436-4916-8093-08d8fa8e2179
X-MS-TrafficTypeDiagnostic: CH2PR02MB6856:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6856C33A1234CE89E591E5DDAA749@CH2PR02MB6856.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wjr/5HDpG53kbGPvcZ4h4dmvpGQH8YM945Q2pVnxclgrLTuWbjN1/XcLjZcZ5Wy/4em/mOonUDSFt7h8rx4+BQAQz2+pUAFj7XCltiu9buZG+5fyVHKpeYOa41Hv4Mukp2hdZHgQiT4umn9JFCXrWRhh+X3WfytKx+ColSQvqPL2CoYzVXhIy92479+SYthXxw4javQthZ41IZn4UCdVCrwSIYUWAe7woKeFE2nbunlEQjd+xY9CjABTU6NLoHzFrRPj29V/Vvq7MgpgPqebe1jnOOf+9Pzc1TZO9SMhqi187cqUjHIfIjo6csUjrkF/A0pg333FGoW02FiQkRw5wTZzQgUaqijl/4w4nOkpz27TVj26Vllpr0eIjYwYEQfCIGkjw8wGQWAZpkwPmPKwSlZHfN5/Aa5zNB7QiCZHAEOAU9I3BvRSf60cdM9rBztcD43hBhmcW7A0ZkdK3FyAr//cGmTexKFdJTeWj6DewTtJyS8ddcNml507k3sUAhnONKnKN9ymMT8bqX7jumgNH7KssLGDCnj35SLlMG8yYBeYU+JZvcgBlBphY5CozN5u4IHQWcu3radhOPw77GadGCwHNNxBdYvqPnv673ADrHYQaGmn9qGvqC+gyG82Y1mjJKckk1h/oaKklk5qNENnCPh/7qfPRp0EcT21WTLUU9tPGwRr0hpTEGNtNoh2vWLN
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(36840700001)(46966006)(478600001)(70206006)(47076005)(70586007)(186003)(316002)(36906005)(8676002)(7636003)(82740400003)(4326008)(336012)(44832011)(2616005)(6916009)(54906003)(8936002)(2906002)(7696005)(83380400001)(36860700001)(107886003)(9786002)(6666004)(5660300002)(36756003)(26005)(82310400003)(426003)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:59:22.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a43c83-d436-4916-8093-08d8fa8e2179
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6856
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 5.2 the reconfig is triggered by writing 7 followed by
2 to the reconfig reg. Add the same. Also 6.0 is backward
compatible so it should be fine.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v11:
new patch

 drivers/clk/clk-xlnx-clock-wizard.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 1e0818e..61c40e0 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -44,6 +44,8 @@
 #define WZRD_DR_INIT_REG_OFFSET		0x25C
 #define WZRD_DR_DIV_TO_PHASE_OFFSET	4
 #define WZRD_DR_BEGIN_DYNA_RECONF	0x03
+#define WZRD_DR_BEGIN_DYNA_RECONF_5_2	0x07
+#define WZRD_DR_BEGIN_DYNA_RECONF1_5_2	0x02
 
 #define WZRD_USEC_POLL		10
 #define WZRD_TIMEOUT_POLL		1000
@@ -165,7 +167,9 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
 		goto err_reconfig;
 
 	/* Initiate reconfiguration */
-	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+	writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
 	       divider->base + WZRD_DR_INIT_REG_OFFSET);
 
 	/* Check status register */
@@ -224,7 +228,7 @@ static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	void __iomem *div_addr = divider->base + divider->offset;
 
-	rate_div = ((parent_rate * 1000) / rate);
+	rate_div = DIV_ROUND_DOWN_ULL(parent_rate * 1000, rate);
 	clockout0_div = rate_div / 1000;
 
 	pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);
@@ -246,7 +250,9 @@ static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
 		return err;
 
 	/* Initiate reconfiguration */
-	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+	writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
 	       divider->base + WZRD_DR_INIT_REG_OFFSET);
 
 	/* Check status register */
-- 
2.1.1

