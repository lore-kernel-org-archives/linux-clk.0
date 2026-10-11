Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F123D7D9C
	for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 18:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744770; cv=none; b=hzSILHXh/gMDKWDfT7dndBdtwtvZB1rSmHkqCI0KXP5cPnWhLSxOC+8WsWphAdbe3FR9gCGIetClH3ZbamhN7VzUoVm26WaU3toK+u/5qv64Iba8IUPrbFjHShNNe5oSIa+o7rtJ5a0EuIvumFI9RT3yZcwZ04Kr5j2CnjJfW6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744770; c=relaxed/simple;
	bh=9gQe7ZwJRkms0gIhZk1W9IBEQkejhnw/iwt5Jas2L3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7kygAcvZss9FWFjp6jWJq2Du/xi+gT/fVKcFURYYf4qE2rgWbzxpaFav8XK45mu/tOc7HSyDBBdD5sJIOjZTzpb7RpHOC0PXPjD1ifOSxn9rd4MQYBNwIegWe+c7cxT4JuSE/Ty5Wkbgsxr6RhnUuAdVYK5v91sGzBo7nXV2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoKNlr3K; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoKNlr3K"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso6168765e9.3
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 11:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744767; x=1792349567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNLlR0YvXjvrOwI1ZyczykLX/cGoczyD2gqEtIS6gn4=;
        b=YoKNlr3K9KkfQEHevccghhuIgo7XZUijmnQsGtGwOd97Ta4nv+IZC/l3PIaQ44vC1R
         AhcwwzbUIlo+dpvz94FdErjXWCB+tF3mnIbr6fT8yyod2XMpCympS/5AEfTI5pXQiVGJ
         yWeN1ph4LbH4ham8TDsBo2b9TbFhRDDxne8osGm4xJWEeFqPQkQHHcOG09bPC6qZ4gPn
         FAEeuiAchn7NsSCrcRAOSeu/mMJHSToUfp8p9CqoFvvNeNVLx7PING+8IzqTvwAHaYse
         rWWWhuWJtBqsoOWVxms03hnaQy9AbvT3VTF5k2llKXla/N7UXYJgez1U2cpbGE2lA4eg
         Hi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744767; x=1792349567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNLlR0YvXjvrOwI1ZyczykLX/cGoczyD2gqEtIS6gn4=;
        b=VsBITB89ci0h9MY3aVxrF3JNPs44F2kfF69Ty1BGpBZ7fzjYbPPU5IMuCLoOIzaTt1
         VkQBT37AV0gWXVUfqcA9b4yHDujfx8/XK88VbJuDBtflnU+qoaJN/0Pk5juud4lUGJev
         C7/nQjIPFEDCRRVfSn+rEyFOS+1Sx9Ti3KGDSKxBbm22eEj3yZMEzRMeVINTcP1N8cIG
         3w0ONTDbiY5V0xiaEtla2G8Lz+mMkBE3cHORddsfzykASbZ2+TQZsAtIGoGix9oxYhcr
         ihSte9laMeESPCWiC/TvpB4P0a8TEzYBFjTxIZbDMeVhFRfws3Gej5KfVBssNNDKmdCV
         HXyg==
X-Forwarded-Encrypted: i=1; AKwUvBzgcQV8GuW8mnu/IwKgt6mCBz4VuzO2BLM4uXAV9kLTg0UsJ0ZgnQrr2YNYk7R2bHtkz02PlTtqkAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3+/lGQvBgdsdEPy0jrO0TwS5aWv3cItUX39LXjNEdNPnVVxdt
	9oBc6IOa3fCzv5thox/7AJa+9qqZRjiez702wSkF+CGsYCbvZ6YU55Dy
X-Gm-Gg: AYBFou0LyV+t+IetfK2Qyclxvd4NCigOZHuKCsXXQwLsZaR/4+BxML/ZUTdZzedTOIi
	pe5SIR4xELnkFHnHWEOhltDb8lIPS0zCEihtYm9VVALkvvk80vhi+dBFOeehqaiI7uze2EQA6Ga
	HLyFwlQtZuVHsO7QQRNSkGoNsS8tnlTqwPxieO+ZpLhhhphUDHOjqf/R0GkHzyklGK+NMN+e3VU
	ZHs/AEoSg+VC9J4OLSRJSovE6yKmqnqWZlf3Ef2Z35TcWAHWGYQ4sRxmn715QDzSKpXg7sXNIC5
	rhRBPXwAQE7OItpJWTQrRRi5oCEqnY70CPmwGq5tLJGUD0NW4XIuGj0zYFEwo5tq16rjRQnJVFI
	vUcSCT1z7YSYS7YYDW7o22s1OiTUUYatRONt+WOVg0N5YQjhh9lo1C16K88QJr7WUJq77/VnTTG
	14H5kG6TTlWb9TVsH/WsTVpk7TK9njvoM1S9ipcPFdZdyV6UY2udkYS1doPXWjxu7Kfal82YIM+
	Qy/jaxR8dbZPHruHYu+xzCXkBCL4SYY63VTK84XNoppsnApM1uqKzQ4FyBWa7G7IIsC+rU5H8de
	vZGTw2iiJIQh45q9yxoFPg==
X-Received: by 2002:a05:600c:3554:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-4a18e4a01a1mr142301315e9.6.1791744767028;
        Sun, 11 Oct 2026 11:52:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm257418615e9.10.2026.10.11.11.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:52:46 -0700 (PDT)
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
Subject: [PATCH v8 1/3] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Sun, 11 Oct 2026 20:52:35 +0200
Message-ID: <20261011185238.52229-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011185238.52229-1-ansuelsmth@gmail.com>
References: <20261011185238.52229-1-ansuelsmth@gmail.com>
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

