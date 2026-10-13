Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E547ACFB;
	Tue, 13 Oct 2026 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875292; cv=fail; b=Oz7ZmnjiOB4gbNGUUCckbD1UAlXNAIq+tlYDbMEXgfG9Jb9+AoPAAYw+alN7FYuFnoqFvwkp9thvvJOXpcboqBKPLK6yNBDtBGyKczPv8+LQ6nx5hSMElD3Bt7obiGagubD5spg1V7cXi/RkYzZ6B+Htg9qsry46MPLQZNT/p2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875292; c=relaxed/simple;
	bh=NpX5lKUHZCoOcGrID7qoqpnr8gK0DSODM5oFExM7mKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AV894OFH72QMWFMLTrGbMbRrGLmp1yCi6vG28+pUjB+qxNr3sLS9Wv6umltPBBHzm9V0KYhdKesUhh58shnwiMMaxh5eM+O/61L0212iF76ctRw8VHwyKhtn4u+DKw4w18iyBYq0ZDb2HrurmauT0gNgTFBRiHbBbYFAS3Lmo/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=qpOH/dWm; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="qpOH/dWm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfjGRI8S36qY3YkYxtT29L5QeiHu+LLb+Nb3mh8pWofm9x7+pJaw2TurlUFWTBxYqR86IkqM50lPTUi6InDmNiv/ab8EbXQ+8QZcRbjWrA+yP0pOiDpqfJM3PFZygF3tzjRb2YaXcS8F/0Ybeh4XQFKJTyK2Mqv3PxYNE/hl/dC1aNjM9a6p/90nJ2GAm+iUVb4xB6sNzcwWLB9j4KN0koARh3TQIXf4Fn6lppAGATO5ZTL9FQnU6LsLX1yCQvl2YqPZ7XfvefDY1Qrr9k0p79RIU7t88owQ4fXSb6lfvLy4g5+TFyn6/2Zfmzmcd6LaSXqCf/00OZG2OZDg7T7rzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELyOiwmGYusuzEsFJSGxuSOexHx4roldAbB+Ku+fZeI=;
 b=uoqXtdFON4zF1miRCwOFz/MzrCyDutU1PIzGNU+B5P0kCPC/ZxH36u3Uk+pIAGB4m60RDdHF/PHQvT8DXYCauyIazWc2/rMvFIhZZR+I2V+NeBhLYj+ciEN/Qbx1e/7/sQSPbPlgEzxWWs7esoA2HgaOH/+pL4GYMhr1EnCgy3dvhXY9Mc+RzzHdpUzfpi7tzLw8cGJBLjbU4TwbwVdu+ennwXOoJ5Q4wo9WoKcZrH+3rgHspYeXzB3bKzw8U6gE+d/RjRG9WgBEZgk/Akj+sZISLQtsN6sEedMenoC2N8wzgROyX8bzciQfrWZWYs1M2yujAo/9yf7g/XhL/Pc8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELyOiwmGYusuzEsFJSGxuSOexHx4roldAbB+Ku+fZeI=;
 b=qpOH/dWmOyaDLgcg4KyA4R5B1lpUOJAVYZO7JgW8bVRNXsrucUsF8qxfeqCuaRpeKkVCzSnW3POdzu84cn5R/URDSlZPJNM5U+YLpgIHQU5OZLCxLhOdsuPXJZbraSKY/lRyXhzjp2AajX/l08xjSrRnmf4skSpuuNUZSyfLgmXJaC9gy1NmtNeE7Ixr0TJn6cybusbBq7qUVq4KP38sz9wj+4GcNWmOx2mgFagswZsvTjWnBHnwoq5ZvH8IM1ME4G2O11j4uQ4miqdmTuoojTfK5NJTPiXNiZJ2I/SqcubNztjV0mZthN5VtjoJTtqVzXtBoho7QjAEHmD1nFpv/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by BY1PR03MB7947.namprd03.prod.outlook.com (2603:10b6:a03:5b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 07:08:06 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 07:08:06 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 1/3] clk: socfpga: agilex: register the SP timer clocks early
