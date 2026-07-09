Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF05C41168F;
	Thu,  9 Jul 2026 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595686; cv=fail; b=GpSZUxvi5ABhdWznTA11IrivbOC0aDYau+yOzLPrYnyxfLTbBJYa6t2aMA6WL/IKR0jvmiUchhUvzeX54MbUOnLWQREgmqJU90kYt5+5Yz5F99m+DbXfyeRhmkXSXE+MgPfySK81yg1sbFDxcpaoxVWxRnCaG/H8VTrW9HF+3SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595686; c=relaxed/simple;
	bh=NHT/yHrDyZFiXLb9/g1E/q19vgcUuOE9cDJK/98BrRA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nG1AN2yLVajga5liaZERSII+EH8U0KlaZ0niaxrPS2MVRr80NItSyH+wAPBYRnBN3n2tvNlxZnKKy4MLmF31l4E4cIN6nReGWQw9PyDFAJ9E+NkROEKZ0bJHjHYhfHNvS3Oizg8K4NizR+Fq9SN18RhY+CJ13alebm+I3OM58q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TgzF5FYm; arc=fail smtp.client-ip=40.107.209.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TgzF5FYm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL4ENeNcXCNw3MnZFAXYHVDVgSKCTUmhcKK81ffHRqRs6bqme/pSty0aBvF0mY7h3Nh01+i3cGoYwVEmkiFQjqD1VEau1qY9fLLoLwvFkdzBXTQeegQYEudB3a1Ixe35ipw2GmuvxQOSSoz4RJt5+ZGVxe5mKaKFRJWp+mYt33IfhoTpdGs67hM5IStvARIL/CT+4o8iQS5k75prUWzC9qYzIMKiXq9wLakpu4SpWpCxjEHLSQUM6bmTCMs3x7YZ/SkytWwuzTw0DbbiNfIm8pwwMmwwVLVTN4hBrqFnLwNLvb5yHCt77DT4/DNPgSkpp0dv8swx7koYbNOXvbxMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rj6vtM/CNVLwlXZDOoxN5Gw67hDe+I2kHtCUTuszPuI=;
 b=COleHlS3OpFE8xz7wDSdI24UhjM/TKrbwTfkCfxOVC+D+2q6Dwk/qaWSAWteQXAMmoqMq+sVBwl6gd/Qrr8thqSZkj9Nrj4WN4T7kJmO/JjUPxji+3xMcrKk2EmEX4cbBjVRBRreOFuLyBy6AzVJW/1Ij/eJyVGtM93uU7/S6DlhkiI/5Il0syb4+iUwPKJanD5sZ+7OGLxw/VMLk3UCZt0Vgkj8CIfybptO27DDTXNIvJKM3BLVYWyCBNn0HuPs9GrWYBXe3lMKnlxDn9PV1UKagwWPB5ZlS0RvEddI3T298oQXNXkHTCvuQ30GYs0l7kzIcDn0XHmRQ94QXWxrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rj6vtM/CNVLwlXZDOoxN5Gw67hDe+I2kHtCUTuszPuI=;
 b=TgzF5FYmFzMXkRzWH2z+D2PgPrKYjZg5skJQKw9kJ+NZ/AYlrnNfVpqukKvsv2AnJzVyoHyOjNUvBsnOn7CscpLPEaZ0KHPiz4GsHMgRUY8OQUNt34Nmbz9hS8a4j9OnEMpDgLBktGj10Ga+cPtPEM1tVhEqnHjJ3KiCt9DTo/c=
Received: from SJ0PR05CA0064.namprd05.prod.outlook.com (2603:10b6:a03:332::9)
 by DM6PR12MB4044.namprd12.prod.outlook.com (2603:10b6:5:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 11:14:38 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::9b) by SJ0PR05CA0064.outlook.office365.com
 (2603:10b6:a03:332::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Thu, 9
 Jul 2026 11:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:36 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:33 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 8/8] clk: clocking-wizard: Use separate notifier_block for each clock
