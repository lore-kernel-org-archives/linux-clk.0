Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9ED277C9D;
	Mon, 15 Jun 2026 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495337; cv=fail; b=dMfBFkqy7GzQG+2Z/RfDlUx5VwWsE0HNcOQ2ukCgEK1CvkgQnCMwMHcFnCZciFoo6uJwoiyQJhXpFU4G5kgNEckMtT1Ea+e4V3n5YaGsCZaYN9UzaHIPy0R+rfaeAXt/AzoYksZ69G0nfDUHmaeGh0O9HyN7gnEFMIykFlvTMSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495337; c=relaxed/simple;
	bh=/RF+eQm9MMb/KxWzUIHZ2WFOPTY29s3rhDxcuPv0Xr4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Judf+mlNp/8Zy32DHSsdH3SK8d6i5lwHJtyKq4/cQjHbN8XKiq31nJH4rkfJXQuIIdDF1Y2be/dhulOFk6YeGlRREVt1if9nwXftTjlYeaWC43W511WLPYF7QPCrOSCQwIAoRQ8jCJgBvaW9c7t7YV4h2w+Xzr4h546VhkrC2Yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4EkJWStj; arc=fail smtp.client-ip=40.107.200.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4EkJWStj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4FGKMqtgmvdQtB5SDJt2/QySeu4LPmIX64gIa/aM/dD3D+y9e+AR42kwDcNbH2POpd/4tNi4G97qWD7bmRGm4YkK0iVMAOKjLJklvXao+EYL4+WUzKHTp2EM43d1m2vR5CEpnHTzmZPpI2rUwHCrwohz6Z87/8H/RW+jGdIbThMiB3o+IK0nnefYzJz9meN9td3dRJQOk1Xe7EfI6hzaQw1OmRJ7/Vf5wW1Lp6HZQl1rKaVV+kbsAgAnV4VyefrPYBiUJZ9rkMQC8ekkRY2B/iN4jXp9KTG1tL441Yy/D56IFGVNlKv+Cu3XTdOaZs0FMPLpgUv+GbgHbOXlSAIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS8tGvsFjWgqv9/uwunXy/fYVakQTGJ7is3wWPlVnp0=;
 b=aYCJoM4W8tmVzuiCBoko2gjahyK6XI6g7rr6TjEGjsGe42z/ExdfEZBfdREgkJkrXhiteqLc5gN4x3lIrS/U4zVXEHHZlyy7qJ4Zd8mtf+KobUmFeElT+p5zFzfkLWUSfDxAarmJhQmErQpbx6MSvim508sq7RWq4Uer/LPdanKj5pZgEQ2YsDYeXd3OT4G6Qa2uvJ556rY/QL5NA/Meas0QgZoQ5dnXUv72mZDtTIPNjlnBh2nc1eRlSL2e42cbW8aRcy0KHu52hvOnKBPj5sJPYVpP22Fe6+VcvRZrEKoddQo6xx+XnJb9MZZKC0pXascfZYsAbqrTr+y6Wy0wBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eS8tGvsFjWgqv9/uwunXy/fYVakQTGJ7is3wWPlVnp0=;
 b=4EkJWStjecHL/ikvML3dHayVZaMjlvA8XOiW77HFoRnUwjMO4LZXo0k9BF6eAsD31CnLt6BXVRxOWVaMyK1BPZ5K6gVFeAZmUcZc5ZD9cs2ycWzDMJ8nyPg2CL0ljuP6nZB8aTusFRkjxiU9x3qRXTHWLsZA9UpZjYE6RdVAamU=
Received: from PH8P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::15)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:48:51 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::39) by PH8P222CA0013.outlook.office365.com
 (2603:10b6:510:2d7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:48:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:48:50 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:48:46 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/8]  clk: clocking-wizard: Add static-config clock provider support
