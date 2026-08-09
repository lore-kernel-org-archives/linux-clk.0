Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2095.outbound.protection.partner.outlook.cn [139.219.146.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98972377007;
	Sun,  9 Aug 2026 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786241224; cv=fail; b=KarBNWftrz6zlcDA/YNUQ12jXHI7tP4u5KyyXvX3AgI5a4zS+zvwWxZq13H0aSKcDVTx4zftvRsGrQ0i2jIqEmoK0H3OT+ULGxKC4NdwHq7GupudJgMIWVeXcTZfSETsRGivUWIZA+Px2hpBoy5ytGBOn/fhRQUq+u7xUgqiueg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786241224; c=relaxed/simple;
	bh=Ar5pjy+IehBXpOUACOgkONXYtb702A+g2k3lbqfozEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCaGC0kwxnYnuttdI8NRyUH+mpuWhThFM6pETB/3jO1K7EXSoKKK7zXnQ5JLDlAwKGCFzumS9hISW/qmxEO2P599UO61V2B3vdFwBVJXLDHEMQ6JFbggnB0G9rQNNC8C38hn5qLINo9t3RokGBW16mvVTl8h5qSPWw9oKwgvFRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk/g14Fn2jmbDxIyvTBoU2ExQDqy1C+WZaKDl3yIcYoYjnPs9VDp6onGTlbDMHXHBxMmjNrdUnaY1VX8Q5uUpfyRQpFq+eTZriJvk6vlw2XgJX6tYC1ikb7REIt0PLxOkvYd5/tE5zvjWS5bh/Ga/HsYUzs/YwZ3BP7nDWNTPV+KmlSU3O9qU0WrfkhQspqxYqYHxKCtHbZY/s1IChnGeK8Ice3nX2JMiL9lIAZMb0r88WNwMEBsktX3UsjR0vV9yel2BhzVLMetkYVHbmCY4ht679QXL5YBPNk5A57lWvm6SNrfG5gH585dkChuq/MIow2CdDUsxNAB1GzVMyv5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYSa+OXKnIpLfczbjifrkCzpTD1LimVSmEVxhfUC0vM=;
 b=m3H1fCgijmmA3F0NWqBgE7ffwAmZdj61dbysveaVJ1nL53q/ht51+Ou3PZ4E4kBvwR6nvE8Tm7XXZ9lGepQm4Fz6u6dNPJH8irrRFgmnPKPYV4qXU06Yu1nNRUYc7ugC3F5/rfUBL6me7+6+O0FjWTwwrl4P9g+jRpvnYSUAb0MehpWTJCh4y9E/tbwTOAGBHdecXXajJng6iHCU4MjdTV+1oua6euSDl0i2XN+4FzBb0yYcRzAtgV1+rGt/q9rSEeujHogtG44PTFHYTU+c8svGNVPYHzsHj1TiEyjhtjpkKJqu8S+x4AXpbMJ4Kzy0F3Y5X9kdJiO0P5xy1QQHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:08 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:08 +0000
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
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 3/8] clk: starfive: Add peripheral-0 domain PLL clock driver
Date: Sat,  8 Aug 2026 18:50:49 -0700
Message-Id: <20260809015054.210577-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0016.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1265:EE_
X-MS-Office365-Filtering-Correlation-Id: 0087140b-8980-4075-8dbd-08def5b8ae85
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|23010399003|366016|921020|38350700014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TSJfOCaVTsWnDiULbXzSJNe4LKqJApOq5LIH4yNgJTVUtOeZpihw00f8oxeF3AUaQ1nTKkqkoV6QH4SaqqAZs098XeY+1tYQHx/XM5C3MW3h+MI3u9yFdY5BUFrCBqWl8q2Qe827+3SPgcNTzt7FHqQY9VQn3FgOXk5irBSItRq+TQHNpOeGHQTAkBqL/8QZmcbqDPoViENakecOg6h6modCOrHpTO+s/x9kw2GTlY0g5eGcp/im2N21sCutCCIfzf50JIW55tt6U7SpTHChPC616JqZRPt7KCiNESvJ/YsSK4sWIdvYhw7fJxt6f7ZpQUqvcYH02U/yr1DT4YqcTwITe1HdCs1ktHstDoxv07n8ooj7B8Y7H8aZ9bRGvLlqeM9fr8zqirxs1GzZsHRicrExfAIxszAtCuUfiG0z+jdpHGvggrJ2OdDx14fwXBioo9MCUxqj3schGuHmEozTi0VSo/mHO9O2E9A4GEdzqtZi5WZq+q0zwJ7nXxSH1n28Wd2Q3JDgLv+HktGQsSwOHxEtrxRd3vQutaCVaEukgZb2zkCN5w2VD0he5wtqRzyBwdUitz/j5FbRQ0YIh7lUxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(23010399003)(366016)(921020)(38350700014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c4EjV6as//x8FyF0i/xGKSrcoNC2gOiyuWNHctmKpD/XDkGfqxe7RZPEkAIJ?=
 =?us-ascii?Q?9cSwPSWzXpJlCTjgTVHao/BuVsuPYcy1enyX1Aj0qvDa8rrMWYWjpFjO6k6z?=
 =?us-ascii?Q?7QmeuuU8vKes/kbSyaxcOaDl2QgOP3iIyJ4VzS03d0m3gKR9a2PSWNTjpJ0G?=
 =?us-ascii?Q?9lTcuiWi1/5NbsdWIu/VmOvld7VZ/mR8SGK5LQ83XH5Afd8pWs6Uv6kMS/As?=
 =?us-ascii?Q?stbCokpOUaLBWA2odZF7nWPVhEqiHQqh9rmZWBQRqIuCDg3fRYxiR1ckEI/n?=
 =?us-ascii?Q?pH6fxTGRIs+EfuP7vEWiqFKCEk3Qby+hci8lKcujpeUGAxxZs/lj9Iljt6KE?=
 =?us-ascii?Q?chqjydSbfEeS4Jopko8xNPpia3ebqSCq7gk6rpZD6jGR7Wgz+cA3I5K9HJOY?=
 =?us-ascii?Q?KjqS46Qkv8THcZIe1mwQWbWj+vDtW4q9QWvbvUmaBOeOVv8aSqBbRAYFX+9c?=
 =?us-ascii?Q?fpr6kAwfnDqe+zmXtZJ6SAATR+0nVqZrjosIvO67zDlty2gXMy4nBw7EgbaJ?=
 =?us-ascii?Q?/bXJK5I0xjG67ewJDOIoQWfmOGdyZUh/ddTlh+E5PokX4brQj7fY125luATY?=
 =?us-ascii?Q?WqATyf3dhEUUNL/PG2SH9rNp54qLfcy+Kne1T9TEc7K5D7CKEElVcUFlub20?=
 =?us-ascii?Q?rKHmeIHudWEGkERS9ex+XNy2Gn3YHqXdJCc9yC0lbbeqApZ+bcDJNdDf6F8O?=
 =?us-ascii?Q?H4kLGnyPP/C2wMK+fwlfiox893sTvClM8I2EXnb4nBaH4RcJ8F1uDn109Pw5?=
 =?us-ascii?Q?f5RmYBK4kYeu+1hqdQj/WRijReWmMxEiAPR4YKT2pO4S4OhCYSH4RZIgP6q7?=
 =?us-ascii?Q?CLjfYxU+Himkldy/k3quCrmA3bNZijmLV27CtNC0e29KvQLLeiZ0jGhz/v/g?=
 =?us-ascii?Q?w7ckh5mSkfCg6dzBoGjwdyc2CPWG3uOju4IsTeKSJ+bniEY1VtOWVQdQ0jxq?=
 =?us-ascii?Q?oEFkgh/RyoCUJxkvjBSkh1MqCD4VkkmIkUl2QCPGL9gTpJGXEUcvoussYqVd?=
 =?us-ascii?Q?VH85DgIyS1PuNB2rytazj+r0RQACRWI5DXGuJ2nosn1wnqdIvwiMkaL36Zyk?=
 =?us-ascii?Q?BqJmKufyU54q98ENKmYnPr+Yv5Ch+X86lkdo7GILm3K43dEbALeUNVRBH9C8?=
 =?us-ascii?Q?7X1Q7nH6gv8A89mBDKgo8W7R9t4GOJEhhnL/fRYYzV96pLnGtGzEk7QHxbBD?=
 =?us-ascii?Q?PZCnUzWogXnUD2f6bvpg4oHgdEWoxPXk1y9YPLYArUDMsRKv4M6awL0nCeL8?=
 =?us-ascii?Q?0iPMkOhpGHRukQkJHyknUT4zgtHEkhrAxrppm/aSdLk5MRL0fV2R7bCn4f45?=
 =?us-ascii?Q?FVGqJF3O0bW08fIlsoaL/9smX+eU5xVX+XmUsFrApOgdZfCLvaclyiYRkOZk?=
 =?us-ascii?Q?DDm3ninILAGfQbsQHKPFyNQ/uWXnh8AuXOP2OArIa5savknjDfsn9Zdq9jww?=
 =?us-ascii?Q?aEmTWPhuO5uhymn5vtita5dUF8w5Y+wL5o5CcNF/R9DXeeBEekqR71S3A4d4?=
 =?us-ascii?Q?3muiPUeEgt058v/SY98aNIIYSQJVloqvE7lFl92JkL8Fq4vKDiR221HCgAM5?=
 =?us-ascii?Q?k5LlE8mE1LzKybstS9SrWADsdKKLffp08ybcjHwxtkUkWCATwhQ71goPawpG?=
 =?us-ascii?Q?n3iNkNNdGdKW1iKYPf037loWZfUzLwZB2g0L9pzFMla3W3h6TRMyWJ7lDiDP?=
 =?us-ascii?Q?2tR3Kq/1fyE3lhWuUu0NKz+iyaOFakZtmNis7W5mniVGJfu7NtKhMHT7/nGc?=
 =?us-ascii?Q?xVOUyVbTGhewGYLrOcY7QgdX9YS8qQ7smc4kQWchs+0rWlT2yIOB?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0087140b-8980-4075-8dbd-08def5b8ae85
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:08.5328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFsBGl9rMjySv8Ic4vEBSpyzKFH+Yor1q3T3fu20MNMfUfWQZdWMZ72k9qxHhimJ5jyx7c5by+OsM9+ltysPOf4BJziB1gNdVmwnRd+P0ZvJ4A+60ih+3Niy/ljkw2yF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

Add peripheral-0 domain PLL clock driver support for StarFive JHB100
SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
index 55d589bc831e..3547dcd340dd 100644
--- a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -29,6 +29,9 @@
 #define JHB100_PLL4_OFFSET		0x18
 #define JHB100_PLL5_OFFSET		0x24
 
+/* Peripheral-0 domain PLL */
+#define JHB100_PLL6_OFFSET		0x00
+
 #define JHB100_PLL_CFG0_OFFSET		0x0
 #define JHB100_PLL_CFG1_OFFSET		0x4
 #define JHB100_PLL_CFG2_OFFSET		0x8
@@ -515,11 +518,37 @@ static const struct jhb100_pll_match_data jhb100_sys0_pll = {
 	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
 };
 
+static const struct jhb100_pll_preset jhb100_pll6_presets[] = {
+	{
+		.freq = 2400000000,
+		.fbdiv = 192,
+		.frac = 0,
+		.refdiv = 1,
+		.postdiv = 0,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	},
+};
+
+static const struct jhb100_pll_info jhb100_per0_pll_info[] = {
+	JHB100_PLL(JHB100_PER0PLL_PLL6_OUT, "pll6_out", jhb100_pll6_presets,
+		   ARRAY_SIZE(jhb100_pll6_presets), JHB100_PLL6_OFFSET, false),
+};
+
+static const struct jhb100_pll_match_data jhb100_per0_pll = {
+	.pll_info = jhb100_per0_pll_info,
+	.num_pll = ARRAY_SIZE(jhb100_per0_pll_info),
+};
+
 static const struct of_device_id jhb100_pll_match[] = {
 	{
 		.compatible = "starfive,jhb100-sys0-syscon",
 		.data = &jhb100_sys0_pll,
 	},
+	{
+		.compatible = "starfive,jhb100-per0-syscon",
+		.data = &jhb100_per0_pll,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jhb100_pll_match);
-- 
2.25.1

