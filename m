Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B910410D1B;
	Thu,  9 Jul 2026 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783595682; cv=fail; b=Fna9MocOAukGRla6cZVxFHPZ7h+aTDdaTHt+BHp0WPTNsuHtRB6qyZM27QvqIUfSUiwrD2Jus8jqb2/4hwO7UziV/HZMWlhVHVFqMF2NeviCEWBh7Je2bddOLlah3pZrkKmaTwrcSCw2skz4uGwVaD6PxbT/44cT3yPXPCdQHwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783595682; c=relaxed/simple;
	bh=7rDDFqhhave+qINoTFTp0eiEV5hSkbKeKlA67+Fh1HU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSCerh7GgLf5ed/Mh6nPtK1J8uwMXAFgepO7qQnyHaWrXTTJ7bVXV1e9VfdoNB3qzsvzYdVDeSq9l6bIbIpC0vcvUxG9EWpITXOCRLRpmPIwJjfzriGrfG5j8jeVt/zbBbVhNwgb2/MVkf6ogxumaql2qsH2aLBVeNP+DcNhro4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fBykiUNk; arc=fail smtp.client-ip=40.93.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fBykiUNk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tziWqIZjMPbyn6gd0rniGKZcJaTvFuzaPy5oMiyeGMDXutFmXo89pmfx9KpE6YKXjxPnkM7Neo0dYslLidCMfBLIxQ/xgOHZg76Io7jUXc+JASaQpYjM37lS9L9UrgPESwVtTF6lIMpcA4pP8nMk0uflKB0UcK+rjw1uYrCpes/M6vFP81fdjJCx9ma0Zy3DkYb2J3dVEzplz+Lp+kTD2qwMD5d+m0aYb1bw+H/VejeFh//jo/14Lm0FJ1zQ80MNjeG+YYi6b37pMr7KuQpppSBgcH5iCw3hIGZzKXLCaK2AGt0yux7acB+v8GKsksHnes9PUKibAucEE4CVGt3o1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvQBSVfPUtwkphaZDn/GGpEMPaQ8EUHJzZVQUUYNAlA=;
 b=WubLfkhmZ7ZaimpxVB1YfBHg+wZbcNKaTY1O9Pme/auRaADnW/ZXtjP50UWD3RK4OCr8DY87Rb+k/aW8rk6PQttt4AribNuSS8N9iGmUulSq8bSEfm1Klz6Kn17KmpFO5KLt+ehRc4v9Ky3iH7+i9HEzcRA37X6WwLewNcoLdTUv9/wsZ/22TVravF1yzv6Autnk08zbwnxhg4gTSmQuwHE/nPvN5Ir9uK1swD33+SzMaohKraAjxhm9xmoiCyW0bllw0MCFi2X73wI9KYvNq1pi44ds0ouwdDxkTcCHyCgvT7zUtyLvcp8gHq+3iLnlfANa/QoBgFWygcTH6VypMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvQBSVfPUtwkphaZDn/GGpEMPaQ8EUHJzZVQUUYNAlA=;
 b=fBykiUNk6QOvW8belGWQyW0ux82tYMm74RXVQXH2acBwYKNfjfzWO20gNlO0L/R9Si+zRdkeE0WCivULrdb2EGVEbSFvW2WkbUFEaN/SuFFKr3jOGT9PnWW5UWyI7o3e67f7JJyaYcNeNupDVOUrJD1s1ifrYKIv/XJrCkS4oSI=
Received: from SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::7)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 9 Jul
 2026 11:14:34 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::97) by SJ0P220CA0001.outlook.office365.com
 (2603:10b6:a03:41b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 11:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 11:14:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 06:14:32 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 06:14:29 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 7/8] clk: clocking-wizard: Fix division by zero and unbounded register write