Date: Tue, 13 Oct 2026 15:07:52 +0800
Message-ID: <1fc28c08edede0f96b5eca860d5c344e185f18da.1791871090.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0920c3bf-3789-4b56-7a6a-08df28f8bacd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	JpgN0no80FAkip8rwPcYrd5fEc/xLb9C70011u2IVm7GXC5EKjhwkPsnjitapjKDaaYCaVG2XKoG12U6XXVUcrL5B2J0Lonv63G9ZH1KDvaTs34iOoUBH5A6v5S23DZQiVWERryAq/B389KizGSSmhD/YPew2RK9qZJopKsIpwJkQy0exnVH4wVRI/pegkMFw0Frs0/7udkHS+eM5QgjeSS8Bcs+iQ8FY+/dAR5F4vinzwS/d50ecTO0gOHtrSS8MVgRJ2Lxvr7uLXpR2+wEVgbURaNdJwnNXoXxoqAk03o5O7sF78lARPIaRsBSPwi8012Os4cZPvizPIm7R7uzRf3nXpeAXgco5IKecBCj2QlIaWDGkLQvfxzyJ1ZZlvGZX6/QL6bOA4zUVRTK3Jgz6CbhnLUS5QGlLM3PcT0cXCmd6NqEFbZTM28viFEl331iStRKr4/hVUEQKhuxFlQmnuQGT+8sbW6xiuJd8oNYybmkm8SFbgAd/BitR07NpGUwCzaj+rp53Hh14HDP32rpDzDtoDQCdtBx7gJQo/WTNBQUqqaMVdjh9i4lCi9JVjzy3ht4nwgysYt1RUkzEjxMfFp7RvIX2Z2viFTiwAfX18PM89++P9WpxSmzmOU8pcaaswHuOt6yhcsD7wWWM9Gmt8s1MeQ6kZoq/eIsOvZnzbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A7P4TrfDyrh6PcYSZLFBKmaUGOhMNbAZ5kK0T3nO5l+WHTC6svWKOZPPzJzM?=
 =?us-ascii?Q?QP3kTnW4FOAi8n9teyv8n6MZ9g+QReDiUej4j/qP22RNeoqv8Z0ZNR5Sli2Z?=
 =?us-ascii?Q?heuuv3fxXiDqhUoG8qCzwlma75pakKo7AumQNlhriNVuansPZPx7jx64Xr/h?=
 =?us-ascii?Q?+Mbu84alXBQevcdRmtgS5EI7zg9c+a1hfgFd8AefrJZT2bEVlG3RtmnlmM0X?=
 =?us-ascii?Q?T/dLthbgjYquAiAud0Ldf/ZjU/IrVzRUmUhdmufW5e24Qr1D1hjQ3W5iO5JR?=
 =?us-ascii?Q?f82n/dmVI+AaC3lByAUui1UL5vLjWtHIvwyH6qHI8gA2/2XaPg0iZOnJMinQ?=
 =?us-ascii?Q?x8mxAl14/ISZqHjmneol7zeq26RPhRQSVuZeVy5na9xFYvxfvadG0akiI3dS?=
 =?us-ascii?Q?egpoo6sjjajXt94ygjCD0WRg7oyuGC5CJ6a6NNEE46uAB1me7+vrs41i9dXi?=
 =?us-ascii?Q?ALiJ5lKRItxqCSoAmCZK2d/MJR0qBodWkhd5J6e7txRvuGKT7tMiNjuT9Dsd?=
 =?us-ascii?Q?hP7S6YergJIfTRCvKJOfZTTsW95/E3apn2Nwhw0XGy9GKA+6kD6tIZ/Uw6fW?=
 =?us-ascii?Q?vpKMod89YeX5NiKD9eNrBzjW/oweiLsnxGU3em1RaXGDRP7JvpW4R2NdB7al?=
 =?us-ascii?Q?c3typAd5WoPtVl+K5mUD/ekeCJcKNuwWaPsiAPWhxSqL5/Q83uu3uoESnDCL?=
 =?us-ascii?Q?dWZamGWcaxkHZBTn+3oSPEfI01cQL10d0Bj12XtxVxpDGlN0wt4xv1FKvH9I?=
 =?us-ascii?Q?Wc8YgvgssrZky6/0XMqeSd3SAYARe4jf47bhzIMsvUMBn4ngYcBlXMJ9BvOq?=
 =?us-ascii?Q?ilKQuDcBJK2htZPkBw/ImEgoT7Di7sFVA2NDbz+QrlengWiieC+hTfHm4Czo?=
 =?us-ascii?Q?/GS2cPQAxMeZw983P0gU6Fjv5zjHR5ZfdHTECvYN/F81w14KzN8IXMEpepAi?=
 =?us-ascii?Q?/JnfA6C85uJjUOOfw881IIIi2Eb7mSL5IXsp0zcAASCxRDPRTrcUa31e1kO2?=
 =?us-ascii?Q?IlKSn79j1YufWTBycL97OWh6PgAieCxIA9x/7GYGqtW/udUGZSuJQSL1QMzq?=
 =?us-ascii?Q?BWkpJeDOQaE50Z9SQjqbfwP+yUEZigree+x4qB24mCUoiJczc8Tu2AgQraAB?=
 =?us-ascii?Q?zxsMY3qosNopEf1BrwpSTrxY32YPj6Vk2xba0h11/xUKMbsA4Vs7YSNb93iF?=
 =?us-ascii?Q?7rhub9cVZI8pWXT6KV4qeF7ZWF+7+FvJ5iPs7Yp+AFjqGyjPHWmLWlJsQs8a?=
 =?us-ascii?Q?ztXhsMuPB0daqF8XEdS9YxeF6Ivwdz9Y3y7L2RXwJIbO10Zc/WQR8o4yQvpO?=
 =?us-ascii?Q?y8TrICfMQU6OhjRJpmmJ52Xi/M6HVQxB6SvoW3BGugseZuQxAppOEDixOOZs?=
 =?us-ascii?Q?pebuKulO9QwKffB6DW0suTb/b3BlmxIHq4DXcw+RWXhXtcyqSvFzVdrCk+Kh?=
 =?us-ascii?Q?UYREzGbyuI07eeXEY09IWJUpT9V1GBefURTFP/g1TrLWMaHiBUfNe5nrUY9/?=
 =?us-ascii?Q?8Rcw2hnA70OU4YHFPQu/PCcY2j1zmGwqQiSOrKZHZJH3oGHSTKJvwTMNPvpf?=
 =?us-ascii?Q?05v84jt7ILeNGjJbmNJs1OfRcPS5RUmKT8CHvoPRJDZH6Brx53QxLDWS70FM?=
 =?us-ascii?Q?zQfBYQ7gIaDt2xs2v1q4+i1l4Jn9OUWEM9IVw834grR38SbZH1P/P2nYmuAj?=
 =?us-ascii?Q?nMgrAq5RBJd5To1Kbl+vIFgC6pAyYfFc84uHF6fdH9Vt/MjDKnw+u5dFzRGD?=
 =?us-ascii?Q?c/72600slzhyECxR1XzIAPdWUAOHvUc=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920c3bf-3789-4b56-7a6a-08df28f8bacd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 07:08:06.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6GBeynWrNnNr2AlG6zt3W4OoIZfuyljhrBJtEklBvNk2UP2Ev/R7oR9Vrf4+E3k1Fg4UGoECzXclanbuVBIZp9BFlD6qnfu5vmC7cSg4LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7947

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
 drivers/clk/socfpga/clk-agilex.c | 242 ++++++++++++++++++++++++-------
 1 file changed, 187 insertions(+), 55 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 2bdea1997b5e..445d814e2f3a 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/agilex-clock.h>
