Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84B40148E
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817155; cv=none; b=hX2rNi94mWnnNFYRjBQIBHjxlOosW8EX0M3T5Xj1C6NJef1b5pZm2Rp0l6MjG7iSpyRyIOEEAFocz8UUXlnWRakRJVOsRfQmXQ8f63EKWaI+jY83dTECKrBWp9ZADsimdQ8dNQF4fVNZXseY2gDP+UDs94JGjfgnt/avupMwCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817155; c=relaxed/simple;
	bh=fp8nE++navWYOkQ3djT9eJLiAzC5FLM5ImcyELeJg0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTWss+BYtQZJiqn/i1Ijm46M3W66DF663xJZGkjExZ8y5nZS+8dz2erxTXrBCERsq11FnN1asVYDHb7IWh7H/L0Rdj8chs+51AVHhan69j5xXI6hPZejp4mg2avwh9I8WUKT3/RsdKwJ+sfSdxpz0qv5YFh2pTfDBtDk94SzLi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Frt3Bw99; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Frt3Bw99"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79853c0f5b9so81036257b3.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 09:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772817153; x=1773421953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HaqjdpdHc/fQbEY4OtrbjxxM+K8US2OS03rxWtvBv4=;
        b=Frt3Bw99r+MxvYMMfo96j99eoliE91SyPxaShJW9I/CIMTcNWfEznGMu3XfR4AC3pC
         0egcDKWaNCrTbi188250uozTgMw87teJyNevt1chQFouOIcVG+ZtWVEDrOtjaloGo3II
         2RcjXzcQ299gJ9F9oemt593HbWhyFcqrXYAnnmogt/0SESayphCU4lE/mYJB5zUkYKEG
         /X2ZDrt+MFdQ5Scy1yRIFVJVoa+aiMMLMtXN3czMuLMuc4vMPN68uha65Ny9gP/6AK2T
         S8WSB20i8GQxt+JwVysCJCVTEfTWSlCeDstM4u2HifSrCQJ9gjlinRiCjBPP3byfTHp5
         LWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817153; x=1773421953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HaqjdpdHc/fQbEY4OtrbjxxM+K8US2OS03rxWtvBv4=;
        b=sfPpjZgL/L3CpibIC3olLb9CUaAnWUNTVPnAW9fa74O/mV+EgyeNfmCAMlTJOnbCf2
         2AsDH4OPT+Gt8WcbdJSswDRWMtm7mufEwMtafLKaSVmjdUE1C1W1HDsUo5ASJhzTIHL2
         aI77XOmrR9PRU8uIwilHvzhVlO6D2o9pYzYEwtHmv8mNn3FZb9ilNS21+W2c2X1kV5Ex
         x0gi5u9T1MFixUmEOMN+VZqF3M4SFTfpp2UQETmTTow8yS5xUkg4/DuJDMwOvzWrTgLQ
         uIs5gfNTob6W401dIK4rBXClUIzRMjc8evQNvhqnaF71xp6PY+sRgohdCWEnhSIafcN0
         plMw==
X-Forwarded-Encrypted: i=1; AJvYcCX3JvZhtwGvPQXChxXUDRURdVZfrFA0FqTJFKHbGJJzBelIaeXga7VDtR+CNOEdw/LiFEY3Vvh1XHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DZg+8NdgeS3QnfLZa13me3z6oAdlmg+Vl/ePDT+g/EyLc8av
	AA0ajYY7uubg/ifyCZawFdGQVnMffxrJTg0HhrS6TOOty+U2Ld/kq2qpS2JsLrl8k3o=
X-Gm-Gg: ATEYQzzFkb9eadvWn6xpwiobZVNMUbSSgIHt1Q07tXit+X59WEFZTPh5sKx25CiLCsx
	Lo9cD8kE1q5mtjAOKnQUSQ7jIi/cR1wRn7OUNNI2aY1wmmCCq3+O7x6pouq/8n/nrEuzRjcClBI
	qL9QOJ0Fwt+R3TrT9Al1EcpKWthMevNU+l5JADHg00OwCuQ4vXMC+pYP3GPJObAznM0/Pls1Mh+
	EMmYkjlkQNyHB7i/xHVEeZ1zFVoYlJJluqbN1KVW8GEWpc1USGAuvKtF12yOSQHfoDph1//FpNO
	Sm9dn4zUiqEiUGeZ2PqHpHdC6Xgqe5pofnGodgxkb/dSbB3vI+zBv9yQgOE411deN/Ai0uUVsjI
	U6W3Rv/cPL7gzN0PizOcxRI+lsF5h6dROSpjdRL0xL9JgH+FDVAcz1VuR2DY2yr7GeRzVAAs+3X
	IcCfBuuN0pNmBfcfzeROKXj7jAXGrAAyjqLHSmwAFCCDbWKSRjmJh9mixPJO5HyF2pJMQbrmjF3
	p4VELr13Yc=
X-Received: by 2002:a05:690c:450e:b0:798:1637:ff0e with SMTP id 00721157ae682-798dd6b047amr28584697b3.22.1772817153174;
        Fri, 06 Mar 2026 09:12:33 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798ded769ecsm9331237b3.23.2026.03.06.09.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:12:32 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 06 Mar 2026 11:12:17 -0600
Subject: [PATCH v8 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-atlantis-clocks-v8-1-6c9b14a4aa8e@oss.tenstorrent.com>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
In-Reply-To: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
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

