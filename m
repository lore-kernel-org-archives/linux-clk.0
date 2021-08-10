Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41178C4320E
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A2416056C
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbhHJH0c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 03:26:32 -0400
Received: from mail-bn8nam12on2047.outbound.protection.outlook.com ([40.107.237.47]:8218
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233244AbhHJH0Z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Aug 2021 03:26:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ads3pxwsnA+Y66QBewieDtPHMjnv/F8k0LYUAvAkF1EVuj+g7PQW3d6Hjjq3MEeMlvN6URu3n33kfZYCmqrXmqubFj59SdAPd+kEcfX6lWZEsSzvzn37Qpkyc9lhen3r6BxwOwXQxkapaQ0POsNxnneg1+ODMF3eDvhCb8wWBwB04kLLdagxPMVqqEGWRTVC9YhwpHUwhquDHmFZ358BZuZiz1QtYvIaSgIjAKC40g68k8tP734Gde+drtIi4UMx9UyBuHinExcBrcwdMD3WPUovi5VB/rAuDWWndny05JnjHIZweNN7Af4y2f1uRqKpUrAve9EjK2qtt8Ifd//eHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIitoBoIqdqTCPkLWuH7Od4+wln4DCghz+IfWDVUL9s=;
 b=dx1vTzBJKlT2JqgMn/7WmzEcD6ZE1b9UAEeo3aRdjkfXVNAjJGyC9SxE1jRCTazDBDfPt6KMk7LUn5weVfjVTU4/EJEhHAoCUI00YCu3/Qn24ctbSDHYYb06iHS9ZtR3XwzH1FGNlt8dMfdq2QOc+1o9/yhJny5GAUBONn/XdyDb2XOFUu+ACn+C76YyTN7JFxiwp5vSxF+K/ptel9/GTTeZixJEpWH5A1DP8r1Hhh91eXQJYPrl6nIKrfH1grWkO+5anZxXOqr1q60dOu//4Js4jmp0KD5aqpFTieO5s9wJEtylyEz1cznoPIHoVf/CBCwlHgn591ozS8udLJcT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIitoBoIqdqTCPkLWuH7Od4+wln4DCghz+IfWDVUL9s=;
 b=n/ANgpqOPMMC9aFZYERwjXcLuPSTkb3Lgbttx70FFWXtpf7oIeDVPRB8AgQVO4cWu/1bPHZtkNN/s1BdoiPJpwPCHja/YrU2HxNLd637vCcf+Zxb6e54cw4sbOGA7oe7xulx/LRIWtwYDHPHgiN4/7Xvn3Zm6pKOxUkZ8XHvvaQ=
Received: from DM5PR07CA0061.namprd07.prod.outlook.com (2603:10b6:4:ad::26) by
 SN1PR02MB3693.namprd02.prod.outlook.com (2603:10b6:802:24::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.18; Tue, 10 Aug 2021 07:26:01 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::fd) by DM5PR07CA0061.outlook.office365.com
 (2603:10b6:4:ad::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Tue, 10 Aug 2021 07:26:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 07:26:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 00:25:47 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 10 Aug 2021 00:25:47 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=48216 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mDM8w-0005zG-6j; Tue, 10 Aug 2021 00:25:46 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v12 4/5] clk: clocking-wizard: Fix the reconfig for 5.2
Date:   Tue, 10 Aug 2021 12:55:32 +0530
Message-ID: <20210810072533.27620-5-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97a978a6-00e7-4cb2-1353-08d95bd01ada
X-MS-TrafficTypeDiagnostic: SN1PR02MB3693:
X-Microsoft-Antispam-PRVS: <SN1PR02MB3693E20FC02920256311E6AFAAF79@SN1PR02MB3693.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4q0QRcAixQDJ+/KN1pJjy/l/4EzVOQcHObhWkcOsLtL1QEIWQcx5OsQqUDyUOatvMrQygUHtUTuxqWUuRv13zrYi7fXq7ZKnLTNQmv0qehKuwCcuveWFnppmki0oHZjiMvoWqsawT9vQbWu0m8S4ine0w8f1cDL8BxNJ9TS/Mn9T1I4Sfhc5msOhA2O5DHDMi+8YY6hxW7x87tMbWHq+LS2EycHIwPm45s4Pd5nqGApD0VwzbqbwLb87sR9rFZoXYjxgOL7gTM3HvPayGr8b+ghT9j3McCfXb9N8qbA0S+3+LY7NA7+JEr3BGq1HOmFluqIccvT7i1ANmS+9PmTC9GpaemFkETu/c/cgj9XyNTESTeUf5Py0k50RMwqDgQWDekE8lUSku/W/1OWmMhRYD3JW/wplweP7gMjr5+UVFv+XqlVPF8yLfgcE3Lt3VK3r3xwJqYvp83EZDe7mt4ra/MNpYQnMkCvXAjPryZX9fNg3yI3RLjbpaKZr+HmYDo+BhYs0dTRFCDcw8IFbVwzbK/SjzQyd4gJ4xsnGDXQp2YHwAa+YVcRmWvJxf4q3Wg92Z6eVnOZJoAORMvFtB77tSy3hiKOkZ1kN+2W9EuV/E0hcKfI/COd3IFTf3NHSRidYqH7y9oTl6NNFcVcOevG4NqIgfaXVdeaDsySmurlH31MsLDXeig73CeP39mR524rm3gQ6mdpNOp75H5HHdSsesHsw+AhjrN+1TIdhun1okjk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(46966006)(83380400001)(54906003)(110136005)(7696005)(2616005)(107886003)(6636002)(2906002)(82310400003)(9786002)(44832011)(36906005)(6666004)(47076005)(316002)(8936002)(1076003)(36756003)(478600001)(7636003)(26005)(36860700001)(5660300002)(8676002)(70206006)(336012)(356005)(4326008)(70586007)(82740400003)(426003)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:26:01.0560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a978a6-00e7-4cb2-1353-08d95bd01ada
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3693
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
v12:
No change

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
2.17.1

