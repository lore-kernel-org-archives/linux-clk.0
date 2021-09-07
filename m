Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B206CC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 09:10:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CBCD610FF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Sep 2021 09:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244950AbhIGJLb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Sep 2021 05:11:31 -0400
Received: from mail-bn8nam08on2042.outbound.protection.outlook.com ([40.107.100.42]:60320
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243766AbhIGJLb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 7 Sep 2021 05:11:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnDb7c1tGFvIjOdTppneNWL5kWR8guaO23RQZNHRRfq9iPRiTvQ4p5A2daOSKKo6gV3JQRaC6kYGcsoaPEFyLyfD5t25wQv1fsw7Mz7pCwRNCklR8b8cVA8UttP1RXtL6YwgWmLhfroOqRUMfJpntRmzlDlUHccy2DkHj0acz/wa04q1RgITJ8xM/lKXo2BqgivMUsMjwPtYgajOKDwKKe3DglkHXXixbjKM0WRQZVICK2emyzz/UoHD7A12uzIU5I4hrvTmWS8ISsPayoQjXvtVfkH1M2RwNHiP1Plp6teJsvWeOwft0pNEe2bBBfIoct8aG9hryFgHLY/rNv3WGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OuOxIb4/0uRj+vWNveCoiE416qb3NVvMKQq87sLW5a8=;
 b=GZb9bQCT7/lcP3o3aU6eU50LPTKquinZikmjrJPGBcGHwVoRCCGVRk1HgGaAxHMXcI+UN3A/8XsmiVDU7Sbf2Wfe8+63oRRHqgV2WIg5fJfYJ2H9uQO+P3n+SFETX8BD8woN+25Wy/4J1OyvcTFgHtrqIj3u/35giNu07tBqYP+KQ8r2nxhhKwTgu7nqHoQoM0Ka2fgTtbNEjOC7OgGGIxxDCnwSH9c3X6Xx3rx9ZDpRI2veOIKxrkPm5oQbHg9WNXSP2m1XS86lT0AIoMRXWHchEiAefMkm6uO+N9VzUvCu2bi3xuj5Go9OuZc5cOvHkYs0FELkKw7zyiN/1ntrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuOxIb4/0uRj+vWNveCoiE416qb3NVvMKQq87sLW5a8=;
 b=FOC75HTd6tp0aPDuF5GSgx7dKAjA6+n9Pi2SIDemBK7wWuQ/NGSCbUJWIcsYABsZ31VPyQ5ij88wWZmJtActscpO5VIz3DvZMpmtoE7kHtFlXOrIsGbOWe8Yy9bGQFO0DyNRLQcUamFo0MmAZRJvz4WurMi2tg4CJQP9hB6aGes=
Received: from SA9PR11CA0017.namprd11.prod.outlook.com (2603:10b6:806:6e::22)
 by DM6PR02MB3931.namprd02.prod.outlook.com (2603:10b6:5:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 09:10:23 +0000
Received: from SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::8a) by SA9PR11CA0017.outlook.office365.com
 (2603:10b6:806:6e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 7 Sep 2021 09:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0049.mail.protection.outlook.com (10.97.5.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 09:10:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Sep 2021 02:10:23 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Sep 2021 02:10:23 -0700
Envelope-to: linux-clk@vger.kernel.org,
 sboyd@kernel.org
Received: from [10.140.6.18] (port=36662 helo=xhdlakshmis40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mNX6Y-000GH2-9W; Tue, 07 Sep 2021 02:09:22 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git-dev@xilinx.com>, <michal.simek@xilinx.com>, <sboyd@kernel.org>
Subject: [PATCH] clk: zynqmp: Replaced strncpy() with strscpy()
Date:   Tue, 7 Sep 2021 14:39:20 +0530
Message-ID: <20210907090920.2620-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eef51975-4069-43c5-cae4-08d971df532b
X-MS-TrafficTypeDiagnostic: DM6PR02MB3931:
X-Microsoft-Antispam-PRVS: <DM6PR02MB39314C401A963BBDB74950AAAAD39@DM6PR02MB3931.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:225;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02u8gD09nLlrg02U3lHTriXhlJYg7kJQ5pUm8C1TIcZ/hS1jth771fftDESKYNzt+9rT/4K0SWF9PNbQOKmxgwKkFpB86mQx8AOdko9n+0X3X3U3Mx8RS257nayQTYFPIObm4NDcsd4BLa1QTyi7EdBXyV1qGJm2PgstWwv0jhH6BfpnS7oMai+SqERqSplW5eHoSvMx0dygxvJCM7ox/qFXwI5SW2m8bdECYUQjjz8dw/kg93X1u1gFd5VDPRSe9RNo3xtWPLr9MpgRZMzNQ1wJlZfnoH429bd/oTuj5m/lmEO2z7UTEsioRhjwkcQrKFqkEWoAhRlwYjtEh9ZDMqtcLxgbVMBWKXUyhNKFst3mxKVMrz/tbE0m7G2FNQskTbJdQx5+gFxV1AQaI7PAa30OIoEJs+9TE8nYw47zyfp3nPVo3OvTuBONLfVAuHQqaPA0xH3VDS4oBDc9cXLYdwYip2hMmZDv6aN7ahWk/W3nobiZvtB437wrp2D67KTON97v6R9uX7EEGVVOfEyECs5R9t0BveOCLblcDADtkC1TRE0TQhZrSDbrElUW8r/gVOK+Y3bzDMkkKNijQNo3F3fnD4hxDZbdrMiPC1TOGPcv4WDWhCxjZv5WL1kxOpZVlh7ZaXI8skeBC7uApGYB1lbX20vDGC6bK6x9zoQYI94h6X3+zh/Czoy0SKI03jp2ZGZJh4q5sqejlJddf9NVQQJvoSAmIAb9Yw0F9XbA0wM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(7696005)(7636003)(356005)(1076003)(8676002)(8936002)(5660300002)(426003)(36860700001)(54906003)(2906002)(508600001)(44832011)(186003)(336012)(47076005)(26005)(82310400003)(9786002)(4744005)(36906005)(6916009)(70586007)(83380400001)(4326008)(2616005)(316002)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:10:23.5860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eef51975-4069-43c5-cae4-08d971df532b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3931
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replaced strncpy() with strscpy() as the clock names are supposed to
be NULL terminated.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index eb25303eefed..40fbd2517016 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -163,7 +163,7 @@ static int zynqmp_get_clock_name(u32 clk_id, char *clk_name)
 
 	ret = zynqmp_is_valid_clock(clk_id);
 	if (ret == 1) {
-		strncpy(clk_name, clock[clk_id].clk_name, MAX_NAME_LEN);
+		strscpy(clk_name, clock[clk_id].clk_name, MAX_NAME_LEN);
 		return 0;
 	}
 
@@ -712,7 +712,7 @@ static void zynqmp_get_clock_info(void)
 		zynqmp_pm_clock_get_name(clock[i].clk_id, &name);
 		if (!strcmp(name.name, RESERVED_CLK_NAME))
 			continue;
-		strncpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
+		strscpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
 	}
 
 	/* Get topology of all clock */
-- 
2.17.1

