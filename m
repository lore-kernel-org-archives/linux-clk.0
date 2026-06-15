Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21902D8DCA;
	Mon, 15 Jun 2026 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495363; cv=fail; b=Xgy51M7P047FDPgolTZMfDJQ4MTksOs8JxHGNIts+mSn9XKrKCESk4Cg9qFcmQv/UfEopnIinWLVOK6BAGhbRbyW6ZbCSX5rZFabhSjqcFay/veJDGv07qiZwa9dpdEn/r+onbMYgs2VjPhF4wpoonVYVYw1hEbKr0njhkQnj50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495363; c=relaxed/simple;
	bh=8ZoW7PIr/j93R3adD3iIgWSVYGrwirGFujHs/vk/JFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZG71pp6mVA3HbyltQS4oePpEjGfkgL8u6JiDypYFEGdkvapdJaBDP2S63TC7l9+125ZlDseD3b/Cu4Q5in1AgvVSM6fGUuwREwpASzp8xVkfL4aiZ2yf4FVHjqzCbDs5kDSysPjfR+W7NjKrXThFprJNtzzmmoJqm1VqNj5aqKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uuXtSKzx; arc=fail smtp.client-ip=52.101.57.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uuXtSKzx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdPON2rMmxyPZgTN+cFknIMZySToEPlORSKS6u+B9YCCxXUsXvNePzgEfifXnJGucU4mQ1/eWQbgN5nr4qvykv6F1Agj/cTaDKz5gjxIEvPtNZ6to+b2sQeeTd9eHbppk2GJ0hb1roizfsOLDVd8/UwtnI+C4IjeHUeQ/UrMNjTToghoxC3XTBeF+ZroSE9R9To2rd5oM7DcYA7ZMnCPkM6YnLTB0E4YQUpz1wrjanl6P3n+hvzYzGgvnPAypBWMqZUyYJr3WJKqlZTROR2Tya35x8yfXzuQ6maoeeOhHcrq/QfKhTVZJaJRLPmhdBgUXP0RCMkTR07eu6PwxDzi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sjkeen4gHX7D4PIyRO+M6u/rx8v51pkvhfnfDuJT2NM=;
 b=qyTheqECmspZwRN3Oa5dzC+nZ55FIDA7/mgSZKTdPT/Kgq3j/Uor5gNbHQ1/aP4Wt+AKLopd61W7NkyOuipCSJf0I8X9ghXBFmRoJYT1jAw3COJbEVB7wYQWz4489NNs9pdOLXEOJ/hY5ZKWHf/rx/y8sHrBGqPz24o0i/SCekZbjKsf1tBS6NJy+E8pGq6XPUOJzVyM7k7/7h11XE+Di/J6pxxA9CGKOFkwV19xYeJZlEU7KUa8Fjtd7SRDA8gT5D3XMAknRX2WBdUK/VsTTYhJmRu6e7SP4TTcS9/xe8oo4SoDqzCwmjZZVQriGrfFBHDEmdOfN8p1FNjwEm9rhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sjkeen4gHX7D4PIyRO+M6u/rx8v51pkvhfnfDuJT2NM=;
 b=uuXtSKzxSDd+0S9HVAZ0pJo7UYHVsOT1YWSRlo083hNNwgGL43z0MnZwNDTHmzGhXBqsGi494bSI6FrZA4eBVjH6c+Nigpbx402lkoVuQTHJkj8KO7IPS0zAmIswy3qyJqRF65GQq/UKeBOouICiB7HSALZKylCdMge3ehkkWKs=
Received: from DS1PR02CA0028.namprd02.prod.outlook.com (2603:10b6:8:44a::9) by
 DS0PR12MB8296.namprd12.prod.outlook.com (2603:10b6:8:f7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Mon, 15 Jun 2026 03:49:18 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:44a:cafe::6e) by DS1PR02CA0028.outlook.office365.com
 (2603:10b6:8:44a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:49:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:16 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:49:13 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 7/8] clk: clocking-wizard: Skip s_axi_aclk for static-config
