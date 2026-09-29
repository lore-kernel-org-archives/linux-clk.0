Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2196B4F7CD8;
	Tue, 29 Sep 2026 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674805; cv=fail; b=VW1q9dVPkubB+7TPDP4KEON6Gq0hLnDNizi1eG/o05tk5cG67mecBFZLhsYNo97RUFkr2Jop4RDF/mqtxaXJnRX5nTSgTX6+pZR03T5rfng7o8XKs2pw5GG9yUzrU1dql7vZ/Y6F+Odu4EO6RTEASlxbSRWb3wJeE42AVW0SoD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674805; c=relaxed/simple;
	bh=EvYx3XX4hd0gm1Wy9mw0r8533V3ddIPVP9MqoJRGGpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A26vAK179eBF1x1IMkIf47+lZhs+mqJdNnegQgqrdv96D4YRqjrPQnMbqq66aOHjbMjQHkFoCP1r9nGRm/n0vFdWDhf3rzR0oZxiVYuT3FRnBBrOY10zXGFjCyz4vN+q3mJPIvZrTFFJHVZOmkF3oYzMbHdlneVisTZedrjriew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=bDRt6muQ; arc=fail smtp.client-ip=40.93.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="bDRt6muQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHeusK752zL+I/gn0QosTv1hoILSaPw2uo51ygXfgbip02ZhQVrvhmrEI4P5HGbgvpO7qj1PQqj+t/j1tXJgjE+Ftw9XAKkTD81LSJziCQgfTkRTePrtpczdz49CbS76/7aVRDHX4fQCsq2HtSqpu7k3swdhhoOOIF0tSnJWfluQ5MqDiJbir7UQZgtdkhNiTIvD2k735+4VEAvDi1GKsqEIjWKodRO/yxJBQaWKlAYJVrNd+dNYV2X82BIFYYL58VKfHesA2FhylmXJJYTYnBq9bOyv0eIFu63hKum1OPESqTvxMswV0BgKpOp6xyXDsYKmoCK0h2UGSdqb9awZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYsu7OyDknx9dXuPUwbsfBRLsDEBKwk3+WCZGLFC5dI=;
 b=Du4qs6iBDQJvK+Cg9bGvI7yVEQZpQcaGEwvSFPE0E+RMTHV1Xl6vVH13kwGiQFP2EYhl7u9lgUIdhWeU8CvOD9PKeUvft2hTKz4hKV3/Y/L/l65Fj827a8/pixUJMOISpw21w0aXnbBBwMhJYVk+LT6Rov4YRopfmkK5LfWNJStvubCPNmViq1JsMDSe21NOlHG4fhj7fDCNltPqHCVm3iaCQ0U80T2Q/z3LpNlYY0PocGFpQVPGk4sIIiaqjaW3YFvOa6OPYSr/0/bdw6jJmFXfkOEiTQKQbMcVnuLvBxtvGz1ApoQNUloOMLNBxDQizV8gAnI7WVMyTOEtr0kL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYsu7OyDknx9dXuPUwbsfBRLsDEBKwk3+WCZGLFC5dI=;
 b=bDRt6muQkthw1NYX4SFoWsjdBq61fsmgSsulJtBCuOTZD70dEgBbAPQSj2Lny0bc2SF0NK0fV9Wt7zK6DXRbLwYCLZFXEKQ9+Bz5nNhVvVGmWYCzQMxF8mxNBNNfAuVVOIm8BovobTneM4p1qO18mJmM1j/EbjBEJFzWYIY0sSihi27MsCQ88ZhXghmpKAX/E85lhC7C0VCgSqepJvwLdDc52iIObsogdfxxJafN+VpT4BhxUlxkMS/YU1uxsHgtOP+8g+q4zGJtI6tZcT4H75vBPVLAkOFlls2Xj286AgNJIgK02Ks9bTOOKZMwAw1aFEGAk4IxjrBdNQjSH8789Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA5PR03MB989108.namprd03.prod.outlook.com (2603:10b6:806:4d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 09:40:00 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 09:40:00 +0000
From: evon.chiam@altera.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: altr,agilex72-clkmgr: add Agilex72 clock manager
Date: Tue, 29 Sep 2026 17:38:12 +0800
Message-ID: <db3dd69fc666cca536488a75da122ff173995030.1790651166.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790651166.git.evon.chiam@altera.com>
References: <cover.1790651166.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA5PR03MB989108:EE_
X-MS-Office365-Filtering-Correlation-Id: 793268f0-cc2f-4ffe-0e84-08df1e0d9f68
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10067099003|11063799006|6133799003|3023799007|55112099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zU3fYkOBKChKptO8+b5OqgNS6cm5tJXFlnRJyZcJG03LdK8FjQwXJLX+/FsceUo5R0q3Bvjseuld09LkKvPndGh0hNwoECT4+bgKdAc46XjBxqAaN3KLfEx85K3gJPqamyQhltiJag16tqqDoXKZO32O0DioFyQhxMF7dxIV3f27grJMN3ndMyTpBzZZ8uSbGUypzdjDofYjwE4pcI8ptk8GQu80r+niDhshlZF2NuzXGn7jxiPMqe1gbUPENDZhaq5lWRnjdC3bCZ6ggqBtDfKN13HjG1OCRyx4qJDUNG/PmaxMcqHQc4oDCHwFCq4jW7vFyfx25wdCxsLnUTZ2yQsPiwtFDiKrIAiU4/0Es8X+0Ut44lPMgjOVqjI3w3Zs4lZefIb3ctS3ZE/VBkqo8pQ99UMOwS/pe4B/mG6OegE4J/y900yoh2xWOg38BLkLIZ5F6oUmtsv8Pm1bd/TrqUHQtTogzV7sSKiWr+dlUVUqtuY3AMGhu6LhJgvPF0LTp8jG/6k+kMOAqJWIL97toddoCS5cwSc9Mi8lfIdIB0Y1WQnRNx52uzzTfG7ITRdz9z79IuxNWM+MNV+nEns804GzYu/yt/6UwaWc9iDWNZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10067099003)(11063799006)(6133799003)(3023799007)(55112099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9r8nPVFmSF2ZHCH+tTGK56L2ouAxNI2I5r/LkSecUz9ge51knyOzQ0dLFxcH?=
 =?us-ascii?Q?MEqrb4/ma5PXmrda0neMpb6yG3J6K81Z00cRNWYO+vbcqIu+qSg26HEbtgQT?=
 =?us-ascii?Q?0/grbN6kr8ycWJ4eIYJCJo8WHvJ7/tYWZOQVISdQR+U4j85aAKoR9wFZU7ec?=
 =?us-ascii?Q?8PhzOPs+AhotGPJreyHw+5hi+hJvPprYQWycvfYjImLT6u7hcpp1dvm0XRp7?=
 =?us-ascii?Q?Wvr+o5ien2+yKmpp2LHTTFb4YXqwFaNwTMdmY0rni9TDhNGJ+epDuIefKmvw?=
 =?us-ascii?Q?NANj9jpx8FNj5paG7R8/0DwyqCuyqAYDaZNC4LoCvbXi/Vn97zd9qS/Ro7cQ?=
 =?us-ascii?Q?vpbHvB7KAzcLwOAcFDtofXq9ZvCoUrtQhiN5arAJ4tcrpyxlCmVb7yY+z1En?=
 =?us-ascii?Q?9wDIMeeJQnKy7FvFBMTMbqr8TEVUsontTb66L/7QaChj3X6bqmCEJY88bECb?=
 =?us-ascii?Q?tJYeRpGvXv0wlzqAYQHRRkd0O9aah0ZR3dcHsFR0xwnNg9KUf8HbjPOZLgEO?=
 =?us-ascii?Q?oj5LMHONKc2KTmvbM9Wpu0kTEX+6KMAACz+fR4bYcPe+0ARoglW1pFzZAmcX?=
 =?us-ascii?Q?OMqm+nz2Wdud4FWZxHy2WtDc4wAydeS3Dd34KlikNZTcDLOwiX2g7pNhvU6q?=
 =?us-ascii?Q?Ns3UJyZSkvwskcdJxcfFT1Av/dkyCuJjKwnqsWxIfD5v/ESMSPi0APmS2owr?=
 =?us-ascii?Q?Wzs2vVqGCkKXeMYLIIEB53nshdP/Lm35QbzTZCkV02JjemWvkeMnXNujue9N?=
 =?us-ascii?Q?S5v0yJUr6IvP/pKK4MjcEOxFlDNmpL5J528W9c7y4sTYm4x9wqzptqaZx7Zi?=
 =?us-ascii?Q?zYpDw78nlXwcBc/yl3EEjh7gZJrQpmmmLLQEnrE6U0kaeRa+00yR4dSuhxmG?=
 =?us-ascii?Q?hFYE0w41l5mklswOZgWiHBG1wHzBNjdl5gcZ+jIUWMU7b4bMaRZ9yMV4Mk4S?=
 =?us-ascii?Q?vkI7B1uLBnElm1b1IjukgE1JJdqN28CoZxbbXBpe4wMVWSOAVS1ajiHzfd41?=
 =?us-ascii?Q?R36f3FbqlEpNpA/FAvPln/m4qF7iH+lSlHraMPC7yzyL2yl4jYZ3ZFQxopdz?=
 =?us-ascii?Q?gmswmfHvLfPVwUqeFf3RKoiU+fIYyrl88mhfsJ7DbfCko9FtF/8y1elRj6PR?=
 =?us-ascii?Q?6MLWulNje+e/Jz9SG4b7+Qda1R1gn5zyj6lo+Fb+rrD0qRM9VVJz7zYTYBzP?=
 =?us-ascii?Q?gH1ENfdqVlGkvvpSspPU1TRu5KUmK78xEWSBPeL1E5atRU72Ftd1hzcwdTmt?=
 =?us-ascii?Q?vbiEeL7FEFeSYjA4mOL0vhL4gWh+JVrrHCKGGO1/wzsi2kwDa+II13gzTqyb?=
 =?us-ascii?Q?5b8hYFPZUOoqndtMEiTPDaGrtDqughjnwOi0BObakgzz3tNe0oOh9BiWI1cE?=
 =?us-ascii?Q?/gFogACkKeY4u9KkrLVzBZ6+vQppocyNj2nB/WCgfgUcBjWCn3ZdV7KRmhEC?=
 =?us-ascii?Q?PX0cBwiXiFT+bG3vZVxcfUVzezw3AxpIuVnQwCLRRiKnw6esbjMqXL6AlIKo?=
 =?us-ascii?Q?MFHo9u4B0QfDBU469T1PQGJdjLeNnkOSilYshjqaDcky7mo+kKETtnPOQymj?=
 =?us-ascii?Q?34Mfm9cOD7jLt0/O23UD6b+bvbzqWsg2/OeBXTkDybjfJf1Hg8XV1/d781W0?=
 =?us-ascii?Q?+zvHKk5bRtqhMI/cfMUq71PITg3lmo++eOT4v/PFfN+v+0vfMA0k+Q+DAThg?=
 =?us-ascii?Q?DPWSon4vKyDL6MWbzew9DkdYnM7XoszXBgN0WVSpj8fDj+7m8lmu9r132Dcj?=
 =?us-ascii?Q?C4QjXPwAoQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793268f0-cc2f-4ffe-0e84-08df1e0d9f68
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:40:00.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w29feHibwtWuW88ruVROrPAuKpzh0FCYN1hX0mKmEcesylTNRDA7Bu2I6epBbUHhOr+xwp7RkaJh0yRh7fm9sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989108

From: "Chiam, Evon" <evon.chiam@altera.com>

The Agilex72 clock manager exposes four register regions: the clock
manager itself plus three general purpose PLLs.

Add the schema and the clock ID header that consumers index.

Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
Changes in v2:
- Subject: dropped the redundant "binding" suffix.
- Reworded the commit message.
- Dropped the external fixed-clock nodes from the example; they are not
  relevant to this binding.
- Dropped AGILEX72_NUM_CLKS from the clock ID header; it is not part of
  the binding. The driver derives it instead.
- Added the clocks and clock-names properties for the four external
  reference clocks, made them required, and used them in the example.

 .../bindings/clock/altr,agilex72-clkmgr.yaml  |  76 ++++++++++++
 .../dt-bindings/clock/altr,agilex72-clkmgr.h  | 115 ++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
 create mode 100644 include/dt-bindings/clock/altr,agilex72-clkmgr.h

diff --git a/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml b/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
new file mode 100644
index 000000000000..61fdc36bb58d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
@@ -0,0 +1,76 @@
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
+  clocks:
+    items:
+      - description: External oscillator input
+      - description: Internal oscillator divided by 2
+      - description: Internal oscillator divided by 10
+      - description: FPGA fabric to SoC free running clock
+
+  clock-names:
+    items:
+      - const: osc1
+      - const: cb-intosc-div2-clk
+      - const: cb-intosc-div10-clk
+      - const: f2s-free-clk
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clkmgr: clock-controller@915c000 {
+      compatible = "altr,agilex72-clkmgr";
+      reg = <0x915c000 0x1000>,
+            <0x915e000 0x1000>,
+            <0x915f000 0x1000>,
+            <0x9160000 0x1000>;
+      reg-names = "clkmgr", "gppll0", "gppll1", "gppll2";
+      clocks = <&osc1>, <&cb_intosc_div2_clk>,
+               <&cb_intosc_div10_clk>, <&f2s_free_clk>;
+      clock-names = "osc1", "cb-intosc-div2-clk",
+                    "cb-intosc-div10-clk", "f2s-free-clk";
+      #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/altr,agilex72-clkmgr.h b/include/dt-bindings/clock/altr,agilex72-clkmgr.h
new file mode 100644
index 000000000000..eabdd7427c43
--- /dev/null
+++ b/include/dt-bindings/clock/altr,agilex72-clkmgr.h
@@ -0,0 +1,115 @@
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
+
+#endif  /* __DT_BINDINGS_ALTR_AGILEX72_CLKMGR_H */
-- 
2.43.7

