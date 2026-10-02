Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949146982C;
	Fri,  2 Oct 2026 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936596; cv=fail; b=p41V0NyWOwC4u/+m8R0K1FnnxpiO8HnvUkbTK5GdbXZI9Y22TiJfDAbWlo5eHi4tINI86ghwJc/BBHuZcMviatpd3kAeRYdljI7bytj8S/mryQ9/+N4n0oGBtJCQhwAnMS4gH+FnnqffPMrSjEmfrQ8QSOME5b2t4XlUDHekauw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936596; c=relaxed/simple;
	bh=Xyou9Pke/ijjB30hQy4zgy1RxSedGdxTvWjFretzL7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lYfLkXK9RBVd8E3E9YxxtD8eevtTYpdrdpfGIWBghHSE//V4ikqPKHPQVSlL7NgfSmztIukXlzefkzjw7CBhBea9JGiY4GmMD2cdT6xDFev8JnVNJm1ZBKT2uJAzBbPhtROJn/8xuiqrwCLsfIxe5OQWIGDbLE51ncNVzC4BL44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YKASOrY5; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YKASOrY5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCg1eCDLdU/fo914t0yhvqsCHeGcnkhE7V1+HDGa6pjgSybIDO0XBaZgNP+SzOtuJXyjoUeeqCegQIcMWOTmEZFEBsORJGCbeEziHvIZfk5GzQzRIpTrcMQ6xJyv5lRm8y/yTGP8XBHIDgpqzwXsKF3jzM4vFLcm9WcZVVZJE1T4JHEsST4pKkTSpsLYEiYwO+ojNljoVRGK++VVzTfsscQNBWMHpC9WU4TLzbYAzBZExIsA6yetX15FhIRm4BcjPUDjSCflVSNHZ7TdNqazpuAIfvv9AQUGKh+GsDPRc+jx6HDeh39rxBT8cftDvZb6TsyalSWrXSQwcaU35mKIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gV98dRMehAXcSVEC4cFOX7zlXg1u4LkSug2t/iRKhw=;
 b=pmWcy9TlkZME4APD6u3HGfB1HvJMXUYGdd6B0VqDy25go/5sqRabqjaBcY9ePhk+SMGws3ok4NM4vGzgVfQweIK9HnIeAsd7/m+JDkW1m6xHBqKb+CSER7Dwct/R+657UIeVtzntYvxuGhZUVqB5w9M5j0asJXJQy/vmfJoYb41ZPfgP5C/wOQQSAJTPMEG4ksE7uFVhLX01ueDq9EPmDcI8qUcktdFnHxuFFKM2gghnAloDOTswXiHhzIOv9GrAyJ2GxgM+RjEq5ITkxrGKJoqCHBybNm/D+CJ9TdtA65fyT6/GeuQcxMagwgJbCYaljsuxLubKEl2OjEtL55OuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gV98dRMehAXcSVEC4cFOX7zlXg1u4LkSug2t/iRKhw=;
 b=YKASOrY5w9PLRDOKcEbpqz1NEktesyncYVtPwspcPcTgQfuRj8HF2vhRpq/CQNbRBhRO26vL3HaM/C86KHhy2wRLBJCWIAf4Kkxu7VEiPWdr/AnJV/vVMgEH3/wSdSLT1sTcmAEzyjWj61x9I+PvhqkiXR5I/fV2hDp4kainY96AKwUrtDdcWXr8MM7iOiK4TBLukIQIPpITS+7Rdi4oInYG0aEHWMkRKbpnS4WHkCgFayWNAq+1Y7hJZ3VGcws5psOSKJIquK6tnDyE1D8VWHX1w0hMPWeGY48d1t26x5BKn/KqpVn8FpqhelNucgYHemG/AT1GwBFnTgLFGXZBCQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6588.namprd03.prod.outlook.com (2603:10b6:303:12b::22)
 by SA1PR03MB7053.namprd03.prod.outlook.com (2603:10b6:806:326::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:23:10 +0000
Received: from MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7]) by MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:23:10 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 1/3] clk: socfpga: agilex: register the SP timer clocks early
Date: Fri,  2 Oct 2026 18:22:54 +0800
Message-ID: <b0214433cf10ebc094c6685f60a12abe58860523.1790935401.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To MW4PR03MB6588.namprd03.prod.outlook.com
 (2603:10b6:303:12b::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6588:EE_|SA1PR03MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6e174a-ec30-4def-999b-08df206f285c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|55112099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	73fprUUeXrUNi1yvXP47+S1oIvalAtSFIImv/+LgpTtYzu4gQHBZ8zm/KTGtEcbJBueayiSuJSUxjbhBLZjwzxeK0IYmtUYgZ70DLN+G+aG4ndFR2HI239Lbrm0MGQFNGE8MHLdpOlMGVKFTX7zA/R+mzBy7r/27NnDi2/envpgQXtB9Xmzpf8rBd/zbFu1AcWL9JmFGrKJzARhP8rIbWtPhZ235GfcVKBH6pb6g4odiDFxGOwEzwFUVJ69+zeb7D37HpsYTfXui8of6+EZlCpjS6mDX2Zqt5rmMJqly0VBP8/gTGLtk3GuUMSu/Hu2fGb9tC5EJfBa4wNqvNvhgCShhahWGWESlgaL7tM8cv4tNJLNGo7YVsYfU27IH+zW6ja/x1ZV3E5Nn//FK7pJOMnVUJb44jI/BGs9o3gzGoI63d9bR8Y6v1OzC0VUli/JqQLnSD1b+Zy+K7bDmL15PyFkxg0p6JN/GEFoJZ0cDtz0lyWTN2Z6Us7nnHR95fBD9at4ffdNrOYx31XC8gyVdan8DPJL0s/qHs/ZqoJaRaraacNrFSp7REW+JqqoeGvk8KSPOxdUJj0H7vGts/NwGFIx1rf8WLOdyRy0eJ4/n/juM3/JxQ1mmspaKMHOuH0OLZ+2Yk6Fc8ysfnSLBcWwO/X7Ex5KEtQH5meB0p6XCAZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6588.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(55112099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nM/fPcHM1BxoPV5RmXA1lUGfZM2CtK9XoqaOplNLxfpxj4gEmCJ0EyEfEVXU?=
 =?us-ascii?Q?7Q0jdYXSddTCrO0YnkPQdiTZnEQlN/1Fr9W0wOqbZ9WQlfKb3559UqXnPvGb?=
 =?us-ascii?Q?fS8f2eE8yHy1Qc5WW6vew2GcSrbGu74KhRi8xaJRr5tTmfvpoeto69l9lMAE?=
 =?us-ascii?Q?zvaLKb6B5wpCJC3Q6qf9itKTFiFsEqZr2BjnqQRtXdOh0q/Acpp7wCeSoWQY?=
 =?us-ascii?Q?4WiT+oSX9chHEgQWuRQIL2b2WijXqNkM1j5t+iOIORHNfHCucB1eJc1XfaNu?=
 =?us-ascii?Q?1Vq/k0jKsi0gZ1wfA64vh7VJ1RMZmp78dIBmr+WMp9UOzMaMlL+afYarm72y?=
 =?us-ascii?Q?bKvqAo9KF+OKlMyk1g2Htr12intsiJGCyRhBcGHQm+BQ3AVMT33TiNYQHyIK?=
 =?us-ascii?Q?b1NulfKWL2Eruyl8DdBMb14Kli9a2rYR1sL9bkDPmX0F8zR/KaFwt5VHOj1M?=
 =?us-ascii?Q?6+tIEAjHoOs62soZ1fX6vZkjcvpJPiRw67hTLMBrq3EI4DDEQWs+YDg/6orL?=
 =?us-ascii?Q?vDae1cvlGuN0KIdzqlH0g4veYrybF0m0f2QLn5phsaTXYDvWDa2WFkz1NZ9g?=
 =?us-ascii?Q?ZTLv92YiimLOOs7v5D+rfs+i/2b+O9tb5K1P8NxomGlMq/pWgJXfcpFCUf+y?=
 =?us-ascii?Q?JveB/3IzSn9l0oeTgT+h+LSMLkuO02pjV2Q7vSEwH2l5z7Lgt9CuTn3MOAAF?=
 =?us-ascii?Q?V5PY9h5kyfAPBzoU/V4E8YRyHqamGVRuCHOeFOXu79Hyo0py1oQWTBXxuoh3?=
 =?us-ascii?Q?QJBnbminwlKa5os1mPkRA5ZkFKP9tvK1nyPSJ6is4S/5FSQsvSb2ROrD49Xo?=
 =?us-ascii?Q?toPxBYOxx4D2g2dqeW3KGVbirfPdu3tfiFl80eOD6FLlsHFBlPiEZrrExXAg?=
 =?us-ascii?Q?JPvxsL087GTN4D8epHSAc9OxnlqRgxLVVgbHDGlFQgdvl2Dw944Nis01bkRq?=
 =?us-ascii?Q?8AVUBxZl92qnADARu8ey8WfMls5teNBS1xp5PYuKuF8KKc6Wl5pK/DemvYtO?=
 =?us-ascii?Q?YTGx02kvXFZASGV+F1NalXzg+Dhc2GtO3PYU7du/kROqAuHfg31kSOCbfP46?=
 =?us-ascii?Q?C8EYVs3uu8BY00r+Hztk74NCZ63heBlJsI2PKf5ALYPbN5EWPo6JQTqOZScC?=
 =?us-ascii?Q?1xVGNkK3Q1ZH83DagEsHHi996ASZUu0jzpaJyIuF2r6Bxcv41sD+A6iUFHyG?=
 =?us-ascii?Q?RVTkG9wHyL/m3JW/VPaHIhQjscDGnnL7cKYVm3BP1l5z+j1ujYimcqhxgedV?=
 =?us-ascii?Q?c+3pj3dpMJDFvw5lR67vHJDSC7/xeHwTFf97dLwoGMYujktwP0LVcT63sf9f?=
 =?us-ascii?Q?wJ5BhPyvtRyCaxXNSBOdz1IcuFokGwiO7D0gY7kpLNNsGhL9nNvsSJhvp6Ya?=
 =?us-ascii?Q?0Rofb5/f1LLa3ltclMTT/FJwCHbukKJcmD+D9TSNIfMgJbDI9YBS3HJkA+yB?=
 =?us-ascii?Q?tqNZTpR8d/JJQ4I9ilfApXfxxYi6x+3Y2Ux59flz5iZxn4CCUIFC/vsand2f?=
 =?us-ascii?Q?1yReX3jlIY5MtQfAVGTgD8jFNMzgyTguWt5cWkcn1A7Cd19RS1GqTQCFCd0x?=
 =?us-ascii?Q?Ng41HP9n3lj4JeLXga5BoApAYGNvtcqJRyVebAheXCIYWS/nIFMRIRf7xUAN?=
 =?us-ascii?Q?Cspmnd8tplVlu5IC0pY9KtgJjg6kpbdbLQzOzaKePVLxLAquWIzR1Ik/EiKW?=
 =?us-ascii?Q?gbDIM00dopGqllxr5GW302PpyA9S/9pUgnBX2FlP+83kK0Xt6lTby/FR1Gp+?=
 =?us-ascii?Q?SAmDH74bWtm6Rmh13mBpqtk8aaoxXjI=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6e174a-ec30-4def-999b-08df206f285c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6588.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:23:10.1383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfAJiTYhjsSzUTKlUACmnDpdA+MLdWeFO8is8q9+6O0IgrcmeC/PH14Y+1DM7wVpqOBR1u9uroBJ81zsPl0oQtwLiI0SAhdWO1zF44/9Y/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7053

The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
and cannot defer, but the clock manager is a platform driver registered
at core_initcall(). The timer's clk_get() therefore fails and the timer
is never brought up.

Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
main_pll_c1, peri_pll_c1 and noc_free_clk) from of_clk_init() using
CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
The remaining clocks are still registered when the platform driver
probes, which reuses the early provider.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-agilex.c | 222 +++++++++++++++++++++++--------
 1 file changed, 169 insertions(+), 53 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 2bdea1997b5e..91a80b7b1886 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -4,7 +4,9 @@
  */
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/agilex-clock.h>
@@ -232,24 +234,49 @@ static const struct stratix10_pll_clock agilex_pll_clks[] = {
 	  0, 0x9c},
 };
 
