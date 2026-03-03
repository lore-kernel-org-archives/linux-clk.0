Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B53EF0B6
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 17:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559375; cv=none; b=FGDyS/fp9o/yBc3+oHnrBbH2Y3meoUMEsguGtRdaIn7gnwWJMgA388QDwdYy1iPpmhic6/ln8DP7iamHY423AWxrUhJL/0YyjHoYf4gdqzXvBKtwYHMkiRgMaJVloYSeQYOR9ZZv1VAo2cyJeJBQ7LJf5K/iqp6B4pQdY3gM4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559375; c=relaxed/simple;
	bh=fp8nE++navWYOkQ3djT9eJLiAzC5FLM5ImcyELeJg0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mzIeOuFU6h0UkwDU00Bw87Fj6sjSRSLTSLgNOgOVAHmNrQRk9r/mcT6bSJwzizq/ufP3Y5yNOj/1DjNBB4EnZk4vLsXeTJY6vk4E46o842RcaR2WbRLRpDLYmwd1ieUKeGbCEalRXA8bB62+3N0+GpfZPHzPXQ1RzQAZOfdWlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=IticVzwL; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="IticVzwL"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79800183233so81747867b3.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772559373; x=1773164173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HaqjdpdHc/fQbEY4OtrbjxxM+K8US2OS03rxWtvBv4=;
        b=IticVzwLf/HdGSvdGuALSW/Mi/xKoodCwx5go/D8Nk6PuF6+P/+muPwo+ru8T+r13T
         WYqnqDnqitRYX5GzhgPyDnBqsKxl5WZfmcEr44eOXc7fF2I+CmL/6RlRT5EuJtYNAX9p
         c0ZzZodPXBNDLjxkRKpE4UHeOWfSfdyk7v/XwmFfxqWxYUkFHetNHNaMegLCGHViZtOX
         f0z6K808EPlMkb8kjazqRxv7bCGrYOVXWQ6o+8VOKNEyC9iopKXUzG56hMqOzL+go7fi
         +WCm+w6DkcaGTb4lA0mKVaeVd0U1ZzMPCjSfuOD8N9Iso4pdonb/tikyxAqYARl7Evog
         vUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559373; x=1773164173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HaqjdpdHc/fQbEY4OtrbjxxM+K8US2OS03rxWtvBv4=;
        b=p2LhwHkIgT8RJRBx0t7VlHcLyRT1IZqnLBn/13F8qCJ4Zir04u3aAHah3YpovTdl+p
         mPi6As5c2L2oK2S5QLdJqoDjzPrlegWg+Bur+zQE1KTyXc9uT3OgSjEmBbhBRd6Ow+xi
         ZYUCXaVOiiCZJ8mjqyFAROS/g21Sl7QNaGUS4JyVZ4HgRwGZCh/IbRJ27LpoV6x1tuz9
         3nzKT+32j1lglepfibSO2rUQ9Irr6+0ATXjWHpinEWU7mnriUs7O9qPIQfPQCxzuFm1/
         mXKYGenPeSbv1nPM0nVeZz4LDfcIbOiIkkyfw9B0eqWRQZF+F/LQZA0SBAagvdTI0YgK
         jIqw==
X-Forwarded-Encrypted: i=1; AJvYcCUvlbgnqUZnmn3KYz02KTjcu4V3c2HZuKeJq8+pacXOadE+Onuf9Z/tufNt/XpKpn90s976z1iRglw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3qG4CHveHggPN2ZVp4AB0FxX6ZHF3QUQKdUGLkF1TPQsUWUf
	R7MQXgjw+vBpN5W9oxYKldRFLNsL7POh9Y6WksvS8USaRz0hrq9FQA2fboMdAl21i0w=
X-Gm-Gg: ATEYQzwve8ZrsUNLyUolsBBfmPqrioKW6aGDLwGC/4T2aweOxU7P+/IRTcKo6xcxdEO
	7TDQBFYfhfAhmPgLRTHKrPY/GEWSFHEoJbepk9zqemdasFUVu1EokGzbWd17eUMeEYb5iIyDe6Y
	2C6gqwsIElZhbJJWoHGL26xaMAZKTi5RUoBSkA5QOTqjJ7W2PHS5b+IBVw+VZxD/+O0bbu9L6ux
	hijznQAQpVmoEONc1idP4M4wUT6JkjiCZvieeCCRTWCwKjZTFQiTBYQo5AXDIDeRyr3T90Wil68
	K9iZBWGsfXuL7wSnUagxdWeyjkRPrOelqdzx+gm/ted6woD5xY3DNa6Cnjc/XvRcvKSuGGXPJxn
	9/p+UK0Pr9b/TKJSQUvFH+96oIb1mg81koOtzdfP5vR/xasrO5uWd6jC0TuFChXRLTYv5YSbVHE
	7vvHyon7pX1DYVA3T5AbBgxlnpMC1eQrNbjiDS3NXMs/z2VN3i/v0LCKFibaUP9FULlhb2lwr8m
	zHeBzw3qrwLUwd0sEp+
X-Received: by 2002:a05:690c:398:b0:794:c2e7:780c with SMTP id 00721157ae682-798bb40fbf1mr25186327b3.30.1772559372686;
        Tue, 03 Mar 2026 09:36:12 -0800 (PST)
