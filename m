Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F5A47668E;
	Tue, 13 Oct 2026 07:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875294; cv=fail; b=peWMFNPmIL8eZqMdKTIMwsWXRf5SS+sIFZFeevrdJX9gf8DpvLdk4BQgDY6v8RfhWJUmL6EalD3xeq8lTwujCNgXO/WDUp+/ZPis6mMamON9HJ+qTDtwYZvGKlUqR0zUNnwSkTmT/5PynyXES10tMQD5ljrp4sFLrTIkNQt2Gxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875294; c=relaxed/simple;
	bh=96mh2zvT4du3szRjiarwS//Ux+16QTo7mkb7Mw9jV2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iT3j2XpEijc7wu7GqC0K0BpUSPqPc2GogROTynoGgG8IdWPLsQPpUYSC8fmQclRwIBi1TA9GTiOg3rS2Hc9Fy8pr/Qyo33Rmh0JF9wY8u+LSqnWEjQIuQPErn/dSJn6EO5h7LsnBDoD8ceQ1JaN2DzMqtoO4+1RvrJFAIukR76A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=NXFcju+/; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="NXFcju+/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7uLO9ujqsMeKB6lq/R+azNVSY26DWYS1Rqih80H3i9WVZgnuIcdiHyHIo5ImWzeV8NjU8Z699NxyvZzkcULaizhUWoVzE1UbEflg1r5ZeqWg+cgi4WVB0AI0f966dE3XTQDDEKm3fzOQ0KLYNdxkQ3dHSRA1/Elaf3Z35yEoEqAdK/+3BrdMhw8sfOTSiIA4j/wAZgxJSsX3JoI6skZGLNtob0u8b/grLXg/YsOQ378oi/efAPOYXJBsijts+IxsguTq1nfZtLBNkF2Aeu3WjfS0dqxgamNzWnOtz2xfNEU292TnVnd7QCclLVQQwM/KScvirWy5NHS7oMKOzHI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qps2PwCzTj4tEixsnMYoMDLTZfeaJvg5wALJpGZcO4A=;
 b=T1jCxFVD0Fy77/U/reI//7egv9FvpschW7ilDRBNqn/NsHqCOZK/drKCDjZqmar2ufAwoV0w3W71vbYpT+A014GnTzJDFW5UbuulrxdCytimVHGQIP3GMRZfhjGk0XSEQ6o75gntfGOdm/cMD7ZG9eRubgTNWhNBIfgL8DbPCuG1pz5hQhtWo3eSoWzX3cyDqEaVsNSq19e3IkU1sGQ++0LYlFZa6kr2f52ba8H49TbTilFzOr6eBmFRm7/jndTkoetk8/oCw5dB1BW5VFm2nzLUFSy7xlI/PoZ++s1knoQfFWAaNuKmh8adA8re+BaJUajk2IeNCatXPhtfVsojHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qps2PwCzTj4tEixsnMYoMDLTZfeaJvg5wALJpGZcO4A=;
 b=NXFcju+/OHtzxVPHflhpwAFAEXPrUH92T7o0KxXKPKlEk9BDZ+d65t2L6IbY8EO0KgfrCuqQ9JpIPcbQcCQfR3PXIq/DitSAj98Eqd5joVtpnXubsap9gbBVGjDhXgl4Jx4GywAUWmR1VkcOSG59262vWtcyNONMfoMUnZHYH+B/4AJAVGGmAcwEUTtY6kBzn+NGXfbrlKveR9LDSx534QFsnNLVUjIylHwk4zLj12mZXUK5EWlAA8ujNSjnGwq6JN3S1P6xTBcfwuOwfjoOdblEfbtqgtduLMdnF63E+WoLsTHYWvc68cnIrbbeE4DtUNU+DvZge4vkkM3whmabiA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by BY1PR03MB7947.namprd03.prod.outlook.com (2603:10b6:a03:5b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 07:08:08 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 07:08:08 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 2/3] clk: socfpga: agilex5: register the SP timer clocks early
