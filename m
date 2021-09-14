Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF16C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F9BD610CE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 12:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhINM7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 08:59:54 -0400
Received: from mail-sn1anam02on2085.outbound.protection.outlook.com ([40.107.96.85]:43224
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233077AbhINM7u (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 08:59:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmbE4LQ1dEsjzkXCx/Oczv5/TznYLee7xdU9rTQ4GO83cfkyI5q73QkOrkogCekDsO5zovnCBx2hZx0/J9hdgYcfBitRUdxQ2ohjPbqatxApc/EupSKnD1BbZLRZH07zBcw1mfLkmYjgRuEcSYrUS8uagwHzZ9qwiyxCVGl0Dhn1XKj95arcjrSig260yVigMmpwhmDr9df9K40IZPZLPvJpxu4rSghKLdu+ckuoP/fxKGhcD1QIAMcCn0bfg0jqrn+K4tG4FMxaWCRkm8QDnOBr9mCVn57735lit6BAVlNCHIuqvbcblR1QOoG8ypNGhXEPoMakouUYyfgopj5ccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xQskUB6SHWMFiYw7pIOknn6J2u3s1mXiKy21nBY0mPY=;
 b=NdXCsJVfFbZg+pAQXBzb9Gws1jNuuEU2nChUJecVD9v7byjMjjROQpOuZm/WHxx2/+27LDjz1OOrVmE20P0VG2F2iA8rZ0ydiMnJn5sRqCvIVcvK72m2Q6JqThPUI7ejASwPN0ROwTEQGl1JilZWhPofkZOntbvdQnIFbw/xl5nuZM0UgYvhx/cSyhgzWPESvg2912M1dLbH4jg9TkMXSoXaerkKQOz2fjYwcl1ojBVp+HIg91FmqmCC00pPhi23RtFg8V49CnwI4B1gYoTvBGvM/ckdCUSOhLD9XdOs38t0eYj29Qk9AFYuxbaGQvjL2TPn4sk1jAX+2hVllYMJug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQskUB6SHWMFiYw7pIOknn6J2u3s1mXiKy21nBY0mPY=;
 b=nIAP67J0wqLlOQVh5V0nV+ZEoVgt2pzd7t02leDzjOgW4CFi9TVsrNSlFMfhRHtDYFOUKdN1QSv5vJAveT28Q2coE+5qrp0GyW2YB+9PWeHeAHBLFvMZ38ZBFneYZBhnZLODzqI06AmAUtzOzVTP9zy/grsihiD1nYdKKSPqTJI=
Received: from SA9PR13CA0100.namprd13.prod.outlook.com (2603:10b6:806:24::15)
 by DM6PR02MB4889.namprd02.prod.outlook.com (2603:10b6:5:fb::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 12:58:32 +0000
Received: from SN1NAM02FT0009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:24:cafe::c0) by SA9PR13CA0100.outlook.office365.com
 (2603:10b6:806:24::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.9 via Frontend
 Transport; Tue, 14 Sep 2021 12:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0009.mail.protection.outlook.com (10.97.4.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:58:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 05:58:19 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 05:58:19 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=36978 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mQ80v-0002I2-NS; Tue, 14 Sep 2021 05:58:18 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v13 5/5] clk: clocking-wizard: Update the compatible
Date:   Tue, 14 Sep 2021 18:27:45 +0530
Message-ID: <0ab0e49385d7f7a1cece9bb3ba2c23944d5dbc67.1631623906.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b662a00-8d8e-4102-c861-08d9777f5b17
X-MS-TrafficTypeDiagnostic: DM6PR02MB4889:
X-Microsoft-Antispam-PRVS: <DM6PR02MB48895F6E245038EA046B67B7AADA9@DM6PR02MB4889.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G5XRlHCmCg49LfsyOzgGMQllEOYUdr4CM7WfISXOxHAlVt8eyfEoRLnggv2YZH1JYDE+jgihNCm90cd9nt1Mpet2gk98pv+Yoa13VHjpvKMf8uNmBuX7Zhbm09V5m+PZUG1NWzZivCRuyyfa8T+VPZUj2/xs++Lbk+GmnvNFytTTb+v0ckqJi9EDQe7apbpi4vZwSAxKG+2AkIpKHeR92GCGw/PtB5QmAf7DyrYPUaT7O9LzILL8FLNxb/oUsivLwAgfgcBAEl1MLg3BTXlk20BZq/Xw22z3Zg0jph2u1SI+KKsHUsOMeac+JMWwc+QF+6CrbpkP+qPuO9gS2MgWXhJB/xx4gxr5O39eL960q19pNw0eciWN3GTaQ3IfydB9A/+phv1HFIsTuuh4XRVl8bIbLuUnBw7nMcLD8Ngq3nBidRE9LrAj3FSSDQ2TxnITjXbjxuLEsiXKq46b4XWwAbhSA/T7oMLad5FnEkHY2GKHihFCqxKYMYD9XUOb1b4K3xlFaQY3RSvA4CaoMEtEdMYNIcWp1mmimZrr3s5xvMcoFUL+lzrLigugJBezxspoUeCQAreiod3Y7JGI+k1nSTJj26LMiGZ1qYCqW2hSUspnXJnmW31P/3iapaId6P7M67D17H7tN0IRBREny9+yy9/CYLZLjkZLaZ+7sVV8Wj0V7oqaVZetYKjtGs48voS79WvI1tUIyt/5c2VKUotsXYcqtXnaumUn5sdSGS/2crA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(7636003)(356005)(82740400003)(44832011)(4744005)(83380400001)(82310400003)(426003)(186003)(7696005)(5660300002)(36906005)(6666004)(8676002)(36756003)(2616005)(70586007)(70206006)(54906003)(9786002)(478600001)(8936002)(107886003)(47076005)(2906002)(316002)(26005)(6916009)(15650500001)(36860700001)(4326008)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:58:32.1663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b662a00-8d8e-4102-c861-08d9777f5b17
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4889
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the compatible to indicate support for both 5.2 and 6.0

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/clk-xlnx-clock-wizard.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 61c40e06e381..5b8433468cc5 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -621,6 +621,8 @@ static int clk_wzrd_remove(struct platform_device *pdev)
 
 static const struct of_device_id clk_wzrd_ids[] = {
 	{ .compatible = "xlnx,clocking-wizard" },
+	{ .compatible = "xlnx,clocking-wizard-v5.2" },
+	{ .compatible = "xlnx,clocking-wizard-v6.0" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
-- 
2.25.1

