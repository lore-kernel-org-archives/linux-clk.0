Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D3F384CFF;
	Fri, 31 Jul 2026 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482463; cv=fail; b=cTZjubYQXz13DX2dCB07NpJPU+XAZ9e3tpJpjtz7XRlev4N55Mm2RLqBj/VkTxB9uDkCGViKJ1014S6k1Ka317eudriUoM49302661Ymmpj0QwP+jy3vI6ckl0Cx924I6efzvMdqP/vXyRW1LxsGf57TDsZmQPTNneSjMNU4abo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482463; c=relaxed/simple;
	bh=b3DwY/8cnn0VcMlKIXvcJd/QBvcjakGRN9Psw0+7jzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EhC5GHQX42E1P2HxUfh+CZfjjPdhRGQk/C8nYloGHpT1ILE/BFWeWoKvjSCFT6016EKD+rke9sev5Dm0P9nnNouiEZLZlzmNP8xRzbNqn3RwaPASwpcJ4lX4duAHr/PDtHz7+8s0bG9nhfWjwztDwepIOcD7zyg/UVzyfhjoBFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rfxMRjeq; arc=fail smtp.client-ip=40.93.196.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rfxMRjeq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bymWxdnr8yybnU2JTka9lPBnbly4Xr/iSF/jMnvbqSWePOiPz/Ak56zQDy6lg/gZwmdzaiCR/f0iaTD3s+sGzVPMSz8Dp885HRF9GDLn5FCjTE96lw55VwDCiYve/N2bMca7Eh7YzsxkwV/ph1DkZD86VWqaRGRFgAvAePrj4HE1I7lc4v82d/S5KVGaq1PZEixRpClbCTkPwxFSf3XUoZYUgHLCnOz11zIeEgtf7DEupfvJ9aIqh1gewtmyeLNN+sEPoSQI77wdwRU5NHxllqp4Qg6b41RSa+EHs/39Pt8Kg+Xqfr7aoWUOy/nv7Gr4OrOgaX6YEJ6G6rD0tJoBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WXSmQIkZwA8kpGBysD8TEOloYnmHXNqgA/ChosqDxE=;
 b=B93fy1CXb2G4RhdFJpeJIgFkdijL4COtZai/jac47oImnBcG6FhU3kuT1rGG1WAYaU5jUAwNkvgAM33FayaKITXyO20czKokTT1xK6ehmi4qpEIIYHVGhrkX2YLhfiPbYNhueFoKmN7VTn4z+OcIfz1Eo7nODNiL67XMSbLpOejj808dpMBLobmWGHLYN5Z4tGUfi51H2qGgNf3L84Wpajxj0iPEy0IYKUvJtY3lx0unQ3wE7Ix0X1g677zIHZxSo9okK5+AOQveBsoK1ENFUlOplKIdDMnRVZa5H3bXQ5A2LHaAGPjQ+DOxnIb9ASQfrUcTqj0Q+w1mJRJgYV3VRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WXSmQIkZwA8kpGBysD8TEOloYnmHXNqgA/ChosqDxE=;
 b=rfxMRjeqTPxEkIP8VwjR48nQIVBObQs2ceXkqLMZjTpVG+KE6aPAl0V1D+fH4TmOJLcmuAyYwxXPIV8dFz/TSOvrhSVKtewQ6y45W6PRYGxGdnPU+BjReWG4MjjAv6u0SDkIlT15qSk6WGVHaXu7dMn2AvNpJfvGbuJw5FUIzbw=
Received: from BL1PR13CA0427.namprd13.prod.outlook.com (2603:10b6:208:2c3::12)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:20:55 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::14) by BL1PR13CA0427.outlook.office365.com
 (2603:10b6:208:2c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.9 via Frontend Transport; Fri, 31
 Jul 2026 07:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:20:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:20:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:20:54 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:20:50 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/8]  clk: clocking-wizard: Add static-config clock provider support