Date: Mon, 15 Jun 2026 09:18:44 +0530
Message-ID: <20260615034845.3320286-8-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DS0PR12MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b0f3a2-1438-48e4-c573-08deca911347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|11063799006|3023799007|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+5DI44dtRuAkXe+fokPfJRvWrBMHqQx2xalM0gEWr+74JUcAE2+EGc5/Ddu2GseL+597xn0Wc7y0UvynecLAubLmrXksD8buWDp5EKLbx///K6d8CHtWbyCImDpGs4JQjod086qttXLIrmsPp2wceSd0xDb6JgbGsMK8DCx6biQOUwQryZQDse4LAJO/P9AcHXKiwFURaWPt+ejXCp+4V8vufZ8R8zjCYf+zkp0neFk55MUPAPW0Yv+JVbE0bJ4A/JzSPShPIJN3MvWqsYnEWBCIw+0KrnvGVMYcy48LO7NEc1VHNUGr30SYeGsyj0EbwGfpS1pHMU6Rt8e4QlP2JBTlfH0yB79lQn9uwx+Yf0SVTn1pwKNzjUpM7smpkO8tLciXajgdnjeiJ5CjI6pp7wFC82yK6vVTndnly1300Gqy7XAT8mlIrzZthfhPyu2viG0k3nrCOTDPgppvX60Fg9vIDazkBk54W9+2cND/WjfCvNbVTRXIPWP70LCIHopPYNH/4Q82DjXpX2zSxo4qKRfaUtKifVrcXDaTkIToFUTigpa+4x7UZhnUCPoIFAk9WXTioKsrE3OlbWcPt8eFXSxRw6eeMZqHla6v08ZVKY6YiqrCsWOd84BTeSeo5VycQmANFyaPlMlQnhcVrMn6bBOt9ORv1riPCEGZxNfteTblB/bkzrDfTzzneCDfQWqvBFGNTgkTHr4+EnfxYxdd0PiWiSvWLubxhxGh5uDsjYg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(3023799007)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YeGPgr04AhwKZ3Ka8anpv5oddCL92GVG2qManY7DeV2maGVi3Dx11fGEC0A3mFBCFmfa6JIP4X3VOIYjz9hd3wd+JCK6hIbN/H8+oTdmv62I8HfbIU7Yen7yBoRl8gPiSz0BJc9bWrHfCnYk1PzUkqQe9yZ8QTMUM8Q++NQEQXF9A2x9mAKvxxw//OL+2RZQrFzaY50pCwnmmwwnRfutH3MKV5KWGhaDZwbpEhvSeZAY6H0I2kIgD64NPNF/dAmYstchfpb0L53Z0YPfNv91PDJVSoZWCVLJGH6ubj5tLbMyFcsPyI1bUpmMSo67g5QVueYoTB3cA1L6rW6Q3DFfHW2uCpi7+K6lOWP+tQJELPeGJp0r+bJ6hbs0xbccq12kQSXo3gF+gR3SCHs5oeeImaOcYPwJHN3bHlNNzqj+DC0eqUVrU6+jj2JnwdK8G+2q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:49:17.5215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b0f3a2-1438-48e4-c573-08deca911347
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8296

For static-config mode the AXI bus interface is not used, so there is
no need to get and enable s_axi_aclk. Move the axi_clk setup inside
the non-static-config branch.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 5470a717fccc..fe73ee02b54e 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1243,7 +1243,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct clk_wzrd *clk_wzrd;
 	const char *clk_name;
-	unsigned long rate;
 	struct clk_hw *hw;
 	int nr_outputs;
 	int ret, i;
@@ -1258,22 +1257,24 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, clk_wzrd);
 
-	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
-	if (IS_ERR(clk_wzrd->axi_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
-				     "s_axi_aclk not found\n");
-	rate = clk_get_rate(clk_wzrd->axi_clk);
-	if (rate > WZRD_ACLK_MAX_FREQ) {
-		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n", rate);
-		return -EINVAL;
-	}
-
 	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
 	if (IS_ERR(clk_wzrd->clk_in1))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
 				     "failed to get clk_in1\n");
 
 	if (!of_property_present(np, "xlnx,static-config")) {
+		unsigned long rate;
+
+		clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
+		if (IS_ERR(clk_wzrd->axi_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
+					     "s_axi_aclk not found\n");
+		rate = clk_get_rate(clk_wzrd->axi_clk);
+		if (rate > WZRD_ACLK_MAX_FREQ) {
+			dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n", rate);
+			return -EINVAL;
+		}
+
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
 			return PTR_ERR(clk_wzrd->base);
-- 
2.49.1

