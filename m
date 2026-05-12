Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A62384CEA;
	Tue, 12 May 2026 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574948; cv=fail; b=G7fgGEwnr8URoJOOX9fVt8L9lUuGPivsly6hXt/5AIHHZ17SucQfSgg2mkmFXWoocOzv0p/5Wvr5APwfGDK73CulpDnrMD4+X0vNi98hFFSHUI3I3WYNQ1faRJTT9J+kgyKEMv3xpD2Y5t2bFuwnSuWit8VuWYpk7pKnD2Qrnvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574948; c=relaxed/simple;
	bh=lq9K4qhiRCM/jxOcuHqkdbaRCy8KT6HHh4kXG289Hhw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dv1kBtJamn3GJK35IX7mFFNNa+EiZ/AdCz89cVFLyftXGpuNGqe2tpF49pfB+PCW90z1QE+uJKYpUa2T3PV86FaFexTjr+9E2yJFrg7yoKhVYb4TJH7kBgpQVdrgX5B6nF1H5ohX8+riuZCbE1Ylez0ezQgR5xsJXgnlmPCauso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiCQlu8ZPNKTxiz+tbzu6/EzPXIpTxyt0HJXU6aL+Sh3Q+mPfy8E08/54wCRRxr+O57CpoNN8bs9bbX2CKX5YkTMSgDFSL9O4EhL8YYJDV8lolCUG8t+2gJOXRGRZf5VlhAJxNroYT3xWPl779c8y5nWyz6WYW7eJU/peBs9sQ9uB+220/DHeW+Ss+lgdBY8DBJVryQ7u3BqufKfrcKy9rqrwMbVpnff8fhJ43heQW9XK3P0FOPkSQfHqnLO4CNZSjuGozTmWD1cp+JfAz9yT7RaZjkAhm1kbtO5oN+ZqpHfgv5ljL6j2IXTH7Ikp6RaqnO07kUB3HK5TWgLYYhY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EXLXYzT4c3yTdRKihRTRVrgH3xK5ZOK15tdX+dsz7c=;
 b=DSaSX2W+XcX7HXz3849MLfExvJ+/5oJt55Ib6RwTIX0vIiYL810/GpSWQCa4DCB289qkA7sqdbnTnZbRWRaJKWHwivZgSUuIInabU6jUICTNXVTf0iDlOiwq5e+FR6Lna/licvZwk0C9nlR+0nZFFHX91fckOpdWKn9enzB+Kz2dh5LWa4LW+EwX3MHmZRydJ5Wkn4n2F19GvfNh/7E3t07ZktVPguclyY+ZUOWtAmGh+19aIn5/r7gz7TgFvrN7pKoKFT+2z6eCcZjPEoT+4vSVaDSEOlUva1boshjh8UYNj3q0mtPwOL/ZI9MjW8N4evifnG/b6P2HBcPH5ZZOdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:35 +0000
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
Subject: [PATCH v2 02/12] dt-bindings: clock: Add system-0 domain PLL clock
Date: Tue, 12 May 2026 01:35:11 -0700
Message-Id: <20260512083521.3448-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: 09057c4e-7f5d-47d8-9671-08deb0016fd0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GbvE99OUJZPGPArGddVak3uKrwCfY8fhBIx2zx2N2clje/OAS7i/AARuu2QLsBhxQpeuMc11LMcyF4ycr4oB2eQJL1eM8NtfUMj3zrErUtEIAQRAnjOmQ1/ca5a65HsWUtHULWPl1fXCE/Pfh8gYog1NLbdJppYVsTAaFyxsX55KCzSfDCYU3aG7Y1Kcy6Mg+ZtomFhXYG3P6NYuKF/o+7/B3PeZGxA6tjyTRXW3CgHUfFFsQRgShvmP1Wdx0Tuyrf08DuLEjpVRo7MxG47JPhU7zj/E0Zt9Urp/NB7BOGwJ5xB8EtMhpJFw0NV0HJzyf/stWXSPAqa4+VWkOA9jfdcQ+kpzJDypnxz2+mY53i7B1j4NNT76tgN6QIvfIhWBoxCokJQBa4hUr1+1/5FDdx0+o/jXF0KrKxYhSCHcMWoGucLjubJZ4E/JcSRb8VdTiHYCmQTrzuCOeyCi0KsJE9i9HxpZAEkVvMa7kT8XZZpBsLzKRPwxcOG0Vb1r9ar3fAGNyuTZe6x7ckCegQWPQyCfLw6bVosW0jBAleqYdZ/TeYokFbQdOj8NultdR4IYvM8i6s+xk66kWTNSrM2XNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mvqS83iYoH1BX/wLmK10cE/kT41H2/mM2cLhspn8Jl24h5q6xG1mfflJrdIS?=
 =?us-ascii?Q?h5KPkMTd7+t8qAxDAulLWQZNxDBJ7OvazPng4rR7m/f8mLIaET3l54UqVVJY?=
 =?us-ascii?Q?RDnMMSmNMD+tg50wK0C1EFGAI4gJ/PwYi8EDzEFppSLO1wZ/gDGDEQoUgBj5?=
 =?us-ascii?Q?TXWBEjXSOADiXqFsjc3tuytMOYtMf+6YK/GoklEcsT88L0UE5ul4t3r3pPT1?=
 =?us-ascii?Q?5vuKtuJlHshjmYYgWyB6O2kTqCO2PyOre1qxx1cWhyYVSEX+tpJ75TKlcLF3?=
 =?us-ascii?Q?iN+TyImMrtROaGe7wqNu4WSTz+uMI2QX8TfclQlrxdhF9w3V81imJ8B0wCbb?=
 =?us-ascii?Q?wjNnxEhwB4wRb1cxbBI3AK4yyPCuPtyahMUd6U3JOfuBPnvA6wisHWMfIpvO?=
 =?us-ascii?Q?GPTncKETXvnelH1BSRirlRnAYPNE8lF4+rghPCe+M9qt9OL3yDJGuUyRsRGb?=
 =?us-ascii?Q?lorVkDv1qRbwR3k6GJJsEr5Gt38XnwzR8URfpcmzhEYjLofStsktpRMrnwjG?=
 =?us-ascii?Q?yO4kI4YboK0r9nwtA/1uz9+yq99j+VDhWxITySAt+uqYgPD0JOdADLtwToZh?=
 =?us-ascii?Q?LQFbNg/eVDVjqD0lHVHbP0cX2NNMCZDKrJhuAnKoXJgkjpj7nMkXJSkkTOrp?=
 =?us-ascii?Q?xPowd1Px1XQbgOWLJZVNO1pgGzoRATvLyy+dKYI+7rell3iIMbuP5T6ZE2PN?=
 =?us-ascii?Q?rzWKtqLi81zgEN5/eBUjHXcQA7DjASW80hx63g+sJv7k4PThrn8HnWRyixg8?=
 =?us-ascii?Q?fYm2oZ37l+LBG87Aw/5ie1mt0gA6KxbBNtEeKdJeYDcxWj6VDZeZOf+2EkQe?=
 =?us-ascii?Q?+qh1GE5Yun4X/vlzL60vcqsG2u7SzmJs9eAR9rg4aVbGBdWNIzeCoMGAbcYY?=
 =?us-ascii?Q?FbO+yLeHdgIL8VymLxzkoUWsFlrkunJ3GE6DMtKcultyrzDcl53Tg1CocHOY?=
 =?us-ascii?Q?4DX0cvK3WvbG5Zu+OdPR6jYU+I6XjYVWJ7+4HiVwq4Ckxy5kIkhVgE9EMKrM?=
 =?us-ascii?Q?gP9CQTe3FkHpDCVrn/O50zjNo0Z3k3bz+Bi7/7ljyIqp1iv/JXjJav+oTOlm?=
 =?us-ascii?Q?Ub3tc6g/e1Nz8aU8qBvLwJyJAEKo/tlzvrvuQBjjicZnQYzRR7yCRQG7M/jP?=
 =?us-ascii?Q?ZzOQPNeebQBFY11wF5GNhwgenrf3gqvzjb+xpwn3Ji6B3LrQVuIrBIZqnkf4?=
 =?us-ascii?Q?Xccn2mdTHWSQ85xyOm82N1ysWhZW1MJpGur2H7IBanggeIcQoQbN+23KJjSo?=
 =?us-ascii?Q?kt/dCJzgQGwrpxqszuUQBkt4sFLGsvG4CpMfxj1as3mLjG647Apj7hpDeAcf?=
 =?us-ascii?Q?WT61je2tjUQyzzpxd3NaPqjDlGFYf/P9CcFX3scoKgqFt/PX9oMRhBcev0qD?=
 =?us-ascii?Q?ef7vmi7EpwOhHEI93o+JkwuPzi8gYUtWJgfjEQAV9DjCEodBgAIWG1Z2277T?=
 =?us-ascii?Q?GJUo9OHPAQzxw9UwGp3Rj90TvTUIF5VRZvXv+vCaJrpZRAe407P8tZVJU+On?=
 =?us-ascii?Q?SCtnDpxbaAeAOZCQMOIb8nTV7cwPjFENMTn9CjEpre2oEBCNG3u/+lqcik+A?=
 =?us-ascii?Q?oqiyyy1PRW4UkartK86Aczuu35IOUmYtUcYGoFJp439W7QuPqCuVOvDB/Ca8?=
 =?us-ascii?Q?31Eys7qMygP5RbUinklN81J3G3zPiq59dvxsmkh+mzUKKRqg6e4S0kS9+vU3?=
 =?us-ascii?Q?M78pGeJlD1VEk1ZUKHkf640EJjDE2CpzVcPY5Tlc+K0ojtTPKBNG0lhOfQx3?=
 =?us-ascii?Q?nbmK9b61Jq0lk+lKoGRmgzLtcvasGU+gvGvgMtZZIEQSS6MSym1v?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09057c4e-7f5d-47d8-9671-08deb0016fd0
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:35.1673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvSUADEp+KBVtL/DFbF5SQyKOuQX4ukI++FOaDVSu2E8LLeUmkXWQQ3b8w+9IweocenQA1MLbkglkRu2kbFc4Ca0mdpNC2mkubH3luB+pP8AimjYQhSXIoQQ2zH3PGZX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204

Add system-0 domain PLL clock for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 include/dt-bindings/clock/starfive,jhb100-crg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/starfive,jhb100-crg.h b/include/dt-bindings/clock/starfive,jhb100-crg.h
index bdf7d628b381..98b3cf28b677 100644
--- a/include/dt-bindings/clock/starfive,jhb100-crg.h
+++ b/include/dt-bindings/clock/starfive,jhb100-crg.h
@@ -8,6 +8,12 @@
 #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JHB100_H__
 #define __DT_BINDINGS_CLOCK_STARFIVE_JHB100_H__
 
+/* SYS0PLL clocks */
+#define JHB100_SYS0PLL_PLL2_OUT				0
+#define JHB100_SYS0PLL_PLL3_OUT				1
+#define JHB100_SYS0PLL_PLL4_OUT				2
+#define JHB100_SYS0PLL_PLL5_OUT				3
+
 /* SYS0CRG clocks */
 #define JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN		17
 #define JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG		18
-- 
2.25.1

