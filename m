Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2095.outbound.protection.partner.outlook.cn [139.219.17.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBD3B4E9A;
	Sat, 10 Oct 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630951; cv=fail; b=lWaDuwxAfTEI2GkFCFbKyJmzr8JEDl+q+++Zj9SkTJjkY3BhnNTtxThpJnPR1AeaPiGJBMcFB5hOptLw4K7746qrPXg+TySxleQajKW5/VkaNHxS3ssySqV2QG4QdfyYWMy/JIxP+/PW4InhhmmBjmsU5X9S/Ua1vJnYHeeoMd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630951; c=relaxed/simple;
	bh=mJT4e5t1xy8DpVpdIvoonq0fntN4rU82Quv2T+3Vyo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xg/iNqRVp50E7eeQGsta33IHZVuL7dsKDakbMp1wjiJlQX/cyU0iDazRiAWxViXJ1VjBnkkj2DIh1Mc+zV5rLhWVznN336pjJvMwUUGK5DBuU99foZecy+T5AjE+PGT5o2BdFJJ5rh7sRZLu+A4q6DfH/7NFl3VbVjxCOnJCa3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jG1P5FNNJnzqyctVZ5GD0II8+HC6dHFzh9UkyEhD1kriXg+i720y07/0tYpTnVbu8i61ttWN3RRHtHVyaN8lCYYkJ89xfuJvFdVgTNe3SSpBZUtZrdhNGk2UmSBFtpx+P6K+dttiSPv88LiOjPfFa0pMBXoxAeSmddpknNAeMt8w3a0UZJUB/uxMO1vdnLqYV9+joif3SNUb+q1f6o9LmcZ5xW5eyMinTaPY1Zt0uKbKH6oOFO6vWa3vL6eHaMK0rOiYQ11+iIJhJnWbddhC2NReG7OrkHuCyLgAHms4ZU0I6AiAzFtdwc8i4oQ364JsDhpJDex5Ham8Tc1vkz9WVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3t/WhCTY1wDf1FsjCCwHDuGuPrVGaRI1pbruis7xQE=;
 b=f7zk1HPa7K+aG9Ry4r5LYMbjH1g+Ucl8NMSgVOsDbChDxZKW/GoZ/CrKhV+wpL8u1M6xZwlFkMKrNRh0eSDcGCKYoM+kO68lmedsirmbZ0ODZdZB8q+zZJYLsaqAosE28BhOQG/HJO3UxdPLrHG5j9ig9361pcdPM0HppJ1s7KC6W0nDSZXNcCgRrUEYVQDSLoI/YJWPrafXCv1UdQ3e5xWWyvXg5Jomwxj3dTYuyPhrLN05SHW9pbZIMGkHOznRiyvP0sEBDuLO6wW0YfBrtzsWmRv/scjOiAImZgk3FcmIOBdhm4bPQc098KlGDMHj/D/dk7XOKmeHpfax5py1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Sat, 10 Oct
 2026 10:59:40 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0496.017; Sat, 10 Oct 2026 10:59:40 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v6 3/5] clk: starfive: Add Peripheral-1 domain PLL clock driver
