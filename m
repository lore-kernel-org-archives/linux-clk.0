Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB37425CC74;
	Wed,  3 Jun 2026 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499540; cv=fail; b=uMJwJweDJMTviBI9XKNviQ88p+jCMUTouWaEi+zWo3VytiFCmDOkV5UUtg50giM75acIqsheRHLiFN1FWuRPBd1vQcL2MlAxgYotAxFs0kkW45k7a23aZvLXzAL9p/YoqLG6NHwjqaJmjUXxk+LWzURf+yn7+P0RLUpT5YNcReg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499540; c=relaxed/simple;
	bh=qvEBZsq0/KH8mNsey45GvHVUh3ulgHnVYtvXBBpONf8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zca343lkh86oK2vEkhD/yCDZT+7EV0ys4huEvzH04T2YWPyc3u9nz501OqjOmbskPtEhC1VkLAKOAUqhw+3I3HASAdPq+vwxOD9T5AgUcxn0xO4pTU3x9QtrPc/gL0y+Zo+fzTtecVD2eFMa0w5I15CpcelUQIvG+gdjwuodoo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JTwBBHCf; arc=fail smtp.client-ip=52.101.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JTwBBHCf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7bhNC1Nmvjq7mt2uAfVSGuJVAx0s7oS9WSN7nn0kayxA+V3eJWe77M+BREtsqyt+yYnr4D6GlK7WP/Tt/E1RV1Zx9goK6qzC9Kep5925SI/7j5fLINFAY1Xm/L2gv1qHMAot5p8E+npebmDeOjIXNY8mjzWVOIHUY+H8gqNw7arP+gNvFsjz6Th2Xs+xQJxqwcnlwc89QXeeWdczU1GCJZJCh1Ly6AXXcJ8GmhhgybS28P9hEQ8uQ1FScRbwuTPUWpd1OUHNhIrOiEkQKVVvZTuSlzjbMsS2mAYHHrFAZeF5N0Nsi9cZKI55D6M09Io2D53yyViX7Y1FBhy8+6HkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ji9geGKiPwUw41rRXwy6+GiuzTDi/MOPDKkW36W3VNg=;
 b=Dj5CtRxwRAOv1yW1kRET63Yp6VG3/vh2lvscuWd7HkmpNV7TRv03pxOOQ4GxnGsTrmzDQjvmonmRGHuOE8/PaWmj6kKIEmXDYlPHunS0oFqrKGoTDnKx3f7a8tI97lSjHb++mHgSZCIfEyAyQY5Qcb9I5e9oKGM0Qh/wA/6gYxl7kK5x+K8326VPL+Gy6mxqIwYbIKmRabiXU/KGOXeWJFQBC7HLmRq71Xsr2VhJIsSMx8V76pi5VbKkRTwtQyo1EXLCP9BUGB8XaCRw+mqvvJO39u2kIpPGaCROsmYdALvAIZHbXW15yhQJaFltmoKvnXC+iZHsQ5GFQkB8tQ0RIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ji9geGKiPwUw41rRXwy6+GiuzTDi/MOPDKkW36W3VNg=;
 b=JTwBBHCfDIOFLHj6YVYfucZJgtuQXrQ7cBFA74XjLTQriASK3mG+32ih5D3idn9F0DFDDAjI/78QVWVZxUMxk7Tod9vpp50QOgQ+fDt758BIatLUpQCn1/177QvDRPeKVfsI9Ef8hHCrfXP5ifzfM7tL9hs8Qif1oMLl9V3FnM0=
