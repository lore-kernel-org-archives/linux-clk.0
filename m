Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA60AC432BE
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF4F961051
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238267AbhHRHAU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:00:20 -0400
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com ([40.107.223.41]:26721
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238080AbhHRHAU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Aug 2021 03:00:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfZd8kMSkQcZS8IVmdXn+mcOhGH9UR5wn7NzxRaXjfKFL5EWB4OI/gkQGMa/y32M3FAslrSTDFUnUJibUj6ZbsfNiCaQO4eFhdr+L8BaqZVJ/9F/9aFirbOMIpAEp+2dtDtL7ZAYUhEsRwvhKcuuGU5NQcZ/xQ2ve0zk1IiU12qIA0cVPyj+X3zjwv96VWqFb/sMZ0AgvRqzE0OpuASv6tuqIfC8hyM8OEBm3lsNdbfgCQa0mrL1skWdjS4xSjzWlSj3BUrrfCAt2lcT2qfOabHuu0TVVHBjTCc9yUKrJfqEU5Y0MtUMUBM1Y0niqnDRXXAqsXIOqGWILvltSG9/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7Ww3GellYG/6YcU3UQehzqHHZ4UStaSmUMYZ61hD1s=;
 b=AdBQzgm3PnuB+G6lDYCwy8zh28EfaUqcENFoWR6Gac8qoLkYIB6Iydb0WQxoSS3tdkJ34b2SN0piav8FE2gdiNo36k6uWt4PIidIv9NKq0GFlvRmixAdV3qtlLyEeZIV4RTIM/88esl99cT59dWeABMpxuxlgL3/70l18vaFQdvb3h9ZdZy6NZiRBIZRICTfgJ2QnLBgblSZUdAtD5MKZPuF5na6m0KyIHHQoH4tM4yvNM9HHEDguTeHagyCoopJ4GmIpjbxC0VPnOdN7GzaamzYqeeRUM1s60OmiTOHeL0e72daoWzRAiSOdud7pxEPW9E3/oWrvgc1ZLwApHgmxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7Ww3GellYG/6YcU3UQehzqHHZ4UStaSmUMYZ61hD1s=;
 b=WfwWT8uQJKUUQDqZEKnNdq/E8BQy7Uli8tjjs3T2WPVI8T/soJ2gT/oLYYGVajAtY/7K6gtN1Of4XVMeNifSLDaJmef/0aHteugzRMJrceH2ZRegxFlBuch22u8J7Fab9QQX35oeRGyiqNXi+lBpKMTLjKA6Mln4zNTXMhvqQqk=
Received: from SA0PR12CA0021.namprd12.prod.outlook.com (2603:10b6:806:6f::26)
 by SJ0PR02MB7648.namprd02.prod.outlook.com (2603:10b6:a03:327::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 18 Aug
 2021 06:59:44 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6f:cafe::7d) by SA0PR12CA0021.outlook.office365.com
 (2603:10b6:806:6f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 06:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 06:59:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 Aug 2021 23:59:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 Aug 2021 23:59:43 -0700
Envelope-to: linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=53032 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mGFY5-000GPx-On; Tue, 17 Aug 2021 23:59:42 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <michal.simek@xilinx.com>, <git-dev@xilinx.com>,
        Ian Nam <young.kwan.nam@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 3/3] clk: zynqmp: Fix stack-out-of-bounds in strncpy`
Date:   Wed, 18 Aug 2021 12:29:29 +0530
Message-ID: <20210818065929.12835-4-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com>
References: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 390cea75-8fc0-4cd0-41cd-08d96215c222
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7648:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB764877329DCBF5D1142CAA36AAFF9@SJ0PR02MB7648.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dl+tS2XzwMFkUt3t6mfF0GVq60+oWU1iPdc4B+ZEPM9rBHXhw6+xdboKUM2vnT3zFPl3Rp9LUEAkenJPAjA8iQscKBMpTvFkym0TAC7tbmhmnPwB2dIyFO5XxtZ/bm1VogcI76qE8H6EkMkHCfUxG+k1/piJhIoAvXqrNEdKlLC5b776qyyNzE5dhQ72tXt4uaZcbxEZFo96F3ReCHtF58rrhYor8Lmpm6FwFZd8kH1YaT7wtx4J3mHF7bIL4q/jJE80xm+aZ+3F/J1/uaxh9zSmjKi2ql27eZ4mWi8UC356hiNxOfqypuClbVQNPo7LXsGp55oP/gUPWP8iq3mlcjpR6qG9PVC8inLYRalVqDNiRkbJgtIVt82lSTWw4x+Qm21CTWklAvViQAY1WU5mEhv/6f0tCK8TtyWujWnWQnNsDn4Pdoazh8mcxXbIeREsIYBMUnlhaj+bnGhkMT5wk9wzTiQTvNFykTRCusaytRGEQaKcYaPY0vRTN80bOIIQAMeb4Es1ygVnLI54McbWCsRs3LwfAbrWh1MbA1mWk444R8ST4xVNJvBo5QAqkL1i+Fu/1vBKbVyoyQaqGLtgZEXDsx30DpBpFcBNiRalpdUN5HNAJ0Z5YXyvwXSjm9iYbfbVMOrvMoYU4wXHCBhYL9NvMZvfruRNuW1JAPfyehJQif3WQ2Bm0D9m5mrbF0DIOWwjhyz6oWyrrE2rQGio7FwxzK4aowXbEIFtv6jtyXObY61iBdmrRlLMP7GFPBkFvMhc5UQePEEkB5vPkI4lVXbgcAPc2uO8OiQIpmBOUAs=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(83380400001)(36906005)(82740400003)(2906002)(478600001)(1076003)(8676002)(8936002)(7696005)(7636003)(26005)(54906003)(6666004)(426003)(47076005)(5660300002)(6916009)(316002)(9786002)(82310400003)(70206006)(70586007)(336012)(356005)(107886003)(4326008)(2616005)(44832011)(36756003)(36860700001)(186003)(102446001)(81973001)(505234006);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 06:59:43.9676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 390cea75-8fc0-4cd0-41cd-08d96215c222
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7648
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Ian Nam <young.kwan.nam@xilinx.com>

"BUG: KASAN: stack-out-of-bounds in strncpy+0x30/0x68"

Linux-ATF interface is using 16 bytes of SMC payload. In case clock name is
longer than 15 bytes, string terminated NULL character will not be received
by Linux. Add explicit NULL character at last byte to fix issues when clock
name is longer.

This fixes below bug reported by KASAN:

[    7.522474] ==================================================================
[    7.529795] BUG: KASAN: stack-out-of-bounds in strncpy+0x30/0x68
[    7.535871] Read of size 1 at addr ffff0008c89a7410 by task swapper/0/1
[    7.542557]
[    7.544065] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.4.0-00396-g81ef9e7-dirty #3
[    7.551809] Hardware name: Xilinx Versal vck190 Eval board revA (QSPI) (DT)
[    7.558847] Call trace:
[    7.561321]  dump_backtrace+0x0/0x1e8
[    7.565023]  show_stack+0x14/0x20
[    7.568374]  dump_stack+0xd4/0x108
[    7.571817]  print_address_description.isra.0+0xbc/0x37c
[    7.577189]  __kasan_report+0x144/0x198
[    7.581068]  kasan_report+0xc/0x18
[    7.584507]  __asan_load1+0x5c/0x68
[    7.588032]  strncpy+0x30/0x68
[    7.591120]  zynqmp_clock_probe+0x238/0x7b8
[    7.595350]  platform_drv_probe+0x6c/0xc8
[    7.599405]  really_probe+0x14c/0x418
[    7.603108]  driver_probe_device+0x74/0x130
[    7.607339]  __device_attach_driver+0xc4/0xe8
[    7.611744]  bus_for_each_drv+0xec/0x150
[    7.615711]  __device_attach+0x160/0x1d8
[    7.619678]  device_initial_probe+0x10/0x18
[    7.623907]  bus_probe_device+0xe0/0xf0
[    7.627785]  device_add+0x528/0x950
[    7.631312]  of_device_add+0x5c/0x80
[    7.634926]  of_platform_device_create_pdata+0x120/0x168
[    7.640299]  of_platform_bus_create+0x244/0x4e0
[    7.644880]  of_platform_populate+0x50/0xe8
[    7.649110]  zynqmp_firmware_probe+0x370/0x3a8
[    7.653602]  platform_drv_probe+0x6c/0xc8
[    7.657656]  really_probe+0x14c/0x418
[    7.661359]  driver_probe_device+0x74/0x130
[    7.665589]  device_driver_attach+0x94/0xa0
[    7.669820]  __driver_attach+0x70/0x108
[    7.673698]  bus_for_each_dev+0xe4/0x158
[    7.677664]  driver_attach+0x30/0x40
[    7.681278]  bus_add_driver+0x21c/0x2b8
[    7.685157]  driver_register+0xbc/0x1d0
[    7.689035]  __platform_driver_register+0x7c/0x88
[    7.693793]  zynqmp_firmware_driver_init+0x1c/0x24
[    7.698637]  do_one_initcall+0xa4/0x234
[    7.702518]  kernel_init_freeable+0x1b0/0x24c
[    7.706924]  kernel_init+0x10/0x110
[    7.710450]  ret_from_fork+0x10/0x18
[    7.714058]
[    7.715559] The buggy address belongs to the page:
[    7.720405] page:ffff0008f9be1c88 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0
[    7.728772] raw: 0008d00000000000 ffff0008f9be1c90 ffff0008f9be1c90 0000000000000000
[    7.736606] raw: 0000000000000000 0000000000000000 00000000ffffffff
[    7.742942] page dumped because: kasan: bad access detected
[    7.748572]
[    7.750076] addr ffff0008c89a7410 is located in stack of task swapper/0/1 at offset 112 in frame:
[    7.759052]  zynqmp_clock_probe+0x0/0x7b8
[    7.763103]
[    7.764604] this frame has 3 objects:
[    7.768306]  [32, 44) 'response'
[    7.768312]  [64, 80) 'ret_payload'
[    7.771573]  [96, 112) 'name'
[    7.775095]
[    7.779585] Memory state around the buggy address:
[    7.784430]  ffff0008c89a7300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.791735]  ffff0008c89a7380: 00 00 00 00 f1 f1 f1 f1 00 04 f2 f2 00 00 f2 f2
[    7.799040] >ffff0008c89a7400: 00 00 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
[    7.806342]                          ^
[    7.810132]  ffff0008c89a7480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.817437]  ffff0008c89a7500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.824738] ==================================================================

Signed-off-by: Ian Nam <young.kwan.nam@xilinx.com>
Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index eb25303eefed..2c9da6623b84 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -710,6 +710,13 @@ static void zynqmp_get_clock_info(void)
 				  FIELD_PREP(CLK_ATTR_NODE_INDEX, i);
 
 		zynqmp_pm_clock_get_name(clock[i].clk_id, &name);
+
+		/*
+		 * Terminate with NULL character in case name provided by firmware
+		 * is longer and truncated due to size limit.
+		 */
+		name.name[sizeof(name.name) - 1] = '\0';
+
 		if (!strcmp(name.name, RESERVED_CLK_NAME))
 			continue;
 		strncpy(clock[i].clk_name, name.name, MAX_NAME_LEN);
-- 
2.17.1

