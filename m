Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7948F005;
	Tue, 13 Oct 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875296; cv=fail; b=WDP+jjB5ieFmpD2k3hEQKrHL15A4+FwNeJjq+Kufz3ROnPHyHjygrK/xqi9mN7x358ramyO55ts8K6YegNoPQmAfwbjwJiCFmze0eFZDNOpAs+mbVjotWy6R+ebpedGOeEDLI3YjWxkqf3OnqBz+7gQ0N9ecH8XxFKnoeQLKzUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875296; c=relaxed/simple;
	bh=F708ZyLimbqu1eXhOypMUf+kJEiegkiCMKXUpm2ubFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qV5sBg7gVF8ePnLq/ml37kMa6HNYcXyOOwcBns/7XnW+ppYP1MqvuSgWHyN69GKRLq7X08gG3PYu+TMRlmWt3Pvf+q8WNGtDL1qqw/5Km1EnFZ24bR2/hrToCgCAVhp4iwMvzuJuvTv3Eg67qt3/aeE9WLQKclVFyOsaIilemdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=MnbK+x2q; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="MnbK+x2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzF4geAnA7MaH9EK1deXVO9jdhf3Axb0kN8n5eY0Ag0Z4yM5CU6KPmIkY7MpdO7VkbsfRF7TOEdSsWNQWULNsXEQsYxc2jXSvi6iY2eTVKiZctcwRe6RDIO2fb1Swj9OeeKXBb/0fyjU8zlAdndluIwm0TLIzKEEEjXTeVxO6ayPZDLKy5xL0W2QthW+3VrapH9bZ898go7ljWxbS1QHpQOLRH/Abqo9fBnhUwBdP0cbf2WHTFRRJioR+BJmUI7cqQTlLQciz6kwLss+MlvwYQiusn0D6MVBmEZs+VnvFI7+HYlsPsOdgZYBBuMh4aDIuwl0Lg2cM2cw7tbORI0bJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLZpDTEt2IHIzjbaWvE7gyvuiYgies+XzqTKWQRJC78=;
 b=LrpkGYK4327ytRjPr+BwHCyPH3WY9anGXt2RI0VehMDvsa44W2hgx222Sl+iyX3UoAu2FjcF6BykNaf0W7k2FMQhv7krdldnOPhXwqY/XxGGshqc8nlF3Ia1VsW4HLtcGdMM3Plx9gHCUrrLCJUKFqewFNYExNprCrCTOvU5b6yX6uwbJRbFkOacy8yb0PTA4R2xyUn2hBstFJWfnYLyNCn66zuKAmyKni3Mp4JaqEN5stQi8jP/U8MY4wgQobKAHsknOuXxrye9xFH+1ygkKJX5xVVKJL9u38tm+qQWWPy9LZbxcwdKyIInor3UZ6VoryWK7girrHI9UXeFQXTKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLZpDTEt2IHIzjbaWvE7gyvuiYgies+XzqTKWQRJC78=;
 b=MnbK+x2qsetgo5bKNFKSlb895HzACogPn7T0BRwfo0jLW2yxy5q49JIBgQrMl9eqni6d5l/4B3NEm9R013JUV02ls26dDlrerpJ7sGDKjuYO+hrC7xZTIDFN6swBjBtOyPBLXnlZ0eeEi4FjKfYaPtl8SCMgLPA0ue3ghgJb5A8qQwbKm+TP4dBfy+PMafhQArW45JAIU85RWl+W6Xge82SrzJsBu9NqcOqWAsxmwGgPNLm7yqalZbbWXgrxWSX00EpId77fjHcLlEeyZKy7lp/0s54H7QtTArHFUaicJoz3qAnaksflHbJ9Ri3qkww+CruT8jzsvBq9JYlU8uFKXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by BY1PR03MB7947.namprd03.prod.outlook.com (2603:10b6:a03:5b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 07:08:10 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 07:08:10 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 3/3] clk: socfpga: stratix10: register the SP timer clocks early
