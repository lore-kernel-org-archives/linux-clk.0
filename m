Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC343A4267;
	Fri, 31 Jul 2026 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482479; cv=fail; b=K1k9w4iX3V2RCLydWG6YtwvZzuXvIJGDEp25Rn25LIgJZuyn2jxBe3W38dhQ5swAp39fnwQ5zMYD123VAtk8RNScCMqdi6Vo0Dn5Sbausav+gCIYSVT+6Kl0fuedGekKgiFI+J9bGPlxaRHwthItmLT9w3G+IIAqcLMFBtD1k+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482479; c=relaxed/simple;
	bh=TJJWeuY6Il/+6LawsPj4L+zg1ArJ1DUIoKE/NpOWGVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y43kmbs7kONCYrzUVsanMbGuEiHLnt66XzJyWTa/EigaobwCaKbdH8HG6RM2Hcd6T/SDo7Nd9TWefiYPJPFXV4ec+cL995+uhv4ryAOFe+AEgoUPYFrX//wk3iOZxxuNmkuG4zobRNTNtNg9ueKlK+TGKmXlXWGFrgakoR2k2Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ScfWEX8z; arc=fail smtp.client-ip=52.101.46.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ScfWEX8z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPdDbZvuIpRZAqHFdlWlwt/M551ppHWNVeFi15gT+78Jul2eRLrIBHRrHgFfp59w8T70BdY7i96ntxzrouaTObF8QBW9NIGDvPHE1XmY1DFNxS6g431in28hFLGHYP0cWPq4Gv+7beUq29AGpCYZaWxwy7GzyfDbRyujUKooWSVjrUXQS6ZkYClb2ypFWS+MBLgb/jGZtuonEUbvNrxWmAUVyyj/wAqw1ZX6zAvV7Ycz1k5ZF3snZerEDcLWfM8B7ONZXOzlRbHuUa4Y5Mjb1pIzWYAIKtYF1nK7OgK8FkfMkzlay1FWgr0ipjn+EMmZURNTTIF/+0C7KTGLmJ3aXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY8s3VR/mOxSL3svbNpZPAqZ6sdgg0+J7H8OYp5TKkw=;
 b=ZongUNEomktE8/iEl0ANl3bnncOCNT9z9OUQ9HRzbDgBwIJCqIyrHmdJgDRxBZnPlA3WGszLK0bz6SINaIhGDHkSBbXa6w/OJrjPitTlOrwHyrsj3kjJ3w/JjAVVITrEcQFJ1HAu/z3IG2oDzDeJYT7ww0QXPMuWker66/6YuF+s4BGNffys8mZm8+LYUIEYuZFtV0S8Vz8LL0WN5dhvgQq/4uIYoMWTaRkk1IYoeih+coK+4+/ltdvXdICfbtHckkNnbshK8XPbpd4oaN20Ij3xeDu3Ko8THmKpjGAIEs0Krt+YyMm4QvS8sIjEphcl5GotGtzfpG7NO3xxaprtyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY8s3VR/mOxSL3svbNpZPAqZ6sdgg0+J7H8OYp5TKkw=;
 b=ScfWEX8zPDtfxtnalYhb/fU69807exDI/ML4eBbf55KRtcKkKf+GfE4++3aISfNA/yAli0/ZNySExiwoD1RSIOtcbQ2S6ft0rQ5o0F19lrW2c0jTTDgzgQUIu7/9x508WbVz2FmDZ2UTMV0O7ls63nRHznUG6IKBph3m4zTAdFI=
Received: from MN0PR02CA0014.namprd02.prod.outlook.com (2603:10b6:208:530::19)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 07:21:06 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::84) by MN0PR02CA0014.outlook.office365.com
 (2603:10b6:208:530::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 07:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:21:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:05 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:21:02 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/8] clk: clocking-wizard: Move clk_in1 acquisition before static-config check
