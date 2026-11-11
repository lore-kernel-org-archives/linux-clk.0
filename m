Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794409735;
	b=LofTIenjrLvtVhqPhBbZ6gkEg5B4vti27CjgbWnxicY7KmMnTLTnHXibUT7dbx7ihIK3
	 DcNEWKPd/wdO3Z1iwT3IoeLUlCaeDOgWyt6cqSkrz1bmQBbRcfweUKRmEIxXW7zLADZdw
	 g7VHBflL6WWhiNLeh7/lLbSs4A2iZVu/+TqjTm9s26RNZ2qOXpmfoDknDeIqni9KIRoso
	 2pmTZuZjmYJhtZ89xB454eTbSPtnl1UHuifjKjglm9oBdoDP2JS9Fo3jgfcdoMplWKGzV
	 uXTRdatMKhgKxC7i2mcYN/c1WX2HK10UCT2cJhQW8w9M4wzSd+wh0LG8IYbV1l4eEFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409735;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=g9yJn1bK7jRUtlKLF6Uv1bZVcY/LxAvTzi1Ckr3VxP0=;
	b=2AtMS54yNVdnKe30S6KOaFx6LhE8DYwP80pOuZJm+rOl+QEuCt+Mdwvq7TahC5hE3uoz
	 hS2203LdUWXIdVBWsJ59M7mSlZw0pbhVakzXobJ29sXfJoyxSBv/m1FcyvO61zMnkp0xk
	 uBergy/w8px0nNepPmITvfvf+RV1U+pAhZttYwXuzF6UtTP2jOyG6TTJG/6E+LEbTriJx
	 sd5Id1JqLwgtrfMAHomNw7TgRcKxZyCI0Y8SLD7HWPmLrQjsKe4AfxpKM14SHbjNcrD3B
	 2ffTjE/nyT40uH9HhxIUQPp16Pn/iI0SQze9UVKl9YyGwr68tlXqW6G+WhY8U/67gLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LwSZ1gov;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.18
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194BA606A8A6;
	Wed, 11 Nov 2026 15:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194BA606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LwSZ1gov
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEzXHPKpFLmZFyEX3MBE2//ydS5Cbi0KTPwri363sVV9lt4z/Ide+o2RYDomGe7oFE2dHBRJCkfmrUuA0Zt3q/waDE+H4LdK/rKZ8jUnkctwv3Wyr65TaMCczMKLAPpgidVB7GoaoCHDKmNouxxlcIwDt9LzRfsqImO2PJ6qJuPE8A/SEtAdEqTvHcD3ISsQ805mi1lBQGGDJ2Avk/9B1xMTNRLN1Aqf/3HRvukF/8ch9RWS3Xs6zW7S27v63QZ9lVandChGI3IuI02+Z/mlR24pdBSHri/BMu2XmcGL70xCcSuhcJXbNfeK+nY2c1U7Up1tk3XdDDTSa324Sv23/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9yJn1bK7jRUtlKLF6Uv1bZVcY/LxAvTzi1Ckr3VxP0=;
 b=N/V/ZZcCIuSspIN4SwxVmCzgZf40rRqOB88j0lnNODfc+/nH+OH/FhcJxezELV5Ho2FSfe+N5nJYA1WVEx3e6I9RQCqlu1gjSgG5P8817OvYIHqqsgfZIEgsjogNDLh5T8fDXwORfbFqbvhDiSyAf8exfrRAYfURx5WDAkvI9yViJzUE/1v0nKmsZ5CoSYSdTf66GEPvqcMBNqhbd9Ah8uNtRMr5W65Pl3thHP/LbxjrJ2RVc5fVErqyoFnMOUh7oBLz7okX9DY3xO5sgdoEWH9at7ZzVFS3+g6JpdS9ILlb72kxTCstCprf6//a6cqcBJl9/3i1/qaHuWwag4+czw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9yJn1bK7jRUtlKLF6Uv1bZVcY/LxAvTzi1Ckr3VxP0=;
 b=LwSZ1gov408Sor9c69KhtPeF6cfkfSt0MBUM7CEfLdgu7XsaKrB3HTmwtos6qvpFzndTzn3acdWNMGgqIFfCHBjWXPkO4E1XJfS8RL4VaB8DgNgUkVfxMIiAI5bcn+k8S1Qc/IPPi9NgTToeYsWAeAK5tLlPFkPtv0HK4vRsUZw=
