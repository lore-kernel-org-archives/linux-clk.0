Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CECC21ABB1;
	Wed,  8 Jul 2026 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516360; cv=fail; b=msfIKK0Bba/VpuSf5yt1nfQUaVhe8yLUE3xOO8VdXGIC54AHTXAGbxyKXB9nksZgA/E3BDEYwXgXcgPr33SmzgDtdcue/qqWlJsAs0+JRPSjBkS5FnYDc3QJFqFrgx78c1cmmkPY4JZvB6H6U5zXZPMwWBKwNxRCWLDalpVM22Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516360; c=relaxed/simple;
	bh=ttt81hGq31K4yB3DRz9+oIPTN87gFcDi8F+Cxz2kVOo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RdnFvE1m03yOd4KjD3w2BekEUmtiBZPlZG6MUwytCXmkcmYdotxZwPPrQVQFioEcRe0F6I/0P1Z1eDZslk5+erb6fG1bL0Yr4BlWcpmvJ9qqGbzvyLj8rCD73651OKHVrBqDZBAsYYJiBq7FiiDrp0YUn/5zaO6fh6+5zy+tnjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NArRMtaC; arc=fail smtp.client-ip=40.107.209.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NArRMtaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQu36hKniY0uS4pcrrPH2xL/HJ5KO2hOxlyJODL8OtTz64qPP4EfIN14t3RKtvnDS6jPytDECKvJFQTeKaViOYxshHy0LnJYwyw1gAht5c3cbFqrWtNMnd33LGqNPV4tvrxPsQhCkG4+q45DVtUVQkdyimbu96XrOOZLjtHn8HwxYDNULXtH61pRbNLbcRPVmh5t5YfIefEyOIdJ4wjTKwNOtnmTw3fm3oFpuH7z3N8NbFNjzT9/fckReuRLjVR15wNB8MIAbpSFmq+zMUP7GHQznP/IhEiBGSIOgPUnq+1LREIBQt9TLrhjb5CRq0bwoBfWXiZqHVz6Fs4CmFeiVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx3fDhePUW7WG/m3/hWAMlBjy884Iu5JArauq/ZJsyg=;
 b=JwEuly1H1paSz4hwav34AVoDbmRvOjaWTaPaKHXwwSSNS1I86qKSIMExUPC3URfCPdHPcYBpuB2lB8UHhWZ8SVyr4hJCETk9w4soeyhigkv1NV2bK7H2dYVU2Tye7XcbnZGuaRfiXJiknwgEQZyw+gBPSf0Tt60WyJtFgafSORb3V3RkJOCDTUe3rp7hClzLpv4asOOAGT0BA3xlyTTTTxH9z6Kw7hPyEI8ebIQjGAqKPSldVN7ljdGQ49Jxs5BFUEENLcHV+my/HHv1hk+D81L2zIkC5/duCMZNyxOIWf8IZTLF8vXi7m2B2JXUbAG2Y7coAJDNYgeSE24BrZEV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx3fDhePUW7WG/m3/hWAMlBjy884Iu5JArauq/ZJsyg=;
 b=NArRMtaCRIo5LIhJWEq7LZo+lwCfHZX4xmOiv4IGGKDxcjzdwaCbKMR8bkz4rN3XrFAfReoiEUn2Gk2gm2h+InGq9LJgWsSg9i3FB+BJKTumnLwTEm9mizkkMMDnK3lgd9mA8dR/85gJyJXsF3U9pIZ2ZxbzRGQq23UY3fXb2ww=