Date: Fri, 31 Jul 2026 12:50:44 +0530
Message-ID: <20260731072049.957624-4-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f9f6f7-f5fa-4c55-2902-08deeed44954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|3023799007|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZZxjLdc0eAc7XGSqG32/dLw8VX6PldUzmxDE+OPQNXVCqpK4Isac8EFiDZA9ShHbNLCESOPVn60iTUVA1bxhewus5F0TBU6MyenuXTA/rlNEKnlhz0H4m9kVuqzh3jjxFGUa9gZSEyAdOA2O6PfZrx1G2+Vb66ir9xbvtlZMnoKKDpF3r3R60x/Z9DBnfS8wQvMztSTxdqAmxNnSHPfFfuWZIju+W4Y5ilIQm4ikEvBzPp7yUHjZda/KYtEJrEUljnPhXf5Vpg9bWj6UPa+lCOl6XexEKCdA1IhSVnKxWdNcpC5trdthlfWrRffsKPHe+cLZqwRwwvFuY8tcCbWTiPLv6cLpW0dt44bi9mqWdHvS9TVNKCBncZz+kXNNDI5mwqF/WaRnxLBkX6Dq9hQ/fLaSOsnWIiH5sFLkY5CombbzKn5lrg5/MtSW07JX6TvLG1vD8Z5j+vjAer1tK+e/9eYtk4uXtMyhlWV6hFIoa7jytxa0vYoANtQxT4TruOs4CaRdZwXk1PSMGZ+dAWdUcXAJr+zJFvyI+0+AVLA5XamdcnOlDnzq9p514H1rxYImGigiBqhlhbbzLCzBJkdlIcJVfi1wyZVxMCKlyeY3NRl16rW8ZhZIgKwuAqQtS02hA8YninWJ/MKvNuBXjiqKZQ++PkTK5NtVnw7CjZZ2ZWF1EnXYuYGffzLploo5/1hUViO/DL9L5RcD/Cmxv/G/ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2etdD+FOumnx5AKjjDT2UZBFYOaCoiQc8SCsrVUDtw8zkuuq1b5os4uqmvwJejhiRpjjCyDhdMIPY6Lbic01eBIVqnVAMb8g70vT1xUIOudghwg4XbMy8bfD5U1vTkjKYNyfhXbe2WWLx7NctUeCgS4wQPOxtpLbPlDZTV1AFeTUW1G+CRjcJ5FdeWenUVr8Js30NgpiGPOIldP9ZRdpGYwHy34865CjdbWQywje+CoV1shArtHHNg75zEM4JdvX43Z6sd7ByEc3/bBB330JLRCYMk/1DOI0Vx+4OSHQBnKaaHyegoqF4JBgpt29SDIPE5RQMAb1PM5JhzqlGEmX4Xc5op6eer1FhfosgPgTGiJthrff90uO0xnQKb54wqBn2zOUp0ZWm7SW5WMzvYYi2ykn2L6mmlRMX0n/qnAdAuqRICCbKxcIc8qImPPrNb9l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:21:06.3417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f9f6f7-f5fa-4c55-2902-08deeed44954
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011

The clk_in1 is the input clock for both the dynamic reconfig and the
static-config paths. Acquire clk_in1 for static-config as well. Output
clocks are registered as fixed-factor children of clk_in1.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index e082051221be..ffc78c90bee6 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1178,6 +1178,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
+	if (IS_ERR(clk_wzrd->clk_in1))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
+				     "failed to get clk_in1\n");
+
 	if (!of_property_present(np, "xlnx,static-config")) {
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
@@ -1192,11 +1197,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 			}
 		}
 
-		clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
-		if (IS_ERR(clk_wzrd->clk_in1))
-			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
-					     "clk_in1 not found\n");
-
 		ret = clk_wzrd_register_output_clocks(&pdev->dev, nr_outputs);
 		if (ret)
 			return ret;
-- 
2.34.1

