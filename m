Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6231D6DDD;
	Mon,  6 Jan 2025 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736152203; cv=fail; b=u+Gyjn4xycg7tHSSHtGe70+GZByXyldQw0gHnRLG5M+PGO7USRWHSyonlF76lQLKpOE835BInM08yR26vQdidIuEHbjL7f5kqtYFrKqqjH5os1flsBwWtdtGSAaP3L6eltv0th7IxwS1iUb/8ITSRLWj8PiLdoWY0f5rIjClblo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736152203; c=relaxed/simple;
	bh=NNtlpNl9Shlm4MMlmu1HobOhNC99ReL0LLg2pbt7XRQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QT1MBn2gzCD8TPT9NnPjoiuAeBxLHAy6ySU9aBZ9nuhM/jC4VmuuFqNxzqKnWAXi0MfYNFwR3cuaRTAQWh7Sj3NF7kkAfP0vS4oYEJVzjubIuAPQNZiq2a84ojkeg2Y75xownEGTtH/SSJzYa1QIUj8UftIGIgBgF16pffkTojk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pLafkotn; arc=fail smtp.client-ip=40.107.102.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pLafkotn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6kuyX5jqkNZuqAa+790jkoX+gHegAN5Mfa3prY8igVspVDwm+5jXlIyr/blUzFmhAH+9z6krqZBkIAAUTJpgk9YI5Zy1W1+vwdriItu9woSRRZCXC79piQMTEL5lxP2cZ79Su4Ea/wWFYYFmRUw8tDvPEkDc/N35eQ3edjSDpdPax5rVEu0+VbMvj5axgl9QRcS2vVQfOVw3CQRIRfEk/muWCDbIZH6rUUnEYbjj7pRZ2K7ga69RuE2nXOU75NTNJ1SUz3wwpgylanD5YzodDQKM9TT/mNWN/p4Judp6d5zJ/au0OxesI7p4AnB9wp3zDQcM1HGbfzzOPGhpc8Zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpW+I2cXpprDB6fqzzdSF5AgL9mo0sDBEMmxYPdOYBQ=;
 b=p4uzN3itAZSczQIrGtWkUeItDWG/EmLAEu4LWgDyUynFuTwJM2ecQzR86cZMYOoJQPaUVfd9UwHGEYH5RYcGC9Kwvq3fdsvhOY74dvEgDKPRxYkrkCt3Gdtd3javLjiBoYLSgxRmPpX3kniQdPjITEo3C9U80lkqcKv7vOYXzS+99D8lx5dKIEI6UNfKKYJ7E7DELiEXjZexVJ/egApJOOgT2aC2UkSL7NaEieZZmj2tymNwJdudgRuNNhcCycgQDMo6gOFjRzSFW6gMhgfHV43N/rLAZDQI33B1CKpLQAtK7XI3an+PODf74FwdplMMKuXMqCXQq2Yh3Ydf8cMMaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpW+I2cXpprDB6fqzzdSF5AgL9mo0sDBEMmxYPdOYBQ=;
 b=pLafkotncHzgQFRHNao9apSgjFPeh/PcQIl+LVMggnrgtTYkknXFosttkJApIfZoawYB34I/QFSQg77RMMgZcIHFnd/SSOsbIdBC0vx6nO3yJSTewsLwWnW1mC5x0/tf27LRrgjPmLE07kN4ooFZjmcZ97/Hpcen1e81Ct5Yg6w=