Date: Tue, 13 Oct 2026 15:07:54 +0800
Message-ID: <7de51d5f9c716c03fabab77d1a2b4dba3af745fd.1791871090.git.adrian.ho.yin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 241457dc-d9f9-4871-d86d-08df28f8bd2a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	K1AoQDy+8Ae7l9Qn1z5mKXLufOpgxqB8m8uEb6iBB+RIBUFRNysJZQSIyKcHezo/nPz3eTsrGQcrDRs9T8as8LTD6GrlRx2NxVwylEFeO0TOWLaHuU/Reh7EiW24zEdEHYxplKsSJz18ul/IsLvd4/0kLYBS0RfG1WE6rF9nxHqDK6UpEfJ0Q0r8Gn/EisbvQLxY9XgHkkOEkxCBpzcI1gOaHSdRSAoIcSUOvCqAkZYrzRZn9qolxZvFz5/nZKUL7hwaRgn5UDdzIoZzZfcwT5gm27Noo77xLeg2MkFVnHkHPkAyhSngGnb5l8GUlkSlh4fiOaMlUDD/nQtZQJuY6jKQDDYLTfsaO2DWuxus1G1cyxk2eInlocuwotskgNjFeQdxklu3ihzOVNak6nPpcpF0deqc/2UL05sr8Yl7invy9bf/o2QHqBQf9eIED5rJlvGiYDQq0FtQG2IN8YfRY+qas2e3GFf4D50N3duHCmvTixgk74iq+ipW/zfP6YS4qDrGLzifjTw7gZybXPGqZKdOtlKkx9IXoFlASHicbH1aqYaYntA2MrLukp51l+M2ORIP/LmX/JelRiMK2J4tY8sH2YR6rJJpMjJA/jRowiXGQHqJOnP9uPOga604XOJLtVGFJIad9IZy8rrYvwhe9adH0j5bbjoSZjzEUF3ZEG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rqOVPdutRFsVhZ1blrPxRo7tHlsGkxbGPeUd208zLlGtzXY1+xrlrvakKRjQ?=
 =?us-ascii?Q?HxyOVicZxtFZqggO32p/+hZ+DFFhUY865JiblAffzGaUazb01RX7Fv/Wn+et?=
 =?us-ascii?Q?gLwvsT0AktTHUil5wKLi1sJLZRrhQi6qyW5oWL32xVnDtkU5TT55m8Xsq3x8?=
 =?us-ascii?Q?mhxaWViPMRCvCLc2TQVSmlzbfFoyMjLLAQJZVKdAJohEEI07qffzxuKi1qSp?=
 =?us-ascii?Q?LBgAyqLlxvoPPHaALVr2s+xsXWPP7YaUDbxcdHW5bYs5UrANM7ODmjsOffnU?=
 =?us-ascii?Q?8Rv76MG+ijkAnmq0Dzphis+iw8jT3QPB023FYkTldWU+4Xh7w3D2Kg/aQvwp?=
 =?us-ascii?Q?EshU0GTJblyL1NyXc8IPa5y99nVkTAxGmJCFWTptYp7Om/Z83DhjwPKJv/VV?=
 =?us-ascii?Q?21x82vhP5zflnfzoCgeT10IXBkqgLxtikm3p2x1Tfc6+kqp4n/Tw5XsFo1xq?=
 =?us-ascii?Q?OwWj4cWSU9B/+HdZAHEuvZgRuUSkHCr9hjBR5Q/xvNtZdkjiLzMuifLJmYUU?=
 =?us-ascii?Q?nv28fHaNLtFT+JZ/Z1IQUrG5oqWXmAGfC4qbv5aUsHgOV435QInjZOwOnap0?=
 =?us-ascii?Q?XKNktYoiQTu//Kc7GPhOqGXFGGu152xAjNOJl6gxjREAXMIDKM+hascQBGpS?=
 =?us-ascii?Q?iyRQnu93s/NmyFQsBLUPfDBDMiuvtVeLGCKy2hIMRj08M/l3cHXVrcJ6ixTX?=
 =?us-ascii?Q?npF/uUbufp3cxfuEtyZvznHGVPlu7MuEBn4UMfXdz5igRBQ8dlvl+9jbof+v?=
 =?us-ascii?Q?c6bIlnMz59Be5hZ2bdpJp7L0EKTuoonoF5jiltTojeBSEzQXB3w2nNPzMnYx?=
 =?us-ascii?Q?g1oTd2sbuPUkSR9RJozyxmRMvydI0D8yfEWCIUpqzMSxs1I4+ZKzmd4wXQ+0?=
 =?us-ascii?Q?h6gnmG8EqyIRN5dAYphQQFIAhFK7bQYd/s6PygcpS9+CM+0mMiRTyWQaGqDt?=
 =?us-ascii?Q?BkWVsug7BocgF7zk7I7n8Ns8qBkxuKFFWm0eo4Yt76uB27cowAsFzBrv1sZk?=
 =?us-ascii?Q?U0DeW4YMm+KCnmuSGYJma0wxtKabW95kyfYIDj2aPCaRA8PeslOHWFeGhESJ?=
 =?us-ascii?Q?/EEwgds+Mp3esu7HkpT0evLrgKBBvPAoJxrNzdbtOO5M1KF8O/7bt4KP250G?=
 =?us-ascii?Q?Nez+HVVMB9QkJxcafCV1NlAsSZ3wCLZKekM04kPDsHWc//zIEJxkTUHB9syQ?=
 =?us-ascii?Q?OSTDg7jRIqY6L9J2wgCrstU9TGfGkfN8HPCBocal3DLBd3nd7etE3qsFUhA7?=
 =?us-ascii?Q?inopdWToCmU2DBCIebu8q7DOgYcMjaLToDsnn9PSBvPJPipTVTySfvVwZCHP?=
 =?us-ascii?Q?NGZqXq5fU6pYB2mVpwnFhKwspVIUzdZJfPPHVkaGJwIuOrkqELgedKGQQXWO?=
 =?us-ascii?Q?/oHaQnxn9rxeCiviyKsry8j7fssIUHcXM9eBuiZo8OsWPkv8IpkvyUCS028c?=
 =?us-ascii?Q?zniOvG0xh0azSx02mBnQJUvrdC0A1wgguPILKpJvaLw6M8RTj+D9zKQtH+Yz?=
 =?us-ascii?Q?iUdmg0IndMqXwectxKhEz3yyJUTfWEeiq4OWL0+Q8SKOe1fe8Y2y0M0+6103?=
 =?us-ascii?Q?lKj4UBSnPF23dVd9QOAl3Qm7MntPHHOlbnQjI5OY9PZzcRnq+61HdUALMJv/?=
 =?us-ascii?Q?L8+nXc4zzsW1bAkM75SKrazVF5MqzqRAHl5U1uMmjCxG4g171iLo8ZWVGFHq?=
 =?us-ascii?Q?eMHtDZfK/3eVTG9N6OeR4aqnY1Xb+jmjfpjopABoJiCd+x6CqC0eJGQu9KgS?=
 =?us-ascii?Q?AUweIo4ofivybpabx8FF9tOOy204Se8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241457dc-d9f9-4871-d86d-08df28f8bd2a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 07:08:10.1808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQKEd/1WDrh/DJHhvy0L1mOBRcmWW+5WEbc2DE3dDza/QaBJajisOPmqM+GjT2gJWQMAVwKHfxap+06CoNp7e9dMKECEJIZkTs1JcYhVn+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7947

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
 drivers/clk/socfpga/clk-s10.c | 146 ++++++++++++++++++++++++++++------
 1 file changed, 121 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index b4bf4e2d38e1..1976789b5166 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/clock/stratix10-clock.h>