Received: from [192.168.5.15] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a8df9bsm64750477b3.1.2026.03.03.09.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:36:12 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 03 Mar 2026 11:36:07 -0600
Subject: [PATCH v7 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-atlantis-clocks-v7-1-415c9dda086a@oss.tenstorrent.com>
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
In-Reply-To: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document bindings for Tenstorrent Atlantis PRCM that manages clocks
and resets. This block is instantiated multiple times in the SoC.
This commit documents the clocks from the RCPU PRCM block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 +++++++++++
 MAINTAINERS                                        |   2 +
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
new file mode 100644
index 000000000000..7fa16526efce
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm-rcpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tenstorrent Atlantis PRCM (Power, Reset, Clock Management) Module
+
+maintainers:
+  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
+
+description:
+  Multifunctional register block found in Tenstorrent Atlantis SoC whose main
+  function is to control clocks and resets. This block is instantiated multiple
+  times in the SoC, each block controls clock and resets for a different
+  subsystem. RCPU prcm serves low speed IO interfaces.
+
+properties:
+  compatible:
+    enum:
+      - tenstorrent,atlantis-prcm-rcpu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h> for valid indices.
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@a8000000 {
+      compatible = "tenstorrent,atlantis-prcm-rcpu";
+      reg = <0xa8000000 0x10000>;
+      clocks = <&osc_24m>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..40c179c8de1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22809,8 +22809,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h b/include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
new file mode 100644
index 000000000000..c1c875e016f8
--- /dev/null
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Tenstorrent Atlantis PRCM Clock and Reset Indices
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#ifndef _DT_BINDINGS_ATLANTIS_PRCM_RCPU_H
+#define _DT_BINDINGS_ATLANTIS_PRCM_RCPU_H
+
+/*
+ * RCPU Domain Clock IDs
+ */
+#define CLK_RCPU_PLL		0
+#define CLK_RCPU_ROOT		1
+#define CLK_RCPU_DIV2		2
+#define CLK_RCPU_DIV4		3
+#define CLK_RCPU_RTC		4
+#define CLK_SMNDMA0_ACLK	5
+#define CLK_SMNDMA1_ACLK	6
+#define CLK_WDT0_PCLK		7
+#define CLK_WDT1_PCLK		8
+#define CLK_TIMER_PCLK		9
+#define CLK_PVTC_PCLK		10
+#define CLK_PMU_PCLK		11
+#define CLK_MAILBOX_HCLK	12
+#define CLK_SEC_SPACC_HCLK	13
+#define CLK_SEC_OTP_HCLK	14
+#define CLK_TRNG_PCLK		15
+#define CLK_SEC_CRC_HCLK	16
+#define CLK_SMN_HCLK		17
+#define CLK_AHB0_HCLK		18
+#define CLK_SMN_PCLK		19
+#define CLK_SMN_CLK		20
+#define CLK_SCRATCHPAD_CLK	21
+#define CLK_RCPU_CORE_CLK	22
+#define CLK_RCPU_ROM_CLK	23
+#define CLK_OTP_LOAD_CLK	24
+#define CLK_NOC_PLL		25
+#define CLK_NOCC_CLK		26
+#define CLK_NOCC_DIV2		27
+#define CLK_NOCC_DIV4		28
+#define CLK_NOCC_RTC		29
+#define CLK_NOCC_CAN		30
+#define CLK_QSPI_SCLK		31
+#define CLK_QSPI_HCLK		32
+#define CLK_I2C0_PCLK		33
+#define CLK_I2C1_PCLK		34
+#define CLK_I2C2_PCLK		35
+#define CLK_I2C3_PCLK		36
+#define CLK_I2C4_PCLK		37
+#define CLK_UART0_PCLK		38
+#define CLK_UART1_PCLK		39
+#define CLK_UART2_PCLK		40
+#define CLK_UART3_PCLK		41
+#define CLK_UART4_PCLK		42
+#define CLK_SPI0_PCLK		43
+#define CLK_SPI1_PCLK		44
+#define CLK_SPI2_PCLK		45
+#define CLK_SPI3_PCLK		46
+#define CLK_GPIO_PCLK		47
+#define CLK_CAN0_HCLK		48
+#define CLK_CAN0_CLK		49
+#define CLK_CAN1_HCLK		50
+#define CLK_CAN1_CLK		51
+#define CLK_CAN0_TIMER_CLK	52
+#define CLK_CAN1_TIMER_CLK	53
+
+/* RCPU domain reset */
+#define RST_SMNDMA0		0
+#define RST_SMNDMA1		1
+#define RST_WDT0		2
+#define RST_WDT1		3
+#define RST_TMR			4
+#define RST_PVTC		5
+#define RST_PMU			6
+#define RST_MAILBOX		7
+#define RST_SPACC		8
+#define RST_OTP			9
+#define RST_TRNG		10
+#define RST_CRC			11
+#define RST_QSPI		12
+#define RST_I2C0		13
+#define RST_I2C1		14
+#define RST_I2C2		15
+#define RST_I2C3		16
+#define RST_I2C4		17
+#define RST_UART0		18
+#define RST_UART1		19
+#define RST_UART2		20
+#define RST_UART3		21
+#define RST_UART4		22
+#define RST_SPI0		23
+#define RST_SPI1		24
+#define RST_SPI2		25
+#define RST_SPI3		26
+#define RST_GPIO		27
+#define RST_CAN0		28
+#define RST_CAN1		29
+#define RST_I2S0		30
+#define RST_I2S1		31
+
+#endif /* _DT_BINDINGS_ATLANTIS_PRCM_RCPU_H */

-- 
2.43.0

