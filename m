Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1AF363083;
	Fri,  3 Apr 2026 05:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195412; cv=fail; b=Te29goxzWrOnZnDTr/Ar3zjhA4MyAy1JSrIrVLLIqNTcI203xNkCvQAy4aenfrLkh6KZPErUv9cYfjFASOvZf57sfTXcHHfjf3Sa50kd7bwSZatnoy3AK62OD+BJJpgP7oFi3dz7laa89J1lPNG3ZdNo85+++b3gbejDRDv46cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195412; c=relaxed/simple;
	bh=U2dBd09wIHeIgjLhqGCv3jq24BMVnjo/imLkQI06z8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M3ACT4LkqswFWz7N1Rcj94GInVZ8B5MTW5TW66lZgdXeYla85TyFC5D/ihUKWyh+aMmKwTunD6hICVjSxVKEGPIn8FafJg7J7VPaIHGDP6dMmrTq6+5LeWPvN8PBTcx5xWTAh1Cjs+jzk5TOVsdH1bFjTRVzc6OeenFw/cy5xKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mX+1wp5dXJUI7uljCrwlJXgILNxy/8Uw0U2TCC2eaoSV/+A+lkBpYjnkwHqr81QDGoQ+6fPgIzYlYddpwP9my5Vgp8dXxzl7JNdWeK9D+seDFBTZLbsaMJacEOvRGyJbHK8hrKxZgaFWJLKZlnZiIgUgX0BorD611PWirbuRouhbjbyYCdCRDFGOdpCptKAahx/qCZtRVbbO3kxh1JsiWtL5tgnvhUBVloNy6ZsGhyeLHLE9w+SMscxU2OWB9j5Im3BYi0rBmGamRw9I6ESkAr8387lGVIk9omO/7VEBkIQQcrv7ZNej0tf80+Ki8wzr/4itilWm/AS8dpqEEG2Ogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oYQfSUbOfz6Orw14zmhtx86N+lnkXvgdnCAGVaKdJ4=;
 b=Lg5TmRua7epqNdSe2Xgi8g+XJKXcQ7jtB6ULDDjx8soOoFahp/1cX4p4U67jIq2xlutQbJBmXYtWZn2v2rLFMb2lJFa0oVVmMILm18Yvnlp3EIG5AxNoQqB1WwVY9djQJJj6b+AgLJEmoS2bsnOINTvEYUQ8C27pNcJ1WOYBzRM1F/oCYb88oaOkMDcIxchmSDYFC/RZc7p6hn421M16HwP1OnaEDoj0VtwZ/vI0QvEYwYsuDOk3ABHTMsobrlOIkI86KJx+ofPjkdIZFDnD/rjkcvNbt0X+8U5v3Jv1gcqSsuLDHLKK5F1ZJzJQI6kZiu2YgBAd98qiCIHukHlw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:01 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:01 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 02/13] dt-bindings: clock: Add system-0 domain PLL clock
