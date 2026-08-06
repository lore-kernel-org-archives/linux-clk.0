Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29199432BCF;
	Thu,  6 Aug 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008332; cv=fail; b=AjkDX8OtOVUiQ3IpZFtD2e+WmscOURauywU9xnQsnjgIUuOL9ncrhv7yfvrQyxcI89JqRi7zqByaIvK7kuPzUYrY0QLefUibW5v49XxttUYjDkLKJWr5cyWiO22lgRtl6ArrG0x9CtTzHXcEG2Ypsg01r0CdoBDS2rasFRiJNcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008332; c=relaxed/simple;
	bh=GQ5Emu2XOHrvAH4gscBlwXjjbgaVkJ2Udc+TK5GwfHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aNmplCaq/HZayLYAUUILC3eQzrscwzyCsBZ0vYlay5p2hTKyGKNrwLPPSNdf0QxPWMc1lGb7vK17Af+9cHYIbLs00/wHxqoekMmusLV8ZHtovjFYcwHoguJG77/puqC0O3DOIPvXlZTqrBJo88tpSZTnVkKq7z7Kab+NuD3MU40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hX0uajN2; arc=fail smtp.client-ip=40.93.194.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hX0uajN2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9p7+BlLGvS8KS/Z9GRIECR2ebKwx9F1O8WEFniqVLhRLEIJzkAgG3JgERlCZn2M4jMPbMs2RWBd3BGzBxZJaq8ljmpr5bzpmPK3s6S9Q4Q5TJktk8eUpB2VdSeyoj8FPbzPOIUULwyPF3NTxoBJe0Z2LeD1nBZDRaQ4u7VYdSXQh7AvofnroAHpm9aXSILW0SoHuTYaFvX8c7E25axDqr5JE3Why/gMhsn3tWw9T05axBElpv/KhX7df7TH0a7UIn5kJB72jgXA/i/xcwsFGhZismNQs2SzdYyfJ9G08Klx0HHqxP+oYZU5xkYyrnqMdvCsii+DmAjubqofPktevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9Oke99pPJVE2JHnglGydOJJjemkSOCZO0mEbqUb/pM=;
 b=jI3Z7QIZCvIAdcYTGkiGl1QwPMbv5ZIrW0fcrpDpYl1m7xJsWPZVmheWAsXpuEd1zCmKkDAwvEezSx3zYZ5CIay7fxYdngfRrwk+WcNiF8DZxEFT4f791+Cgei5++8zuXzNWrorQ8+jwHvhojCEz08lVVXI9T23DO3BN0wlOAuKWEZyiIJXqsQOyfahL+8j80OiK3C7u6p/8yFdHUCn51zmuqPFMcLyKKxuD2U+dG71e6buA13sV6k/I5tIDn9/QOWeYCoMHMBfQmg/AP69bon38qhswIqkAbl1uxz8gDax6an3f9xbkwoe5FS56kNqc/+ZDsDoV/220mlZ9xCyJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9Oke99pPJVE2JHnglGydOJJjemkSOCZO0mEbqUb/pM=;
 b=hX0uajN2Hpm0FgzEorFvPk32RcJtkc2wzFLU7AQSFQDFZ188kqc3TQFfmMdIrsgiu27q+VmU9mCU+lyRvLQUqbiolXTx4H8CKG+9t3l5yPrhZbsoszDjykT0YV0dWpJzjJeASsp511BOmxIvYRmQhA2VgARXE8zIWHHvZDVyELj8B6i8Wizf+6r6CetlnSvcFiUKVWpMTNEsNgSsk0BPrQq1pyAQs/UI6EY509foIouCX5HWJ79ZcrH4EzAufLFGbAUcy3fweA/YcbzeU19mLRjgGAslsM7nG9kBex0pm8DMtJxFj9Q1w27xw9HgALhOyU4Ozns5m+xgQyp+UK4y3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 09:25:28 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 09:25:28 +0000
