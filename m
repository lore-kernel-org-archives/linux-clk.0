Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5653A1E96;
	Fri, 31 Jul 2026 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482474; cv=fail; b=mMtkut+i69a/dDqCWjgGfIxXQwHoyLmNKVxKYSaM90hvmB4eD76cPKMBuN5t27dlxCiqao6c3yb3AwqE7+WkAd5hd5WoBDxveKkhWx+VNSUZDexWW8pk+muVer/02UxV4POzN5uiLdk3/ZLuD4ATxtnyNh6HMkwI4UbvZScfs/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482474; c=relaxed/simple;
	bh=LyrH1e5ngtYoU54e72dY0qxd1zl7XVlgXrsu3qEoQ6M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sJF1prAQredQXc5XtgiZmoS3/wi8R+KUxrea10/c1kGF5YMdOjBTh9/BONfVliu3H9JdYXqp+4Ypw0qkOUb47UxxCOL5rNQhJQGHZusdePTjUYOQwjIgzmx/zGBLznPIyrR5L5we9GYsphIHmollecLMv4BJnVx4/MlYyuIQbvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rzxQukLh; arc=fail smtp.client-ip=40.93.195.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rzxQukLh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yE6/V5tgkesBP0MxGHMOPqT6W8pvFTawV/aHLxet09x03r1LrJ9YDse6PFpbqK7BxfcbW2Xx3+zq3/of23y+YCflLAFL4vZPRXex2c+7aQLU34cs9hmNaippuc0cCbPC3DRyTSkIFBL8V4GNvqD3xfhlLyJY870dEXJeGXUdZ/lO0fR7nsB5SzCB0LnVQ3kIlXUbPpyqC/I3ef9Hv/hEpwmNN/vuSQm5LwSrEK+5bygJzPCTLogM+JWDyRBhURVcZIIFOCqCtE80t2BWf9Vtq8i1Dn31uTCUT4nIdPgkDQ7DLCx/9rSsnNCv7J3LqWRC9RplHjh9vdFKSqEwZDlkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIyw5tLDINXH8zKrc3Dd02EgiOtoDrs4ePTGVfGpc1s=;
 b=AG6hDaK/eIKNGPOEAdb/FcngdxFgQe3g3XC8X4cVfbdYc9dxth8Csz/GW1O9Y9hp7kMgIEi2Vz4Omki0c1zvRcauW5O7FgsMBR/gVtTD+jBCU3lR8CWl+uDit+m6A2/VVZvOCyKkhvpV4VSz4XbPwfwikHeqhGXik8/DKbx3lzTtM5ORkZvdso0iYqranOg84y7dMSx2ZGtfPALNckaU6QwYv7WqhMUjOQgNXtLXbTOTIeUqIcMEh5r+XbqJoSx+S5IXMXJ9kh+o3wKijSK9Ir/Hos1DPMTb4lPUK8AAla7ipxuva6U0gBxdUxjAtPRGfD+7dYvw9AngvIXu9Jl3qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIyw5tLDINXH8zKrc3Dd02EgiOtoDrs4ePTGVfGpc1s=;
 b=rzxQukLh6tTaE6DBswD8A2ExuzIshZe1ubckRKAsQEyuPXKmKVqlUq4WeIJC3sr3peXyec6EzO0IWXAT6tuvwxdUVSDRc8f3PyAp2+1mkveoX1Bo7wCTNb1vq4djB1wkabhP+ZET9+MDeLOyLeq6cFEKxF8NQWRHN1gjLMfvIrc=
Received: from DS7PR03CA0113.namprd03.prod.outlook.com (2603:10b6:5:3b7::28)
 by CH3PR12MB8282.namprd12.prod.outlook.com (2603:10b6:610:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 07:21:03 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::a0) by DS7PR03CA0113.outlook.office365.com
 (2603:10b6:5:3b7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 07:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:21:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:02 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 00:21:01 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:20:58 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/8] clk: clocking-wizard: Do not map the memory for static-config
