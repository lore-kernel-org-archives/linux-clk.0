Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356F4C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Apr 2022 12:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiDFM6v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Apr 2022 08:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiDFM5Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Apr 2022 08:57:16 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::605])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF9B4D7832
        for <linux-clk@vger.kernel.org>; Wed,  6 Apr 2022 02:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGXEg5qJb60kfG6UbWBIIi+OulhGGQWK59QsoBXFg5MB8VxlTa9F2fZykFBEd4IsMlAn4hQ+i5icgFvttmIMiV0HItn4k7MkmU/bb7vPwCFyWrCsebZqsND2Mj+4dQlVPMODbYmBfOdZdSbB9Q9+jTCrlpjBDjFlCMpDjvfU4xGoTBmg66NlcxU1NBfnYYJ3pKOvRn5nqEyneFeb3IPzXh5n6JdTy1fsgZq23Q3XWLWhBxRzV4d3TZDnV0xBiMRSD1gNovSweDq2YKxJK68bI5rPRCk9GOtLiL6YLRvslb34fNoLvnaneOsIT9YuEbPJJ2aYEIoh/Fg6dph8JqHfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9HUuFC7y7K+SXxmW7Ghv+cgRlhQzK6d4W/n46Wp5vI=;
 b=oOFbmw+zKKqKkpv7BWRxrMoPSdQlv05RafCLtUcBfszcVczLpe2RW+pjPV+9IiXYXal45+mGjkmavytx8uEpyLX8BR3F4m5PKL7DKk4IAyyeMAz4iF00cSEzMnYjF0Ae4t2W/A/n/nEVk6gGg8mLiO34kMQJOgQocmEonuqH2An3a871HVTl/xM4R9XmWVAfDQ7OPcfi1i9bf1tnsYOH8YDbaMtXEKjwWRnJzIqM2vSYMJ3U51UxuIQxDtYSLxr+nBO8gOiNX8K4xCtgr6P6aXHUHaGzcvcoR1aDDM51KSoVfS28DOWqkSbaq+zeNM5fAuuwAeGJQSFFx9Deivv+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9HUuFC7y7K+SXxmW7Ghv+cgRlhQzK6d4W/n46Wp5vI=;
 b=nVy32Mn7lGFa4YsiUcx7Nsk05hhh9b7aqFfHa8vnQQ0N+vxpIYMVfv5Dl2dYx/YffM/dx45W4/Ln+CIQPnoa7KIPWN4UZFyo/dJK6lfxKRhC6d7tTB/rQDpVaOayPaJxCZgUvlXKSN6Dzc0eq8Wx4E4g98/hQY67XFBwJygB5ic=
Received: from SN4PR0401CA0026.namprd04.prod.outlook.com
 (2603:10b6:803:2a::12) by BN8PR02MB5987.namprd02.prod.outlook.com
 (2603:10b6:408:b4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 09:14:25 +0000
Received: from SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::ee) by SN4PR0401CA0026.outlook.office365.com
 (2603:10b6:803:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 09:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0035.mail.protection.outlook.com (10.97.4.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Wed, 6 Apr 2022 09:14:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Apr 2022 02:14:23 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Apr 2022 02:14:23 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org
Received: from [10.140.6.59] (port=53080 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nc1k6-000B5o-Rd; Wed, 06 Apr 2022 02:14:23 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@xilinx.com>, <shubhrajyoti.datta@xilinx.com>,
        <sboyd@kernel.org>, <michal.simek@xilinx.com>
Subject: [PATCH] clk: zynqmp: Check the return type  zynqmp_pm_query_data
Date:   Wed, 6 Apr 2022 14:44:15 +0530
Message-ID: <20220406091415.18109-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f243c795-4526-49a0-35a6-08da17add834
X-MS-TrafficTypeDiagnostic: BN8PR02MB5987:EE_
X-Microsoft-Antispam-PRVS: <BN8PR02MB5987C9A0D3D060507C82F562AAE79@BN8PR02MB5987.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a44/i8HYM6KEl7k9hqNT1cEO5QsbzSTne2Y1noBfWnoWOYsO1a4WBZijTGN61/8PN685Huh5HZzh13tDtasNpq6muwONIl9+FJqm0iyCVI0wYVF/LcWawDqB3ldqf4JSYOdd9UTryAXkVhndjvIiIBe9fwQjeJHv29VpdHb2fgS0veCKGVZW2+CtLmdsVH0ESJTngX8PjtC4TOgYxFLLE9Wdk+Hpllh7jbRZffWu/U2cS8rMtryCqtzemW7jtT/+98uiZPR3Hg0dK95JuewoK9YbEPRx74iDhomHUVJo3eZ/KNkzQeNmGM76VdCdIAgNWX0a8XwWtsFp0EHybHLAzyEiwIEFNp1EPDXzUBkhuFb+MTUDqy+lFYDTh0gkIFeys1anJckAuTUb25F7Ya0gnF+oeMHESjfHAg7owBPIBAoL7yMmEmZ+cqKeVnX7N0y4QlZG9vC+jhXAzmLt4YNY+3Yj4jZxVib1Tv5NKlUFZBXsLWCbHCEIEZrS9BzD7cXc5BRDAxGRxHmiDHSkVQDkaLYRZJ088wZXLgpOHriKeyYzH43Cj3+AioX2kRyjLvxf7Gk8CFb3IJiCdepSzd1bXdzSnu0a34sgJiTj1bz/BeBWPn03WvBTuA4iOaAeq+s/Ng1dAAJcusDB80ft/vr7TMH7EfYCe59phPHlkC09OkyQrcrW0F+qm0TUq03+mxKvyqjdT9gJQhZ4Te3VqVZtIQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(9786002)(2906002)(4744005)(1076003)(44832011)(8936002)(7696005)(8676002)(508600001)(186003)(4326008)(26005)(70206006)(36860700001)(2616005)(40460700003)(6666004)(107886003)(5660300002)(83380400001)(356005)(82310400005)(54906003)(7636003)(47076005)(36756003)(426003)(336012)(6916009)(316002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 09:14:24.9646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f243c795-4526-49a0-35a6-08da17add834
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5987
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Check the return type of zynqmp_pm_query_data(qdata, ret_payload);

Addresses-Coverity: Event check_return
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 75d895be2d89..8164939b3d18 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -227,11 +227,15 @@ static int zynqmp_pm_clock_get_name(u32 clock_id,
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