@@ -232,24 +233,49 @@ static const struct stratix10_pll_clock agilex_pll_clks[] = {
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
@@ -257,8 +283,6 @@ static const struct stratix10_perip_c_clock agilex_main_perip_c_clks[] = {
 static const struct stratix10_perip_cnt_clock agilex_main_perip_cnt_clks[] = {
 	{ AGILEX_MPU_FREE_CLK, "mpu_free_clk", NULL, mpu_free_mux, ARRAY_SIZE(mpu_free_mux),
 	   0, 0x3C, 0, 0, 0},
-	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
-	  0, 0x40, 0, 0, 0},
 	{ AGILEX_L3_MAIN_FREE_CLK, "l3_main_free_clk", "noc_free_clk", NULL,
 	  1, 0, 0, 1, 0, 0},
 	{ AGILEX_L4_SYS_FREE_CLK, "l4_sys_free_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0,
@@ -292,12 +316,6 @@ static const struct stratix10_gate_clock agilex_gate_clks[] = {
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
@@ -454,33 +472,166 @@ static int n5x_clk_register_pll(const struct stratix10_pll_clock *clks,
 	return 0;
 }
 
-static int agilex_clkmgr_init(struct platform_device *pdev)
+static struct stratix10_clock_data *agilex_clk_data;
+
+static struct stratix10_clock_data *agilex_clk_data_alloc(void __iomem *base)
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
+	int i;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-				num_clks), GFP_KERNEL);
+	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, AGILEX_NUM_CLKS),
+			   GFP_KERNEL);
 	if (!clk_data)
