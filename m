Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1363CC432BE
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E82216056C
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbhHJH02 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 03:26:28 -0400
Received: from mail-sn1anam02on2065.outbound.protection.outlook.com ([40.107.96.65]:34041
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232989AbhHJH0Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Aug 2021 03:26:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHB867UiEuDsbm+Ms1FMLODKCi8VzqMVD/K0r3s4PwjnxSPVAUF8qe0CkvdLs2nJFLYRl0+UusLIIJd4YhaN11QG0Ov3EBM49lgCNrBR4su7MmzTSUU52OK3deg9Ptqqx41H9YI+UX3sTVNCkIQAGs08UgS1NGx4MMLWWPaZQJDuHEY4KW04AmPXpjgV+zGxxEsMZuZgDNJTXtpoXtvnRift+HrbOZjEHCvj+pyOqvQIKplsClnQpD6/8GxswRMN5wXkrscQAFy9G5jkdYQa6snTE4Rn0M9bBvmXaOAAyM/9a3HB8x0cWN3VNyV5MoYqnPO+t+QwxLxNNojg6Mvb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu48REjFWJ6aQvmq/Vsp2z1kteB1JhnJBT1PZ6IE5PI=;
 b=M0+c7hEdmivyySQEhNqsGOyorVLlYc9pGdPqT7yhFzeCm7LPDioZvguQFvCcZYpPNlLgo35QV5/qQNHkz5FjwnM+BvSpK6QnID4kTL/gRskGDZFb+xubWq7I216mE85Oveke+1ZPSgQhyB/NYDQ8mDMYwNSeCW4auKSp0iW1aJ0Qr4Q4xQxZUzUhmGfMmURmrRrPC+LzS+6pfTakFO0p38Q1uvbT/4O0yzkDhBsAQzvSz7fbaqxsfJk8e5zq+aghpu4HIByzYMvLTphao9D+1Va4AMNS3fMpRIGVf6bQVPHB15TkaFeH39HYX1eIAIdf1tTZErHm4+GxjZHczW9Vyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu48REjFWJ6aQvmq/Vsp2z1kteB1JhnJBT1PZ6IE5PI=;
 b=AYBlxvLrGClLlFAlrqmDeEMrSLUAqZ65fmGPli8CQpr/Q321iQAu1HpQ2RYp5SB2S8gYuhQPd9a46hxQVfXCs/4ETBWfioZkBb+SJeOgQLDR3R671W+q7jgN9B5qQt2b6IkjiO6MYQVd3TLZ+NWmbDMCqxQ4VrF2oKq8QJlL/bM=
Received: from DM5PR07CA0058.namprd07.prod.outlook.com (2603:10b6:4:ad::23) by
 DM5PR02MB2796.namprd02.prod.outlook.com (2603:10b6:3:108::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17; Tue, 10 Aug 2021 07:25:58 +0000
Received: from DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::76) by DM5PR07CA0058.outlook.office365.com
 (2603:10b6:4:ad::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Tue, 10 Aug 2021 07:25:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT035.mail.protection.outlook.com (10.13.4.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 07:25:57 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 00:25:44 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 10 Aug 2021 00:25:44 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=48216 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mDM8t-0005zG-Fu; Tue, 10 Aug 2021 00:25:43 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v12 3/5] clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
Date:   Tue, 10 Aug 2021 12:55:31 +0530
Message-ID: <20210810072533.27620-4-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6fb1ed8-8a90-4437-b8ff-08d95bd018fd
X-MS-TrafficTypeDiagnostic: DM5PR02MB2796:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2796F88266707AF3EB9F4363AAF79@DM5PR02MB2796.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWFRsKPCcxNWLgbWEcMCM3D69scXB/QeROkp+4C2t9o4I8BFZcES7m7UQzrxgcB8CwI7t84tHN887j/NM8T92DWNWcJrEEHUIuIqQY9PLvcZxsqZGA5nSpDPcZgUNVLWa318Se3TDGq2NepstqRJZpZ1bGWW3ZgGZWj0jRqecBTSyiitf4YmHQGLnhmoHZMcpuBkffyuRWQlODKsvmhXxwvAqisVld6TnM3CAhZMKopInozdeIDumAq5NI30FvZ9uwiY/fZ9SBAffKtnhlJ0zunDqfOQFbSt79or4qK5o2PyhfUIbZkrk4dI8y3uBsLLa14Z+FeDVqirrAb+vhwuqUgZnw0mIpoadnZsbQDfldAk75tku0/2f2jXEDFJXBu2wMKVG8/QF7E3oK+GH11IkwnCLZSeeb4ZNU0wzlDjgczIHQyIqzwUspdOGdFbvfQX5o25xlQNMWNQdRAS3BaLTLr+8rnMLSnk7Vg6KgSxXnM61ugclAv420c6AEWhvq6Sit5X9cf2CnINHu9KfVuAdkXeRPFTMnsXZOHZWtt46I2yt78cCRZg2EhdfQyGZPzDWWBU/7xWIj+0tIGAMUUI19o7yNSdGbPukbhXDwAp1Y/oH6S/z0eCsKxAhRRNxV855onhd9a6uLgDnCaz8QUczNwuN7RpC+u7ZdKl9rZgvqqUtK5utfQjYfU98EFVujoi6xgOaisFLRXyttTPxJUohCwTof5M337344CSiZCydzw=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(46966006)(478600001)(4326008)(2616005)(1076003)(7636003)(26005)(83380400001)(107886003)(82310400003)(426003)(5660300002)(4744005)(82740400003)(356005)(36860700001)(186003)(47076005)(6666004)(9786002)(8936002)(70206006)(70586007)(6636002)(316002)(54906003)(36906005)(2906002)(110136005)(8676002)(36756003)(44832011)(7696005)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:25:57.9342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fb1ed8-8a90-4437-b8ff-08d95bd018fd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2796
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rename nr-outputs to xlnx,output.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v11:
new patch
v12:
No change

 drivers/clk/clk-xlnx-clock-wizard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index ec377f0d569b..1e0818eb0435 100644
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
2.17.1

