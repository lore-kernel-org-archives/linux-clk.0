Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20735295E;
	Fri,  3 Apr 2026 05:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195410; cv=fail; b=Bs4xlUAbMoZeNjK5VK6Byh3d8n4OOGQE1RE2zDssP+F5QGWzKpgzWTsSyU30dIsy7pTYJmpMaMg9LBqhX2KpDGI3Jw0P725Bupbe5Kio+mxWBBVg3Oipipb0fnBlmBnkZMx2AfQfiyZsZVGdQU5FhOQ2otz+d+4hZrleKdmTvmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195410; c=relaxed/simple;
	bh=NhHKMc5PY33JnlX1iRN/ZjSPnh/FAQ+tRspOtSwrJ3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bm03NNvD0WB+5LwKdCJ1/uYaLsd+Rkh9cDgXmA6IRoMrmoO/9/MMnkH8UvtU27QP3eUt2Ht2CNyfgMUKYbwLAinVFJ5Cp2otPK+yHKcjXE4XVMrDzx1b0XW3Nuk8Z8O3hP+/Hwj6R9fXvo16SYsVKNZuRKNhYHoseMYGDZtX5qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAfIQ2iTWZLZng6mUDQK8YF+RBFWitPT7vTOvo7IAaLG9PLPGyNoX0NQyoNs+QV1qucIQx2282SfTMBDPL1fYekBl3OjmR+P6bNb+WZqQNEdoKMxt7uocNLt/6YwmwdOy3LRt5qPQY29ABXSKjG5WJX8kicWYNGg9dJ1XZQJcyj8t1WZM3wrNNUcd9QxQIFyiVUgBCPJRugf73PvsXijjI9LphsxhH0X68VIjkaJ8EI/hgw5Ghmi/1ASqeXh4569/TzWli/7mQX+YQBBbFEtsgsEkX50RmJdTsY28ji/oZKAr8x/bYACifjIRe0KGBp9nP7NmMQ057tCt3HhCwKd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nol6HRzUbRKNK5gnL1Ghegt22m5y34mo/2YOHO+GEYs=;
 b=d1y/Gf5kEFgkKZS5db/NnHGx4eryDKnUZcnpQWEAmDeFb3ryfUILqtIEke9emhxyK+JcIZXradldU52Fm2lEH2JBn/dYnOdUotcdmSe8o9ELu210PEp6p7IdktkIjfa5hRDEctxsL8EnbXaCDA2XnsdbGfVLCh0jlq4GlTAjce641PDkDxTFqixwVKOmrbBmzxFm6+xYy6mXYGGbmOhiV3X85kOtQj/lTcmJ8xqaoF/Pvh5ndB+AISLARrQWN3PwrCTFBHC3RnKWTE3ssRC+i4PN453u+NxwTZjR9M2uxZzdOEO3kFD22W1vkJjg2T4icRvsYKQk5YBUroZTT7bWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:49:59 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:49:59 +0000
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
Subject: [PATCH v1 01/13] dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
Date: Thu,  2 Apr 2026 22:49:33 -0700
Message-Id: <20260403054945.467700-2-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 30c78f26-b3cd-4a6f-ac55-08de9144d7c3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VdNqOjxTjhdQSOErdwvMzgaJXhly3WFursR9JrmPj+mT1Dn9ZZDtriDmOVXlzb23IPZOEY0khMW0iwo6OIWBCupp3JDbQVoarA5mupG1pWEfNufozEJPHBLLOMoQT9KBCV0AEmU8jR7oEec2FcwGa73JVigezyKYHr25S5kvxDkKnBEENxvYnZC1So/s5eTEUvOZDrP5kknP1fBpakg5TLNItLo5akEZf7JwhkoAVKUz3GPza9HPDDq7wLWeJRZsqnIU/X69TaOzTgCUC27xxdsSDd6uf28heaZBAFDAv7gYU7p0ss6bBsM75F2JDmEWZstna9pHhtQ67glxyPpONqJjyR0nEKVUAxXLwUkk8Uy/GWfG5nCLDERKiwfxLwr0YxGNcF0w1BOHh6v+NU0HCKMiSHoeckcR/SjUgMqMJU7gRz94HkJoQJRXWZ1RbVejkG/6RncAKkia3G9GtnSH4Nz7tW+YNNE7zwiJ8uCeuPnOOasFzYjK3wSkCUWLtI0JkY6Rh7kxaLVxESMQlvnLRbZ/8xRrqhDtB9WV7duPf2ZgWocn50Ugiw2/XLXNIA758sNsoe2/06YfVwMH4ElpyH3x8Dq/egULgl8AqWAgdyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2aZTTgk+2/IdWH5wC64nZiad5TKWIJm+yIoy2COahLL7NPHGTtCL47G28zmB?=
 =?us-ascii?Q?z6Zw3RhUzAB82b0+38e95ekODMXzDX8LsDsTijUly61KpJh9iHaGRIiusB8W?=
 =?us-ascii?Q?KF1TnCZe2LX2AYIeasrudYdNu+0jOooBToZRPGPozh25ZNvZsQIFe7mlvBo7?=
 =?us-ascii?Q?Y+Yzt5x1rnam857FL7vZL27holeIhOpA3ShwfP90iSUyjKzZJO26qJ75NV64?=
 =?us-ascii?Q?KO59eqPGfcIqGgkmBqr07FvsbTnjbrRWTU7/aIblzk0VOD4i1EVE5u9mmtQf?=
 =?us-ascii?Q?TyUIVihj3vVWX9aygjQ4qM6hF+hU03lVxGW/wD1cgbKsg2J5TVxWzuSdCUY9?=
 =?us-ascii?Q?/rG351YYOWlhuK4mXd7VolNI57ZaGM4i1DdAT5QiekLE/bvFMnDo3nNcGN1c?=
 =?us-ascii?Q?uI8rb3Y0ITFxj8934lvXJWytOcdGkkNND7tKq124hnjSLTh66CefsmiCphPD?=
 =?us-ascii?Q?CQQ0cFWo0MQra/xWTA8Y0xcZgR7VcxZqgywwz9f0+9MzRjt470l/lEWFPJiS?=
 =?us-ascii?Q?oQ9KHBUPx1KckORJOOk55ARNQqicrtYynCTUuSVltzURg6kLnbu5Ai2OXzft?=
 =?us-ascii?Q?I3lcqHGxeaLBeEqYziTdC+Pg+eaEQafXGxnPsbeEOObQA+QoRlbvGunDtU85?=
 =?us-ascii?Q?GPXbCXOMute1XLEMtF6HEpz0Ye3JjX7POgSDz/wob3udhQoFdTnnJy0N6Ziq?=
 =?us-ascii?Q?kPj6E9tKkg9wQPN8/Rj0JEi4KCWn+ssOoTR4MjpzoFhJgBfP4YYtaRgHtihR?=
 =?us-ascii?Q?2KH4dn76UQyqR/H10Jbc2BzwhTbJxuJlAbHSl7z/kQbh5mRFZiveHGqiRlhP?=
 =?us-ascii?Q?gnu8Dur6bWqQoBE6o3YFbdWGdkmjbqC9fVNoMs9B+c9+0pmaWau91fEFN8pq?=
 =?us-ascii?Q?7WF+4kKaU8vYNMj2YihubrOhnKyrsJ9Us8dJkvH2v0YolQo3q2LyOoPeOa2h?=
 =?us-ascii?Q?N5fBfvknmfC4ObuyB8AmPmhwa7kZ0tQCIeqymSTMBX99o7OSvTdu6Iu7WmFl?=
 =?us-ascii?Q?FQSAuZXdbl+o/N/lcoAqNhs24kChzTx07F1KTD89OEYCPdpdn7tE4O5Pbiuz?=
 =?us-ascii?Q?m2lS42GhzH3lkTTuGZqJxhm3midMOOxHysDln/0IlBQt95gm+kU3R5ebMzUK?=
 =?us-ascii?Q?TfdzFM7uqhsfVBWPg53rX5/P8LngJCQgSRdajqzw3k9gm1wZC+yCPlFPozOA?=
 =?us-ascii?Q?KqsuqjTaN7XtuYjHHrZTCIYU2kLbx0nJBbayti0thFuTGgXT64mEZxJmSAew?=
 =?us-ascii?Q?o0yL9loUO9nksoKWREt4AKJe7oUPbr/2I64/IQ9gU0rHRDZ/IeaW3hjnaOwb?=
 =?us-ascii?Q?XnX/SpXZKmG/X9o/pC5fOaOkZA5w9uBstnb299FJyUbiSRrn0q1z4WAnrvqI?=
 =?us-ascii?Q?ItOZcclGJOPYUACZgvmtW+PhWoYn5mwZHhiY9QTzOABb3PEm/PcwVRgWgB4u?=
 =?us-ascii?Q?8e2y9VheqRNa7/h3az1LXGuA7CDYfvwwX+L0FwMZ9AWx4RCIDBq+hv3esANA?=
 =?us-ascii?Q?tTeqfk/lBy3OnZhCcfFRJ/lh/eEhOKki+16Ko+yTRMnWNSrnuyvrYydcHWXL?=
 =?us-ascii?Q?NL4WVxLvEShF/fFjsGdI7ZY2pY+eAWTGN/n74q+bsVV6tlowzr9YngeaCZvs?=
 =?us-ascii?Q?0S4JgANHH6iBNkHLiAcirR/YvAdo9vpzEf+/nHDZP+PS96cJpbawRRQK6HdZ?=
 =?us-ascii?Q?PZJJCyHCwx/nYeUgdzGJJ4dxPxtQrnUlUHRriAvXiOFfOdJf8km3XD/KFTUR?=
 =?us-ascii?Q?L5uNnx5BeRjcCKHEt86xNBDmopXMJnesdVc+EaLkN7gssDCve7xp?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c78f26-b3cd-4a6f-ac55-08de9144d7c3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:49:59.8600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NieLpOrl0k1ohv6LjcX+gzleHcj5tTNSZWwueg68qo0quEmujq70rKpjN2duQoutaYw1dWzc7syn/lr9Gv30lOp+9n+Pdmdp4z67Ha1sulROEYBUSj8QHmI4A4c5vb7r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add documentation to describe StarFive JHB100 SoC System Controller
