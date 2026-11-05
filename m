Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880688;
	b=f2CvYO0dIrAc5+uaAErwIedc6G0wxcQqdExc/6ghoHJ8gbkqXmfUsmtpwzjxCJ9x569D
	 1pk/YX0J4VIgdtsETKQmazyaHuEzbQXETdvjnz5tL+N4xCpnGvpD7/kQnlsSUW22XrzuG
	 8DSMi2kywAsIYFAZGod59gMZz+oYpqNNTk0wFa5B5KP0qoK24H/edPSOrOXlrnZetFQk3
	 gBHFwb57PkPafZeQ/zJdIXsqllC+2eD4zmtnXicTh2sm22Esjbvz0oSUoWrWAt4sN+5P2
	 LnoNd4u8uOO0/jhJQRuXWpRnxJ7dVsi+qiT9Rbr2bWvwtn9SYx8kkfuihNTOzG/fzlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
	b=t4iuGCL3YzHookHaxzMubfgVyu4SQvrhVngMuGY0Pxed35cbsmeCW3CITXJHGtFnCGo/
	 mpAvVQ4x/JLpRQLvTbWqACbQML5wnD7eaU5D4YBfTrGhAOY6iV23I/MFFbiEvPeYBb56/
	 Aj8OqNPsiR0NzqTzy+rlFnPlZePKKL2qDuIDe9uSbP+Idj1zWxhKgNbrw19RIzUjyXBaw
	 D/utMsoDGji2bVjMh4qv+HpX0IHbdbgus9F/qINcgDytxRCo/D49QBnROUHHbPmvWb/er
	 PVcHLM/N3C5zgYxCR4xDPpmRQkdyBBDfq+gvV3IE+EUp9bgpHy/V8KCHJwQmn9r1XqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yBrj7/FL";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA84606EE98
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 12:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA84606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBrj7/FL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14045615e9.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 04:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880686; x=1794485486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=yBrj7/FLS1cGfZoRHN/cXrm/vlpnCjSfwnC2lMJxvnoFtLQfkyyB8nG9K6LucI/PpF
         Bu27Zj49vA8n82GLc4nBr11mW8i7/j5q0hN6rTtYguOnnud4Cx0y4fZLGp95/dU6hKWF
         4fO7UlAUrGsDEdmQqjIokpAh7fPxVZsM3rf38R6JVahC5tTCTaVuhO6kjjBkKkyq+i/a
         R6yXPI7ibx57CY/kalfOEOc+w+m6g4qiYkk++MUvARxkQHDA1/P83D39ekL4HxyXWk+d
         cQkyVexSngGNJKY7US2Te6+Z4Z83Q+2qncAe9N5ptARV+NsX8eIA+xDcH3yTzAWDX5n2
         UUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880686; x=1794485486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=rA0mzNi8oaAC1tXo1XfMEVov2MxTT5rjc5rVDmilLXXi+cm132Vv2FH2SFKWvpoWqw
         rmmT9g4aVu5/n3pUfpZj1QQrTUCClSO8LVpOd7Hu8YNu+80eASqT5FO/1ubdqkoRc56f
         lN8DbJBS/0ADFb4yBUvtVKJAHLSA9hgnvnWNHbxVvUup3dJzpW2oOYyvqrhbZtLocFeX
         ZHlDi8Ya8kxRxS1E9koi61F5U1LplrzxKEzEHY309wzs2JQ7Wpi3mlyVcCi07tJenIMO
         aahMGVwU+YnLEUJ1OdtnylKvfEmVThtKmVoT9CIRvf00zBf/nLLHzie1gs1FxsZkZ3az
         2XhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP2d4wSZR50s0TZfQTspLlLvzWgdZ3tNAkP7X/eKcOIdkbT2y7sYF/Gc3pUL5V/ANEenwHrxCUmbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cRu5Yio2mB2eGIFyopZyFeKTVMKCuQ0ZHSLCZI5NwxdLmuDSh
	wZDCmGPj3VqiQ7am09aApPelymV3qxC87BEuRGs0gNtK1qypYD4wd1gA
X-Gm-Gg: AYBFou0cobw3nIKvpUcqMfrmq26qjCgIo9X04LtsCEa6n3ekby760NYyYCN7FLaPosM
	LDA4iC1+Od8BlK53KJKRC3vR5USuhnQlfnhr9wm5dDtjuB6rt6akbQMzkUG7DawmRFSsdCKtiUL
	5vX69NxA2Ie3D4oG2MmcaminyNnnRhEBTWwyHjtCGR3v1oucdLbcAm4ex2zELv4yV3SZllHFsFk
	i0SEWm0im+NvKIud6rStL8jN6f3kSdP2+dxG2viNRnfo1js6435SFtXCvpagc7UZuN7rlLvSanW
	1wQGG0UnHefLa7Alb7mVlPC1cHuasA1kc7bba8L4+VZ2wlg4jb8/J2yqGW++gh0r5qNr34w+mUL
	0azNW3EFPOhzYX8DrEITCPLRoGPlY3XcGa1TiI24Vf8gyhvz9WThLPALm9/zJIsOwMnmMa7BhC5
	VIB+gMi2jKwTzV5+QlVLg/8YK7IYS1rVs06hJmpKPb93rvO9pYDOTOkIsNXoD2FNz8BNDRynho+
	hWTtEYzSWJGv8OrhYXAQIdNMxJa5DeJEdXUdWiJGiyll8qNXNfLAR2hI+9k4+qJ5sT+vrgEQdsO
	t2SSzP3ODjziAPKy7qU1x9s+8ZRhkAnt9s76uwtJgDml2HqRZ4+wDN8PmzQghWftMTRW5x4SED9
	RybCbMdM3qPMWhdFssSGO48nc
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr399281145e9.22.1793880686157;
        Thu, 05 Nov 2026 04:11:26 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:25 -0800 (PST)
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
Subject: [PATCH v10 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Thu,  5 Nov 2026 13:10:54 +0100
Message-ID: <20261105121059.11201-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 25 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..05cd20ce3ab9 100644
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
@@ -57,12 +58,36 @@ properties:
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
+        - '#reset-cells'
+        - '#phy-cells'
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
index 000000000000..433a5c6180bf
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
+#define AN7583_XPON_XFI_RST		15
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