Received: from BN9PR03CA0525.namprd03.prod.outlook.com (2603:10b6:408:131::20)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Mon, 6 Jan
 2025 08:29:54 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::8c) by BN9PR03CA0525.outlook.office365.com
 (2603:10b6:408:131::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.17 via Frontend Transport; Mon,
 6 Jan 2025 08:29:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Mon, 6 Jan 2025 08:29:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Jan
 2025 02:29:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Jan
 2025 02:29:52 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 6 Jan 2025 02:29:49 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, "Anatoliy
 Klymenko" <anatoliy.klymenko@amd.com>
Subject: [PATCH] clk: clocking-wizard: calculate dividers fractional parts
Date: Mon, 6 Jan 2025 13:59:37 +0530
Message-ID: <20250106082937.29555-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: a7fff115-ca30-4bf9-f40e-08dd2e2c4be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p8PPWfVJlQrZjKEwDY/hyokpCjyNHx75m7BNu9rdmMs49D706LX8D6y/QfPy?=
 =?us-ascii?Q?7Nt5kqwyHChYhhvXZhlAeANupN8QbUKQ0vmucGgErgX6vkGGNavZ2wE1mRLR?=
 =?us-ascii?Q?wwh7bIwHvIW2WHAVkSzIF88+sA8ueRSJm443VpaYawvrkdkQ886gvN+vDLuY?=
 =?us-ascii?Q?FBuyI/nE0cIftgoJpcd/DivnlINa+WTVG8QSDKIKdAduNtPRp1vaM+3ek9Kc?=
 =?us-ascii?Q?lPADhPLYDy7BWSXnQw7Wx+nvJ+7Tyu0es/sLmTsMvGLMHVP0p4bGtuAnLKh7?=
 =?us-ascii?Q?OMalKxG0mduK/RDSQbwAS6DvXsFp8GvmXdolrVCqMonpJNwIlKU3aNi9Zk5D?=
 =?us-ascii?Q?R5qVz58SZqtGu3WkQzSofSXOmguoseYdzYf6K2fK9j8BmJpw8mP06mJMIAEm?=
 =?us-ascii?Q?XkUJTD8yzi9rNuuPwaFVnLqurvQ9fPcraZePWvcFk+WrC45MQJY6UWCq4O3v?=
 =?us-ascii?Q?JGMBWQQMW64qKlSKxukdg2k8FRT4Etf4yzPgXhbdicfF8z73hukTY2XZhjYw?=
 =?us-ascii?Q?Xa2LAZyBjijtZfc07YV25PO5uKlZlWG1MrUlpPQ6qIvLJtEdbY/q/El7k1h4?=
 =?us-ascii?Q?9zCVb7Do7iuKCWjwlid6rID7BjuaakJtv2JBPEivnDT+b7KLksEDZyIGesDT?=
 =?us-ascii?Q?av4UZpkEAYdAp6kYl1SobE/4qa91UOb0GqqPi9/aKNXyw9Qn1cdx4GnxO2ZU?=
 =?us-ascii?Q?+uTIbeQ0DdiUk0q5k/svu7HbPP9IYYTd3F2g0fO50ZLCsfQeiwCkeML5Au/3?=
 =?us-ascii?Q?DMSS1agc9uDJZH7Ys0KO//cazz7zeDBswfMqdZJXqCLCxs218c3SdFpDDibH?=
 =?us-ascii?Q?vfihayxZo+RhOHvfjydRXrvOJoHOjBUmx6Qi1r2rj6PjjcLr6Jf1tb+2Gj3J?=
 =?us-ascii?Q?mV/ZayilZS5SG/JHHdzEnl7EB8LFnFaGec8LXPBwZR+d3yWi1+04J1gwX4rr?=
 =?us-ascii?Q?o4UX75HtmaF/BVC2dG1fS46qYEOITgjVYEvXlSpl3yWzMePOwV9Q8gYv6tYi?=
 =?us-ascii?Q?zY4Tslkn5CebB459FCvn1/1qU5kVPuD+zyC6cbgW9JB2myINQ8UT8PsLiSjN?=
 =?us-ascii?Q?jd74Psj+YY3o3gV4FpJTCEY9hMXjajXfI+YakUR9QJ79Fy0yw1KKbaoVgOsT?=
 =?us-ascii?Q?lXsdMoqNAoKbALo7OoHGPGRy6N7FA7QEkVCDspaFzEc7Cme+pIBkSSF7nw9U?=
 =?us-ascii?Q?MFe9q0wT1/8YOoxbfxIjNwRPg9YifE5WRG5S0cOiwvRGJMDNXXBysitqxHsN?=
 =?us-ascii?Q?EGW53QojHe7E1+HpCX598bCa+wo2nFeMGvLOvQQ1C4rHKtQlCtxHxgDxr9Uf?=
 =?us-ascii?Q?stpEuHzBtY4Lc4nkoCjqSRH3lwqWzL+TjAqBtSVqmZ0oc5412RNJIb2VWCax?=
 =?us-ascii?Q?R8E6Cve/8WScyEbkcFokqSB+RIcQ3KMZPnof7rbZbC9s/6Jf4E+8eH2X6rKt?=
 =?us-ascii?Q?AZzwOceA6ZA02x3CPEyXlsxE4ghQ3BK6zfmt+vvLckc/dF58B2zvKij+J0cF?=
 =?us-ascii?Q?LiV4FONO4nXdUT4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:29:54.2169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fff115-ca30-4bf9-f40e-08dd2e2c4be0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298

Calculate dividers fractional parts to optimally modulate output frequency.
Clocking wizard supports having multiplier m and divisors d and o.
Currently the fractional parts of m and o are not utilised.
For the pixel clock usecases a higher accuracy is needed..
Adding support for m and o to have fractional values.

Co-developed-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Tested-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 121 ++++++++++++---------
 1 file changed, 69 insertions(+), 52 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index b2233d3ff9a9..bbf7714480e7 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -52,6 +52,8 @@
 
 #define WZRD_CLKFBOUT_MULT_SHIFT	8
 #define WZRD_CLKFBOUT_MULT_MASK		(0xff << WZRD_CLKFBOUT_MULT_SHIFT)
+#define WZRD_CLKFBOUT_MULT_FRAC_MASK	GENMASK(25, 16)
+#define WZRD_CLKFBOUT_O_MASK		GENMASK(7, 0)
 #define WZRD_CLKFBOUT_L_SHIFT	0
 #define WZRD_CLKFBOUT_H_SHIFT	8
 #define WZRD_CLKFBOUT_L_MASK	GENMASK(7, 0)
@@ -87,14 +89,14 @@
 #define DIV_O				0x01
 #define DIV_ALL				0x03
 
-#define WZRD_M_MIN			2
-#define WZRD_M_MAX			128
-#define WZRD_D_MIN			1
-#define WZRD_D_MAX			106
-#define WZRD_VCO_MIN			800000000
-#define WZRD_VCO_MAX			1600000000
-#define WZRD_O_MIN			1
-#define WZRD_O_MAX			128
+#define WZRD_M_MIN			2ULL
+#define WZRD_M_MAX			128ULL
+#define WZRD_D_MIN			1ULL
+#define WZRD_D_MAX			106ULL
+#define WZRD_VCO_MIN			800000000ULL
+#define WZRD_VCO_MAX			1600000000ULL
+#define WZRD_O_MIN			2ULL
+#define WZRD_O_MAX			128ULL
 #define VER_WZRD_M_MIN			4
 #define VER_WZRD_M_MAX			432
 #define VER_WZRD_D_MIN			1
@@ -153,8 +155,10 @@ struct clk_wzrd {
  * @flags:	clk_wzrd divider flags
  * @table:	array of value/divider pairs, last entry should have div = 0
  * @m:	value of the multiplier
+ * @m_frac:	fractional value of the multiplier
  * @d:	value of the common divider
  * @o:	value of the leaf divider
+ * @o_frac:	value of the fractional leaf divider
  * @lock:	register lock
  */
 struct clk_wzrd_divider {
@@ -166,8 +170,10 @@ struct clk_wzrd_divider {
 	u8 flags;
 	const struct clk_div_table *table;
 	u32 m;
+	u32 m_frac;
 	u32 d;
 	u32 o;
+	u32 o_frac;
 	spinlock_t *lock;  /* divider lock */
 };
 
@@ -372,38 +378,40 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	u64 vco_freq, freq, diff, vcomin, vcomax;
-	u32 m, d, o;
-	u32 mmin, mmax, dmin, dmax, omin, omax;
+	u64 vco_freq, freq, diff, vcomin, vcomax, best_diff = -1ULL;
+	u64 m, d, o;
+	u64 mmin, mmax, dmin, dmax, omin, omax, mdmin, mdmax;
 
-	mmin = WZRD_M_MIN;
-	mmax = WZRD_M_MAX;
+	mmin = WZRD_M_MIN << 3;
+	mmax = WZRD_M_MAX << 3;
 	dmin = WZRD_D_MIN;
 	dmax = WZRD_D_MAX;
-	omin = WZRD_O_MIN;
-	omax = WZRD_O_MAX;
-	vcomin = WZRD_VCO_MIN;
-	vcomax = WZRD_VCO_MAX;
+	omin = WZRD_O_MIN << 3;
+	omax = WZRD_O_MAX << 3;
+	vcomin = WZRD_VCO_MIN << 3;
+	vcomax = WZRD_VCO_MAX << 3;
 
 	for (m = mmin; m <= mmax; m++) {
-		for (d = dmin; d <= dmax; d++) {
-			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
-			if (vco_freq >= vcomin && vco_freq <= vcomax) {
-				for (o = omin; o <= omax; o++) {
-					freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
-					diff = abs(freq - rate);
-
-					if (diff < WZRD_MIN_ERR) {
-						divider->m = m;
-						divider->d = d;
-						divider->o = o;
-						return 0;
-					}
-				}
+		mdmin = max(dmin, div64_u64(parent_rate * m + vcomax / 2, vcomax));
+		mdmax = min(dmax, div64_u64(parent_rate * m + vcomin / 2, vcomin));
+		for (d = mdmin; d <= mdmax; d++) {
+			vco_freq = DIV_ROUND_CLOSEST_ULL((parent_rate * m), d);
+			o = DIV_ROUND_CLOSEST_ULL(vco_freq, rate);
+			if (o < omin || o > omax)
+				continue;
+			freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
+			diff = freq - rate;
+			if (diff < best_diff) {
+				best_diff = diff;
+				divider->m = m >> 3;
+				divider->m_frac = (m - (divider->m << 3)) * 125;
+				divider->d = d;
+				divider->o = o >> 3;
+				divider->o_frac = (o - (divider->o << 3)) * 125;
 			}
 		}
 	}
-	return -EBUSY;
+	return best_diff < WZRD_MIN_ERR ? 0 : -EBUSY;
 }
 
 static int clk_wzrd_reconfig(struct clk_wzrd_divider *divider, void __iomem *div_addr)
@@ -496,33 +504,22 @@ static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
 				       unsigned long parent_rate)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	unsigned long vco_freq, rate_div, clockout0_div;
 	void __iomem *div_addr;
-	u32 reg, pre, f;
+	u32 reg;
 	int err;
 
 	err = clk_wzrd_get_divisors(hw, rate, parent_rate);
 	if (err)
 		return err;
 
-	vco_freq = DIV_ROUND_CLOSEST(parent_rate * divider->m, divider->d);
-	rate_div = DIV_ROUND_CLOSEST_ULL((vco_freq * WZRD_FRAC_POINTS), rate);
-
-	clockout0_div = div_u64(rate_div,  WZRD_FRAC_POINTS);
-
-	pre = DIV_ROUND_CLOSEST_ULL(vco_freq * WZRD_FRAC_POINTS, rate);
-	f = (pre - (clockout0_div * WZRD_FRAC_POINTS));
-	f &= WZRD_CLKOUT_FRAC_MASK;
-
-	reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
-	      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
+	reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, divider->o) |
+	      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, divider->o_frac);
 
 	writel(reg, divider->base + WZRD_CLK_CFG_REG(0, 2));
-	/* Set divisor and clear phase offset */
 	reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->m) |
