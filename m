Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E331413247;
	Thu,  9 Jul 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595674; cv=fail; b=FbILP7L+j5CkfkW5XGyagG6Q9EMc13A6dcDYwAQv1L+GvrVZVopN0DU6FqLwKkvWGrtGtr790BnSfC9Wv3XbCP0aPgVWJFyp0Sfavma0R1yy5rK6dvAKrlJnRAbpR1SXAyux+A9Lg7dP0U0C3TSBnlQgqoVu7zFJEt3kC0G9w54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595674; c=relaxed/simple;
	bh=TJJWeuY6Il/+6LawsPj4L+zg1ArJ1DUIoKE/NpOWGVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOh/BO6uXG4fJBuO61S5/IEP79SAiDaBbPDnclAo6VAnooqXPZD5OV2x3vnMjooY2dfyLvIXQJDlCYmi6t/pxKLq2OHLMvFPKUNoCLUQ8iuJ54AReCQXAM/WKUEgZ5BPDWk/ePN49ny+2p0chT1r6bj0hrD0v5kDjPpmR00v+sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mBQOEvu5; arc=fail smtp.client-ip=52.101.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mBQOEvu5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5MsjDrbIS4yvA6CnjoouAwGXFRaqHuajq/IMtlNSCzdepVbfQJ/YDLqTxaB1v0kevs5eDwiTSk28NB6KduUjpZeQGZ2gF8wy+eZNMiRC1TIC6h4AeFuThaTgooT6UPkihQv5RCwWFzUJZanc5y4ihJ9RvqjohgTpkhiKidmTN7ta8jvnDjww0QRS6zi+8K2PK1J+bw3x3XjrSTPeVfj0U+7FXQgCzYkJrlvmLyPCmj96rYovlFuJG7gRVgTQEOwIoMpwMqyftkxPFIasR50pHwN405GF5VvrtD7MvtX5GZuAeAZZDXmlsnG/28HtcOrYqP2QoP0fTwZey/cpNXdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY8s3VR/mOxSL3svbNpZPAqZ6sdgg0+J7H8OYp5TKkw=;
 b=Zd8lS+GO+4jw1S9LVeT9bW+vrB3pHIDCrhbGfY9bxxEEqe/Bhecq3lWapgimcyyyRbyOCUGhqiO3xk9tv8IY0GTvmqEnx/p+GBHEDU5JK2CUnKPcLoco3tCUtM9vsoi1TASQaqsM4aytZaPZRins819eQmymKo5AD6JoQzMKmrgBBkzTQtmUaFTKAfsWc0Vs5x/YCWh8h0zQiQn9/HekECGjgqd8ztLItWX/AR5f45efqfK1cCTg+jV65G5/bPsGNVmEpH0yAo4rG1/dkmMhozpik0B3GEPALF4ApCGD5PfOifTOYxnNTD1lEmDm1rXpMT/qVoz6b1McU88iBomzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY8s3VR/mOxSL3svbNpZPAqZ6sdgg0+J7H8OYp5TKkw=;
 b=mBQOEvu5ztrzxKdHjuARIYDGBrOl3qpU2++hr2stfIjk3/OLzqqAHK/I/ASqBA4j0Sh389rMdMzhCDKcYAYPE57YegsCCq9UtLY3UpuTUD2A/1H2LgUIeVMurxD+LfA1hvGHK1y4KHzg7bKR4JdvrF+rdk4LjI7rRWCDFTGLnzU=
Received: from SJ0PR13CA0051.namprd13.prod.outlook.com (2603:10b6:a03:2c2::26)
 by SA1PR12MB9545.namprd12.prod.outlook.com (2603:10b6:806:45b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 11:14:22 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::f) by SJ0PR13CA0051.outlook.office365.com
 (2603:10b6:a03:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Thu, 9
 Jul 2026 11:14:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:18 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:15 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/8] clk: clocking-wizard: Move clk_in1 acquisition before static-config check
Date: Thu, 9 Jul 2026 16:43:58 +0530
Message-ID: <20260709111403.1579159-4-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SA1PR12MB9545:EE_
X-MS-Office365-Filtering-Correlation-Id: f71e8820-5a78-44b4-4a22-08deddab3a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|11063799006|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0vzoI4dBh2HnUN/nL9IV3ESGgotqStA5XZNM7GB0iugbO/ZjPAQlkMpbd4zMIL8JhUoOir7+ES34C81PSxV7yYxwGt1LzTFwnI/q1wXga46mtBAdfzL+Hp9r9zxY0qdFEpsPGd4Tadros/bcBHwgcMKD0lnVIwpQ5/cgnCleLsKWT/dfQkud0sdLG4Kh46UPhXAcWt5a+SalTJlVJugPs1jk7+6jrofXfQn200twDuRm6MjA+iantM4mL/OxcFxiCWQxAIFITj3Nb5941Gk3lLaVf5hc9ZCFGxakA1yf+0FKwWRt52Y4FA3mbLKcLgRb3AtYhPPunI2SCdVjJdZHihXBhpmV1K52Kw6JQeLeEOou4DdGWHaN+wmup/VDMqXX4kqmECVXdjsb8gatdnOCzA1mcHRHsL2EWAb8XQs95yL4HdNsIT+Ad2w45WpAdo359xH1XNKoONWiLTJDue77TlFyV70BCcLWDetREP8NXRcpwQZKbL8nKMtxZwSRcQbY5hTl0ZqqDQCxrXKmyesDuXpYZ8dlCt/6zcOaFwbecosl8OG+5gWvPOJV6Qgu5qeEWLtqCB5Rcw+ZOoEkF/UbRHc6KzevGx7UXu+No/oz9A9/cJTxq0L1IW+fib2cvvC5vkliAGeCIs2PdT84bgJFjtb3aeFLVjifUrs5WxMGY4BPjEKO5VHu0MAcztbsa85IlwHuFWkKP3wuNL5HGEuneQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A99zb9riyw+37W5X02BKOBR7GndP9xPOftDjRvOxqbxqrQ5pauGyTHMLUil6CJk87Mud02dgfKsOiZE59XTV3w+BjuKYUemr0Z8l58NJT9wbDGqWUDuCu3pm0wvjDPp2mbYyNBWfVuz7u/gXUEAsAj/MDxTnWjPX7M8+sBmzMF5v4p2iYLEn0xY1wsgG+gqeUlkQve/cn+o+QyG/AaHK1MMuf+DMuLmVMgm4LRgQZo/ocTC95juzaz8NS2vc6MOQ60ttSdoAMbcr2HmgNNj+D/cj4fRdQasJyC/9ybcDw5vtsvyxMPtOzp1VKUmwG81r/6Ne6uH4JRetMVqX2EoaP+o+5eX7KFGxa49+HY7/0Ov1n5AZXV5Li7aWIIgLd//7c4TbDBcHiUsuguKxXfWDaorI9iu4vDEbnP220LFsJ+Csa4fLliGi6suAky9Oisra
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:21.6060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f71e8820-5a78-44b4-4a22-08deddab3a19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9545

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

