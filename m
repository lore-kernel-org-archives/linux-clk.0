Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2120.outbound.protection.partner.outlook.cn [139.219.17.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701742D97B7;
	Thu, 21 May 2026 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327013; cv=fail; b=eBjnkJJYOtAvMrb9KqrhSuOCS8lZ2IARNBkXq3wMXm7nbDX9iB02VlxipzmpPBrSvYXk0ogM+V9FU7+ZIi0M3LdggxFaWUa03bmHlOVYiSlt6US/p6flxjVYaQ48w7/qoAqWG0ubYZnTlT/5YoQsJ7ccPspJqPu9fPMpXeXlsmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327013; c=relaxed/simple;
	bh=yMZ0UenlJv9hNkfw79tuFsH+UEGkmADfJeWdivicRhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q+EvOlHZK3+Pbkr4a/MZnIL8w2LXCc+csB1Em0BY0Tj+DJuS+tZeixik410vJK39Bj7vK7KpGvPpWPEo1GUaILzAH2+8Gx1vTCn0Px4LtRFUmeMNguOJ5WnDwkQryfls5Y8tYXnY6d17T/KX1ovatvgBVxOven0e+LJaggOY6GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqPIEpZX78/rzuONTG+e/T+8t4pbLgoddwzf3I8O7w2xOKvbCqe5tNuEBoQw8FwKyAwpR2JNlFbcvuNd1/dPeXONEyX8lb5nhb3tB7ToYGDXyIUDcnLHlDqCBsmUk6N1PuM9NC4omax9h8O2NATu97TE6whX2iJgbtoluVX6uIQ24m834IELw4aCNFPTmHU2P9VzpvkONipLvhjOlvuuJBi0ZY7/Pen6uzgciFvxAAIIv9JLfjxO1wBxrO9QJ+B/fwffsrSIJi2DWepMQ3sVDKEbsERu12hk4270dhJiyBqtc+JptZwb0B4LN0jjRFKx1v1IKaGwyGLsG5d2CNYhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/RgWBFX56WfctvecHdsRyna7MLooAMvXFMoH8z/5BY=;
 b=nXSxltG22BCzUaT6J0DVJie4iKSxX4eBT4qejbdO/ATIGgBZu7Ed7l4u7+bysK8aW6SS8nYCZ0F0k4MVGWuvJL6EmCr60LBgi0tEMJE1a2PrAVsGkYWDLO6PtNZ8uWBRLOtwJ/5/g3s7om4EqsbE3c+PJqHg/XgEQs+gCmO9fDQ/p2AM9VoLZZtltMrkjeUVHpzEwU8zWw7i5NaB4udwlH35JO8WB0x56DQDTsqn/i1WWxXRD1/nO4r8WC7Ew9Q9zhqbtCnkExhiqYya+21Y9GjfkzdJar5CnAIbQB6vEJ/wkx8dl72XocdXydVpfTy3I3Kvwb9P8PgP4wxMy2kGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:48 +0000
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
Subject: [PATCH v3 1/8] dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
Date: Wed, 20 May 2026 18:29:25 -0700
Message-Id: <20260521012932.24163-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
X-MS-Office365-Filtering-Correlation-Id: ebedc895-33ee-4ffb-8123-08deb6d8723e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|3023799007|6133799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	E6jSDzRCtQ/dyXwsKLSAcEyM3wYZVkoruzXN27LR+A1rwlvLBFzGDnc9Q3BKNK2a3SV8KTjbI56tlJch5zbHenQRIV7Xk4zqUAmIfSEA1N1CHCMYGeqZwvSiXK279whZDxYNp6NI6u3m1h+WOZ5RuwjQLpryjtoi7EIRFt59Pz+QCMp3u1YFo/oXgFsnleqpnpUb7n3DHxuK2fvlhKrQaPqe9xmabaGKMD3f17Yn42sfK71SNDARvwObb0ts3h/UazAp9I36reCvJSRlV3j5H6Ftf0K9Xil6eYCwEgvgXx6wkD7kPplDA1pEc9BDgcyee1Ry+QDUVYFy6kSEoPZv9enH2pHcnqRQBpgpw80UgAAATwONH700n/bbEwrod0q2qxaO74IUXaP/fCqL5mO/AD5d5iujH7udJjON3VKIRjOXF/VxMedJsSCkaY84+J9xvkwrsnRzmsNrvHTsCslBWiuIAT/JzuAWMvkaVwnjcNhDuxBWGxCYQ6p+q7y1R8ZDX8fIckd5Pe5IpFreACxCK2XTYRcscif9W/b+L4McD1LO83x2Tumb9tmcailjTvvd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(3023799007)(6133799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wTvbUlb67vgs2MjPeh3rsg9EAq7RBBqsuPCZjz1TpvulPsy9DALWH0n00qJB?=
 =?us-ascii?Q?8xQPOkH6qRhiuUW495PwXNrMD9QZFNuiTe5+RA1WNk6MOjPY0vfp1zVausCB?=
 =?us-ascii?Q?ljHVngY323/Ghrc2FuMD5cbZw2t8C1vuOF/vy4upg2iSLCSV335N1d//E91/?=
 =?us-ascii?Q?n1mZPJk6Q2yCk50S95uU8SwSTPeziTH1IxHVqTe3X4IZwDJVDB9sTclf54Wk?=
 =?us-ascii?Q?ay5Ns3PJWsDp1PNNgPdyi0pc10FTIV8ivZ+lssDnpMZBk8ZpVGAwIuajLyWS?=
 =?us-ascii?Q?DKeC7LUyZZiYUIfJg5CKYztD2Z6jJjihUCZ2V510yd560ckJUyWxhKZEakl+?=
 =?us-ascii?Q?0BeVIvuT6xmBy4gbG2pGzw2ymCuqPlI+6MmbVvoC7MeIvx5sqJNmxDNPf332?=
 =?us-ascii?Q?x5mrLfYTvhM2/T1IO4SSH0OVPBqiXHlKlf8X1DICFXYmIyAfHUoyeiOeXfFE?=
 =?us-ascii?Q?SvOMnibATJn+4tsYegAA+1pQTMmw16qQdNTOWUeJIPyZeGz8TxfHmZzWB6b0?=
 =?us-ascii?Q?kpv4WyxG/lrWBOIylVNg7DMdf3O2iv4L3yorSeGUJXzgiP3wK8IIE2ARLTdE?=
 =?us-ascii?Q?fVPEYpg9/47haMZbRKKmULfHR7ypRHTmOv6DleThuO6mV9bHAeXZwrP1sQxZ?=
 =?us-ascii?Q?DiopxT9wmNXjmflKlyufpOdcf4CkTlsvoHV4FoCdvyDYKCbtF/obw1MjYcCC?=
 =?us-ascii?Q?5hCRXbdEopfiPrbLl2iC/31JI5lR55D0LOOMt/HDcFXjtYl9jz517SZZG1Tj?=
 =?us-ascii?Q?Kx3vshiNQw8OIGQOKSEKGq4Xywfe6h9CD4Lwcw7JI6w9ypqiS7O+StUOpEwM?=
 =?us-ascii?Q?mT7D1x5zEaZnzIzg8ha+0P6qRzryL0zi7y1/D2QzlCHPaSc9lR3gVCTiqe1s?=
 =?us-ascii?Q?CRkT/jMGYM6Z/YYIu6Vd+gJ7OczjVYnIIKyErDPFgLX4XCN4Nr1etBV2pFrZ?=
 =?us-ascii?Q?h1Rz1B9mecX/pt6PUq7PhdBov5pvTx0mX9nIEHMIkJkVo8SwRosaUfGYe3F7?=
 =?us-ascii?Q?h/LXwW59Zd6sodpLUBb4VutzGToEPJ7RE3ZBFk8Ws2kDzihy15jDvh/4Ah9n?=
 =?us-ascii?Q?MAnMRvWjIF6o/3fJY84EssA+dD1T9qj5z9vNfJ8jliNOsiFsDk+juHSLvkc2?=
 =?us-ascii?Q?iK8TjUJfbdIDzLZg1m5a7XutjVtErHZYFFBDQEOw7hWnPEmtw2isg9+YAR//?=
 =?us-ascii?Q?KtqAeTzRAtDuSAnMkcL7svcI3QQbTPw5e0oGHq6uHD3mqrtCNOK+5Xd78cTb?=
 =?us-ascii?Q?F5N7XX0j2XMrOuBzV337t+SKTJCu1lOAA/gUWBQAkXJ78M8xumIJEQhMQDPe?=
 =?us-ascii?Q?c3eTCwnlu3agTVIdlnesJkNBBavCSjkn44P340qTlvpMlzhB3nkfRFkGvGIk?=
 =?us-ascii?Q?YHd/eCYmlaBCu7otMn1H4Khiamb7yTgEJVaFswgMMr6sQlSHZIjagLdZUzUc?=
 =?us-ascii?Q?Udnsa9VOTqPHJdiBMJQ326YaX57PGn6OIamdRe9v2NtqyBobfOz3aatLswNf?=
 =?us-ascii?Q?9UQn859gnkWIlVDhzyuoqprsajf2ICrhK7fkyApM8fm2C+W7sY+BY8pIuKKh?=
 =?us-ascii?Q?Sj/I0BY9g2ERenyl9JrxCrBAyVO6jTMcnw5SQeg/f0OPXtGlYhaetlihJay5?=
 =?us-ascii?Q?3DZrZkVqGTqH+N7MQ3iZoEx6Ei300W55/BPya9tImKtueO9+/bJZ/ApqwHzr?=
 =?us-ascii?Q?RWeCJX//Wga/p7anPd+nYmKoSC9dxXVDjnY4X8HsiRmvD3xekmSV0AHQhnz6?=
 =?us-ascii?Q?wBZvHOn88INSKJeWHs2YJBtthUxs6GJsBh7ENMwQs0YwvoT4k/qX?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebedc895-33ee-4ffb-8123-08deb6d8723e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:48.0690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aW+1UoqC+fT2lzjzK/PNZmQp5J7j/AhWZaEA2/8E9mKurDZQ2EY8tTacx33/yM4B0WveqAHM5DdjUyfx0ADrmnuJoji05ZTrSWlQfH1D1nYOLmrfK7YGniT24EhE66p7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

Add documentation to describe StarFive JHB100 SoC System Controller
Registers.

Add the PLL clocks for the sys0, per0, and per1 domains under syscon,
as well as the PCIe RP reset.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../soc/starfive/starfive,jhb100-syscon.yaml  | 114 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 ++
 .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +
 4 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
new file mode 100644
index 000000000000..0e642609af07
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/starfive,jhb100-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 SoC system controller
+
+maintainers:
+  - Kevin Xie <kevin.xie@starfivetech.com>
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description:
+  The StarFive JHB100 SoC system controller contains MMIO registers used by
+  other hardware modules (e.g., PLL, eMMC, PCIe). These modules access
+  specific register offsets, bit masks, and shifts within the system
+  controller region for configuration and status.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - starfive,jhb100-b2h-syscon
+          - starfive,jhb100-gpu-syscon
+          - starfive,jhb100-h2b-syscon
+          - starfive,jhb100-host-syscon
+          - starfive,jhb100-husb-syscon
+          - starfive,jhb100-husbcmn-syscon
+          - starfive,jhb100-husbd-syscon
+          - starfive,jhb100-npu-syscon
+          - starfive,jhb100-pcieep-ecsr-syscon
+          - starfive,jhb100-pcierp-ecsr-syscon
+          - starfive,jhb100-pcierp-syscon
+          - starfive,jhb100-per0-syscon
+          - starfive,jhb100-per1-syscon
+          - starfive,jhb100-per2-syscon
+          - starfive,jhb100-per3-syscon
+          - starfive,jhb100-strap-syscon
+          - starfive,jhb100-sys0-syscon
+          - starfive,jhb100-sys1-syscon
+          - starfive,jhb100-sys2-syscon
+          - starfive,jhb100-usb-syscon
+          - starfive,jhb100-vout-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - starfive,jhb100-per0-syscon
+              - starfive,jhb100-per1-syscon
+              - starfive,jhb100-sys0-syscon
+    then:
+      required:
+        - clocks
+        - '#clock-cells'
+    else:
+      properties:
+        clocks: false
+        '#clock-cells': false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jhb100-pcierp-syscon
+    then:
+      required:
+        - '#reset-cells'
+    else:
+      properties:
+        '#reset-cells': false
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@13010000 {
+        compatible = "starfive,jhb100-sys0-syscon", "syscon";
+        reg = <0x13010000 0x2000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+    };
+
+    syscon@13014000 {
+        compatible = "starfive,jhb100-sys1-syscon", "syscon";
+        reg = <0x13014000 0x4000>;
+    };
+
+    syscon@11719000 {
+        compatible = "starfive,jhb100-pcierp-syscon", "syscon";
+        reg = <0x11719000 0x1000>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 47e4b368347f..6f6aac7cea95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25613,6 +25613,11 @@ S:	Maintained
 F:	drivers/reset/starfive/reset-starfive-jhb1*
 F:	include/dt-bindings/reset/starfive,jhb1*.h
 
+STARFIVE JHB100 SYSCON
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/include/dt-bindings/clock/starfive,jhb100-crg.h b/include/dt-bindings/clock/starfive,jhb100-crg.h
index bdf7d628b381..4270bfa532e8 100644
--- a/include/dt-bindings/clock/starfive,jhb100-crg.h
+++ b/include/dt-bindings/clock/starfive,jhb100-crg.h
@@ -8,6 +8,18 @@
 #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JHB100_H__
 #define __DT_BINDINGS_CLOCK_STARFIVE_JHB100_H__
 
+/* SYS0PLL clocks */
+#define JHB100_SYS0PLL_PLL2_OUT				0
+#define JHB100_SYS0PLL_PLL3_OUT				1
+#define JHB100_SYS0PLL_PLL4_OUT				2
+#define JHB100_SYS0PLL_PLL5_OUT				3
+
+/* PER0PLL clocks */
+#define JHB100_PER0PLL_PLL6_OUT				0
+
+/* PER1PLL clocks */
+#define JHB100_PER1PLL_PLL7_OUT				0
+
 /* SYS0CRG clocks */
 #define JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN		17
 #define JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG		18
diff --git a/include/dt-bindings/reset/starfive,jhb100-crg.h b/include/dt-bindings/reset/starfive,jhb100-crg.h
index 872a4dd25beb..1489bb01c2bd 100644
--- a/include/dt-bindings/reset/starfive,jhb100-crg.h
+++ b/include/dt-bindings/reset/starfive,jhb100-crg.h
@@ -183,4 +183,7 @@
 #define JHB100_PER3RST_MAIN_RSTN_PERIPH3_SENSORS			5
 #define JHB100_PER3RST_IOMUX_PRESETN					6
 
+/* PCIERP SYSCON resets */
+#define JHB100_PCIERP_SYSCONRST_PE2RST_OUT				0
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JHB100_CRG_H__ */
-- 
2.25.1

