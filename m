Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E63033CF
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061623; cv=none; b=r5etjoBrya5tIlvPypHYPqqr8T6vZIkujJHAx7C4ud0/qhUmZv5faKSTM6lJUYBU9TXZpGQsswV29l3Eb0fWoTYIjWfHePvoeRO2CqhnAwMKhdI6RgJm9JtRIvDTu9UrZnhP3Rd14LHY3zTF98P3D2aYAZ31ya3xkyOAQ9FwNyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061623; c=relaxed/simple;
	bh=FGehyJw18qDag3fzZG9IK0qXlJ2se8uH9rOacFNYvCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HDUkyxKGmHmAKE5rBNZ8KM6VIrs3vUqk68o8OjLFwRhjieJtU5OP1y7Sx87LeINZhju/pMBlzSGTw2x4SSoiyMrcoLJdkilL9JJWzvhfmhMmAved1sQ1eGL4Oz5eot+lv+XRx1A1Tkas0kAQ6LqtxUT3eKClpNUYb6gvj1BhQIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=H9Ab5cWs; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="H9Ab5cWs"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-794911acb04so45730807b3.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 11:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770061619; x=1770666419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HRScxpZBIdFwHbDU0nWkn3kbt9KpCxuv2w1T+YYeTI=;
        b=H9Ab5cWsMPpKE7O1SpLEEICwHj1nl8Z/WAMHJDJlFZdakRxv/TH4DFkgWQ7l95Vz0+
         L7UL4maYDUpP9YC6U+rMijQsgctIo+5yRVuIatgvmiDe9B88U3UwX3YVemE7CdvGpQIZ
         fTPeyudwbNZzGpOqvu+jMx3/OWTdiAH+9+H/7TLoZUm4ketkyXmKxccjc1LCueSlc6kK
         /8+mzFGaljFpDgiK+5DYA94d9H3Jdrxgg4DkZ910M3z2LLGyJ6BRkiqYC5U2a29qKZ/8
         n61Aplyflzeg0ScK65zJsCrGN9CKwJ75IQ6NcBaH57kr7PVVw6k3mtB9cPs8ZWn4sBbM
         idog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061619; x=1770666419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6HRScxpZBIdFwHbDU0nWkn3kbt9KpCxuv2w1T+YYeTI=;
        b=ItbFLh2+pQV2GEzGWzKuRE9KpQJPWkbVZ+YXoHRHxOupkqcMTwqa+HaE9tdbDhjH3H
         sQJOgb0m/pDEyjOXFnNeGevGtetF0WPoPPVscqdBA89WV4a7EqOsyly1sP7+h7s3IWDP
         IqHfaHapEsGJ+o/bSqkOq5AU9nlxUHnvACK7JyBBEPkdJabuMa97WjW7ERQEKRhEIGWx
         lKCL2NnFjPZkcRwixtuVwtyjCIQLYe943OvWOfjO5RfFxKL/R+bpyyKOhqqtmHFeykrI
         PxfbVtzczW/9hKgUzgv1yXfAvqMry0J6d3YyHL756ASpGxQN8TiAXnd4isb6rxvhA0ur
         kn3A==
X-Forwarded-Encrypted: i=1; AJvYcCU+XSkR2K/r8q81W9vldcYaDTQeXed36RSpNM7mSzgSZDjyfksEYF7YQf9UDZQn6MTFQco/C360Cj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIN3YRg+28B6D1gsNTOk89KtEXn9/uWqj0hfhO07ywk0dKfmDq
	CfZz1RpLWpfn+Hg49V7Y+LFz/VPumgk6TUo0NmX5mWut0KoeaZqhEPwXgh0XDArF+/o=
X-Gm-Gg: AZuq6aIK3onJqNguOmxDtMIT2P5R1ns/eZF/2UIp2cF4gxCRzPcVeAoK2bd8fVkUS1Y
	WXVW29Asd1k/DNqNwPxIiA05Tu0Xhm+vojCz9IMHW3VtDv7ZI/xTU30xbgKQkP45oUw6uqFCV4g
	YDVepyyQADmMVvKtBe5n+E0MMyXH1wiO+fjjxMYx9SxVBElC1WSRlaE6ie+nVVCRDCfEl1GZD2L
	dyTGRpHvgD24eK0vVMZPAk9/y+mMCQbi9FK2g+oqyV6m8jysIkUYrSNxdXQN2CX7UumUWH+nxwk
	x43y9fXgcqFhY5pc/4MFniBxNrMPcXbGo7H2LW3n2fvFkYZyLzQrAzWCuNYKVmn/1+3u+LnTxS5
	GrSasgt4LNQMlv6zESggSiTLBLUpgz581xS/mK0STCzbJLVKSS2znyh9M3KisgzhbPFb+svZCNi
	aQH1Cwjubfb49bNIGe7FuX1PAUj4G8E9UJd3Xvmz8OuLfYKL87gK/Mi4AFsMxMSwGe7DIA5xJt
X-Received: by 2002:a05:690c:387:b0:793:a445:c659 with SMTP id 00721157ae682-7949dfa60cfmr105745697b3.44.1770061619467;
        Mon, 02 Feb 2026 11:46:59 -0800 (PST)
Received: from [192.168.5.15] ([50.231.163.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794cd7241c0sm39493667b3.24.2026.02.02.11.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:46:59 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 02 Feb 2026 13:46:49 -0600
Subject: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
In-Reply-To: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
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
 bmasney@redhat.com
X-Mailer: b4 0.14.3

Document bindings for Tenstorrent Atlantis PRCM that manages clocks
and resets. This block is instantiated multiple times in the SoC.
This commit documents the clocks from the RCPU PRCM block.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 +++++++++++
 MAINTAINERS                                        |   2 +
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
new file mode 100644
index 000000000000..0f3e18f5ea1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm.yaml#
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
+      See <dt-bindings/clock/tenstorrent,atlantis-prcm.h> for valid indices.
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
index dc731d37c8fe..0fc7bc6d0458 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22534,8 +22534,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
new file mode 100644
index 000000000000..3820781127c3
--- /dev/null
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Tenstorrent Atlantis PRCM Clock and Reset Indices
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#ifndef _DT_BINDINGS_ATLANTIS_PRCM_H
+#define _DT_BINDINGS_ATLANTIS_PRCM_H
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
+#endif /* _DT_BINDINGS_ATLANTIS_PRCM_H */

-- 
2.43.0