@@ -188,20 +189,36 @@ static const struct stratix10_pll_clock s10_pll_clks[] = {
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
@@ -263,8 +280,6 @@ static const struct stratix10_gate_clock s10_gate_clks[] = {
 	  1, 0x70, 0, 2, 0x3C, 1, 0},
 	{ STRATIX10_L4_MP_CLK, "l4_mp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x30,
 	  2, 0x70, 8, 2, 0x3C, 1, 0},
-	{ STRATIX10_L4_SP_CLK, "l4_sp_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), CLK_IS_CRITICAL, 0x30,
-	  3, 0x70, 16, 2, 0x3C, 1, 0},
 	{ STRATIX10_CS_AT_CLK, "cs_at_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x30,
 	  4, 0x70, 24, 2, 0x3C, 1, 0},
 	{ STRATIX10_CS_TRACE_CLK, "cs_trace_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0, 0x30,
@@ -382,33 +397,111 @@ static int s10_clk_register_pll(const struct stratix10_pll_clock *clks,
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
+/*
+ * The registered clocks keep using the mapping and clk_data, so neither is
+ * released once the early clocks have been registered.
+ */
+static int s10_clkmgr_setup(struct device_node *np)
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
+		return -ENOMEM;
 	}
 
-	num_clks = STRATIX10_NUM_CLKS;
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
-						 num_clks), GFP_KERNEL);
-	if (!clk_data)
+	clk_data = s10_clk_data_alloc(base);
+	if (!clk_data) {
+		iounmap(base);
 		return -ENOMEM;
+	}
 
