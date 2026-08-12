Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F813546F4;
	Wed, 12 Aug 2026 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520410; cv=fail; b=G3T977MvIi+SJf21b953nSVlc2L5Htdu7Juy0h/QZLsz8hMJQBOcGN74yB4bzcCHJljxLhEuYhYCq1xyQ1K2kDsOdRo2i1PauRqLJqjhRsoipiKzY04HWUGfmMpuiusLlZy+RBGGwuROrwGop7duK3+7pIISvcHjV85spiL5k38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520410; c=relaxed/simple;
	bh=eICoPIfHB0acalDyDtxcgpkgOiw060yofc1Xt79bj28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z5KTiS77nvSqGw2xMSxwQyiMF+skJgSd4t9QZW4gU4FV1KmsgDLnibpMDcY6WjiBz0Xrg6fOgv1RdG1KMRxR+xd3dH4bQKVpdfdDooPuaXqMe6PYyjeLi2SI+JOGA5YSuV5eybU45XFWIgjkf5zn7pMjycWx1H/5ciLxG0TUOnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=HRuQW4xL; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="HRuQW4xL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xw1ILZJaQCA5ac6pwvlEL8uyPX/DdzrMBPXcVzR5ptRoZy1gs8lNsfZBPZB4LyAanTK9ckOlRJAwQhroeePjTDJqI9Cl3D3zULffYexmef3RGNNALgot0ZpCga2j3MCCpvkz8agnRl+Ia8YgpM84TIdur51g7TuIA29F/2kndjumjeyM7jmAUAGcyeUXdDBL+ijuL93zqPas1Lp67+I6GhxQZOhaOYBLRkbfgUO3Ov7wNNKoIMV+ShcnD1NL8+kjy6Kd9P9Irv58i/xftMoL0nwkwyk/Y1TAix12XfCAlJwKSk0vGUImx+xsDa6Bx3oiatvIod6f2vNgdR8TD48ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfeP2EAK/eYHRAkZk6l1P7GEt680t/6bn/WKH37aews=;
 b=TPjayEKEYneGnpiWNWALSIg8O6dytbhaoNlfA65Szh7YuJLOxQXAyvJQiRv1tjBsMIiBpX3lwoEiw56cP78rqXQFT/F/k25jD1fQQkB4OX76ITQSUaDR4Rc/m/Wjox8s3aRP+v/X8AmId0qV8w9wnO8/6/FxupLJA+sX6R0gGIeapuBi5jPeXOimIC71dYAhEwgRTm4I1bGllYUl0QsrXpSKtD26pc+PpzG90P8mcqWVc2/XqjzpCgRAg2og4PLyde5oe3hyKoz9BsGRUJJ0tBtgKVEIRHMn/vzAvf75SK7tpA2h30iaz8UmCa2G+y2Z0+qLR8VJ01Ho8R3w1Pn9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfeP2EAK/eYHRAkZk6l1P7GEt680t/6bn/WKH37aews=;
 b=HRuQW4xLWyBrAaR0xd608CHkvt5i4qkla9au9rNebHq4ginMDqyTfaqexb04RNRRIqnllvXIMmjI3WUjGqnqAtB+X0lFixcYv3tQpwfxInXsc3QoSE7Xw2eZl+ZcQFbAhBICz44XpMOi1cTBmVp37Tv4ydbOO2bwXEnykjCLcIhmtH/yCQ+YxHFualBplKmXyn5uD+KBrrajxAx4rXgQv9APlJ4ydItVk2ZO/vc6IecqpKJfK7+CtGMDtuvWFs4qeQXIzrmc0bxeZUYPyMg7JPH60TM6rck1GAxfoezEJheBkMjY3d+cgv4tjFqEwMHgiJqRm3vzmUrkuew8z7456Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:39:56 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:39:56 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 3/6] dt-bindings: usb: add Altera Agilex5 DWC3 controller