Received: from BN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:408:ee::30)
 by SAVPR12MB999143.namprd12.prod.outlook.com (2603:10b6:806:4e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 13:12:35 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::2c) by BN0PR04CA0025.outlook.office365.com
 (2603:10b6:408:ee::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 13:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 13:12:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 08:12:32 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 08:12:32 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Stephen Boyd <sboyd@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:COMMON CLK FRAMEWORK"
	<linux-clk@vger.kernel.org>
Subject: [PATCH v5 0/5] clock: versal-clk: Fix Versal NET clock binding and switch to CCF
Date: Wed, 8 Jul 2026 15:12:21 +0200
Message-ID: <cover.1783516336.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3980; i=michal.simek@amd.com; h=from:subject:message-id; bh=ttt81hGq31K4yB3DRz9+oIPTN87gFcDi8F+Cxz2kVOo=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5+Wzba+49Pf9h/vqbOwR43s12PDHv7ppfqy6b7J61f cky6dTsGx2lLAxiHAyyYoos05l0HNZ8u7ZUbHlkPswcViaQIQxcnAIwkf48RoYVDSft+ZaU3Jqx uWWZ8rI5gdJLPEvt92d+Drz6uj4p6f5URoZNj409lfm8T2gsMlcWPzHnpufDqO+F0rLpjyrrdl3 caM8IAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SAVPR12MB999143:EE_
X-MS-Office365-Filtering-Correlation-Id: 476e8169-5a8d-42c3-f5a8-08dedcf2938a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|23010399003|1800799024|36860700016|56012099006|6133799003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	m6VWaaTNGTjE//6p5/3FhBPZidb4s4FPgeT8RiqVTbSg38lCk8/ajHJ/WKd6+f3E0Kezud6CcTiwiiHwH6GePBSTtQNWj3WDIezXkBMRU4DzJUusDbhyUMMk9btkcGDumVSHBnZ+Ng3bHp9gA0ESmc+4mlqfpFS9LXwi/M4rEms4k2J9uX+aHKJW7c3qGzhFdThxlK4FN3nuX08LwFV8pkOwQF2SalqIxYwhBj1F9EhhnHK2smLUckN5M9Ew4T7hmmbwntVlvofEPjjUofae4vPCDJJIPFF6up33oYFbyhaPhnTx5JTMkJeONUR1lOfLrNwjR09RSDbnqFAvg4/aAuvO2qXKtneP2ggd3iTgiQ0/x3cVDIi5UWL/b9Zjpuv6cAAc6q+FAj7CgLU3mfPaIdz/ul/+slUaBRE9esjmoKhudLKp2la3VaFP1wQA6ax2HdL+x9DkvDjpqiqEvz8X88YLc4eH0EWruBWYS+wvy4lEDxarN6Gwrbw9gu/PJxVc5NUgyvSCLkQo0jPK1uQUjPppWmBN7bcpE1hQGqW6V8aCeSvclrEo/SQoX9G9FxVD0goq+981/9RKQGZuXVFSTJpJb6uHlbzxqvNDqG3hlvCp2wyxedq32ZjQXf1mqaiE4v6L4ShsTQ9outvgY2QgzSfyQb+upBOhpxVPIawyN5RIudAFJ/liG/GUMORWs91YATDsc8pGFgpCeWaURRdlAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(23010399003)(1800799024)(36860700016)(56012099006)(6133799003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UDtNxM6yC3ytqbUdwaFaFh3go5Rlyja/h8BiLyWCBgt14PiCyn4/yTDX1VM3m/ZeRihVo4ZftHAXqU60PHDzi0N3s5miE4SdcYvNzTLJ4mzSMn/dXf77+hEcFGL8CvlKGr04HNtrQIuBDiElY+rK6xABfE7SO8WiYx9cu+Mx7ksdo8sm/x8xFkvOTEzjNjCqhtYh7IzzRF+m4itrNtmVQebgVBSlDb/MtwxotZguEdKM/Deq9l01BlTUfFPTN6zMGl3HoFsMOPBB0Y6kXcpC0u5jsQYiS/OXhlsYj8t1hI/afNlWWJMjltEU1QQEvlbHUC2G02KuKtNr9fQ9qdmOtotEj3/KcLfbWtnvBcQ1VIsfaFBD29B8wRhPrFkAZnu0vNFw0XfHrKi0CU/hukPEq0+CpRV68p2eV+V0Adk8oOsnD7mREBPpsza8Niz177cm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:12:34.8294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 476e8169-5a8d-42c3-f5a8-08dedcf2938a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999143

This series fixes the Versal NET clock controller DT binding validation
and switches the platform to use the firmware-based CCF clock interface.

One patch extracts zynqmp to own DT binding file.

Another restructures the if/then conditions in the versal-clk binding
schema so that xlnx,versal-net-clk is matched first before falling back
to xlnx,versal-clk. This fixes false "too long" validation errors caused
by both conditions matching simultaneously when the fallback compatible
is present. A dedicated example for the Versal NET 3-clock configuration
is added and all examples are split into separate blocks for independent
validation.

The last patch switches Versal NET from static fixed-clock definitions to
the firmware-based clock interface, enabling proper clock management
through platform firmware. DT macro headers for clocks, power domains
and resets are added.

Thanks,
Michal

Changes in v5:
- update commit message s/zynqmp-clk/versal-clk/
- Also update firmware node to match xlnx,versal-firmware enforced by
  schema (change taken from next patch)
- Update commit message
- Move change done in v4 to previous patch where issue started.

Changes in v4:
- simplify expression to [0-6][0-9] from 0[0-9||[1-6][0-9]
- Update regex from previous patch
- Also update firmware node to match xlnx,versal-firmware enforced by
  schema

Changes in v3:
- new patch in series
- New patch in series
- Cover change in zynqmp-firmware.yaml
- Move clock-cells to be the last in the example
- Remove comment around (Optional clock) which is obvious from schema
  itself
- Move clock-cells to be the last property in the example
- use 2 spaces for indentation in example to follow the same style which is
  already used
- Add fixed tag
- Remove interrupt from zynqmp-power - Versal NET is using event framework
  instead. No interrupt is required.
- Remove unused GEM{0,1}_REF_{R,T}X macros
- Update commit message
- s/zynqmp/versal-net/ in subject
- Update copyrights
- Make all macro values lower case
- Fix guarding macro names

Changes in v2:
- New patch in series
- Split zynqmp-clk from versal-clk
- Update logic without ZynqMP part in this file and have if/else only
  around min/maxItems
- use clock-<HZ> node name for fixed clocks
- Reuse existing versal-net-clk.dtsi file

Michal Simek (5):
  dt-bindings: firmware: xilinx: Add missing example for ZynqMP
  dt-bindings: clock: versal-clk: Fix mio_clk index range in clock-names
    pattern
  dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
  dt-bindings: clock: versal-clk: Fix Versal NET clock validation
  arm64: versal-net: Switch Versal NET to firmware clock interface

 .../bindings/clock/xlnx,versal-clk.yaml       |  93 ++---
 .../bindings/clock/xlnx,zynqmp-clk.yaml       |  68 ++++
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  15 +-
 .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 345 +++++++++++++-----
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 +++++++
 .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  74 ++++
 .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
 .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
 .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  55 +++
 .../boot/dts/xilinx/xlnx-versal-resets.h      | 106 ++++++
 10 files changed, 797 insertions(+), 173 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
branch: xnext/versal-net

-- 
2.43.0

