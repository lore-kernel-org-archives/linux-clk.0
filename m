Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03865C12002
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDD6661186
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhGSF1b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:31 -0400
Received: from mail-eopbgr60088.outbound.protection.outlook.com ([40.107.6.88]:27827
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhGSF1b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0i4O8YAWDoZb5Ijny68GcX1PU1YF/gmwnXE0/Y0CzgPdOvYxmVOgu6ZaIv2k9tAUMG74P+2O6cjNL/pDkCIrX0xdcB7fPVz2L9gEKtqpdbV7RCotDQombrKBoD356QrbxKBgka3A+N/ZoMv07rnCe5UTZ+E5nGhRIvo8lwBc0DpWOiKdlILwVnLso3LgJnyTk6PgmnWn7+hyF/wY2qCGJQUwhzB82qcInDOj8w3nXVoIg3ZM8EHuFHP9DWRRYEr0c2D2bLQJo4FMoN6KklYqEXJ/HfmFK5r+Gg7mdraN+WIun5BQOcshX8IsiJ0wZ+EC3GHnX27HWvXIjofcZ2ROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhpj5EdJKpNmPzMIsQDIjmlJQDWLwQXXZ2EDi8mjv68=;
 b=hUlciFaVlyidP9PS/NQg/u990+SUT3CcAebmEmhLprjjKqTwx3e+k26HTCqAjQFiH8S98HVBo7vfMs3dxvRy+TFQLBVsRrSsj9ONnAMX+Afx1SO4VIDlAj0WVLSqZML/uRzm55hg9AvWiy/2pBfBhpCBeozIxy0KtDuLzzDErXFzrEEBWMUUgWqzxIdc5bKTvpnYLRbPD1SBg0EOiB8mX/erWdq8OyQu7ZVH6WD2ssWe7nPpvlUoxJUnQpG7MSGk9ftyXVgzeynWIADujfsfID4J75fglElSvOfS6Et7IT8LTyNNVNow52/ij+QPzkpLadGDkslZOdN49rnIRzzWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhpj5EdJKpNmPzMIsQDIjmlJQDWLwQXXZ2EDi8mjv68=;
 b=blKNMwjy+y5aZ1k3oWsrwMW4NoH3iSumyone7RP2B8ep8pg8T4ewRyiwmhjLlrVzrRxyT1fZ8Vu/cowkmIx95kaRVRzXFn4PHKBIGvr5b+lvoJnvM/4NturZNk+ayCmyF83n9/+5YoQhmNUxLON7HPBejT0tfRgfkvIHh+3/cYc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:29 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:29 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: clock: Add imx8ulp clock support
Date:   Mon, 19 Jul 2021 13:34:22 +0800
Message-Id: <20210719053430.1442505-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210719053430.1442505-1-ping.bai@nxp.com>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ab487b3-2151-4998-5264-08d94a757b9f
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52442729C53B5AB56060751187E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kshoUBtdYjxPljk2e8f17Y2j6zD4v8WMgRf55dBweAMop8C0mlLwzHSx9rTkOn3JskZ5AEgYrHBy3QALhkiKoXMcA+BjEW9grNJ/6mxwF2xkbyZV6e8sTkIPhiLAaxBF2EM7Rw0nZB7P2LtpztKMNmIh6j49b+WAU3+V+X000jBn/7j4c968vLIgOZrB9i9w8Ql+aiBREEUAriotQmZPSH7JcqlIYA6m5SUmDLHl9krgsW4raRczjh8MxeO20XeGVFzptLS86RMpYy940ziEmGYQ4Tl17gg/9tT1b8p7SGaGx9OLRrF+2WuONrbmaQ0DHAtc5MnPCB/dmuIA6OWJNwdZM6f6tE3aKBNoibNUtt6je8AjrXwh5n7XdSsUysn2Sov3u4YLKpFTMUmUKREiMfBYIy4Vo/Xbhm6X+La+iL0jrGtRhHc2ZqpAztmVLDXpqo1m5LiivMT7V9rB7C+Xo5g+EJdz90cVbozhEbRtA5IPG/cF/mdgadlp1PZE1SjoL04lwpOEO0pAJEGexHCyuSWZO2mreoJSfd5+Hypap8ghbDebzpjcOr9xUl3L2TZBcG18bPLPwcs8t9xU3cqYnQHdthGQEqLkiRKXwGU54gDvn56sp0xU9v10NCTUAbc5FPSdauFyWVeT3YyRcWfVFUGc0Z6y7wN6wdL97jdXQev+vIZiYUN6bCxDYZMZEcz7iYu62n5MEuZtRRFFo43p+4w1KIFSeSK40ruMh7VMfaIQYa5tzJ4FhY7LKLFChacaw4KA5iVgKzsk6K/OMSk7ilKoEVuFVza/kJkcBragEjOBMtrR2HKgI15/HjdZ0Qg6dQCBQhn70h+ZpheJASlSy2Pz06CXnVZ5tkfOgMwIEgc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(966005)(83380400001)(6512007)(38350700002)(38100700002)(6506007)(30864003)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dM2iP08YEgV1phs7hAQmtfgHtx4/4u3PypHORD/hrckW9XWBJmFVTJfztcVZ?=
 =?us-ascii?Q?nmGSUVSP7qpTBMwgtqkyovve3pHGaQiyEQxcctBdbrIaFAjs/WGO9O+8gsYb?=
 =?us-ascii?Q?CbQMp5zHzOpZ0CVY9T/M5Z1irABqsP+fl1lYVP+LZ2EvR8fQw8BGYuepyfSW?=
 =?us-ascii?Q?lX3/9Aaoo3Mzb4HoSPkFxl1GKGsje2KxQQRhLGGmpsRCh39I/BUG5UWHZWge?=
 =?us-ascii?Q?ODkGomysu6W+0EkAYdX5uhIona6VEZLTLf1gbkQcL9OkqhSaPkwPPl17pAKF?=
 =?us-ascii?Q?pgYfItlji2XIoFjU6fTAK/YpnzNBcRoiiQcYH6ZuouXbcv08UQC1pzSg08th?=
 =?us-ascii?Q?lrf/lDURC4TwG6Wi7vSLtr5fnFzaPQLj308uzqT598yi6pQ0kIdhZ4HQ25t8?=
 =?us-ascii?Q?F4OHeQSxaNfdZbdgX1LcYygfEqIjwcpWGVglJhqpaA4QRtSJ+0obJBpN0g8z?=
 =?us-ascii?Q?K/hwFMO3KHr0ljF6Vz9RLzaO4WdC65ZuHqDt/lHvYRd6hLiTixSCk1q3IEST?=
 =?us-ascii?Q?+pNHmk2WBeH/GTU0jDK/Kwu/HL1C3QYpXcEhroXJ3u3GI0wOEr2ou+qGPU2Q?=
 =?us-ascii?Q?0eYk41IiKEqL1OOSMhHFzMSZFyNTegdRSqY5kjlOyjd/CvwXUqrMgMF6Ypqc?=
 =?us-ascii?Q?MTbZjAEtmD47aVJer02zwY5zIP5jrn2tu7hGjXC2G97VOV0zpmJnqYfCwdok?=
 =?us-ascii?Q?bk7GUHMfjc2lzjMZ8dXOvDlgDco/qlhGJ8sY3mnxKQBQAk/wD/SB512na6Ud?=
 =?us-ascii?Q?qMB9p3SJOJo3GUZsbSvD4zpSNuQb1c9LsrBCeA2JW2hIc9nVLs2BdSuISAKw?=
 =?us-ascii?Q?tletPRDS2sudKuvydK3YSfFkHVb+j/m8VNsD3vFaPF+YTEIFU/NlUqz114Bf?=
 =?us-ascii?Q?ZfdAV/eg6RezRj7XqMay5P2GHhLi7LzBQzVKWUbywzL9aDiCXn2xqZGysguF?=
 =?us-ascii?Q?0TqAID/E/6MhQm8va8m5BhWuPTyx2rFTg0nMsBoZpxG7/e8ScHYmphBOANR4?=
 =?us-ascii?Q?8Vozb3wk1FC9w7jSCLVrgBA0sae5mfTuK1EE8ClQBrLPa/Og5uXKbMepZJBM?=
 =?us-ascii?Q?F2XuQmM59lzVM28eBzgeMUVRRjdOd6y07yGhZPPif0CpjcwsyO2nXiN2GRYi?=
 =?us-ascii?Q?eW0dZ+oRrUpDuAeqNzFnl/ul7V65eqfXKL/AZQPQhn0KrXMvydyHtppJvx+R?=
 =?us-ascii?Q?fcCvPhCxaglb7RC8p3A1g0BJrdxNUJsJXkb0Uh/n5U5iEi8/lMElw3/8bAa7?=
 =?us-ascii?Q?1ApCXvkuWo39/Wze6Vro4KgiApDlPfBI+UGZLbWRDVUqMvKygyRDmcFF9T2K?=
 =?us-ascii?Q?wjqAyWSFCAz+D4uN5r1DIIRo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab487b3-2151-4998-5264-08d94a757b9f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:29.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUO7b+QuyzIPEmkDJntUrdjtK95RTSQ209MQQxzDW6HtbRJVB8QCUkqO5arVQl6wD8Js8y+UwFxw9BZV/0OWNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock dt-binding file for i.MX8ULP.

For pcc node, it will also be used as a reset controller,
so add the '#reset-cells' property description and add the
pcc reset IDs.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 changes:
  - Move this patch from dts patchset into this patchset
  - Resolve Rob's comments
---
 .../bindings/clock/imx8ulp-clock.yaml         | 128 +++++++++
 include/dt-bindings/clock/imx8ulp-clock.h     | 262 ++++++++++++++++++
 include/dt-bindings/reset/imx8ulp-pcc-reset.h |  59 ++++
 3 files changed, 449 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml
 create mode 100644 include/dt-bindings/clock/imx8ulp-clock.h
 create mode 100644 include/dt-bindings/reset/imx8ulp-pcc-reset.h

diff --git a/Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml b/Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml
new file mode 100644
index 000000000000..9eb0c3c2a49d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imx8ulp-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP Clock Control Module Binding
+
+maintainers:
+  - Jacky Bai <ping.bai@nxp.com>
+
+description: |
+  On i.MX8ULP, The clock sources generation, distribution and management is
+  under the control of several CGCs & PCCs modules. The CGC modules generate
+  and distribute clocks on the device. PCC modules control clock selection,
+  optional division and clock gating mode for peripherals
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-cgc1
+      - fsl,imx8ulp-cgc2
+      - fsl,imx8ulp-pcc3
+      - fsl,imx8ulp-pcc4
+      - fsl,imx8ulp-pcc5
+
+  reg:
+    maxItems: 1
+
+  clocks: true
+
+  clock-names: true
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
+  - '#clock-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-cgc1
+    then:
+      properties:
+        clocks:
+          items:
+            - description: rosc
+            - description: sosc
+            - description: frosc
+            - description: lposc
+
+        clock-names:
+          items:
+            - const: rosc
+            - const: sosc
+            - const: frosc
+            - const: lposc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-cgc2
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sosc
+            - description: frosc
+
+        clock-names:
+          items:
+            - const: sosc
+            - const: frosc
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-cgc1
+              - fsl,imx8ulp-cgc2
+    then:
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-pcc3
+              - fsl,imx8ulp-pcc4
+              - fsl,imx8ulp-pcc5
+    then:
+      required:
+        - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  # Clock Control Module node:
+  - |
+    clock-controller@292c0000 {
+        compatible = "fsl,imx8ulp-cgc1";
+        reg = <0x292c0000 0x10000>;
+        clocks = <&rosc>, <&sosc>, <&frosc>, <&lposc>;
+        clock-names = "rosc", "sosc", "frosc", "lposc";
+        #clock-cells = <1>;
+    };
+
+  - |
+    clock-controller@292d0000 {
+        compatible = "fsl,imx8ulp-pcc3";
+        reg = <0x292d0000 0x10000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
new file mode 100644
index 000000000000..cb449c991643
--- /dev/null
+++ b/include/dt-bindings/clock/imx8ulp-clock.h
@@ -0,0 +1,262 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
+/*
+ * Copyright 2021 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMX8ULP_H
+#define __DT_BINDINGS_CLOCK_IMX8ULP_H
+
+#define IMX8ULP_CLK_DUMMY			0
+#define IMX8ULP_CLK_ROSC			1
+#define IMX8ULP_CLK_FROSC			2
+#define IMX8ULP_CLK_LPOSC			3
+#define IMX8ULP_CLK_SOSC			4
+
+/* CGC1 */
+#define IMX8ULP_CLK_SPLL2			5
+#define IMX8ULP_CLK_SPLL3			6
+#define IMX8ULP_CLK_A35_SEL			7
+#define IMX8ULP_CLK_A35_DIV			8
+#define IMX8ULP_CLK_SPLL2_PRE_SEL		9
+#define IMX8ULP_CLK_SPLL3_PRE_SEL		10
+#define IMX8ULP_CLK_SPLL3_PFD0			11
+#define IMX8ULP_CLK_SPLL3_PFD1			12
+#define IMX8ULP_CLK_SPLL3_PFD2			13
+#define IMX8ULP_CLK_SPLL3_PFD3			14
+#define IMX8ULP_CLK_SPLL3_PFD0_DIV1		15
+#define IMX8ULP_CLK_SPLL3_PFD0_DIV2		16
+#define IMX8ULP_CLK_SPLL3_PFD1_DIV1		17
+#define IMX8ULP_CLK_SPLL3_PFD1_DIV2		18
+#define IMX8ULP_CLK_SPLL3_PFD2_DIV1		19
+#define IMX8ULP_CLK_SPLL3_PFD2_DIV2		20
+#define IMX8ULP_CLK_SPLL3_PFD3_DIV1		21
+#define IMX8ULP_CLK_SPLL3_PFD3_DIV2		22
+#define IMX8ULP_CLK_NIC_SEL			23
+#define IMX8ULP_CLK_NIC_AD_DIVPLAT		24
+#define IMX8ULP_CLK_NIC_PER_DIVPLAT		25
+#define IMX8ULP_CLK_XBAR_SEL			26
+#define IMX8ULP_CLK_XBAR_AD_DIVPLAT		27
+#define IMX8ULP_CLK_XBAR_DIVBUS			28
+#define IMX8ULP_CLK_XBAR_AD_SLOW		29
+#define IMX8ULP_CLK_SOSC_DIV1			30
+#define IMX8ULP_CLK_SOSC_DIV2			31
+#define IMX8ULP_CLK_SOSC_DIV3			32
+#define IMX8ULP_CLK_FROSC_DIV1			33
+#define IMX8ULP_CLK_FROSC_DIV2			34
+#define IMX8ULP_CLK_FROSC_DIV3			35
+#define IMX8ULP_CLK_SPLL3_VCODIV		36
+#define IMX8ULP_CLK_SPLL3_PFD0_DIV1_GATE	37
+#define IMX8ULP_CLK_SPLL3_PFD0_DIV2_GATE	38
+#define IMX8ULP_CLK_SPLL3_PFD1_DIV1_GATE	39
+#define IMX8ULP_CLK_SPLL3_PFD1_DIV2_GATE	40
+#define IMX8ULP_CLK_SPLL3_PFD2_DIV1_GATE	41
+#define IMX8ULP_CLK_SPLL3_PFD2_DIV2_GATE	42
+#define IMX8ULP_CLK_SPLL3_PFD3_DIV1_GATE	43
+#define IMX8ULP_CLK_SPLL3_PFD3_DIV2_GATE	44
+#define IMX8ULP_CLK_SOSC_DIV1_GATE		45
+#define IMX8ULP_CLK_SOSC_DIV2_GATE		46
+#define IMX8ULP_CLK_SOSC_DIV3_GATE		47
+#define IMX8ULP_CLK_FROSC_DIV1_GATE		48
+#define IMX8ULP_CLK_FROSC_DIV2_GATE		49
+#define IMX8ULP_CLK_FROSC_DIV3_GATE		50
+#define IMX8ULP_CLK_SAI4_SEL			51
+#define IMX8ULP_CLK_SAI5_SEL			52
+#define IMX8ULP_CLK_AUD_CLK1			53
+#define IMX8ULP_CLK_ARM				54
+#define IMX8ULP_CLK_ENET_TS_SEL			55
+
+#define IMX8ULP_CLK_CGC1_END			56
+
+/* CGC2 */
+#define IMX8ULP_CLK_PLL4_PRE_SEL	0
+#define IMX8ULP_CLK_PLL4		1
+#define IMX8ULP_CLK_PLL4_VCODIV		2
+#define IMX8ULP_CLK_DDR_SEL		3
+#define IMX8ULP_CLK_DDR_DIV		4
+#define IMX8ULP_CLK_LPAV_AXI_SEL	5
+#define IMX8ULP_CLK_LPAV_AXI_DIV	6
+#define IMX8ULP_CLK_LPAV_AHB_DIV	7
+#define IMX8ULP_CLK_LPAV_BUS_DIV	8
+#define IMX8ULP_CLK_PLL4_PFD0		9
+#define IMX8ULP_CLK_PLL4_PFD1		10
+#define IMX8ULP_CLK_PLL4_PFD2		11
+#define IMX8ULP_CLK_PLL4_PFD3		12
+#define IMX8ULP_CLK_PLL4_PFD0_DIV1_GATE	13
+#define IMX8ULP_CLK_PLL4_PFD0_DIV2_GATE	14
+#define IMX8ULP_CLK_PLL4_PFD1_DIV1_GATE	15
+#define IMX8ULP_CLK_PLL4_PFD1_DIV2_GATE	16
+#define IMX8ULP_CLK_PLL4_PFD2_DIV1_GATE	17
+#define IMX8ULP_CLK_PLL4_PFD2_DIV2_GATE	18
+#define IMX8ULP_CLK_PLL4_PFD3_DIV1_GATE	19
+#define IMX8ULP_CLK_PLL4_PFD3_DIV2_GATE	20
+#define IMX8ULP_CLK_PLL4_PFD0_DIV1	21
+#define IMX8ULP_CLK_PLL4_PFD0_DIV2	22
+#define IMX8ULP_CLK_PLL4_PFD1_DIV1	23
+#define IMX8ULP_CLK_PLL4_PFD1_DIV2	24
+#define IMX8ULP_CLK_PLL4_PFD2_DIV1	25
+#define IMX8ULP_CLK_PLL4_PFD2_DIV2	26
+#define IMX8ULP_CLK_PLL4_PFD3_DIV1	27
+#define IMX8ULP_CLK_PLL4_PFD3_DIV2	28
+#define IMX8ULP_CLK_CGC2_SOSC_DIV1_GATE	29
+#define IMX8ULP_CLK_CGC2_SOSC_DIV2_GATE	30
+#define IMX8ULP_CLK_CGC2_SOSC_DIV3_GATE	31
+#define IMX8ULP_CLK_CGC2_SOSC_DIV1	32
+#define IMX8ULP_CLK_CGC2_SOSC_DIV2	33
+#define IMX8ULP_CLK_CGC2_SOSC_DIV3	34
+#define IMX8ULP_CLK_CGC2_FROSC_DIV1_GATE	35
+#define IMX8ULP_CLK_CGC2_FROSC_DIV2_GATE	36
+#define IMX8ULP_CLK_CGC2_FROSC_DIV3_GATE	37
+#define IMX8ULP_CLK_CGC2_FROSC_DIV1	38
+#define IMX8ULP_CLK_CGC2_FROSC_DIV2	39
+#define IMX8ULP_CLK_CGC2_FROSC_DIV3	40
+#define IMX8ULP_CLK_AUD_CLK2		41
+#define IMX8ULP_CLK_SAI6_SEL		42
+#define IMX8ULP_CLK_SAI7_SEL		43
+#define IMX8ULP_CLK_SPDIF_SEL		44
+#define IMX8ULP_CLK_HIFI_SEL		45
+#define IMX8ULP_CLK_HIFI_DIVCORE	46
+#define IMX8ULP_CLK_HIFI_DIVPLAT	47
+#define IMX8ULP_CLK_DSI_PHY_REF		48
+
+#define IMX8ULP_CLK_CGC2_END		49
+
+/* PCC3 */
+#define IMX8ULP_CLK_WDOG3		0
+#define IMX8ULP_CLK_WDOG4		1
+#define IMX8ULP_CLK_LPIT1		2
+#define IMX8ULP_CLK_TPM4		3
+#define IMX8ULP_CLK_TPM5		4
+#define IMX8ULP_CLK_FLEXIO1		5
+#define IMX8ULP_CLK_I3C2		6
+#define IMX8ULP_CLK_LPI2C4		7
+#define IMX8ULP_CLK_LPI2C5		8
+#define IMX8ULP_CLK_LPUART4		9
+#define IMX8ULP_CLK_LPUART5		10
+#define IMX8ULP_CLK_LPSPI4		11
+#define IMX8ULP_CLK_LPSPI5		12
+#define IMX8ULP_CLK_DMA1_MP		13
+#define IMX8ULP_CLK_DMA1_CH0		14
+#define IMX8ULP_CLK_DMA1_CH1		15
+#define IMX8ULP_CLK_DMA1_CH2		16
+#define IMX8ULP_CLK_DMA1_CH3		17
+#define IMX8ULP_CLK_DMA1_CH4		18
+#define IMX8ULP_CLK_DMA1_CH5		19
+#define IMX8ULP_CLK_DMA1_CH6		20
+#define IMX8ULP_CLK_DMA1_CH7		21
+#define IMX8ULP_CLK_DMA1_CH8		22
+#define IMX8ULP_CLK_DMA1_CH9		23
+#define IMX8ULP_CLK_DMA1_CH10		24
+#define IMX8ULP_CLK_DMA1_CH11		25
+#define IMX8ULP_CLK_DMA1_CH12		26
+#define IMX8ULP_CLK_DMA1_CH13		27
+#define IMX8ULP_CLK_DMA1_CH14		28
+#define IMX8ULP_CLK_DMA1_CH15		29
+#define IMX8ULP_CLK_DMA1_CH16		30
+#define IMX8ULP_CLK_DMA1_CH17		31
+#define IMX8ULP_CLK_DMA1_CH18		32
+#define IMX8ULP_CLK_DMA1_CH19		33
+#define IMX8ULP_CLK_DMA1_CH20		34
+#define IMX8ULP_CLK_DMA1_CH21		35
+#define IMX8ULP_CLK_DMA1_CH22		36
+#define IMX8ULP_CLK_DMA1_CH23		37
+#define IMX8ULP_CLK_DMA1_CH24		38
+#define IMX8ULP_CLK_DMA1_CH25		39
+#define IMX8ULP_CLK_DMA1_CH26		40
+#define IMX8ULP_CLK_DMA1_CH27		41
+#define IMX8ULP_CLK_DMA1_CH28		42
+#define IMX8ULP_CLK_DMA1_CH29		43
+#define IMX8ULP_CLK_DMA1_CH30		44
+#define IMX8ULP_CLK_DMA1_CH31		45
+#define IMX8ULP_CLK_MU3_A		46
+#define IMX8ULP_CLK_MU0_B		47
+
+#define IMX8ULP_CLK_PCC3_END		48
+
+/* PCC4 */
+#define IMX8ULP_CLK_FLEXSPI2		0
+#define IMX8ULP_CLK_TPM6		1
+#define IMX8ULP_CLK_TPM7		2
+#define IMX8ULP_CLK_LPI2C6		3
+#define IMX8ULP_CLK_LPI2C7		4
+#define IMX8ULP_CLK_LPUART6		5
+#define IMX8ULP_CLK_LPUART7		6
+#define IMX8ULP_CLK_SAI4		7
+#define IMX8ULP_CLK_SAI5		8
+#define IMX8ULP_CLK_PCTLE		9
+#define IMX8ULP_CLK_PCTLF		10
+#define IMX8ULP_CLK_USDHC0		11
+#define IMX8ULP_CLK_USDHC1		12
+#define IMX8ULP_CLK_USDHC2		13
+#define IMX8ULP_CLK_USB0		14
+#define IMX8ULP_CLK_USB0_PHY		15
+#define IMX8ULP_CLK_USB1		16
+#define IMX8ULP_CLK_USB1_PHY		17
+#define IMX8ULP_CLK_USB_XBAR		18
+#define IMX8ULP_CLK_ENET		19
+#define IMX8ULP_CLK_SFA1		20
+#define IMX8ULP_CLK_RGPIOE		21
+#define IMX8ULP_CLK_RGPIOF		22
+
+#define IMX8ULP_CLK_PCC4_END		23
+
+/* PCC5 */
+#define IMX8ULP_CLK_TPM8		0
+#define IMX8ULP_CLK_SAI6		1
+#define IMX8ULP_CLK_SAI7		2
+#define IMX8ULP_CLK_SPDIF		3
+#define IMX8ULP_CLK_ISI			4
+#define IMX8ULP_CLK_CSI_REGS 		5
+#define IMX8ULP_CLK_PCTLD		6
+#define IMX8ULP_CLK_CSI			7
+#define IMX8ULP_CLK_DSI			8
+#define IMX8ULP_CLK_WDOG5		9
+#define IMX8ULP_CLK_EPDC		10
+#define IMX8ULP_CLK_PXP			11
+#define IMX8ULP_CLK_SFA2		12
+#define IMX8ULP_CLK_GPU2D		13
+#define IMX8ULP_CLK_GPU3D		14
+#define IMX8ULP_CLK_DC_NANO		15
+#define IMX8ULP_CLK_CSI_CLK_UI 		16
+#define IMX8ULP_CLK_CSI_CLK_ESC		17
+#define IMX8ULP_CLK_RGPIOD		18
+#define IMX8ULP_CLK_DMA2_MP		19
+#define IMX8ULP_CLK_DMA2_CH0		20
+#define IMX8ULP_CLK_DMA2_CH1		21
+#define IMX8ULP_CLK_DMA2_CH2		22
+#define IMX8ULP_CLK_DMA2_CH3		23
+#define IMX8ULP_CLK_DMA2_CH4		24
+#define IMX8ULP_CLK_DMA2_CH5		25
+#define IMX8ULP_CLK_DMA2_CH6		26
+#define IMX8ULP_CLK_DMA2_CH7		27
+#define IMX8ULP_CLK_DMA2_CH8		28
+#define IMX8ULP_CLK_DMA2_CH9		29
+#define IMX8ULP_CLK_DMA2_CH10		30
+#define IMX8ULP_CLK_DMA2_CH11		31
+#define IMX8ULP_CLK_DMA2_CH12		32
+#define IMX8ULP_CLK_DMA2_CH13		33
+#define IMX8ULP_CLK_DMA2_CH14		34
+#define IMX8ULP_CLK_DMA2_CH15		35
+#define IMX8ULP_CLK_DMA2_CH16		36
+#define IMX8ULP_CLK_DMA2_CH17		37
+#define IMX8ULP_CLK_DMA2_CH18		38
+#define IMX8ULP_CLK_DMA2_CH19		39
+#define IMX8ULP_CLK_DMA2_CH20		40
+#define IMX8ULP_CLK_DMA2_CH21		41
+#define IMX8ULP_CLK_DMA2_CH22		42
+#define IMX8ULP_CLK_DMA2_CH23		43
+#define IMX8ULP_CLK_DMA2_CH24		44
+#define IMX8ULP_CLK_DMA2_CH25		45
+#define IMX8ULP_CLK_DMA2_CH26		46
+#define IMX8ULP_CLK_DMA2_CH27		47
+#define IMX8ULP_CLK_DMA2_CH28		48
+#define IMX8ULP_CLK_DMA2_CH29		49
+#define IMX8ULP_CLK_DMA2_CH30		50
+#define IMX8ULP_CLK_DMA2_CH31		51
+#define IMX8ULP_CLK_MU2_B		52
+#define IMX8ULP_CLK_MU3_B		53
+#define IMX8ULP_CLK_AVD_SIM		54
+#define IMX8ULP_CLK_DSI_TX_ESC		55
+
+#define IMX8ULP_CLK_PCC5_END		56
+
+#endif
diff --git a/include/dt-bindings/reset/imx8ulp-pcc-reset.h b/include/dt-bindings/reset/imx8ulp-pcc-reset.h
new file mode 100644
index 000000000000..e99a4735c3c4
--- /dev/null
+++ b/include/dt-bindings/reset/imx8ulp-pcc-reset.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2021 NXP
+ */
+
+#ifndef DT_BINDING_PCC_RESET_IMX8ULP_H
+#define DT_BINDING_PCC_RESET_IMX8ULP_H
+
+/* PCC3 */
+#define PCC3_WDOG3_SWRST	0
+#define PCC3_WDOG4_SWRST	1
+#define PCC3_LPIT1_SWRST	2
+#define PCC3_TPM4_SWRST		3
+#define PCC3_TPM5_SWRST		4
+#define PCC3_FLEXIO1_SWRST	5
+#define PCC3_I3C2_SWRST		6
+#define PCC3_LPI2C4_SWRST	7
+#define PCC3_LPI2C5_SWRST	8
+#define PCC3_LPUART4_SWRST	9
+#define PCC3_LPUART5_SWRST	10
+#define PCC3_LPSPI4_SWRST	11
+#define PCC3_LPSPI5_SWRST	12
+
+/* PCC4 */
+#define PCC4_FLEXSPI2_SWRST	0
+#define PCC4_TPM6_SWRST		1
+#define PCC4_TPM7_SWRST		2
+#define PCC4_LPI2C6_SWRST	3
+#define PCC4_LPI2C7_SWRST	4
+#define PCC4_LPUART6_SWRST	5
+#define PCC4_LPUART7_SWRST	6
+#define PCC4_SAI4_SWRST		7
+#define PCC4_SAI5_SWRST		8
+#define PCC4_USDHC0_SWRST	9
+#define PCC4_USDHC1_SWRST	10
+#define PCC4_USDHC2_SWRST	11
+#define PCC4_USB0_SWRST		12
+#define PCC4_USB0_PHY_SWRST	13
+#define PCC4_USB1_SWRST		14
+#define PCC4_USB1_PHY_SWRST	15
+#define PCC4_ENET_SWRST		16
+
+/* PCC5 */
+#define PCC5_TPM8_SWRST		0
+#define PCC5_SAI6_SWRST		1
+#define PCC5_SAI7_SWRST		2
+#define PCC5_SPDIF_SWRST	3
+#define PCC5_ISI_SWRST		4
+#define PCC5_CSI_REGS_SWRST	5
+#define PCC5_CSI_SWRST		6
+#define PCC5_DSI_SWRST		7
+#define PCC5_WDOG5_SWRST	8
+#define PCC5_EPDC_SWRST		9
+#define PCC5_PXP_SWRST		10
+#define PCC5_GPU2D_SWRST	11
+#define PCC5_GPU3D_SWRST	12
+#define PCC5_DC_NANO_SWRST	13
+
+#endif /*DT_BINDING_RESET_IMX8ULP_H */
-- 
2.26.2

