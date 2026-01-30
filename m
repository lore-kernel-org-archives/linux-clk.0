Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AFF35A943
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769795437; cv=none; b=WuVGs5yZ81hkNVavfY71xVOUpp4q3zAAFLzYIYZczLYpqX4meZjk6TBzpr1odCelnoo/pX8qpP+6WTSiZMZ0D1y/hL678ooRRaPfZcqB4iLDWi4avXA7OQ9YdY2n7sBHmfrJOHeg8RFEBlR4CkG6bHO/8CeaoPd/ALziyTW2If0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769795437; c=relaxed/simple;
	bh=FGehyJw18qDag3fzZG9IK0qXlJ2se8uH9rOacFNYvCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjKFBjnEfgvtNCfl8s4xHnjhNzXTRFXT4kvB7iLMK54Dk6qxjk04OTXkyHN14F48PwmqkY/AAiXry524kbSLiICmoForGIbmxjyqLv2ttkO8Lc2frw24OaMtjeURRJGd4RiqUK9DbIErI9RLLat3t7ktzkifToiF5y9iRHfEPE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=GtBUIZg0; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="GtBUIZg0"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78f89501423so34657797b3.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769795434; x=1770400234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HRScxpZBIdFwHbDU0nWkn3kbt9KpCxuv2w1T+YYeTI=;
        b=GtBUIZg0Ztc4U6Oyd2RBkxCSaKTn1JrslNzJ43WmO7L1jtSs7Rr4IUkR12aDVZS8k2
         ny4H2jGqqPel9o8tFtRhzaMR8WcHwgKI1Hr3iYcoHX6ZHaePG51cUM7QdW2xrrBVGXUS
         AaKLFhHJTXuNSqkxOumSI10d815vJvcNjXWcaKiM/dHuKZ2RuJ7+h+4p4nMh5ONA06sv
         N5iw+8QB0vo5cNV1UpanJ/R2J/612lSQJglEiuEFLeoVicgsTHg7Ne8+tMdRQ6Ol48Vu
         MPa/J65o1LcancqmOWbwJBrKmsubnGh6e42yLwV24N/T/0l0XKx2zabpxqAI7X0vs/0R
         sVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769795434; x=1770400234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6HRScxpZBIdFwHbDU0nWkn3kbt9KpCxuv2w1T+YYeTI=;
        b=HBV2erLTR1L8tgSWIqkVRm4+s239Xmjs5XBKM6TmRu2o45OaSn19h2fxGD9nvL1xuv
         E0wKJmdGMR/lRAtDItRPnt/HzqsGA8I9Ck6j5RpPEz2znUQMUSXB8p3+PeiXOpc0sUes
         +s+22rm6K60Z3CAPTudCN1zBxocDbRpKgqFJBdui4bNmNvS4Vg6JMT6XQaO/nsCQVbxs
         rsR6bCKDN13eGmDrfW2Mil+tWymuLXXf1W40bCMTInLdYp4vQQC3P3F7Ybcte7/qoVNz
         Vpw2tFSGvoSnVGpA4o5tO202S3AcQV0oPJYQ6h6S8u6v6n06wecDlli+NgvH2d5kAVWo
         8iuA==
X-Forwarded-Encrypted: i=1; AJvYcCVMQbVr9z4uAKGmubVL85n5sBOcXjQ1MhJT7vwAuJsYD+FaVxcF5YILCnm8r6m3EnacHB0zelSgC+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeUGRCy0FtPQJZy5qHuuxJIldD/J5OXu+3GlJBrdhE2ykgLN8/
	YX2fDA3GqG8MIu0a5slyiAiG1vH01fBMu4k3bMLmHj8lXttLjIVQ1nSGtFzFCtOtFa8=
X-Gm-Gg: AZuq6aLhDZyihv3b+gPUtKR2zPRFvVPN3eSe9EgaYfPFTEs3p1Jg0wrbsLCqWAV1mXe
	nWU2jo8EKz4BSQbz5Twmb5Y1NGI8PFsN2SZmuZPUtCgbMRRbZE4tSGn8RpCXG4lRb+VDJXFI1mK
	OQCR4f3E7xIAxCi5bcCBzd22mdcYwJEdJkDlZJRSp/xfDgVlpV5PiW9cMLnfSgzj0hN445gJrgG
	ZEkV8Pjn+RXGO76YMg9+r/c4J6jG23xtG5AiCs7xB5Hx+dGyc/d18ZlM1Zq0eGQjyG5t3c11Jr9
	tEkP9VUSw2CmpAvGWNw6NCdSlkrftvBTC6EFkPNyVK5rb3gD7A6ocN+B4E0+u+XgEx66yZpLG7s
	iBx7QQwnGkAGuQRSzzX+Gbr2+h4wF2G1FmWqT/Q/45Rd9WJtuUWj45HKBfMhe5VRxdCtQRC5VeU
	IcAkpm/qwsse5DU+JkGQFcdoPTRQJ4rqAo9cqmvDnAAO5vObxjsNbCQrOavfgU+rfYEK8vCO3Tb
	+3+HoSq8jzgOwQ=
X-Received: by 2002:a05:690e:1917:b0:649:51d8:6f78 with SMTP id 956f58d0204a3-6499f0b76e1mr5795430d50.24.1769795432893;
        Fri, 30 Jan 2026 09:50:32 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960e0965sm3939108d50.13.2026.01.30.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:50:32 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 30 Jan 2026 11:50:21 -0600
Subject: [PATCH v4 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-atlantis-clocks-v4-1-46de52d52924@oss.tenstorrent.com>
References: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
In-Reply-To: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
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

