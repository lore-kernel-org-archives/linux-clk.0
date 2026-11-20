Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217753;
	b=kcgL+8OE112iq3f3Yn7kXgUiYaLji3p1FOOw222fdwlt4RU408DDVlQZXmvAbN2AsvGh
	 +9/VU0tx9M0PNddBAUO8D7XaZTFQL6xKdpY/Fxr13fz5l0zY8mnwKl8n2CX42ShEVjK9M
	 Xw/b7kWjchW3mL6f/k9tELOUJvrNx2QUPFuQdWe7HcA4eVKV20VbCgB//Sf8eEGX3rsZt
	 8tg9YBU1EFnRERt+hdWrlNw+d89Bl3sDJrNkf52I0gKtdWZKe1c1m7vPf98eQnzMPj4eK
	 Y3mU+4sx4d1j2VfbwyP7ZvTE/vO0V35OInYje3ekRXcRkFQBEq+ij2DrXkq0HmCHBVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
	b=A+y2Eg5T8WbwQYqMykh4oDChZ7JVIGjeSymSiXyig84wz4B63eh6ZDUiXU0+olVzS+P6
	 058+GL+crpRuzmgpfI6dOpXIfpw2Tsz3CNkyoCqiGZ6fRcf/DxtDsl8Tu6jwit6D8y5xa
	 ul87TBu4rt4WySQjf+ag7eZwH40uNz0Qr9Ojc4omMM+nENuN8PAoIvlbaBLQnr++968+G
	 w3agjArcOVzxXQ2Q7JWglxr/elpXewRMEfJJU3V9DXYSI2PJ7Zt8tCEzBeAZlRfEgWzN+
	 NTCfrO8RJ6HyVA/ULfuKFc/9r9Hf+e7Ew4H9nPSP5X85pz05d6csfPIpAgKLOnL80dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMJdzpWU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304D0606A696
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 23:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304D0606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMJdzpWU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so17191525e9.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 15:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217748; x=1795822548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
        b=gMJdzpWUCdoMFvsTMfYqoRfTfROXZG+RA1LGemimeWigE7+o/8xg6ie0qG9DmSwvy0
         HqZj8ThkLGNqmUpXWmvxvWkH4h9ZMhcO4s5l+RTDbm1HG3SLMJWvi0LmdYrCZwjDUkUE
         B/bhYqKnfxedTfdjvZtDyBCwe3W9Z4rIvvOas7b+SbJYB7Pcy7F2bk/NYZ9rSOH+0l6H
         954aKZWKo7AuuGOnolCdxD3R5VehevZZKCRbM3Zqs2RXThiGLfXjL4qLCd1ZdNo+XcZB
         mhZv2Eg1TShS1YsurmB3StyyVvRTmD4Al3JRFx5x+joBMvkb8wkT6bOFdZjKsBpmV+TJ
         k4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217748; x=1795822548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g56+Yp2TKqJ5xV2s8BFdZoIDvKQ0/BGu0qh6iDTvIhE=;
        b=NlXa6q2RpmsBycsGnzb1dlbjOXBUMue/INAEIcf9r88U3V/Uo+jDr7ZNbIovidzhve
         2/tNd/7rNp/EPj2O7VcX4ta+aHbE4nCW2v9899duSEzWHMGA29QzABSosKSCMoj9X9mV
         CCM+g0+UbEl5zEkxnkZWoTjOFHtQF/oyiEEei8PDszkcygbHiLy+SfPDg99wb7hFXvIR
         LCarOV0JqKcG+BEvoo+HQByKpFg86QFpVOrZJkgKHsJWQjxXj1ujdCpmKBQF1pFp32SJ
         SCvthywbpiM9pXLO7g78JgoEhToa8ZbCCm0+4dX6KX5ta7s7hUB81LMtST/M1miXiuYB
         dW0w==
X-Forwarded-Encrypted: i=1; AL+hErEv+BSP8cNQokQ3icfT238O9As0pg/aBqhVbh0/BOOc4RM7QyMv6dvab8lpVsQVgt5xDypq7YQ25a8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z3hdh3EWzAW6fzmPcBVAm+3ZeV6p0eZ6SZPjIlxzdjxzl/nlH
	2gXTy52CN92DThcjgkINorA422yA+9r+osDbf084dzY33J6ryyTxx3k+
X-Gm-Gg: AYBFou3Oq/Mys4Dv3Sq8bLWnx39OjJyiKKck+YFmITA3hV6d5vNI/W5qhsK0qKYKgjV
	AknMhnRCIMx60uW6gex7JhZ1x0yLHzOFPdefKkvGpPRlzxDu5UElT0OKC1f2VrxTZ3G5jt2Fnzo
	CIyoMxTahINHUe+cV5AKtF3FMmtbU0GI4mGmerQhQX18ZKdyo1JvOEJi6DcuSMnfnX1fndL1+zM
	qDUylgz8nr6nkfJQ0YR3uOntWNCIm7KXysZhLdytroQaakzPhRfqfJRuxjxQR+19fHyTEYlz4ri
	eqkU207bTWm4fMHiUsrMDfYD1hPNGjfBbzEAN5X1dh65JKCAitn13a1+9I5n2BhrAO0maomoAGK
	g8/BUbZtmzAzrz8XwLAY8x7xTtsZUTvbH7M6XX3zIVwRW5L7RxAnp66mhpiUpbTimuXUvahgA25
	7hb6t1VOqlzvLFb9V08YSGhdWrWj/xV3Tzo9CVQqwpNhGKdRkt914/JcQztxU7Ws0ybTPrLangR
	4oejtQfJfVTdJ1kSsQEgAbkGVtDqTzMhSrHL5TFcBJiZ85R2VxhGiomDfXsa8OkQie+i9BbQUwn
	8JvaZYd3UuaQLuzTgEnTksn2Iz/dohaKcJCPfDEptbCvUJ2lQE9gfL4SGaA4V4Aov4WwSRydeR0
	wC0/024dx+fn5uM3UrWqImwDYzBlr3QnATq7fC8Iot/4B7paXVqfZ
X-Received: by 2002:a05:600c:2319:b0:4bb:752e:991c with SMTP id 5b1f17b1804b1-4bb86160370mr100394445e9.15.1795217748477;
        Fri, 20 Nov 2026 15:35:48 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:47 -0800 (PST)
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
Subject: [PATCH v14 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Sat, 21 Nov 2026 00:35:29 +0100
Message-ID: <20261120233535.164885-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
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
 .../bindings/clock/airoha,en7523-scu.yaml     | 26 ++++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..0d5f89187525 100644
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
@@ -57,12 +58,37 @@ properties:
       available serdes port.
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring and read the base clock sources, dividers  and
+      clock gates.
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

