Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDB43ED5C3;
	Wed,  8 Jul 2026 07:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495177; cv=fail; b=Qs6sEr/gCKw74lL0x9VC29rtbI4I+SZicIfnRVJL5GoV20B6g1cTbHgU7+nCbeRS4BkabUvMtSWi2TSMPVkQiek8VtTF/bu48hFPO/rvZSVzoJsB4NfH6QW3KcHXBFrpLKvO1ZFJPuVXcUGRJLd6HS3wEYsMkyY2c3YJjU52SVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495177; c=relaxed/simple;
	bh=RIAZw6f0I42gb3b3t6ib21Xapc6CHPE+tmls/puPOr8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SvbJrVHAIzIBb0GAnY9SNQZjMSIy3JTrGr6v5uv3haAzsnI2GcZhdq/SNM6uW8CQvEhXn4hU2VfS/AgpVbrZ3I1uQYyUCDVlrqm18ZAONaLH24PsRrth8Y9y8SyC1Y/TY4C4ESiQVTVgDb9kK4FacjiIDLxQtPiXXXNLr+jroe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hMhakzGo; arc=fail smtp.client-ip=52.101.56.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hMhakzGo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bgxumvahzo7SAapWU85rSM7ocKwhIjXmqnmWoC0gde1QbjNXrF+NbTvOvaGOSwBwKp1SGngGMTAr3xc0fjM3j0nWZpSkh5VWKn+RqhE57xkaQBhSZIRWS6eiltOVz6XdgnVsWOzdp29ZdcOe/6BIQH6oASkFsqemPq8iYxx62Gpshc7gHRF+KBXbW5vuVgp3kaJVzQxfA3w4gbnkfgbXfTawU7KNG8qmyUBSgJO7WV1DRxMAJV+YTf6CLYWQroR+F19c7CNVNKxW8/dFti23nFg+Fj5LwyTl3Ut2QJjz6VQ2YM28MR1AcBZkI4w6tLo4jfHijnUxnJyeiT48o+JPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq2miVTJs0j+kdKCuAN3J/c/g43BF25GnZktxVU/QFs=;
 b=ul/WhHPH9F4fyZ3DyFLcz/FnnBLxZkhK389Bes9aHP2YR8Qafx3wQixxcCfPCL8WEaMauuCMnKgWyK8NiQwawYcLDUKQ7qSiPJWge/z/+i6dGbWb8j6vNvryKZ4/FoF8Qn+Wo79J437nCWXNQBFALagMo5CRGR5k8DDBscqiaIA8K06XcqWjbq7zGoEGRBWbHqVhEcK/CQRbKIY7F9qCEOMH8tXjC/fDvtuQhQMzc2Ex87sjsPYD8Oqt77Irtdgi4sceSWTInRgAmhYv27hWY9160qmT5BRHl48bLMF958yIojOwV47+FkI4X5aGRYbPjAmke2CCOkrEqbkdVjOFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sq2miVTJs0j+kdKCuAN3J/c/g43BF25GnZktxVU/QFs=;
 b=hMhakzGoamu1MbUB+YAqCEovM49EwDSSrV9v6i/gtXGFe7SqgQAUFz/kE5lKGnxFs4vcU2tN5PUVb/AxX1mSo3CJq2YaaWp1DI7up6Eg+o1Pgi5UzDSoUICgETe9tMLPHkQUUkeNk0s6CHOA90ruGbOHu+usEtstO66zcVBmS4c=