Date: Thu,  2 Apr 2026 22:49:34 -0700
Message-Id: <20260403054945.467700-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::19) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: f5aee3e4-4816-40ec-825b-08de9144d8a6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aGBD113Mw5Tun3eAKnQN0wTuICLL2VpQw6m8H55zLAbZaHd1cGt7xxJbS0IzBWQtQWeEnw9N6qoUPnRN/tro/QD4twGN3jeEpCWE1oiP3ZW+XUMNlGNT5LPNagBJDk1+LtEK41CsCp8XFSlIuDjjhoU9P7Ron6boPzEnkjV7YGykDGVVh/rTP0nmsIg+MtGpPrh7SdoQ6Gby4EK5hGfJpK4YPrL8DQx8zJ8Pbk7jEQI15tpXUGJuqfdbuD2tIXhe41NpHjDlOz63pg9TGptDG+IVHOtDW+JQN/EEpS7kE6ZPERB2WK6bXAHU5aElILwl5vkh3HaKjtwFBkHAOAfokYx9j+yag7OBJbTF1IXGIfn1OzZX22/AfhszUPNQLgnSNSB+ALQtIyOBGJdGqTaNSg4CtQsoG5HWr2AcqNtH0uwOq+j4uxz+ysupYRDMpJBtOSZQl14G0E2V/anerYwUCnoJEO0n95pVLiQdwkCpdycqCsp7vTjJrIOAijc/Y0RHmvsDFPUqZ8Wz7+Ibcr7EUGW8AoiYbvWESU8e52E4grFvMNPwV9KbRfEgqnysRZ8n37zg7Btrc0SjSlfjcb/7SjHeDviU5sVG6j8j4UoZYPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LRDbwtRS/srv0jk5zg09+TBWLCOH9oT9XHe++8DmABia8pgeP/HsYNCfrkkD?=
 =?us-ascii?Q?jJd0PYyjA2uJLKvl7B961QhTBtwwnLjN4/d73zY/Aog1jzbVT7o6/jojq37P?=
 =?us-ascii?Q?JEGRbuavOlFftfqTQ9GNAIkoPicrWXIkRqctpefBYqWDBMynh5GDwfOIinai?=
 =?us-ascii?Q?GhpfzAlrEDikoJhMPASwetAhe1giRbiRVL31J7CBOhxiRfbf+5VmK3yr4OA9?=
 =?us-ascii?Q?fqITIu3iKj96zDuaLK2cWfE7QK+/Qm/hljofven1jo1iNenqxsSVNT393HEO?=
 =?us-ascii?Q?snOD0y4ssobxP/UsCZSdmbRY/kwlSkgpZv6f5ZQUUy4If1ycz0j3+YyuPpiR?=
 =?us-ascii?Q?k2W0si/9d/Ned/do92DpMKVkfVLYS4ka0g0dloncoe0laisW/HQZ0kpO3hN4?=
 =?us-ascii?Q?hO+PBCAlRP2l3q6xLVqu4qSWxNL+IBOJhdz0uk7fwNS7g0ZFF/SDzOqOE8NR?=
 =?us-ascii?Q?PP74RCX4uZAeDaVI9mbYgOYAUOykE3wyhzvPefTJz+RvKE8xrLWu+Dsflk3D?=
 =?us-ascii?Q?3ydCFPu2JdLCrr91mFFydAraMeCdVRP5tkZE4WFOLytty5PMLpDOzHLWnDee?=
 =?us-ascii?Q?CaGnOuzu/etYcrTCHXyZs/LzCZ17ksHFWnk+ylHKiKPCapR91+A+vLR+UxCR?=
 =?us-ascii?Q?Hs7VwWpMHthkLdhNzzjxDhPNA61hhljLHqbCvHLp8zht3u4NnObQwR4tnT9c?=
 =?us-ascii?Q?Zm+xiSuVFJOs1u1z90sKk2mVbkiyzhp/9oIWpg0FeRabaISUSM995WZQGABo?=
 =?us-ascii?Q?4Bh4AEzdvHTqBWEpKysmXCzH6H2e0fL1iWjZEwUYzYi+KRyj7o/WXcVH6bQT?=
 =?us-ascii?Q?BlGoaKrT7cKA7WwZGfYfLkNvdarmYAhj9Rhd8DpYuNSRaZF+Nzzp9t5TBabf?=
 =?us-ascii?Q?bCJj+kRsrW3M6/V28q3cGtNxMjvdkTsNVEEGFMnv5XqKJfXwz2V/ikuloaH9?=
 =?us-ascii?Q?90ntANzH4G7Fbwc1aJlMx+FkGyOWOYQRbZyuqJ33fkerW/hbPCFn8DDOWQ2e?=
 =?us-ascii?Q?XSckdYM1JCUQdzDXymAL2bMLh6A8BE7+ZVSIp9/Jvr8E7E2+KzTNOU7pfQ7/?=
 =?us-ascii?Q?t2G8ZQUNlN2Y3MO3TzLMcAfBj98ahKj8lAaGF24JuNh0bl2v8kWZgpBxD/Pn?=
 =?us-ascii?Q?qpxSZORnLYmzhAoLQ+yoNuu6B8+mNUYtM5XnmFG1qdq2lxlBCXLfIyMrhdDA?=
 =?us-ascii?Q?XLfjMheKa1fJfi3tBxQYi8BUwJgYDG1GyRpE/xW9SvNdnOjGznkeFua6LMNT?=
 =?us-ascii?Q?ub0CG10LpDge6SPFXmqbvxC6U3u6xHGDIFMZmva6wXnwHKfCJlFERRunZkJm?=
 =?us-ascii?Q?VrZFHeNJITtVKYZhj99+xPpTLQEdK8GalyDDhoO/YDeMiNK0OaT6U3CUj5KE?=
 =?us-ascii?Q?AeRa3GvS+aC04W0PBKoSuisp6ibOdgDZNcF0YyIzlAZG5QghdBsA7SuURlr4?=
 =?us-ascii?Q?tVKP7jf9HG9tTBg/ikCiWdRlI8orlPhVdbfm8pGlKi/DtR4P2Q57PTL63Ckf?=
 =?us-ascii?Q?YrjD7vBoDfytQ0sqNOciblvnXkK2TB0zSJ9QeP7TFNN4bQK1DUU66IepNphi?=
 =?us-ascii?Q?fLPk3JOyYXz4IrcYHbQOOLYsaFZ5Odn1dRuUQuZTMiyI0uDNi55iMkvzcXUw?=
 =?us-ascii?Q?r//KsvUWFMMKEdhBnSktZGSUep86TkITkYB/8dLsvMngnwLnJjJJZmAUSbI0?=
 =?us-ascii?Q?otwPpSrOehgT6HKgBu3ESBM3024VsMmxe5HjU3wRXA6usQZzqkrBPPorRYBm?=
 =?us-ascii?Q?XBrWiJXrU0tROYg7J0B/pcMslyRyHSoXhGN2vS0nfNB6tJptqmLD?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aee3e4-4816-40ec-825b-08de9144d8a6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:01.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXGRjUbsykq9d78apjpCPbwYzZjbFZ/6V6FPuU6yVyO3SvIZHkifYyoAaAj0F08uqIZjepjIApI1Us3choYUCL2ov2r33VcuTSkka+89RHNbPa7smo79tQvyuPFsBcWA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add system-0 domain PLL clock for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../bindings/clock/starfive,jhb100-pll.yaml   | 44 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jhb100-crg.h   |  6 +++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
new file mode 100644
index 000000000000..f7ab90c05281
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jhb100-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 PLL Clock Generator
+
+description:
+  These PLLs are high speed, low jitter frequency synthesizers in the JHB100.
+  Each PLL works in integer mode or fraction mode, with configuration
+  registers in the syscon. So the PLLs node should be a child of SYSCON node.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    enum:
+      - starfive,jhb100-sys0-pll
+
+  clocks:
+    maxItems: 1
+    description: Main Oscillator (25 MHz)
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive,jhb100-crg.h> for valid indices.
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+      compatible = "starfive,jhb100-sys0-pll";
+      clocks = <&osc>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jhb100-crg.h b/include/dt-bindings/clock/starfive,jhb100-crg.h
index 6b7d53a0391a..719a6eb9b1a4 100644
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
 #define JHB100_SYS0CLK_BMCPCIERP_600			17
 #define JHB100_SYS0CLK_BMCPCIERP_100			18
-- 
2.25.1

