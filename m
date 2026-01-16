Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA72853E9;
	Fri, 16 Jan 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594053; cv=none; b=kYqVqsMwOiv05oZ0mJ64XBw/glbBYXfsd7MflRoOLrkca1845pZqd0JXFgjP+nT14e3h5AQVZkfnKygzZqeR9cqE/otGFds/9hFeeDIv/FUf42UVEZcc9dIglPefAkeOBZ2bAzJzKgfC5iN8DH2NTvq3xAOTBgmW7jcYyhmB9lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594053; c=relaxed/simple;
	bh=NbFY8j22LoZrz5QHk0SMMWMHG/99YZmbYHxUpEdPYWc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qb662mPLrNAvQClm8+m3aQIBWSvcMq+hBvu0QrlSJB6TAYEPAVt9BCTMT4zAmcsZ35gi1vHkT6UazissOu1JYVcWuwm0s1bYc7KAeEwv9a6YxnPflxH43DAquj9/NwU8JWguptOAYF9mLkNYaWVEcbz7uJYdIeIVkEJtIIM42LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XjtAa3Zb; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XjtAa3Zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594049; x=1800130049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NbFY8j22LoZrz5QHk0SMMWMHG/99YZmbYHxUpEdPYWc=;
  b=XjtAa3ZbD9eQzXMauF2hvut2A1KR4/Jqw3wAVSf0xU4EZlSMfckIsy0S
   MM9uOQWQDIY73OXNS2ACpboYfrEpP6f0cDlX6HGFWSaIjp0Z4fU1mIm7P
   uFP0R6sPLGHuWuA2rdDwWZOmpxdMliv2Wzp7gN3JEGsUBe8p4MpnDKkEW
   ptirH7jviGB6GlKMaZTT4v8idlLlCdC6zciDs4bvKKU2ijiZr+Ptz4aKI
   YZBEs+oRU5FKo8v4NbZcgi0TrnnB7+QrFtvHTR5xlowbI1AgwiPYYfkKH
   uX+2NQwOS+MrZ36bYkVMzTLXtaFv8QKNlPY2Nrl5cOfbNWncCeJLN+9CX
   Q==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: m+tfrlt1S3m7umrzCfIEXw==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042237"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:03 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:03 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 03/31] clk: at91: sam9x75: switch to parent_hw and parent_data
Date: Fri, 16 Jan 2026 13:06:56 -0700
Message-ID: <30ba2ce066b788f5b5bcbf3db927b30293d881b6.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Switch SAM9X75 clocks to use parent_hw and parent_data. Having
parent_hw instead of parent names improves to clock registration
speed and re-parenting.

The USBCLK will be updated in subsequent patches that update the clock
registration functions to use parent_hw and parent_data.

