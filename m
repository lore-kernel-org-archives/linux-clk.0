Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9B9C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33BEB610D1
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhINM7p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 08:59:45 -0400
Received: from mail-dm6nam10on2042.outbound.protection.outlook.com ([40.107.93.42]:5601
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233025AbhINM7p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 08:59:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQLRoMejfZmFOVTiItzL5VzHCOaoZfwY4nvIYvmuosjDgZX5xvI/+69QQa640OsNXCaZdasojY2A5cAU4BJB9g0ssvwMONw5RO7rrXEJ3u/GXjgkt+4g4LBzonyaGYjiJeU8OLwIq641kRNvpHgJpIPt9rVSyJSepTQlLg9kUmtxbUwL/VxxeHaQ/oEkQiLaww0G300Zvkw6pswvHBi1s/iNlKPicq9TqWXzuZM9yIYVigUWMTR1wVTHTEl4KKcBPHHGZnKMVezLZAh7Gsu6YThkMRP51koLwjdpU1VcPZH7Bc06si84+Cx6SUv7F+/Tjj23Zff4gv2M263vZwmICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TFVlgge2f4DyCuwBs02LUIsMdvbH3kGBzo//SrXdRPw=;
 b=SjzhFnkOoc+tQbp6s+XEAfJtOlxl6BlgQ043KaXmLXbWcKG0BAvSOZTUWxXPmepf81VSGg22zGjkAucXYPxGWOqpG8HIfYWBjOcYctNLNvNAJaLRRyLjknXgsnW5EJbdAjlloQlv0ezaoXVTwE+dVGSYagd6OOGaqvPmuTLO4YRrBFNAO6KZ0v/Raxk7Rsrh7xnRJnAzE37478+gJHNJiPW/d1ZXjlr1ULM5qehVf231nW4xlBHYjzFSmFByQf1OMSB4Hj032qq0+zqt6IqppT7Ply0s+dgBpj0yO11+aiLn1PTNf6bUNpN/7HlWt0xYsl9FC8dn143HmSpq+mwogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFVlgge2f4DyCuwBs02LUIsMdvbH3kGBzo//SrXdRPw=;
 b=KlbPyNm2DaDD12dBDi8Z7kyMGu9nsrOThBV/uiu8e7jucbIdE4PGQgH7NmA2G2XpX23b4Jm6Fb29OMirveTRo9Weu+IYpIqnONXbe02+QFJ3y+WDUW1i+n+ioUpwcK+DsnpKqZ0S2DGS1WEy512xF0peSrRU0nIXYvUhrTTHdHo=
Received: from SA9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::23)
 by SN6PR02MB4399.namprd02.prod.outlook.com (2603:10b6:805:a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 12:58:24 +0000
Received: from SN1NAM02FT0050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:25:cafe::3d) by SA9P221CA0018.outlook.office365.com
 (2603:10b6:806:25::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 14 Sep 2021 12:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0050.mail.protection.outlook.com (10.97.5.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:58:22 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 05:58:11 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 05:58:11 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=36978 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mQ80o-0002I2-5a; Tue, 14 Sep 2021 05:58:10 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v13 4/5] clk: clocking-wizard: Fix the reconfig for 5.2
Date:   Tue, 14 Sep 2021 18:27:44 +0530
Message-ID: <b23ad9f8e6d688726d5e862c28f25ba3836f9190.1631623906.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9f4076d-6117-4fbb-e924-08d9777f558e
X-MS-TrafficTypeDiagnostic: SN6PR02MB4399:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4399115A16B6C23589E19D52AADA9@SN6PR02MB4399.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWvBkireDBBehzMD3rIS/jH1TCGT8869a6oHE2+ASuYR2Z3+ubK2vOFj8Y5/I6rBtyFjS1nmskE1XQhhPcG/LFsnmH0hX7+vJPs6eqOcwQZYbiqTPscqt6OhhI1EKVrf9epkJWJBr6oFtAEJ24wo7wpTPGZi75fHoP8Iiw/UqDEK2ENgh5gFCd0g7tNZ7K4oIyA49y9vwXedT2ojJFxomPiDh1cLKV3P8WH7cJYjvnWPUqTX2n8AYW6UyCII4Dt3GqvbrZZH3jDpLZ3S0CbVePaKdsM1AcXhrM4F0IC256PSH612vEp+csvefppqEkaUP79ZornXZDHYLy3lTgisQQLe7lRqGpRreVq4lym8wfSesi304EsCl2Chz86JNDop4XnGfb31PNCHsrSU0ii4J0+4cliRG+lSBPdvjA47l0zFmlhelzWx3DOOcawpnwBxAUTAkppMciIHhdPVD2ADwzWX+r2l+kcHdoxrjnf2fG2vPb6FTm/DmDzWPn+MacNYhxuIvP8E80NfHuyhiKRSD0P3ssWZojoRJNHVOkn1bzREtDvE8N+xZYpzBFfMrrwaNzxeF2fzRL6k0kCwtFOquaMlLIgfSc1M7ClMXdbu2K5OkFBmpf1KSms6KoDpLJ92n+AOW6e/0GbDMIwt2BeopTnCb6AxGsAU6zQfOe+wv2nbTLgzNeHFn19MNz6Hm7hkImSA/OQP8xh3TzCW0ekMVu9fQP6s/0Hb/38GaDauekw=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(83380400001)(5660300002)(2906002)(9786002)(478600001)(6666004)(336012)(426003)(8936002)(70586007)(356005)(107886003)(82310400003)(6916009)(316002)(82740400003)(8676002)(26005)(186003)(36906005)(7636003)(47076005)(7696005)(54906003)(36756003)(70206006)(2616005)(36860700001)(4326008)(44832011)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:58:22.8797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f4076d-6117-4fbb-e924-08d9777f558e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4399
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 5.2 the reconfig is triggered by writing 7 followed by
2 to the reconfig reg. Add the same. Also 6.0 is backward
compatible so it should be fine.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/clk-xlnx-clock-wizard.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 1e0818eb0435..61c40e06e381 100644
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
2.25.1