+/*
+ * The SP timers are probed from time_init() and cannot defer, so their
+ * l4_sp_clk and its parents are registered from of_clk_init(). Everything
+ * else is registered when the platform driver probes.
+ */
+static const struct n5x_perip_c_clock n5x_early_perip_c_clks[] = {
+	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x54, 8},
+	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xA8, 8},
+};
+
+static const struct stratix10_perip_c_clock agilex_early_perip_c_clks[] = {
+	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x5C},
+	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xB0},
+};
+
+static const struct stratix10_perip_cnt_clock agilex_early_perip_cnt_clks[] = {
+	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
+	  0, 0x40, 0, 0, 0},
+};
+
+static const struct stratix10_gate_clock agilex_early_gate_clks[] = {
+	/*
+	 * The l4_sp_clk feeds a 100 MHz clock to various peripherals, one of them
+	 * being the SP timers, thus cannot get gated.
+	 */
+	{ AGILEX_L4_SP_CLK, "l4_sp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), CLK_IS_CRITICAL, 0x24,
+	  3, 0x44, 16, 2, 0x30, 1, 0},
+};
+
 static const struct n5x_perip_c_clock n5x_main_perip_c_clks[] = {
 	{ AGILEX_MAIN_PLL_C0_CLK, "main_pll_c0", "main_pll", NULL, 1, 0, 0x54, 0},
-	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x54, 8},
 	{ AGILEX_MAIN_PLL_C2_CLK, "main_pll_c2", "main_pll", NULL, 1, 0, 0x54, 16},
 	{ AGILEX_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0, 0x54, 24},
 	{ AGILEX_PERIPH_PLL_C0_CLK, "peri_pll_c0", "periph_pll", NULL, 1, 0, 0xA8, 0},
