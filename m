Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013017.outbound.protection.outlook.com [40.107.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E325C3CC9EE;
	Thu,  5 Mar 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725206; cv=fail; b=u1aMA7mmbfQKOcC05t8boRdg3xjiz4dCB6KlBEd2Q8SRpUZE59Gkj0pyvrKfk/izZBKu8rmsIJA3vdoMCQYOtgJx5OLvT6Q0QticyME2QEKmpomSWky3Pr+c678r+p+QA2wXkYayPUfsxzsU6FwRF6ahB1pD64iYwP9lYcC/wyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725206; c=relaxed/simple;
	bh=PwsW+YhJfgoEbi3iOx0L+OqxkUa8T7Tf+HzvhVtdtU4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GliS9gOmgHCEFmdlQfZ4gNk6GDehkNrkurvvCgtppLUDvcTz6/gsh8tKIAGA7Z6+Q1v1cOFV2dN8bOQT6b2rkH9pfElWdQeHWFIAs1CUYpPA/4Fy6y1r5h6ncJZOhc1CA57Lyfb2Q2/xRPyPJvHPRq1PM+m+OJCKJYakJaQR34s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HepzXd8X; arc=fail smtp.client-ip=40.107.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HepzXd8X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTzgliMw0XkGttkZaqQZeJwH/KO4jK6XvUQLqeid38ZfoIItpvh7PBvLOTR5xgxi8eAYRbYYey+BxjRS6QQ3QLY7LRq1q4+JtIGwVngJ5LD1L5njTyIZIFwBzXrpFz+4rY1H1ovjWcdqNAc1IXUdvomB2L8cddq2h/Axg6l6/1Dod32WWk2pRPbgKHO9L9dRtZLQq3oETfD7T/xqyilTAvqGTHxaDFPfW+8CapENkhUoImuBXLg//Chl0v93gA0OapaPpnFADvFIA2IRcySQd1bxpH85AoGBsu8mQfxz1mDDhN+Uao5mEi1hLGFUP2LLncbwlzMgHiy2XKDD7usEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzL60usZhkk4yHashNQZMVaOvIuH8wriyGwpFHTcp30=;
 b=nlj3kocWvCvX4A6yV4KIAa4HNWNBl4Xox5DEzObmb82AaWjAPxu1OSvYUzeptgOjoYCxxERh6c0IGLy3x9dsUYY1N5gCPvohi4Hg4Q3aqxIYb8TITAkBY34g9jytyjYVeUcSwBXvODFJE87TVPdYbSlzDmZx2aLMHhh9LZA7yBXToE29gUtEpAbizn8Xyy5ALkHHW0PhrkZuWn2ImDQfA9mkXH2Zec0ActYvkT9fns7T72JAJT/0XGLRGUV5jsQnH7EvTxUjvOHCL7Q1hQ1PGblNfRPBcxAs8iHP7NTLMLuNK4b4lKZZu8USOePjMWizqqTlvIXaGKAUFMgX6zBFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzL60usZhkk4yHashNQZMVaOvIuH8wriyGwpFHTcp30=;
 b=HepzXd8XVuDnz154xOnCe+N3qvy4HUfsaLkQ4Y0JvhGDmxAA7jkxRnmDN8oGSKsRnSKWbzTmYtfTxTtl8aZbNAp9YgDzeoBvzVGIbqni3KO892NBJzAvdCziax5lUzbd3EO8Z3Tm45Bmjiw537OS5u5Nic8JjTp7qHMhSfZzMzE=
Received: from SJ0PR05CA0162.namprd05.prod.outlook.com (2603:10b6:a03:339::17)
 by LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:40:00 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::33) by SJ0PR05CA0162.outlook.office365.com
 (2603:10b6:a03:339::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Thu,
 5 Mar 2026 15:40:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:39:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 09:39:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 07:39:58 -0800
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Mar 2026 09:39:57 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rob
 Herring" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>, "open list:COMMON CLK FRAMEWORK"
	<linux-clk@vger.kernel.org>
Subject: [PATCH 0/2] clock: versal-clk: Fix Versal NET clock binding and switch to CCF
Date: Thu, 5 Mar 2026 16:39:48 +0100
Message-ID: <cover.1772725183.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=michal.simek@amd.com; h=from:subject:message-id; bh=PwsW+YhJfgoEbi3iOx0L+OqxkUa8T7Tf+HzvhVtdtU4=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWSuXHxM0OjcNr/6u7saVm/+q/cqg+3TTJOGxj9HKtNP7 ptjlLQ7saOUhUGMg0FWTJFlOpOOw5pv15aKLY/Mh5nDygQyhIGLUwAmYtzDyLDiclxfubBnxoon PDcdT7iVOKjJcesL/+8+tKbUub376lxGhu7tpoXTV1hZ/WmQmiDW/GVKTV0iV9AFR03Nk5XWu+7 MYwAA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3893faa6-5b66-462e-c7d3-08de7acd75f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	+L45pi7h9TRY7hhi/j1ydeXVXiplUhSM9+kXerjOSoTkLA1HNjSPb62G6fgPcI/Pq96d4yWnRMkLNxo7NZEjrYL48S5TcJ/hmcnJQrFwUee0Nq4royo6Fnx7AnVrwSoHVbnxhB14W4CiI0KyqeiwalXTud2QWwkNeAsVBcU+Zh//occodhxb3Q/NTzdLB751Cqa6T7DZY1MthuWuIuPZQYSzX3sJmex0/+J4eRtiLFTFFJKmFt9QNEinm0n2Ox+6s+TBoQ2QPfF4vf3GoIZuk4uLw+3L476+iE08epU0oi+/vH7bCXdudQUK37pqd/u4YkV7UbqowWQM1gYEKbo7QkKXJgEmZPuhey9LRndnmZZ8Slpw8kE9Og4gxcDAyvyFnEbV3qvVQT31R9GLtgEBXmGNK5NQYkmD0E5WakK1dD6bsfPt2Nhhx52UHoDE/bdmAJB4kXXyhairy9qAqOQcn+vKzKdXuSlhaM8+I+DXtDZAbYq0W4xFNVghX+DkcHgSrZjPv7vy0lx6xxmuJTlJzLFhRGQIvRNB8mcAS0rbj/WOAy3imB3NOukL3D4ImzSf6tphOJByFT9odZit4ZYT8yIIEGIG/WtuDYIFtcPGixA1Q5C9p6+59Nro239hB01zg+tNWkLLcxvsXfaJaKBcweKaUrlI+7UFVGOHyoldxxCGzQpRVKNru3V7hsbQ79v2HXGFm7/wjFaOlIFzRaHoSxUBXYFSXzGC6bGZtP+B6Z/qGKqkRVV1wFt9ahSH2vFXk+9+Y+78E6DdoMxwXF/0pQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uJAPa7Iw/MM4Xqo8Qbb/LsSaesm7U3O8Dxrdi7D/fJiIpSin2DaL1GjXkuO1XAUdTlsUPtJRNuit87bK97o7hKyLfZWZCmOgrI1UhV2o3GVyXBqbEOHNNzQuDje06VjxG6iyt9OAG1Hb9giNac/1+hnQ5WaAnezH8alW71LLEFoRksP/eysP3HSBi3x38D6qf9Bt3WO4gMMC5CKJ0QeduPZost9mWInvYa6ZRkG74rlwf2F47wQCrydGt4sYxV2qyVZjDE80LVLEad8K4sr31IeetoXfQ1ecAZxGiMaQsoo5i4vYXNQaOeLltFxy57t3Z/HQPXvVI37WYKr4V1ODfkNOkxttH4NK/C0419HkeTArhP8mzzBHhWkcAGfMMHpvGgFu+pI0WUQfYX93agTh1yG0Rt2DQbeawgDv3TYdOmA+LkM69jnCeB3rgZlnrkIt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:39:59.7834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3893faa6-5b66-462e-c7d3-08de7acd75f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967

This series fixes the Versal NET clock controller DT binding validation
and switches the platform to use the firmware-based CCF clock interface.

Patch 1 restructures the if/then conditions in the versal-clk binding
schema so that xlnx,versal-net-clk is matched first before falling back
to xlnx,versal-clk. This fixes false "too long" validation errors caused
by both conditions matching simultaneously when the fallback compatible
is present. A dedicated example for the Versal NET 3-clock configuration
is added and all examples are split into separate blocks for independent
validation.

Patch 2 switches Versal NET from static fixed-clock definitions to the
firmware-based CCF clock interface, enabling proper clock management
through platform firmware. DT macro headers for clocks, power domains
and resets are added.

Thanks,
Michal


Michal Simek (2):
  dt-bindings: clock: versal-clk: Reorder if/then conditions for Versal
    NET
  arm64: zynqmp: Switch Versal NET to firmware clock interface

 .../bindings/clock/xlnx,versal-clk.yaml       |  49 ++-
 .../boot/dts/xilinx/versal-net-clk-ccf.dtsi   | 378 ++++++++++++++++++
 .../xilinx/versal-net-vn-x-b2197-01-revA.dts  |   3 +-
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 ++++++
 .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  78 ++++
 .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
 .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
 .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  54 +++
 .../boot/dts/xilinx/xlnx-versal-resets.h      | 105 +++++
 9 files changed, 858 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-clk-ccf.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h

-- 
2.43.0

base-commit: fbf33803618ad4f531f78fe15cf328fe6c7f9978
branch: zynqmp/dt