Date: Wed, 12 Aug 2026 15:32:56 +0800
Message-ID: <85e52e1dd400f39e055196fa1462337285a9b875.1786518803.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: acfeceb9-3803-4a03-accb-08def844e794
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|22082099003|18002099003|55112099003|11063799006|56012099006|3023799007|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	KKRY3ItZSh8gj9sZEPDSjmadDBhz3PSobAk33zb8QMaLFvXHlEd0UCcSz+ndxMrrp16Z9C7hgNhsBYJV1PUhZc2Cai8nXCefLy5yvvhOrgMoeRnivJhWwUpG3qpG7G4hsIg1ly7LKm2n/2PpwcNSsYafB7ESk17Hlv7aNGbiFqI5Vgo8eZQF1yOlpi5bQnocvPk/hITnrqhpytDf0A6pEVLyW2GNFaBsDtbBJWM9kseYGuZfFW+UmYX86Oc1bdQrVPbQSFCir233mupJSdzSQzqPA9Z+mnXONRJ/QRlceO9YjjJ+D7NpMI7UokJITM1Pk06IEKeuR3IpdyBYpKgRUEU/nSYyDHi5VAN/UNjOkFZjO7zWZXUXPLQnEGZdOqU1Lg1IlTeeJZbiw9BC5RGOu1XIIGhbPAQy+vk6H/lak4Ub+EVTlb5OvlS5g/OWnROw1mM0qkdgYYprtNyB/W9DUpmp4Ke7rNhWVHfHhfeHBknwgD+/6KGiTqBz5GNfkGzmJK3QHDk5lx3sSJ/qY+vBuh1XXNjkpGCTKJDWUMyD0RXwjgkgFOBkzSFVWbfwc0Ux5iRWp67NJLqy/C8Bqwq1HEKk+Mq/Mdyw+uCruwXbbknN2yIeEaF2EgWcTcrqpJ5ZaVbvccqVv9EVuMWL78LjFzoA1A4wrwjmxqbE45OWCjA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006)(3023799007)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LW4aoJoTcUY494LwhojUQl1rPFh45LAU0A2YJam3tXdexEbr7KB8VUjMDFD+?=
 =?us-ascii?Q?QOO0w6F9/s3PWwxakOxN3yZdhm3IjCnm5RsHG78N1EtkkrR1jhXuVJfASfRm?=
 =?us-ascii?Q?OofGNZcSKcOAqkK3zDVs+rsrQwueiwNL+xrvFfJfu+ag6J4wrXuR5dNUQIfB?=
 =?us-ascii?Q?ZfgkDjDmZFYyC6RZwrXZJ5Jat4YWK0IknUJC0yXMIf6QUHYyZ7cwNah9bvP6?=
 =?us-ascii?Q?jcoDNISLqcMx26KzeHt0CyvbTB6pvtyiLG+vKizNJwZzmZjLByJj3omo6QC9?=
 =?us-ascii?Q?x/SVufpHrDxg53AGWpC/MAg6yqCViLgSNoRbS+fNaRWF5bTf+XJA5gpXQc2D?=
 =?us-ascii?Q?7tq6llj68rwSKmW2urBqMw9a5rdId3sin+JHkjau4FbSgTxD5swxRSagmpEp?=
 =?us-ascii?Q?C+YKVhZ2TJB1fIDBAEgYUAqkIppHq4DeK/17V3G8Uzcn+YgXMUUYX5tebvEm?=
 =?us-ascii?Q?RsxxvlVrLIbzACZya0Y5xg9HHCW1Xuyeuv3ZFS0voPBhEYV1TqAu6HVZOBkX?=
 =?us-ascii?Q?d2mvgxaGH0HPg3hSU491QEk5Dre6oKlR3Hf9tFxnKcDlHTLjO4a759BSrNO3?=
 =?us-ascii?Q?Z2yyIvxAodO/Rhh2i1eD1H/SJhusIF/KVZt1+MnMPZohMsKfBQnNL8WsfuFL?=
 =?us-ascii?Q?nG69Z250Boml9oph7zFSTsnTSEo493yCEeEGIBkhljL5twjsDDaU5em+MO5c?=
 =?us-ascii?Q?HAXiODfb04OQPKUbMjcUHX/3WDTkO2nH2RWa8Pz6pkPhZ3lvQQrqXH8RkuJ6?=
 =?us-ascii?Q?QbGuAl5YWmRElQ2S0Tof+MnRyNFt0pStRYTDnvLhsS4OJHteNM2ElRL6eS/m?=
 =?us-ascii?Q?7J+wkj/HFp9MSIvlKIxgpJK60KeI+/N1kJ8mKUa1vFfz3PXtUYt6JE0kITOm?=
 =?us-ascii?Q?MeDeVel7imkuRV+AqLfM9k/rN9Jhf2yKkfpII4YbrRS1iLtQ1DsmBrits4Vg?=
 =?us-ascii?Q?wmMjdDItolyvm1uczlM7Ehb1oK3YQurm+W/Pw5uoTGNfmN97a4F4rOarkTzb?=
 =?us-ascii?Q?WxwXPzTAAgwcx8o21ZSg7H2n6e2EiUrpRLzZDsYcXnB7e20iMlsIE9yI6sDZ?=
 =?us-ascii?Q?uS8jMOkr82T5zo26docgEHlzr8uV2OunXFt+WfVSK6CXoRlnYZ5krSiz6BXV?=
 =?us-ascii?Q?Htdb739Gas5kxDwm7OPOcNW59XH7XDzEmigw4Oi8aq7XUKcCygjhJoMhXL5p?=
 =?us-ascii?Q?yuI2QjB/CbLtvLkd0R4Qw2nok5jjLd3wMmOT6hYh3h9nwwnG/XBZpEI1qEHi?=
 =?us-ascii?Q?nuzKEoqZo126aioHPor/hgj+Dr8WZqcuNizpx+pu0zJjdikqu76UOdEs9ftj?=
 =?us-ascii?Q?wbyg35fR3/EL8lDEtaprWDhSac+O0S1+TnsQlPLMNS6CV3gLF6zwoDhyjCm1?=
 =?us-ascii?Q?JZu8FJQqzlW426Mhv3nb7U7PbeaJagf2j96LgIn+GtKK46YjE2nqbkuqgM+4?=
 =?us-ascii?Q?bzcDnTP37eYKGY2caa1hNDZwLziQ3JCGeHUSDt45aww7ooOpAUAkvW2GS2wZ?=
 =?us-ascii?Q?7ivs8gWYpNB0PSQZU8adC7cRgDtUFuUIF8aMyxgY3UcHMgiRUt5POuQQNFgk?=
 =?us-ascii?Q?uaeqSt5o7b2/21Xm5mfC9UH6YeFtPKXJO/eQQAWfD6+e10iq1ByLS/vGG9lg?=
 =?us-ascii?Q?joqXeR1+D1lPBl+v1p12bn09FJ/X4hWP1EcvhAfRT0nTiu3x1ZltRBL6smBy?=
 =?us-ascii?Q?hPRgvsa+Si2btwUB4fl3yZNFfmnVhXylZ1MatwQphY8dleRHNIrLjNp08sQD?=
 =?us-ascii?Q?Uedt+nbDUOQnl3wNdXCfP7WWnYeEQn8=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfeceb9-3803-4a03-accb-08def844e794
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:39:56.3699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ultdP4LurnBJeAmSe092TC2rykQJcjXcyu3tDILu6nsMEE4TuVRyL/DAUPcRzB9mudskSKJ0T3EB1pnAlb/Z7/dJvSOJXYtAAMgf3eq2w9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
PHYs, and optional IOMMU support.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 .../bindings/usb/altr,agilex5-dwc3.yaml       | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
new file mode 100644
index 000000000000..8a815e8a3b7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Agilex5 DWC3 USB SoC Controller
+
+maintainers:
+  - Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
+
+description:
+  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (DWC3)
+  controller that supports host, device and DRD modes.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: altr,agilex5-dwc3
+
+  reg:
+    description: DWC3 USB3 controller register region.
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Controller reference clock
+      - description: Controller suspend clock
+      - description: Master/Core bus clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: suspend
+      - const: bus_early
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 2
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    description: Resets for the DWC3 core and its ECC block.
+    items:
+      - description: DWC3 core reset
+      - description: DWC3 ECC reset
+
+  reset-names:
+    items:
+      - const: dwc3
+      - const: dwc3-ecc
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
+    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        usb@11000000 {
+            compatible = "altr,agilex5-dwc3";
+            reg = <0x11000000 0x100000>;
+            interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clkmgr AGILEX5_USB31_REF_CLK>,
+                     <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+                     <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>;
+            clock-names = "ref", "suspend", "bus_early";
+            phys = <&usbphy0>, <&usbphy1>;
+            phy-names = "usb2-phy", "usb3-phy";
+            resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+            reset-names = "dwc3", "dwc3-ecc";
+            iommus = <&smmu 7>;
+        };
+    };
-- 
2.49.GIT