-	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xA8, 8},
 	{ AGILEX_PERIPH_PLL_C2_CLK, "peri_pll_c2", "periph_pll", NULL, 1, 0, 0xA8, 16},
 	{ AGILEX_PERIPH_PLL_C3_CLK, "peri_pll_c3", "periph_pll", NULL, 1, 0, 0xA8, 24},
 };
 
 static const struct stratix10_perip_c_clock agilex_main_perip_c_clks[] = {
 	{ AGILEX_MAIN_PLL_C0_CLK, "main_pll_c0", "main_pll", NULL, 1, 0, 0x58},
-	{ AGILEX_MAIN_PLL_C1_CLK, "main_pll_c1", "main_pll", NULL, 1, 0, 0x5C},
 	{ AGILEX_MAIN_PLL_C2_CLK, "main_pll_c2", "main_pll", NULL, 1, 0, 0x64},
 	{ AGILEX_MAIN_PLL_C3_CLK, "main_pll_c3", "main_pll", NULL, 1, 0, 0x68},
 	{ AGILEX_PERIPH_PLL_C0_CLK, "peri_pll_c0", "periph_pll", NULL, 1, 0, 0xAC},
-	{ AGILEX_PERIPH_PLL_C1_CLK, "peri_pll_c1", "periph_pll", NULL, 1, 0, 0xB0},
 	{ AGILEX_PERIPH_PLL_C2_CLK, "peri_pll_c2", "periph_pll", NULL, 1, 0, 0xB8},
 	{ AGILEX_PERIPH_PLL_C3_CLK, "peri_pll_c3", "periph_pll", NULL, 1, 0, 0xBC},
 };