Date: Thu, 9 Jul 2026 16:44:03 +0530
Message-ID: <20260709111403.1579159-9-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DM6PR12MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b97bd61-d1e4-4397-6813-08deddab43c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ko47kh/lPqGZ+pPUkf+njxXyhSgjJJg2QTXhMN1vEB8MKpqGRupZ3MsJsu3Kpivo0PQ8BkupoKEEPLS6ldyFLDDwcuw86G1PmYH+9Ix3N8vxjWzut/koHqqHOipt3Pf5BDYPFfFT6Qb8cmbLbYQ1apAuxM9cC8WGkRn6tepHhWTAjeb0DHQEVy+pbabmYcRj0pZ19STsM4QdJxIWCfCxn+eupnWR1kazlMYcR5h4tWAss27a2p/kylw4j0jKRYewIFvMr1Qp7YaOZ5OWJqBmHJyNkogXCR3sFyVrR4S6KTK/D2ELwikrGRjjBnR3lDJDccmqiIdJDaIUKEN+RY0DcWIm49DbeEb94UVgIhvubqLhyo39AXS0XFVV3BML98LshuDPlP2KhBKmIcjpcVbITUR+DfOfslRjZ2SauaL52jGBY0BDGr3moGrAd3naSKkb87Sial0Z+5pZIYI8ZKAC8SS30zzKHIItoncwkPPLHvBHk3mTk2R5c7dGdQnJ9wIXi1ihaMm2TFEQ/hyTIRBJC0ARTFe2kuJ3t7l4HomJpO8mepf/ao04UKNZcR1vn0cmYuPdyE+kKr5b46PHTCf1bFUj6gQY3G6IVhXUhT+9xBtDwAqh4E0L1ELv7ThlEYpqW9PxutXsiMFAXaDDDWxuuIv4KXWCj+0aDnyILvXJSRJqOPdtTz/MX4jHfRDkr/0XVJ5gVEyMegV7erKekgZthg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	33+yvTnOm4CB3jJsON1uMnMVT8e2Nyv54la0khanzZElYTOMIFILA7jDuy8uUfmml2jttGW3VU7EvZ+QDaBfbEqzqokvfODBGfZif1/Jhnp4vOsmRKeSopyASKcN5C0QvroFA/+Fhl67oy36g5PJkvU552WnAuqTJRUeM0cdKJ7ry2UGKRyAPOw7TOZXhcw5t0ibGr3Wr+PCfOBPY9LvzIWozpQWcJ2CXty28tEJ6oeeLAMmF8eVo20kDikWDAE5+l8PzirgyaQL63GG5gQZbXauMsO+Zn6S12v2nnw64bw88pyXl7XrVbMczkKqWLsUjLIZVJZVMCi7I/qoDL03eBJXzvoSsLQWB0yUCogNoYNiqbileddkbemLuk8bBa9E3EtzlCUmt7o+wmRJSIFijYoJMe9USRXYF07d+6evXPbCw5e29SpltyMqoVDTzvns
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:37.8506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b97bd61-d1e4-4397-6813-08deddab43c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044

A struct notifier_block has a single 'next' pointer, so registering the
same instance to two different notification chains corrupts the linked
lists. Use a dedicated nb_axi for the s_axi_aclk notifier chain.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
patch added for notifiew_block

---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 289c32ab5cd8..bcbfb4341dba 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -126,7 +126,8 @@ enum clk_wzrd_int_clks {
 /**
  * struct clk_wzrd - Clock wizard private data structure
  *
- * @nb:			Notifier block
+ * @nb:			Notifier block for clk_in1
+ * @nb_axi:		Notifier block for s_axi_aclk
  * @base:		Memory base
  * @clk_in1:		Handle to input clock 'clk_in1'
  * @axi_clk:		Handle to input clock 's_axi_aclk'
@@ -137,6 +138,7 @@ enum clk_wzrd_int_clks {
  */
 struct clk_wzrd {
 	struct notifier_block nb;
+	struct notifier_block nb_axi;
 	void __iomem *base;
 	struct clk *clk_in1;
 	struct clk *axi_clk;
@@ -1318,8 +1320,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
 
+			clk_wzrd->nb_axi.notifier_call = clk_wzrd_clk_notifier;
+
 			ret = devm_clk_notifier_register(&pdev->dev, clk_wzrd->axi_clk,
-							 &clk_wzrd->nb);
+							 &clk_wzrd->nb_axi);
 			if (ret)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
-- 
2.34.1