Date: Tue, 13 Oct 2026 15:07:53 +0800
Message-ID: <289d5974c114e5bc71905e576a08302f7d8be6f5.1791871090.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
References: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::11) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|BY1PR03MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e26def-3cab-4874-e3ca-08df28f8bc0c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	zSskrfmn65bKsDUSOBWl/zcJhwo5Nq4J0qNPUReQscN5rjj9mkFJ5Gh2YCVjsOwSRQpC0MTnnxT35plBNnfgYQ9xkySfVIDQmC2C0qId+pHnfZ78dUtWWyH+9aHjenjuMqJiPrQX4GqwJyGJcI9r3OEfOmuOBDAnrPyR6RdidKnudIbu3Enw9T/z+tOV7Y4gTEuqMRq7GiA7Dk3uR/deqHijpV9G7am8/+JRSWhKa0ZZvNRgJoh8PDcu7N6z/tdd9MNKbK4zYImYjHaRGPxtBhajFHDx+4h4ofF2al5WeDCXDh2PVkaJXyaqDNCM7EyHRN7RLUss1JrpvZwk7dRW665SEvLBgNPwtAHEJ6nXyRV7apOTrs8v0MwImOQmGmvrK5O/TXcFb/+Fy1oL7VVXCE+Bni9uVOBcuBotnL1YFtGTWJLxl8GAgZDncb0PE/q62FEJZt4wB7v/z+T64cEM9sdC/SPHobKgb6gMcAlMJM26vsVXzNLuRZSo2AT2YYT2fj89wuq7uFp/AaJC4F/wursE6NUQwDiZI3H9NgmTdzaLOD0O8uc8OR9hR2AOjP9yeNmsulJwsn2QmjZtPGeGBL4Y099To8C2UTsW3XTdOemI2pIMt5x9hZVCDVsG+qWUYVsmM6cDgZFedxNffpSptT19sfULmadEswswzsjEvzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b1dMHD1rSVizz28SIzfxiDNjKYTPjnf8acp9oHNP21LvEsKBBTj4QDYNde18?=
 =?us-ascii?Q?nXltgFHB6TjfGtQZNMsoDy160G/VzajqaJKkjMCVrk8F/cTcPVeR61xiQx6c?=
 =?us-ascii?Q?OE4rfXEHe+AzivzfTmoAhvf7eq50cskxslHUZHa5okVmAZTNAfFI6xQdFqxG?=
 =?us-ascii?Q?9r8PYQs0K6eX+yP2uyCueAwc5asSioNHip0kkm1i9kRHKMxm8f1jNY6G2eaE?=
 =?us-ascii?Q?/gBvv7T0Pene7cdN90gcMzQc1bTWKUa3tAX4iIoNvZkOLp5tk9k6V4FTpyBa?=
 =?us-ascii?Q?9ZFus+tbJyeZKUP2Ba8P9Pk8pLzv+1HE+YeOg0bKAZwY0wsFzSwu2bzaO7kW?=
 =?us-ascii?Q?HveTt8RJTSJLLX64IZdJC0JnKnBbZjhoHPxrRl9JKurbKf0SuDkter1ATNa2?=
 =?us-ascii?Q?NqZ999Wn2yd4hR2TKhcvOswYmPv0hSwSTmzzAaji2CYvj85Pn90wONT5gMDl?=
 =?us-ascii?Q?FzfaZLeyOBtdt9KJUZJihpXtCG/hn3xN44bOuVnDfXvssejFWBnGOxEvEkXb?=
 =?us-ascii?Q?vl9X2oudNQCOmAeUXIrHevjYtnDKZ8++fCI+aMfNZ/8CyDKmz6qSaB1pH08t?=
 =?us-ascii?Q?jM2+xzXLiOhi2a/Xdlaq6n3S6hdzdPz4Ea7ZydxwuQzXeemtxx2zxs4p8aek?=
 =?us-ascii?Q?Moz/Uu1SvISNlRCySYFPdK7KRb+kolFKnfoa8j9kqH9PXvKQGjpJ5MxyrtDV?=
 =?us-ascii?Q?5ZZMRcvSLAlFSDragRvcW5U5sNKPAxVPohKcR8ZUEU/mRL6irta/a4JcoyPu?=
 =?us-ascii?Q?yd3usa8jNBaAwSuf9J7hCI+nZyjfL6gOz6CoeuAkl6gnhne+A9wryWol0Rsd?=
 =?us-ascii?Q?vn3jdgRwjY10FrY+hkLajRRorEzZUusY6DK/2bxuAQYRWbuWhcCe05hYaqt7?=
 =?us-ascii?Q?lIIh/zZTazEq/2YhYFdmIM6/yuL4Vyn9BB/ojkY1Cm7kc6pbTHdg7Ai2wFn3?=
 =?us-ascii?Q?Ik+085xHZxWC8Eotye22Hn+WoawlD0NAdjgw7bBCcd2s6OpEhTl+Dn/invgh?=
 =?us-ascii?Q?3hCYoGDGhAyc/qO92av6X+5/MtIAY3qRnCQYUrQ1DVFmyqEyvhm3G2MvkkVY?=
 =?us-ascii?Q?9GaimjKzylCpwyeiWALx4KyRqSCDIV2IOooFb49rmkHK+WLs1ibCtiwn9/eV?=
 =?us-ascii?Q?SHibZDqYsUeYnhGU1ASqRzFwGnSpto22XJ3BynXUaQdkNamuv4qA77NH4e6w?=
 =?us-ascii?Q?0bMf48+2m0ZEpm2CTE+C42X4WcItKVGt1b7jBlniy+smIKLhpxSFLyl3bLLj?=
 =?us-ascii?Q?c7IRbjmxybhCFmu54LUCt535gSKKnnqftSdR5CwS619XcI54H0oMfg5+B1Tc?=
 =?us-ascii?Q?hp0GAUguC24c5CTVs2Xfr+EWJoO9arXtYjCbE+Hz6mau9Kpagsgp6KXvEWC0?=
 =?us-ascii?Q?ioJU/SM0uiXAisLYe98d7W5XHNYoD89nHXerYHBG34ZnpAfXc7kexnxOxbdM?=
 =?us-ascii?Q?fsgSQ+6kOkiAD2M00JRV2dRy85dza0tpToh/ORyxeIux+it2AB6OjlQlWlPb?=
 =?us-ascii?Q?WSUaBulgb5CxF/DBaalBlmzFjOsndUtvyo9NRv6qcsYQGut1iSkhzGvncB/w?=
 =?us-ascii?Q?iS5ro5oANA8qgZ/bJLnPQb8yMXnN1UEevGIUiZcxiH88ZY2VZlPefeA/2AtM?=
 =?us-ascii?Q?DH7JmT/daE+UAxyHvdMtt11Qin5nLm6dngR/PfC0RezXQ4TMesv/y6rXx99b?=
 =?us-ascii?Q?lzLebIqq9aAxh7pqbU21Mgi01LWmFG0fepaOlwIbii0JaMVP9fu5PuGdnr1z?=
 =?us-ascii?Q?miRzJPJ1JAlmzoEknATq4AGoG9hnpHs=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e26def-3cab-4874-e3ca-08df28f8bc0c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 07:08:08.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNh8xoYOZejub3RVongyGJhluyDXyMcCi4QOTrTj//aQp+jbuJyF56CNbTqLw4Xm8iqk+5uF9Abk4il5woxMVhKiniRj0aM4R+jYyx6Qq8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7947

