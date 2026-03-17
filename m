Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E5342CA7
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 19:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777419; cv=none; b=Ylt63b1iLEGK+fKJfoSbhoIaIAX/UxnqcAnm0Px+zYkd+nZWmbAD23Tcl3TK/1yTs2IecvCbW8UgEZQPDnLXJXtWno/vyREI+NCMsADCFZMczlv0jzc5vMdfCeVZr4OQaMujI93lXWY8bSLrM5gTuR1f9md/mkpDeXQl4dLl3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777419; c=relaxed/simple;
	bh=XvTfMauaukkk+C4TYB2D801kKkepYBtwyk/9j7cqYLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PB8vpIfwPGVrIbIBN8+Tb6NslIhNwo1mn7Ho+jiItQk5Tu+v3woDBr1YDpMl9o6cohbdQDtsSWLpFnR0b9ZBALpGy2m8tkBF1P6umOCrmFbm/vp2a4u9ul8Pct2GMt7kjpZSseZzs/P5xBrHOW5AUNdGE4+EcaFiEV3KLXqPuw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2m69aP6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2m69aP6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso781144f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 12:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777415; x=1774382215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zJBnlpHLtLEUmxMyAFCO50XYVLFLaC6mI8b4fmpRh4=;
        b=Z2m69aP659NGKTykoGngBXaxoMQ/s5QfjbxGUSSre2/INgbD/G53Mtv5avela4rAO6
         rbgSbXKds7/QAPE4hTsTZcWXJbeGcAn4i2BpA67LTSWj4rtCFLV/jBmCDqZ0CrxmneVQ
         Ucc0lY/ExCj0CsxRS7Sy5TMw0gV4zT1VYtdWT8C8h7O2EToLT1FqJpay76S9pGFBAJC/
         jOw3Hc1R8GF0iVV8xEI/dzTnbOfbQ58gskBRiBryigPfYvKdxiBQZMFsJBE1t2Az84Ui
         +MaslG/buaCcQAu6s8pPW5ym/YDGD6pAMXKpfhxLd8v6J+3IX0f+XVngAKPjYoMCxPhk
         /4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777415; x=1774382215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zJBnlpHLtLEUmxMyAFCO50XYVLFLaC6mI8b4fmpRh4=;
        b=W9gEEpn3pB97bPDxz4G1E+BOa7yeJNwNOUE703ss8/ppc5qOvVWcEA7mkz8/fftVKd
         FSJIZzV5onsTpFcy4GGJlnh09Fv1zcqc6r7rJs8GJFcuwfZVd7j+of9IQ0v/vAzg8bAO
         Al4XxaONwxxBC7bWoEMgQFPPDcHQdoQhfPW1aVG6q1Lz3JIgXC7bfa8Ln3xZm7JMCN8B
         nnz6EMlNEtzhPPZ8n1NbUyAJ5NoFChparJeyYRh5Ju8HXHKADLlyz4aCHv/1XTFs5OKA
         j6DSXUKYpixXPJPaOC1lo9DVC3G0SBXApmBjpiGctIVfLVihfTDITOPpGFqus2MWNHVP
         u+dw==
X-Forwarded-Encrypted: i=1; AJvYcCU0l3mrtcT5x/r7Eost14AEeWX6eb8FzK2OFx2Qw/rFVhQfvNloYYYMPP8W06Odn3jO0jusVTGMvW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp6nIt1yT+78swFRMde8QxJYkTHv2tjc4E8/tkvZ+1sMkv4jFb
	MgX7IxUvvbbBDXcIy62AI8l9JDSEnFQ3y4uF6/I5hFVjMSJdCJ+te4qu