@@ -257,8 +284,6 @@ static const struct stratix10_perip_c_clock agilex_main_perip_c_clks[] = {
 static const struct stratix10_perip_cnt_clock agilex_main_perip_cnt_clks[] = {
 	{ AGILEX_MPU_FREE_CLK, "mpu_free_clk", NULL, mpu_free_mux, ARRAY_SIZE(mpu_free_mux),
 	   0, 0x3C, 0, 0, 0},
-	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
-	  0, 0x40, 0, 0, 0},
 	{ AGILEX_L3_MAIN_FREE_CLK, "l3_main_free_clk", "noc_free_clk", NULL,
 	  1, 0, 0, 1, 0, 0},
 	{ AGILEX_L4_SYS_FREE_CLK, "l4_sys_free_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0,
@@ -292,12 +317,6 @@ static const struct stratix10_gate_clock agilex_gate_clks[] = {
 	  1, 0x44, 0, 2, 0x30, 1, 0},
 	{ AGILEX_L4_MP_CLK, "l4_mp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x24,
 	  2, 0x44, 8, 2, 0x30, 1, 0},
-	/*
-	 * The l4_sp_clk feeds a 100 MHz clock to various peripherals, one of them
-	 * being the SP timers, thus cannot get gated.
-	 */
-	{ AGILEX_L4_SP_CLK, "l4_sp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), CLK_IS_CRITICAL, 0x24,
-	  3, 0x44, 16, 2, 0x30, 1, 0},
 	{ AGILEX_CS_AT_CLK, "cs_at_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x24,
 	  4, 0x44, 24, 2, 0x30, 1, 0},
 	{ AGILEX_CS_TRACE_CLK, "cs_trace_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x24,
@@ -454,32 +473,148 @@ static int n5x_clk_register_pll(const struct stratix10_pll_clock *clks,
 	return 0;
 }
 
-static int agilex_clkmgr_init(struct platform_device *pdev)
+static struct stratix10_clock_data *agilex_clk_data;
+
+static struct stratix10_clock_data *agilex_clk_data_alloc(void __iomem *base)
+{
+	struct stratix10_clock_data *clk_data;
+	int i;
+
+	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, AGILEX_NUM_CLKS),
+			   GFP_KERNEL);
+	if (!clk_data)
+		return NULL;
+
+	clk_data->base = base;
+	clk_data->clk_data.num = AGILEX_NUM_CLKS;
+
+	for (i = 0; i < AGILEX_NUM_CLKS; i++)
+		clk_data->clk_data.hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	return clk_data;
+}
+
+static void agilex_clk_register_early(struct stratix10_clock_data *clk_data)
+{
+	agilex_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_data);
+
+	agilex_clk_register_c_perip(agilex_early_perip_c_clks,
+				    ARRAY_SIZE(agilex_early_perip_c_clks), clk_data);
+
+	agilex_clk_register_cnt_perip(agilex_early_perip_cnt_clks,
+				      ARRAY_SIZE(agilex_early_perip_cnt_clks),
+				      clk_data);
+
+	agilex_clk_register_gate(agilex_early_gate_clks,
+				 ARRAY_SIZE(agilex_early_gate_clks), clk_data);
+}
+
+static void n5x_clk_register_early(struct stratix10_clock_data *clk_data)
+{
+	n5x_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_data);
+
+	n5x_clk_register_c_perip(n5x_early_perip_c_clks,
+				 ARRAY_SIZE(n5x_early_perip_c_clks), clk_data);
+
+	agilex_clk_register_cnt_perip(agilex_early_perip_cnt_clks,
+				      ARRAY_SIZE(agilex_early_perip_cnt_clks),
+				      clk_data);
+
+	agilex_clk_register_gate(agilex_early_gate_clks,
+				 ARRAY_SIZE(agilex_early_gate_clks), clk_data);
+}
+
+static void __init
+agilex_clkmgr_of_init(struct device_node *np,
+		      void (*register_early)(struct stratix10_clock_data *))
+{
+	struct stratix10_clock_data *clk_data;
+	void __iomem *base;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%s: failed to map clock registers\n", __func__);
+		return;
+	}
+
+	clk_data = agilex_clk_data_alloc(base);
+	if (!clk_data) {
+		iounmap(base);
+		return;
+	}
+
+	register_early(clk_data);
+
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data)) {
+		pr_err("%s: failed to add clock provider\n", __func__);
+		return;
+	}
+
+	agilex_clk_data = clk_data;
+}
+
+static void __init agilex_clkmgr_early_init(struct device_node *np)
+{
+	agilex_clkmgr_of_init(np, agilex_clk_register_early);
+}
+
+CLK_OF_DECLARE_DRIVER(agilex_clkmgr, "intel,agilex-clkmgr",
+		      agilex_clkmgr_early_init);
+
+static void __init n5x_clkmgr_early_init(struct device_node *np)
+{
+	agilex_clkmgr_of_init(np, n5x_clk_register_early);
+}
+
+CLK_OF_DECLARE_DRIVER(n5x_clkmgr, "intel,easic-n5x-clkmgr",
+		      n5x_clkmgr_early_init);
+
+static struct stratix10_clock_data *
+agilex_clkmgr_get_clk_data(struct platform_device *pdev,
+			   void (*register_early)(struct stratix10_clock_data *))
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
 	void __iomem *base;
