Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6C2DCF6C
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461644; cv=none; b=ph7wcmfn+shLQEwR1jTpw18VPpNbAecf49sfMKhuS5YpR0NW+SdeOSRvAwvrT4aokrhKgKVaTzz43ReGH6x0H8p2LWmqg31OgjgAHPOzUAizQHmaii9Ae6xI8r4mD+gHFr/Sf/q66wjrWi6+qI3iUU0J4omTpt0MnoiNA5ExFN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461644; c=relaxed/simple;
	bh=csZKkZyProPFCVAM3eH4n1dn4037V3/YH9UjwOAN5mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFRoL5INz4CK1hds7gLFeLAVHMj6+w85T2q9W83flJhR3ec1C87GWtf3EXmpKV1pXCJ9risnPBMPlag/0EyCxn8TsG/JTk+j5eAt5rw/qZrDGYRAR8JQUddpZIp/uy2qE4r5jO4mszW4xyILwtdpZT4ge7cL4knq3mxpSK5jXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=JpdAjrFa; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="JpdAjrFa"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6493937c208so4516461d50.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 13:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769461642; x=1770066442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmgB4JOviFy42/0uIZfa03y/6mB8pldrtvsYd3V5d+M=;
        b=JpdAjrFaR7c9s0IXlUdzJGeLREKUahUkbPb1gMG5M8Ojlnql35OMvlk/aJggljxh2v
         3wj2Oqelo1uZJIup0Ayozhe9EBBbliklSpXpe/Ov8kbNLIdLMndp1vQJpn9KAgsDwW77
         OaQ2Aao+ZE/kOoalHgoKmSf0pKVsTXTm/Jhg77UP88QX0nY1qF6yi811TUjqSAYGc0tO
         CMeO6hVi0F3cxK2kJEay8eM60HNQvMeKB35zADbTfGMjWaltGMxRgHOAWN+8t5YPtUaL
         c1kqOSyAakixn0B9FAMTdBzsgWtIw14/loJKtix4UKYtGNIYHLui5SaTsRVXwdKvxFPb
         8Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461642; x=1770066442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmgB4JOviFy42/0uIZfa03y/6mB8pldrtvsYd3V5d+M=;
        b=alLrUJRZV0tPD3jZMVrF3HkgJl7bnW0SC0BnXVSssUpmNHZBPX8vU41ch6HpZgPKs6
         p1ZqkpD2QiC4FEiOi0cMnnJGK3LjVth+Vs2aiZ80zW6Vcdk5OXfBogAqsngKwGUpYdTn
         G4oQMGLWWwnXzUNGwLyUa5ap6zYutzwLHYv6X9Z7rAiUHgTfYTJyIgWf3l/kOwl80XsS
         dLLx6IwU8osu0cVaq9s8Ws98klgudAcHrn1J0i4vj2lWmvk0VhqMz5EpQD2gMpar6tOe
         Uk2zJoqmkYqmJeqxOYlypZ/Xch8ZuSDAyusUoYLc9xnUoB20oAmvm3cn0up/mlsDg49n
         dd/g==
X-Forwarded-Encrypted: i=1; AJvYcCVHyGvRO8Wd6JZsoAoA3CsjcjqnMzxvj2i4z767nIKHgPL3KohOrSZ3FiGk5u/jp8Fm2LpwOKyrSkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZsq1dj55CoBqVFiQmrEaDywDT3oYG+f2MPb8YE2G+9hGHGJB6
	kRmjTyRaQW4CCTuQrDQrg4KHgir39HBDhXtCzq/IgelA9JU9MDzbRhY567aY1u5gobytljiVRa1
	PfeNpqss=
X-Gm-Gg: AZuq6aLxUp2dGWWmbefx3vy6E8Vkz24mtO9Q2BdwkWfp2nMVCFxTphJ6nzk/7Za+mDQ
	2SVw6MQKbfJvDflf6K7kT96QUOtI7WDR5nSlD6y/IVoILCZ191CNfFHiMsDOYkVB6HXGLVkAjlC
	tjEtnFh4L3qACJ2bZh3nFhdOFJZykFY2viXf/zR/jaReuorWBKIR6ZjEyjGbHC0NxYR37ZLLpUF
	XzdjSfW3chYnzmzQQC3wL2NKAR/J6IRRtgpsDCRKkQoFYzJzBkdzQa0lcT7fR+MhRn2RLHfW9jw
	KAbFb+WI0TnPfr0hEJmF2hZApl0tlPBzH4Ncf2kc2QTR0AP0UUyDn3y3oIN1TUDXeJtdUjgsW7V
	oAA44IOV3UAfYCYg9XfwC/qwMNuzP9NaH43v1JUPXizBf+/1iOZMl9pZFZEQYKp45maYDZ3CkmB
	vH10g8CZGlUSXU/c9LIrYg5zvVbST+Hg6/yQOohZ82TOsGkdn62ar6N2xaE7J0XPzjrHISFj8=
X-Received: by 2002:a05:690c:6f0b:b0:794:ef5:cf9f with SMTP id 00721157ae682-7945a9cf77amr48608167b3.60.1769461642017;
        Mon, 26 Jan 2026 13:07:22 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944bed27casm37948757b3.7.2026.01.26.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 13:07:21 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 26 Jan 2026 15:07:14 -0600
Subject: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
In-Reply-To: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
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
and resets. This block is instantiated 4 times in the SoC.
This commit documents the clocks from the RCPU PRCM block.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  82 ++++++++++++++++
 MAINTAINERS                                        |   2 +
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
new file mode 100644
index 000000000000..c5716a9928bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
@@ -0,0 +1,82 @@
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
+  subsystem. RCPU prcm serves low speed IO interfaces. PCIe prcm serves all
+  PCIe related functions, HSIO prcm serves high speed IO interfaces (Ethernet,
+  USB), MM prcm serves GPU, display and video processing functions.
+
+properties:
+  compatible:
+    enum:
+      - tenstorrent,atlantis-prcm-rcpu
+      - tenstorrent,atlantis-prcm-pcie
+      - tenstorrent,atlantis-prcm-mm
+      - tenstorrent,atlantis-prcm-hsio
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
+  tenstorrent,prcm-rcpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to RCPU prcm, needed by other 3 prcms (PCIe, MM, HSIO)
+      as the control registers for the PLLs that drive these subsystems are in
+      RCPU prcm's range
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tenstorrent,atlantis-prcm-pcie
+              - tenstorrent,atlantis-prcm-mm
+              - tenstorrent,atlantis-prcm-hsio
+    then:
+      required:
+        - tenstorrent,prcm-rcpu
+    else:
+      properties:
+        tenstorrent,prcm-rcpu: false
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