Date: Fri, 31 Jul 2026 12:50:43 +0530
Message-ID: <20260731072049.957624-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|CH3PR12MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a4d53e-10de-4de3-f0f2-08deeed44787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|36860700016|376014|1800799024|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LBHdQs4yiMFGJowK0wYERhj70UHz3jsbixUx6PJhs4LBDrukQdnIOaymBgrMHMTdjaCmiFJ9J4x1HyD1hv+Cdvv2Tni7sa4q0ZXh+ZhEeRtxK7Donp1UUN0AX3QPAG9c012Myc21zR2iohAT1zmGN6ZzjxlNCLMbphxWdcC6OFYRT+ZOzG7jHCgHbKrMWj1qTIQm3+hsxReQT5+u0W3oz3uOLi+xjhVTpTz+6jQMxZK1VxP1PVGoZweQ8SkvPm8+ZruDuu3bdcVVgppo6J9ywgY7R0LHOWWp5O/Cpo05Fw6OJnFo9NrSZLeVBBRLo/goSpPR381uzmpZ/nxqjXbD7jGxIAiO7yD7pR1S6lzl02lcrJr2w1twCSJJ1HL88wzURM7QF1dB9DSMO7PsOJb3AnvdxmmYe6tLzJ+ZFsigFiLtWWsG5RLuFxD76RwYkYydfblKyN/1bohJ8/zG6T5QogLCsdYgdH3wCtfSG2EED9mwFxboCGAyxPTG1UnAhz+zaQyfJOfLHM4VntJRegvcSBYhOMiraS9pjehun292lVlTVbVuBeeMZcSOq91jkGbt9oF1ytKgDbxeOFhTbPANFvlraEC0HsH4De/y9U5AP+sbcYTQICrys1shtH9/KZzprkq+Wllkim13gVPEsuUm+ozIiCisQFalcqSLGdk+KmVTifud9NHYVsm683rJB28mFA2mYtq74Uu8qGR+J1XTWQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YnHd88hQ7CgOcNDgbTcITwFeMBzaKSQ5s+KmJOaXFAHft2EdNHAllmEXdyDgqYg2nNZjtrxl5L8GhJZx97q+AGpsKMP3EpaQ3wBoCrgqOFZl6oJumD+ApMawAtIex7RZSSKmcY8MwVO4JklYi0ik4N6mwjj5NIP8kUSEzE2tSWLv5leC/1Y6A3FqoqF0htFFoZdIGCS4AUBJMpG5xqrEvnUu64Uq4Y17AK87mFjck8ylUX6ApcLaLZbuwXPen82T5l7MQigLBjKSNUO17jNYBl4B7mKSDM2kf1sWWD+nsy3tuYyP8+XzobnRu6MtHXEBkcVtgUypETe8mZHOonYYf3sXvkBnazmb7VMKtv0coOVx/N0OUKnsEDbDrDoi/NuAEor0Jz85wkP69JfsIAM7C8tyc95RiPKSWASWqxzoM/KZ0tUY6uH8RiJMhOuWMrBG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:21:03.3247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a4d53e-10de-4de3-f0f2-08deeed44787
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8282

With xlnx,static-config the MMCM/PLL topology is fixed at synthesis time
and no register programming is performed; only the dynamic path needs
the AXI register block. Move devm_platform_ioremap_resource() under the
non-static-config branch.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4a0136349f71..e082051221be 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1168,10 +1168,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, clk_wzrd);
 
-	clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(clk_wzrd->base))
-		return PTR_ERR(clk_wzrd->base);
-
 	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
 	if (IS_ERR(clk_wzrd->axi_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
@@ -1183,6 +1179,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	}
 
 	if (!of_property_present(np, "xlnx,static-config")) {
+		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(clk_wzrd->base))
+			return PTR_ERR(clk_wzrd->base);
+
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
 			if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
-- 
2.34.1