Received: from CH5PR05CA0008.namprd05.prod.outlook.com (2603:10b6:610:1f0::17)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 07:19:09 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::5) by CH5PR05CA0008.outlook.office365.com
 (2603:10b6:610:1f0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 07:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 07:19:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 02:19:06 -0500
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 02:19:05 -0500
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
Subject: [PATCH v4 0/5] clock: versal-clk: Fix Versal NET clock binding and switch to CCF
Date: Wed, 8 Jul 2026 09:18:47 +0200
Message-ID: <cover.1783495122.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3701; i=michal.simek@amd.com; h=from:subject:message-id; bh=RIAZw6f0I42gb3b3t6ib21Xapc6CHPE+tmls/puPOr8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5/rx32bpB0uGjrcPS47nr/VfqFrlen2CXKXLg9fnHt zQfrQtr7ihlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJMLUw/HdI0f62s9mTz9Ak /3R7EEfYA/cl0TcO5LG3hRXrp94L+8LIcE1t+UaTdxM4l57g29WtlKXYnZW5WDk5PPxoYsxxzRl 3mAE=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: c690601d-850b-4ecd-8492-08dedcc133cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|36860700016|1800799024|3023799007|11063799006|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	PnmF2hx/avRr+MUsw2E9Ggo45q4PDsbW+9DijTRbzFtIQx5uPDwkQlmdFMcy+q1lkgU9m2Llt8V6nNy/gjCBubjtQLHFFnOb9Yvdj0jG6vKnKmEBj/EFbUua9RO6FPvdPOk8Q6a5leKCAwPqabH8evtbKWjbb0aoqHw+ZetiPoQwRHN6j440liscumOlv0RhZEYYuRpY0T9Zl9MlurbF9MYTaCXiXIEWiksrP5U2uUzz6irzuWwi2kNKVbJbY2b7uovd76b1UnUHqkRkPOc2t6NzBjeMg/UxsoKxxFGFBcmhd2Qnix4weRH0txzswuckCKmyWtaQ1DmPAqZkn0gpBk3bxm0jCejqDagzwlj85H9LM7IT2BaRNHciQoM3JZcfW7kXnY6T/GdhGqwrBPprjI9TthX6aotMAnq7y7l4Pmj9dJaVCb90wqslbcyVWWKCeAYTXuzM60WGTF1hotfJC51CAZfNnnxefVGtV5awZ1h2vhgPP8H1c/Uf7INQwqac5PPI/Bf0utZPkEAqEaWIcWdCZhq/2RzjEQ9OLb9cfYlt+HV8OLaEXA0n+JjZ15fGkudSivoDOMX15EMJ/XidfRq7tLommOqaSnGd4VPvIZ4wUdhkbg8jPHN5c7jWmHHn/Z05+AK4AkrjgoFykM2Jds04VWlXwMMf6CLcatKiBncf58RwG5ibihtFwmAgKQ6AAv20GaDZLrZ8xIHxkpH7Ag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(36860700016)(1800799024)(3023799007)(11063799006)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jIuro5HgLPkDxuvNavC5vrRlNOURw9/6XdQyc8LmA992mJ+a9eqRNDzKFZ3FW3uYtboZGvDsr4Mi9PZQXpCgtoQrvEzdnmz9MR4fmu8m6r8sv9VZLWS4H2MdQZkU5Y3SeaSjSPblqBoT4IbR72LMASmWd5TkmzFCHnmjSMSBncQHYGOnwq1BwfL3iNd3YExvzyr2SIiZ3u5DWrYLHeKYieaUjuENg0eizfn3/MvG7lwxDjMI1EFA6NRBKvefGh1pSc7bK26/mEw/JP9ni0mf/f+WAqh0/8O7EdnTum7OBClKzoQxzzEXRvGS7aWVMZdcEhT3+4yLB5xw0sExSPNo2CyxLgnvor+Xpe7ChdAWxMtCLdVwyqDi6n1mwQWWcPmFkSG/Dt8VmXQHxNpixBhY4h78zI4y2srnrFYusU1HoWJKjyagawOPp7RTIOeNGYZq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:19:08.8856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c690601d-850b-4ecd-8492-08dedcc133cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779

This series fixes the Versal NET clock controller DT binding validation
and switches the platform to use the firmware-based CCF clock interface.

Patch 1 extracts zynqmp to own DT binding file.

Patch 2 restructures the if/then conditions in the versal-clk binding
schema so that xlnx,versal-net-clk is matched first before falling back
to xlnx,versal-clk. This fixes false "too long" validation errors caused
by both conditions matching simultaneously when the fallback compatible
is present. A dedicated example for the Versal NET 3-clock configuration
is added and all examples are split into separate blocks for independent
validation.

Patch 3 switches Versal NET from static fixed-clock definitions to the
firmware-based clock interface, enabling proper clock management
through platform firmware. DT macro headers for clocks, power domains
and resets are added.

Thanks,
Michal

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