X-Gm-Gg: ATEYQzxBSgc15PoapTRfgDdpNN7C4tcnWIfyMYOWOHi2/ssSnF7tcwdEEoDM9Rzynuy
	mAVa+hpJP9o18h5gBvT5h5f+Eo+1PZMevyNDDG7La9kG05ONhYELMLw+gMa6Se3A+GSdthBjZse
	lUNaNPeiynXe3TUQsDijGBGm1BmbybgGitS4BFf3bBLQF8tGIdlKAKkVahqpFqAkuAMSCG0huZz
	zT2lbQq+FIVIE3pKdZRayai+MpuIHJVt6oSvtFRkZ7YuzHofSAyzQseU2/45BEvz/QWz2Xatku1
	cEIytN/e57NpxL5Enz5V8ehVHdCRhmpyNGLbPnc1rPMyb0R83RZ5ry8h+X9zwlXugYNPkxL/gFN
	y7F2+NZn1LfRFjWh3QdYnfhIfAP8sV4QmF1KTgKUuMhKdGEe/fAg8oeEDm0g3wEQbDapdDYxg0v
	9HU9e71Sm+kIawYyz1Tt5UGcNrVmVP/KOEQ+lzKJa558RZWlY6
X-Received: by 2002:a5d:5d02:0:b0:439:c018:60ec with SMTP id ffacd0b85a97d-43b527c5457mr891789f8f.30.1773777414896;
        Tue, 17 Mar 2026 12:56:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:56:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/9] dt-bindings: clock: Document RZ/G3L SoC