__clk_get_hw() will be removed in subsequent patches in this series.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 305 ++++++++++++++++++++++----------------
 1 file changed, 174 insertions(+), 131 deletions(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..c48c91da914e 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -33,10 +33,22 @@ enum pll_ids {
 	PLL_ID_UPLL,
 	PLL_ID_AUDIO,
 	PLL_ID_LVDS,
-	PLL_ID_PLLA_DIV2,
 	PLL_ID_MAX,
 };
 
+/*
+ * PLL component identifier
+ * @PLL_COMPID_FRAC: Fractional PLL component identifier
+ * @PLL_COMPID_DIV0: 1st PLL divider component identifier
+ * @PLL_COMPID_DIV1: 2nd PLL divider component identifier
+ */
+enum pll_component_id {
+	PLL_COMPID_FRAC,
+	PLL_COMPID_DIV0,
+	PLL_COMPID_DIV1,
+	PLL_COMPID_MAX,
+};
+
 /**
  * enum pll_type - PLL type identifiers
  * @PLL_TYPE_FRAC:	fractional PLL identifier
@@ -185,6 +197,18 @@ static const struct clk_pll_layout pll_divio_layout = {
 	.endiv_shift	= 30,
 };
 
+/*
+ * SAM9X7 PLL possible parents
+ * @SAM9X7_PLL_PARENT_MAINCK: MAINCK is PLL a parent
+ * @SAM9X7_PLL_PARENT_MAIN_XTAL: MAIN XTAL is a PLL parent
+ * @SAM9X7_PLL_PARENT_FRACCK: Frac PLL is a PLL parent (for PLL dividers)
+ */
+enum sam9x7_pll_parent {
+	SAM9X7_PLL_PARENT_MAINCK,
+	SAM9X7_PLL_PARENT_MAIN_XTAL,
+	SAM9X7_PLL_PARENT_FRACCK
+};
+
 /*
  * PLL clocks description
  * @n:		clock name
@@ -192,22 +216,24 @@ static const struct clk_pll_layout pll_divio_layout = {
  * @l:		clock layout
  * @t:		clock type
  * @c:		pll characteristics
+ * @hw:		pointer to clk_hw
  * @f:		clock flags
  * @eid:	export index in sam9x7->chws[] array
  */
-static const struct {
+static struct {
 	const char *n;
-	const char *p;
 	const struct clk_pll_layout *l;
 	u8 t;
 	const struct clk_pll_characteristics *c;
+	struct clk_hw *hw;
 	unsigned long f;
+	enum sam9x7_pll_parent p;
 	u8 eid;
-} sam9x7_plls[][3] = {
+} sam9x7_plls[][PLL_COMPID_MAX] = {
 	[PLL_ID_PLLA] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "plla_fracck",
-			.p = "mainck",
+			.p = SAM9X7_PLL_PARENT_MAINCK,
 			.l = &plla_frac_layout,
 			.t = PLL_TYPE_FRAC,
 			/*
@@ -218,9 +244,9 @@ static const struct {
 			.c = &plla_characteristics,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "plla_divpmcck",
-			.p = "plla_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled */
@@ -228,21 +254,35 @@ static const struct {
 			.eid = PMC_PLLACK,
 			.c = &plla_characteristics,
 		},
+
+		[PLL_COMPID_DIV1] = {
+			.n = "plla_div2pmcck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
+			.l = &plladiv2_divpmc_layout,
+			/*
+			 * This may feed critical parts of the system like timers.
+			 * It should not be disabled.
+			 */
+			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
+			.c = &plladiv2_characteristics,
+			.eid = PMC_PLLADIV2,
+			.t = PLL_TYPE_DIV,
+		},
 	},
 
 	[PLL_ID_UPLL] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "upll_fracck",
-			.p = "main_osc",
+			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
 			.l = &pll_frac_layout,
 			.t = PLL_TYPE_FRAC,
 			.f = CLK_SET_RATE_GATE,
 			.c = &upll_characteristics,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "upll_divpmcck",
-			.p = "upll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
@@ -253,18 +293,18 @@ static const struct {
 	},
 
 	[PLL_ID_AUDIO] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "audiopll_fracck",
-			.p = "main_osc",
+			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
 			.l = &pll_frac_layout,
 			.f = CLK_SET_RATE_GATE,
 			.c = &audiopll_characteristics,
 			.t = PLL_TYPE_FRAC,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "audiopll_divpmcck",
-			.p = "audiopll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
@@ -273,9 +313,9 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 		},
 
-		{
+		[PLL_COMPID_DIV1] = {
 			.n = "audiopll_diviock",
-			.p = "audiopll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divio_layout,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
@@ -286,18 +326,18 @@ static const struct {
 	},
 
 	[PLL_ID_LVDS] = {
-		{
+		[PLL_COMPID_FRAC] = {
 			.n = "lvdspll_fracck",
-			.p = "main_osc",
+			.p = SAM9X7_PLL_PARENT_MAIN_XTAL,
 			.l = &pll_frac_layout,
 			.f = CLK_SET_RATE_GATE,
 			.c = &lvdspll_characteristics,
 			.t = PLL_TYPE_FRAC,
 		},
 
-		{
+		[PLL_COMPID_DIV0] = {
 			.n = "lvdspll_divpmcck",
-			.p = "lvdspll_fracck",
+			.p = SAM9X7_PLL_PARENT_FRACCK,
 			.l = &pll_divpmc_layout,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
@@ -306,22 +346,6 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 		},
 	},
-
-	[PLL_ID_PLLA_DIV2] = {
-		{
-			.n = "plla_div2pmcck",
-			.p = "plla_fracck",
-			.l = &plladiv2_divpmc_layout,
-			/*
-			 * This may feed critical parts of the system like timers.
-			 * It should not be disabled.
-			 */
-			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.c = &plladiv2_characteristics,
-			.eid = PMC_PLLADIV2,
-			.t = PLL_TYPE_DIV,
-		},
-	},
 };
 
 static const struct clk_programmable_layout sam9x7_programmable_layout = {
@@ -339,9 +363,9 @@ static const struct clk_pcr_layout sam9x7_pcr_layout = {
 	.pid_mask = GENMASK(6, 0),
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	u8 id;
 	unsigned long flags;
 } sam9x7_systemck[] = {
@@ -349,10 +373,10 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck",		.p = "masterck_div",	.id = 2,	.flags = CLK_IS_CRITICAL },
-	{ .n = "uhpck",		.p = "usbck",		.id = 6 },
-	{ .n = "pck0",		.p = "prog0",		.id = 8 },
-	{ .n = "pck1",		.p = "prog1",		.id = 9 },
+	{ .n = "ddrck",		.id = 2,	.flags = CLK_IS_CRITICAL },
+	{ .n = "uhpck",		.id = 6 },
+	{ .n = "pck0",		.id = 8 },
+	{ .n = "pck1",		.id = 9 },
 };
 
 /*
@@ -426,7 +450,8 @@ static const struct {
 /*
  * Generic clock description
  * @n:			clock name
- * @pp:			PLL parents
+ * @pp:			PLL parents (entry formed by PLL components identifiers
+ *			(see enum pll_component_id))
  * @pp_mux_table:	PLL parents mux table
  * @r:			clock output range
  * @pp_chg_id:		id in parent array of changeable PLL parent
@@ -435,7 +460,10 @@ static const struct {
  */
 static const struct {
 	const char *n;
-	const char *pp[8];
+	struct {
+			int pll_id;
+			int pll_compid;
+	} pp[8];
 	const char pp_mux_table[8];
 	struct clk_range r;
 	int pp_chg_id;
@@ -445,7 +473,7 @@ static const struct {
 	{
 		.n = "flex0_gclk",
 		.id = 5,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -454,7 +482,7 @@ static const struct {
 	{
 		.n = "flex1_gclk",
 		.id = 6,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -463,7 +491,7 @@ static const struct {
 	{
 		.n = "flex2_gclk",
 		.id = 7,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -472,7 +500,7 @@ static const struct {
 	{
 		.n = "flex3_gclk",
 		.id = 8,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -481,7 +509,7 @@ static const struct {
 	{
 		.n = "flex6_gclk",
 		.id = 9,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -490,7 +518,7 @@ static const struct {
 	{
 		.n = "flex7_gclk",
 		.id = 10,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -499,7 +527,7 @@ static const struct {
 	{
 		.n = "flex8_gclk",
 		.id = 11,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -509,7 +537,7 @@ static const struct {
 		.n = "sdmmc0_gclk",
 		.id = 12,
 		.r = { .max = 105000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -518,7 +546,7 @@ static const struct {
 	{
 		.n = "flex4_gclk",
 		.id = 13,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -527,7 +555,7 @@ static const struct {
 	{
 		.n = "flex5_gclk",
 		.id = 14,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -536,7 +564,7 @@ static const struct {
 	{
 		.n = "flex9_gclk",
 		.id = 15,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -545,7 +573,7 @@ static const struct {
 	{
 		.n = "flex10_gclk",
 		.id = 16,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -554,7 +582,7 @@ static const struct {
 	{
 		.n = "tcb0_gclk",
 		.id = 17,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -563,7 +591,7 @@ static const struct {
 	{
 		.n = "adc_gclk",
 		.id = 19,
-		.pp = { "upll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 5, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -573,7 +601,7 @@ static const struct {
 		.n = "lcd_gclk",
 		.id = 25,
 		.r = { .max = 75000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -583,7 +611,7 @@ static const struct {
 		.n = "sdmmc1_gclk",
 		.id = 26,
 		.r = { .max = 105000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -593,7 +621,7 @@ static const struct {
 		.n = "mcan0_gclk",
 		.id = 29,
 		.r = { .max = 80000000 },
-		.pp = { "upll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 5, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -603,7 +631,7 @@ static const struct {
 		.n = "mcan1_gclk",
 		.id = 30,
 		.r = { .max = 80000000 },
-		.pp = { "upll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(UPLL, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 5, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -612,7 +640,7 @@ static const struct {
 	{
 		.n = "flex11_gclk",
 		.id = 32,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -621,7 +649,7 @@ static const struct {
 	{
 		.n = "flex12_gclk",
 		.id = 33,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -631,7 +659,7 @@ static const struct {
 		.n = "i2s_gclk",
 		.id = 34,
 		.r = { .max = 100000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -641,7 +669,7 @@ static const struct {
 		.n = "qspi_gclk",
 		.id = 35,
 		.r = { .max = 200000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -650,7 +678,7 @@ static const struct {
 	{
 		.n = "pit64b0_gclk",
 		.id = 37,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -660,7 +688,7 @@ static const struct {
 		.n = "classd_gclk",
 		.id = 42,
 		.r = { .max = 100000000 },
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -669,7 +697,7 @@ static const struct {
 	{
 		.n = "tcb1_gclk",
 		.id = 45,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -678,7 +706,7 @@ static const struct {
 	{
 		.n = "dbgu_gclk",
 		.id = 47,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -688,7 +716,7 @@ static const struct {
 		.n = "mipiphy_gclk",
 		.id = 55,
 		.r = { .max = 27000000 },
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -697,7 +725,7 @@ static const struct {
 	{
 		.n = "pit64b1_gclk",
 		.id = 58,
-		.pp = { "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 8, },
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
@@ -706,7 +734,7 @@ static const struct {
 	{
 		.n = "gmac_gclk",
 		.id = 67,
-		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp = { PLL_IDS_TO_ARR_ENTRY(AUDIO, DIV0), PLL_IDS_TO_ARR_ENTRY(PLLA, DIV1), },
 		.pp_mux_table = { 6, 8, },
 		.pp_count = 2,
 		.pp_chg_id = INT_MIN,
@@ -716,32 +744,28 @@ static const struct {
 static void __init sam9x7_pmc_setup(struct device_node *np)
 {
 	struct clk_range range = CLK_RANGE(0, 0);
-	const char *td_slck_name, *md_slck_name, *mainxtal_name;
+	const char *main_xtal_name;
 	struct pmc_data *sam9x7_pmc;
 	const char *parent_names[9];
 	void **clk_mux_buffer = NULL;
 	int clk_mux_buffer_size = 0;
-	struct clk_hw *main_osc_hw;
 	struct regmap *regmap;
-	struct clk_hw *hw;
+	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
+	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
+	struct clk_hw *parent_hws[9];
 	int i, j;
 
-	i = of_property_match_string(np, "clock-names", "td_slck");
-	if (i < 0)
-		return;
-
-	td_slck_name = of_clk_get_parent_name(np, i);
+	i = of_property_match_string(np, "clock-names", "main_xtal");
 
-	i = of_property_match_string(np, "clock-names", "md_slck");
 	if (i < 0)
 		return;
+	main_xtal_name = of_clk_get_parent_name(np, i);
 
-	md_slck_name = of_clk_get_parent_name(np, i);
+	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
+	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
 
-	i = of_property_match_string(np, "clock-names", "main_xtal");
-	if (i < 0)
+	if (!td_slck_hw || !md_slck_hw)
 		return;
-	mainxtal_name = of_clk_get_parent_name(np, i);
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap))
@@ -760,26 +784,26 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!clk_mux_buffer)
 		goto err_free;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   50000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   50000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
-	if (IS_ERR(hw))
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &AT91_CLK_PD_NAME(main_xtal_name), 0);
+	if (IS_ERR(main_osc_hw))
 		goto err_free;
-	main_osc_hw = hw;
 
-	parent_names[0] = "main_rc_osc";
-	parent_names[1] = "main_osc";
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
+	parent_hws[0] = main_rc_hw;
+	parent_hws[1] = main_osc_hw;
+	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sam9x7_pmc->chws[PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
-		for (j = 0; j < 3; j++) {
+		for (j = 0; j < PLL_COMPID_MAX; j++) {
 			struct clk_hw *parent_hw;
 
 			if (!sam9x7_plls[i][j].n)
@@ -787,19 +811,23 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 
 			switch (sam9x7_plls[i][j].t) {
 			case PLL_TYPE_FRAC:
-				if (!strcmp(sam9x7_plls[i][j].p, "mainck"))
+				switch (sam9x7_plls[i][j].p) {
+				case SAM9X7_PLL_PARENT_MAINCK:
 					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
-				else if (!strcmp(sam9x7_plls[i][j].p, "main_osc"))
-					parent_hw = main_osc_hw;
-				else
-					parent_hw = __clk_get_hw(of_clk_get_by_name
-								 (np, sam9x7_plls[i][j].p));
+					break;
+				case SAM9X7_PLL_PARENT_MAIN_XTAL:
+					parent_hw = main_xtal_hw;
+					break;
+				default:
+					/* Should not happen. */
+					parent_hw = NULL;
+					break;
+				}
 
 				hw = sam9x60_clk_register_frac_pll(regmap,
 								   &pmc_pll_lock,
 								   sam9x7_plls[i][j].n,
-								   sam9x7_plls[i][j].p,
-								   parent_hw, i,
+								   NULL, parent_hw, i,
 								   sam9x7_plls[i][j].c,
 								   sam9x7_plls[i][j].l,
 								   sam9x7_plls[i][j].f);
@@ -809,7 +837,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 				hw = sam9x60_clk_register_div_pll(regmap,
 								  &pmc_pll_lock,
 								  sam9x7_plls[i][j].n,
-								  sam9x7_plls[i][j].p, NULL, i,
+								  NULL, sam9x7_plls[i][0].hw, i,
 								  sam9x7_plls[i][j].c,
 								  sam9x7_plls[i][j].l,
 								  sam9x7_plls[i][j].f, 0);
@@ -822,23 +850,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			if (IS_ERR(hw))
 				goto err_free;
 
+			sam9x7_plls[i][j].hw = hw;
 			if (sam9x7_plls[i][j].eid)
 				sam9x7_pmc->chws[sam9x7_plls[i][j].eid] = hw;
 		}
 	}
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plla_divpmcck";
-	parent_names[3] = "upll_divpmcck";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
+	parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL, &sam9x7_master_layout,
+					   NULL, parent_hws, &sam9x7_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL, &sam9x7_master_layout,
+					  NULL, hw, &sam9x7_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
 	if (IS_ERR(hw))
@@ -849,24 +878,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	parent_names[0] = "plla_divpmcck";
 	parent_names[1] = "upll_divpmcck";
 	parent_names[2] = "main_osc";
-	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
-	if (IS_ERR(hw))
+	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = td_slck_name;
-	parent_names[2] = "mainck";
-	parent_names[3] = "masterck_div";
-	parent_names[4] = "plla_divpmcck";
-	parent_names[5] = "upll_divpmcck";
-	parent_names[6] = "audiopll_divpmcck";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = td_slck_hw;
+	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
+	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
+	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
+	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
+	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
 	for (i = 0; i < 2; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 7, i,
+						    NULL, parent_hws, 7, i,
 						    &sam9x7_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -875,9 +904,14 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		sam9x7_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sam9x7_systemck[0].parent_hw = sam9x7_pmc->chws[PMC_MCK];
+	sam9x7_systemck[1].parent_hw = usbck_hw;
+	sam9x7_systemck[2].parent_hw = sam9x7_pmc->pchws[0];
+	sam9x7_systemck[3].parent_hw = sam9x7_pmc->pchws[1];
 	for (i = 0; i < ARRAY_SIZE(sam9x7_systemck); i++) {
 		hw = at91_clk_register_system(regmap, sam9x7_systemck[i].n,
-					      sam9x7_systemck[i].p, NULL,
+					      NULL, sam9x7_systemck[i].parent_hw,
 					      sam9x7_systemck[i].id,
 					      sam9x7_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -890,7 +924,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sam9x7_pcr_layout,
 							 sam9x7_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL, sam9x7_pmc->chws[PMC_MCK],
 							 sam9x7_periphck[i].id,
 							 &range, INT_MIN,
 							 sam9x7_periphck[i].f);
@@ -900,12 +934,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
 	}
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = td_slck_name;
-	parent_names[2] = "mainck";
-	parent_names[3] = "masterck_div";
+	parent_hws[0] = md_slck_hw;
+	parent_hws[1] = td_slck_hw;
+	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
+	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
 	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
 		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
+		struct clk_hw *tmp_parent_hws[6];
 		u32 *mux_table;
 
 		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
@@ -916,13 +951,21 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 		PMC_INIT_TABLE(mux_table, 4);
 		PMC_FILL_TABLE(&mux_table[4], sam9x7_gck[i].pp_mux_table,
 			       sam9x7_gck[i].pp_count);
-		PMC_FILL_TABLE(&parent_names[4], sam9x7_gck[i].pp,
+
+		for (j = 0; j < sam9x7_gck[i].pp_count; j++) {
+			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
+			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
+
+			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;
+		}
+
+		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
 			       sam9x7_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sam9x7_pcr_layout,
 						 sam9x7_gck[i].n,
-						 parent_names, NULL, mux_table,
+						 NULL, parent_hws, mux_table,
 						 num_parents,
 						 sam9x7_gck[i].id,
 						 &sam9x7_gck[i].r,
-- 
2.43.0