Received: from MN2PR15CA0051.namprd15.prod.outlook.com (2603:10b6:208:237::20)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:12:14 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::54) by MN2PR15CA0051.outlook.office365.com
 (2603:10b6:208:237::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 15:12:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 15:12:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 10:12:13 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 10:12:12 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Stephen Boyd <sboyd@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, kishore Manne
	<nava.kishore.manne@amd.com>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:COMMON CLK FRAMEWORK"
	<linux-clk@vger.kernel.org>
Subject: [PATCH v3 0/5] clock: versal-clk: Fix Versal NET clock binding and switch to CCF
Date: Wed, 3 Jun 2026 17:12:05 +0200
Message-ID: <cover.1780499520.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3501; i=michal.simek@amd.com; h=from:subject:message-id; bh=qvEBZsq0/KH8mNsey45GvHVUh3ulgHnVYtvXBBpONf8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWQpuLiZr08TC3v0umfhuilMnD6L7vYX3P71xHVuifen7 1vDezsDO0pZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAiB/8wMrRcn18g8Ha1zttP CScnmV08N7FW/lFKwZyLanV+PZKBnOYMf2X5vjZk/DE/duaU6qbwuxL2qRyMfWmun/6v125g+3r 5IicA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8c0d0e-2654-406d-7bd6-08dec1827e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|6133799003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	qwXSWj/OnuJjnUz9xELQJ6HX8ZJd++OiXKT1h9tWr6FCEkiNVhj7WZEZ2GHyZXqb0WXEPJBFVkBlz14oUuoqLqmkHuQnHA7rtVDxF0kJcBvfCuoiAiXHxjS+1qfH8CL74wGQ1KVlu/22+9JOkivDUdNeB1Po7jswkKTBgIdjbZzQXqg3ByB82tok2heUabvNLBv5gGeFaH+J5eQeFSONECdrFAyFQhqLYnvotP7rOS4ZYeK5CHfkZP8Z8BR3Av1QZ8P0NYs/kPEn3Qxapa1GGEefoT+gmnrsMETSR3xB5UIdsEbTzs7RZ/Fo0BHFZjyZGjpmD7HZ6/waPxQN/O6B3SHvNVGxsAaHheY551GTLZ+6CEPqE1ZZ2qMMC81LraFTi62WnVF05KHLYAFglsQjrRDI/GGm9jPhuvvUM8tyMxQMepoHrfhLsraLqMh0T1R+fc6/lgxDaQnTfurVtIwTjpUhipZ1M8LdF7nBpsyvgKEtc54hCh8IIn6QwF9a26YzvuZM8X5uHC9aXMFtyTJB8vxEmTwqvbron/rdaOtneXZKTax7XyntDyOOZ+qe2PmBdKtk1QpvQV3l4zxzSr66dCISG2QWQF2OPZxz8/m7SoK2Yct0Asp/+elWNJPkq/5A0kOSKGy5WizbJolIEQVEIaYHqVuPP1NlHvVFucadLytN/qN5EAKKacwQtR6XVNlLsUe0tw4LNu/Y4lNE+OLFMTtD3c2hSqd6uF74aQrjU9E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BvAyBTc+PGZpv6IljbkLAVCO68nE+xhWhNWGrwIZVaEoS+VlfnYH3MfLYBCykOy5ZCnCcxj8fCfMTnYrf6m0NAUcv0q6/2tQSggOEN0JBFUK9oWFfzK+WtTV1p7gOTAhP4FqQUGgC/ypseSy/EoiGNAdoHZd+xEceUj88RDXBSUTOW5B4QYjWWjU20wajwt9n6cqkKlxlohjfsSIm0uT7XtX7EoDPI8U4I8cjjvTZH6Qk7hW6Sx9QIVqR6zZnpptSOoK9tKzVngGFkpNAaN8TQddgHehwRm+hNQH9c5GchfZKd5UN/UK858R6cjI4wVEC8YaRPfXWFO1OC9COeFiqsI8s5TwttYbB/WynirVhpCrK3XTbOhzmupM6m0ARhrwVzMfSI96Z8mdUMmB7vdh1RVmxnCRC6QIHshRILC4b5+TV8bmv8TdwJS4wXDvCm41
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:12:14.3552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8c0d0e-2654-406d-7bd6-08dec1827e6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247

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

 .../bindings/clock/xlnx,versal-clk.yaml       |  89 +----
 .../bindings/clock/xlnx,zynqmp-clk.yaml       |  68 ++++
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  15 +-
 .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 345 +++++++++++++-----
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 +++++++
 .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  74 ++++
 .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
 .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
 .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  55 +++
 .../boot/dts/xilinx/xlnx-versal-resets.h      | 106 ++++++
 10 files changed, 795 insertions(+), 171 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h

-- 
2.43.0

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
branch: xnext/versal-net
