Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE1A39A06A;
	Fri, 31 Jul 2026 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482498; cv=fail; b=kjux5Grg3GIIbCApEyqQ3fwCol479Qys8WbuO2PIh8rKMeozXpJ10ec+bCJo62JWggJL9qyKsftR4K60Ygmwlwbs9yoyeqnWxfAw9kt1MzmlZ93NxvLes84gfIUfpsxMFLJDYLAi9LOEzBcgTx1bwjN5Im5R8qjck49gfijmVuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482498; c=relaxed/simple;
	bh=PEB0lEyD5R6YkrfH4+FRZgmJv+XVAcYUDwkQ8JwaaNY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFqP9pJg/6tXM2RjsrEptnmYrxW5jlIgh8Yo64grM+wrAELvUeaKUhatvUlc/D8TdvSlSexrbdtrY0HhcmiWFswlcY9ISHV7H2XnF0vDjQ6fHA/aJp5N3/R+N6L1Ks7cps0tMYt93yIAf23dKVfk5Whpep11ORUgUfHdwdkOcZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=deEtxXHU; arc=fail smtp.client-ip=40.107.208.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="deEtxXHU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJghhJHtOLBA1ep/Fm9hNJruExssxiVCiB0nuaTvC9A78/ZNHJENQxpdNGCAUOyOM39Z046A1VtEDAfc52mzHS0M18M8vi6WVGecPBI9A5k52qOCS9lhN789NGALQgEpKhzolZcuz5a/HOpEgkHFA0nuqVTD2RYxjjoRcivN/9fxjsuV9Hpr4rpPB3Dlaxo+sDlgnBNM9rJZ/qLB8eLLOPDMGdHxCJDyyX1oMWreza4Sdb0hPVc4ZgI8znZtPtKT0BXexQrE0lzW3DrFvtMD7CG98ICSENIWt2GTHud7fliqN4vbGXYGtHbGeUzmQ+7NrMtVrkaeJivum8vZAR/fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQ+MPc6aVFNk+sHEhVVUZqpfFImd2lq/KbXL7m1PyoA=;
 b=Vb55WTBkFM9JBq1lo6jbWTNhzIajX9q8HFRmwX/30EPq70sm91u0tf37IAWLaVHItSUYYdgWNC4rBHBFOcCRDlgUue7V/KOwUiaE920XCFceGNgroZjrw7rFU8zHNTkdcHGoOXmGXX2VDwfUbS6z+jcWHPYmJOLrmHfxdO/2lm3KAATkIH5CuOOv0V/sQWU2KCB4QuLI+1rPopzCA63tbBMp7e11bl1msSeGT5Ax/r8vDfPjteSalLUpJMe0EaYZARdwuHFZ0Sm5qjNR+uSTPAIw+WvwCFqX62HO615YiQueXdJ7YMg8tfIQGmFmtQ+cS5PaWIpIPK7KjdAfZ33Pow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQ+MPc6aVFNk+sHEhVVUZqpfFImd2lq/KbXL7m1PyoA=;
 b=deEtxXHUvhZVENuZS0EoWLbptrm9eH6qmO6bY0dE5lMPD2D1BgbA7uFrPr7rFG6M6KyjHjzplH+8nqQi2rsSfgJzMS1KWbEsCp7S7uvD0uTm7UudQgAmaoE669yHztErdP5f3SkEv9D82UmpYtADWRDbXUulxxYnyKXAQVuO3s8=
Received: from DS7PR03CA0019.namprd03.prod.outlook.com (2603:10b6:5:3b8::24)
 by LV2PR12MB999073.namprd12.prod.outlook.com (2603:10b6:408:352::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:21:25 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b8:cafe::75) by DS7PR03CA0019.outlook.office365.com
 (2603:10b6:5:3b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 07:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:21:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:24 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:21:20 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 8/8] clk: clocking-wizard: Use separate notifier_block for each clock
