Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C4F3B1B3;
	Mon, 29 Jun 2026 05:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782712317; cv=fail; b=aKL54scN7Y7Tr5ynOjk7PE5mVAv0F9yfgls7NLI1GhY7hTu2ye8IXZqjBO5lUEN357416rCh9ibxcX88AJ7HS4I3tucSOhl3nZJM4AsLndr3gbsbAPNKVAbgck3siCNScHygvdAlbBdwIzR1dmxlz+H3UfI9Co7uNYBPLCLiM4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782712317; c=relaxed/simple;
	bh=yzrz/01Iw/osdQztjssiPrjtSXocC83kTrNM3NnlpTw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u82Dvl1V7MyBSpG9bHzQQyQ2Fa8YCRBWdACt2kcXBMD63c4NL1bT+wrJa4R5oBPiWeODaUrxPmb3QoVb3ZrnLgyikaqLVhLlV7J0ns1Yx4u3AJQkkJm792oDsqVHW0Rz4iX2O3dN1uOBJKpDgHUwlR5slkbOkAfCgz5XGStEznw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b2aHTqLp; arc=fail smtp.client-ip=40.93.194.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b2aHTqLp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czyJnfV9eR2DmI856W+omXx2sgl1c8/9NOhm7IUFF/Y1ZJBSjepDdWYCmv0jtiYmFQm8eSsPzcQRlXKp3JFNoFyBn3lHb14INq8TED53V7s7W4A5WlonCqzhqAnZD6wn89OgDZTTd2tpDIyXZk4stulivyL8Wm9PlYCy/WUHt9BIVEglVaPjsKkew5kF97DMDja+TgCNA2CV56ujxNUhAEC/IHJHL5oFVcccmKexpnxLXNIqunOtkTLP4syzd7wzVYFKy6fYCEpuUlY+yXIJ+W4IkBbdjh8LeU4sKVNXbtrw83nGZLEaIrELalv0lTOGeNHtTlNbnbwwlN2v3KyyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSfZ9hw+HGLWvU8fahf4lbUqA2yODH0sqTL6cJ9ESr4=;
 b=vdvpYVB+IKjztC76CV5z58i7Ek3gOHhB7WaGjxMKMuUG+fVE0gI4aUfy+GCBSBRzFpi4922PR1vBYIsk657Ece7+LULt/OkCINofgJSears7YQv/bkq+PnyYydvkrcK3AC+PyiyfUGvW7LBty6PUbDICnbskXv08GjdpIxZpQd4tpHkOFOjZvL9emDLki8QSVRKgvVaWh+GQvIwvLWSD/o94lT85rJJaLlGCxDCb24rr/g2C0yF3kwbs48OgE/zh9iuXKKaiTMl3GGEiWcBt+iaNoGqoGBwwqzyBLh3KGCZ4NhsAtdwjhJTm+PL6mTGJoS3o45k+Phyddih9hpFElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSfZ9hw+HGLWvU8fahf4lbUqA2yODH0sqTL6cJ9ESr4=;
 b=b2aHTqLpB3xXsW1uBguxfDqNK9wXtAYliIRDIbWPODAKWomIOgLUYsrv1HwNAx1Bd57QBdMj8w6jRbG7pX+tIlX0S+33O0ITosJzEilOg3ILfBwP81/ivmi8mPUeqSaKYUdon4sBI21bBW+qcgjOPp2KIKQE2JKlmlKFqUS78ng=
