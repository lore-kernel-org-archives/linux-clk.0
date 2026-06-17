Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA10C3AEF35;
	Wed, 17 Jun 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781676295; cv=fail; b=MUBDpf2cPamURV/LXtYeADaoiDPwC/k1LeROZSXXnr221U18rldAwOlMsR5jn881IU5PrX80uPWxBLZoBY0+O+/b+siwM5IfIJyPa8/aLgY7N8vNMQCaPF/TFAzx3aPFdQjihqnDhQf8BmJO/KmLvKTGqH1EJoViF4SI2dwrQx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781676295; c=relaxed/simple;
	bh=3ce8hDKEHFnJMd3wpLHd0kU8wV6eIy+f//l7w6UVTME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U9QBBiQyYJDMVfqHemrcvshqqF2/2+h6HvHMxh/a/HNqH6Ho2AzQzCZP468mypnSHLwe1ycYkLnkAStT4lMWE7HWx7BD1cHwQsIYpStf/IWUVY6SOcWBP4U94+LcPEsJ11dwr4sgGa/U0U1nNLGwcAii0RKSQfVQJurHUiINdxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lX/QJJ/kVjy+oJAzQulkNorkEv1iGVPxj7CdAkC/tw1CYTg6ol59oc/nsigloMV5CUreYHa4TCxzFx2Kfgl8netGzZ3gSFNTjMJENbI6NNHnaExk7y9KcAY6V8eg5KVY55k9VoTPlOR6J6FdyJon8SYKL2edjJek8i1wCEje7M5difaA85jN1L+XsWERf4TajoFFiW/F1HMEo6WFv+HF7eWd2VBzQurlDrgClqEk+Qss0qnP2j+WEEksvxCpnWoLon2sP++Oxkj/By2qyZbQxSxsUK8HYtteDcPubOH5WvfYJ49odkFXpklwZ4BiP7T13wwImsrttjdxsnZwSwIc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dcbm8baG14NO8ADMeXEsOMwpkDoMBAmwX4iqkcbI3w0=;
 b=gLFQd6fUsg2Mfat6GV4oWdaTpLg+lFsbYCo72g81Rc9hypvqxG4nf5I4r/RNmdcmgUbufWOOhM9BK3lpI0uJadMi+dlT7f3iGlfO0VhFZGpmYapCmKxhMPowhUoAnmLjrQmyQCfJPFdXwUMh3f6cgtstuVJ/VFoRmLOW3Hta7MQJZRGwVSr9Nu5XIaIzdAY3zzWLFzf6NkGk+y9cSlUCsAlbOl/irvm1pjYiROLykRoPqzMGL5yufjmP9gn3k4uEH6eOEaFzPxtrpg/kDWXDwzaTLSomHf4dOrb9e44sUcbUQRePi32KWnrrJ+GKj59qNeuTta63YgPLZPVUdDYRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0051.apcprd02.prod.outlook.com (2603:1096:4:196::10)
 by PUZPR06MB5604.apcprd06.prod.outlook.com (2603:1096:301:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 06:04:50 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::68) by SI2PR02CA0051.outlook.office365.com
 (2603:1096:4:196::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 06:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 06:04:49 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 16B9841D400F;
	Wed, 17 Jun 2026 14:04:48 +0800 (CST)
From: joakim.zhang@cixtech.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add audss clock controller
Date: Wed, 17 Jun 2026 14:04:35 +0800
Message-ID: <20260617060437.1474816-4-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|PUZPR06MB5604:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f5703be0-078f-4957-712e-08decc36575b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|23010399003|82310400026|56012099006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	M9Ze+LXy+Ts8E1qc5K7lIFowBslQje9ga547gT5xn9J/wiTAZaE3e7GoyQtAfuhKgNBRBubUbEDw6UJmO6Toc+ZguynP5y++FEgB+Bhnlvl2dRGxhDpJYpD+hq/rP3MUPROZS4rINMFfPvpMidCJLYEOy0oXvTJ3CtWEQHMBxBgj2sT0UaE+o2VnBJNSHV6ALaZGW+TV/N5JdIOFokWKptKcB1WvC845n7n5yTSHcuL9zYzzm1sez1I1CoAU5HTk0RP5OaL23I2ejUkWA6zL0KFVKIV0k41pHAXvGZXkUQzDJZL7/BTsASJz8OkT97clKA1BA6VVVT4IFGkfLnpk2UB8FbISi7LYcWx6hol/H4sQPqSyKsjAKbSUMfxDvgde3IcFJr+qP9Ka2GfFfSTpVkMRzMQ+rPTa0hbhwa7iJ6+bUMxzAJ9aqnpc+tOL0zCBzVhP1LuKG3kO6+jbSabR0gIxhB39ESTXokBS+Gl9fgot51HUdaX5eWM1v1PrvbSbpnIbzvQH3NKhgV5pN3/nPqtBldsunaGbezkxQQEYfNy6j7EKX8gxAwnAtS32YD4HrQfqYZ1abfQhIZxgvgwPTYNoKe0zfUFr2WzmKpNiGrwBjxqGq4IkkCymcHocSS9XE1usZmvQjjSzMAbq8n93rREjljTPIX17ymgPonelG2ey5ty/jSmdfkymrNF7ZmOM
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(23010399003)(82310400026)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q6ac0lwu794KLJ2HlINBAP2ZpiVODR0q67MMMjT6xekdxcMIW2NTLs3mgzlYkidM23IzIJkX45EvU/qizYvlK3znECEXi40E+7o8T8h11OxcaqCvBAY8YTJUKgbprfRAl79WSOu594BboVCmm4cv1v/h2v8+eEOQu2svI9mm40WU+uiav4SwIVfzrsS4zekwCdsamLNUpQoaJ1vAe++GU8nxsXUp90D1y/c1UJd89nKx2DUVJ+nV0c5HvKAKdzu+TsLBw+fpjv0LHKy//3PpVH1v4xwyso8heLIAh4926NvAVqIIIjEdFDUHKULXXQSoIFrg5bdri6CPpK2ZS7zUNn4kE0iCG6ysmwoIsazzv6UswKdd9rDShAcu+6MD/eIDcK55HLayMfjuKmLKo/g5zpJADicNaecwtzFOkM8sMMHGZTmhxyYrJzz/ndQobwD9
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:04:49.5461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5703be0-078f-4957-712e-08decc36575b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5604

From: Joakim Zhang <joakim.zhang@cixtech.com>

The AUDSS CRU contains an internal clock tree of muxes, dividers and
gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider is
a child node of the cix,sky1-audss-system-control syscon and accesses
registers through the parent MMIO region.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 .../bindings/clock/cix,sky1-audss-clock.yaml  | 72 +++++++++++++++++++
 .../dt-bindings/clock/cix,sky1-audss-clock.h  | 60 ++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h

diff --git a/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
new file mode 100644
index 000000000000..ea813c5a2307
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/cix,sky1-audss-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 audio subsystem clock controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
+
+  This node is a child of a cix,sky1-audss-system-control syscon node
+  (see cix,sky1-system-control.yaml). It does not have a reg property; clock
+  mux, divider and gate fields are accessed through the parent register block.
+
+  Software reset lines for AUDSS blocks are exposed on the parent syscon via
+  #reset-cells (provider). Reset indices are defined in
+  include/dt-bindings/reset/cix,sky1-audss-system-control.h.
+
+  Four SoC-level reference clocks listed in clocks/clock-names feed the AUDSS
+  clock tree. The provider exposes the internal AUDSS clocks to other devices
+  via #clock-cells; indices are defined in cix,sky1-audss-clock.h.
+
+  The parent cix,sky1-audss-system-control node describes the SoC syscon
+  NoC (or bus) reset via resets and the audio subsystem power domain via
+  power-domains.
+
+properties:
+  compatible:
+    const: cix,sky1-audss-clock
+
+  '#clock-cells':
+    const: 1
+    description:
+      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss-clock.h.
+
+  clocks:
+    items:
+      - description: I2S parent clock for sampling rates multiple of 8kHz.
+      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+      - description: clock feeding most devices in audss (NOC, DSP, SRAM, HDA, DMAC, I2S, and Mailbox).
+      - description: clock feeding for HDA, Timer and Watchdog, which is a delicated 48MHz clock.
+
+  clock-names:
+    items:
+      - const: x8k
+      - const: x11k
+      - const: sys
+      - const: 48m
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+
+    clock-controller {
+        compatible = "cix,sky1-audss-clock";
+        #clock-cells = <1>;
+        clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_AUDIO_CLK2>,
+                 <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AUDIO_CLK5>;
+        clock-names = "x8k", "x11k", "sys", "48m";
+    };
diff --git a/include/dt-bindings/clock/cix,sky1-audss-clock.h b/include/dt-bindings/clock/cix,sky1-audss-clock.h
new file mode 100644
index 000000000000..7e9bd3e6c7a1
--- /dev/null
+++ b/include/dt-bindings/clock/cix,sky1-audss-clock.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
+#define _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
+
+#define CLK_AUD_CLK4_DIV2	0
+#define CLK_AUD_CLK4_DIV4	1
+#define CLK_AUD_CLK5_DIV2	2
+
+#define CLK_DSP_CLK		3
+#define CLK_DSP_BCLK		4
+#define CLK_DSP_PBCLK		5
+
+#define CLK_SRAM_AXI		6
+
+#define CLK_HDA_SYS		7
+#define CLK_HDA_HDA		8
+
+#define CLK_DMAC_AXI		9
+
+#define CLK_WDG_APB		10
+#define CLK_WDG_WDG		11
+
+#define CLK_TIMER_APB		12
+#define CLK_TIMER_TIMER		13
+
+#define CLK_MB_0_APB		14	/* MB0: ap->dsp */
+#define CLK_MB_1_APB		15	/* MB1: dsp->ap */
+
+#define CLK_I2S0_APB		16
+#define CLK_I2S1_APB		17
+#define CLK_I2S2_APB		18
+#define CLK_I2S3_APB		19
+#define CLK_I2S4_APB		20
+#define CLK_I2S5_APB		21
+#define CLK_I2S6_APB		22
+#define CLK_I2S7_APB		23
+#define CLK_I2S8_APB		24
+#define CLK_I2S9_APB		25
+#define CLK_I2S0		26
+#define CLK_I2S1		27
+#define CLK_I2S2		28
+#define CLK_I2S3		29
+#define CLK_I2S4		30
+#define CLK_I2S5		31
+#define CLK_I2S6		32
+#define CLK_I2S7		33
+#define CLK_I2S8		34
+#define CLK_I2S9		35
+
+#define CLK_MCLK0		36
+#define CLK_MCLK1		37
+#define CLK_MCLK2		38
+#define CLK_MCLK3		39
+#define CLK_MCLK4		40
+
+#endif
-- 
2.50.1

