Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B4CC4338F
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5461361051
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 06:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238116AbhHRHAP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:00:15 -0400
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com ([40.107.243.70]:26848
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238103AbhHRHAO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Aug 2021 03:00:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikPPrnCR7wnB1JbAC/zWxL21q1m/02sUn0zTUT90G1VPl/o2/0RcezHC/boiOyDVZaNVJ9DBpOFGapa5TKD0KYWxkbDqZAWiUjoAckdvSjWn93R7tPAVXDGRsGpwDeLQEUm/Og4qzAguip6OIF88EN48l24dWxWQDk4HEGwj00Kj7OkvnzhbGPUItj8gFPvyMgsAG5zMPtMMCM4XVWuzZ8BZVd+yTCWUAynnUWynqASfxx0LJyvXlk/7UDZpTs4/C6XoCLb5zuDJs/dA5YDNEklEC7wRgotzkkjo9vgfr+ctB5IAEiqXcKXvEYjY6HadSkJvg7FmgKhSE12F+qvacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK74OR+v+k/hVkGQrl3fOmwJoHK1+z83BaeWKhDDkGU=;
 b=D1N9fZsLQLAhqicO3cxmvvppVh06iXcwxM5AIhQR+V0aI6z+niHjV6nZ2gl00yREa9bkwetCwzjusTjMAgJ6DRJRnN1CMQAauXm8Rm0gpbqVs9ruBuGI/HMuZDDjdp00E9BWwhIPL0yMJjLILFKX2OpRG3dlLfoOvfOL1eV+fgwKm5O+U/ma9d2afi8XYAoTaqaFEbxkdspyziv+pFJFuBC7HrPZ3Klr/IO6xoA1n1l6M+9R6O5reHdgsRp/eq+A0a0gfbYz5zxb8dEU6/JcKL6TL22R8184B/0UlqY8iZuS/1Gd+k+1ua6rMkq2wp0W8JgHC03TqSfKkSAeU++Xyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK74OR+v+k/hVkGQrl3fOmwJoHK1+z83BaeWKhDDkGU=;
 b=leJJwaQ+fZcNa9elm/OnGW5hbnqfl2qm+al4hSgaqYzdTnWnk1zLJ38tpSjRnW02TV+FHoAXzTyRDXxFejdDPjclE3oH9mhAsL2ovrwy5UJUtrAHfk08G3kbzxML9CTsJq5VJlkB3TQ20UGBmKp8QeaCpEUC9KmyMB4hpw4uffE=
Received: from BN9P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::23)
 by DM6PR02MB6780.namprd02.prod.outlook.com (2603:10b6:5:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 06:59:35 +0000
Received: from BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::1b) by BN9P222CA0018.outlook.office365.com
 (2603:10b6:408:10c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Wed, 18 Aug 2021 06:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT009.mail.protection.outlook.com (10.13.2.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 06:59:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 Aug 2021 23:59:34 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 Aug 2021 23:59:34 -0700
Envelope-to: linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.140.6.59] (port=53032 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mGFXx-000GPx-2k; Tue, 17 Aug 2021 23:59:33 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <michal.simek@xilinx.com>, <git-dev@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 0/3] clk: zynqmp: Misc fixes
Date:   Wed, 18 Aug 2021 12:29:26 +0530
Message-ID: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c5c83c8-6b84-4ff2-9b99-08d96215bd1f
X-MS-TrafficTypeDiagnostic: DM6PR02MB6780:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6780AE22DE00016E444B73BFAAFF9@DM6PR02MB6780.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1rtIgJfMPgG9kFBc8hSRLOOYQC3IahEzj64nCWOt8nFHnpV6a2ifJxGSpaDW16EnC0K91IwejdnDtD7EHXN1Z0izhp3F5jbFjtfuIY+FvjnxtGActw3ZrtkEaNnvJTMiP2fwzLujLof/cGNlYXdacqn+E6nyvBFZJVvaMGlKaB1X/mCc1G6kQ8+wN/lpUI2K5W/Zn1ALWlkH9rpCGUjRMWlEDfv8oHSWBBXQal7WvbGaW37ceFbmsdsVooH4lrL5QjKFQ2Tv9hWKc3NTVk5v3KvkxeqVYA/abui4rKS2XmW/6K8k8jW+wK3d3pFe4Gxe3PC4ok0MAGE1G3x0HxrQ+2iYlPJEPFQD3XkE393h0UhiMNS0LAHPNzJMtESC9OE4UU66g2Q8a6cW8Kn0IIEJP5mjQcbDFCQ+yEkN73GQmItSzR3GSWnoIrASbpuk8a8VVghSUWmJ4TXbph/t1WBUUvraedbZ6/0azgJzTh2qTOm53V4PTsmt0uEgkMaDOv6PeQbbNz8BigmvyBPogKAhGxMB/0r90g5M8HiIy9e8ao8MYdHD7ECb8w1Tgh288Vb+9mQUB/9Wqi8xLCM5Raevf6I1UUq9gENg3t1P+Sx9QiT+r7oMZob5BGaK8RJfpclksetmOWRN2R3F6mhvGR6brMKlwzpmisD/2oAJJGXDFjXTH3+SiEia9POtZskQ0gVmTZuZjw5QTRZZplMDiZrX8kJE5JZOseNanW4K7ICUZg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36840700001)(36906005)(70586007)(6666004)(70206006)(7696005)(54906003)(2616005)(336012)(426003)(316002)(83380400001)(44832011)(4326008)(186003)(9786002)(1076003)(26005)(8936002)(36756003)(478600001)(107886003)(356005)(5660300002)(7636003)(4744005)(82310400003)(82740400003)(2906002)(8676002)(6916009)(36860700001)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 06:59:35.5107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5c83c8-6b84-4ff2-9b99-08d96215bd1f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6780
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


The series fixes
- Memory leak 
- A stack-out-of-bounds in strncpy
- Adds a check for return type

Ian Nam (1):
  clk: zynqmp: Fix stack-out-of-bounds in strncpy`

Shubhrajyoti Datta (2):
  clk: zynqmp: Check the return type
  clk: zynqmp: Fix a memory leak

 drivers/clk/zynqmp/clk-mux-zynqmp.c |  2 +-
 drivers/clk/zynqmp/clkc.c           | 11 ++++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.17.1

