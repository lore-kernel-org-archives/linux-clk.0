Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2116.outbound.protection.partner.outlook.cn [139.219.17.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B3439F98;
	Fri, 28 Aug 2026 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916631; cv=fail; b=mZ9Y3RIRFLRe6vLdwNavkyU614ldpf/9VoBygGSIUwAFzGqNWAJgbcrC9skOOlemlMg3VF0aJgVrA3PaO74/hK5hgCIefi5moogvaFLs5Bg+HsvtV7esWvdbRn9+NU73syLkXZu+/f+Es2mVqufscRg47eVFJHcvG2R48VjroEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916631; c=relaxed/simple;
	bh=AFjfK4aMUmIJ9DYBqD+ayt6qM0Eiak6+a4u7zt9KQjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uSNvaF7NcrinIUKM6cuD/U60A3qQ/xvKOV3bkjrL7Hs47tvxOIv39GJ5ONQ8NTmlbIPf816aeVpwyhimWeQ6qNSNJeky5afxQoEPNmr+eq57x5e0C0TIobK/OgVBwp+VvGCibgyMyQbICvU6TvspwwVRjBDj4PNIPCDkwVuek1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jsr2e2U29Q6qIqHjgpOablIsr+jXsUT592qSILi0OLpFVpsq6LKzB6lymYVtdTz0gMw8U/4i+1zefN2oCneSWM/IumU5pPnmpiSy1xsIQ/XFGb6nSxC2/pdhyesFoql7la9UrOgsojF0UfGTO5s3l34MRsrBG/IASlwLaB86YDnUtquVtOA5Q2m5PJM4zzx8EDhoasSFhdFL3nq1tVqXBIk/QUJHGs+jSwPUF6qT0rIK8Lv6Cpo7YxxGFqv5Gc2BkYL3opcBMm4Ji4hdHIloYMXiBWPuccj3X/aIdv1VfEKp+0SoGYknkUFeEaemsfWRm5GdY68zkD+6HsK60dRDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3judr2AHNokaVVz+x7xPJXJfSzmtilXgJUVXLRcvfW4=;
 b=POceFVKf+Jha70uv6TZcTzk42Yh2KiZx8i3ttxJmFqVVBamwQRaOhaLLmkNUrA4TPbJd5nJriywMG2woTB3cbOUiFZyW2+80aG2qK1aPC7kV2hWwBwZSPMZF32v9CONRhq/or3rKEcwbaW9g9efNni90Cb2fK0eCRUSQJsIAcCWCclkKNXYXEgBhaPAHvy4rfmmgbb9w6n66rtS/RWJBRNaFcWB3MVFTtsruoCfJMBobxJLaCxUkJa5aRNPobCEpuIKZLb7rlxMXOFbH5/3u3tUz1ugKDuZH9DKJ406yudUhnDc+r4cOjRdyJA2fZP/PKE93L+h2eWEF02e3cPmJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:21 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:21 +0000
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
Subject: [PATCH v5 1/8] dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
Date: Fri, 28 Aug 2026 02:56:01 -0700
Message-Id: <20260828095608.19955-2-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: af9bf4f7-31e5-49c4-ca97-08df04ea9cc7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|22082099003|3023799007|6133799003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	PWgIaBmoKvXo5IU7rzS7H4P1c1aisM3WyQib1Fzv39WExOmPlz01NmOEBBopTqU0XJbB40lN6hHceD1Rc/QxE6snZJxb8j5o+6MMQGUj7CAbF/0tnmfacf+nc+Q4JEZv9lnOu0wpah/F6T7xzdaNuxHncBkXmwlSWLjjyR6vWS8s+GatKkCH4Ke3F2Lc5Dzn4HTln+5ImXTQi15BNHjgYJQ4r3hLU46gXXlQDeIn7gd9++33S74aMB87K/pQqG749CaZqirz/Dj4uD9IpI9HUFKpLb2UrcKVwwfvjCdOrvse86ZrP/voROyNJcXA1rFkH5wGV7AWIuhJWr469GGf2khv/ELgtHtKaHCyR/HSpa+EQuCeWD+8ifATdORPyTk38GR8VI7cWBjbK6xIHhDTd54rQV34n/rfrxw84zFh4s64JT5nz98hUkNux+j8UDXAu0llvMGIpFdg88cyx2z2xKFzSIYAJ9VAbQOuKsLkqYeUinR4dKnGZJrIEzx22VUbtWJtl4zsR90eHRrMBSE2n/8XKxK1m2NjNzEChGcccFWHoaN4yOK8SeZkxQ4GKBTw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007)(6133799003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EouMQR4AM7lmoYwEjbEXpnTDHyA69BV0Ank0/wkFDq2fQhjjA/JYRlh069EI?=
 =?us-ascii?Q?0otV2xCVj2M/PhDg9jlMJ4pI2DP0E1vgP1NMM7LeLXTV4eWpF4nBfOrY4k+R?=
 =?us-ascii?Q?bJS8jUrI7FUCV2dJl62cTBIL1r9YNI6LYg0ztTUYBeNAedcAVTOU17NuBu/I?=
 =?us-ascii?Q?61blAiUqsSNf3fph3xLoljnBtP6sEaHXYjHpRDrPNniIEMfHvA5Qg5HRgsTv?=
 =?us-ascii?Q?RB7eaqEw0AVtg3FJTTI6pvftrgniYI1LhjSxiyWZvM7a033IHJDUMUKy0yrt?=
 =?us-ascii?Q?8CAauObC9hbVWVcdJxAxsOOaukTHdc2fXHzxtjHdGkbp5thiqDNms/xOVQ5u?=
 =?us-ascii?Q?BXoe0StzPMGxpFIj/355ABFBEwaqr6xfyhZBUCz+jJ7NRdI1coCAJ8ERoWA2?=
 =?us-ascii?Q?MX4vHbgTAj/R6qhH8AqfGZrPNHR6TweqLOfI0utzUTiwtTgdV3FOjdtBY0c/?=
 =?us-ascii?Q?tyQtpmOnTYdP0KGCJvIHOflCbCtCBD4kJhvyNeCwhY69y+MEMzUDUU+P6LA6?=
 =?us-ascii?Q?y/5Vhl6W+f7srewqgHs4G5ALVeiwnfqyO6XXrRjSlmfk/eKQyfKq6lGfGYTL?=
 =?us-ascii?Q?Bgas6LQotFP+BJGRyM/jTp6+R2dOtD0A/eis6q8FwYxmjXNPsi8G25CRl4dc?=
 =?us-ascii?Q?yk8NhTKZC55RKszheI4zV2QWAcABWo2TsnSUJeOaeAllp/Y5YHdDWgT/lTyE?=
 =?us-ascii?Q?MEAm3ppAN4gasjjG1bIXFcOwFCzuTdaF6VPdtTH+0zck4G3tme1lbJCc2U+h?=
 =?us-ascii?Q?XiLxrK4b/SJaGiWflFnzDDRCYW/lgsQYiVg0xKXU8/SoW4V8+voCRliJkpm9?=
 =?us-ascii?Q?ruLZ+PCRoo4whEHRDE8yQfuEJdyJgfzmxGqF+eL31gaAzgzSIQ2Mllmf/Yfa?=
 =?us-ascii?Q?4ZM6O2IFzYco+MyPae9wq/ehBJ6C8JgUZ0UuEyzjRDVt0+t0PDkeEJk2VILg?=
 =?us-ascii?Q?xRT2EHGUESu8rzgJVDK1pyxbRxg6NAiTsmJdpmqfsQSiwrdyQ7/vGaHYajCZ?=
 =?us-ascii?Q?U9iDDJSZQCcx3qwwcGL44mfscR+d/uHoXwMfRILeu0R+qK8n2qaGqZvvXFjN?=
 =?us-ascii?Q?XXF60C39TRlYwn1p8fPFqLOArYfk8vC9q0739ktIhRg01Su4yrnr5amZNPL8?=
 =?us-ascii?Q?5ZQQYZ7HX2ETkQIqPvP9AJ0aZZ87jYE2GxSrRMKo7jxjn5f2Bbs0D8gkzYbg?=
 =?us-ascii?Q?cVR+e7Qh5RFzUUylE54qgUYDH/Gq1GJJVtU8aIvLm21d2fttwQzBq3FkiPCe?=
 =?us-ascii?Q?sSAHFrj71XhBUk2y+jHsJGhGEBpWL/vXdEQcGPboEboiTKKlKY3gT1y25OER?=
 =?us-ascii?Q?GXIVy4JVvZE6eJB9u07AgkpltJR/mQPQw1XKZfPSwTVC+ESjFMYgX9pwkp/M?=
 =?us-ascii?Q?EXjjCM8zl6+GX0+zAgVy+wDnYJ2BRBhBpwowAmQMtgxHx2jgfGDeDQxpm7iy?=
 =?us-ascii?Q?Lbth6YQcx5739tF7V8xx6u1Te+G33uRCNS06rmW6YpkL3Yt2I+2aO9+gd6/m?=
 =?us-ascii?Q?1YBFM3JXYuewgj8E+dZnfXYNQanB4vMmSIbhysKdzaqKV8kf2Vba3OFlJ8xP?=
 =?us-ascii?Q?Aqutk5S6A6NYHxz/dCx+ZfaRQ3MNJNvQc7+PQcMZUH6EnIEKCPsTyxL5g0Xd?=
 =?us-ascii?Q?LukXD31iKecAARnjh9OUvsxNRgtVSxvaHLBnnQdHDjId28AZ8pwnzjS4I9PD?=
 =?us-ascii?Q?VFf5q4GeGfMZ/fWIsmv2OmlY5wy+olokXdERQtcf6LBNXGLJ/Qp2ucd5OWXI?=
 =?us-ascii?Q?gpk/3cRBI46RXcgYqd75bxpbdzTA0esfrH/UExHK4AkzWpsDR8rs?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9bf4f7-31e5-49c4-ca97-08df04ea9cc7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:21.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkP0hXpvM+YOAiDhMG7WxqZkMaPUyWqEzgQf5uBaJEMmZQ0Ef29YK5hmE1LCBAiqLLZEM0sbEvmX6sE7TsDuHtIhFC24M8yNGZnAry3cYiK0U51dHiZvBYKeLNj9qfTj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

Add documentation to describe StarFive JHB100 SoC System Controller
Registers.

Add the PLL clocks for the sys0, per0, and per1 domains under syscon,
as well as the PCIe RP reset.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../soc/starfive/starfive,jhb100-syscon.yaml  | 115 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 ++
 .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +
 4 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
new file mode 100644
index 000000000000..000f53acab34
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
@@ -0,0 +1,115 @@
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
+          - starfive,jhb100-sfc-filter-syscon
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
index 709600e80951..cecb4f279160 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26094,6 +26094,11 @@ S:	Maintained
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