Received: from CH0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:b0::11)
 by DS0PR12MB999312.namprd12.prod.outlook.com (2603:10b6:8:42c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 15:08:51 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::3d) by CH0PR03CA0006.outlook.office365.com
 (2603:10b6:610:b0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Wed,
 11 Nov 2026 15:08:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 15:08:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 09:08:49 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 09:08:49 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 11 Nov 2026 09:08:45 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/2] dt-bindings: clock: convert zynq-7000.txt to yaml
Date: Wed, 11 Nov 2026 20:38:12 +0530
Message-ID: <20261111150812.1874449-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
References: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS0PR12MB999312:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dc21ac-8c61-4610-1bc9-08df4005b1ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|18002099003|22082099003|261009223027099003|3023799007|11063799006|5023799004|56012099006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gV2e2CKa2DS9iXSz/rkATcl2FaFdUPmfve6QzHdGJSUgebqGlFfWkq1lGsSgouJo/HBjX15WJ7HGd9RM6zbIzrdQ21UGr49GvaQbb8vTqsGdo444Hejs7zhUEmwZH92Brm42eMSMWIKg4wzQZz60leMOYqCMYDVED9ROvgHdC4sF83gvw90G/6BnBZYyHvv62CGg5+VL94Tb5o1fFE7XjouiKleQTA+3kVLwdIf8SCiedE/Yaj52/faetuRZbccUUGVdvvdkkot/0VEsiAH/o0N7L023/2qgfDK1+mKCx4QWmNeV7Kl/gzJtJuIlfREAE8R8oYC3J2ho6Wu4WbrfgJezsRuUGKIkejw/dI2XyQWR67/s1NYolGVs+8MnFpYoBdFPCZsdAMwNNMes+mHKnB4JvjrRkkg1vSsLsL+tTJjNXbZWZe8g3c9wRbg2tsJaQpZnNpyo2MtqlbLuOcmgkek1lVA4+54XGRrkJEhlk6Yv3HB6VkFO3fM5ErbBTMxbUfUvepCzanjLUQclNcLAI7QCPp2f5ejJCiAY7W+qGN1rnqgTtaR/Lp2bSWM4LDEBxYsWl6H6smC5UHB4EiSfuh+672segW6yYXaFKkl4jTss0l5ZKjVw3bnZmPbSNq8QwjM7J/hnjKR0CMK3bkleiw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(5023799004)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9ItLVDoFbMTyyYJOCfzZOhdjT+E9mUJLQyWlFkR+zsubxLP4qB8YPRu2Eql+hnPFpkLULuz2zJECoPYqbZMZa2yn5UfQzjhLEupePAW/WBJKieT7e4IlYWE8RfdqAq8ynftctGCTIvLgJM1vnXXGZquuBW7xkeHX/ILcgM7OjJWhp3DnlGY4gWDyJVHxFzL86uep83jE/PBU20wJr/rGePpXZtqVJMweBl1mX8g1x0zpJC8Jhx1sQqcBEoRoh5MKL5rN5ybpphnU3YDi7VmT86JCPEwKDIx5Ra416dbmrqV8t43gwJN2RSS9hv7a5fTWVeUOBD6g3NiuDStfovsetHVmcVqdojLW+lqLDf54ViRyfNt8AuaRxgvq285SDCbVm2TA41BfReW0XJsDb6DGp+S9oEJ3Ny04KqbuvdP+PYtxVKkJVAUup8dvLcUPn+91
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:08:51.3576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dc21ac-8c61-4610-1bc9-08df4005b1ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999312

Convert the Zynq 7000 clock controller binding to DT schema format.

ps-clk-frequency becomes optional with a documented 33 MHz default. The
text version listed it as required, but zynq-7000.dtsi does not set it
and five in-tree boards (zynq-cc108 and zynq-zc770-xm010 through xm013)
never override it, so requiring it would reject device trees that are
already in use.

trace_emio_clk is added to the clock inputs. It is the external trace
clock feeding the debug trace mux, which the text version never listed.
The example is corrected the same way: it used can_mio_clk_23, which
does not match the mio_clk_XX form this binding defines for an EMIO
clock on a MIO pin.

