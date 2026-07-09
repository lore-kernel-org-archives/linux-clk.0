Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010017.outbound.protection.outlook.com [52.101.193.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA45341166A;
	Thu,  9 Jul 2026 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595662; cv=fail; b=qWTjTTD1gTusWY+6jUzx+WdgyAIPnUV19OQOQ09/ag3OT1QIi6AOCqC13//WSktig9EyORph53fO4/6mpC+x4L92MWhlYgBFDINYJjEt6b0LWxZeqC3/O/SlqlT/beBT14SM8Xyl5jMhZUyFWaBkagGhF88v7gqSM8JjPq3juJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595662; c=relaxed/simple;
	bh=LyrH1e5ngtYoU54e72dY0qxd1zl7XVlgXrsu3qEoQ6M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r3emttrMQ0AG+1otC6k4/Ll4pYxfxMoTUZwqyrDPDhhyugPXUmptOxgErBHZ+wYa/LdwVYoBX/xvVwGrykS5XlMhpo16tmp5jcDFmYKDI+PWnRTgtrHwnLDcPVlJOXoHCFVkKtn7Qu8eWmS3UnLsc0pShKb/O+3+abQpBZ619jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AJnm9BiT; arc=fail smtp.client-ip=52.101.193.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AJnm9BiT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+z4AoOMlFNeeC6/0TccauGNQSciilIu+EVtGoCM1hrPpdm3jiDgascnoJgNanlnkcQazTGzkvjKk+WiJoPUiymdMmLjnTxCHf88DCpdQaShUvVBflXIUT2uFCSA8Jy0Cr03Ol9+OPImM9Mf1EGgMorpliFRSWMidSjloVoz42msS89xy6FiQ98WxSPj7RGEqILGsN7121k9ibPvJkukPvfwP9L/ZdPnlGHt4xW+slnwJgNF0Mfx1mxougeBGPodBbGE53gVDLx6ust2duk9BQEig2bRBDa0YqV5SDZYdQLWDI+wy1TYwlvdOA/Z3+LmzfwElzUCRJVE4MjIuX6R7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIyw5tLDINXH8zKrc3Dd02EgiOtoDrs4ePTGVfGpc1s=;
 b=wVUnNRHHBPgdXnS1w6u7XD033859enq5ZUr2bIgyHfBd1MNvtBPhDPEk4BqPy3ryXxH9UPUQAN12ynHrWDCJHL76qUlyLt6u/WGgW6uYwQ8kDzeJZBmjhuQ9HquDIZ8x33AU4T895EXlY0DgSXxctsYvQ3k1UloPaAIPn0R0xRL2NaR3wL2JkInFirU5iOKw/Mms8M6FIFX3y5g47Da0wTG4cjcm7iN60Q4vj31/LOOD4yY5l4b6jgwJYcpGBBntmUfqgHXsmSIdo6Fy+pIPDVCVcrDUSF3sGxE0M9O1aee+bo5VksP8u0fPk6xcWbYdt72NFfSRzOoH6T6JMnDKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIyw5tLDINXH8zKrc3Dd02EgiOtoDrs4ePTGVfGpc1s=;
 b=AJnm9BiTJeMCQB+Fv1AJzfnFpbBVfY7+ZfjvhniaZE1qn+EAkUbIooaEtXiOFgnF0zVQNDJTFco8sNrY/VazSMZXV7Fpk4t6lkJ/cMhyrXGATQR5zTzF9k4wzh0IYo1Yaa8gxBAKlecjqxF0y3x9W0emnilOorTyawO9XmByi1Y=
Received: from SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::7)
 by DM4PR12MB6112.namprd12.prod.outlook.com (2603:10b6:8:aa::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Thu, 9 Jul 2026 11:14:16 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::7b) by SJ0P220CA0001.outlook.office365.com
 (2603:10b6:a03:41b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 11:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:14 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:11 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/8] clk: clocking-wizard: Do not map the memory for static-config
Date: Thu, 9 Jul 2026 16:43:57 +0530
Message-ID: <20260709111403.1579159-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|DM4PR12MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 828a93a1-31ef-4fd2-3412-08deddab36df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	HFAnvbJRbJWBij9rx0ZFIK+OOhAE48dhFdawfz2cCEABe4CMb8BZVjpvmWGhvWLSwnWJzGaeehGH2wB0no4eOPwjcuhyxgEAmQKiwnon5HjyplwvPwks/NgvHt2j1h2IbUU0EfrzLz2ejRQuCu8H0GG+SmyAaNj9i5vHiRzUXMkC5/LWqBkGbFLP0mLusL727tqulqCBQWxk7aj3wSMAZPAJWxUoecTjZO3XfWw5dELAWC0B8SSINk+KQM7Oz90Zh63bVjQxYThx8di35031R1hsUDbbANa9u/V0xBfqKLRKtcQS5WhEbm4qZOPXUnukyNYzu+3pl04eGpnrjg4BL1SubmCYKC/HFbw9CtP3w5Uw12bIyY7gAXWCJMGky3UlznoOrKdG/5W9bzmuFHUezrMxfJ1akc7iZsEuZ4OTeJ8qAOOP4SKgb/sOme83tqgJ8osDzBV2YQ9wgNdpr9rDahnWGk1DTK2wzA7Na74l+DZOsBO8MK6MSIXdEWCArNlNXuNhkcNiWXgL+55UrAKfE/j1SupzvYym29f8Y7Jq8kPrddESP7jEYc1jaCSH5qwFgUs1ibWBAvSTwKzwI+J5+pz+/zOaC7QE4Y2Ho7iEtGHTNh4As6ekiVfM+x6SkV1vWvIAFrY8mEKLKzn/DL63RhZWxzDOqUbE95HrbBn4W2E/RVy5OgUdOEtjIrTfLE+JNSPW7NPl/ZNpNtbcJ4UGLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mz3IrBuJqHX2eu5GFwZeno7n62J7+ce9iwrUMHCn+Mqhi4IM/8dU9yYdyCJ36q6eIX6+lzVebFPGE/Cm/d2b4pjNuwL4VtFihQ838NIc00NlIDrvDV1lf7hoLlAoeFO/8LtujmCdy3HmIBNNcn3d/aQL4ltqSrQXQV1Gwhc2Do5lw8D8Uhyd4WrSBjLmQWeF2S1n0aFOG/0xxwwg25wJl8tPyCvGFjcuCAEuKuyG0UChGK1MAWgOZAdlXMvnUI0DoIFYgZsYzCvrFE9lfgcgpGxdZ9L8asF61Z3hPmz1BFueQ615JEdLMOcpXqFg83uwj6PX9Eyj4ANb3brep07HvQ7t4IqTXP9gK+p8Fj+AhEQluOasBMf2c5t0V4LtwfHE55IrEd2cba+4ioa/x0IHuCG82Y1XtICd3faPcGH6EKfd8L/SGH6Mrp2qwIHibpcI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:16.2238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 828a93a1-31ef-4fd2-3412-08deddab36df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6112

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