From: evon.chiam@altera.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <bmasney@redhat.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: clock: altr,agilex72-clkmgr: add Agilex72 clock manager binding
Date: Thu,  6 Aug 2026 17:25:02 +0800
Message-ID: <39f067c31125b43d9d4ee92cd02828e894de3f45.1786006669.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|CH2PR03MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 93602e6a-cb0e-4f31-779d-08def39ca763
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	130x+vzvGjDX8PStEuTpzV5744C+4rBCF6fdLO+z7Iba/hFMld5GIHWnAUjWvoHBAvlvgwXUIZ3/O0RnqCHlWe4Fxn2MdWXAhBmUUC4qxOFBsvDq66COPRvNbhaxu/C3NxtkvxBSIX/ycD6GEHcKwF1xegmvUQ1pkLp/Fb+/66BeDEh3DTa3dYfzkkWNd37QA/YvMxn7csin2EiMkl05vFUhle2H5QaUFxd117bzcDe7q5mCCXk9sDOtR0sIHhxc1/JHric0gGdsqtsTGMJwtDzpUldJgzmUWIa+e1GtnCPz3nZXoxVDpArnQ2GDaHN8bNJisBp752ury7/rfIAlTMOyl3Yj6/7ar6Ee5ORD6z5z+JgK1NkGmZnmx7Nabm+d22ho1J9+g8IcXRHAF+l9TIV2LQNIH2SfSih7h0dmlQdGfp9nMu4RsccWA5d85yWdraxukeIHzwprAYaqeiPqkkV8PaKsnTT12SaETjODUhauELXfP2yGPHEWDoNqZlTYjrmlZodHzoeSf5SKDklHLYG07PPOBBjXQ63fRSuZ+2HYibFUa54OcVYk0A4k5y7qM38gtHWJbwQkxBq93wjlqiuMrkEg0XxJPzwKwPYxfqT6cbesa9sVgFiS98uWCOIVuuLHziagBDBdqq75ZZkqGbR5c3YMs6RTONntAgyStN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pPObvnCMZGJlg1NI3Rk2YeMIvIQOFaiO+/HkEfzJ0tpMuwCHIeau05YoPMeK?=
 =?us-ascii?Q?hR/B+goeH3yrO+S5pt080KuajGWu/OZTt6DBH/Iu3zwX1AUtRPHYtjm0oloE?=
 =?us-ascii?Q?+hsuAGRLWfQ6n4pTcD7z17VCpPQvxBUtFjx2JRc6agvOKY9E0QRKaz8gKTu0?=
 =?us-ascii?Q?HHCYLyob9R2Ooszsk+Pk1RLaXb5Zo/TZQPdE6JadEwDNsoY8ArRBm2zsAjsq?=
 =?us-ascii?Q?hpGJBzhWJnKCY42oEbhEoSui8PTwQf0XoW7caMeNoBDaTsnk869QFBOPF6GJ?=
 =?us-ascii?Q?nR8CmykwrF5anf2o2ISEmauK1zOeM9587jfQoKn+SZIvJJopFVzzHyrqcIaF?=
 =?us-ascii?Q?i6F71EoQREVnJxTK2sm6jZd8UnfmxlMrWFAhK7TJlC+0AXEztqJsqfnaWwOK?=
 =?us-ascii?Q?kfQ6ipPXOVAnvIq/HiUulIk8i9lQ1ZTFn1PvPl6dGqMjl86USD1wJWorKpk9?=
 =?us-ascii?Q?+XGfc4TXJ9v7amuoGJLuG9KuGy3hna+J7zQHqWkKDru+aPes53ilmFVRzFdC?=
 =?us-ascii?Q?1Xwjzty8MdEUwnudNq3k+GPeRWpEn6Lk9ZpJSJcb1TL8rc2CGtKZCDdYiSnj?=
 =?us-ascii?Q?ftgYgeX8Fd76VzksKR+6v6BGSkfQiVRsAUk/NDqh4poX0Vs94tCwIhsk4y29?=
 =?us-ascii?Q?RNIQvemEqWgUYgLD2hGRX5CbH4AopaySWgbVCWIqketMxCrh2OsPvMA9PX89?=
 =?us-ascii?Q?iZi4DCZw2re/HUYIaXAzzuU5zfZQQiG4Ra7fK06SIdvBJfRUjGjKVl8Lw7Dl?=
 =?us-ascii?Q?uAHXTtLtizRC+TsgtFkpO+fcy+LhjkCo+CVwPcvIEd5dQ3Shx1ApZh/8ea+z?=
 =?us-ascii?Q?a22S5CT4SmhYzt5aH1H0bim3VHOkO3/h9zYKtVf1Fa0jmS7+YKQ+upokOm6s?=
 =?us-ascii?Q?C0/ftX+LE4HBYVOGz/kw8Bfpyb/heFuLWr5IwZkmuWN27mzChGF4fZucF+bj?=
 =?us-ascii?Q?tVNhyWN+h2h56PZlD74ZEWmBTigLVKXakSwVdvgIYOq9OZ9iqULj+fdvI77n?=
 =?us-ascii?Q?tYXn1PnFUBwqLjM6afwMhs0Hj77KvjLGJUqMFmV0XqSqqGJbLqCVw7xbVIx0?=
 =?us-ascii?Q?1F33yH7niK0TEjGgdgHZgH5Gi+1lvMaq78C7pn5dQCBBiw31zOjNQybOJcVr?=
 =?us-ascii?Q?kPg429iUGH4jLELTbR8rK3JN56Gbpnf/allVaKpJo0cy98cXTvW5m5hZSrwM?=
 =?us-ascii?Q?PU7WxQretMv3hrdRFewAtroI3qz76e0JZBMxhrApLb9fA4DSDqjo9+Wefr3I?=
 =?us-ascii?Q?JCY+lRQJgf7IA+bjXtgdzmTa0UxdGTTh/adON7JemlPp7+K351PhWQ3jyMyw?=
 =?us-ascii?Q?uhQrsNHHpqL6EnV5t9RvXbmtnKxHDU3zxa9HjbYHxJAg/Jmu0a/4P/Pt4ENh?=
 =?us-ascii?Q?e9tAw4t/gfysuTv2UsO1uK8oh9dCLqr4yI+CZyCI1P1WYhOp9ihBuFTSJCxh?=
 =?us-ascii?Q?yRnw+85r3odjLo73TMLsf49a10hnFaR2sibo+5DAiFcI+Iy3kQKoxlcaqYJj?=
 =?us-ascii?Q?2nLaCwwxz+a0ZRFuGZYhRU3QIa0bzbQkWFygU5Ao9wPuO9A2Nk9AsgSWoTaf?=
 =?us-ascii?Q?DS8T7axraBSIvYPvQZmWsreCKYfLCve7/NLsNbaaN53qYzeKmnUFaAdOG2vb?=
 =?us-ascii?Q?T0/NTn6NIKelq1+UD7aPIubANzNAcLfkvd6aM8IRyRMfHEGxfS5XxjMDyAVN?=
 =?us-ascii?Q?pbPfdme0kFMlI+KB4Rnlr5yFO9VJsLtLCIh8RpCrso/YlCzZb6XDyEoSK7zH?=
 =?us-ascii?Q?7T+/xK3vWA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93602e6a-cb0e-4f31-779d-08def39ca763
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:25:28.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYcEJulSzhc8eY8UuME+/VQza86WNgE3m7AO9ItFrkOBTY++X0wRhHRKZ5NsTOWOEVoUDf7r1aPkK7n66JiM+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5285