Date: Sat, 10 Oct 2026 03:58:57 -0700
Message-Id: <20261010105859.19505-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
References: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::20) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1005:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3d09c8-26f0-43ca-8557-08df26bd9553
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|22082099003|18002099003|10067099003|261009223027099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	IMTbiRuGbK7T0ACUqXYPwcI32PY24j21325Dm5K+ZR/JiQDXbfi35mSBDMBaj9PrxR1VN9yJaTYQPCLM8GoQogZCah6k2hEQgWHWg1A6ceNzX5S8E2YCbuPvfxesHmwXVhp41uIkYBImSl30Jxgqnn57sGC7L4nBLLDuj5e2Shymsm9nFjB7ZOYl96slR9wT8qCw5D4180Qa8NOwA6Ir68bn0tkXbCcscuGCcd2hy7bsvjyUNK+NecrYTkWYn0t1cSDWLgtuRH0QIGZPCL6xhG4bNB3mzEnyTqXc/zNPWRlivGnx6mhtRYUIQCZ8TrRxWcLoOP2cXW5R2Yo5xT1fIbOofk11RNvvkLceabSfAo/RUeaRaLFZPszXBxY9bJiAgXQhBZ4d57YliPxOfkcBtkJe3th2udySpXmPM+naE8MFX5be24ThMZNk0r384MalmmJ0i/YpywePBtGlB+/xVYVYmO3C5EcDTErxKYpuakaEqNtF+OfNmBqP0CrnhItzxlhHkBDY//XHJ96MPBEQMmFvJti2aJ7VTRXgC9STsvVKvgqNzrpzdbszldJvbcGP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(261009223027099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Gg5LLY3vjorFAqbLOuh7NAxpHxPKDCCGDU7cTknyCW2nkp8ApjyKxMtLe39?=
 =?us-ascii?Q?7Z7V/GDbTG3sn+meSwBNaeg+gl8ebPN1lM3jyuE+lcRpI6mit89NaQ5YPxqZ?=
 =?us-ascii?Q?tsIwSm7lEoGgQFluOUps0CXUjajicm17vSTTX8nnxCBY4tfAPHZcU8075fEF?=
 =?us-ascii?Q?Dx0IMa9ehmRn0I59dPxw5YcmfF4MrMctl5BkTMqGR1TkVEw+FlOVLds9zrff?=
 =?us-ascii?Q?cpRJS92sZX5MzHk15TDuONPMgTX1pT5JGnpIyRbx6+fV6nHQ3MO+YpAUru0r?=
 =?us-ascii?Q?Vqenmh1xdX9YdZsIHztVJtHri9fab4+f+epHZcn7TqAybQNWwG8XhLMmzE1V?=
 =?us-ascii?Q?3XJLf+J6KuAl7m+dC4iOQ72ey3esQz3wTrWHvuiHH9ESSqIRcNtqBMHoXPbw?=
 =?us-ascii?Q?NiZJbgpLCyJdSPrxoYnVVsNVwi/EVzz3Gi73EsJW/Soi7fWMVbCNurFYG4zy?=
 =?us-ascii?Q?qQZYFOCZBwV+Y2P+gtoCvthf5sicNWqP+hfz1XVpPwsVAaGMB0jS3nbg5HzG?=
 =?us-ascii?Q?oawG44WqRJPufbu7QMoDIlFb/hSPBWtqU+uadMKCHlYrNhf0hX9v/haOjOae?=
 =?us-ascii?Q?uvE5J0IxYqzqkV+A/Rbun6/nEywVKV6F/x13AjuPwMFHYkxsOHPaeieEnStw?=
 =?us-ascii?Q?0wyEV4Rx/Tq9G8Tg5ebgq3Ja9g2LCTbdaf+TAgEgDaT+7vRTQf8/o6yLGEXL?=
 =?us-ascii?Q?grs7IfA9kqtWUW5WKh7FYmkaHmvR2dJqd7rIvWczbq99AO9CYBsvOMWjc182?=
 =?us-ascii?Q?eFN6wAC2RdWShl3Yc/gV2YKJi4uM2taqgtUl0fTJn68PetmyInnU7CNlcIEf?=
 =?us-ascii?Q?QXVS5nyczSqpY6C1+AxQ/WkpR41i2UHeoY9yGw//X5vlVNqVljZuXozzqjbg?=
 =?us-ascii?Q?/6zrJGZtR9Xay7LHYifm37AwY13QXO+dX5fQjnl22NOuspWFMp31wHul22HK?=
 =?us-ascii?Q?YbnPQWbKAdr3WganREEIpnhXrbCW4N9wgU09BVdCEt9CR1UiNuVCqSod960C?=
 =?us-ascii?Q?bwrMZJxD+vrVehWKcO3hfSxd8q3Ov1Rls2A47E6E0t2bgBqcTfdSQvoa1wQu?=
 =?us-ascii?Q?TY6sVilhK3EKcu9480acM6MIxKxcFrXk7cvDpIDSekgpxJd6jKx6LWKer3Wi?=
 =?us-ascii?Q?c97i9yprxaFKnCEF5p0RSnxg/LttMtMTrlDs/xTguq+TilVi8OjWZnKNRU3O?=
 =?us-ascii?Q?eq0k+m3aHwv4Bxjc23i3UT9mXhigSHNQmJQ3I86blpPmfqXcohYLJ1cEpzoj?=
 =?us-ascii?Q?4vCpsSKqbkPLUS4UMLgzl6NFIcljEbhs3RO9Y5BwQkTBhFSSPQHZMUgA3S5N?=
 =?us-ascii?Q?zeFrabhWUOuqDEwTUr9ffEiZHFjHeHKVXaWGiEH15681GDQ87Aqxlx5iNm3h?=
 =?us-ascii?Q?dJR/q6Wao3OI5bBsamRfhx8YA9DG1dxns+ollR7kgv1YHBR6J1s78eE9qoHO?=
 =?us-ascii?Q?M3TEYMHJo4pvy4dHk5enOtPdPver2FdwHiTwHgf/JsS9mWUmlGAClPrlh86g?=
 =?us-ascii?Q?BpdQ0Jd7KOkT3Yp6TJyGu40ao8iIAeIs9L4BzO7A6a9oNB3QWZGxlmkkIT8Y?=
 =?us-ascii?Q?KoznYHxccxqxaac13fT7eQfYdJSdzGHOVT7lmhKqWFsBStOqHZoqk/5ND0Z5?=
 =?us-ascii?Q?1ggG+AzjqRPbev+mO6h4nFRqUDDYnofTtiDt4dbfUUb0badDzGXgWwkjoHGx?=
 =?us-ascii?Q?qCbofB3Xt3so8/MLwqiFkzuKRv35+pyS1l6ZPRX/QPQYR05hMdI1xxAzSP8Q?=
 =?us-ascii?Q?hyOYc6CiO2ufpb33TlOMLxtFAPM5d3CKdEfirie23agUyAYVJF+7?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3d09c8-26f0-43ca-8557-08df26bd9553
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:59:40.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HC8M1rDWa3RVBhU5yD4gUTgH8R6bNIhUrjqoO3TCSTiIvTxJk2GVLA0KubbwsfMxDaW2xhTezV3HSXXH0mo6PlvxGr5OKYtAiSvWSsmdOEj3dQidjX5Fju2FwImK2FH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1005