Date: Mon, 15 Jun 2026 09:18:37 +0530
Message-ID: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 5037a166-0da1-49b9-a9c3-08deca91039e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vhHiwIbGzh+ttj6IAZwPy+15acwRLpeEn3FUFEGjnmqxYC7tLrEoly5EfbpueZqPRDN6snBNtf3L9t641or7FotQDuWKqGbbTNum1R7X/1t+towWVBMwHCmT0pQzCLWExNnoCAOB43yMapuxvsw4g9uoq23ENX44etJEosFN8i/h6sLqLN5IsmT/b6+CgtHdxdP3o0bAAckhb2q1VNPUt3ApqAf2mhpUkEMhqC9SS7SecbyncMQjiaUdxYGxagepSbUEW0eXvys4Wi5TDe4qoknzpAsaR8ML3bTfuhpw+OtOb/ftLA7uYazCMpcMY8rDEEN0KovRzc+zYZe5Hmp5N56Y1mpKprmCt8FWxwwv81oGPxRh7pXT2aw/sYP/Jyi2moXe7raJCNXB+b6L4bx+63VYbQ7zH4WGeAV5VAgBsz1Jmbk6/EkN8ckC2s7SCKFvPytQh2KZ/T5bGHB4fiX4vlH7vmTdak+jhkP05JHddoI45vPrNCBNvDza+gMreouk3cpUFvbSGcJX1bzqOeZVwlHhDDUJLal7rpKaQusbJuZ/Q2HCP8EkJVhsIyfNpPQNTcBbT2+lsBf5Vds3QycM93x9MXCSyMf4qgf/CSQKwgHiTF0RYZTyFSBN4OmblwWZGa4cYPE7hY5PJRRqllv2c1LpLBxdWNOmxKMyKy0XQB2J65fREmdbYpACQY8jPz4XTnwAkt9/kGLe3460xVa3GuWTMaKpS04brb6XIv41ArI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iCnLAlU2ZH7FFWE2Lds7bOJZnQgUsVWp1hSxXlOnO64YaNysCbkgWmPu2YiAj34Z+A90GSLB5NW6NxVANYH46m97V4ZRnfr7J3CA2lwH+Yxa1wtgQ4FIeHZwnSGKEXWhanq8dikEthawUpVM/cgzcX3N53zXPF7rYxX2Aw20mgn3XhNY6vSDHHBZ2XFwUAK9enQTI89tHXSaeOtkVAmf6sVY5WcJkp70DZ3GE9VGQ2Z0KkWCDd1prY81YylToAhWtgeZVLvu6NTxHaTloG5ZX5EfXwskFJ8lkvFJpQnPGDQNo6a8oeKuw7sDoxnIVmR0j7axDiV80KqkL1/IMISzujKY5EW2zLwE4smxY9CUSUWzFoDis76EM2aN+ZK8G71EkIUkeLhhJU57nFBAODEJHH7A4heYExYL4EYKrd+vBwTruwALFDHQZxK23R4XhDsN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:48:51.2330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5037a166-0da1-49b9-a9c3-08deca91039e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562

 The Xilinx clocking-wizard IP can be used in a static-config mode
 where the hardware is pre-programmed at boot and no dynamic register
 access is required. In that case the driver should skip ioremap,
 read the fixed multiplier/divisor pairs from the device tree, and
 register fixed-factor clocks derived from clk_in1.

 Currently the xlnx,static-config is not functional as it doesnot
 model the output clocks. The series fixes the same.

 This series:
   - adds the xlnx,clk-mul-div binding to carry mul/div pairs
   - makes the reg property optional for static-config nodes
   - skips ioremap when xlnx,static-config is present
   - moves clk_in1 acquisition before the static-config check so it
     is available in both code paths
   - registers fixed-factor output clocks in static-config mode


Shubhrajyoti Datta (8):
  dt-bindings: clock: clocking-wizard: Add xlnx,clk-mul-div property
  dt-bindings: clock: clocking-wizard: Make reg optional for
    static-config
  dt-bindings: clock: clocking-wizard: Make s_axi_aclk optional for
    static-config
  clk: clocking-wizard: Do not map the memory for static-config
  clk: clocking-wizard: Move clk_in1 acquisition before static-config
    check
  clk: clocking-wizard: Add static-config clock provider support
  clk: clocking-wizard: Skip s_axi_aclk for static-config
  clk: clocking-wizard: Use dev_err_probe() when mapping registers

 .../bindings/clock/xlnx,clocking-wizard.yaml  |  50 ++++-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 181 ++++++++++++++++--
 2 files changed, 205 insertions(+), 26 deletions(-)

-- 
2.34.1

