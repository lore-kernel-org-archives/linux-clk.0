Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069B7351FCA
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762459191; cv=none; b=jskXLjGrCH5MHfsRJZJMMgUmteME9fqmOWYzmgk6GC4rvX5YQyBSB6JaPm8MOzFCyZQPKaq7z9Q5wyabGWHa2Ygx6AMzMF6UQTz++eo4v87yKdwB/ZnwhOTt4Yu2dfYB4V4g55pW48dQ/1ZlxcOaUYG/70/1rQVYy04NncQQW+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762459191; c=relaxed/simple;
	bh=/R514fKOK+2g49FV+f4Uba6tfg9QFz1wdCbUg8UP41Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6KOZsfM9lyw889EL8kRc9vC4ps49LlrkRupL7/NNUt804cFpv7DTMoxrDCEFsdVeKxUumRkJmxh0RnxWamdkb0D12YsjecOSf0rfQT89wan99gAuQFW37RTvH4yevfR/7QAuzn1oHSdVXvlALY6wyg8ho2b5x4t43L4PJM9OQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMFhGAYm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMFhGAYm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-421851bcb25so7060f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762459187; x=1763063987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsmY3T9nhGnwnZqNUu/A4lIOPK61+rKAAQB8Ljjp+h8=;
        b=bMFhGAYmwh6xA5XFaqn/YEzMdh+Fo5XcUKu5o7/JwmcQOzHs0AKEoL4dr6wZJO8yY2
         5lUbK989FgFZxWoW5lp11/iPvHKR4d47dR3QFq2pSNi1pIPy9KGwp8UHAK8imSEMSFi0
         drRooew3IN3dzsi93WX/5yArAO0Tvy5rix3JgLN0a72Ztp2npYkJAmiri9TYgX/TCVGW
         RsJceFlYkd4S7gDt10gnVIZzymme8L0UGbbVgbEDyXY+k7c96SpFy2PwQPZOSkif0vdA
         F/PNb0zakduL/rttSpFehjgWdwApVPa+5mmVrT/TR1Dzd7V+s0ZFhZEf+8F1w3eSP75J
         ZUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762459187; x=1763063987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsmY3T9nhGnwnZqNUu/A4lIOPK61+rKAAQB8Ljjp+h8=;
        b=Ui4N1yP85p1bS6ZpZslsSSSJVlleZHY8+Ru3OB3tVe2aXycorC5FakZdTHWYgpcuAa
         85GGo0cyfbc5cEfsGl8BIK12juj3e5R99QDuPtz2UQzHGSY50aLJo6RNLcX21bwYs9Mx
         kkuMacYfg+TVc+xyck6ydDI7gta3v5sTd07GNGwRlBq4s7w2UDhHcvcFKKAiVX8Km0io
         WZcRYIXvvetrICn9gntOi9Xuw+zeqhfztRFO+u8F/f5AtNqzD3ZzyRpeKLZC2ln3PCJ0
         EgFEXOyflFS9iZTXvD6+SCyybXV2yp2gXToh2SMcp/qU/IoS7uggC2ZfFtD2a5MdGGb8
         RFRA==
X-Forwarded-Encrypted: i=1; AJvYcCVzjvbzFPVLspVZDxE1EwpXxeLqm1CjvfdNYy7tuIUhy31tGKMN+AuLUMRnqFhgTSufdo1zb2/HM+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YytJXrj9/jS9ygrsIH5fqsKEH1c+RgPhu4K9QV8oKungRDWEKvM
	X/ZRia5TV3cP9TR7eBEnF2Sq0erZ+7T3W70q0085k5EyicXTZnFTzu1u
X-Gm-Gg: ASbGnctRx0ur1ig1tCQgqhA2dka6MSDaolQPbWZFaIS5wANpTbwIufyq4Vn2O7ceFLY
	9rZzgZ8wy9sgVcxoSOuGS0Z4CDAiopYKM6NqIN3oHo2sU+Xt8wkTuGbtM+z6/KAQ/lltdoE55Qf
	HRduIV2I97TwYgkFpZzovzRGK4eKouT3iTDvmFRZ9mslgzmbfxdyeovG+LFkfCVwdrIbC41tOcV
	fUsrYnOegisTbz7HT1BnD5eaNblmfGh9bboiBXQnh/9dSIsAN1bW/9K71f+8r1c0zDIojeLTCzi
	nCM161vMoKAzCpjqlRmVuAPdoTWXdMqNX6hi0P+3uUD2R9fSevMol+COtPWGP7BZKn8R7suv08h
	oMnRWnBuJCKi1gD/e/i/cLIdXfWnU+hrv+oe1kypA6MlLMIU7pTLoIrTdYbX3s3fol8PH34U/we
	6M1P47f/UbgkmY8PeeXlCSUExLc5Ty4w==
X-Google-Smtp-Source: AGHT+IEzBKlIvTV8ffYyff9tHH2RG00vyDkY/IGQTxBjk3kUl2uwjgvvux7mB+aIjTctwNdzgpnsQw==
X-Received: by 2002:a05:6000:2dca:b0:429:d48c:edf with SMTP id ffacd0b85a97d-42ae588117dmr400321f8f.24.1762459186988;
        Thu, 06 Nov 2025 11:59:46 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe62bfa0sm990037f8f.5.2025.11.06.11.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:59:46 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 4/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Thu,  6 Nov 2025 20:59:31 +0100
Message-ID: <20251106195935.1767696-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106195935.1767696-1-ansuelsmth@gmail.com>
References: <20251106195935.1767696-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock based on the EN7523
clock schema.

Add additional binding for additional clock and reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     |  5 +-
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 62 +++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fe2c5c1baf43..2d53b96356c5 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -30,6 +30,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
 
@@ -69,7 +70,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: airoha,en7581-scu
+          enum:
+            - airoha,an7583-scu
+            - airoha,en7581-scu
     then:
       properties:
         reg:
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
index 000000000000..7ff07986f8ba
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,62 @@
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
+#define AN7583_MDIO0                    23
+#define AN7583_MDIO1                    24
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
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.51.0