-	clk_data->base = base;
-	clk_data->clk_data.num = num_clks;
+	s10_clk_register_early(clk_data);
+	s10_clk_data = clk_data;
 
-	for (i = 0; i < num_clks; i++)
-		clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+	return 0;
+}
 
-	s10_clk_register_pll(s10_pll_clks, ARRAY_SIZE(s10_pll_clks), clk_data);
+static int s10_clkmgr_add_provider(struct device_node *np)
+{
+	static bool added;
+	int ret;
+
+	if (added)
+		return 0;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
+				     &s10_clk_data->clk_data);
+	if (ret)
+		return ret;
+
+	added = true;
+
+	return 0;
+}
+
+static void __init s10_clkmgr_early_init(struct device_node *np)
+{
+	if (s10_clkmgr_setup(np))
+		return;
+
+	if (s10_clkmgr_add_provider(np))
+		pr_err("%s: failed to add clock provider\n", __func__);
+}
+
+CLK_OF_DECLARE_DRIVER(stratix10_clkmgr, "intel,stratix10-clkmgr",
+		      s10_clkmgr_early_init);
+
+static int s10_clkmgr_init(struct platform_device *pdev)
+{
+	struct stratix10_clock_data *clk_data;
+	int i, ret;
+
+	if (!s10_clk_data) {
+		ret = s10_clkmgr_setup(pdev->dev.of_node);
+		if (ret)
+			return ret;
+	}
+
+	clk_data = s10_clk_data;
 
 	s10_clk_register_c_perip(s10_main_perip_c_clks,
 				 ARRAY_SIZE(s10_main_perip_c_clks), clk_data);
@@ -420,8 +513,11 @@ static int s10_clkmgr_init(struct platform_device *pdev)
 	s10_clk_register_gate(s10_gate_clks, ARRAY_SIZE(s10_gate_clks),
 			      clk_data);
 
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
-	return 0;
+	for (i = 0; i < STRATIX10_NUM_CLKS; i++)
+		if (clk_data->clk_data.hws[i] == ERR_PTR(-EPROBE_DEFER))
+			clk_data->clk_data.hws[i] = ERR_PTR(-ENOENT);
+
+	return s10_clkmgr_add_provider(pdev->dev.of_node);
 }
 
 static int s10_clkmgr_probe(struct platform_device *pdev)
-- 
2.49.GIT

