Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45F7C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 12 Oct 2021 10:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8675610A3
	for <linux-clk@archiver.kernel.org>; Tue, 12 Oct 2021 10:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbhJLKiT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Oct 2021 06:38:19 -0400
Received: from mail-mw2nam08on2040.outbound.protection.outlook.com ([40.107.101.40]:47297
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235872AbhJLKiT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Oct 2021 06:38:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkZ/uDa1VJgXGd1BmcuEydAbGKZqsBpm1Vol2nInz6iWbOiGNI/iR7FADHxpd9755g2SLTLpTvdrxDhP1XeSmVdx6fwtIMp/E9gbxLgT/Jk3iexZNQ0HIptvyzD54VL2BezmaM+70MNi6xIlyxYvS6xQ2QJRNBbNGbihS3x+1ybfm7xfLIDfqgPGYszpXDvFg8RTRbGFWssqqWB5M2Vyv6cnzkfIYTRknJX9CW8rF++przS85if8WqfQ4dnOkWAl7vv0cv276/xT2Gc6Z8wDSovilnotGilO7wIzwHnw8ikDKVQxbyUJBhP2+r6s2crJx00/BBve93bJR5XCfdauqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMkJcQpQjZh/Wykfi+cDOg40OYwR2GIEUrUoY+y1QUU=;
 b=ltpyvdSPhUYPrmeGnrQF5DTyW5GYC4y2fP83XqAWg/591MkzlgPOOcwr4VS49vJAUjm2Ta4GoSA2xy0HRv31whV2mJMTl8ghED55GSZjN9lSYdEyKMD9Nu4JiJnBHMZMhJS6OOBZhgSGj9ZN1P0wWk/mv6PJOleGmLsDQx00MDvPOS6TS7cYtaZAMg2URTHWfPaynIU8h/50Ti2sb4A6YgRs04FRDu5q0dikFRgaqr2Ir2Ex7YAlUMsVc6fGRuSlPtMRlYIpIWAk+QsMvlEYbnpmIk+qVPjfWiTR9/a7QtQsk8RL6bgDZxcyGJfcMfMPTn+Z3cSU8BF/kZSGAL4ikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMkJcQpQjZh/Wykfi+cDOg40OYwR2GIEUrUoY+y1QUU=;
 b=GgY+0nCbsfPNaLsiN3CZL0uUbW2InEzGXfL7TWILp1Tk7kINhOPmTZDO3+s1Y2gGc1DNFRB1VJbZ3Oln1Pdxvww6nKUZeJ1G9HovRKITEgBNXZ0jYg1OMZz+tW2R1I7JmeAnu500DFubW5t9AaozGpZoLd0YvY2R9BQYrOGGZFk=
Received: from BN9PR03CA0912.namprd03.prod.outlook.com (2603:10b6:408:107::17)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 10:36:15 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::87) by BN9PR03CA0912.outlook.office365.com
 (2603:10b6:408:107::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 10:36:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.23 via Frontend Transport; Tue, 12 Oct 2021 10:36:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 05:36:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 03:36:13 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 12 Oct 2021 05:36:10 -0500
From:   Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
CC:     <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
        <Sunil-kumar.Dommati@amd.com>, <Alexander.Deucher@amd.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: [PATCH v2 0/5] x86: clk: Add config option to enable 48MHz fixed fch clk
Date:   Tue, 12 Oct 2021 16:06:07 +0530
Message-ID: <20211012103612.101859-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f10f3566-30eb-43cb-74b9-08d98d6c1e4c
X-MS-TrafficTypeDiagnostic: BY5PR12MB4180:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4180385232D2C37FB25ECEB982B69@BY5PR12MB4180.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jkIR3v4LIce8Xx/J8bqJOPfsX2vH0UGir0Vc9PoNm4HoUckcvhkWuF+hNgorl8OZk44thjQvJFEn8nsc5UrfLHbJA+rF3gpQLG1uXQRYpb3ZKXhenWDIRP1ovxzKndp8FvCLCuVsYQ2LYanwzVVqovKI6K1g3Kgd+NPAsP71k7Cphdt/KfNd0nCcKHVwkcQXCz6nxt4F7L2iCUb//lMdug2eHTCVFgVmKgGliFhugIr+cjP810qhExj6Sod9ddQignVWrWP2No+vaK6gv+gmvVq6yXHeIrXtfF0dabsSBvCTaINkqiCKWwS7CDj8Mlapq2tKFXhKKsHGXxKogcphmTegLup1OG0orW5IqKjvS42t4baNXM5L5znp9LIs/p2rN++MXta1vEEIFnGKEBIZuSPVjGVMtXKzLOGbWSo6gAany85m+Kw0NY8Bb2yAHlchKHRb9uSgR6PTEoj7UD4omAFTbmPCD9YMon0wS/x/8tCYau49Y8vxIT5Rzq2ovsm71KrvC/qSlxD+rGl7Utch6GTuVDAGwn+WJPDC7i3mf7nySiKQU1pclX4BsV0ZkQsykBAc9ghWBgIqGs71UX2NePtq15RN8TTp/hdMjL16GV7JkQ58PZgy5qFmpzXWhUqCUcrNIPvtvSKTk9RQMSBXbaFn/Wyg0aUvzmGThBsc75NVGbz6brCsxcYTp2Q4MntrhLZ3Xj1JHokC1ZceCi84S+io8AR5sa1CjXsk6bglluM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(83380400001)(1076003)(7696005)(86362001)(6666004)(5660300002)(4744005)(2616005)(316002)(426003)(70586007)(70206006)(26005)(54906003)(2906002)(82310400003)(81166007)(186003)(36860700001)(8676002)(508600001)(356005)(47076005)(4326008)(336012)(110136005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 10:36:15.3517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10f3566-30eb-43cb-74b9-08d98d6c1e4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

changes since v1:
- Remove unsused variable

Ajit Kumar Pandey (5):
  x86: clk: Add config option to enable 48MHz fixed fch clk
  drivers: acpi: acpi_apd: Remove unused device property "is-rv"
  ACPI: APD: Add a fmw property clk-name
  clk: x86: Use dynamic con_id string during clk registration
  clk: x86: Fix clk_gate_flags for RV_CLK_GATE

 drivers/acpi/acpi_apd.c               | 11 +++++++++--
 drivers/clk/x86/Kconfig               |  5 +++++
 drivers/clk/x86/clk-fch.c             | 26 +++++++++++++-------------
 include/linux/platform_data/clk-fch.h |  2 +-
 4 files changed, 28 insertions(+), 16 deletions(-)

-- 
2.25.1

