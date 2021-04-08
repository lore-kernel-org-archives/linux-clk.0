Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A17C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D70961104
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhDHM7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 08:59:35 -0400
Received: from mail-dm6nam10on2062.outbound.protection.outlook.com ([40.107.93.62]:58721
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229803AbhDHM7d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 08:59:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzK+I4/LF4PG8AhFzj739lqFxDtqPhFCj1Mhxx/eAby3TkOZ+LUPrz3JFzBfs17HAdioR2qx1M4CiaIQmbwW/a4AyShod+qSbBxxSc3Z4STZJQbdYO3+/xNCKF11g6oWrRP1qWsWf6MitBfLEKJgNw/ZIOKuyHGz3uSv+Yz3S8LrpDUthHmkqxEcv9P61QBTZwqf+FVRzwYMZBoAqmGn/I3h/AQYq3qSyPvtbWIUObJoZ3khFcSYcRekzakn5ZmHCzzuQrhFI0OQpH+lsFMaWPKog7AKKvMdHBKV76O/LR2otxqVygXVBtoe+czCzB2i0XkVVNQPPXXg5FN8ndRfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F90SIjnr9fyygY5DXUR4JCbv0g0fUPErzQt+kPlJF7g=;
 b=NHE47fKnHPycM2YgGrno9lDVlEwfuCEDwCYkD4v8WJHbk5J6BZjddBEeudeG9R6m09LN+uOHrYANlIAML3Db9i4U1RYyn/rUfYRrMtt4UNjIXmnUGyjleJix/IqPaSip8dngxAp+6sORDJdiH2TosWMtbAu8n1GZz4V66EGPa5JvToOdgzYTjzpKO1jfcrSxohgoJSwBpb7FuBflKroWO7RNPNrqhADzqflHC8ZBYk+i3TXgurUaK7ZFTyrFskjYB5rVLKMEt80l+Yer6K5Z5scbzzdz97ZXAfR8CFfs5MMvFJQqS9DzvWQf9TIvXksUg2qY/hh08VTcuwCkeiRRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F90SIjnr9fyygY5DXUR4JCbv0g0fUPErzQt+kPlJF7g=;
 b=ZvKXwalJK+lYlFraqxvGKXgPuVe+HRTjHu4kMGuikrKfFO0ye2pefw3hYrPPAEzT+XfhMDNKThaEJ0bld1+M8hlu9sizq+ltop3YBCyX7Q08K26PhU2QT2aFYyZWD018uI2bBbnUV3eQdOKWVpD91OO7pFC8bCrVaD2lH9VWOG0=
Received: from DM6PR02CA0101.namprd02.prod.outlook.com (2603:10b6:5:1f4::42)
 by DM6PR02MB4908.namprd02.prod.outlook.com (2603:10b6:5:13::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 12:59:20 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::48) by DM6PR02CA0101.outlook.office365.com
 (2603:10b6:5:1f4::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 12:59:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 12:59:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 05:58:59 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 05:58:59 -0700
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
        id 1lUUFN-0000kJ-Pa; Thu, 08 Apr 2021 05:58:58 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-staging@lists.linux.dev>, <git@xilinx.com>,
        <michals@xilinx.com>, <zhengxunli.mxic@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v11 3/5] clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
Date:   Thu, 8 Apr 2021 18:28:41 +0530
Message-ID: <1617886723-27117-4-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 068dc433-b909-4c77-6d1b-08d8fa8e200f
X-MS-TrafficTypeDiagnostic: DM6PR02MB4908:
X-Microsoft-Antispam-PRVS: <DM6PR02MB49087063A69C0C8111EB8B53AA749@DM6PR02MB4908.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EfcWEBYg9wwlIsHLQNY/5TGuft0BIWbJgV4i08/XS/PGhBYUf87kYh9oryycihTzVUJcQhd14BA+ZIim5jB2YJ/2bG7NlHGflK+bRETTAPfMT/yrDqrQ+Q7uhwHf66khJNSL/Sd9KR2wvQ4VwYrNTSvJnpBlItuawSEnrwjtl2XwrHB8pWR/MbuOq0EBXG5sjR96mfAG03PCP7UYh+HP12+KZyfFkmdvctzEY61yobZ4IXoJTAQmkljRCTlq1G5h4EYT9TUH1aHfYPxHJvk5b/0JEl9ZglKwo+snJkXedNhCRM+/z+Yz0l8OE/wJiHfi6XiDGChrvhHmx8DjQLZ2HuUkKAA9VkxVjiB3yP6vquZJuRdUsSx47W7syvK9T2K0Meg4suvwi9iXUsbftG6XmPdBYO/MRYQ0UzlXWzRCxyMw5R1pTJy0COO+JpaSS4lVwPhgaLQIA7b/Tcv+E6nDgCVNm9XhW9sxQpNkoRjaIt4qYxB0mvSu3zStHcGnyc/9wXuQPxheqck2i60Z2+kDB/fcM/Nr4n1/VCGGNdD7DsYyof+S+PTxp4ToLGrMMcnQaF9KlZnedxX3Y1VYIMswKtGqsJxoGs/NUXZknv1Z9yWkSDOO0xpLaeVO0P2OsHF3hDKin3vhU6lfGpZFtTuh5h34xhyAYO0UrvGeSlX0heKUX3QmWcphwAoyiS7Nq/P9
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(107886003)(70586007)(316002)(47076005)(70206006)(83380400001)(36906005)(82740400003)(44832011)(54906003)(6916009)(4326008)(36860700001)(8676002)(6666004)(2616005)(186003)(4744005)(2906002)(356005)(7636003)(9786002)(8936002)(36756003)(426003)(7696005)(336012)(82310400003)(5660300002)(26005)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:59:20.2467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 068dc433-b909-4c77-6d1b-08d8fa8e200f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4908
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rename nr-outputs to xlnx,output.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v11:
new patch

 drivers/clk/clk-xlnx-clock-wizard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index ec377f0..1e0818e 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -480,7 +480,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	ret = of_property_read_u32(np, "nr-outputs", &nr_outputs);
+	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
 	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
 		ret = -EINVAL;
 		goto err_disable_clk;
-- 
2.1.1

