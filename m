Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E17413227;
	Thu,  9 Jul 2026 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595675; cv=fail; b=WPGBvwswMZGrZfKJM19zK3zqGtrEX+ZEp+P3274xDuWU5+82mgEWgep+N87lHO944Rmzp2tEPFDDMUjv9E+mKwB3quV9CM8kse/xIWPv2I9Q0rgUS5/oqExRlgN9YAtpWxRjeCSHerSgJwNAMkJElq62T7woDHYaNAV/lst/QQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595675; c=relaxed/simple;
	bh=JaQA2QtXuzU0bNbEus+WOmLzVpTLS0LiU0sFoOYTPHk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbKYBfCPwi/joII99O5VZeU2b24YDLme9zTnW9IjJhKNMjmtziDcBGt+8WV+HgeWAZvgAQ2IJI8pCvqhiI02olIgFJfaTQTWH4FrUmwC3aq9/pz/WfB1f6OT/RTAkm5ZxmZA4OENK2faw0Bi8bT6B98OtXF3BMoKpjKIxYARzwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QxJGgCk4; arc=fail smtp.client-ip=52.101.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QxJGgCk4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfTp9CRts5K8AflkIoau1EquPOZv4RWcaels8JcXgBH5ug5bDtiTn+yz62jbRNhaINhk6SldhIzHu5VlQ2L3E3JfQMiuxpO2nL1wFEhTenxI+1xU/bVCP/sHVEdsWpbzEasokeSQNUH05TY4DDFV+F5Zyy9lxyFI72CuQiceurxxRZEC/gEDs+4BZOhW3DGueyxmxGZpQXEhe+quFytxBZVAC6Uowtkt0HVRLijqsBmsn1fCroXPBHg40VWjVeBOJLZbL2Lfv/dhFxOzIdlS6acycsPZWPihWvqKqmeZcgAAAFtOVCFBR/hs/gTMtaQ7fXk6j7C3I77LpOVznlpiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSUdjl5EXNDym82PgyD7h9M797SOcfASzVlTsty4UlM=;
 b=XyXHWOWz4rUbuT3z649QSiYLtKs/XBR0ZfDa7BqelNIJU34pssExqYkMb6izK/6Sx2Z/Ou71dsQT219BN8eZWdj+ybxgFYv+KARl51RX+Ubs1Ig+2HB3pxssXrJZVeIaKwBvpGLeJOtZKLN6Ho87Ai/hKPwZaH5EAJfNdxUZa5EzKfRBGD695/vQ95xs6wzuw9dDlWil4GcNYSmsC93YJSakH4j0Q+1R13a9NsnRkF4lkay0fcC0a+cIECdMwAShOk0rxzBstLoOhBchUEPP/GJWMk5oOFuXysjXjXw+Y6sdk8xQyQY5a2Om82hpQPmLudX+BH7jJ9HKxC8vAktu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSUdjl5EXNDym82PgyD7h9M797SOcfASzVlTsty4UlM=;
 b=QxJGgCk4mmeq7Lq90rVMEKy/guDYPZ/6Fto2v2bshZoZsEMlA7LPnx9DtgyBhQjMqt/IVGNLBz0/f3ZJLKE50GsZPiYm/ATzY39bE6A6v9GPZs4W1+Khtd/pQ7mz/gCkUh3l0ulWQ3lmStfkilI7vOvsz6PVU1pANLiTHYunlGQ=
Received: from SJ0PR05CA0062.namprd05.prod.outlook.com (2603:10b6:a03:332::7)
 by CYXPR12MB9444.namprd12.prod.outlook.com (2603:10b6:930:d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:14:30 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::57) by SJ0PR05CA0062.outlook.office365.com
 (2603:10b6:a03:332::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 11:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:28 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:25 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 6/8] clk: clocking-wizard: Use dev_err_probe() when mapping registers
Date: Thu, 9 Jul 2026 16:44:01 +0530
Message-ID: <20260709111403.1579159-7-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CYXPR12MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a30145-47d1-4374-b64e-08deddab3f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6Ty1e4sptbdEMBY0k/j2KIb65VLji4/qLR2PaYpNdr1hbQJ+dBLkjFWCCpzlbbAZ3/RWSzD9na1GmE6Y8Q8UwYzBltDe45snt0PNfzGg6sj0Y0r1F1JHBfbWpKQVM1lN6ONLAwpRsefTda9X54gKyEGVrCqGggCZXcmXFey8ghIbvu/t1XlOyQEhyj03Fsa53tEQBpiKrxWCAKTHvkhousoYyA2neqfiJAYO3kY+33DYtDO94UVZhGe51noljYQ9R9cveKlbAfHJQ99dJFHuNMqZ5EXKOk90ITD5MKcz326CT4HQ4A/cTFfyy1TLiiiMLHmqQTdyC1xyOyL2aZkRuaxGeSki2GTFwjXIWOLZZrbRtUA5ZD0dQViLYavCuhDLe+pfqJabJXwFrt+MNKyGyT8t9yXd0Y+zi1ZaVVjxeID/AufS8+FSJsYgOyV2sjHs0KlmQqZIZJiQOWyIlln1j6M984pJCdwz68/C8Ef1+OsZGO/cwPEJVNHcd1F3PbqGtUsu0OnSYL/wsqJYME/Mbw2dovcirpc/fP+ViqIJUxIXU9BEETjeo3wAHxWh29credP2BU0MyI99aGxCZeM8leObUK7TqCJIw+VzjgvcsSvH2GAChuiw73gM6eowdijVEcGc0zuiPPCCrSWMP0OutVD3kW8loE4s9pBN7LIrdE2bsjhSzmx8LI6Cd6sZ5+xY3rp/ku9feSIPJha3gKbg8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uj5RoYSaVI0o0OHAnHJapPhxO4IzVFxi9ab/Wh6EKZI2oOVtb5ERADpqdDlBOTlCn0VKuxFCDSGqyuJvei+ULn9ENKan6OGJfBi7BFZ3poxpovlICRGIOnh1xza5VZWnMW40XwHuZjXbdpcv8/HqUw6RHt6vFTFRqbwvleQmoYGMwsXaEcHIa+pq/T5lEYcwJNctXe25zdVcoaR8rzEnmKDDo6wA9fZwoFoLNZ4BTGA6RNT562F6vSTGSUB/EIHBeoJ1bqUpvNtFAHaVw7bWOtTZ7FOpu0lXgHZpxeu+/is7KogDAdBxp6yJPnJ5+UdxgN3NMZFan0pti8VJx363UvLRGYp1AVyao2cawlybygFelg9AYYp8yl0+Uxvgn2tZO8la9KJ5LHfJtykI8bnwGPDF8xHaJfL+8qkGQjuji8E0HGr+Gd+S4tm4opdqcKo8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:30.4756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a30145-47d1-4374-b64e-08deddab3f5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9444

Align the devm_platform_ioremap_resource() error path with clk_in1 and
s_axi_aclk handling for consistent logging and deferred-probe behavior.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index fe73ee02b54e..381e396aef0e 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1277,7 +1277,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
-			return PTR_ERR(clk_wzrd->base);
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
+					     "failed to map registers\n");
 
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
-- 
2.34.1

