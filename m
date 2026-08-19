Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE543E2AB6
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787177714; cv=none; b=sakMkdXftsQ9XcTG23xlXHUGf2kAGqB8I1KSWCH+NACX9pxEUeILobR1zgh2Hfxv8pqMz3+HEQTZ0JnDyc8wMbix48jfOXPkg3ZpM9S/kfpwqBHP6ZQW0u6vLPB1vlxa3SjZppeqNdQFik9OJtN/51GQhU8UVvoot708b42P/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787177714; c=relaxed/simple;
	bh=7txVex1YKsBI07yDFKbwJTfHfLkjP2vFWNMOmdjl6zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVK8wJA17+X/ktFqpptFNHilnHli/IM9rUgyTL1aFq9imS83KDqon5nvfQSon4ui0wLmCj2a55aqidSH/dGChiKFuXdRyj9SMQQmaWB4fmUsCW+if0A2JkgW4v6xDTo89swJ3N6wPDZNmCbVmIs2oJ9KLDWGVnrktcMa2Wr46Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puGV6GVT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puGV6GVT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4815b8781c7so761140f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787177711; x=1787782511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sA0r2GQyCCtQoQ8S7Fp2dZh+KlreJQPZUV/cexVXnbE=;
        b=puGV6GVTQ5mLmLS4gLlJ2aT61et8OSbzH8kYIJLH+jZuDD/IU1BWzzbNcaSJjVpjzK
         w3X4V6WE+4RywcSDUgCkgwLAoRKWrgo9++kl8Pd7yzI8qI4G5/TxTG1iSrYRNhiRubBm
         K8py9Z9bBjplNn+0r8ySX9PYCWvkrAFQqRU7bVeixLor9eiYcMu8DJy+m48vopDkBw/N
         QhGp/H3Nr2CC9yhIv6nUsTL6edk2Lavk7lQhQFOWhcMx4o3Y0+8imoqPbige3KpgNSXC
         TMg9t760MZMQQSpfN3cQoO+1FcU5KLenkk+ujFigTe7hAsM6q+lHj/MT9+TCtAUPOilX
         FN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787177711; x=1787782511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sA0r2GQyCCtQoQ8S7Fp2dZh+KlreJQPZUV/cexVXnbE=;
        b=GBl35VtKU3LyC/Z19vlFS/1A5jIQbeWW3bYiVM6VIBomYLrtPDc+c4iPKic37mT/Uu
         gecJhUNtpnVtADwIoZvqxgXmelWNVR3puwMAm/9QBegEr/USERVgNjVoAJ/wNSYfn9bI
         qiZ9bkTmGzfZKzItKkrEGafjZ+hDcpyVnnIUqjWOuaSRITvXemJrmDyOEY/wmc3LPE7T
         yZdi0YhUAHLlGtdH4JaWFD2Vz2lw9uh1cCzbFsNOS1OgTzAgw1imXmwFz/U5QalJ2PC8
         2l2H3nTdlH+lbQjvsyZQ8Y0T/wDQRJQY52v+U+YDJeBemRkgtFSp48PZgaCTljqqsslv
         IB1w==
X-Forwarded-Encrypted: i=1; AHgh+RphmaaZxrqYU95vN+owYcjXfXzu3tyUoWnbNEL4RwleXO2RS+HS06O9hdR3us+fqyTzv6yv14MG9WI=@vger.kernel.org
X-Gm-Message-State: AFuF++nhvFY9bm9c1Rk6CXJ37Sbp3HFG1f2hmk1Oe/MWEMXO3CLVgJSK
	wxfpbsHV358nd4mXbry1uf83y5TxM5zxpoyUXyYYzCC6SkemjsueDJDJ
X-Gm-Gg: AR+sD13wWbI5fQJPmoSGWIgQTKUk3UqxTUqi9QZ/Gk2xTr7WASx8qfxmtlmtjszbPhB
	D1pbL5NWM3RhVDCJ7z/jHfaYAfVWmxbJRtUysxJsPIjBGIY8mVuBtLZwuyIr8I4ygVXrSlIX2Fp
	N39fMlSxER6vnxsVxZPLvX2bXy82TAs+lKdhgUzDqw6DS8LuJBk9ga/YdI+TSXmxHFMYe06gDeh
	VEINB8y8OK+FSaF0CnfX5SL2JiQkUU4TFAdEbSO924xvZtPSsVEVnm6gQvHAWGsjwtA2z8BHrsi
	ynFO0VCNYezV9X2o/HPRB9ryT3QWRomgi1WXNDpouaJpUhLV7S/SyEKSI3JCny7mmTktPF2cHjL
	ML8tIQI5xOGUV3TvvZ/BqUKTA8tSncJDUxf6gVJwBvzFmnhSjhtMDT4U8dWkBCIBc8tOyP7yUSE
	sYTLTPCah2LNNVTt37/bv1C+IP3VsFeL4s1foArCB8vJId0cc3tNmU88UiQz4dEAuVXkRdneec+
	XGRE7vLY3g44iFaLsNXHh0itI/SQccr/7GoPWc9bMnRd7TcRsicqxo=
X-Received: by 2002:a05:6000:480e:b0:481:5edd:1b6c with SMTP id ffacd0b85a97d-482b1e976bbmr15302612f8f.7.1787177710505;
        Wed, 19 Aug 2026 15:15:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm9732950f8f.29.2026.08.19.15.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:15:09 -0700 (PDT)
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
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Thu, 20 Aug 2026 00:14:54 +0200
Message-ID: <20260819221458.30040-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819221458.30040-1-ansuelsmth@gmail.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

Add additional binding for additional clock and reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 20 ++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..edecc635807b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -30,6 +30,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -50,12 +51,30 @@ properties:
     description: ID of the controller reset line
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
@@ -69,6 +88,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - airoha,an7583-scu
             - airoha,en7581-scu
             - econet,en751221-scu
     then:
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
2.53.0