Date: Fri, 31 Jul 2026 12:50:49 +0530
Message-ID: <20260731072049.957624-9-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|LV2PR12MB999073:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e15d987-512c-4064-e11d-08deeed454b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|82310400026|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OhgYwzt8g4zYw+VHuaX38xgsxVZfLuamiNznn4eOofumJ0DVZ0X38aacOZV62lkxZoh1UPylmDryaXNfMkCRDXy+9OJtAawngRQ52AuLcgfE61uQ4IQgTh69dBr5Fi7JVK1c3GcA+bz8iK1WOOFlzdMBi+VR8C8k/13+olJS7+m6MYqv5gCC/+sH2ZBARF/2ZMmck5V1C60hwDmvOS8OjPzYqG0L+M8dRv2JEjFK6CgnPAaJ7Xk6hnMfKbuK1PlD8tkSbqPY+GTTgTLj3Vanh7Ky95jUAxVsLUFpt1779Tmqc9HH8j1Hsu+YQTQQAgsyEAdCnqkZ2LCnDczjCrKkIboFpItWcDPD3mY3hAqo01SebeYmsu7U3jFVqH35SbO67VCh57UGMHJBUKGVUXL+2C7FoalhgUcs0ZIX4BeqXJBcctEYTBHXiXghI3pnSLL99UQVbHP9EzJSEzWNPHJRzMCqmAoCz0c2+v2Odb38LrHpv9/7jMTDLkg48NCR+abADZDX8SHltHNRSBLcAEIH5CSZypdNsIlw1uZe5Q0ZG3snqNIRAwtRS5CJDVh5OzRpzAEROCsB3LzW1HLokSstKSyRIeNjScaK1vha5b5mNEyAeD+QmEu3XAuf2mHBN0zDdvFbj/LBATsJBh0oqe6ocqpnghzBE/0/gQ5rcXbG6tA6rTTeR1YdNx/uWpDafX0R/NTdQRbkDW/2LuoORRtP5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7/PjZsqM/MOteZPodX7lvfmRx0gGAA2n0W2aCnji/S4JHBdHHoT87z2NFptH8WvRDO5el+G9tpcdGiIBh9e32ObQ6oyZPowiZlDZQJmH00LC4riy5HVXQdei+S6r8zw5PJT6bMKxAsUumXnkwWvNboTl3Og7TvXFfi7D/kPYeS7I3uRwrxGkQtvaaVoJUdn0ZNqnGQbEL8lUHfSZkWY5qcK81kIcqa02aV+AEKhgZJHm+PmdPK1lhwsGhgQWlzfVwZspR8vcahMxlIbFwLz0Du8p/DirIVknhuJBaAqAWyzvhHjwNJOVep3ICe2ol2E8RWzF8Vxe2Dr+WLUmLAyf3eQmCRwwdwgCqilQZfT4Ni9UXPgxDgRtl/23mdvBxXpKN77t+yiN2Y7WfsB997YSlkwiIl5u6BK4iL2WoOriYtt+8POV12KmEATo4TA9hpbR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:21:25.3873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e15d987-512c-4064-e11d-08deeed454b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999073

A struct notifier_block has a single 'next' pointer, so registering the
same instance to two different notification chains corrupts the linked
lists. Use a dedicated nb_axi for the s_axi_aclk notifier chain.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
Split notifier into per-clock callbacks

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 42 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index b16656a11f4b..cfad11593b2b 100644
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
@@ -184,6 +186,7 @@ struct versal_clk_data {
 };
 
 #define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
+#define to_clk_wzrd_axi(_nb) container_of(_nb, struct clk_wzrd, nb_axi)
 
 /* maximum frequencies for input/output clocks per speed grade */
 static const unsigned long clk_wzrd_max_freq[] = {
@@ -1024,6 +1027,30 @@ static struct clk_hw *clk_wzrd_register_divider(struct device *dev,
 
 static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 				 void *data)
+{
+	unsigned long max;
+	struct clk_notifier_data *ndata = data;
+	struct clk_wzrd *clk_wzrd = to_clk_wzrd_axi(nb);
+
+	if (clk_wzrd->suspended)
+		return NOTIFY_OK;
+
+	max = WZRD_ACLK_MAX_FREQ;
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		if (ndata->new_rate > max)
+			return NOTIFY_BAD;
+		return NOTIFY_OK;
+	case POST_RATE_CHANGE:
+	case ABORT_RATE_CHANGE:
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int clk_wzrd_clk_notifier_in1(struct notifier_block *nb, unsigned long event,
+				     void *data)
 {
 	unsigned long max;
 	struct clk_notifier_data *ndata = data;
@@ -1032,12 +1059,7 @@ static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 	if (clk_wzrd->suspended)
 		return NOTIFY_OK;
 
-	if (ndata->clk == clk_wzrd->clk_in1)
-		max = clk_wzrd_max_freq[clk_wzrd->speed_grade - 1];
-	else if (ndata->clk == clk_wzrd->axi_clk)
-		max = WZRD_ACLK_MAX_FREQ;
-	else
-		return NOTIFY_DONE;	/* should never happen */
+	max = clk_wzrd_max_freq[clk_wzrd->speed_grade - 1];
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
@@ -1310,7 +1332,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		}
 
 		if (clk_wzrd->speed_grade) {
-			clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier;
+			clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier_in1;
 
 			ret = devm_clk_notifier_register(&pdev->dev, clk_wzrd->clk_in1,
 							 &clk_wzrd->nb);
@@ -1318,8 +1340,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
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

