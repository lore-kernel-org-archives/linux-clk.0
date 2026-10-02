Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C557D47ECF0;
	Fri,  2 Oct 2026 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936600; cv=fail; b=seq4ODNKnE8OkvxW0WWVG6vr+z8+Uw42RlIt9U8+eN2jodxl4Q4M+kDOk1v7On+bYYMYWWcv5XnL1ihqJ7fd8Iejq7TyJELvVUjv6UGC8BKG2YV+mQiYhIGf1iNju9sJkqnTEWe8koGXriekISovnilIp05VrqIa3keeSk92i10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936600; c=relaxed/simple;
	bh=8I/a3bbT9Vrm49OqbyIyLMS6JfRrh6k5J/XmtZD0BuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tt8ypiLhuhk4FzL8ba/BQbydvOt1rnzTmxK0W/pqhA+3+DfNojyYUECp83C+4CC7rgWOlPhvVcBbgBAWfr2QOkAtkT0mUzI6EQT9isM7KZ8b/WUTZu1IrnGO1chtI21HAAEVOUAeHXHxqIyhGivztGXmV8NJprwzzNG2SB8Mmo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DGJbJSG6; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DGJbJSG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/rDgxfgX7sjnglXsBFqal3V91mPhYcha7z092967iwlkCt+n1m+McBbGDfueaBOgMM7DEvUbS2USL2J7ABi7mNRX9R/Pkdlkz0DYmteh9cLATvTGW26yuerQRqQn99Q7+plWMi6Nv2qliKkUw8ju9a028ghl0NGru2DHrvkgRXvdXI3VqpZePpBrtODyw4kANDubooJcQyFCEFTn6rxmRWT5NwfR6KGdKn00pdQhMBG0gFIYaQKRFjhza17e4a2Sq52LRRVXZ5kVZz1TxGaHYbHQhem2qIBKe672BP8F/LDGaIFiHcHCVlnXj/pCFHfC5YelsemqOFyFfrT1rLvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip+GrE4CoL6CJHtCbibVaZ+fI8B3vwgzN67dqQSthxs=;
 b=ZirHBadIOPGkW4pNW7u7rJ4nT0T61eAx6S2ZEh1zlM9FpFbYoZBjKn0dDmYlVu5FaaT30I8O2ZoODkUqyK++x0sMuV+MFgCdHM4mOxhQzGQj6md9/8sS8u2cqGybiMLxe+leykL0cxmdOojKv0xOHZJQEiZLLtd94iKMq1KcV+IRWGlQRGEN7t6lxE+b3ARk6NNdAuVf1oX8w4YfiG5MB6UZPRs3UJjfJj2IqR2o/Y0v5nwxSeDTrXXntuu9BfcGXJVWg1O1sPyOcjqe4rd9Hr1wxpziIp+3esAjZIDrX3Apc5HfQq+ynbAGtYcyrBh2ZzHQW47/OBFMEaYYFR6amg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip+GrE4CoL6CJHtCbibVaZ+fI8B3vwgzN67dqQSthxs=;
 b=DGJbJSG63+YIGePDn1o5CGMsIpZOXIqZZdeni4qv5O/j4LvWekWjqSxtDlAZtqMxJd5w76xY82ehGsbwo5yU63fyiby7dxEGis6FeOeHEWrcjhYZFoxRUjLnvbFqC4mbx+UOXcm+GK+Dhv6R+QFmusPQ/2q8iKigfiSLzKZFHSgBxtzDmQ3KQemACuWmKvzAWhTQ3Ict0jE3KvqjjS+nPCuBeC+2GekmM4PkB3TtYOS+lGqEGLy/PfHHAKO6OnYz1voOopbE++WSiS6S2K5lVTbDOhNpmlc0r/rvPvXPw0AzCeK44MElr9qXqpRhBTrCOKRQUmgcVQIBnTS9W4M41w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MW4PR03MB6588.namprd03.prod.outlook.com (2603:10b6:303:12b::22)
 by SA1PR03MB7053.namprd03.prod.outlook.com (2603:10b6:806:326::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:23:14 +0000
Received: from MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7]) by MW4PR03MB6588.namprd03.prod.outlook.com
 ([fe80::dbfe:2474:d98e:ddf7%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:23:14 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 3/3] clk: socfpga: stratix10: register the SP timer clocks early
Date: Fri,  2 Oct 2026 18:22:56 +0800
Message-ID: <3164e6dcf09ca68c2ff9537b0f96aefcc793366a.1790935401.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9a0300da-07e7-4f42-d027-08df206f2ab4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|55112099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ShLvi1dP9cn2/vqpCjHZPcWDNjt80DUTT+9bQHPFTnNNrDHyY9z9OHPqWH8y47mCzOA7ISHbKp6vM9taNbjw5aJVVF//3T4nnPchoFgUF2VmFJw+6XbeoA890PRm3uNU4+9W2j4qAfDogrdM3633K2X8dKAmwE8/PLahuZq560QZK8LAbUhRQ21NbyaoMvF4BST7q9DdDgmwo/uuaMpo9iqpPStG8HmHeJsk7bCGlp/dWHyfrVTf+js7zaU5jrdoA+WraQn5BeELFWjqdObuCo81x5NMwop2MhuI1qpte3lRQLxx+uN7Q2IopdfC2cdiqU3YJUPlCgL/nKa8FLlCUSnJ51yqelsTbLmLL3voKGf6TQlS/3FutomQ7izYkfb9c+gB95jmCzFwUNtMZqK3su6QgQQQvkXNp2QTWupzjwlcvqzT8qBiLNwk6xoN+U0kLA/E8PPAi735BeBwaYZYN5t86DErYgYGsdUBvY3YFis9HUX4EarTSxBp+cez0TQuVfwbwiOLGRExgn9n648m4JNNNYhjCdQOlLHMKaIRk5OIVW68xrg2Qn+kyti4+DlV961MyYGeW9E0MYy2h3CNMPcNIe7DbuN0HWPnhyA+v24gsqlcSOXNUxT2Y8ubCY5MmgLew2tO9QVr2Uw7vGqMSKZJOvh6KIW9tDfrYxS1WXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6588.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(55112099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BtkskwiK66AqnkC4UgZqjanw7+X4Bs4yzJaNU7NTtPLz1u5jctThx/4dWWZ0?=
 =?us-ascii?Q?YiL7K6MwyRIZ9gsld9QgLqHNl2s40gsz9ke2iGNBQMlgFw7O1Op3OpJOGmC4?=
 =?us-ascii?Q?yCJZaM1U5Hlfuk7RHWTXMalDfNahgMwQ01hCTGYo/WczWkCTSQ164AOoWDWs?=
 =?us-ascii?Q?/3Fh2Bjkso7S0hJi9cO+MOBajaCCPde5VNcG7JYhtkprGtILMzl44JGTgTm7?=
 =?us-ascii?Q?CU6ctvzqMTzRFcqOthLVWFuMG88E1lLtbz3RnhkZp5lvMU18A2tSOCEHlurv?=
 =?us-ascii?Q?fTtNoBZ+K2hUN41z1Crc9YAKjESeF4OGM81avxlJrVvMus/4AOSFuprxf4+R?=
 =?us-ascii?Q?InYPPCx+tZdioau01JigGjLzUTwFRmB9YgD3dBCTq6Y4+9t4em0hCmHlsy9b?=
 =?us-ascii?Q?MT4EkpzryfJQBIrQQsnX99qurNvo5R8M4TaoKK4sa4m8FtKR9KwgE/DCwB1X?=
 =?us-ascii?Q?JgI2n50xtAd+GxzZVfi4tGN9oUK4geRZQaTbj6mfnmejw1Em3BYdFBmbe8Eh?=
 =?us-ascii?Q?TyJLG6ao+cOsOK5ShVE7ml7B5gdSYubsVP5lld9a0z5Hp+x8pr9/sJI8Gju3?=
 =?us-ascii?Q?fXW0jbc+lv6/FlSH15UxHZxpGKHGhaIciw5fm/yc7fWmUowFSEQ6f0WyWL2E?=
 =?us-ascii?Q?+gldYmMRz1Uy1D1MfI8537KBns4gZBJi3v5TjtoTB27yKs7+re8Nj9YUBgu4?=
 =?us-ascii?Q?plPFoiZ+4USEMMngEMJJOttUxF8R6V3vMI5BmIFeGushmKpfdXWMlKQYJ2zN?=
 =?us-ascii?Q?kfgDJr7D2Xm8FRUfWaKY5vHEYKPzNqP65TTC31EXygnx8TpVgF5OAsqgioLH?=
 =?us-ascii?Q?/+EUIxNUspg6CQg8A8oS6iJCtROKdHjEhCbTAvhL+WgBO4PfuhmMklxvYQ3u?=
 =?us-ascii?Q?hv13vncDqz9LzimY3Jl9hmUVdG8IMjnruEssSwLXWK2kdNBP+Vg9kiMiSl14?=
 =?us-ascii?Q?h43GgK9iQWvny0e4sgbjT2PStbTRlnezx0GZXDWFTiNdZnlPJY5bxyfWJhXo?=
 =?us-ascii?Q?gZCOmEaq5fQGuDuRz6Ln86uXTqUIQq4OWdtCz3DwbMOKFhHwwOTe8ob64ZuT?=
 =?us-ascii?Q?X8L6UuzuACPSg9/09vC56dLnO6AltFhiCtF0b/7FzqqeTKPoVl+cBNPZcl7/?=
 =?us-ascii?Q?CZAvY5k56fhbJR8ROSip4QIFz1GrQ30mOzgnIQVhbLAtoqvcD0yO5plRTC4e?=
 =?us-ascii?Q?pRnGwCSbOm1VhKp3r6njeR4zxR9sT+z6KRft7OXJR3o5ttOdQF2BIV1AxhXj?=
 =?us-ascii?Q?8GFmvGNUsQDdZDMvDdNtzomci9DQW/PgF3yBu29H2AjSXIaWGHjLelfTjOUs?=
 =?us-ascii?Q?dx9M1hNInf7wvlv+gQnkTyGdzUa/8mPOTVKPB7ZAMFqYFVkiKldtl+VKZREN?=
 =?us-ascii?Q?UfB1FXjk9+u+es8Ycac3SoguHC9mb0YK9nDbVJ94Ng0YQMadvj5DcfIV2cAt?=
 =?us-ascii?Q?MrcH8M7q2b2urReUYE73DKjH9Fij3IZiGXeDWJ72dCETPpEjK9K5Rd98ORqo?=
 =?us-ascii?Q?q6OCaw4slsnbLQ75tHTBr/wNWm0tB0RMrbq2G0oi+zXS4kHHmrRfrYcbwZSN?=
 =?us-ascii?Q?NZ78PYGuusmqxpaRe7x5zvbQD0MJqniuREoAyJFhYGnjbwx5UfG3RDysYbkX?=
 =?us-ascii?Q?3hXJuiQ8rSAg2V15BM60omf4UnopMHGHVpZt2iJ999tjNYH6vGmawboVe8Xs?=
 =?us-ascii?Q?chGK3r5rGX7PcBqemdxQNQ87InSMUWPblBe6FK+UJ648SIuC3EAt8U353gXX?=
 =?us-ascii?Q?syOX4TE2RVVk/C9Ir8jZarBdjvG+M5w=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0300da-07e7-4f42-d027-08df206f2ab4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6588.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:23:14.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMOqoqFqydFpkU2owg6ZH1TzVR+CNVrBjAumJNi5a+VuoVlW5BubRN2VDF6qwd/sTS/HIsLFPysYp9QbetabLoGUi2o+y7DGa/M9O2o+tWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7053

The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
and cannot defer, but the clock manager is a platform driver registered
at core_initcall(). The timer's clk_get() therefore fails and the timer
is never brought up.

Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
main_noc_base_clk, peri_noc_base_clk and noc_free_clk) from
of_clk_init() using CLK_OF_DECLARE_DRIVER(), with every other clock left
as -EPROBE_DEFER. The remaining clocks are still registered when the
platform driver probes, which reuses the early provider.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 drivers/clk/socfpga/clk-s10.c | 133 +++++++++++++++++++++++++++-------
 1 file changed, 107 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index b4bf4e2d38e1..7eae2dfa408d 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -4,7 +4,9 @@
  */
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/stratix10-clock.h>
@@ -188,20 +190,36 @@ static const struct stratix10_pll_clock s10_pll_clks[] = {
 	  0, 0xe4},
 };
 
