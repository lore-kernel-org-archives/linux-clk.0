Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B97445AFB;
	Fri, 28 Aug 2026 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923951; cv=fail; b=Vzn+H0ZvfgRLRx3/BmwY+BY4FZTv0R9aV4nFs+xwIObA6izVKp5R/QUrUdUP60+Xria6UWaVN59fHtHK5KxHiGHgFpxEq2fSlvy5hw9LhAAwODUqA+cT/99qsDQpGxRc8vB5k0Lb7FhhDPS63Rx8mbt635zt0K9eMlrh51vCHyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923951; c=relaxed/simple;
	bh=RKSV6llQK6yiuBVgWsNEeUqUoMS71vdG3dYrCpHjbnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gEmTKlJEtfRuK2kGocT7ZIBeOnRo5KHk6O0nTr7/ZxKFGerHqGsgrvnN9lUvLpd0ZcWOuqE92vZaZu9exUwVDzKukqNzztZpOzt6XIDhSd/jy0fur7KWb6jUh3i8S5foGDmNnIZ3H6QGnqn0YBMw7xLlyvluyFZglbmnZ4FugrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbxVH0OreKYiFkX1eJuxe9dhhSGNycjpMVrjOgroZQuw5Qn2UOX78dL0VlV3EY3JuQomF8TQ548sWI7u6MQCYyV92OUP7S931Ep78703OR8FTt4YInaoKYo8uq5SaB8yGnYy6LoFaN3gut+emowbuHXAy/ihWhsZDlynQ61QDp2FadeztDW45P9uHU6LLI6f3wMq0xKg/hXpXCUqdp3hHewC81DnMOw0aMtRI78/8pyvm2aTLj7D5ql/PithaTUVA0/ufFPqbHvEP9Lv2vLRnH1uqwLT54UHoYLOx6jiEB5DHagmVUqxS93M01C0K++UiZaphA01YHjD/6ygVMDd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YL9bCQY8NgWI/OKcF86X3e9eQ4u4obpqWEsbnUv4WcU=;
 b=XzIFprI2zoJhfIQpDAqwk4MyoaRStWClpCfGNY5du92qnGo/RPG+iZSErYqRuzp4iJ9cyRwNnVeu7DzdcQhEjolR/zyi5yejcbPRy2NDiiFYMzWMH8Sef+Qe+OLxAtiAtPYI37KtPcpcvHwNinPPMVxJDEAK2bN3JrN2u8aSIgZt9YYnf69dw7gnV0xpo70Tfj5ZcVHKdk0LQumaH/3i6WENKsU1e3VhcpITs3w9NIMHRD/GOVVZbiaEj6rQcD99qx+b8Bmf7p/+btoWlZg9sVd126qkxyHGMjOIY3NXk/0CgK0WdScN+ChDV6ShdefJlPST228bmHCAexrHzbHanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:26 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 4/8] clk: starfive: Add Peripheral-1 domain PLL clock driver
