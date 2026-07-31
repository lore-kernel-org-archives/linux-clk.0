Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AB13A71B6;
	Fri, 31 Jul 2026 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482491; cv=fail; b=kwSMGC09kwSFM7IVWHPH8QdeUHOn2T5We39pCCjSq/a7PrWrXOqCcQvCnkqqi4Ld0R5VqDrGBj3MHQA4A8efDwk2qySuqN2fOVkwbhWKeUUj069JbSqF6wF14FYwq6Y2TeM6BIC9iJ5Hq5CpktdTpANFK/D9+V1UtKB5RalFhcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482491; c=relaxed/simple;
	bh=yXlMxSH5xofU7s0f74e/ybdFovYVgmrxvhno9n/4MYw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VzvLkYgrc4hbymdDITHVqH0hwZGWPSLeiH5AwckennRFANO1CS+VnoOtapbKf4UbUaJoJSKxMgUKErPMWfNF7JDxRLIHrJQMxU4YBacCqpoaCV3bPpuwgdjoF1eUnquvc1vRVEo22eNbKcksgiWbHDkhUr8I9KvteVA0+al5dNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OV2JsLSk; arc=fail smtp.client-ip=52.101.85.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OV2JsLSk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqBEnU4JplPZTGp+wM64Zn0sZV89KKHZWBJ93bzwe/i6c4te3XEcZFAmqxsfZXl539TB2QbfHsgyjLlNlCu526nu07VKbWXgxEwzteXs69/htonWeLHdhZCWO2DsQ5cyv8fKhOHZHp91dONqpptIEujK8QQIjtE0j5xD4gScnEP+3k2rZ5YhNi73b89T82Za/wIclq0u1cxK7YjmjbTrwEZ0jG17vNeiQJhTHiWxRyk4V/GCFpoj3cY19O+Q1pPtUV9uqniLp58D9fviN3kP8ddHFPJJlAjBMsLfuQpSSa070gr+x5c8OdyRSjYhrpjNG/jWtgob0L6SnwluMw7Pow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBcm1utkGTVGSeH/MpW+bSyCwhf6IypNUWEQyhpebLY=;
 b=VtqhG2FNrB6hJEM4fXG5tvTVwB7lKM48YSYGi9AbF1Fz/OLdbkNGpNSjXiH1JOZswzvsphbjkEK2nboXOl9rwaXEEWMEkZql2t+c0+B1vC51k9fjlZ01xwH4YoJvMb1E2cKPu5aHJ2158rD7OcWxQaWkLEoBYztCiRRrPmc3pciCNaK4q2ka/AFHqVJvWMCGPlgbs8vQ3NZafSGVy9OIZgWRvaocGmGPKOW1uXw12uxutDJCMCrWIMORM7Yw7+p68zr2TwNn3OdT1++v6s5F+etuJCdyaIynC5oZzhkJdhkN9BU6I75NV6z4uHM6k5wJxExIKa8iW6EAjARuVyhx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBcm1utkGTVGSeH/MpW+bSyCwhf6IypNUWEQyhpebLY=;
 b=OV2JsLSkXHE5LBDq8ATDHGUs+nb9gSQsVw4ZH/Q3KxIHEvJZLDGLwuy7NHMHUtcP+3XBqCcX2f+LX80PNgnjOD+FaOrilMNP3RLsJ/FU7yRJFri8k0SqNb5M/bEEay+rJYMJCcisaGcSdLhu+rQgbNs8kZIykXkFfdJKscJYmg4=
Received: from DS7PR03CA0255.namprd03.prod.outlook.com (2603:10b6:5:3b3::20)
 by SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:21:14 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b3:cafe::ae) by DS7PR03CA0255.outlook.office365.com
 (2603:10b6:5:3b3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 07:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:21:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:13 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:12 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:21:09 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 5/8] clk: clocking-wizard: Skip s_axi_aclk for static-config
Date: Fri, 31 Jul 2026 12:50:46 +0530
Message-ID: <20260731072049.957624-6-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SJ2PR12MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: eacfdf41-ac73-4b17-99a0-08deeed44e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700016|23010399003|1800799024|18002099003|22082099003|5023799004|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rHxNK4K1NmCTaDGUVF4kFRTF5I/bSvE24emh45Z87TFATVA4kMdoys48zMWyTUbdM7RRN57Luck9TH4sDADX5Osz+rDYuYBepQ+zJDS9Uqs7e5C6MKgcKu3QdYxQDzAkK1mpthh7n7oBiLXehQovkaluLpFNLMcnbdnj22sCDRF68gnMsSEA09K+e05uLOQ4GmGGx2ez3HyECuqJLl7/QHCvEUfXmtXbbrS/g1oS/i0MTo6CKID2cE04UUfqfs0x4TDZnRzrjNeuoNjfJSNjC47ybR7lF0GyIIQSXql7K/C3O/sRrMXfWD6gK7s1NNf6ZuAGIg3wrPixiIp0/ba9atwYw54nCOgq7jM+rESSpCURTylD5810d+ophZ4yRfF6HrzsgO/Wyzml150eJxQWBNGUNSXfgeOxchHHAqrGQ0/blYjQlFTX23RRKTOTmaaemvFKC6swriS5DuUIhuvTN5hjrn2eLPJ9B1K6dgLP5KXVelLHNwnR+F9RzQIiNf8/eAfUF4KRm2+cQy3JRh6MB2NMhxB/f6+1mbxsUq76QBcGclJXC0iOrh2GwPTXAFV7loFCZCh2GQeboI6QE48p2GZ5R06Ujp4Gl6+tKXjOJyFLYFG2K/MUJSFZUlF55zDzmXapIFHllFwI1ATIuQXJUZsiERwLIWVt/TZwknj7HgMC/jWoTo7bwnC9qmQI9TcKNa/zs0b0I6r48+SkIZGS+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FsD2rdkkaqPLU/FCHmigKyXjnEUTDsqmHIP4ErssMzfhdlQr5uY3pmoRdSKDIAJYx9klprtFvLwCP2Pwp4pKBiNLmV9DgumROCAJhKzl6jTL7vwFYb91JyQW7/LESb2YJn/JrHHSfyH/ZvLypCxPJMwvvZcpgJRXUx6jt0pDmkkrAAomWTNB21NlTtfhr3D/Cc7nRsWyvs9Hro6NQbj4nrlf55RNgkqPT1KTdKfPL+HpG0EwvE9GfzR8yG7/+JLjhxoPxx3Kr8XFeQSKouf4S9PU19juo3EMyBseOMtypm9ScUKxb1dTw5M17YLr8vQh9GkxelVve1tnU3DVGNhWxBALsMowMmgefMu6o0DmO1xHdtw1PVF/0qCgP+KeAgnbWs9SEc5CLP1GSDWPvdpXoLXF+xqHrGDobVxBAyg0d355wp68yvgYfc68+F0oT+vV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:21:14.2125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eacfdf41-ac73-4b17-99a0-08deeed44e09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9237

For static-config mode the AXI bus interface is not used, so there is
no need to get and enable s_axi_aclk. Move the axi_clk setup inside
the non-static-config branch.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 1332abc8a950..c79733f58082 100644
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
@@ -1259,22 +1258,24 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	clk_wzrd->clk_data.num = nr_outputs;
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
2.34.1