+/*
+ * The SP timers are probed from time_init() and cannot defer, so their
+ * l4_sp_clk and its parents are registered from of_clk_init(). Everything
+ * else is registered when the platform driver probes.
+ */
+static const struct stratix10_perip_c_clock s10_early_perip_c_clks[] = {
+	{ STRATIX10_MAIN_NOC_BASE_CLK, "main_noc_base_clk", "main_pll", NULL, 1, 0, 0x88},
+	{ STRATIX10_PERI_NOC_BASE_CLK, "peri_noc_base_clk", "periph_pll", NULL, 1, 0,
+	  0xF8},
+};
+
+static const struct stratix10_perip_cnt_clock s10_early_perip_cnt_clks[] = {
+	{ STRATIX10_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
+	  0, 0x4C, 0, 0x3C, 1},
+};
+
+static const struct stratix10_gate_clock s10_early_gate_clks[] = {
+	{ STRATIX10_L4_SP_CLK, "l4_sp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux),
+	  CLK_IS_CRITICAL, 0x30, 3, 0x70, 16, 2, 0x3C, 1, 0},
+};
+
 static const struct stratix10_perip_c_clock s10_main_perip_c_clks[] = {
 	{ STRATIX10_MAIN_MPU_BASE_CLK, "main_mpu_base_clk", "main_pll", NULL, 1, 0, 0x84},
-	{ STRATIX10_MAIN_NOC_BASE_CLK, "main_noc_base_clk", "main_pll", NULL, 1, 0, 0x88},
 	{ STRATIX10_PERI_MPU_BASE_CLK, "peri_mpu_base_clk", "periph_pll", NULL, 1, 0,
 	  0xF4},
-	{ STRATIX10_PERI_NOC_BASE_CLK, "peri_noc_base_clk", "periph_pll", NULL, 1, 0,
-	  0xF8},
 };
 
 static const struct stratix10_perip_cnt_clock s10_main_perip_cnt_clks[] = {
 	{ STRATIX10_MPU_FREE_CLK, "mpu_free_clk", NULL, mpu_free_mux, ARRAY_SIZE(mpu_free_mux),
 	   0, 0x48, 0, 0, 0},
-	{ STRATIX10_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
-	  0, 0x4C, 0, 0x3C, 1},
 	{ STRATIX10_MAIN_EMACA_CLK, "main_emaca_clk", "main_noc_base_clk", NULL, 1, 0,
 	  0x50, 0, 0, 0},
 	{ STRATIX10_MAIN_EMACB_CLK, "main_emacb_clk", "main_noc_base_clk", NULL, 1, 0,
@@ -263,8 +281,6 @@ static const struct stratix10_gate_clock s10_gate_clks[] = {
 	  1, 0x70, 0, 2, 0x3C, 1, 0},
 	{ STRATIX10_L4_MP_CLK, "l4_mp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x30,
 	  2, 0x70, 8, 2, 0x3C, 1, 0},
-	{ STRATIX10_L4_SP_CLK, "l4_sp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), CLK_IS_CRITICAL, 0x30,
-	  3, 0x70, 16, 2, 0x3C, 1, 0},
 	{ STRATIX10_CS_AT_CLK, "cs_at_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x30,
 	  4, 0x70, 24, 2, 0x3C, 1, 0},
 	{ STRATIX10_CS_TRACE_CLK, "cs_trace_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x30,
@@ -382,33 +398,91 @@ static int s10_clk_register_pll(const struct stratix10_pll_clock *clks,
 	return 0;
 }
 
-static int s10_clkmgr_init(struct platform_device *pdev)
+static struct stratix10_clock_data *s10_clk_data;
+
+static struct stratix10_clock_data *s10_clk_data_alloc(void __iomem *base)
+{
+	struct stratix10_clock_data *clk_data;
+	int i;
+
+	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, STRATIX10_NUM_CLKS),
+			   GFP_KERNEL);
+	if (!clk_data)
+		return NULL;
+
+	clk_data->base = base;
+	clk_data->clk_data.num = STRATIX10_NUM_CLKS;
+
+	for (i = 0; i < STRATIX10_NUM_CLKS; i++)
+		clk_data->clk_data.hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	return clk_data;
+}
+
+static void s10_clk_register_early(struct stratix10_clock_data *clk_data)
+{
+	s10_clk_register_pll(s10_pll_clks, ARRAY_SIZE(s10_pll_clks), clk_data);
+
+	s10_clk_register_c_perip(s10_early_perip_c_clks,
+				 ARRAY_SIZE(s10_early_perip_c_clks), clk_data);
+
+	s10_clk_register_cnt_perip(s10_early_perip_cnt_clks,
+				   ARRAY_SIZE(s10_early_perip_cnt_clks),
+				   clk_data);
+
+	s10_clk_register_gate(s10_early_gate_clks,
+			      ARRAY_SIZE(s10_early_gate_clks), clk_data);
+}
+
+static void __init s10_clkmgr_early_init(struct device_node *np)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
 	void __iomem *base;
-	int i, num_clks;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
+	base = of_iomap(np, 0);
+	if (!base) {
 		pr_err("%s: failed to map clock registers\n", __func__);
-		return PTR_ERR(base);
+		return;
 	}
 
-	num_clks = STRATIX10_NUM_CLKS;
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-						 num_clks), GFP_KERNEL);
-	if (!clk_data)
-		return -ENOMEM;
+	clk_data = s10_clk_data_alloc(base);
+	if (!clk_data) {
+		iounmap(base);
+		return;
+	}
 
