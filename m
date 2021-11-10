Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0690C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 10 Nov 2021 11:14:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D35661055
	for <linux-clk@archiver.kernel.org>; Wed, 10 Nov 2021 11:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhKJLRF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Nov 2021 06:17:05 -0500
Received: from mail-bn8nam11on2065.outbound.protection.outlook.com ([40.107.236.65]:22241
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231240AbhKJLQ5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Nov 2021 06:16:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqfIypXuSvmy6jQBuaH1IEv49323Ty4OEWvJwQmxN1pfwYnVM9dqF2PHZ5Vv3xoOP2YD55DgVrUpZ6g0uDGbfUGTopimJq1CSOjOXEz6Ta6U66TPXogPpsjsKt5qU4oU7uJXznYCVXl4j1QpTMlLxB54iMAhCBjb7znXkZYPteWk0gf4ziIv9F2FT9vIuzlXu/UBx+OUeNNz4NAJOnNeGZvj7zDikaJVSEsGeBxMsy9JogZvKkgEoRD51VF2hTK7TKzALlBfD7BAZwLb5t4RpT5I6aGg1i3HD3F2pM7f9qIyK3FMm9Q9fgc1XlfrdV1OT2x5+1CUuztf1qR7F8ZBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnwV8gdEgOWZNVmm4W/7TLrb0HGmXvLYIqI8Zuj5icI=;
 b=grCqIRJicJDdV8yThbiskepImd0iaU0bOjKfFOkJJYdPXNC9t2gmlhufrQKzpaceU0+/MDwxxgAYoYJpztxk6Qr6RgHA4Gsu07QdS31P4BxwZII9BZD/DPdwIT4a5UW453kx4wkje0PPbzlF/3uvP6yfvhyNXG+lPfYL2Z9qoqmbdQ/VeaToh9tQQnEMknpljbdO1TT0UD6UOIVEFnxfIWm4jUGoMBVxXiIZkmsQ2xlL61dHO0bwoJ8Y8JnvwTvHexe1xJRSvqv//liXgG6R+wTfjPMrP5PZsueBmZImQDMm4FuIwHfHfWUljvT9eLoW81wYS3/vjkz1p3gdb3zUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnwV8gdEgOWZNVmm4W/7TLrb0HGmXvLYIqI8Zuj5icI=;
 b=gHGFEFTRMrOl8Jox3QanIS0xS59hwujAJj2fQCjlY3R4LNhH7tx7iJE4D3fD+GJta7IyZrnriaicHybaXngapFpDJ4t9XYB68KZ8p2LcdgjXRvZ6skQ+SfDFeUy5tXx2k67MdAZ/vdoMdkZGQ6ePYkX7+dQzt9YpWJlLTnJ2Nlw=
Received: from SN1PR12CA0044.namprd12.prod.outlook.com (2603:10b6:802:20::15)
 by MW4PR02MB7250.namprd02.prod.outlook.com (2603:10b6:303:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 11:14:03 +0000
Received: from SN1NAM02FT0047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::53) by SN1PR12CA0044.outlook.office365.com
 (2603:10b6:802:20::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 10 Nov 2021 11:14:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0047.mail.protection.outlook.com (10.97.5.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 11:14:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 03:14:01 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 10 Nov 2021 03:14:01 -0800
Envelope-to: linux-clk@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org
Received: from [10.140.6.39] (port=47568 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mklYH-000CZX-7r; Wed, 10 Nov 2021 03:14:01 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] clk: zynq: trivial warning fix
Date:   Wed, 10 Nov 2021 16:43:58 +0530
Message-ID: <20211110111358.4133736-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 911ed2e3-9b0c-41a4-a108-08d9a43b342e
X-MS-TrafficTypeDiagnostic: MW4PR02MB7250:
X-Microsoft-Antispam-PRVS: <MW4PR02MB7250160CEC38F62889630711AA939@MW4PR02MB7250.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/5Ly1ZQza3XBzBBhH2to2lXnr1bAAtZpoVJ1Q/ioqinjyCX3vhiVOQzHN6GXYSDyh0rIqDQHYgyVEyAwsmw0FDLGdL6uFxD5kx00ydptxgi2jjNButN85B2feh622yAsrC7YkNpAavIQVSwQGlj1c0Puz8f7QVLbX8X9MMtNYSCvqC4ffPDMqeBMvjnRR+il3AkurIvo8LcsO0QJMDRzyrLNTVi1MouXWbc+VBYaufo3G+/cJyzbDzMokNuZiUA8ONjL4M018aPp2srPrMGjBrVCoTY5DCgU6Uz/2z9Z+v45U5zlsxgytrmkM2ctnr50MDs2hhI202lvo30O7OPAmnN4Fi/TjYRw6B2D8I2FflH6jKoLHzohKioWWpY+3g3UQMr4CG+NXkG06tspNpxJD0h/zb9OF7CVpR6sPMIuZXB7SmFkA8b6Mdm/Uzcx4y8Ln3oD3qEU9kKOL7GEg7CDeFh1IOcL7yVtt3B/r0AMA2jsrzlHr+Jrr/3dfkBdS5nWgCG+2lRukqiLibks4pcQfT7nOCp4yUIV7VXEusDGE3jN+8J/ucnHPc9UBome77gR/HC3T11b4U7+qj0DFtXy6Q2xk7nxjJGzq0ecTNiqghICya0At1gBLuisYb/V6wipmPtNpMmOgHsaONXg0Yf8T5BxbTxGC/E6OfsV1pznxHbaen63x8FqzKCn4P1fFGnGSKBdMUKIxHQ0rTW4O2lDrIzm6DmNtFQOLH54MQFQYo=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(8936002)(186003)(1076003)(83380400001)(508600001)(336012)(2616005)(26005)(6666004)(4744005)(7696005)(70206006)(82310400003)(47076005)(5660300002)(70586007)(4326008)(2906002)(356005)(44832011)(107886003)(36860700001)(36756003)(6916009)(7636003)(8676002)(426003)(54906003)(36906005)(316002)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 11:14:03.4333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 911ed2e3-9b0c-41a4-a108-08d9a43b342e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7250
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the below warning

WARNING: Missing a blank line after declarations
+               int enable = !!(fclk_enable & BIT(i - fclk0));
+               zynq_clk_register_fclk(i, clk_output_name[i],

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/clk/zynq/clkc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/zynq/clkc.c b/drivers/clk/zynq/clkc.c
index 204b83d911b9..434511dcf5cb 100644
--- a/drivers/clk/zynq/clkc.c
+++ b/drivers/clk/zynq/clkc.c
@@ -349,6 +349,7 @@ static void __init zynq_clk_setup(struct device_node *np)
 	/* Peripheral clocks */
 	for (i = fclk0; i <= fclk3; i++) {
 		int enable = !!(fclk_enable & BIT(i - fclk0));
+
 		zynq_clk_register_fclk(i, clk_output_name[i],
 				SLCR_FPGA0_CLK_CTRL + 0x10 * (i - fclk0),
 				periph_parents, enable);
-- 
2.25.1

