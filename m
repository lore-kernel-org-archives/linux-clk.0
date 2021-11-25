Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9736C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 25 Nov 2021 11:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhKYLKe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Nov 2021 06:10:34 -0500
Received: from mail-sn1anam02on2089.outbound.protection.outlook.com ([40.107.96.89]:38339
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231277AbhKYLIt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Nov 2021 06:08:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUjB2Lqz/qMGw7OHwk2eWC+zTq6ph3sGkMc0c9hjLd4gX7iu6JGfnLO0VcXVGHgBk2unnjG6QifgUb+Pppekz+nDDyJOwCjiB6OlgOPfJACuhCsq4Kf/dvNSWVXUjrjdN60ttdTyYm9IViVkPHhBLS4PXZocfO3DThsDgdaghfliToDbExHxLVzLQKljwRQkClqoHX8M1WJmm+KC8rQBAuusUDP2hB+7JdJ5LQQnExn9pGyFRM4BoYwguFaa2lQhNS9N2rhtJSudGmioxS9qz9y1MwkAPj2eHh6gUhjfnMHMJyu3Qq5mqFjaCMHWGez+o9njPAZ5GNNAHeT8QPaJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpzVrYe5nagjkI/gCmDPiluZFEEmERHNnpzOVhFe1cI=;
 b=kHdzjywR1f0gN+Apa4LexX6Qgf61dDMvvvvpOXTDCEyfqmbWXHA4+xidsa+md95K+LUTbjtVV8QCJOeEvH5iLD5oFSE+dbbLKmU6tU4BFVCJfgq/xziOCQkiWpdrt7PiASs8CoFXVsyWkpBMRCDIdM4X4ctjie2vKbB5/Lc2lvNaRuW11i5tJrEsHA+ouhfzHl4mU17GQWOL1GobBIzb4U2fkB8RRsq10U3b2e+rcn3brn43FS7s1lFbolTpo2qkTR5g5fBnEOxAhS4VkioFAHi0YXAr/G/qY8yAwLYSBCJIiuKbBKOEYfvQWDRQXYdCxP/GWkFDYgfpD1nLpu2Igw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpzVrYe5nagjkI/gCmDPiluZFEEmERHNnpzOVhFe1cI=;
 b=GOUJHfTPAW2jpo+Ew0MRx1FaOg/cG5Pv0g0SErPRp8mGZe0nexdrQ1TNOpvkjv1pg6wOOAyLaG31raEbYn1AtkD3390iQsAlyPgvVlo17yCizZIZjkYjUF5TJk2wLFnos5iJiOPQ06qwBU+x9FVBWBHsR5HmQMxsq3uEwrmlbz0=
Received: from MW4PR04CA0140.namprd04.prod.outlook.com (2603:10b6:303:84::25)
 by MN2PR12MB3296.namprd12.prod.outlook.com (2603:10b6:208:aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 11:05:36 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::35) by MW4PR04CA0140.outlook.office365.com
 (2603:10b6:303:84::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 25 Nov 2021 11:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 11:05:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 05:05:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 05:05:34 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 25 Nov 2021 05:05:31 -0600
From:   Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To:     <sboyd@kernel.org>, <rafael@kernel.org>,
        <linux-clk@vger.kernel.org>
CC:     <Vijendar.Mukunda@amd.com>, <Alexander.Deucher@amd.com>,
        <Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
        <Mario.Limonciello@amd.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: [PATCH v4 0/7] Add support for newer family of AMD's SOC.
Date:   Thu, 25 Nov 2021 16:34:40 +0530
Message-ID: <20211125110447.1188073-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a69327a0-8573-4538-fc29-08d9b00381c6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3296:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3296C0334B93C4B65BB8434F82629@MN2PR12MB3296.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZphBEjKH34k0FtO9JjBnqcnp30GQvcaUKVCBuA2H7jRvxipkpdxLobR0iH0+bs2L18qCvpi34GoaVHgJJBHD2CgUV7CTXplEMSszIukkXLx8PDB57eLdxw/YdYqWEhhS5T1NvBEt9mfIfwNhk+s1RN0Xq7bSBR5HQtQpp9M/fUOyUOukpB9YX+EAcRrVnGlE59Mz82UKuaZ9OJy/YjZxo5Olr1b8+jAE/jefXVq5MzEr3f+0vG3n8J9IOlJo45SK40Cb8AIu7iqf9MPe1m5xGh61+RaAspbJVL5cyariLXQMU1EjQC3aluGVc+G4xLfkdT+p+qvICVmCDpKGcmIUiIV24RafmkoXD2PEYmFiDfPmMu/qtU65OWPwfLYBd556dv1HAtFfvQORwb2DpgN+Xs4vSatfJDWHBHqHD+ceAEtZbzvRC1b4wy1MiUe1EHK+oyCPCVqESer653uP2R0+mJd3mJIS0EJml6o4JFlnh6RzRE9qVQh9wffixJ+Mai6Zx/9O0GtrbDkDXOh4wll1GCd+xzttltO2Wi2xQjMEPDglTrInczNu4VwbklE0PGv69qTARemdvUj0y9v1aD4gt3gHBoDephAoiAK8VsWnt8kj8AijxYlJ1XzCdi0+Q7YYmC9wp1ITi7KnReMggBk1bE7Nyfa9mPvrjVYeZgL3lqQN3rpPUFpQxS1E35NOa3/iRrXXtTKonR3uuoWFHs+/TAoqepkt4t26ji0bUh9aK2s=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(508600001)(47076005)(70206006)(186003)(426003)(82310400004)(2906002)(316002)(7696005)(110136005)(4744005)(54906003)(1076003)(36756003)(70586007)(81166007)(4326008)(336012)(5660300002)(6666004)(2616005)(86362001)(26005)(83380400001)(8676002)(356005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 11:05:35.6788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69327a0-8573-4538-fc29-08d9b00381c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3296
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

changes since v3:
- Update driver description
- Add pci_dev_put() to avoid leak
- changed variable name for pci device

Ajit Kumar Pandey (7):
  x86: clk: clk-fch: Add support for newer family of AMD's SOC
  drivers: acpi: acpi_apd: Remove unused device property "is-rv"
  ACPI: APD: Add a fmw property clk-name
  clk: x86: Use dynamic con_id string during clk registration
  clk: x86: Fix clk_gate_flags for RV_CLK_GATE
  drivers: x86: clk-fch: Add 48MHz fixed clk support on Renoir platform
  drivers: x86: clk-fch: Add 48MHz fixed clk support on Stoneyridge

 drivers/acpi/acpi_apd.c               | 11 ++++--
 drivers/clk/x86/clk-fch.c             | 49 +++++++++++++++++++++------
 include/linux/platform_data/clk-fch.h |  2 +-
 3 files changed, 48 insertions(+), 14 deletions(-)

-- 
2.25.1