From: "Chiam, Evon" <evon.chiam@altera.com>

Add binding and clock ID header for Altera SoCFPGA Agilex72 clock manager.

Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
 .../bindings/clock/altr,agilex72-clkmgr.yaml  |  86 +++++++++++++
 .../dt-bindings/clock/altr,agilex72-clkmgr.h  | 116 ++++++++++++++++++
 2 files changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
 create mode 100644 include/dt-bindings/clock/altr,agilex72-clkmgr.h

diff --git a/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml b/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
new file mode 100644
index 000000000000..cb063981f019
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/altr,agilex72-clkmgr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera SoCFPGA Agilex72 clock manager
+
+maintainers:
+  - Chiam, Evon <evon.chiam@altera.com>
+
+description:
+  The Altera Agilex72 Clock Manager is an integrated clock controller, which
+  generates and supplies clock to all the modules.
+
+properties:
+  compatible:
+    const: altr,agilex72-clkmgr
+
+  reg:
+    items:
+      - description: Clock manager registers
+      - description: GPPLL0 registers
+      - description: GPPLL1 registers
+      - description: GPPLL2 registers
+
+  reg-names:
+    items:
+      - const: clkmgr
+      - const: gppll0
+      - const: gppll1
+      - const: gppll2
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    /* External reference clocks supplied to the clock manager */
+    clocks {
+      cb_intosc_div2_clk: cb-intosc-div2-clk {
+        #clock-cells = <0>;
+        compatible = "fixed-clock";
+        clock-frequency = <0>;
+      };
+
+      /* cb-intosc divided by 2, then by 5 (total divide-by-10) */
+      cb_intosc_div10_clk: cb-intosc-div10-clk {
+        #clock-cells = <0>;
+        compatible = "fixed-factor-clock";
+        clocks = <&cb_intosc_div2_clk>;
+        clock-mult = <1>;
+        clock-div = <5>;
+      };
+
+      f2s_free_clk: f2s-free-clk {
+        #clock-cells = <0>;
+        compatible = "fixed-clock";
+        clock-frequency = <0>;
+      };
+
+      osc1: osc1 {
+        #clock-cells = <0>;
+        compatible = "fixed-clock";
+        clock-frequency = <0>;
+      };
+    };
+
+    clkmgr: clock-controller@915c000 {
+      compatible = "altr,agilex72-clkmgr";
+      reg = <0x915c000 0x1000>,
+            <0x915e000 0x1000>,
+            <0x915f000 0x1000>,
+            <0x9160000 0x1000>;
+      reg-names = "clkmgr", "gppll0", "gppll1", "gppll2";
+      #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/altr,agilex72-clkmgr.h b/include/dt-bindings/clock/altr,agilex72-clkmgr.h
new file mode 100644
index 000000000000..c2158ac75a4f
--- /dev/null
+++ b/include/dt-bindings/clock/altr,agilex72-clkmgr.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+
+#ifndef __DT_BINDINGS_ALTR_AGILEX72_CLKMGR_H
+#define __DT_BINDINGS_ALTR_AGILEX72_CLKMGR_H
+
+/* fixed rate clocks */
+#define AGILEX72_OSC1                  0
+#define AGILEX72_CB_INTOSC_DIV2_CLK    1
+#define AGILEX72_CB_INTOSC_DIV10_CLK   2
+#define AGILEX72_F2S_FREE_CLK          3
+
+/* gppll clocks */
+#define AGILEX72_GPPLL0_CLK            4
+#define AGILEX72_GPPLL1_CLK            5
+#define AGILEX72_GPPLL2_CLK            6
+#define AGILEX72_GPPLL0_C0_CLK         7
+#define AGILEX72_GPPLL0_C1_CLK         8
+#define AGILEX72_GPPLL0_C2_CLK         9
+#define AGILEX72_GPPLL0_C3_CLK         10
+#define AGILEX72_GPPLL0_C4_CLK         11
+#define AGILEX72_GPPLL0_C5_CLK         12
+#define AGILEX72_GPPLL0_C6_CLK         13
+#define AGILEX72_GPPLL1_C0_CLK         14
+#define AGILEX72_GPPLL1_C1_CLK         15
+#define AGILEX72_GPPLL2_C0_CLK         16
+#define AGILEX72_GPPLL2_C1_CLK         17
+
+#define AGILEX72_BOOT_CLK              18
+
+/* fixed factor clocks */
+#define AGILEX72_COMP0_FREE_CLK        19
+#define AGILEX72_CORE2_FREE_CLK        20
+#define AGILEX72_CORE3_FREE_CLK        21
+#define AGILEX72_DSU_FREE_CLK          22
+#define AGILEX72_CCU_FREE_CLK          23
+#define AGILEX72_HSP_NOC_FREE_CLK      24
+#define AGILEX72_LSP_NOC_FREE_CLK      25
+#define AGILEX72_TRACE_FREE_CLK        26
+#define AGILEX72_EMAC_A_FREE_CLK       27
+#define AGILEX72_EMAC_B_FREE_CLK       28
+#define AGILEX72_EMAC_PTP_FREE_CLK     29
+#define AGILEX72_GPIO_DB_FREE_CLK      30
+#define AGILEX72_USB31_FREE_CLK        31
+#define AGILEX72_S2F_USER0_FREE_CLK    32
+#define AGILEX72_S2F_USER1_FREE_CLK    33
+#define AGILEX72_XSPI_PHY_FREE_CLK     34
+#define AGILEX72_MEMDEVICE_PHY_FREE_CLK 35
+
+/* Gate clocks */
+#define AGILEX72_COMP0_CLK             36
+#define AGILEX72_CORE2_CLK             37
+#define AGILEX72_CORE3_CLK             38
+#define AGILEX72_MPU_CLK               39
+#define AGILEX72_CCU_CLK               40
+#define AGILEX72_APU_SYS_FREE_CLK      41
+#define AGILEX72_HSP_SYS_FREE_CLK      42
+#define AGILEX72_HSP_MAIN_FREE_CLK     43
+#define AGILEX72_HSP_MAIN_CLK          44
+#define AGILEX72_HSP_MP_CLK            45
+#define AGILEX72_HSP_SP_CLK            46
+#define AGILEX72_USB2OTG_HCLK          47
+#define AGILEX72_LSP_SYS_FREE_CLK      48
+#define AGILEX72_LSP_MAIN_FREE_CLK     49
+#define AGILEX72_LSP_MAIN_CLK          50
+#define AGILEX72_LSP_MP_CLK            51
+#define AGILEX72_LSP_SP_CLK            52
+#define AGILEX72_SPIM_0_CLK            53
+#define AGILEX72_SPIM_1_CLK            54
+#define AGILEX72_SPIS_0_CLK            55
+#define AGILEX72_SPIS_1_CLK            56
+#define AGILEX72_DMA_0_CORE_CLK        57
+#define AGILEX72_DMA_0_HS_CLK          58
+#define AGILEX72_DMA_1_CORE_CLK        59
+#define AGILEX72_DMA_1_HS_CLK          60
+#define AGILEX72_I3C_0_CORE_CLK        61
+#define AGILEX72_I3C_1_CORE_CLK        62
+#define AGILEX72_I2C_0_PCLK            63
+#define AGILEX72_I2C_1_PCLK            64
+#define AGILEX72_I2C_EMAC0_PCLK        65
+#define AGILEX72_I2C_EMAC1_PCLK        66
+#define AGILEX72_I2C_EMAC2_PCLK        67
+#define AGILEX72_UART_0_PCLK           68
+#define AGILEX72_UART_1_PCLK           69
+#define AGILEX72_UART_2_PCLK           70
+#define AGILEX72_SPTIMER_0_PCLK        71
+#define AGILEX72_SPTIMER_1_PCLK        72
+#define AGILEX72_CS_AT_CLK             73
+#define AGILEX72_CS_PDBG_CLK           74
+#define AGILEX72_CS_TRACE_CLK          75
+#define AGILEX72_EMACA_DIV_CLK         76
+#define AGILEX72_EMACB_DIV_CLK         77
+#define AGILEX72_EMAC0_CLK             78
+#define AGILEX72_EMAC1_CLK             79
+#define AGILEX72_EMAC2_CLK             80
+#define AGILEX72_EMAC_PTP_CLK          81
+#define AGILEX72_GPIO_DB_CLK           82
+#define AGILEX72_USB31_SUSPEND_CLK     83
+#define AGILEX72_USB31_BUS_CLK_EARLY   84
+#define AGILEX72_S2F_USER0_CLK         85
+#define AGILEX72_S2F_USER1_CLK         86
+#define AGILEX72_XSPI_PCLK             87
+#define AGILEX72_XSPI_CLK              88
+#define AGILEX72_XSPI_PHY_CLK          89
+#define AGILEX72_SDMMC0_SDPHY_REG_CLK  90
+#define AGILEX72_SDMMC1_SDPHY_REG_CLK  91
+#define AGILEX72_SDMMC0_SDMCLK         92
+#define AGILEX72_SDMMC1_SDMCLK         93
+#define AGILEX72_SDMMC0_PHY_CLK        94
+#define AGILEX72_SDMMC1_PHY_CLK        95
+#define AGILEX72_USB31_REF_CLK         96
+#define AGILEX72_NUM_CLKS              97
+
+#endif  /* __DT_BINDINGS_ALTR_AGILEX72_CLKMGR_H */
-- 
2.43.7