The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
and cannot defer, but the clock manager is a platform driver registered
at core_initcall(). The timer's clk_get() therefore fails and the timer
is never brought up.

Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
main_pll_c3, peri_pll_c1 and noc_free_clk) from of_clk_init() using
CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
The remaining clocks are still registered when the platform driver
probes, which reuses the early provider.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-agilex5.c | 155 ++++++++++++++++++++++++------
 1 file changed, 126 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex5.c b/drivers/clk/socfpga/clk-agilex5.c
index f7f0ad884f64..50dba11ab45e 100644
--- a/drivers/clk/socfpga/clk-agilex5.c
+++ b/drivers/clk/socfpga/clk-agilex5.c
@@ -6,6 +6,7 @@
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include  <dt-bindings/clock/intel,agilex5-clkmgr.h>
 #include "stratix10-clk.h"
@@ -233,7 +234,29 @@ static const struct agilex5_pll_clock agilex5_pll_clks[] = {
 	},
 };
 
-/* Main PLL C0, C1, C2, C3 and Peri PLL C0, C1, C2, C3. With ping-pong counter. */
+/*
+ * The SP timers are probed from time_init() and cannot defer, so their
+ * l4_sp_clk and its parents are registered from of_clk_init(). Everything
+ * else is registered when the platform driver probes.
+ */
+static const struct stratix10_perip_c_clock agilex5_early_perip_c_clks[] = {
+	{ AGILEX5_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0,
+	  0x68 },
+	{ AGILEX5_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0,
+	  0xB4 },
+};
+
+static const struct agilex5_perip_cnt_clock agilex5_early_perip_cnt_clks[] = {
+	{ AGILEX5_NOC_FREE_CLK, "noc_free_clk", noc_free_mux,
+	ARRAY_SIZE(noc_free_mux), 0, 0x40, 0, 0, 0 },
+};
+
+static const struct agilex5_gate_clock agilex5_early_gate_clks[] = {
+	{ AGILEX5_L4_SP_CLK, "l4_sp_clk", noc_mux, ARRAY_SIZE(noc_mux),
+	  CLK_IS_CRITICAL, 0x24, 3, 0x44, 6, 2, 0x30, 1, 0 },
+};
+
+/* Main PLL C0, C1, C2 and Peri PLL C0, C2, C3. With ping-pong counter. */
 static const struct stratix10_perip_c_clock agilex5_main_perip_c_clks[] = {
 	{ AGILEX5_MAIN_PLL_C0_CLK, "main_pll_c0", "main_pll", NULL, 1, 0,
 	  0x5C },
@@ -241,12 +264,8 @@ static const struct stratix10_perip_c_clock agilex5_main_perip_c_clks[] = {
 	  0x60 },
 	{ AGILEX5_MAIN_PLL_C2_CLK, "main_pll_c2", "main_pll", NULL, 1, 0,
 	  0x64 },
-	{ AGILEX5_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0,
-	  0x68 },
 	{ AGILEX5_PERIPH_PLL_C0_CLK, "peri_pll_c0", "periph_pll", NULL, 1, 0,
 	  0xB0 },
-	{ AGILEX5_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0,
-	  0xB4 },
 	{ AGILEX5_PERIPH_PLL_C2_CLK, "peri_pll_c2", "periph_pll", NULL, 1, 0,
 	  0xB8 },
 	{ AGILEX5_PERIPH_PLL_C3_CLK, "peri_pll_c3", "periph_pll", NULL, 1, 0,
@@ -265,8 +284,6 @@ static const struct agilex5_perip_cnt_clock agilex5_main_perip_cnt_clks[] = {
 	ARRAY_SIZE(core3_free_mux), 0, 0x0110, 0, 0, 0},
 	{ AGILEX5_DSU_FREE_CLK, "dsu_free_clk", dsu_free_mux,
 	ARRAY_SIZE(dsu_free_mux), 0, 0xfc, 0, 0, 0},
-	{ AGILEX5_NOC_FREE_CLK, "noc_free_clk", noc_free_mux,
-	ARRAY_SIZE(noc_free_mux), 0, 0x40, 0, 0, 0 },
 	{ AGILEX5_EMAC_A_FREE_CLK, "emaca_free_clk", emaca_free_mux,
 	ARRAY_SIZE(emaca_free_mux), 0, 0xD4, 0, 0x88, 0 },
 	{ AGILEX5_EMAC_B_FREE_CLK, "emacb_free_clk", emacb_free_mux,
@@ -313,8 +330,6 @@ static const struct agilex5_gate_clock agilex5_gate_clks[] = {
 	  0x24, 2, 0x44, 4, 2, 0x30, 1, 0 },
 	{ AGILEX5_L4_SYS_FREE_CLK, "l4_sys_free_clk", noc_mux,
 	  ARRAY_SIZE(noc_mux), 0, 0, 0, 0x44, 2, 2, 0x30, 1, 0 },
-	{ AGILEX5_L4_SP_CLK, "l4_sp_clk", noc_mux, ARRAY_SIZE(noc_mux),
-	  CLK_IS_CRITICAL, 0x24, 3, 0x44, 6, 2, 0x30, 1, 0 },
 
 	/* Core sight clocks*/
 	{ AGILEX5_CS_AT_CLK, "cs_at_clk", noc_mux, ARRAY_SIZE(noc_mux), 0,
@@ -486,35 +501,114 @@ static int agilex5_clk_register_pll(const struct agilex5_pll_clock *clks,
 	return 0;
 }
 
-static int agilex5_clkmgr_init(struct platform_device *pdev)
+static struct stratix10_clock_data *agilex5_clk_data;
+
+static struct stratix10_clock_data *agilex5_clk_data_alloc(void __iomem *base)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
-	void __iomem *base;
-	int i, num_clks;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	num_clks = AGILEX5_NUM_CLKS;
+	int i;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-				num_clks), GFP_KERNEL);
+	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, AGILEX5_NUM_CLKS),
+			   GFP_KERNEL);
 	if (!clk_data)
