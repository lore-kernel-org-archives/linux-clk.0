Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E940C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 25 Nov 2021 06:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344657AbhKYG0o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Nov 2021 01:26:44 -0500
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com ([40.107.94.79]:18308
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232169AbhKYGYm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Nov 2021 01:24:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQv4+RChDb2bNJaukXV+upHV7/m3Y5N8Lixt9RGYpReBFJeET54UFEy6y/dy8X0tkfFDM71j1FdvNaQskBsywHC8omcvJK124LnUPP9ta9UP6XQX4FExN0uDrUsY2Y2VRSxPcFK+jwQuM9lvBv8lCwcEGQhK0Yz0tT0i+rZnD6reHYLcLhoXq5OxJDL/nKYXHejo8MjINpjAWaCECW7x7fpTOnyJWUB+nOvodPLHm4/dCckzCELOqtiY9nSKCR/g9WLEfiaWuZJcOjE4H37VXolhInG7tJST0C7QhLSFe5TLkDM6J+7AIaQibGPglN2PGWN3LE4IcSdcDmvBKpSmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVfs5fMj+YqiByhstyUT7+HXwL9BYNrbGFdEPNcXQZk=;
 b=Dbr/8EPjHfWpDncD7b2Npi5oxO7qFknvRICdsBUCiEX01+0cgh3+Kd75xrNOG9UAgmAGw1fGB8D4Bfg9/8DwwmzqLRiP4Xpjna+mNozLT9dW74Xijg+0LtR4UUQppIbMBLo6DsmsmqshUoOOWQGt1VtcJ4sp/xTtARIP3pMFeV/K+7dJ1JuyPCFI/zLCeVoqmTQdoNPnxUB2qpM8whHDkLzVmeu5qc7gGlUhztxnv6eLek+e26b7iugsnqnywKEtJOJkWM/GMWeJwlCc4RZeRBPNaalnM//bNOXLcIQ3EThhU25RHYVBG27vyGf026mF8lPkNXle+wsk1TtE/hMNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVfs5fMj+YqiByhstyUT7+HXwL9BYNrbGFdEPNcXQZk=;
 b=WKGUrfNSVohqe0j7DO59bsOdKzDtEJRaSv0EsZYjYK6oDu3P8hixtsmqjJz68ArcsmnIYXQZ4HuoWNSJZjamUy6iij1WCXqsy39PrxaSJnGaxgm29a0NAd8E5T9R7LD0LAhn8Bdf+CP2jeLVPPeGmZk9ZJxXm4UcwruNmA956Ak=
Received: from DS7PR07CA0002.namprd07.prod.outlook.com (2603:10b6:5:3af::8) by
 CH2PR12MB5018.namprd12.prod.outlook.com (2603:10b6:610:65::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22; Thu, 25 Nov 2021 06:21:29 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::e9) by DS7PR07CA0002.outlook.office365.com
 (2603:10b6:5:3af::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Thu, 25 Nov 2021 06:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 06:21:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 00:21:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 00:21:28 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 25 Nov 2021 00:21:26 -0600
From:   Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To:     <sboyd@kernel.org>, <rafael@kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     <Vijendar.Mukunda@amd.com>, <Alexander.Deucher@amd.com>,
        <Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
        <Mario.Limonciello@amd.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: [PATCH v3 0/7] x86: clk: clk-fch: Enhanced 48Mhz fixed clk support
Date:   Thu, 25 Nov 2021 11:50:29 +0530
Message-ID: <20211125062036.1185994-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17936118-b478-4ca2-9340-08d9afdbd184
X-MS-TrafficTypeDiagnostic: CH2PR12MB5018:
X-Microsoft-Antispam-PRVS: <CH2PR12MB50185914C0800E26B12A5E6082629@CH2PR12MB5018.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mFwpsi9OgFtUiPggprCaRIi+o6FcfRWbgcYx3dJwJ+uuWI0ix/UskH2IxoSNDUKBMO5TzYNMdNmUge9/oVIQ9WRka8YqNggQlRYMhMUFeih4n2cwcus9RoRQ2qwqMb7OS0sSgPxMtl1hZeCtMpMO9pWCJxDy9fkPqM6n1vvE/dl94rv+hjALKs/uTeH9C6V4SUhhBjfyTpdLULSHFnjWYaEjsTGeM9wUgvxer77wmOwHLeB3DQ5ngbrjj/nUerfeq16H1UHcfnQ5n5AQiRuzcBgVU5QDfdlAe6Razdcv6FsJYhWpkOZ+I36STyGKWe0XRdAMw1hjeNs0SAuuOEsqrB28bQhamCPMp2XzOKJF/DTgHgsGuvgxxPJnAEs5cImSq2gIdJJi+EFK8Wv4O2ycV9gkPCtSGEnDxl1/4rZ8JwrlYVMrYBE9UKXqmJgns+KT6pJwWtbYuQGpl3223v5WgOM2nEPRbf2HhpdCxX4VSiu1n8D5kFCipklvh5pajA5vQXnBxiLsIxyILb5MUjQAg3EuE4aagbdI4E+iNFJPovwoijwrgCHtQbpOXGdR8MFzH1v/vkqmYbHrQzmj+1lG3klCs91/zDLybR8b6Gv5PDLRxgO7jK6+/NUvI43/Fdg3fURg78TGCqByXS5of7uihjwa/nu3hbCWhlhxwSz+0q7pSR7uYrTEorLWUDZZFsyze+7kyd9bdvIdEe8rWEAS6Q0ZaXc84R1Smlmc+C025Ow=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(186003)(2906002)(26005)(47076005)(54906003)(81166007)(82310400004)(7696005)(5660300002)(356005)(1076003)(8676002)(83380400001)(70206006)(36860700001)(2616005)(316002)(426003)(4326008)(336012)(110136005)(4744005)(508600001)(86362001)(70586007)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 06:21:29.6591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17936118-b478-4ca2-9340-08d9afdbd184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5018
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

changes since v2:
- Replace config based clock selection with pci root id check

Ajit Kumar Pandey (7):
  x86: clk: Add check for PCI root port for fch fixed clk support
  drivers: acpi: acpi_apd: Remove unused device property "is-rv"
  ACPI: APD: Add a fmw property clk-name
  clk: x86: Use dynamic con_id string during clk registration
  clk: x86: Fix clk_gate_flags for RV_CLK_GATE
  drivers: x86: clk-fch: Add 48MHz fixed clk support on Renoir platform
  drivers: x86: clk-fch: Add 48MHz fixed clk support on Stoneyridge

 drivers/acpi/acpi_apd.c               | 11 +++++--
 drivers/clk/x86/clk-fch.c             | 45 +++++++++++++++++++++------
 include/linux/platform_data/clk-fch.h |  2 +-
 3 files changed, 45 insertions(+), 13 deletions(-)

-- 
2.25.1

