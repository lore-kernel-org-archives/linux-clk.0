Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C5448D18
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806407; cv=none; b=dLONT+EvFFd1NZYpy1yMQ2S7N3AfWfpP5B+fmS6YxYYUZCZr7WMnIYaRmE1hy/p4Lz1AZZLQU440h9yrdE8AjhOz5fqFabU4jkEgXJsiuRXHMh/IFQhAoqkzmIfbmUblK07ne20WvIAw52isCWEvjsKlNdxSydwfSiOapx9RZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806407; c=relaxed/simple;
	bh=9gQe7ZwJRkms0gIhZk1W9IBEQkejhnw/iwt5Jas2L3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7ayRwtVGA74IxxhHzpr/P2xYU0mffLahr/NOBWS62UZ5uMztcxZPKLB7XHOjn1VlnA5/66gBt/tADkyAClR0GNSMA+Tx2BPftw512604HliWmyYbn/UDF9iQglRCSN09WhALzgZA+WvcG367fcTr9PhbgMssT3WXKJU56GygqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gykmuSdu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gykmuSdu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b03f23305so1504500f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806403; x=1792411203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNLlR0YvXjvrOwI1ZyczykLX/cGoczyD2gqEtIS6gn4=;
        b=gykmuSdutz6Osx4MI5JgPIdD41+rTyzLCvKsBE0I+Vx7/Ch/wgj/YK/GBd28WchJwL
         reyTMNw+goHtfsZjC1ZAgRi1S0vrqrIvKdlVgJQHnaC08Tjg3ziuATdqhbL5kI8TxZje
         jni27AeghUwPjhWEdc6jg02YKBgV9VTrLeFtcgKWIedxWu6VFiESiP1OZlFo3/IsJ71y
         cHW2X8ZWKZnIvIMZfh1Dvp4MXWcAxi3OVNfkfzHHvTGgjI2DZtLuvLTJwPW7IwJutkju
         HQegKG7GPeLBSoCH6ek5xPPRRXAbZdkj4zPpqsMGlA1v/nNk9l/VoBpef0KSkWK6I2L0
         hekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806403; x=1792411203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNLlR0YvXjvrOwI1ZyczykLX/cGoczyD2gqEtIS6gn4=;
        b=CBFYdruGNuMBj1EbRhLtpLoEnAu8gaWKOyvBSFGQ03kFbzY6C7fKy36GitbDmt/vrW
         eQEWZ/5WNliIa59bCYMzEDi6UkgryDC3qJKOthsAg6P91tvLLShjgHZ9VSGGGZlzly9d
         6xkTT+m7Ji1VT3x4BvGOIOSkwbN/sQRRmEAtqmta/2CgSrNb+ZpOrlbMffAVm/zB3vUd
         XKfk5K6PVSawps28yBVSiZl+itv9t0xbXDnHHAJ4FDl1Bja21Syun7aqX1IryyOk43ef
         8q+Ne0fpRWOrq+d5eiChO7eYABuIMDzZsk3Efwh1Z0jD47CzpGjXypVEEU6Wko4/AI6N
         3t7g==
X-Forwarded-Encrypted: i=1; AKwUvBwxfP/Cr7VbZb5aR1WU+NX+ZEssD1oQF8Xd3b99JW6qnPVMeqCel0EQi1wbMJK4ud30lVizZUZIRZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJodyHHSad/uvf1cRhi621+f8v2R35CEP+I2BK1s0zDymwyYSkM
	2hTdWUHXijjKtpcKKR52ZrC0MUQCOyH/umnUINQYAyk7wund5kHZwmXT