Date: Tue, 17 Mar 2026 19:56:30 +0000
Message-ID: <20260317195650.468330-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
compared to 1 clock on other SoCs.

Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clocks, as
listed in section 4.4.4.1 ("Block Diagram of the Clock System"), module
clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
Reset definitions referring to registers CPG_RST_* in Section 4.4.3
("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description related to core clocks section in
   the hardware manual
 * Dropped CLK_P4_DIV2 from core clocks
 * Added MIPI_DSI_PLLCLK and USB_SCLK to core clocks
 * Dropped LVDS_PCLK  module clock
 * Added BSC_X_PRESET_BSC reset
v2->v3:
 * Added macros R9A08G046_ETH{0,1}_CLK_{TX,RX}_I_RMII.
 * Keep the tag from Conor as it is trivial change for just adding macros.
v1->v2:
 * Documented external ethernet clocks as it is a clock source for MUX
   inside CPG
 * Updated commit description.
 * Keep the tag from Conor as it is trivial change for adding more
   clks.
---
 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  40 +-
 include/dt-bindings/clock/r9a08g046-cpg.h     | 342 ++++++++++++++++++
 2 files changed, 377 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/clock/r9a08g046-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 8c18616e5c4d..c0ce687d83ee 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -28,19 +28,30 @@ properties:
       - renesas,r9a07g044-cpg # RZ/G2{L,LC}
       - renesas,r9a07g054-cpg # RZ/V2L
       - renesas,r9a08g045-cpg # RZ/G3S
+      - renesas,r9a08g046-cpg # RZ/G3L
       - renesas,r9a09g011-cpg # RZ/V2M
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Clock source to CPG can be either from external clock
+                     input (EXCLK) or crystal oscillator (XIN/XOUT).
+      - description: ETH0 TXC clock input
+      - description: ETH0 RXC clock input
+      - description: ETH1 TXC clock input
+      - description: ETH1 RXC clock input
 
   clock-names:
-    description:
-      Clock source to CPG can be either from external clock input (EXCLK) or
-      crystal oscillator (XIN/XOUT).
-    const: extal
+    minItems: 1
+    items:
+      - const: extal
+      - const: eth0_txc_tx_clk
+      - const: eth0_rxc_rx_clk
+      - const: eth1_txc_tx_clk
+      - const: eth1_rxc_rx_clk
 
   '#clock-cells':
     description: |
@@ -74,6 +85,25 @@ required:
   - '#power-domain-cells'
   - '#reset-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-cpg
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/r9a08g046-cpg.h b/include/dt-bindings/clock/r9a08g046-cpg.h
new file mode 100644
index 000000000000..56b98e98cf88
--- /dev/null
+++ b/include/dt-bindings/clock/r9a08g046-cpg.h
@@ -0,0 +1,342 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
+#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A08G046 CPG Core Clocks */
+#define R9A08G046_CLK_I			0
+#define R9A08G046_CLK_IC0		1
+#define R9A08G046_CLK_IC1		2
+#define R9A08G046_CLK_IC2		3
+#define R9A08G046_CLK_IC3		4
+#define R9A08G046_CLK_P0		5
+#define R9A08G046_CLK_P1		6
+#define R9A08G046_CLK_P2		7
+#define R9A08G046_CLK_P3		8
+#define R9A08G046_CLK_P4		9
+#define R9A08G046_CLK_P5		10
+#define R9A08G046_CLK_P6		11
+#define R9A08G046_CLK_P7		12
+#define R9A08G046_CLK_P8		13
+#define R9A08G046_CLK_P9		14
+#define R9A08G046_CLK_P10		15
+#define R9A08G046_CLK_P13		16
+#define R9A08G046_CLK_P14		17
+#define R9A08G046_CLK_P15		18
+#define R9A08G046_CLK_P16		19
+#define R9A08G046_CLK_P17		20
+#define R9A08G046_CLK_P18		21
+#define R9A08G046_CLK_P19		22
+#define R9A08G046_CLK_P20		23
+#define R9A08G046_CLK_M0		24
+#define R9A08G046_CLK_M1		25
+#define R9A08G046_CLK_M2		26
+#define R9A08G046_CLK_M3		27
+#define R9A08G046_CLK_M4		28
+#define R9A08G046_CLK_M5		29
+#define R9A08G046_CLK_M6		30
+#define R9A08G046_CLK_AT		31
+#define R9A08G046_CLK_B			32
+#define R9A08G046_CLK_ETHTX01		33
+#define R9A08G046_CLK_ETHTX02		34
+#define R9A08G046_CLK_ETHRX01		35
+#define R9A08G046_CLK_ETHRX02		36
+#define R9A08G046_CLK_ETHRM0		37
+#define R9A08G046_CLK_ETHTX11		38
+#define R9A08G046_CLK_ETHTX12		39
+#define R9A08G046_CLK_ETHRX11		40
+#define R9A08G046_CLK_ETHRX12		41
+#define R9A08G046_CLK_ETHRM1		42
+#define R9A08G046_CLK_G			43
+#define R9A08G046_CLK_HP		44
+#define R9A08G046_CLK_SD0		45
+#define R9A08G046_CLK_SD1		46
+#define R9A08G046_CLK_SD2		47
+#define R9A08G046_CLK_SPI0		48
+#define R9A08G046_CLK_SPI1		49
+#define R9A08G046_CLK_S0		50
+#define R9A08G046_CLK_SWD		51
+#define R9A08G046_OSCCLK		52
+#define R9A08G046_OSCCLK2		53
+#define R9A08G046_MIPI_DSI_PLLCLK	54
+#define R9A08G046_USB_SCLK		55
+
+/* R9A08G046 Module Clocks */
+#define R9A08G046_CA55_SCLK		0
+#define R9A08G046_CA55_PCLK		1
+#define R9A08G046_CA55_ATCLK		2
+#define R9A08G046_CA55_GICCLK		3
+#define R9A08G046_CA55_PERICLK		4
+#define R9A08G046_CA55_ACLK		5
+#define R9A08G046_CA55_TSCLK		6
+#define R9A08G046_CA55_CORECLK0		7
+#define R9A08G046_CA55_CORECLK1		8
+#define R9A08G046_CA55_CORECLK2		9
+#define R9A08G046_CA55_CORECLK3		10
+#define R9A08G046_SRAM_ACPU_ACLK0	11
+#define R9A08G046_SRAM_ACPU_ACLK1	12
+#define R9A08G046_SRAM_ACPU_ACLK2	13
+#define R9A08G046_GIC600_GICCLK		14
+#define R9A08G046_IA55_CLK		15
+#define R9A08G046_IA55_PCLK		16
+#define R9A08G046_MHU_PCLK		17
+#define R9A08G046_SYC_CNT_CLK		18
+#define R9A08G046_DMAC_ACLK		19
+#define R9A08G046_DMAC_PCLK		20
+#define R9A08G046_OSTM0_PCLK		21
+#define R9A08G046_OSTM1_PCLK		22
+#define R9A08G046_OSTM2_PCLK		23
+#define R9A08G046_MTU_X_MCK_MTU3	24
+#define R9A08G046_POE3_CLKM_POE		25
+#define R9A08G046_GPT_PCLK		26
+#define R9A08G046_POEG_A_CLKP		27
+#define R9A08G046_POEG_B_CLKP		28
+#define R9A08G046_POEG_C_CLKP		29
+#define R9A08G046_POEG_D_CLKP		30
+#define R9A08G046_WDT0_PCLK		31
+#define R9A08G046_WDT0_CLK		32
+#define R9A08G046_WDT1_PCLK		33
+#define R9A08G046_WDT1_CLK		34
+#define R9A08G046_WDT2_PCLK		35
+#define R9A08G046_WDT2_CLK		36
+#define R9A08G046_XSPI_HCLK		37
+#define R9A08G046_XSPI_ACLK		38
+#define R9A08G046_XSPI_CLK		39
+#define R9A08G046_XSPI_CLKX2		40
+#define R9A08G046_SDHI0_IMCLK		41
+#define R9A08G046_SDHI0_IMCLK2		42
+#define R9A08G046_SDHI0_CLK_HS		43
+#define R9A08G046_SDHI0_IACLKS		44
+#define R9A08G046_SDHI0_IACLKM		45
+#define R9A08G046_SDHI1_IMCLK		46
+#define R9A08G046_SDHI1_IMCLK2		47
+#define R9A08G046_SDHI1_CLK_HS		48
+#define R9A08G046_SDHI1_IACLKS		49
+#define R9A08G046_SDHI1_IACLKM		50
+#define R9A08G046_SDHI2_IMCLK		51
+#define R9A08G046_SDHI2_IMCLK2		52
+#define R9A08G046_SDHI2_CLK_HS		53
+#define R9A08G046_SDHI2_IACLKS		54
+#define R9A08G046_SDHI2_IACLKM		55
+#define R9A08G046_GE3D_CLK		56
+#define R9A08G046_GE3D_AXI_CLK		57
+#define R9A08G046_GE3D_ACE_CLK		58
+#define R9A08G046_ISU_ACLK		59
+#define R9A08G046_ISU_PCLK		60
+#define R9A08G046_H264_CLK_A		61
+#define R9A08G046_H264_CLK_P		62
+#define R9A08G046_CRU_SYSCLK		63
+#define R9A08G046_CRU_VCLK		64
+#define R9A08G046_CRU_PCLK		65
+#define R9A08G046_CRU_ACLK		66
+#define R9A08G046_MIPI_DSI_SYSCLK	67
+#define R9A08G046_MIPI_DSI_ACLK		68
+#define R9A08G046_MIPI_DSI_PCLK		69
+#define R9A08G046_MIPI_DSI_VCLK		70
+#define R9A08G046_MIPI_DSI_LPCLK	71
+#define R9A08G046_LVDS_PLLCLK		72
+#define R9A08G046_LVDS_CLK_DOT0		73
+#define R9A08G046_LCDC_CLK_A		74
+#define R9A08G046_LCDC_CLK_D		75
+#define R9A08G046_LCDC_CLK_P		76
+#define R9A08G046_SSI0_PCLK2		77
+#define R9A08G046_SSI0_PCLK_SFR		78
+#define R9A08G046_SSI1_PCLK2		79
+#define R9A08G046_SSI1_PCLK_SFR		80
+#define R9A08G046_SSI2_PCLK2		81
+#define R9A08G046_SSI2_PCLK_SFR		82
+#define R9A08G046_SSI3_PCLK2		83
+#define R9A08G046_SSI3_PCLK_SFR		84
+#define R9A08G046_USB_U2H0_HCLK		85
+#define R9A08G046_USB_U2H1_HCLK		86
+#define R9A08G046_USB_U2P0_EXR_CPUCLK	87
+#define R9A08G046_USB_U2P1_EXR_CPUCLK	88
+#define R9A08G046_USB_PCLK		89
+#define R9A08G046_ETH0_CLK_AXI		90
+#define R9A08G046_ETH0_CLK_CHI		91
+#define R9A08G046_ETH0_CLK_TX_I		92
+#define R9A08G046_ETH0_CLK_RX_I		93
+#define R9A08G046_ETH0_CLK_TX_180_I	94
+#define R9A08G046_ETH0_CLK_RX_180_I	95
+#define R9A08G046_ETH0_CLK_RMII_I	96
+#define R9A08G046_ETH0_CLK_PTP_REF_I	97
+#define R9A08G046_ETH0_CLK_TX_I_RMII	98
+#define R9A08G046_ETH0_CLK_RX_I_RMII	99
+#define R9A08G046_ETH1_CLK_AXI		100
+#define R9A08G046_ETH1_CLK_CHI		101
+#define R9A08G046_ETH1_CLK_TX_I		102
+#define R9A08G046_ETH1_CLK_RX_I		103
+#define R9A08G046_ETH1_CLK_TX_180_I	104
+#define R9A08G046_ETH1_CLK_RX_180_I	105
+#define R9A08G046_ETH1_CLK_RMII_I	106
+#define R9A08G046_ETH1_CLK_PTP_REF_I	107
+#define R9A08G046_ETH1_CLK_TX_I_RMII	108
+#define R9A08G046_ETH1_CLK_RX_I_RMII	109
+#define R9A08G046_I2C0_PCLK		110
+#define R9A08G046_I2C1_PCLK		111
+#define R9A08G046_I2C2_PCLK		112
+#define R9A08G046_I2C3_PCLK		113
+#define R9A08G046_SCIF0_CLK_PCK		114
+#define R9A08G046_SCIF1_CLK_PCK		115
+#define R9A08G046_SCIF2_CLK_PCK		116
+#define R9A08G046_SCIF3_CLK_PCK		117
+#define R9A08G046_SCIF4_CLK_PCK		118
+#define R9A08G046_SCIF5_CLK_PCK		119
+#define R9A08G046_RSCI0_PCLK		120
+#define R9A08G046_RSCI0_TCLK		121
+#define R9A08G046_RSCI1_PCLK		122
+#define R9A08G046_RSCI1_TCLK		123
+#define R9A08G046_RSCI2_PCLK		124
+#define R9A08G046_RSCI2_TCLK		125
+#define R9A08G046_RSCI3_PCLK		126
+#define R9A08G046_RSCI3_TCLK		127
+#define R9A08G046_RSPI0_PCLK		128
+#define R9A08G046_RSPI0_TCLK		129
+#define R9A08G046_RSPI1_PCLK		130
+#define R9A08G046_RSPI1_TCLK		131
+#define R9A08G046_RSPI2_PCLK		132
+#define R9A08G046_RSPI2_TCLK		133
+#define R9A08G046_CANFD_PCLK		134
+#define R9A08G046_CANFD_CLK_RAM		135
+#define R9A08G046_GPIO_HCLK		136
+#define R9A08G046_ADC0_ADCLK		137
+#define R9A08G046_ADC0_PCLK		138
+#define R9A08G046_ADC1_ADCLK		138
+#define R9A08G046_ADC1_PCLK		140
+#define R9A08G046_TSU_PCLK		141
+#define R9A08G046_PDM_PCLK		142
+#define R9A08G046_PDM_CCLK		143
+#define R9A08G046_PCI_ACLK		144
+#define R9A08G046_PCI_CLKL1PM		145
+#define R9A08G046_PCI_CLK_PMU		146
+#define R9A08G046_SPDIF_PCLK		147
+#define R9A08G046_I3C_TCLK		148
+#define R9A08G046_I3C_PCLK		149
+#define R9A08G046_VBAT_BCLK		150
+#define R9A08G046_BSC_X_BCK_BSC		151
+
+/* R9A08G046 Resets */
+#define R9A08G046_CA55_RST0_0		0
+#define R9A08G046_CA55_RST0_1		1
+#define R9A08G046_CA55_RST0_2		2
+#define R9A08G046_CA55_RST0_3		3
+#define R9A08G046_CA55_RST4_0		4
+#define R9A08G046_CA55_RST4_1		5
+#define R9A08G046_CA55_RST4_2		6
+#define R9A08G046_CA55_RST4_3		7
+#define R9A08G046_CA55_RST8		8
+#define R9A08G046_CA55_RST9		9
+#define R9A08G046_CA55_RST10		10
+#define R9A08G046_CA55_RST11		11
+#define R9A08G046_CA55_RST12		12
+#define R9A08G046_CA55_RST13		13
+#define R9A08G046_CA55_RST14		14
+#define R9A08G046_CA55_RST15		15
+#define R9A08G046_CA55_RST16		16
+#define R9A08G046_SRAM_ACPU_ARESETN0	17
+#define R9A08G046_SRAM_ACPU_ARESETN1	18
+#define R9A08G046_SRAM_ACPU_ARESETN2	19
+#define R9A08G046_GIC600_GICRESET_N	20
+#define R9A08G046_GIC600_DBG_GICRESET_N	21
+#define R9A08G046_IA55_RESETN		22
+#define R9A08G046_MHU_RESETN		23
+#define R9A08G046_SYC_RESETN		24
+#define R9A08G046_DMAC_ARESETN		25
+#define R9A08G046_DMAC_RST_ASYNC	26
+#define R9A08G046_GTM0_PRESETZ		27
+#define R9A08G046_GTM1_PRESETZ		28
+#define R9A08G046_GTM2_PRESETZ		29
+#define R9A08G046_MTU_X_PRESET_MTU3	30
+#define R9A08G046_POE3_RST_M_REG	31
+#define R9A08G046_GPT_RST_C		32
+#define R9A08G046_POEG_A_RST		33
+#define R9A08G046_POEG_B_RST		34
+#define R9A08G046_POEG_C_RST		35
+#define R9A08G046_POEG_D_RST		36
+#define R9A08G046_WDT0_PRESETN		37
+#define R9A08G046_WDT1_PRESETN		38
+#define R9A08G046_WDT2_PRESETN		39
+#define R9A08G046_XSPI_HRESETN		40
+#define R9A08G046_XSPI_ARESETN		41
+#define R9A08G046_SDHI0_IXRST		42
+#define R9A08G046_SDHI1_IXRST		43
+#define R9A08G046_SDHI2_IXRST		44
+#define R9A08G046_SDHI0_IXRSTAXIM	45
+#define R9A08G046_SDHI0_IXRSTAXIS	46
+#define R9A08G046_SDHI1_IXRSTAXIM	47
+#define R9A08G046_SDHI1_IXRSTAXIS	48
+#define R9A08G046_SDHI2_IXRSTAXIM	49
+#define R9A08G046_SDHI2_IXRSTAXIS	50
+#define R9A08G046_GE3D_RESETN		51
+#define R9A08G046_GE3D_AXI_RESETN	52
+#define R9A08G046_GE3D_ACE_RESETN	53
+#define R9A08G046_ISU_ARESETN		54
+#define R9A08G046_ISU_PRESETN		55
+#define R9A08G046_H264_X_RESET_VCP	56
+#define R9A08G046_H264_CP_PRESET_P	57
+#define R9A08G046_CRU_CMN_RSTB		58
+#define R9A08G046_CRU_PRESETN		59
+#define R9A08G046_CRU_ARESETN		60
+#define R9A08G046_MIPI_DSI_CMN_RSTB	61
+#define R9A08G046_MIPI_DSI_ARESET_N	62
+#define R9A08G046_MIPI_DSI_PRESET_N	63
+#define R9A08G046_LCDC_RESET_N		64
+#define R9A08G046_SSI0_RST_M2_REG	65
+#define R9A08G046_SSI1_RST_M2_REG	66
+#define R9A08G046_SSI2_RST_M2_REG	67
+#define R9A08G046_SSI3_RST_M2_REG	68
+#define R9A08G046_USB_U2H0_HRESETN	69
+#define R9A08G046_USB_U2H1_HRESETN	70
+#define R9A08G046_USB_U2P0_EXL_SYSRST	71
+#define R9A08G046_USB_PRESETN		72
+#define R9A08G046_USB_U2P1_EXL_SYSRST	73
+#define R9A08G046_ETH0_ARESET_N		74
+#define R9A08G046_ETH1_ARESET_N		75
+#define R9A08G046_I2C0_MRST		76
+#define R9A08G046_I2C1_MRST		77
+#define R9A08G046_I2C2_MRST		78
+#define R9A08G046_I2C3_MRST		79
+#define R9A08G046_SCIF0_RST_SYSTEM_N	80
+#define R9A08G046_SCIF1_RST_SYSTEM_N	81
+#define R9A08G046_SCIF2_RST_SYSTEM_N	82
+#define R9A08G046_SCIF3_RST_SYSTEM_N	83
+#define R9A08G046_SCIF4_RST_SYSTEM_N	84
+#define R9A08G046_SCIF5_RST_SYSTEM_N	85
+#define R9A08G046_RSPI0_PRESETN		86
+#define R9A08G046_RSPI1_PRESETN		87
+#define R9A08G046_RSPI2_PRESETN		88
+#define R9A08G046_RSPI0_TRESETN		89
+#define R9A08G046_RSPI1_TRESETN		90
+#define R9A08G046_RSPI2_TRESETN		91
+#define R9A08G046_CANFD_RSTP_N		92
+#define R9A08G046_CANFD_RSTC_N		93
+#define R9A08G046_GPIO_RSTN		94
+#define R9A08G046_GPIO_PORT_RESETN	95
+#define R9A08G046_GPIO_SPARE_RESETN	96
+#define R9A08G046_ADC0_PRESETN		97
+#define R9A08G046_ADC0_ADRST_N		98
+#define R9A08G046_ADC1_PRESETN		99
+#define R9A08G046_ADC1_ADRST_N		100
+#define R9A08G046_TSU_PRESETN		101
+#define R9A08G046_PDM_PRESETN		102
+#define R9A08G046_PCI_ARESETN		103
+#define R9A08G046_SPDIF_RST		104
+#define R9A08G046_I3C_TRESETN		105
+#define R9A08G046_I3C_PRESETN		106
+#define R9A08G046_VBAT_BRESETN		107
+#define R9A08G046_RSCI0_PRESETN		108
+#define R9A08G046_RSCI1_PRESETN		109
+#define R9A08G046_RSCI2_PRESETN		110
+#define R9A08G046_RSCI3_PRESETN		111
+#define R9A08G046_RSCI0_TRESETN		112
+#define R9A08G046_RSCI1_TRESETN		113
+#define R9A08G046_RSCI2_TRESETN		114
+#define R9A08G046_RSCI3_TRESETN		115
+#define R9A08G046_LVDS_RESET_N		116
+#define R9A08G046_BSC_X_PRESET_BSC	117
+
+#endif /* __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__ */
-- 
2.43.0