Received: from BLAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:208:335::17)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 05:51:51 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::e) by BLAPR05CA0036.outlook.office365.com
 (2603:10b6:208:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 05:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 05:51:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 00:51:49 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 00:51:47 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, <shubhrajyoti.datta@gmail.com>
Subject: [PATCH v2] clk: clocking-wizard: Program PLL CP/RES and lock parameters on reconfig
Date: Mon, 29 Jun 2026 11:21:46 +0530
Message-ID: <20260629055146.3375332-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6b0d2b-72be-48ed-c6a6-08ded5a283f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|18002099003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	WDvW9PxHWFdR0nGCsimarGU1ghUg/xa9pMVAtsKEVHzrtV2y7T3rhjvf2dDrTrSmLTaR9tKY50O+mEE1c/5jiyzCDF/LNZyoUu2lz5DjUJ8PxJderoWCQQV0GU2BfsPxWnWEi3HONE8XI/mgWf6/s7UGQkQ9HyN6kY/qjxgtt6kbkJ865rNM4CRpzn/olW9GsXW1bArASlN733hSGqq0BGeFFLmt1x01geO2/aaKMD9hu/3fCutiR0DJSyEoDZ06N3cFvR7nvU6lATIpFU9iDY+snWGygqLcGYREZzEa5GHXJUqtxgZ65i3ZQ1MaK1owBBfsdn06ZTf4ABNqWpC9PexnoSiFqphp8sYEP2OW3wXzgvkuXgy2PcHLR7st8BbQChzol/woZ2fKqC8GaTySDCXlpr+YqrIcmf47n8Bshfz/++S+gJhGfR+hT2ZaWWsVptMCH4GTriNQgXeYvcbiVRzoEwF7PA7XfDtlu1b3qeDUOA3PyYUangQ2HgQp4duE8qoAKzz88qF/JAXpM3+BZaud9MgXXRM3GfiDXJv42PxRQzi+U99vh7c8RuFmrgWDXXErkWTTUlL8uM7Tzs5Jn7zD079iZK/pkRUiQg6eRuewECRbDouMAWIZObtomk5d0Y3eO2kLgIV2L0DFeVlVzgtZtbf6OI5iz0UeQvwXtyyUS9cospcOROoFrhFCPiMtGHEZkpxu8q2OA4Mg7toEzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(18002099003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	80lT2ucAk+bCEp6shewrLTJzPrc0eJaRiORFUqgSk4RUOk1mDOzv3FkV+pE9Ucs1gigHeSbckOQ+dv9fMdK5W4DiLqU96W49otUWX3gQT+gEBUI3bEkl1tbBSJvGDzFyRRvtO50L3cT4JpcXE6WPD9+u+1GVPyVILpgyzA23IWjWm7eInn1tO7wmTnAJB3FE+VK5TQnAyZzY7Hgt+pcoWbqLkUeAIcAfCgC72wR3AP8XOR6KlqYyCPWU+mnFB1i5mzZfhQqliWkrKbQ3mOADx228Bl8y8CxG1kDl/Xov97o0eH/iiXo6Q0wGQawb1GRLr8VZpDId/qjXEnZ/ZaDALImbx+KVywXK3565m4gBFfVIDWbQRplefEs3J4aK2ZuUW2HlaWGbmvOk/pHK2Kf2hfwkFCnS9Q6tdNJamlGt1p7Paiw0PRIvOdoRzT7h1SO0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 05:51:50.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6b0d2b-72be-48ed-c6a6-08ded5a283f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

When dynamically reconfiguring the PLL multiplier, the charge pump (CP),
loop filter resistance (RES), and lock timing parameters must be updated
to match the new multiplier value. Without this, the PLL may fail to lock
or exhibit jitter at certain multiply factors.

Add lookup tables for CP/RES and lock timing values indexed by multiplier
range, and program registers for chargepump and lock delay during dynamic
reconfiguration.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

The algorithm is not currently documented in PG321.
The AMD documentation team is in the process of updating the relevant documentation.

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4a0136349f71..f5d14543167a 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -35,6 +35,10 @@
 #define WZRD_DIVCLK		21
 #define WZRD_CLKFBOUT_4		51
 #define WZRD_CLKFBOUT_3		48
+#define WZRD_CP			18
+#define WZRD_LOCK		27
+#define WZRD_LOCK_REF_DLY	28
+#define WZRD_RES		30
 #define WZRD_DUTY_CYCLE		2
 #define WZRD_O_DIV		4
 
@@ -49,6 +53,10 @@
 #define WZRD_P5FEDGE_SHIFT	15
 #define WZRD_CLKOUT0_PREDIV2	BIT(11)
 #define WZRD_EDGE_SHIFT		8
+#define WZRD_CP_MASK	GENMASK(3, 0)
+#define WZRD_RES_MASK	GENMASK(4, 1)
+#define WZRD_LOCK_FB_DLY_MASK	GENMASK(14, 10)
+#define WZRD_LOCK_REF_DLY_LOCK_REF_DLY_MASK	GENMASK(14, 10)
 
 #define WZRD_CLKFBOUT_MULT_SHIFT	8
 #define WZRD_CLKFBOUT_MULT_MASK		(0xff << WZRD_CLKFBOUT_MULT_SHIFT)
@@ -440,6 +448,130 @@ static int clk_wzrd_reconfig(struct clk_wzrd_divider *divider, void __iomem *div
 				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
 }
 
+struct wzrd_pll_filter {
+	u32 m_min;
+	u32 m_max;
+	u32 cp;
+	u32 res;
+};
+
+static const struct wzrd_pll_filter wzrd_cp_res_table[] = {
+	{   4,   4,  5, 15 },
+	{   5,   5,  6, 15 },
+	{   6,   6,  7, 15 },
+	{   7,   7, 13, 15 },
+	{   8,   8, 14, 15 },
+	{   9,   9, 15, 15 },
+	{  10,  10, 14,  7 },
+	{  11,  11, 15,  7 },
+	{  12,  13, 15, 11 },
+	{  14,  14, 15, 13 },
+	{  15,  15, 15,  3 },
+	{  16,  17, 14,  5 },
+	{  18,  19, 15,  5 },
+	{  20,  21, 15,  9 },
+	{  22,  23, 14, 14 },
+	{  24,  26, 15, 14 },
+	{  27,  28, 14,  1 },
+	{  29,  33, 15,  1 },
+	{  34,  37, 14,  6 },
+	{  38,  44, 15,  6 },
+	{  45,  57, 15, 10 },
+	{  58,  63, 13, 12 },
+	{  64,  70, 14, 12 },
+	{  71,  86, 15, 12 },
+	{  87,  94, 14,  2 },
+	{  95, 145, 15,  2 },
+	{ 146, 163, 12,  4 },
+	{ 164, 181, 13,  4 },
+	{ 182, 200, 14,  4 },
+	{ 201, 273, 15,  4 },
+	{ 274, 300, 13,  8 },
+	{ 301, 325, 14,  8 },
+	{ 326, 432, 15,  8 },
+};
+
+struct wzrd_lock_timing {
+	u32 m_min;
+	u32 m_max;
+	u32 ref_dly;
+	u32 fb_dly;
+	u32 lock_cnt;
+};
+
+static const struct wzrd_lock_timing wzrd_lock_table[] = {
+	{   4,   4,  4,  4, 1000 },
+	{   5,   5,  6,  6, 1000 },
+	{   6,   8,  7,  7, 1000 },
+	{   9,  12,  8,  8, 1000 },
+	{  13,  13, 10, 10, 1000 },
+	{  14,  16, 13, 13, 1000 },
+	{  17,  17, 16, 16,  825 },
+	{  18,  18, 16, 16,  750 },
+	{  19,  20, 16, 16,  700 },
+	{  21,  21, 16, 16,  650 },
+	{  22,  23, 16, 16,  625 },
+	{  24,  24, 16, 16,  575 },
+	{  25,  25, 16, 16,  550 },
+	{  26,  28, 16, 16,  525 },
+	{  29,  30, 16, 16,  475 },
+	{  31,  31, 16, 16,  450 },
+	{  32,  33, 16, 16,  425 },
+	{  34,  36, 16, 16,  400 },
+	{  37,  37, 16, 16,  375 },
+	{  38,  40, 16, 16,  350 },
+	{  41,  43, 16, 16,  325 },
+	{  44,  47, 16, 16,  300 },
+	{  48,  51, 16, 16,  275 },
+	{  52, 205, 16, 16,  250 },
+	{ 206, 432, 16, 16,  225 },
+};
+
+static void clk_wzrd_update_cp_res_lock(struct clk_wzrd_divider *divider, u32 m)
+{
+	u32 lock_ref_dly = 16, lock_fb_dly = 16, lock_cnt = 250, cp = 15, res = 15;
+	void __iomem *base = divider->base;
+	u32 reg;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(wzrd_cp_res_table); i++) {
+		if (m >= wzrd_cp_res_table[i].m_min &&
+		    m <= wzrd_cp_res_table[i].m_max) {
+			cp = wzrd_cp_res_table[i].cp;
+			res = wzrd_cp_res_table[i].res;
+			break;
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(wzrd_lock_table); i++) {
+		if (m >= wzrd_lock_table[i].m_min &&
+		    m <= wzrd_lock_table[i].m_max) {
+			lock_ref_dly = wzrd_lock_table[i].ref_dly;
+			lock_fb_dly = wzrd_lock_table[i].fb_dly;
+			lock_cnt = wzrd_lock_table[i].lock_cnt;
+			break;
+		}
+	}
+
+	reg = readl(base + WZRD_CLK_CFG_REG(1, WZRD_CP));
+	reg &= ~WZRD_CP_MASK;
+	reg |= FIELD_PREP(WZRD_CP_MASK, cp);
+	writel(reg, base + WZRD_CLK_CFG_REG(1, WZRD_CP));
+
+	reg = readl(base + WZRD_CLK_CFG_REG(1, WZRD_RES));
+	reg &= ~WZRD_RES_MASK;
+	reg |= FIELD_PREP(WZRD_RES_MASK, res);
+	writel(reg, base + WZRD_CLK_CFG_REG(1, WZRD_RES));
+
+	reg = lock_cnt | FIELD_PREP(WZRD_LOCK_FB_DLY_MASK, lock_fb_dly);
+	writel(reg, base + WZRD_CLK_CFG_REG(1, WZRD_LOCK));
+
+	reg = readl(base + WZRD_CLK_CFG_REG(1, WZRD_LOCK_REF_DLY));
+	reg &= ~WZRD_LOCK_REF_DLY_LOCK_REF_DLY_MASK;
+	reg |= FIELD_PREP(WZRD_LOCK_REF_DLY_LOCK_REF_DLY_MASK, lock_ref_dly);
+	writel(reg, base + WZRD_CLK_CFG_REG(1, WZRD_LOCK_REF_DLY));
+}
+
 static int clk_wzrd_dynamic_ver_all_nolock(struct clk_hw *hw, unsigned long rate,
 					   unsigned long parent_rate)
 {
@@ -471,6 +603,8 @@ static int clk_wzrd_dynamic_ver_all_nolock(struct clk_hw *hw, unsigned long rate
 	writel(regval1, divider->base + WZRD_CLK_CFG_REG(1,
 							 WZRD_CLKFBOUT_2));
 
+	clk_wzrd_update_cp_res_lock(divider, m);
+
 	value2 = divider->d;
 	edged = value2 % WZRD_DUTY_CYCLE;
 	regh = (value2 / WZRD_DUTY_CYCLE);
-- 
2.34.1

