Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC29C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 05:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3F4B20896
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 05:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfCYFFG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 01:05:06 -0400
Received: from mail-eopbgr690067.outbound.protection.outlook.com ([40.107.69.67]:21897
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726101AbfCYFFG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Mar 2019 01:05:06 -0400
Received: from MWHPR0201CA0036.namprd02.prod.outlook.com
 (2603:10b6:301:74::49) by SN6PR02MB4845.namprd02.prod.outlook.com
 (2603:10b6:805:98::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1730.18; Mon, 25 Mar
 2019 05:05:04 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by MWHPR0201CA0036.outlook.office365.com
 (2603:10b6:301:74::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1730.16 via Frontend
 Transport; Mon, 25 Mar 2019 05:05:04 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.100)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.100 as permitted sender)
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1730.9
 via Frontend Transport; Mon, 25 Mar 2019 05:05:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:57679 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1h8HiY-0008EQ-FG; Sun, 24 Mar 2019 22:00:14 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1h8HiS-0005Tg-OA; Sun, 24 Mar 2019 22:00:08 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x2P501ID030557;
        Sun, 24 Mar 2019 22:00:02 -0700
Received: from [172.23.37.106] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1h8HiK-00059e-P2; Sun, 24 Mar 2019 22:00:01 -0700
From:   <shubhrajyoti.datta@gmail.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] clk: clk-fixed-factor: Return EPROBE_DEFER to wait for dependent drivers
Date:   Mon, 25 Mar 2019 10:29:57 +0530
Message-ID: <1553489997-1495-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--1.034-7.0-31-1
X-imss-scan-details: No--1.034-7.0-31-1;No--1.034-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131979639041303643;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(199004)(189003)(316002)(48376002)(16586007)(4744005)(63266004)(356004)(36756003)(6666004)(82202003)(9786002)(105596002)(77096007)(106466001)(2906002)(81166006)(81156014)(54906003)(6916009)(2351001)(50466002)(2876002)(8676002)(26005)(8936002)(5660300002)(47776003)(476003)(50226002)(73972006)(51416003)(86362001)(14444005)(426003)(76482006)(61266001)(305945005)(86152003)(2616005)(83322999)(126002)(498600001)(73392003)(336012)(107886003)(87572001)(55446002)(4326008)(486006)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB4845;H:xsj-pvapsmtpgw02;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 501daf87-17ab-4e91-f32a-08d6b0df7115
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(5600127)(711020)(4605104)(2017052603328);SRVR:SN6PR02MB4845;
X-MS-TrafficTypeDiagnostic: SN6PR02MB4845:
X-Microsoft-Antispam-PRVS: <SN6PR02MB484594FA187799D695F4FCD0875E0@SN6PR02MB4845.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0987ACA2E2
X-Microsoft-Antispam-Message-Info: pYUK0EDVxS0iII6RogALGIAjii0/3UyQvN0uqKSl54JTveT0XTln1LTO99CQQHsURSvYV25o1bGT6FGudt75eYxL9j1XsyU9zfvqyXP07CtwFmBY11YVOsEr3epNoKNq6ARX3DoEFiBb4XeqMELcRtMjUlLsnv5a9RVG0k8Ta40sUgC0ZY9amnyE6oX/eFhdgN0suYWJkHtWDeNQ7r3K+c/qzkNq1CET3mtY5SE2N2ne5GQ/7M3eLFC4HMUHhEF8ul0HvnXQa9edZd7mlopALh1LLdGpFuhRSWpBK2bvn6USkMWchkLV3l1PdYEQ1cJ3+vcqcLZqSIcGHAmFwKr9C8IaTtEz5Hwzb1IRyGffdFW6RuZVSiS3NsuPkqw3jJNVmYOW3tElWDu1AYUX21N/WdwMAw/E4beReY6AHbCrVIM=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2019 05:05:03.9702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 501daf87-17ab-4e91-f32a-08d6b0df7115
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4845
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

In case the provider clock is not yet proved the fixed factor does not
find the name of the input clock and it returns ENOMEM.
Let's return DEFER in such cases.

Fixes a boot failure on zynqmp.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
The other option is to provide the name is the output-clocks

 drivers/clk/clk-fixed-factor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 241b3f8..a3ea6b8 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -221,7 +221,7 @@ static int of_fixed_factor_clk_probe(struct platform_device *pdev)
 	 */
 	clk = _of_fixed_factor_clk_setup(pdev->dev.of_node);
 	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+		return -EPROBE_DEFER;
 
 	platform_set_drvdata(pdev, clk);
 
-- 
2.1.1