Date: Thu, 9 Jul 2026 16:44:02 +0530
Message-ID: <20260709111403.1579159-8-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: a69a2297-7439-4d32-0bdf-08deddab419f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	p/0DULcUwk5S670A4MdYWz/BboAQRDaVhFy1aUXXZ5GXKK5ZsvZZAqyWVX0tgR/UyR2byblH/ZEfzivwplbs+ZpdAoQWixCYYCu0XDUBnjIAPIhkCiEPRTyQEdhk5L2wh9+tPVBLYKyUCjNw3Cd5WbDp06qFOlsUI6VzeIBwbsWSBEr0w31l150rngnBc5d2NI2LHP+9+Nra4xQw+PJZdyMrMRZYG1QyVG8QEg3mC2WSN4PmeAxgchmfQRJYuyiErC0AGZcId1+1bVmCTYIi+seVfORADq4WZWmx1bun+8+ojaTPtP/sEjJleixgAvlZuQpPM6jX/gBmAW/Mk2ebbtrcXC5XyjYaHX4h/0KqkhmBopvLKIiWMhmUFMi9s/7jJjEhkbyQD9snHQDSZ5ZLgih31eLaPPehAqUW2nZ8Ejcw6oZ54l/AQEd0xm2o/W6xDJscfZaYfMIZO5Loqbovs7BWvRkpX/3HkbRGQB28m6A+DxRsafHt3s6hLDafBlSwAMzTQu+FG4C0re5hq8D8byPl6gVzz2hxgajMy0QrJAhAzbHZsdKxigOwY12ZXzxgQ92c1ZZNAeyBn0QsL2yDqyhmdB8WuPRGYK6HS8H8bsg6uc0m+HOEE6fySL9ql/9hCLjQZLrgwg2YBhI2Jx/rSh3XbpGkq+nBDEIfs+iFRqxz4p/iKHLkm3g+/Oh3JtCj/ZkB2GRk+5RSI/ACp4KuVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5Iy537L60sOTns9pNxCcNNtZYpNvsfHfvU+Ma5YPJO9O4OAEVVEqlbj0eibrYY+od7zGAaUBzxKJzclapS+gZvTF6ndZ4dYk1gfdlCsjVXhsCnyzhX7/0LCwBTejm79PHjMR8NEDsH3x/tUJEcOXhEAJSbO5f6VeRd1xemntBIUjGXZOgigxnsBELqKy9nKPuy2EICIARI8PBCLobB+3cUImnRBSRDlsrZYAl6xMYZiObII+6lrY6/P9eeviSDlhsVYkHCtSb+zbBJl1xSRPsIbbqXIjGh7EZaBvGWmys8dcu8dtjcaPfxo0ovFAa21CG38CQsiuvSG4QtvLz2FgRRJMrC+ebIOLOs6QRu2CL8YKps3OM8j5oNQCDywJJMOxTYElsX6/iX/C5AUUjPWSpH3kZraBNJ/5ru5WjBglpspYrRFUOLUkau5OupJOfKws
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:14:34.2524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69a2297-7439-4d32-0bdf-08deddab419f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064

1. clk_wzrd_determine_rate(): DIV_ROUND_CLOSEST() can return 0 when
   the requested rate greatly exceeds the parent rate, causing a
   division by zero on the subsequent parent_rate / div. Clamp div
   to a minimum of 1.

2. clk_wzrd_dynamic_reconfig(): min_t() result was not assigned back
   to value, so the cap to WZRD_DR_MAX_INT_DIV_VALUE was never applied
   before the register write.

3. clk_wzrd_get_divisors() and clk_wzrd_get_divisors_ver(): If rate is
   0, DIV_ROUND_CLOSEST_ULL divides by zero. Return -EINVAL early.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Patch added

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 381e396aef0e..289c32ab5cd8 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -296,7 +296,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
 	value = DIV_ROUND_CLOSEST(parent_rate, rate);
 
 	/* Cap the value to max */
-	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
+	value = min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
 
 	/* Set divisor and clear phase offset */
 	writel(value, div_addr);
@@ -334,6 +334,8 @@ static int clk_wzrd_determine_rate(struct clk_hw *hw,
 	 * achievable
 	 */
 	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);
+	if (!div)
+		div = 1;
 
 	req->rate = req->best_parent_rate / div;
 
@@ -348,6 +350,9 @@ static int clk_wzrd_get_divisors_ver(struct clk_hw *hw, unsigned long rate,
 	u32 m, d, o;
 	u32 mmin, mmax, dmin, dmax, omin, omax;
 
+	if (!rate)
+		return -EINVAL;
+
 	mmin = VER_WZRD_M_MIN;
 	mmax = VER_WZRD_M_MAX;
 	dmin = VER_WZRD_D_MIN;
@@ -390,6 +395,9 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 	u64 m, d, o;
 	u64 mmin, mmax, dmin, dmax, omin, omax, mdmin, mdmax;
 
+	if (!rate)
+		return -EINVAL;
+
 	mmin = WZRD_M_MIN << 3;
 	mmax = WZRD_M_MAX << 3;
 	dmin = WZRD_D_MIN;
-- 
2.34.1