-		return -ENOMEM;
+		return NULL;
 
-	clk_data->clk_data.num = num_clks;
 	clk_data->base = base;
+	clk_data->clk_data.num = AGILEX_NUM_CLKS;
 
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+	for (i = 0; i < AGILEX_NUM_CLKS; i++)
+		clk_data->clk_data.hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	return clk_data;
+}
 
+static void agilex_clk_register_early(struct stratix10_clock_data *clk_data)
+{
 	agilex_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_data);
 
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
+/*
+ * The registered clocks keep using the mapping and clk_data, so neither is
+ * released once the early clocks have been registered.
+ */
+static int
+agilex_clkmgr_setup(struct device_node *np,
+		    void (*register_early)(struct stratix10_clock_data *))
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
+	clk_data = agilex_clk_data_alloc(base);
+	if (!clk_data) {
+		iounmap(base);
+		return -ENOMEM;
+	}
+
+	register_early(clk_data);
+	agilex_clk_data = clk_data;
+
+	return 0;
+}
+
+static int agilex_clkmgr_add_provider(struct device_node *np)
+{
+	static bool added;
+	int ret;
+
+	if (added)
+		return 0;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
+				     &agilex_clk_data->clk_data);
+	if (ret)
+		return ret;
+
+	added = true;
+
+	return 0;
+}
+
+static void __init
+agilex_clkmgr_of_init(struct device_node *np,
+		      void (*register_early)(struct stratix10_clock_data *))
+{
+	if (agilex_clkmgr_setup(np, register_early))
+		return;
+
+	if (agilex_clkmgr_add_provider(np))
+		pr_err("%s: failed to add clock provider\n", __func__);
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
+{
+	int ret;
+
+	if (!agilex_clk_data) {
+		ret = agilex_clkmgr_setup(pdev->dev.of_node, register_early);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	return agilex_clk_data;
+}
+
+static int agilex_clkmgr_finish(struct platform_device *pdev,
+				struct stratix10_clock_data *clk_data)
+{
+	int i;
+
+	for (i = 0; i < AGILEX_NUM_CLKS; i++)
+		if (clk_data->clk_data.hws[i] == ERR_PTR(-EPROBE_DEFER))
+			clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+
+	return agilex_clkmgr_add_provider(pdev->dev.of_node);
+}
+
+static int agilex_clkmgr_init(struct platform_device *pdev)
+{
+	struct stratix10_clock_data *clk_data;
+
+	clk_data = agilex_clkmgr_get_clk_data(pdev, agilex_clk_register_early);
+	if (IS_ERR(clk_data))
+		return PTR_ERR(clk_data);
+
 	agilex_clk_register_c_perip(agilex_main_perip_c_clks,
 				 ARRAY_SIZE(agilex_main_perip_c_clks), clk_data);
 
@@ -490,36 +641,17 @@ static int agilex_clkmgr_init(struct platform_device *pdev)
 
 	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
 			      clk_data);
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+
+	return agilex_clkmgr_finish(pdev, clk_data);
 }
 
 static int n5x_clkmgr_init(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
-	void __iomem *base;
-	int i, num_clks;
 
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
-
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
-
-	n5x_clk_register_pll(agilex_pll_clks, ARRAY_SIZE(agilex_pll_clks), clk_data);
+	clk_data = agilex_clkmgr_get_clk_data(pdev, n5x_clk_register_early);
+	if (IS_ERR(clk_data))
+		return PTR_ERR(clk_data);
 
 	n5x_clk_register_c_perip(n5x_main_perip_c_clks,
 				 ARRAY_SIZE(n5x_main_perip_c_clks), clk_data);
@@ -530,8 +662,8 @@ static int n5x_clkmgr_init(struct platform_device *pdev)
 
 	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
 			      clk_data);
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+
+	return agilex_clkmgr_finish(pdev, clk_data);
 }
 
 static int agilex_clkmgr_probe(struct platform_device *pdev)
-- 
2.49.GIT

