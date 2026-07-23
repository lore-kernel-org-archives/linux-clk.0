Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010019.outbound.protection.outlook.com [52.103.13.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA403ACA48;
	Sun, 26 Jul 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082426; cv=fail; b=jXNTGz2Rz3P05VflD81a+L+FKz8mn4ntFFbYFkSZLf7mwi1dVWxPT+6yOb/YHfxboBWRRqp+4So+RzivZp4jw7Z37EXnw854oT0QzhmWeYncbXxEIP+Dk+uOPeBO+kI81Dbwd7OowQV343JA36eDwZzCINZ8A95C21VVzoYPrW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082426; c=relaxed/simple;
	bh=dgAf8eM27rjCj6M/zjgqzx843RW4iTGGeUSzVi/wsVY=;
	h=Message-ID:In-Reply-To:References:From:To:Cc:Date:Subject:
	 Content-Type:MIME-Version; b=IuRs0SFChhvXt2km9qsa/rInqUNKUNHY8akEk1Xq23IiF2kOP/ugWWlDDzPgGgoJ8eaLKT0IspE5jvBdG7tkkpLWk1o6yD0YfqnpPg2riA0IfzlJo2XazFnVh4UO1kLpU80RgksdORFS337BUj0ahZsBZWbG/FY54veuLTt13sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cs3piDID; arc=fail smtp.client-ip=52.103.13.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cs3piDID"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mol6RVgCFrdU+olGi4H5GREooIoBGxAjTjgKw/Oq/yzhT1BvaHVRli+mz0wEJBaXjVW2kTMrg8uDLKFG/cK9OpO/N0rBfKvCYzp9y4mjjAf1peJmi6Wgg0b4fhSWWvP7tFZdvJKOaawyUDzk3ZOd9vpIRlv7mn014uS8AFERb+PoQv4Isa51kRVk4394V0Q3ZhAd3V5D7Kk1CX79jlkQQLi4QTpk+AGhCpjJa9Gh3L1cHcK2Qo1dau6ICSuaQI9iT+mylFZFy1YZGQIz+N+FBrUvXnow4AUmorJ5UHIROpFQeUSsZzXHPrqhmwdn6fkBHbjkkowb0Ah1HoW3bs3CVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kpsH1cjjEvu9jrR6sTEQ63vP2nPPGUnsP0jqkIfrNs=;
 b=WZtjGunAVZ7HJHvP6npR3Jkcv6wCMK9sT6FJ5X4NIYIwxzd8CGqPxEWzf79O98og95+J5Nngtl0sFQJYWOzapkaoK1V7l1/Iu0Ghr6JnIeCTm+XYAM5Nu/CJSRgaLwzPP3bGPfqN0Iu1KkEpkeDQ29glou0q1UuiuhMrxbKj0SEoxofm5LSpIc+4Lc+d4+29aHq5vwdrUhlOYRB0BxNb/9piIxuHMsyFuhW8mEHXRFy6MzslmNv7MyZRTNnJ0A7JUNhASdf0wcdDAXwM2A4G4cs4kRYbGOBuR5xV1RiiSJhFkWg0Pu+qmAOVpPLOjRc1NuKhRYGQqPTm9y9mKcItAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kpsH1cjjEvu9jrR6sTEQ63vP2nPPGUnsP0jqkIfrNs=;
 b=cs3piDIDOKqpm6h3M9Y/6zuTNhdZl2kwcz73D6yv7OnuczpTxZeIrMtKLAA5DwqwpHAnfW5T80s9bl9XC1py5ogH0BGY4PDIOtLmIPoRlszoxiycOyty1rjZeceKG81luPO03GHEZgayF3Onu6EYc1wsVu6aBgDX5u9dtlfBk+/AjlErNlrsVYVZbUmi4ZYKCM8pHBh4DTZIOzu42X5Lwp/jd4s4GLBtitYoAiL9qHOObb8EUDME7HgwKcD8Btb20raES37WJpe5zdCok9a1OZQuH8qkZmXShHHZ+KMfCsVG2EmrqEM622GaHPawWocJXQdTiFRNsd+4ZlNuABZx3A==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sun, 26 Jul
 2026 16:13:42 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:13:42 +0000
Message-ID:
 <MN0PR19MB6091885F8E6F522600B25AB9ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 23:48:58 +0800
Subject: [PATCH RESEND 3/9] clk: stm32: add STM32H7RS RCC driver
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <178508244476.28466.13289557794931740525.artpi2-resend-3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: f566f4cc-ffe5-4e08-9317-08deeb30dc5b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|2604032031799003|704163111799003|41001999006|8060799015|19110799012|37011999003|23021999003|15080799012|51005399006|24021099003|16051099003|25010399006|5072599009|40105399003|12091999003|440099028|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0gGDeToDeOzKMPjd+bjEAJupBi/XrEDQmrE7+69PTAZYbEWxPGLwa7rjLclZ?=
 =?us-ascii?Q?nVQ/N+gmTQ7L5dKEAQsrErRhQtZFZR38aQjlXdJbqIqLAJCSlNo/wHpIyf+W?=
 =?us-ascii?Q?K++xUYgv3KIXP6ykdEhiQL/M1OTqE4fZDEOLzedVDfDFMpoDdgprfoaLqtng?=
 =?us-ascii?Q?MH5uxVmDFnfbvSQ25+7XkRhNjaXmPvww2kkHOj2F1VIgFsMbva6JWho6SVkz?=
 =?us-ascii?Q?sZD+kcjpxsY/NfmCr1RJQsJTEXusVi9PMoZKwTYhtOWCnQmsL+NnuIb/wBhO?=
 =?us-ascii?Q?mNUZY4G41obsAJKQpSxGM2chPf685VsTw9mXVTRDMts4CqUNrIT91zzk6sv5?=
 =?us-ascii?Q?o3oEQ0NDqkm+2ckuobO83Cjl/6X9PViT4a+22Ogjf62hVM7ikVxOodJe+skB?=
 =?us-ascii?Q?RKXhmR3RIzB7RG27iBS2a5oS8vCbbT/rbt8MNnV/Tfi3PGJGLpzA3rVNiAt4?=
 =?us-ascii?Q?ATfNj/3JVoEG9tHTZ5NX5n6pM3FxDIxPJcRABuv6U4Ji8uBQbMbV/Nevtcix?=
 =?us-ascii?Q?nAB+Fbn7d18JfzPc+oUTsfYHoLQChDYKYZM240fL4E+97ouN+987mSD4QrIY?=
 =?us-ascii?Q?akI7mxuVCynbcGOAo0g+ul2eLbns3vYtZMFTpJ1U9pnSwe1W627axcDthSez?=
 =?us-ascii?Q?LI84uWc5WPiy9adbRiyen4658b64YlmzAF7ZRh+Bw3mKN+mj+IOs/xMOqZB7?=
 =?us-ascii?Q?8H3Y8bhsakUEWBditmybbt4dm2j5+L6aUMhwlTak1XMdpN13mKQUbXCwLdUr?=
 =?us-ascii?Q?i4+/AClKHijFNosRfq5yv/24iL5vi2A6KqIBFeQCwxz2reDNhFGwU8w6+KAT?=
 =?us-ascii?Q?vA6N2qqh9fJv/FisREwqy61kbxQjNbD8xwGj31O95rl6jdo8OqsA6wWSPeYu?=
 =?us-ascii?Q?s+Mfwc3s8Ecj8OwAcWFLLetOd/6Di3IJYKH0DFcYA6KYi530FbcJRh4wandS?=
 =?us-ascii?Q?dDJ0DwBmRgW3eH7daGDVLUGvzqH842srgUg1vSMZMi0mN6R+7TKjn5+eIQA9?=
 =?us-ascii?Q?nvMvJHI/rvBkYcn3UNMyievy7vM9DdqHTniFqHVD2JShMXw3nRpnyk6jsDjP?=
 =?us-ascii?Q?61akKzf2hjX93WZ4phrvfr8vKP4eR5D+van/8aLb6XJZnSB9SG9GU1d4drBx?=
 =?us-ascii?Q?Qn09abd7IKwFwPBq0EO306iEUSjPnso5xA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MT+Xr4HSN0x4/YVMPrK5Kd0i2IGixOH/MiInjYc8q1znkL8L/IHhRbdl19bC?=
 =?us-ascii?Q?e2xfadZiNUoQeRdpC//8X5om5GsgAA/YgwPrB4I8fcrlp7SzYAepiaH8y7fy?=
 =?us-ascii?Q?OV0zBONpc1Pc0suvkChTNxhtP1oGdkT2qv+4c9d+hzkUfx+pczlWlonKVY3l?=
 =?us-ascii?Q?PuaYC1ysEl67pZnCr+eP1/ZFFfgx18bk+LzZWJPia2qIKVWHCGCNqJiIizhc?=
 =?us-ascii?Q?rG1vexD7r9G8Iyx921PBagXxz9ZibygXmoRL/gBhshyROE4DsNMETc6Pl+h7?=
 =?us-ascii?Q?v6UIeWD8aqk/WR14s4FI2YkYTVzN02eHpgTIJB1TLvGsxAeUs9DBRjv0rE6L?=
 =?us-ascii?Q?T2axz32Z1K0ScS8oV8n+21ylTHpWSM34DlHp+NHgCvAO2xSKvB+4QYlpoAci?=
 =?us-ascii?Q?x0SftJcn1iUD9aKvTy8eFc3T7HyJA0dNKPkAQHGbDLx095unRwM90Lv3f0hJ?=
 =?us-ascii?Q?aACWvXbyOeYsVKMnz86JQbGJsfyd+rJtGsRICRKzjZakoncLPPz9yBlMjjFf?=
 =?us-ascii?Q?lWhnS9L8hWESD7htdMsHLTLsigUCA8IOrn7cbWpCNmrFIAo8O5N9SJxfjNXC?=
 =?us-ascii?Q?ETsSYuFrP3JJP9tNILCjMqVgd839BoVBVllxQYNAtVxwJqwaQAlaxH2Z5xN5?=
 =?us-ascii?Q?OTnSKLQoLlJcLRkLqpDilqkh+KzNpAaY7Rlr44R/R1X+IUj2E9AtGfO2V5Nn?=
 =?us-ascii?Q?awbFabFjxVHhDXatsjjOs1Eoeu0vAkm05apmveUWPa45iJE7Kw96C+qVgREA?=
 =?us-ascii?Q?IV2AdhrWe7tlMg2q3GTF71xZ9xrGKAHXWT1H0bEyMiQ5adMMTNL5whLuuNaW?=
 =?us-ascii?Q?n56nNqkbyKAW0Ek6IfRoBUCfTJ+V81tqXBfK/yivS1IWG9Kea4BjQF7m0Hmw?=
 =?us-ascii?Q?5T/bVqf6ZQCVdxhz6SSbuCdKVCWmnXME3smAjxHSrP6isTf3JbJHEeE374qY?=
 =?us-ascii?Q?BFdUMo5OLAJ1fJlOTm9kwPgWUIzgdbvHxSNaKyL0zfPvihFcSFXpxH1jAxYA?=
 =?us-ascii?Q?ewG7h8FqMgV/UtVPs0ttVhkfPp8gDD+LU0h9apLcpmizkUo8adwLl3h+TP5h?=
 =?us-ascii?Q?RQjR+7K7Coe9vqjlRhlsWXDym9PxXVIYSFS3DenSUoNAZkaHzB+BAQRk+4vt?=
 =?us-ascii?Q?91U/0195UB+lzr5nnscXNckqk7KSNzAoK675Tq6YWhpsNCXyGv996FKM6E3c?=
 =?us-ascii?Q?gKCE6gbj14vUBBTtT3CW29jaBpes3DbY0fEPYQym7jDSH/dvD7FDBEeiwnsX?=
 =?us-ascii?Q?St2tmjC6is5Qt0q8bICDaiyIF97Beu4ORBgCYxSD6Q1mWKhYmQc9YHWhZh/K?=
 =?us-ascii?Q?KYZ0PgYa+PMa/aeAnkoilwObQ1Ij8O3DQLU9SbGWv0kAu888Dq1t9NcDRnEg?=
 =?us-ascii?Q?3ExJrruHp1h+ZZ4gGUjyVSuuhhvgesYOmSFjSe5/sybUA8ajaw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f566f4cc-ffe5-4e08-9317-08deeb30dc5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:13:42.3992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807

Register the active STM32H7RS system, bus and selected peripheral
clocks without reprogramming the PLLs used for execute-in-place.
Decode the PLL2 S and T outputs used by SDMMC from PLL2DIVR2.
Expose gates for TIM5, UART4, GPIO banks A-H and M-P, and SDMMC1.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 drivers/clk/Kconfig         |   5 +
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-stm32h7rs.c | 466 ++++++++++++++++++++++++++++++++++++
 3 files changed, 472 insertions(+)
 create mode 100644 drivers/clk/clk-stm32h7rs.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a..5d1562a8a 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -448,6 +448,11 @@ config COMMON_CLK_STM32H7
 	help
 	  Support for stm32h7 SoC family clocks
 
+config COMMON_CLK_STM32H7RS
+	def_bool COMMON_CLK && MACH_STM32H7R7
+	help
+	  Support for STM32H7RS SoC family clocks
+
 config COMMON_CLK_MMP2
 	def_bool COMMON_CLK && (MACH_MMP2_DT || MACH_MMP3_DT)
 	help
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a..3dcb2f525 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
+obj-$(CONFIG_COMMON_CLK_STM32H7RS)	+= clk-stm32h7rs.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
diff --git a/drivers/clk/clk-stm32h7rs.c b/drivers/clk/clk-stm32h7rs.c
new file mode 100644
index 000000000..b82a24822
--- /dev/null
+++ b/drivers/clk/clk-stm32h7rs.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Clock driver for the STM32H7RS Reset and Clock Controller.
+ *
+ * The first-stage firmware configures the oscillators and PLLs before Linux
+ * starts executing from external NOR.  The driver reconstructs that running
+ * clock tree from RCC registers and gives Linux ownership of peripheral clock
+ * gates without disturbing the XIP-critical PLL configuration.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_clk.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/stm32h7rs-clks.h>
+
+#define RCC_CR			0x000
+#define RCC_CFGR		0x010
+#define RCC_CDCFGR		0x018
+#define RCC_BMCFGR		0x01c
+#define RCC_APBCFGR		0x020
+#define RCC_PLLCKSELR		0x028
+#define RCC_PLLCFGR		0x02c
+#define RCC_PLL1DIVR1		0x030
+#define RCC_PLL1FRACR		0x034
+#define RCC_PLL2DIVR1		0x038
+#define RCC_PLL2FRACR		0x03c
+#define RCC_PLL3DIVR1		0x040
+#define RCC_PLL3FRACR		0x044
+#define RCC_CCIPR1		0x04c
+#define RCC_CCIPR2		0x050
+#define RCC_PLL2DIVR2		0x0c4
+#define RCC_AHB5ENR		0x134
+#define RCC_AHB4ENR		0x140
+#define RCC_APB1ENR1		0x148
+
+#define RCC_CR_HSIDIV_SHIFT	3
+#define RCC_CFGR_SWS_SHIFT	3
+#define RCC_CFGR_TIMPRE		BIT(15)
+#define RCC_PLLCFGR_FRACEN(_pll)	BIT(((_pll) - 1) * 11)
+#define RCC_PLL_ON(_pll)	BIT(24 + (((_pll) - 1) * 2))
+
+#define RCC_CDCFGR_CPRE_SHIFT	0
+#define RCC_BMCFGR_BMPRE_SHIFT	0
+#define RCC_APBCFGR_PPRE1_SHIFT	0
+#define RCC_APBCFGR_PPRE2_SHIFT	4
+#define RCC_APBCFGR_PPRE4_SHIFT	8
+#define RCC_APBCFGR_PPRE5_SHIFT	12
+
+#define RCC_CCIPR1_SDMMC12SEL	BIT(2)
+#define RCC_CCIPR2_UARTSEL_MASK	GENMASK(2, 0)
+
+#define HSI_RATE		64000000UL
+#define CSI_RATE		4000000UL
+
+static DEFINE_SPINLOCK(stm32h7rs_rcc_lock);
+
+static const u16 pll_divr_offset[] = {
+	RCC_PLL1DIVR1, RCC_PLL2DIVR1, RCC_PLL3DIVR1,
+};
+
+static const u16 pll_fracr_offset[] = {
+	RCC_PLL1FRACR, RCC_PLL2FRACR, RCC_PLL3FRACR,
+};
+
+static const u8 pll_m_shift[] = { 4, 12, 20 };
+
+enum stm32h7rs_pll_output {
+	PLL_P,
+	PLL_Q,
+	PLL_R,
+	PLL_S,
+	PLL_T,
+};
+
+static unsigned long stm32h7rs_hsi_rate(void __iomem *base)
+{
+	u32 div = (readl_relaxed(base + RCC_CR) >> RCC_CR_HSIDIV_SHIFT) & 0x3;
+
+	return HSI_RATE >> div;
+}
+
+static unsigned long stm32h7rs_pll_rate(void __iomem *base, unsigned int pll,
+					unsigned int output,
+					unsigned long hse_rate)
+{
+	static const u8 output_shift[] = { 9, 16, 24 };
+	u64 numerator;
+	unsigned long parent_rate;
+	u32 divr1, frac = 0, m, n, out_div, source;
+
+	if (pll < 1 || pll > ARRAY_SIZE(pll_divr_offset) || output > PLL_T)
+		return 0;
+
+	if (output > PLL_R && pll != 2)
+		return 0;
+
+	if (!(readl_relaxed(base + RCC_CR) & RCC_PLL_ON(pll)))
+		return 0;
+
+	source = readl_relaxed(base + RCC_PLLCKSELR) & GENMASK(1, 0);
+	switch (source) {
+	case 0:
+		parent_rate = stm32h7rs_hsi_rate(base);
+		break;
+	case 1:
+		parent_rate = CSI_RATE;
+		break;
+	case 2:
+		parent_rate = hse_rate;
+		break;
+	default:
+		return 0;
+	}
+
+	m = (readl_relaxed(base + RCC_PLLCKSELR) >> pll_m_shift[pll - 1]) & 0x3f;
+	if (!m || !parent_rate)
+		return 0;
+
+	divr1 = readl_relaxed(base + pll_divr_offset[pll - 1]);
+	n = (divr1 & GENMASK(8, 0)) + 1;
+	if (readl_relaxed(base + RCC_PLLCFGR) & RCC_PLLCFGR_FRACEN(pll))
+		frac = (readl_relaxed(base + pll_fracr_offset[pll - 1]) >> 3) &
+			GENMASK(12, 0);
+
+	if (output <= PLL_R) {
+		out_div = ((divr1 >> output_shift[output]) &
+			   GENMASK(6, 0)) + 1;
+	} else {
+		u32 divr2 = readl_relaxed(base + RCC_PLL2DIVR2);
+		u8 shift = output == PLL_S ? 0 : 8;
+
+		out_div = ((divr2 >> shift) & GENMASK(2, 0)) + 1;
+	}
+
+	numerator = (u64)parent_rate * (n * 8192ULL + frac);
+	return div64_u64(numerator, (u64)m * 8192ULL * out_div);
+}
+
+static unsigned long stm32h7rs_ahb_rate(unsigned long parent_rate, u32 val)
+{
+	static const u16 div_table[] = { 2, 4, 8, 16, 64, 128, 256, 512 };
+
+	if (val < 8)
+		return parent_rate;
+
+	return parent_rate / div_table[val - 8];
+}
+
+static unsigned long stm32h7rs_sys_rate(void __iomem *base,
+					unsigned long hse_rate)
+{
+	unsigned long rate;
+	u32 cpre, source;
+
+	source = (readl_relaxed(base + RCC_CFGR) >> RCC_CFGR_SWS_SHIFT) & 0x7;
+	switch (source) {
+	case 0:
+		rate = stm32h7rs_hsi_rate(base);
+		break;
+	case 1:
+		rate = CSI_RATE;
+		break;
+	case 2:
+		rate = hse_rate;
+		break;
+	case 3:
+		rate = stm32h7rs_pll_rate(base, 1, PLL_P, hse_rate);
+		break;
+	default:
+		return 0;
+	}
+
+	cpre = (readl_relaxed(base + RCC_CDCFGR) >> RCC_CDCFGR_CPRE_SHIFT) & 0xf;
+	return stm32h7rs_ahb_rate(rate, cpre);
+}
+
+static unsigned long stm32h7rs_apb_rate(void __iomem *base,
+					unsigned long hclk_rate, u8 shift)
+{
+	u32 prescaler = (readl_relaxed(base + RCC_APBCFGR) >> shift) & 0x7;
+
+	if (prescaler < 4)
+		return hclk_rate;
+
+	return hclk_rate >> (prescaler - 3);
+}
+
+static unsigned long stm32h7rs_timer_rate(void __iomem *base,
+					  unsigned long hclk_rate,
+					  unsigned long pclk_rate)
+{
+	u32 prescaler = (readl_relaxed(base + RCC_APBCFGR) >>
+			 RCC_APBCFGR_PPRE1_SHIFT) & 0x7;
+
+	if (prescaler < 4)
+		return pclk_rate;
+
+	if (!(readl_relaxed(base + RCC_CFGR) & RCC_CFGR_TIMPRE))
+		return pclk_rate * 2;
+
+	return prescaler < 6 ? hclk_rate : pclk_rate * 4;
+}
+
+static unsigned long stm32h7rs_uart4_rate(void __iomem *base,
+					  unsigned long hse_rate,
+					  unsigned long lse_rate,
+					  unsigned long pclk1_rate)
+{
+	u32 source = readl_relaxed(base + RCC_CCIPR2) & RCC_CCIPR2_UARTSEL_MASK;
+
+	switch (source) {
+	case 0:
+		return pclk1_rate;
+	case 1:
+		return stm32h7rs_pll_rate(base, 2, PLL_Q, hse_rate);
+	case 2:
+		return stm32h7rs_pll_rate(base, 3, PLL_Q, hse_rate);
+	case 3:
+		return stm32h7rs_hsi_rate(base);
+	case 4:
+		return CSI_RATE;
+	case 5:
+		return lse_rate;
+	default:
+		return 0;
+	}
+}
+
+static unsigned long stm32h7rs_sdmmc1_rate(void __iomem *base,
+					   unsigned long hse_rate)
+{
+	if (readl_relaxed(base + RCC_CCIPR1) & RCC_CCIPR1_SDMMC12SEL)
+		return stm32h7rs_pll_rate(base, 2, PLL_T, hse_rate);
+
+	return stm32h7rs_pll_rate(base, 2, PLL_S, hse_rate);
+}
+
+static int __init h7rs_register_fixed(struct clk_hw_onecell_data *data,
+				      unsigned int id, const char *name,
+				       unsigned long rate)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_fixed_rate(NULL, name, NULL, CLK_IS_CRITICAL, rate);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	data->hws[id] = hw;
+	return 0;
+}
+
+static int __init h7rs_register_gate(struct clk_hw_onecell_data *data,
+				     unsigned int id, const char *name,
+				      const char *parent_name,
+				      void __iomem *base, u16 offset,
+				      u8 bit_idx)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_gate(NULL, name, parent_name, CLK_IGNORE_UNUSED,
+				  base + offset, bit_idx, 0,
+				  &stm32h7rs_rcc_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	data->hws[id] = hw;
+	return 0;
+}
+
+struct stm32h7rs_gate {
+	u8 id;
+	u8 bit_idx;
+	u16 offset;
+	const char *name;
+	const char *parent_name;
+};
+
+static const struct stm32h7rs_gate stm32h7rs_gates[] __initconst = {
+	{ STM32H7RS_TIM5_CK, 3, RCC_APB1ENR1, "tim5", "tim5_ker" },
+	{ STM32H7RS_UART4_CK, 19, RCC_APB1ENR1, "uart4", "uart4_ker" },
+	{ STM32H7RS_GPIOA_CK, 0, RCC_AHB4ENR, "gpioa", "h7rs_hclk" },
+	{ STM32H7RS_GPIOB_CK, 1, RCC_AHB4ENR, "gpiob", "h7rs_hclk" },
+	{ STM32H7RS_GPIOC_CK, 2, RCC_AHB4ENR, "gpioc", "h7rs_hclk" },
+	{ STM32H7RS_GPIOD_CK, 3, RCC_AHB4ENR, "gpiod", "h7rs_hclk" },
+	{ STM32H7RS_GPIOE_CK, 4, RCC_AHB4ENR, "gpioe", "h7rs_hclk" },
+	{ STM32H7RS_GPIOF_CK, 5, RCC_AHB4ENR, "gpiof", "h7rs_hclk" },
+	{ STM32H7RS_GPIOG_CK, 6, RCC_AHB4ENR, "gpiog", "h7rs_hclk" },
+	{ STM32H7RS_GPIOH_CK, 7, RCC_AHB4ENR, "gpioh", "h7rs_hclk" },
+	{ STM32H7RS_GPIOM_CK, 12, RCC_AHB4ENR, "gpiom", "h7rs_hclk" },
+	{ STM32H7RS_GPION_CK, 13, RCC_AHB4ENR, "gpion", "h7rs_hclk" },
+	{ STM32H7RS_GPIOO_CK, 14, RCC_AHB4ENR, "gpioo", "h7rs_hclk" },
+	{ STM32H7RS_GPIOP_CK, 15, RCC_AHB4ENR, "gpiop", "h7rs_hclk" },
+	{ STM32H7RS_SDMMC1_CK, 8, RCC_AHB5ENR, "sdmmc1", "sdmmc1_ker" },
+};
+
+static void __init stm32h7rs_rcc_init(struct device_node *np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	unsigned long hse_rate, lse_rate;
+	unsigned long sys_rate, hclk_rate;
+	unsigned long pclk1_rate, pclk2_rate, pclk4_rate, pclk5_rate;
+	unsigned long timer_rate, uart4_rate, sdmmc1_rate;
+	struct clk_hw *timer_hw = NULL, *uart4_hw = NULL, *sdmmc1_hw = NULL;
+	struct clk *input;
+	void __iomem *base;
+	unsigned int fixed_count = 0, gate_count = 0;
+	unsigned int i;
+	u32 bmpre;
+	int ret;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%pOF: unable to map RCC registers\n", np);
+		return;
+	}
+
+	input = of_clk_get(np, 0);
+	if (IS_ERR(input)) {
+		pr_err("%pOF: unable to get HSE input clock\n", np);
+		goto err_unmap;
+	}
+	hse_rate = clk_get_rate(input);
+	clk_put(input);
+
+	input = of_clk_get(np, 1);
+	if (IS_ERR(input)) {
+		pr_err("%pOF: unable to get LSE input clock\n", np);
+		goto err_unmap;
+	}
+	lse_rate = clk_get_rate(input);
+	clk_put(input);
+
+	clk_data = kzalloc(struct_size(clk_data, hws, STM32H7RS_MAX_CLKS),
+			   GFP_KERNEL);
+	if (!clk_data)
+		goto err_unmap;
+	clk_data->num = STM32H7RS_MAX_CLKS;
+
+	sys_rate = stm32h7rs_sys_rate(base, hse_rate);
+	bmpre = (readl_relaxed(base + RCC_BMCFGR) >>
+		  RCC_BMCFGR_BMPRE_SHIFT) & 0xf;
+	hclk_rate = stm32h7rs_ahb_rate(sys_rate, bmpre);
+	pclk1_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE1_SHIFT);
+	pclk2_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE2_SHIFT);
+	pclk4_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE4_SHIFT);
+	pclk5_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE5_SHIFT);
+	timer_rate = stm32h7rs_timer_rate(base, hclk_rate, pclk1_rate);
+	uart4_rate = stm32h7rs_uart4_rate(base, hse_rate, lse_rate, pclk1_rate);
+	sdmmc1_rate = stm32h7rs_sdmmc1_rate(base, hse_rate);
+
+	if (!sys_rate || !hclk_rate || !pclk1_rate || !pclk2_rate ||
+	    !pclk4_rate || !pclk5_rate || !timer_rate || !uart4_rate ||
+	    !sdmmc1_rate) {
+		pr_err("%pOF: invalid boot clock configuration\n", np);
+		goto err_free;
+	}
+
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_SYS_CK,
+				  "h7rs_sys_ck", sys_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_HCLK,
+				  "h7rs_hclk", hclk_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK1,
+				  "h7rs_pclk1", pclk1_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK2,
+				  "h7rs_pclk2", pclk2_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK4,
+				  "h7rs_pclk4", pclk4_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK5,
+				  "h7rs_pclk5", pclk5_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+
+	timer_hw = clk_hw_register_fixed_rate(NULL, "tim5_ker", NULL,
+					      CLK_IS_CRITICAL, timer_rate);
+	if (IS_ERR(timer_hw)) {
+		ret = PTR_ERR(timer_hw);
+		timer_hw = NULL;
+		goto err_register;
+	}
+	uart4_hw = clk_hw_register_fixed_rate(NULL, "uart4_ker", NULL,
+					      CLK_IS_CRITICAL, uart4_rate);
+	if (IS_ERR(uart4_hw)) {
+		ret = PTR_ERR(uart4_hw);
+		uart4_hw = NULL;
+		goto err_register;
+	}
+	sdmmc1_hw = clk_hw_register_fixed_rate(NULL, "sdmmc1_ker", NULL,
+					       CLK_IS_CRITICAL, sdmmc1_rate);
+	if (IS_ERR(sdmmc1_hw)) {
+		ret = PTR_ERR(sdmmc1_hw);
+		sdmmc1_hw = NULL;
+		goto err_register;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(stm32h7rs_gates); i++) {
+		const struct stm32h7rs_gate *gate = &stm32h7rs_gates[i];
+
+		ret = h7rs_register_gate(clk_data, gate->id, gate->name,
+					 gate->parent_name, base,
+					   gate->offset, gate->bit_idx);
+		if (ret) {
+			pr_err("%pOF: failed to register %s clock: %d\n",
+			       np, gate->name, ret);
+			goto err_register;
+		}
+		gate_count++;
+	}
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+	if (ret) {
+		pr_err("%pOF: failed to add clock provider: %d\n", np, ret);
+		goto err_register;
+	}
+
+	pr_info("STM32H7RS RCC: sys=%lu hclk=%lu pclk1=%lu tim5=%lu uart4=%lu sdmmc1=%lu\n",
+		sys_rate, hclk_rate, pclk1_rate, timer_rate, uart4_rate,
+		sdmmc1_rate);
+	return;
+
+err_register:
+	while (gate_count) {
+		const struct stm32h7rs_gate *gate;
+
+		gate = &stm32h7rs_gates[--gate_count];
+		clk_hw_unregister_gate(clk_data->hws[gate->id]);
+	}
+	if (sdmmc1_hw)
+		clk_hw_unregister_fixed_rate(sdmmc1_hw);
+	if (uart4_hw)
+		clk_hw_unregister_fixed_rate(uart4_hw);
+	if (timer_hw)
+		clk_hw_unregister_fixed_rate(timer_hw);
+	while (fixed_count)
+		clk_hw_unregister_fixed_rate(clk_data->hws[--fixed_count]);
+	pr_err("%pOF: failed to register clocks: %d\n", np, ret);
+err_free:
+	kfree(clk_data);
+err_unmap:
+	iounmap(base);
+}
+
+CLK_OF_DECLARE_DRIVER(stm32h7rs_rcc, "st,stm32h7rs-rcc", stm32h7rs_rcc_init);
-- 
2.55.0

