Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B5433F377
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 19:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994832; cv=none; b=XtHPDu00sUHFcu4d86ompxZEgHeMv2TUobTee47S91NvyqkcppMTIoOPDsSissSg/rzU7pB/6o0bPXQcx18ziPySQJBCZ8lLIuy2aAIEK7uknG/EkBBYi3euwqOw5/r46BGb8HWA9kKN07nYtYHR1yDOgZMb+SIokUAmFhgmXIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994832; c=relaxed/simple;
	bh=yLGLTQApgZA15AXCEVF0mQJP/6iyVeYZod8UKSi1UK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rskBGFBRkxfLCzlRwzLqg16iVzSPFFUScgbfab6tWo9Pwx4YYnORoE9GlZJ2ZUDxDKM2Zj8Hby3mVCHyhseU+72cc2zGm75Kn4P/UiEehp/DGBWAqe/fySKFAORYxQdyeOSF2JSNU7k62chV4vNbpVNHGSBjf2PNS/f+c+L6iys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euMM7OOG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euMM7OOG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eea3448f2so577405f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994818; x=1780599618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXrbVY3dHR05UWwisMVSYjDPIQ0+JKmIGqj24ogcC/w=;
        b=euMM7OOGLUcsxvP0PSFaD1tMmNfo+SGkHxj58A3Hp7NUvr4XOBoUrn5gaTAihBS+K1
         mkbEDwgA/bfpMEephn3uBGKh/B3+hNM/h1bRU6ZOnmkS8AtPW6ggPcKcT99Dk8m7VdL2
         MGAReO0PwQRxtnZd99xu3IVo57gyM14huP/QhD1AMpgVNhjzbQSKi7MvU23/luldaFDx
         XR4jNVgrWbiiD3TJKKYG1191hdeKPvpioqcycsdyOxPNuWvS4tV3dDMInvSD5SkB4p9q
         sI1ApeXFtppc/TfRmTXCIBvLSZhIcCh0Q2693ahWLNyDjzmrGtFMxq3Pby4YovDiBitt
         vvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994818; x=1780599618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXrbVY3dHR05UWwisMVSYjDPIQ0+JKmIGqj24ogcC/w=;
        b=i68wgSwFohhd9puQWekYCv9FPvnjwkxX9IDEZ5oey7squHqTMVoUUP2ow+7hJAHCYL
         p9ZgwCKuzd3RltxbxXTUqhC/eFuEvKJOARw8JS7RLIqHmqidkfsjSfLA4uf8m5xruL7I
         BBalAM6kP0xRnsanIInPybWuzPQqPw+BwQEj0QmE5JZ0lqAyMth2k0EK5mjuPZQ7iLEH
         BXNO+YhdPZ/Afl7wlI9r6BILqDVbJqslOpbn1fVnLMvvtm0zj5yX+CURJxIr1vLo19vp
         o1S/NGcLQOapsOTx8fOPSx+lCFZH8OOoQI3nHSkqmPHycfl7tUShdaLgwZMk/dQzrlO0
         Ddiw==
X-Forwarded-Encrypted: i=1; AFNElJ+1z4PGX2S2cjfdtPAHIhjryw5VZlBZmPcJy3gA5xrCEppmXNSn7yBxzHGLBQBJ4Q9Fkobvrxarydw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxUFV4mOBpEVTLAk/HX5ylNAMhAxTmJeH5iWvAM4vH3ytYNzoO
	baqKS3FbeNl/ElOlFifW9db5pyPMqpqpBlxUEz2K1vIOiIH2pxRo2ULx
X-Gm-Gg: Acq92OEtxUdg5MALt2HtgatBLkUDIB1W+oFse35QMtoiWDUWdN19NFvkNCtNbnzOBsR
	s1fxnjV6BzWQnu9Vz5PPWreFrzRbOo7WFfFYXPZ3Jg2ENyU1zbVvRHcsvP9+rOmJAtlDMBccqVq
	/pZ944OTqI0vZHXPB15O/s8rV8Wzbx81+LWHNjaVafmNpRWraH8omsRbqjTxkFPZG5EmDxUHtGO
	PM2tOaAVQ3o5to/Npq9XClc6AvOGwgMYHQa8Jqig08lipBEEE3HLo7Kh/KXtSaX2QZtDhCAQ1z+
	KaMmLanay5LP652N4Qal8m03xmQXcNO6Ds/NtBM8zRbWDslWi0bMkIRfuNfOpiVou6YYyGyed8d
	NPCyvjfFaGnNwEq6Lvt7mxDvjzZ70H0lzdiAPwUi88UiovCjkOoJkFkxYCC3AgWyq4x6gyDOV0D
	yDRA2GiRgSjwJx/D+dzej7XGd6bPXGEKUuOPQs16a/tEYROg3wI6a4SPgrZIu9hGvFUb88yIBR+
	KrPvkU=
X-Received: by 2002:adf:fa4f:0:b0:449:9aee:4575 with SMTP id ffacd0b85a97d-45ef05f6b0amr411382f8f.30.1779994817824;
        Thu, 28 May 2026 12:00:17 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm8625408f8f.16.2026.05.28.12.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:00:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Thu, 28 May 2026 20:59:54 +0200
Message-ID: <20260528190000.9164-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528190000.9164-1-ansuelsmth@gmail.com>
References: <20260528190000.9164-1-ansuelsmth@gmail.com>
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
 .../bindings/clock/airoha,en7523-scu.yaml     | 18 ++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 62 +++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..6c3c88798515 100644
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
@@ -50,12 +51,29 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to Chip SCU
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
2.53.0