Registers.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../soc/starfive/starfive,jhb100-syscon.yaml  | 140 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
new file mode 100644
index 000000000000..c0e1f6f68fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
@@ -0,0 +1,140 @@
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
+  The StarFive JHB100 SoC system controller provides register information such
+  as offset, mask and shift to configure related modules such as PLL and PCIe.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - starfive,jhb100-pcierp-syscon
+              - starfive,jhb100-per0-syscon
+              - starfive,jhb100-per1-syscon
+              - starfive,jhb100-sys0-syscon
+          - const: syscon
+          - const: simple-mfd
+      - items:
+          - enum:
+              - starfive,jhb100-b2h-syscon
+              - starfive,jhb100-gpu-syscon
+              - starfive,jhb100-h2b-syscon
+              - starfive,jhb100-host-syscon
+              - starfive,jhb100-husb-syscon
+              - starfive,jhb100-husbcmn-syscon
+              - starfive,jhb100-husbd-syscon
+              - starfive,jhb100-npu-syscon
+              - starfive,jhb100-pcieep-ecsr-syscon
+              - starfive,jhb100-pcierp-ecsr-syscon
+              - starfive,jhb100-per2-syscon
+              - starfive,jhb100-per3-syscon
+              - starfive,jhb100-strap-syscon
+              - starfive,jhb100-sys1-syscon
+              - starfive,jhb100-sys2-syscon
+              - starfive,jhb100-usb-syscon
+              - starfive,jhb100-vout-syscon
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    $ref: /schemas/clock/starfive,jhb100-pll.yaml#
+    type: object
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
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
+        - clock-controller
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jhb100-sys0-syscon
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+      patternProperties:
+        "^chipid@[0-9a-f]+$":
+          $ref: /schemas/hwinfo/starfive,jhb100-socinfo.yaml#
+          type: object
+
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jhb100-pcierp-syscon
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+      patternProperties:
+        "^reset-controller@[0-9a-f]+$":
+          $ref: /schemas/reset/starfive,jhb100-reset-pcierp.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        syscon@10240000 {
+            compatible = "starfive,jhb100-b2h-syscon", "syscon";
+            reg = <0x0 0x10240000 0x0 0x1000>;
+        };
+
+        syscon@11719000 {
+            compatible = "starfive,jhb100-pcierp-syscon", "syscon",
+                         "simple-mfd";
+            reg = <0x0 0x11719000 0x0 0x1000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x0 0x0 0x0 0x11719000 0x0 0x1000>;
+
+            reset-controller@14c {
+                compatible = "starfive,jhb100-reset-pcierp";
+                reg = <0x0 0x14c 0x0 0x4>;
+                #reset-cells = <1>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4ddf8ba2e60d..eb5f6a383146 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25325,6 +25325,11 @@ S:	Maintained
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
-- 
2.25.1