Date: Fri, 28 Aug 2026 02:56:04 -0700
Message-Id: <20260828095608.19955-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1203:EE_
X-MS-Office365-Filtering-Correlation-Id: b28e1762-a9b7-4495-7cf4-08df04ea9fcc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	kBuoZARjVYSUfSOQI2nTSSQWA6RqP2D3i3LiSXnVlYJimIkxKnIkjm4mj4pfR0BhEPZ87LgZj2/VIt34R38L3cw1JUGXIY4cA1JQiXL3Hvy2IO7gIaWsbkI3u85fl4e04TvHI3oQKoc24kTDGgSNzmaSy7CYav2dWWGs8GyFkWBP5XI329uVS4vOT6me+aZxfwqDf3v49nieG+YV/L30TnfL9tuFqXkq2sKzt9Ggaj72oPIKvZ9kQGcjB/wl3FAvD85xItahDJ9iKRT9ZPFqPMgJtdNYiXj0bMtaGctgXos/gxLQqhv0SsvuwmOUvH3Qb9CJb0zpL79ycuHeXR6UGA02kxN6puJ36mzBZQ2bxGSpX95pIpsqmpk7JSwp6EfVWg2s9vbdaCFD+Tmm1mBr/06s8agbl2c3bmnWcdCB+291BgyKBLbpRtLpMCZNow6TIfPCOQ4PhxhnwVkfy7/PCKv4OJcSYE4k9h6o4fvPkSz5m/nJbdFnOBYhQdliovD/6GbO8Z92akpVPvhYSODVyOaXK6scYxPNnwnQ5Vo+CiqC1u82+vlnPWW3R2iFvFcrGcBeVWk+2aB+StmTNN2bHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2U4KeZAGrU2pF9IPzX0aL3jUDpk1ivBhpQf5qQZL+IxAEFlU96OTo9PW9RFe?=
 =?us-ascii?Q?iDQ05Z/JWJsdh5Z1ZuPW3U46sw+EQgMQ0tKS33/ZhWvaDdz9BTecPXNC9ssh?=
 =?us-ascii?Q?wBJplEAYBrlI7MdCbQrK3JhUuTgUWn2q5DNDv93gUpuHKS1MKTzF1tzqlMrS?=
 =?us-ascii?Q?rGMXBmXxknZiki/fu6Wwz4RBw4fB67PgI8VXFS81mgRZAGjnCpr6OYIMWcAv?=
 =?us-ascii?Q?KaDTbKUgALOZe/3u/M/yAeQ4kM7+c/lnecs4gLMBVG6B1IuTHW6w+rMmg3sM?=
 =?us-ascii?Q?4ju1H0VYz50N2xp551w9BBpwgM9LZC3egLyyRi81n2zqpfiQYCxKB9BzxXor?=
 =?us-ascii?Q?U9v8REd789T48SElwfoLuaHWsIM2to+XF9K/2bu3Hr7ywzhMNxP5LvwhZWGH?=
 =?us-ascii?Q?c39fG9+40vj+dP2kuJ6NJTH1cmAgAxzs6sUsGQq+2YRndM98dQw6arbNzDhh?=
 =?us-ascii?Q?et+rX2drFx/bg/7SzMMT9M8wqC7Z1KTSWJjYMDCI2YJqleSVacKSKqnyaUT9?=
 =?us-ascii?Q?YoQvvQmO3X3m35Z9nmQGxqCsLhk9FV+da3ZNXUr4OzVgFgnyvRublUQYPClR?=
 =?us-ascii?Q?O6QNU65Oi7xMOOGb7w70PR9fb/cCcPoykyxkwSn6Xv+4CWm6LwjuTEsvbmty?=
 =?us-ascii?Q?TcgsHsVMjXV+JB8cSN4W/MqflcBqYZ8zCs2sKd8F9TDJoRy4hDThZwiMo6Gy?=
 =?us-ascii?Q?d4UXa/psd696KC60ukLKQXUB0HX/yGWtNizdAQc1ujRg7q4vgCgzfEVFgbmF?=
 =?us-ascii?Q?9hTcfXFFLbqd/ELZ4QEW3uiluDeQvAFbEDiZ6kmUyQu0ZVip9D/PV9Ql2ZIL?=
 =?us-ascii?Q?btXFkhKKkn7p1jlP7ZR3NJ7lR9dVkR/zeS8Az58B8e7XTNza7sk1rwJzUJrn?=
 =?us-ascii?Q?+losES91/83HPF4gzTdOCkoW4iMXu8jryqmQlyI2dr8RNYsetmMQKJbxvnc5?=
 =?us-ascii?Q?8MiSIKsWfFY3A4XMc/hkFhOEXJ2igXmjmG/c6vMAZPQRoEpn42m31jtqfk/2?=
 =?us-ascii?Q?nbopc8gvPBXh98jegW0PZw4DquMnnl05Sa7cvUyNL90HkPfy8CmrFWyDlxv1?=
 =?us-ascii?Q?FFs+IiLf0lqOboVoUzWCeA3BZwWpIPKUpOXAp8cONxbk10eYqWHqLlBtsnFn?=
 =?us-ascii?Q?szkVUKHIWizXtN0dqhf/wgfqHWLbV8GAUYbQu9BjcHv0PjEtWKnFXyR8eW/l?=
 =?us-ascii?Q?n3w/EMth6UUKmy0xVk1B3QwAZT+4fI69BCJaGxOpq7W+HxnNBV5+SvekHCbW?=
 =?us-ascii?Q?0LyxOC592VySUehAAl7UIrECv71YcGfRGQ6RdP09Gb9EW3Tp3au+t+Dicz84?=
 =?us-ascii?Q?q57Zfnmi1U+He0cVT5W2z1rkGmN/nkaYSVdFkKEw77ZtvAGPnyAQlZCIYETg?=
 =?us-ascii?Q?FZjrnrnin6L7IRkB7nqO3NaSXXSN9inyckmHcFq1w2zrjcyTPRVJ1xI285By?=
 =?us-ascii?Q?P4uGdJFV0rUIc5smGWrDCQDEyRoXowKKspMpr2DbYhjrCB4U3otyT8aT2QDT?=
 =?us-ascii?Q?40atRKm2ZjIjudCgvio6GOdlNUnyirIgMP/Ba2GMjRA54SGNh9EhkxiPHsQk?=
 =?us-ascii?Q?lBfXcvM+KGL7FtkX1brFhksojwTRwgYhEhIR2TE3pS6RM9LyAKvKuULel/sK?=
 =?us-ascii?Q?e/+N+gs4Nk/4+ZBK5DeJYcVpIc1XP8qUm0KxadGRF2bytbtCY5Jwc7bp+l/3?=
 =?us-ascii?Q?GAS/I4Cp7R+pXIETmHlDXCxuSiOMfccSy7hLSv5aKuhrtlKt5UmIoXJlc+yk?=
 =?us-ascii?Q?OzpA9M/YWLTDNCreVxZUd0/GcBuLV4i57cTqCtId2N6tRiPdPmO8?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28e1762-a9b7-4495-7cf4-08df04ea9fcc
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:26.1269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Pi2XUukbOB2YY5q2AzRi2Pu3Xvw5QYrtvHUjxN5W8p2exQdIsfk2JIIz1ebbDqoLh8CHcdVz6r3N5Xt/CC3CbvrTtfsUkmviX4IeoSHm3b/xmKjQAcwWA3zjJE39Dsg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