-	int i, num_clks;
+
+	if (agilex_clk_data)
+		return agilex_clk_data;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	num_clks = AGILEX_NUM_CLKS;
+		return ERR_CAST(base);
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-				num_clks), GFP_KERNEL);
+	clk_data = agilex_clk_data_alloc(base);
 	if (!clk_data)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-	clk_data->clk_data.num = num_clks;
-	clk_data->base = base;
+	register_early(clk_data);
 
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+	return clk_data;
+}
 
-	agilex_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_data);
+static int agilex_clkmgr_add_provider(struct platform_device *pdev,
+				      struct stratix10_clock_data *clk_data)
+{
+	int i;
+
+	for (i = 0; i < AGILEX_NUM_CLKS; i++)
+		if (clk_data->clk_data.hws[i] == ERR_PTR(-EPROBE_DEFER))
+			clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+
+	if (clk_data == agilex_clk_data)
+		return 0;
+
+	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
+				      &clk_data->clk_data);
+}
+
+static int agilex_clkmgr_init(struct platform_device *pdev)
+{
+	struct stratix10_clock_data *clk_data;
+
+	clk_data = agilex_clkmgr_get_clk_data(pdev, agilex_clk_register_early);
+	if (IS_ERR(clk_data))
+		return PTR_ERR(clk_data);
 
 	agilex_clk_register_c_perip(agilex_main_perip_c_clks,
 				 ARRAY_SIZE(agilex_main_perip_c_clks), clk_data);
@@ -490,36 +625,17 @@ static int agilex_clkmgr_init(struct platform_device *pdev)
 
 	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
 			      clk_data);
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+
+	return agilex_clkmgr_add_provider(pdev, clk_data);
 }
 
 static int n5x_clkmgr_init(struct platform_device *pdev)
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
-	num_clks = AGILEX_NUM_CLKS;
-
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-				num_clks), GFP_KERNEL);
-	if (!clk_data)
-		return -ENOMEM;
-
-	clk_data->base = base;
-	clk_data->clk_data.num = num_clks;
 
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
-
-	n5x_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_data);
+	clk_data = agilex_clkmgr_get_clk_data(pdev, n5x_clk_register_early);
+	if (IS_ERR(clk_data))
+		return PTR_ERR(clk_data);
 
 	n5x_clk_register_c_perip(n5x_main_perip_c_clks,
 				 ARRAY_SIZE(n5x_main_perip_c_clks), clk_data);
@@ -530,8 +646,8 @@ static int n5x_clkmgr_init(struct platform_device *pdev)
 
 	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
 			      clk_data);
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+
+	return agilex_clkmgr_add_provider(pdev, clk_data);
 }
 
 static int agilex_clkmgr_probe(struct platform_device *pdev)
-- 
2.49.GIT