Date: Fri, 31 Jul 2026 12:50:41 +0530
Message-ID: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5ba91d-a9a1-4b33-e20d-08deeed442b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|56012099006|5023799004|10067099003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	mVcBNgocGv9MAfT3K7zhUqtJqNOnYuYSxOiAtoc50OPqadZAg04IXkQMshSL6fZkEuSCTFqpJTxTUHByITLODngmiBUpzk7J6hpOIcJafCK2Hi9QQx9O1hZnhykmVMJuClY/tWwKfggz8u0OsjWPLsCytAwkRC9Ryh6XsWbmVCIMtIYPMS6TvTFQrt2RA1X+BlE9X0ncKtDlDvlAcCHvXllpUMOfGI/RdbpZPy8D38GoDoBfpAg1AO4YpwOFK4Bg5QpoO06QmHxlx4om58jQMc0q0hSgRNrouHYppZvQOZaVwE7DFqLxK9ophATcF6ZLAFv+tFGol0iO4FHnpxNRUz/efocQ5gaT4R7mL3NKZ7Z5lzt6gbAbhv/05P4YwPYmp0cLp9xl4VQv7ZpgfjQPeKRWARPkWOXs83n5V19NRGhqV8gQaP18prYnmm6tlfwCgQvPF7t83gpAwKkekXhw7ye1fngkjUryaEZcm54zWsAsd0/3nC6koGfzL3T3B+LB31n6usI0j+LXUx1t1Kjx7TkwweHuPNHd87HFAm12W6EkAMgS2Ni/unyoUvKWtPe2EFBQn6P7ZDSfcBqll9H04IxxZQjfDQdzc8k770zWlprf4N672PSlgqt9fr4sOcfDuttwRLNhqs5MPwDd5Y2MxI3eS/g4WA/nXhYmMoLeSIIYlS3TVe75iQSV0IBe8xXzj+VNxGmFeXsiMSw41trS8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(56012099006)(5023799004)(10067099003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hEMBBjLWD0TIWonV7MZGwGhL+nuQtohLCo1sIETJ/sf+PGAjGi7g4fI1jdeBDQ3L/9+RWSiOsji42wLwO6E0GZp8lj4jcVRxO2pn8VsmXlJq1pjReQd+5pFJvZnHO32zoNb238OEG99taQuSLKpO1cE66pjKnaJGgTinl9d5ebI+lFB+ws5ZOuw1WCh1/f5xnYNsxLZxAupoqjst+ThQAk5qK8NidlySHx1cy+ihb+rS4yAeCSOmdXcUS1I/thyXZUjL9osF5FKb9UlerS02k0y6O5KmDr6eG/rJ3sFyB1aiOVpDCm4lDazSj1iQ3t8Ev57Yxg31bUqQyJqnkzRdVPGvOU0LGRXhpX/yClT2kDhPthRENEhuIxUfsDWKmCHhOIxzTStPQ6TTYE6mPVNl/OQhUHEj9tF0P1VRtbgJV95kIbfiMLJHM4AauID+vj7g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:20:55.2454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5ba91d-a9a1-4b33-e20d-08deeed442b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269


 The Xilinx clocking-wizard IP can be used in a static-config mode
 where the hardware is pre-programmed at boot and no dynamic register
 access is required. In that case the driver should skip ioremap,
 read the fixed multiplier/divisor pairs from the device tree, and
 register fixed-factor clocks derived from clk_in1.

 This series:
   - adds the xlnx,clk-mul-div binding to carry mul/div pairs
   - makes the reg property optional for static-config nodes
   - skips ioremap when xlnx,static-config is present
   - moves clk_in1 acquisition before the static-config check so it
     is available in both code paths
   - registers fixed-factor output clocks in static-config mode


Changes in v3:
Added reviewed tag
the number of outputs duplication removed
Split notifier into per-clock callbacks

Changes in v2:
Merged the similar patches
Allow check for current dt even if it is unused.
Patch added

Shubhrajyoti Datta (8):
  dt-bindings: clock: clocking-wizard: Add static-config mode support
  clk: clocking-wizard: Do not map the memory for static-config
  clk: clocking-wizard: Move clk_in1 acquisition before static-config
    check
  clk: clocking-wizard: Add static-config clock provider support
  clk: clocking-wizard: Skip s_axi_aclk for static-config
  clk: clocking-wizard: Use dev_err_probe() when mapping registers
  clk: clocking-wizard: Fix division by zero and unbounded register
    write
  clk: clocking-wizard: Use separate notifier_block for each clock

 .../bindings/clock/xlnx,clocking-wizard.yaml  |  53 +++-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 229 +++++++++++++++---
 2 files changed, 246 insertions(+), 36 deletions(-)

-- 
2.34.1

