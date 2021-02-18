Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFB2C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5D1B64E7A
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhBREv3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:51:29 -0500
Received: from mail-dm6nam12on2042.outbound.protection.outlook.com ([40.107.243.42]:19040
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230295AbhBREv1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Feb 2021 23:51:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwDf6a3CX+1TPR9sBqwRJZX5yyilBLfYr8zr73jDditzbhvR5l5wuuqnceuro9XUVzrxRjW0nabZw/luGsWUkDHKUlzKL4CUqKamV85MZXrkZ/EeLrNFGXtuhQO5FdlGiGUWijEO9QCDky+nrJkpD+nk4nDnJ3k3SPQvjClnIodCAYsGOlGdXyUcpHpBjr370WXrvnzxyM5NZJM9mCg6zHGC0HK0fTcr2KfO/V6lXCsBbMfQ865wZostML7IvJhDUkD6qjpBT/tYOonuy955G6LO8fpb1sYnhxnxGkFeshtf5RwuyCmJaQHsKeu4lwFLf1XNu4Q0DbnTlXnn5ESA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roEj9Agv1RYOmPCtk4VocZviSZy/fkIAobJzO2mZ+s4=;
 b=UnO5cBx6q3peVZ2t8JqcwYOmkztfYDTo+IU44oLuEmaj/oa6sTGAvOLRq8dW+OZpxOxtEGaUUH+hETCtwhOgZNqs7ZMb5EspWGhvS2aaejQJunbpHlWe5rr2Lyt2gqKuNiWkci60diwobjiRGBCMLIKAgPTt8XiwY67zGSD86RSe37sBcyKxF8O9Po5ZzzLGkvphUEAmN02BPPXuvisCc20sNAsMqH0t0zMjlHknh6YzwEG5giDM3xaZ1BTgJPBPejGhCGBERD8q+37qEBZpl2eRSZLNHdhrMzHf85es8vxAbguOvGQeTqvhQpwCv6orKYySzPcKPnykNbiGICi9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roEj9Agv1RYOmPCtk4VocZviSZy/fkIAobJzO2mZ+s4=;
 b=Iom/Di3XuzrqR1iyRfhJr1l+73tCTrHE2Iv6XIhPEbiruWqtdu1Drx1ewiGMln47duyFeoPOh/AO1w8WrZMM08NfWI9vrrfwIZL7/2gr7ordNmDD9RbMkMXEaszASKhZmv7vtzdWeFgWrrWchahDkgTpfu0HcJZYkTsQTe9XYgw=
Received: from DM5PR04CA0034.namprd04.prod.outlook.com (2603:10b6:3:12b::20)
 by SJ0PR02MB7343.namprd02.prod.outlook.com (2603:10b6:a03:29c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Thu, 18 Feb
 2021 04:50:34 +0000
Received: from DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:12b:cafe::f) by DM5PR04CA0034.outlook.office365.com
 (2603:10b6:3:12b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 04:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT016.mail.protection.outlook.com (10.13.4.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 04:50:33 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Feb 2021 20:50:21 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 17 Feb 2021 20:50:21 -0800
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
        id 1lCbGf-0004qG-L8; Wed, 17 Feb 2021 20:50:21 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <miquel.raynal@bootlin.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v9 7/7] clk: clock-wizard: Update the fixed factor divisors
Date:   Thu, 18 Feb 2021 10:19:51 +0530
Message-ID: <1613623791-4598-8-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c2449e6-b176-41e2-33e0-08d8d3c8b9ca
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7343:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB734332DB770BBF4B070767C0AA859@SJ0PR02MB7343.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9TLe1umxsnuqFP3oIF0DpibFlvzCqf9WSTdSdvnrug4eW77aNTtlsaQLfJDzNl0l4Z/9T05dTNtQvEx15XgKe5tB44qfOxx0rAof3/K6/Eop9fo4o6+bxsTp5m5bNE9N/OP8g45QCVxujqoYOqOjDhKqPsxyk2rbelfn1KQO+O1IHm0AIkl+W2J5gov2BTV6tEjdNjBchN1KM+HrNW1asOmO40c5pUsUOXfpdtC9AcAz7b7vhZkbvQ5+1H35RfDQYxpRRwLMPc3TvodbnzTAqDaT4VPPEYHjGSIBor0XWxOmq58ME6wJ7EmoEVAlqIY5k9SKZ69nUKU5qRh00byPcJIZou5Oaym+NUP2jmfVS4i77z5IbQBGJQFvYc9nz82AvbYVcook0VX06cBc6G2aSyN8IZLrBoWoaKQqCCVOP4u+KVcPiQR0hVhHdN77ojOShupUbWnmYaRWlNVboCCaM3eti47GLbsurnn+AYw8xmOYS9OIJe0Cmpuh5B6pBhDkoVBF7I2Mk+HV46Ub0dgiYvvXsfWgJ8lUNAMvJACX82ZsLvorG1J6hIisG09viTeHtW/FkTp4RVETIAHfYZAWpV5RiJuX2ZiIpvmwAUWkIxYEIv/CPOeI2OdSt60Q/7WRhTQu6T6vfT9EdbGual32J66GZklIkNs35+uQuObiaY9jtj+qiQhj+ghf1ybB0huV
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(36840700001)(44832011)(478600001)(26005)(36906005)(83380400001)(336012)(316002)(2906002)(2616005)(107886003)(15650500001)(186003)(82310400003)(54906003)(6916009)(5660300002)(47076005)(70206006)(82740400003)(8676002)(36860700001)(70586007)(9786002)(7636003)(356005)(4326008)(36756003)(6666004)(426003)(8936002)(7696005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 04:50:33.5972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2449e6-b176-41e2-33e0-08d8d3c8b9ca
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7343
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the fixed factor clock registration to register the divisors.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/clk-xlnx-clock-wizard.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index d403a74..7f09522 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -472,8 +472,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	u32 reg, reg_f, mult;
 	unsigned long rate;
 	const char *clk_name;
+	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
 	int outputs;
+	unsigned long flags = 0;
 	struct device_node *np = pdev->dev.of_node;
 
 	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
@@ -543,16 +545,17 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	}
 
 	outputs = of_property_count_strings(np, "clock-output-names");
-	/* register div */
-	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
-			WZRD_DIVCLK_DIVIDE_MASK) >> WZRD_DIVCLK_DIVIDE_SHIFT;
+	if (outputs == 1)
+		flags = CLK_SET_RATE_PARENT;
 	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
 	if (!clk_name) {
 		ret = -ENOMEM;
 		goto err_rm_int_clk;
 	}
 
-	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_fixed_factor
+	ctrl_reg = clk_wzrd->base + WZRD_CLK_CFG_REG(0);
+	/* register div */
+	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_divider
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
 			flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
@@ -577,7 +580,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		if (!i)
 			clk_wzrd->clkout[i] = clk_wzrd_register_divf
 				(&pdev->dev, clkout_name,
-				clk_name, 0,
+				clk_name, flags,
 				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
-- 
2.1.1