Add Peripheral-1 domain PLL clock driver support for StarFive JHB100
SoC. The peripheral PLL driver now also binds to the per1 system
controller node and registers PLL7 using the JHB100 PLL library.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  8 ++++----
 .../starfive/clk-starfive-jhb100-per-pll.c    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 00c46f5ec976..1bf64f1b6c58 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -120,10 +120,10 @@ config CLK_STARFIVE_JHB100_PER_PLL
 	select MFD_SYSCON
 	default ARCH_STARFIVE
 	help
-	  Say yes here to support the PLL6 clock generator found in the
-	  peripheral-0 system controller of the StarFive JHB100 SoC. It
-	  provides the parent clock of the peripheral-0 clock
-	  controller.
+	  Say yes here to support the PLL6 and PLL7 clock generators found
+	  in the peripheral-0 and peripheral-1 system controllers of the
+	  StarFive JHB100 SoC. They provide the parent clocks of the
+	  peripheral-0 and peripheral-1 clock controllers.
 
 config CLK_STARFIVE_JHB100_PLL
 	bool
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-per-pll.c
index d38116f16935..ef01f7d1d5f6 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-per-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-per-pll.c
@@ -19,6 +19,7 @@
 #include "clk-starfive-jhb100-pll.h"
 
 #define JHB100_PLL6_OFFSET		0x00
+#define JHB100_PLL7_OFFSET		0x40
 
 struct jhb100_per_pll_data {
 	const struct jhb100_pll_info *info;
@@ -39,6 +40,20 @@ static const struct jhb100_per_pll_data jhb100_per0_pll_data = {
 	.num = ARRAY_SIZE(jhb100_per0_pll_info),
 };
 
+static const struct jhb100_pll_mult jhb100_pll7_mults[] = {
+	{ .fbdiv = 156, .frac = 0, .refdiv = 1 },
+};
+
+static const struct jhb100_pll_info jhb100_per1_pll_info[] = {
+	JHB100_PLL(JHB100_PER1PLL_PLL7_OUT, "pll7", JHB100_PLL7_OFFSET,
+		   jhb100_pll7_mults, ARRAY_SIZE(jhb100_pll7_mults)),
+};
+
+static const struct jhb100_per_pll_data jhb100_per1_pll_data = {
+	.info = jhb100_per1_pll_info,
+	.num = ARRAY_SIZE(jhb100_per1_pll_info),
+};
+
 static int jhb100_per_pll_probe(struct platform_device *pdev)
 {
 	const struct jhb100_per_pll_data *data;
@@ -62,6 +77,10 @@ static const struct of_device_id jhb100_per_pll_match[] = {
 		.compatible = "starfive,jhb100-per0-syscon",
 		.data = &jhb100_per0_pll_data,
 	},
+	{
+		.compatible = "starfive,jhb100-per1-syscon",
+		.data = &jhb100_per1_pll_data,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.25.1