+	      FIELD_PREP(WZRD_CLKFBOUT_MULT_FRAC_MASK, divider->m_frac) |
 	      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->d);
 	writel(reg, divider->base + WZRD_CLK_CFG_REG(0, 0));
-	writel(divider->o, divider->base + WZRD_CLK_CFG_REG(0, 2));
 	writel(0, divider->base + WZRD_CLK_CFG_REG(0, 3));
 	div_addr = divider->base + WZRD_DR_INIT_REG_OFFSET;
 	return clk_wzrd_reconfig(divider, div_addr);
@@ -564,18 +561,19 @@ static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
 					      unsigned long parent_rate)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	u32 m, d, o, div, reg, f;
+	u32 m, d, o, reg, f, mf;
+	u64 mul;
 
 	reg = readl(divider->base + WZRD_CLK_CFG_REG(0, 0));
 	d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
 	m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
+	mf = FIELD_GET(WZRD_CLKFBOUT_MULT_FRAC_MASK, reg);
 	reg = readl(divider->base + WZRD_CLK_CFG_REG(0, 2));
 	o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
 	f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
 
-	div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
-	return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
-		divider->flags, divider->width);
+	mul = m * 1000 + mf;
+	return DIV_ROUND_CLOSEST_ULL(parent_rate * mul, d * (o * 1000 + f));
 }
 
 static unsigned long clk_wzrd_recalc_rate_all_ver(struct clk_hw *hw,
@@ -646,6 +644,25 @@ static unsigned long clk_wzrd_recalc_rate_all_ver(struct clk_hw *hw,
 
 static long clk_wzrd_round_rate_all(struct clk_hw *hw, unsigned long rate,
 				    unsigned long *prate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	u32 m, d, o;
+	int err;
+
+	err = clk_wzrd_get_divisors(hw, rate, *prate);
+	if (err)
+		return err;
+
+	m = divider->m;
+	d = divider->d;
+	o = divider->o;
+
+	rate = div_u64(*prate * (m * 1000 + divider->m_frac), d * (o * 1000 + divider->o_frac));
+	return rate;
+}
+
+static long clk_wzrd_ver_round_rate_all(struct clk_hw *hw, unsigned long rate,
+					unsigned long *prate)
 {
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	unsigned long int_freq;
@@ -678,7 +695,7 @@ static const struct clk_ops clk_wzrd_ver_divider_ops = {
 };
 
 static const struct clk_ops clk_wzrd_ver_div_all_ops = {
-	.round_rate = clk_wzrd_round_rate_all,
+	.round_rate = clk_wzrd_ver_round_rate_all,
 	.set_rate = clk_wzrd_dynamic_all_ver,
 	.recalc_rate = clk_wzrd_recalc_rate_all_ver,
 };
-- 
2.17.1

