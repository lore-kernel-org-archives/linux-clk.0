Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B820C77B71
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 10:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjDRK3L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 06:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjDRK3J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 06:29:09 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D76E51;
        Tue, 18 Apr 2023 03:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jn9SvN87AEIXc42Pkkqglbif50K4dYO/uehaDWNgCA05JwNe16n7blmI3TrsFRW7h3nM/9vyXQzSBenDm53aq6SgS9KHtIfODmdrdSHVU0AASYCGbVb7bWoM/Vq3rg9Z6D+myO/1lvc7976xa7DSQqGWuAPnPcpLRgMhaIGv88S0cpdB1AYct2q0FCxm3+TflSkEIlXQIbioXflCC5dAIdlWkTxKp5qToYbhdqoXGN0Ff+Dd1JvwLk7C2QwzAHacP0VsvJsNZX/nZea7iDAedPML2I1I2DWGMaztmkLgvppsWqYOhHQyzw434x0O+fqeb02NW0dixpoCckzobYp2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EinYCNYUqkwQ5a05XevUihcUf+4AZJKZlJGwCw4RLw=;
 b=nQu55pNKrjSiBRxu4SDxUCc2Aogd5juE/FyexxlZGNfdYDQwT+YWg5mxeLDedcvZLRkLygkpy8nuI35C92ikACwD55PrJzRDP7R+q9InN4ZVrO+5C30xcB43HIcbZumWf8+9yqXTDpXAxgEud5EsZZ8JXLnGTzAXgAtAXHb9HGCJ7X68pOo/ZgXBHEal4xvmbgsj+E1sLCyiDOiLymNyvb9K1BHwEaepkv+az1KxYjtUUFOgqrF0Ae4W820m7Nevrf1QEo4ZEPK8FIxsI1bp3mHIEENy5ah7VdEf7qekqdBQzWgZJ0aWj+WNGxFCGRfqHAyE7r/ZKWzMSCYxmd/amQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EinYCNYUqkwQ5a05XevUihcUf+4AZJKZlJGwCw4RLw=;
 b=oajqi4wCgRQeQVv1W9/F7NfjvUkSrU3oaV7Bj7f2p4J1Z5SJvnVzI4oSD6D6BVIlLcasDQpdBE+yfUBWGiSoPT2HWVIU46InbAed5j/6ExnQ9F44iJ9VJd1ZLKqEUFgnzW3WQWwIx3VWFhaK0xen/y9ftKMaS1ngLWK1zJ355kM=
Received: from MW4PR04CA0136.namprd04.prod.outlook.com (2603:10b6:303:84::21)
 by SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 10:29:05 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::85) by MW4PR04CA0136.outlook.office365.com
 (2603:10b6:303:84::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Tue, 18 Apr 2023 10:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 10:29:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 18 Apr
 2023 05:29:03 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 18 Apr 2023 05:29:01 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <michal.simek@xilinx.com>
Subject: [PATCH v1 0/2] clocking-wizard: Added support for versal clocking wizard
Date:   Tue, 18 Apr 2023 15:58:53 +0530
Message-ID: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|SA0PR12MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 51573995-46ff-4e16-9247-08db3ff7bc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whTu+nSnz1WajNV7GGA0zHdSERYCaVFSUlSxwVbK6z5ro5e8vtuXxkslotAsh2IIlU4v5OgWSOSABg1M9EtyCFpFNBtSw5AWf+Gg5+63xoMQ+8jE8Y5hqpfitB37y9Mgs4awHp8gCklVFtix7iMxy3Vox+iGIv1ZenAaSxIrY3SwItiWjewBaR8Ooauio7v1S3M6ismwpa8vf39tnhZ8eHwCX4OryOhdlC5Y0bKbWRXLe9U+8EhWNH9Bafs/EpJBY6HkPVYOuTXOn1tIZEr+O4CXZd91ZYzlathqg261IICznoXhXltM9dJ60agwRxcQAFk6pxfnoLoLZrhtLQ4HDPdiS9CgXrdxebXSdfhfJZLDvmNvJG3dmunmkVdPM4ojH2uEO32OjkpAs7bJlrUN/7WhVD2A8J9NZ4s+fJN1x1wurw3rj6O0wJNe7KvHT6DeqQn+01ZXIsFtvC1HmtfE+lgk2Xk+Pi3J2i5a865acK2gAXmNPYVg8zaTkCpylbZAyNQeobktNUE6W2i0oFZ6S58gRy8nMiGOqpsKV6Z68W+XfMHWWF1vhRIOl1gssnD3TYRn+xsyPWMWEVSFZ0nV3doNDrAatNY/43XNPwxMcaFVarW4ozSA7+q6eJoNFWPdkglDDFxH4QYrezBPGhJbM7dAHQyNnxvyWD/kZymdpAjhZugjvAcvgr2xB2thiC2+HFzcHVERThMmGdnlnwgPuxMzaIbNmATdrJmgbCvBof0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(36756003)(8936002)(8676002)(40460700003)(44832011)(5660300002)(2906002)(4744005)(82310400005)(86362001)(40480700001)(478600001)(6666004)(54906003)(186003)(2616005)(966005)(36860700001)(1076003)(70586007)(70206006)(26005)(41300700001)(356005)(82740400003)(316002)(83380400001)(81166007)(6916009)(4326008)(47076005)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:29:04.7896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51573995-46ff-4e16-9247-08db3ff7bc28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7075
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Add Versal clocking wizard IP driver support

The Versal clocking wizard is clock circuits customized to cater to
clocking requirements. It provides configurable number of outputs.
Adds Versal clocking wizard support to the current clocking wizard driver.

Datasheet link: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard



Shubhrajyoti Datta (2):
  dt-bindings: clocking-wizard: add versal compatible
  clocking-wizard: Add support for versal clocking wizard

 .../bindings/clock/xlnx,clocking-wizard.yaml  |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 506 ++++++++++++++----
 2 files changed, 401 insertions(+), 106 deletions(-)

-- 
2.17.1