-	clk_data->base = base;
-	clk_data->clk_data.num = num_clks;
+	s10_clk_register_early(clk_data);
 
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data)) {
+		pr_err("%s: failed to add clock provider\n", __func__);
+		return;
+	}
 
-	s10_clk_register_pll(s10_pll_clks, ARRAY_SIZE(s10_pll_clks), clk_data);
+	s10_clk_data = clk_data;
+}
+
+CLK_OF_DECLARE_DRIVER(stratix10_clkmgr, "intel,stratix10-clkmgr",
+		      s10_clkmgr_early_init);
+
+static int s10_clkmgr_init(struct platform_device *pdev)
+{
+	struct stratix10_clock_data *clk_data = s10_clk_data;
+	void __iomem *base;
+	int i;
+
+	if (!clk_data) {
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base)) {
+			pr_err("%s: failed to map clock registers\n", __func__);
+			return PTR_ERR(base);
+		}
+
+		clk_data = s10_clk_data_alloc(base);
+		if (!clk_data)
+			return -ENOMEM;
+
+		s10_clk_register_early(clk_data);
+	}
 
 	s10_clk_register_c_perip(s10_main_perip_c_clks,
 				 ARRAY_SIZE(s10_main_perip_c_clks), clk_data);
@@ -420,8 +494,15 @@ static int s10_clkmgr_init(struct platform_device *pdev)
 	s10_clk_register_gate(s10_gate_clks, ARRAY_SIZE(s10_gate_clks),
 			      clk_data);
 
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+	for (i = 0; i < STRATIX10_NUM_CLKS; i++)
+		if (clk_data->clk_data.hws[i] == ERR_PTR(-EPROBE_DEFER))
+			clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+
+	if (clk_data == s10_clk_data)
+		return 0;
+
+	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
+				      &clk_data->clk_data);
 }
 
 static int s10_clkmgr_probe(struct platform_device *pdev)
-- 
2.49.GIT

