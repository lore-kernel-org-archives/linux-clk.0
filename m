Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103EEC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2CAB610CE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhINM7l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 08:59:41 -0400
Received: from mail-bn8nam11on2058.outbound.protection.outlook.com ([40.107.236.58]:44353
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233077AbhINM7k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 08:59:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHQc5LKDeaXNDRLmzbI8RxF7nbzGwhFWRqCpn3tq5qVyJqC+rvM6HvNpCf8RmWzt9B5vuRmqlFsdbkL6qoUYBXgdsVDH6aGxhocRLzQSillB+/CwqjonJQHHVefr8g1QPqW6m1BLXETIrLjNK3klRYldw4zFtx0teMrY8E4NWyyUBl6qtbpb7TJRxuaIMf435+mxJpwj3UXAMxgzqmyzY1p/4sJZ4YUxg2uJYcNmkytaXGxOokAm7b7qDsFX5anHXlcKKxBtl15/BahDdyYkWrvRCmkBg/QqBz7mle5tG/I80A2KOp2vlpl6tzi9tM2u4MnGOfZOZY+/A/0xzmkMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9XzR6Ua7w09eypLoCUZ6fkta7g6/r0HOfjvt+4t4iaE=;
 b=m2F1nzosV3wrKmQf00EyF2Xw94KLDCBSZUs5M1E9/MXJSi1MF5ktBGffzCWOBdO5XFwee/3rm9zQtyLt9j0kxsRnjKaZ8EIyHlWOoTT93SR7UJgIWocpY24sIQlhpU8Zzq9vmayqV7ZvO6M05oHk13ciLax/vndTBcft8VgxrXU9lfMhU0P/wydYH62W1EOAQzhMSE6ZZ39k3gPl5jF1eKKGGiSO06nIo1dD21+meTHLXm+GrppR+WF7mIQBLkyzpYUJDjvGdqjUNZjSHLPIvj+UNfp+D3s1ep2R/fLJLg854PP72a7A/3dsmVdGzaFXHqCN528w3xm3ATIpoMirQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XzR6Ua7w09eypLoCUZ6fkta7g6/r0HOfjvt+4t4iaE=;
 b=Of+IEVJzwsP9yPPPLOoK/Ob+O1F2ouwfPwNDpLOD9XtNPHtjDZmrlfZMj49RHbIFIkS2HP5quzMPnLZGpq023z5/22fuyJPQuW1kH475hjpFbx1fMq1/I6D9RhWL97NAj44Tvn2MfXIPl6SLqrGY29vE62dzILvCURqNHVaVIYs=
Received: from SA9P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::30)
 by CH0PR02MB7866.namprd02.prod.outlook.com (2603:10b6:610:ed::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:58:22 +0000
Received: from SN1NAM02FT0050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:25:cafe::2c) by SA9P221CA0025.outlook.office365.com
 (2603:10b6:806:25::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend
 Transport; Tue, 14 Sep 2021 12:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0050.mail.protection.outlook.com (10.97.5.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:58:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 05:58:08 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 05:58:08 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=36978 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mQ80l-0002I2-DH; Tue, 14 Sep 2021 05:58:07 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v13 3/5] clk: clocking-wizard: Rename nr-outputs to xlnx,nr-outputs
Date:   Tue, 14 Sep 2021 18:27:43 +0530
Message-ID: <9945464e90fa29c2008af182c87d055de8ac88fa.1631623906.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66575bed-eb2b-4baf-f12a-08d9777f54fc
X-MS-TrafficTypeDiagnostic: CH0PR02MB7866:
X-Microsoft-Antispam-PRVS: <CH0PR02MB78663D85E3490741775BFE96AADA9@CH0PR02MB7866.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 88cjX+tt8A09mlyi2lVd3I0abLn1bH4vRqHu3peXllq0Q+V7V/7XYKk2868l9WPGfU8jtj+wDkmPf3yPu1M757zc1xTHPgIbLko1WEe1YBwp9lyJgPGHse6on47wVOrDyjrtTA3YAN98BXnrPOFLXvbfb3bPxefdv02UXpDNXMv0Dp/vMGtv7pyO3nxE/6gsSsTm2zpHH8Bpv+mPRnrMU+Z2LYMgUr1ZeCguS8vM13QyRiYAECtWUGXDIqpTS/BlfE8OE7VZAaPHXag6sVyuMGCeDNVpnkMYan7Pt3AGZXXmpebr4ktBY4ulekPrPQBywV+z9hzmPC+lmWlPjfC9zcPiuSkE8s6MYeVd/dd3vfyFMhQxObzBvEZXk6LmdX6Uv9AwIaT+3eKtK4LekIe37/XeyftLYQqBqbqYX4TKRtGE7HWI4cpDbjKmvc6y71mqLNaMjjv09lYWN4Gj59voHGU4dnWebo3IZFBwS26P13oqppcQZduMGFuTVygaPg/iXNobFwgXjw0OsEa//U+rUu1ofHS8scoYiOBROdjytb2t5JJ0ELr94Sguq0PbHXAQ52KOsc4Uhf9jSt0mT51WKNij3z1G04V3AHMbKslAqz0YTTjZdpaa+OoN+nLP1PcO2VcLXGe9LLSeQz5wAlmRhi6Dp+zr9YDqkoEoVUCGuvnRIHy5qRKXYXlh2aYizF5k8YqyQVKomHCsrnKAjPe+x6BfwRV2GQnXLHoIcqpOhUw=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(107886003)(426003)(4326008)(356005)(7636003)(9786002)(8936002)(316002)(70206006)(26005)(36906005)(7696005)(82310400003)(82740400003)(336012)(36860700001)(36756003)(6916009)(5660300002)(83380400001)(6666004)(478600001)(8676002)(54906003)(2906002)(70586007)(47076005)(186003)(44832011)(2616005)(4744005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:58:21.8751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66575bed-eb2b-4baf-f12a-08d9777f54fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7866
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rename nr-outputs to xlnx,output.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
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
2.25.1

