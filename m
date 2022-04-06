Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDE3C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Apr 2022 13:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbiDFOBs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Apr 2022 10:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbiDFOB2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Apr 2022 10:01:28 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E9C33223D
        for <linux-clk@vger.kernel.org>; Wed,  6 Apr 2022 02:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6IoemwusoIrNIG1LaP4yO4JqYbFVc9VwHFsFZPbRzMo/yfrCo2DUsc6/P8rQyugNoReFymAaONgbmwSnDbHh0+L/tav7gTCX4l5p6hWy8rBmImMxKGZWj9RZOHf++k7O0fy8v4JN3gWm14WqOENMXKmMosvVidnlBGVMjCmN7tQvqegxsO8ZPWqijBVEilrpGWoMrueTh+jIJCLaOxHpw1uRJyrjhQcX492alvL7ZrF3VsZaOOHrEtjMfky0WmVlZZpWJTHkVsaOkDoOFMOnTM/xPhBviJ0TobTXONCNs+YZmfovK7pFcFTnQ07gIMSrkRkOMCx+HLtC+hwhH3QYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuPqTPhNdiN2Hj7I73BVK0048gAVoY/AvIIsV8kAxJY=;
 b=MDvNDBtOukTrV2ad2DdvsWAMrd3fr++6rhfQC49zsBoOZ619WC+DdaBcZ73SiVlHsbapzfqW3/SFYKrh2Ex2j3W76mz+GjgGV36ApXId25CbQoDJZDVopdijvnhB1Y1YJiOh0nPOxWQ0WDeEvzSa1afTsNJmet/8UDSCKpbf0V3XVTkrn6at/AGI5X2hvk2xB3vCUHgbsAamwXkAlMOxHJCPYu7asA1S1uEX8JgjDq0CI3ZnZ7bmXRDA6MMPZ4BsJFRC2Ak2xFw+S7aMVEO7sNcZsiPMAa6da0cJKlOtAh3ILU5HEnj2IAttX+e9B3dPzMMwvOuDbA3yuDEOUMbaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuPqTPhNdiN2Hj7I73BVK0048gAVoY/AvIIsV8kAxJY=;
 b=hKcM3VrFSBvp2hzqea9np1tQZbn/Jzxk563SpMPNqViAEDT+typHHRdwpG1WGtY3OVMN7egChA2/hXh1kPmpay52k+mfBUiLzNUgwSew6jnMJV2nwUpHwxppJ+owWxYYKc3fj12mkobNH7rKRNYFI9O5AK7n7NakXuMJ9y/ZPYg=
Received: from BN6PR1101CA0005.namprd11.prod.outlook.com
 (2603:10b6:405:4a::15) by BN7PR02MB5122.namprd02.prod.outlook.com
 (2603:10b6:408:2f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 09:22:16 +0000
Received: from BN1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::29) by BN6PR1101CA0005.outlook.office365.com
 (2603:10b6:405:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 09:22:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT041.mail.protection.outlook.com (10.13.2.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Wed, 6 Apr 2022 09:22:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Apr 2022 02:22:14 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Apr 2022 02:22:14 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org
Received: from [10.140.6.59] (port=53110 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nc1rh-000B27-Ma; Wed, 06 Apr 2022 02:22:14 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sboyd@kernel.org>, <michal.simek@xilinx.com>
Subject: [PATCH v2] clk: zynqmp: Check the return type  zynqmp_pm_query_data
Date:   Wed, 6 Apr 2022 14:52:11 +0530
Message-ID: <20220406092211.19017-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ad5e148-cf51-41c3-89b6-08da17aef137
X-MS-TrafficTypeDiagnostic: BN7PR02MB5122:EE_
X-Microsoft-Antispam-PRVS: <BN7PR02MB5122FC7D99C35F8FCAC81FA5AAE79@BN7PR02MB5122.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ICmqlYZIADccGae0ahlacVhMh2xd9cGRfI5MWhKyGa97mZr5x6lRZpa0J7ssuTmB6/zUQ5A3NMdXTI+CF/Zgk50i10Z+kXDOk/8264Oh72XUSNfxJRXvactZa1S+4mJLFrnaxABwl9xYgG+6HVASgyTNYVFYuRbAEph9vf5tk8olQKoWAjkxFPPnqv+0k092C19fws3dxhI08IJTePtH6e7y3Gs650HejQ5uvd/aeNEamYeGpJm1z/RcLy8LdZg9DTd6/Y8X8Y1er3NZos6gBfY5H67SXaKen8FUY1b9S8wNQckbgcLA+2QIcvdwFjKey4wDee/HqsqmStrLMPWjnI4jwzTekfnvNKfj1o7FSNhZN42eTIVbakIM8V5vAmbQ8Ti87iVz6c+VffYxcQvjaFKjmAbxW37mwgEdG3VfHQTXTCev3qSSdB/jd1IysAsj+GIyjGug76CbMeCOiqQlxINWDts/zqXRkJpUb0giTSQ5QcK0euI2mKx1SQ8xc/HPIpMu50/S4KPwQPREVVGc/cBODti3rEhENM4cBaLIR3BiM8FkotTX2Ek6/I+YmAu60itECu66H5T9uSG9FKs/64t4MWOG5caYTgDLL0xllDHRA342GWKQpdy1PlXGJNClckoD+LA21dtClQeMbTAOcEbzgdJYFPBpDDfK9FejCxBThFTHZ7qpje9eM+Xi5cpW9EgTq4Wqrj7Yq6y+hdiyw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(7636003)(82310400005)(107886003)(70586007)(7696005)(6666004)(36860700001)(70206006)(5660300002)(4326008)(36756003)(47076005)(83380400001)(8676002)(26005)(186003)(44832011)(8936002)(54906003)(336012)(426003)(1076003)(316002)(6916009)(2616005)(9786002)(40460700003)(508600001)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:22:16.2700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad5e148-cf51-41c3-89b6-08da17aef137
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5122
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Check the return type of zynqmp_pm_query_data(qdata, ret_payload);

Addresses-Coverity: Event check_return
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:
Update the documentation

 drivers/clk/zynqmp/clkc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 75d895be2d89..013464af0344 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -220,18 +220,22 @@ static int zynqmp_pm_clock_get_num_clocks(u32 *nclocks)
  * This function is used to get name of clock specified by given
  * clock ID.
  *
- * Return: Returns 0
+ * Return: 0 on success else error+reason
  */
 static int zynqmp_pm_clock_get_name(u32 clock_id,
 				    struct name_resp *response)
 {
 	struct zynqmp_pm_query_data qdata = {0};
 	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
 
 	qdata.qid = PM_QID_CLOCK_GET_NAME;
 	qdata.arg1 = clock_id;
 
-	zynqmp_pm_query_data(qdata, ret_payload);
+	ret = zynqmp_pm_query_data(qdata, ret_payload);
+	if (ret)
+		return ret;
+
 	memcpy(response, ret_payload, sizeof(*response));
 
 	return 0;
-- 
2.17.1