Add Peripheral-1 domain PLL clock driver support for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index f6ebaaf5aa18..eb91131857f1 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -33,6 +33,9 @@
 /* Peripheral-0 domain PLL */
 #define JHB100_PLL6_OFFSET		0x00
 
+/* Peripheral-1 domain PLL */
+#define JHB100_PLL7_OFFSET		0x40
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -534,6 +537,28 @@ static const struct jhb100_pll_match_data jhb100_per0_pll = {
 	.num_pll = ARRAY_SIZE(jhb100_per0_pll_info),
 };
 
+static const struct jhb100_pll_preset jhb100_pll7_presets[] = {
+	{
+		.freq = 1950000000,
+		.fbdiv = 156,
+		.frac = 0,
+		.refdiv = 1,
+		.postdiv = 0,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	},
+};
+
+static const struct jhb100_pll_info jhb100_per1_pll_info[] = {
+	JHB100_PLL(JHB100_PER1PLL_PLL7_OUT, "pll7_out", jhb100_pll7_presets,
+		   ARRAY_SIZE(jhb100_pll7_presets), JHB100_PLL7_OFFSET, false),
+};
+
+static const struct jhb100_pll_match_data jhb100_per1_pll = {
+	.pll_info = jhb100_per1_pll_info,
+	.num_pll = ARRAY_SIZE(jhb100_per1_pll_info),
+};
+
 static const struct platform_device_id jhb100_pll_ids[] = {
 	{
 		.name = "jhb100-sys0-pll",
@@ -548,6 +573,10 @@ static const struct of_device_id jhb100_pll_match[] = {
 		.compatible = "starfive,jhb100-per0-syscon",
 		.data = &jhb100_per0_pll,
 	},
+	{
+		.compatible = "starfive,jhb100-per1-syscon",
+		.data = &jhb100_per1_pll,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jhb100_pll_match);
-- 
2.25.1

