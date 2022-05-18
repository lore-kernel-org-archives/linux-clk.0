Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC75EC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 05:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiERFx0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 01:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiERFxY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 01:53:24 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2042.outbound.protection.outlook.com [40.107.101.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EFE4553E
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 22:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy3+De8AC6G2AbKPKU5t67JkQ0rsi8gnQaYO7pTbP3f97VLvlwutzUD7Y1mpPRpXhXqTYwHE1cvV6cECBpSTBiC9Sp2bRr1UIUgKvfpKbL9uHwJnXnJk6OB5t8xfORQ9wS0+S9mlROy7nnRqhn8/yBWmsNQMT0B7/gpVHkax6Uw8bJwSFsJ1ByGGfU8xFagcp41lRa7nWp96cJfYPWpq0EHn25ReOQ/o0auI7kQOfYHMtXlkhH4Cjy2BBC4a31I1wX8SGZIr8fJofU+krpXJIi0wGPz8+hldhCYCKBEz+xkBd85DHc0mZmjIr05IKSWbVBFky2pSzeHBUI5lo6FqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOw0JqXR6m4XZ7EXiILZRSbLyHhqm/YWC6X+qAlS+D4=;
 b=UpiuNpaICtpEehRHmX5qPCVXv2GKTk/rsookSajTsOjGk9B8ZRPfoYI9Bz3Q/AEckWR3g7FAECAkjhPX/twCMz/XgumhNj70daoxknuM0WaBEzuHse7JHwshkumJEDCDElH1IOITM8dVZNYGnlrZRLQE8Rvd0m0aZ5YCdsecit3STNikLqllHKyZvKtQw7vEy3iUhIkQNRTMgExbNOD/fakI0l1j4acjv8Bu/32CR7NYuN+nXB7q57Tzqz/S/pO3dZcYncYYKNe1E7ZbgaZYsLndsBPXskmveBASZHzGLVanRcWaZDSozORATxYWGzsd/OoM8fU1u+BtCzRPHNa02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOw0JqXR6m4XZ7EXiILZRSbLyHhqm/YWC6X+qAlS+D4=;
 b=jM7lUsFsPsQVtYIj7I5gQLrcZiZqto6y0cvco+wQ5s02tAfntuXYBHE9jopgGJWmNz9XSV1thXu1XWbt0kkKpIgw2VOKCVs7CweOInbOiRlxvsvWi21r4K3LvjEtmsUp/6koW+arUkrP2kDNxTmRSkbQg0tqrJ4wlh1rFn7IW+g=
Received: from SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::16)
 by MN2PR02MB6158.namprd02.prod.outlook.com (2603:10b6:208:1b7::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 05:53:19 +0000
Received: from SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:124:cafe::2d) by SN7P222CA0016.outlook.office365.com
 (2603:10b6:806:124::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Wed, 18 May 2022 05:53:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0051.mail.protection.outlook.com (10.97.5.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 05:53:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 22:53:18 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 22:53:18 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=41778 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1nrCcX-0008vc-Az; Tue, 17 May 2022 22:53:17 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <michal.simek@xilinx.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] clk: zynqmp: Add a check for NULL pointer
Date:   Wed, 18 May 2022 11:23:14 +0530
Message-ID: <20220518055314.2486-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dfe4466-16ac-4d66-f8c8-08da3892b5c9
X-MS-TrafficTypeDiagnostic: MN2PR02MB6158:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB61580634F9E371316F3BE4F1AAD19@MN2PR02MB6158.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: inNiH6hkRrJbMXD/PBHE5WEvDw3ZOvPHdb8j2Mi2BVi2PelPpkVLyaQmhzPPPb5s6Z40aLymaeBQS+Px9AXu+D+x56j11Yizsrfd/M9GeLouuvY1YOZtjIIqBoQnedl97c5+gln2JuvnKo9rAW9MAIAcmTvWhWji2Z2Hu+zJLktsSFQaEHbdBJBXBIqMXnO2Wp0Q4XXKm1L3Wl3c4PLITj1R+xGiFm/RPh6ESb8cprZeZ6YAvc5noOYRAWorbE+uF8jwFctCOP4U2OYz/xj1mwrfN4qVibmkTbg1V7GFnjUSyrvxiPORtIEgpPlQMnEuWIBaH9EEoZt1tn+5yD1bevYd7mMIafAPp8gh/nTqMFgmIrZLNxUKdbFy5Cx+bEiBsPNqM3TMJk8XNyzXya7N254DhKyPilj6SyTc86IEid5FVEsQIrEZbCEOW1+KeYdrFEdBC+MdlImKCkJwhed9JuzzVrMD8GQ1gko4lUa1XCqr77TCfUR8Liiflcytp73ublPpzhByjO75K/rru7AcPFk8TlNpU9dEbWFpN26+zCewaymchWK4jnOzzzy2lA013raamM+5QNjmWSwXWUbh6x9Zv9Je7IxO/UPlquBVr7cEwDZwtfzZfLxgBjqmaOpbELiGjBJmpmXUJK+z05JSP+V9T9I67u9Z74TWRVaTMZjqesyudRjJgzGmlF6V3YAv6NyVEMBCkVsn6KF4AXXyAg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(8936002)(356005)(7636003)(26005)(186003)(40460700003)(54906003)(508600001)(6666004)(6916009)(47076005)(2616005)(316002)(70206006)(336012)(36860700001)(426003)(70586007)(107886003)(1076003)(83380400001)(36756003)(7696005)(82310400005)(4326008)(9786002)(8676002)(4744005)(44832011)(2906002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 05:53:19.1858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfe4466-16ac-4d66-f8c8-08da3892b5c9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6158
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a NULL pointer check as clk_hw_get_parent can return NULL.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynqmp/divider.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 422ea79907dd..8d1a21214084 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -120,10 +120,13 @@ static void zynqmp_get_divider2_val(struct clk_hw *hw,
 	long error = LONG_MAX;
 	unsigned long div1_prate;
 	struct clk_hw *div1_parent_hw;
+	struct zynqmp_clk_divider *pdivider;
 	struct clk_hw *div2_parent_hw = clk_hw_get_parent(hw);
-	struct zynqmp_clk_divider *pdivider =
-				to_zynqmp_clk_divider(div2_parent_hw);
 
+	if (!div2_parent_hw)
+		return;
+
+	pdivider = to_zynqmp_clk_divider(div2_parent_hw);
 	if (!pdivider)
 		return;
 
-- 
2.25.1