-		return -ENOMEM;
+		return NULL;
 
 	clk_data->base = base;
-	clk_data->clk_data.num = num_clks;
+	clk_data->clk_data.num = AGILEX5_NUM_CLKS;
+
+	for (i = 0; i < AGILEX5_NUM_CLKS; i++)
+		clk_data->clk_data.hws[i] = ERR_PTR(-EPROBE_DEFER);
 
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+	return clk_data;
+}
 
+static void agilex5_clk_register_early(struct stratix10_clock_data *clk_data)
+{
 	agilex5_clk_register_pll(agilex5_pll_clks, ARRAY_SIZE(agilex5_pll_clks),
 				 clk_data);
 
-	/* mainPLL C0, C1, C2, C3 and periph PLL C0, C1, C2, C3*/
+	agilex5_clk_register_c_perip(agilex5_early_perip_c_clks,
+				     ARRAY_SIZE(agilex5_early_perip_c_clks),
+				     clk_data);
+
+	agilex5_clk_register_cnt_perip(agilex5_early_perip_cnt_clks,
+				       ARRAY_SIZE(agilex5_early_perip_cnt_clks),
+				       clk_data);
+
+	agilex5_clk_register_gate(agilex5_early_gate_clks,
+				  ARRAY_SIZE(agilex5_early_gate_clks), clk_data);
+}
+
+/*
+ * The registered clocks keep using the mapping and clk_data, so neither is
+ * released once the early clocks have been registered.
+ */
+static int agilex5_clkmgr_setup(struct device_node *np)
+{
+	struct stratix10_clock_data *clk_data;
+	void __iomem *base;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%s: failed to map clock registers\n", __func__);
+		return -ENOMEM;
+	}
+
+	clk_data = agilex5_clk_data_alloc(base);
+	if (!clk_data) {
+		iounmap(base);
+		return -ENOMEM;
+	}
+
+	agilex5_clk_register_early(clk_data);
+	agilex5_clk_data = clk_data;
+
+	return 0;
+}
+
+static int agilex5_clkmgr_add_provider(struct device_node *np)
+{
+	static bool added;
+	int ret;
+
+	if (added)
+		return 0;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
+				     &agilex5_clk_data->clk_data);
+	if (ret)
+		return ret;
+
+	added = true;
+
+	return 0;
+}
+
+static void __init agilex5_clkmgr_early_init(struct device_node *np)
+{
+	if (agilex5_clkmgr_setup(np))
+		return;
+
+	if (agilex5_clkmgr_add_provider(np))
+		pr_err("%s: failed to add clock provider\n", __func__);
+}
+
+CLK_OF_DECLARE_DRIVER(agilex5_clkmgr, "intel,agilex5-clkmgr",
+		      agilex5_clkmgr_early_init);
+
+static int agilex5_clkmgr_init(struct platform_device *pdev)
+{
+	struct stratix10_clock_data *clk_data;
+	int i, ret;
+
+	if (!agilex5_clk_data) {
+		ret = agilex5_clkmgr_setup(pdev->dev.of_node);
+		if (ret)
+			return ret;
+	}
+
+	clk_data = agilex5_clk_data;
+
 	agilex5_clk_register_c_perip(agilex5_main_perip_c_clks,
 				     ARRAY_SIZE(agilex5_main_perip_c_clks),
 				     clk_data);
@@ -526,8 +620,11 @@ static int agilex5_clkmgr_init(struct platform_device *pdev)
 	agilex5_clk_register_gate(agilex5_gate_clks,
 				  ARRAY_SIZE(agilex5_gate_clks), clk_data);
 
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+	for (i = 0; i < AGILEX5_NUM_CLKS; i++)
+		if (clk_data->clk_data.hws[i] == ERR_PTR(-EPROBE_DEFER))
+			clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+
+	return agilex5_clkmgr_add_provider(pdev->dev.of_node);
 }
 
 static int agilex5_clkmgr_probe(struct platform_device *pdev)
-- 
2.49.GIT

