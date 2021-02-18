Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9B0C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91B4064EAF
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhBREvF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:51:05 -0500
Received: from mail-co1nam11on2062.outbound.protection.outlook.com ([40.107.220.62]:1249
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230233AbhBREvE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Feb 2021 23:51:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYe4FfYc/V5AtNWUjB+WxAGdLRPv/kjpNcOTlgjrdpIm5ZCBKOVy53MESlCxjh09J7+B0tZFDoxNHDC0KxWlQZ6ao4mRlgA3OymITUnv0+KzKsV3bxyZxka/9zdfyVOdpMlFS005hW4NikDGYaKSCWj/TPELCRC9Ec1zL9noSMQXvX94WBbFJDq2HMMM4RrvOpKUdEY4jE+3gtIJFaqyVWP8mp4Ag9mNLYZU8yq1gOcN2i51VEHVOMDWILc69h8u+Djiw8gtVX4/AcC1w8we9b4oZZs/f27KSqc+MljoCflRuC8q+fkPmdl+O4zZrDNSIjyl3kNk7h+/UuGN7EgWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVuuTVm4kNVjw1QohjTJFApSIi3tzsnwlDaYpbM359E=;
 b=HMQ6wjJgwh9AA8XNIeMb5iOt0/bDDul7LB08+xWQFOyFajOKz0yfGbGGLpuf1jnVMY2rWry/djFvdA1rCitYPm/EGWtwtE7Ti9KiWVW3Mz2L6l3q3iM5Eb22ukB2SWRz52nEPADYVTEgTWy2w3HcQIC1pYQ4NyDwoRgXdoLCieNgrFNdV6qQVVqyz+TySjHjXrcqMMiA2ISY3bSc9RnaJJdg83jomEKLAymnqWU6PI/YGwVcBm9dEsMNmbeIWDAPc/5+18It3pLFknrushtmBI0IOYgUET/7RRyZE2mAl3ovDC5dYyi0FOoTqMZGnqYfejUHahF4GiGiYmx6nbkaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVuuTVm4kNVjw1QohjTJFApSIi3tzsnwlDaYpbM359E=;
 b=noPlIdLVi6u3tFssk1MG0yP7eU0glK+cTj92NQIUkpSJ1RzxZpi+IMXSybp3Uy6RU6jDFM8jfYN1FiIUczJdISuLRwlKXoSKHng9XhPF0By96FNkFPr5o8bRpZexCkP2QQ2Pjx7Ddn+8qN0V7s/PEfgrHNSjSN/Cd7Y5FOCTf6k=
Received: from DM6PR02CA0123.namprd02.prod.outlook.com (2603:10b6:5:1b4::25)
 by DM6PR02MB5641.namprd02.prod.outlook.com (2603:10b6:5:77::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 18 Feb
 2021 04:50:12 +0000
Received: from DM3NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::9f) by DM6PR02CA0123.outlook.office365.com
 (2603:10b6:5:1b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 04:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT047.mail.protection.outlook.com (10.13.4.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 04:50:12 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Feb 2021 20:50:05 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 17 Feb 2021 20:50:05 -0800
Envelope-to: shubhrajyoti.datta@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com
Received: from [10.140.6.59] (port=35054 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lCbGP-0004qG-8Y; Wed, 17 Feb 2021 20:50:05 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <miquel.raynal@bootlin.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v9 3/7] clk: clock-wizard: Fix kernel-doc warning
Date:   Thu, 18 Feb 2021 10:19:47 +0530
Message-ID: <1613623791-4598-4-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c119e4e-00f3-4a83-a88b-08d8d3c8acea
X-MS-TrafficTypeDiagnostic: DM6PR02MB5641:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5641D451BE99E543533749D1AA859@DM6PR02MB5641.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TKIK7U28MzcpAbFkrP52yLrn94Tkl34A+O0dhGStQAFFwiDAVFXyk22T7hcsCwfzas9r/BgkJyFnC6Uj+dvbmc/lfgk3u34Yrx3YRgRBPDLNdu3sPwtTKMSf0Kpg6TEHDrPvj2KQABkr7EeltGVyh+1+p88InJd3Km8ZI/yTvuEGGetNFcI6+PD2IdgbC4rYA1FknMBCOiEvqQNgXMSnOk7sREVmciRNuNZiPT9b8Yoq0C3QYlwoqFKVKnOLZS9qVGahJEtXqvvGN8V1szaXWGgSom5rZSWGRrGfum0mvINCz685v6d9xsIiWueJUYk5jC00qE5Ic8g5r5Ke5sBqfpfo3Mlfn/O4JZvMxst1n7uUkN/CP0kckg1R11fKwVD2tsMJu7cCX4SahN0FYkZSslO8V4hzf6Eqo2K9aH0FarO9t3rwtDNHaaosqBL+TlTjDK7HM9O6fmj+oqMLbnoR9bX+lG2jLbr/VrtX0h+Ol7LnaR16b1uasQjA0p6GktrPoJLQry4uf+Sd6w/cxT6APxC++GNtCGmcoPvQJ8KBCdBSuohlAHP3C/pe7pWraSUyMis10Gnk2ezcKL0+FVwmRYfPxKrL2N+QNbwqqg5t9Mj0Cr+z7xcvdUElqF4eCposZ2DGXFkc65HKXvSdX9uuJl5cMDU62QIFh0Qm+zR5JuARQLVI2lbBykB1o9qCmYLZ
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(46966006)(356005)(316002)(9786002)(4744005)(2616005)(7696005)(6666004)(426003)(336012)(186003)(26005)(70206006)(54906003)(47076005)(70586007)(44832011)(4326008)(2906002)(107886003)(36906005)(8676002)(83380400001)(36756003)(36860700001)(82310400003)(478600001)(82740400003)(8936002)(6916009)(5660300002)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 04:50:12.0005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c119e4e-00f3-4a83-a88b-08d8d3c8acea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5641
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

