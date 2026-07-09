Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701A411684;
	Thu,  9 Jul 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595672; cv=fail; b=kRBXQRlvjo9a0Vo7BZvG95fYJFju6abwWv6AGjoLsvDPlcPN/5isI/lY6iKuyVI/eXt7TarssnPOoQvdiMes+gU+AVcCG+J6SWyisD43DyESH9i0SA3bqLoLTSo4z1HJ4sQMhqGjeJXOsP/cXek2kgNSpev6vw6RGA0fB/88PD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595672; c=relaxed/simple;
	bh=yzF6TFyjjquYAX4A/gDAA6DyQu3PqbWjP+0yBRXd4n8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDqk3FV2B1S0ZmFkA+UGc9pJ2fp1pj+7GvieAgHG005jvAx4os5sCqFBZalbaLe5cuO/gmtHoR8jYOQ4CPvCL7KeVaBk1E7/XdcNwztgHKKnDxJt/obfJLapE5klafzlk3OUOfE8jIX5em/a6Ls9y8MmQC/QSv2U6ub5lnWk4bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0ov0IXFo; arc=fail smtp.client-ip=40.93.195.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0ov0IXFo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCldDbfxjxpybrWr6NcNu7FufzS5ILP/SdNOyl6jXQgwpFGNIkuE5jFDWLhFAfrlTbdl4JY/uwdv1ZJ03nwwXEcqWLSPPaggxvWijqpAANE1BcxeFTCzu7gHjnBIpV3m1Aimkcny7kU7bXJ6sJgCmnZwwhX5Pop+VlnZ6X/Bvyn/bMlGkZ5TPWB9hsPq4IEEkWqDvr38cK7wLAFoz+VxNh0ZAOuUXlUPOTKwdM9y1tyFl7M5Nrmb5J0wbkBqv7lU2sUpKxUgOvZ4OMmZL4+qrsLsm22Btk+jaEMXy4u/j6Hh4DqICU9Et86HHDwFYBq9wBAReTcSKllLFEDU0f0PYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdo7MjYdUEh9L93rBHquipGkeHH4vxbZ4n26r01RQ5E=;
 b=wiQb/u5qoekEmjlXS/TTnzgzjMKp8RKUT2K/DeZIShGzeEEGhiD0zPF5PdL86TMyHdBSh8aBSff5TB6d5l9QQvwrCzAc7C53lvIXoRvIlz+Hevth3dtBZ+b6DcYcXuJG/BkOP+VZlmhbm/T4GQ+x54rEHZCsliWmY1ZYw8tpWN7op7EuZHQM6xoo9Tw7T/2FxmpE0cPe54XlrUO7FaISl3i+N4vEOH4G44qLXfdkuury/ciVHGYScGmspbgxsprZxl87pzePCyDEMuHfIQYPhwvAS2Md+nYT8TKMLtzqgVF5Z08rug9906NHcFe1JmYzqbto5737d6suwT4iXM7SEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdo7MjYdUEh9L93rBHquipGkeHH4vxbZ4n26r01RQ5E=;
 b=0ov0IXFo3+RfIyo5lk96n+DhaJjlnWe6QgT8ROqARQrZBYzhCHeXqhXpLHgWb7ZmzVjfUnExaT2qWfOT0/fK6FvRoEap6Tozo8e9MiZZuC74N3X4zGDWVOSqLPDZ+sh8ceSantJmhnmoWVAj4KrafaT0fGL6fjKw7Y2YCoeoqgw=
Received: from SJ0PR13CA0208.namprd13.prod.outlook.com (2603:10b6:a03:2c3::33)
 by BN7PPFED9549B84.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 11:14:27 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::27) by SJ0PR13CA0208.outlook.office365.com
 (2603:10b6:a03:2c3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Thu, 9
 Jul 2026 11:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:26 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:25 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:22 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 5/8] clk: clocking-wizard: Skip s_axi_aclk for static-config
Date: Thu, 9 Jul 2026 16:44:00 +0530
Message-ID: <20260709111403.1579159-6-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|BN7PPFED9549B84:EE_
X-MS-Office365-Filtering-Correlation-Id: 872a7818-7645-426d-a28b-08deddab3d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|22082099003|5023799004|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	XbsZjRpwv6OEGCLsgI7Xii25omny/uVTRBZ+JBTrx0VVQHAqz0qCRKfkgEeLctyChyMf6/CT/uY061ZT+Yt/aLACG9YeYVtSJLNHe7zRTh3W6GmmeE2q2X13rgcXSQaW/DmcXZKnNIFZT/yDlMrMepWmLLaJbitYTmrZsKB4WyGNYDAfv7u7S47vEYQ/qbSSarzjXcgdMzfr7IbRefD0lVvsL00zXe5uK6SOX3A34GB/dHZET2ta/a4qD3OEsW+e4KJre5IPYphFoT/C0cOwjQUZIsuKI2TEJqSgGb6sCBcsqeFRSRQY1pmA/7NE3uthUU0/jwBKgPElFwPQRZ1DPyWaTBg8yCSgfL+4LMTURx6OpO6GMAKGoZqqZopWaf5E8NijvsSusqQ8B0GdHCjB6Z+/ytF14zRQiHrgmW83CSXWmhvf1ZNcWJa6Xi+qnN/s2DEJCS7yaulFgYTIRUbVIiMiHF9tWX6xDQj0LO5Ldi7vus+TW3GLKIE0RJ+krguBw93/82R1Yg3XD3SpKj4p3JVA+sUauctMtXyo28o0YYExyQHEmZtFYjoFS1OGUgVXL6nJo5lyk81Yj7QU4kgvrN+xdY3okrB+glgLgQRdtvF7tOsTPOPW0SYTZrvPJcLlI2U/8Y20OphmDJXKkTxIWJHhHOTPA51fyuN8dxEfAs//WSqCp0Y09wjCBHWHTyz8ous8r66uCD19bPjF11CJow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mwt0+3w/mpPjmfws5dgkCw4pnvHfKJ6m4KGYA30yS7EbMDqFiAjPEBLXEDiF+cOsr7TlGYyNhYAZru3i7OZXlTxRdTX7a8huwyUW+d5c71Q+PgGkI3L0AfYsV2p2nTbiKyko2Z2NDtLod2ZO4miRZxUatr6Zl3xg/2PD9vf+p6XMbrgOjpYjnJRrlFQ1sgHvkqnxA/5hYEcIKYHcrB8RJeHeCnzWxZN9jEJpWgfXkmhMDrVA0Da9eudHEXTm/p22mcxGMc+VT/y9hLkPbATNXmLFn4wk6tYPo/MbGLd1oXxY6S/3+6nhr32RnliWMDWgqD3OEY2/JdIFYsIVtnPUIh3+ojE80iAhWjN2zljT+eys1EizhwzWlbxuQT7Y+Hg05FIlg1yDFa6VWRSoxuKIRYEsJ+NxlXn2cr7ydtKdhzZoaADo0cOtvSu4qebxw4AD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:26.6124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 872a7818-7645-426d-a28b-08deddab3d0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFED9549B84

For static-config mode the AXI bus interface is not used, so there is
no need to get and enable s_axi_aclk. Move the axi_clk setup inside
the non-static-config branch.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

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
2.34.1