clock-output-names is enumerated as 48 const entries instead of the
prose "shall be a list of the outputs below", so the names and their
order are now checked. The clock cell is an index into that list.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 .../bindings/clock/xlnx,ps7-clkc.yaml         | 145 ++++++++++++++++++
 .../devicetree/bindings/clock/zynq-7000.txt   | 110 -------------
 2 files changed, 145 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,ps7-clkc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/zynq-7000.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,ps7-clkc.yaml b/Documentation/devicetree/bindings/clock/xlnx,ps7-clkc.yaml
new file mode 100644
index 000000000000..2d6ce2ba5d87
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,ps7-clkc.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/xlnx,ps7-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Zynq 7000 clock controller
+
+maintainers:
+  - Michal Simek <michal.simek@amd.com>
+
+description:
+  The clock controller generates the PS clocks from the three PLLs and the
+  clock generators in the System Level Control Registers (SLCR). It is a
+  child node of the SLCR. See Chapter 25 of the Zynq TRM (UG585) for more
+  information about Zynq clocks.
+
+properties:
+  compatible:
+    const: xlnx,ps7-clkc
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 58
+
+  clock-names:
+    minItems: 1
+    maxItems: 58
+    description:
+      Optional (E)MIO clock sources. mio_clk_XX names the EMIO clock on MIO
+      pin XX and may be given for pins 00 to 53.
+    items:
+      oneOf:
+        - enum: [ gem0_emio_clk, gem1_emio_clk, swdt_ext_clk, trace_emio_clk ]
+        - pattern: '^mio_clk_([0-4][0-9]|5[0-3])$'
+
+  clock-output-names:
+    description:
+      Names for the 48 clock outputs, in the order the single clock cell
+      indexes them.
+    items:
+      - const: armpll
+      - const: ddrpll
+      - const: iopll
+      - const: cpu_6or4x
+      - const: cpu_3or2x
+      - const: cpu_2x
+      - const: cpu_1x
+      - const: ddr2x
+      - const: ddr3x
+      - const: dci
+      - const: lqspi
+      - const: smc
+      - const: pcap
+      - const: gem0
+      - const: gem1
+      - const: fclk0
+      - const: fclk1
+      - const: fclk2
+      - const: fclk3
+      - const: can0
+      - const: can1
+      - const: sdio0
+      - const: sdio1
+      - const: uart0
+      - const: uart1
+      - const: spi0
+      - const: spi1
+      - const: dma
+      - const: usb0_aper
+      - const: usb1_aper
+      - const: gem0_aper
+      - const: gem1_aper
+      - const: sdio0_aper
+      - const: sdio1_aper
+      - const: spi0_aper
+      - const: spi1_aper
+      - const: can0_aper
+      - const: can1_aper
+      - const: i2c0_aper
+      - const: i2c1_aper
+      - const: uart0_aper
+      - const: uart1_aper
+      - const: gpio_aper
+      - const: lqspi_aper
+      - const: smc_aper
+      - const: swdt
+      - const: dbg_trc
+      - const: dbg_apb
+
+  ps-clk-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 33333333
+    description:
+      Frequency of the oscillator providing ps_clk, in Hz. Zynq platforms
+      usually fit a 33 MHz oscillator.
+
+  fclk-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    maximum: 0xf
+    description:
+      Bit mask of FCLKs to enable at boot time. Bits 0 to 3 correspond to
+      FCLK0 to FCLK3.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    clkc: clock-controller@100 {
+        compatible = "xlnx,ps7-clkc";
+        reg = <0x100 0x100>;
+        #clock-cells = <1>;
+        ps-clk-frequency = <33333333>;
+        fclk-enable = <0>;
+        clock-output-names = "armpll", "ddrpll", "iopll", "cpu_6or4x",
+                             "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x",
+                             "ddr3x", "dci", "lqspi", "smc", "pcap",
+                             "gem0", "gem1", "fclk0", "fclk1", "fclk2",
+                             "fclk3", "can0", "can1", "sdio0", "sdio1",
+                             "uart0", "uart1", "spi0", "spi1", "dma",
+                             "usb0_aper", "usb1_aper", "gem0_aper",
+                             "gem1_aper", "sdio0_aper", "sdio1_aper",
+                             "spi0_aper", "spi1_aper", "can0_aper",
+                             "can1_aper", "i2c0_aper", "i2c1_aper",
+                             "uart0_aper", "uart1_aper", "gpio_aper",
+                             "lqspi_aper", "smc_aper", "swdt", "dbg_trc",
+                             "dbg_apb";
+        clocks = <&clkc 16>, <&clk_foo>;
+        clock-names = "gem1_emio_clk", "mio_clk_23";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/zynq-7000.txt b/Documentation/devicetree/bindings/clock/zynq-7000.txt
deleted file mode 100644
index d93746cf2975..000000000000
--- a/Documentation/devicetree/bindings/clock/zynq-7000.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-Device Tree Clock bindings for the Zynq 7000 EPP
-
-The Zynq EPP has several different clk providers, each with there own bindings.
-The purpose of this document is to document their usage.
-
-See clock_bindings.txt for more information on the generic clock bindings.
-See Chapter 25 of Zynq TRM for more information about Zynq clocks.
-
-== Clock Controller ==
-The clock controller is a logical abstraction of Zynq's clock tree. It reads
-required input clock frequencies from the devicetree and acts as clock provider
-for all clock consumers of PS clocks.
-
-Required properties:
- - #clock-cells : Must be 1
- - compatible : "xlnx,ps7-clkc"
- - reg : SLCR offset and size taken via syscon < 0x100 0x100 >
- - ps-clk-frequency : Frequency of the oscillator providing ps_clk in HZ
-		      (usually 33 MHz oscillators are used for Zynq platforms)
- - clock-output-names : List of strings used to name the clock outputs. Shall be
-			a list of the outputs given below.
-
-Optional properties:
- - clocks : as described in the clock bindings
- - clock-names : as described in the clock bindings
- - fclk-enable : Bit mask to enable FCLKs statically at boot time.
-		 Bit [0..3] correspond to FCLK0..FCLK3. The corresponding
-		 FCLK will only be enabled if it is actually running at
-		 boot time.
-
-Clock inputs:
-The following strings are optional parameters to the 'clock-names' property in
-order to provide an optional (E)MIO clock source.
- - swdt_ext_clk
- - gem0_emio_clk
- - gem1_emio_clk
- - mio_clk_XX		# with XX = 00..53
-...
-
-Clock outputs:
- 0:  armpll
- 1:  ddrpll
- 2:  iopll
- 3:  cpu_6or4x
- 4:  cpu_3or2x
- 5:  cpu_2x
- 6:  cpu_1x
- 7:  ddr2x
- 8:  ddr3x
- 9:  dci
- 10: lqspi
- 11: smc
- 12: pcap
- 13: gem0
- 14: gem1
- 15: fclk0
- 16: fclk1
- 17: fclk2
- 18: fclk3
- 19: can0
- 20: can1
- 21: sdio0
- 22: sdio1
- 23: uart0
- 24: uart1
- 25: spi0
- 26: spi1
- 27: dma
- 28: usb0_aper
- 29: usb1_aper
- 30: gem0_aper
- 31: gem1_aper
- 32: sdio0_aper
- 33: sdio1_aper
- 34: spi0_aper
- 35: spi1_aper
- 36: can0_aper
- 37: can1_aper
- 38: i2c0_aper
- 39: i2c1_aper
- 40: uart0_aper
- 41: uart1_aper
- 42: gpio_aper
- 43: lqspi_aper
- 44: smc_aper
- 45: swdt
- 46: dbg_trc
- 47: dbg_apb
-
-Example:
-	clkc: clkc@100 {
-		#clock-cells = <1>;
-		compatible = "xlnx,ps7-clkc";
-		ps-clk-frequency = <33333333>;
-		reg = <0x100 0x100>;
-		clock-output-names = "armpll", "ddrpll", "iopll", "cpu_6or4x",
-				"cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x",
-				"dci", "lqspi", "smc", "pcap", "gem0", "gem1",
-				"fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
-				"sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1",
-				"dma", "usb0_aper", "usb1_aper", "gem0_aper",
-				"gem1_aper", "sdio0_aper", "sdio1_aper",
-				"spi0_aper", "spi1_aper", "can0_aper", "can1_aper",
-				"i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper",
-				"gpio_aper", "lqspi_aper", "smc_aper", "swdt",
-				"dbg_trc", "dbg_apb";
-		# optional props
-		clocks = <&clkc 16>, <&clk_foo>;
-		clock-names = "gem1_emio_clk", "can_mio_clk_23";
-	};
-- 
2.44.4