X-Gm-Gg: AYBFou1ZydC95QWD5lewxCuvRiISvXrwoDyHRWRcoBDhrtSmaKQbWZSnQ0DNLQCDcLe
	7S3jEW+zAyyafyXMLyJ50uDyMxOMRkk0AHZ5zfEbeUY02iLt+yFr/1uxYokK52s8+Mue589Ykwz
	KgwUY7+eBjZZWL22WEEyqBS9fuIvgasgd7VfUoXQR9gYnKKfF/ngkdcaV9fyQDLdoePUlxtCYfh
	LH4hbeOiGMG/2baeRJ/mS4ELz3Y2hWqRWeiR85dcmQNlkt64Y6SFAMW6ClNje84Py2Zqsvc+ht8
	4tDY5JFZ2F75+13eRIklpGYHLPZln0/58YCfBEOc3A9GVw7VPKIRK9JWk8g0GT2gd+gSqJP+7W1
	oaG14MFDyZeexQy+aVs9Zhv9stkqsoIigisN02+oC1L6nBdUwDRhKyRTG9yFFigzFNOYslyO3Wz
	t4f9tFpNsrcDHfvOSWX3p+nxljH/aUXRcsRCPJ0rBrlhctUsa6ewCHXu8wFoiFeYmewRkquN1L6
	cyMS5Jw2IPdlgvVwpeocYXlaMIWsIejaHU843Wnvl8K4ECNGjubzh10ZUF00NeH9X2oFHvLNTnc
	xpd8jPzfsZH108OFWfILJ3hNzHLO8lhRRQ==
X-Received: by 2002:a5d:5886:0:b0:48c:718a:b266 with SMTP id ffacd0b85a97d-48dbaced581mr15219037f8f.47.1791806402553;
        Mon, 12 Oct 2026 05:00:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 1/3] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Mon, 12 Oct 2026 13:59:51 +0200
Message-ID: <20261012115954.92718-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115954.92718-1-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

The register for clock and reset for normal system and PCIe are scattered
between the "SCU" and "chip SCU" registers (they are 2 different register
block, the name is taken from the programming guide)

- Chip SCU provide register access to some clk gate and clk rate
- SCU provide register for reset, PCIe clock, other clock gate and PHY
  SERDES.

Upcoming and current airoha clock driver all follow this pattern of
declaring one of the 2 register and use a sysconf for the other as the 2
register block are tighlty coupled.

EN7581 internally handle the syscon with a direct reference by the use of
syscon_regmap_lookup_by_compatible while AN7583 wants to make this
explicit in DT with the new "airoha,chip-scu" phandle.

Similar to EN7581, also AN7583 permit the selection of the serdes line.

Add additional binding for additional clock and reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 23 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..8b94113d00ab 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -57,12 +58,34 @@ properties:
       available serdes port.
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring the PCIe related clocks and resets.
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+      required:
+        - airoha,chip-scu
+
+    else:
+      properties:
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..0fbbcb7b1b25 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,4 +14,7 @@
 
 #define EN7581_CLK_EMMC		8
 
+#define AN7583_CLK_MDIO0	9
+#define AN7583_CLK_MDIO1	10
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..410e19802cf7
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_XPON_XFI_RST             15
+#define AN7583_WDMA_RST			16
+#define AN7583_WOE0_RST			17
+#define AN7583_HSDMA_RST		18
+#define AN7583_TDMA_RST			19
+#define AN7583_EMMC_RST			20
+#define AN7583_SOE_RST			21
+#define AN7583_XFP_MAC_RST		22
+#define AN7583_MDIO0_RST		23
+#define AN7583_MDIO1_RST		24
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		25
+#define AN7583_FE_PDMA_RST		26
+#define AN7583_FE_QDMA_RST		27
+#define AN7583_PCM_SPIWP_RST		28
+#define AN7583_CRYPTO_RST		29
+#define AN7583_TIMER_RST		30
+#define AN7583_PCM1_RST			31
+#define AN7583_UART_RST			32
+#define AN7583_GPIO_RST			33
+#define AN7583_GDMA_RST			34
+#define AN7583_I2C_MASTER_RST		35
+#define AN7583_PCM2_ZSI_ISI_RST		36
+#define AN7583_SFC_RST			37
+#define AN7583_UART2_RST		38
+#define AN7583_GDMP_RST			39
+#define AN7583_FE_RST			40
+#define AN7583_USB_HOST_P0_RST		41
+#define AN7583_GSW_RST			42
+#define AN7583_SFC2_PCM_RST		43
+#define AN7583_PCIE0_RST		44
+#define AN7583_PCIE1_RST		45
+#define AN7583_CPU_TIMER_RST		46
+#define AN7583_PCIE_HB_RST		47
+#define AN7583_XPON_MAC_RST		48
+/* RST_PCIC */
+#define AN7583_PCIC_PERSTOUT0_RST	49
+#define AN7583_PCIC_PERSTOUT1_RST	50
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.55.0

