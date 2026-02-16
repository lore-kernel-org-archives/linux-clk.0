Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752D17B506
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 22:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771280206; cv=none; b=IEjTRzjMVL994UPwYDSy4j5v1X6g1hk3s53QmYLn2cnvEe9XKRvcfTKkgsBhFWXNK7qSV/8HWfo8lTmgCR+MXxedKZUhh/T/1aZe/QG+M9fvq9zKOYmF60x+qKyfkLMxZi0EJ88sNwN9FTAB/Y10BixuLPGv9YmWc+JPbDQxY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771280206; c=relaxed/simple;
	bh=LRpRrPlFr3WG/Hf0VC5ZlSqIsbeePRU3gQpC8DT4EfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=diL995mafqQFkY/jMMoA50esIwHMzJ6CP+gdl8nCt+v8Um9KtcITLAVzZ0HuqoyLoWIOV814wh58tBbjXerhtz3pASCYfAxdhRhQhGjjcEXPVsVkCSpnzTs4HeK2xqUeyMUbDyB9H5jUpM8pkeAYcCMhQq3xy20TzHF6cUPUC+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=TjlR6okq; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="TjlR6okq"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7946a1f2430so29283177b3.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 14:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771280204; x=1771885004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr9AQ16LUCsHISAxFNb9nZcdT/t7sl0hcy6miHE+OBw=;
        b=TjlR6okqhMKZyI6HVG/2m87mLXaiQ37y0lDiTjz5H+8WhMxfKzTj4moU91DjkV8VW7
         4s+bBJO6FSYuCM3wir1HqsbGFGxuj5X0hCWEsvx3WwT8bM940/p8CT2/RkDyk9saMV9/
         TTdRpfemfC+Osnt4KefJDBgsMCXgzqV4N1VSaSXkqASG0QuZnred2OawW9h17yWTQgUz
         kSFbaiciLrzQN6eIvfvzTZ+f5A9tqIXV47ypz+XU05bGnMB7NHWpSS0LIuZYjnLU1U+q
         gr52D8GlVfa5ClNK9KPxEee23u7ABWKw/p1Vsq3h12mnCCZhcZQFcjWrcJ9alI1T8MoX
         iBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280204; x=1771885004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr9AQ16LUCsHISAxFNb9nZcdT/t7sl0hcy6miHE+OBw=;
        b=szgdUqjLssldjADW4z+n0BcqjeZF38y/j0MFqpW2fj8PU5MMm8NTG/s1ccRGSAZkI0
         Y+BbScQZqtCxajK9fkVbpZ+a2dv4lWTYz8XGwjv7Cd7P/gSqqm206/e9aPB+BtzMzejC
         fG+QJR0k/j/+d5tpoeFCS5LQXUfENAAUciOnT41doFYAd0oPF6pJ1vDulwHAPCIt4bpw
         br059METYpyGvSpGbVZpFckbAXA4XomGQmERwjG8WX4QdgfulsSacdF9A8t62ZmCqyxN
         oJBBgbYOyQYxWv+LQ6qirCIqsCkwAvZri4GELCL5O5+td90VKQNQBsBnabVJlezvUV/P
         GRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdrfteAvPCJ3STlXBCIKVYTuWQsUnVvB6WPPrKJBSMPDx5LyHcyJU6q1pJYsW+KpUFG66fp2ya/vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfJfYfnpANTtOYTYv1TRT1O6XA4vi0pV7CVlEI3eEx59uJuWkx
	tx8nPGSHqGNot3LIdomjM5FYEX63kyYUMdlie7iXVXJJZ9HfOQY8S+mBd+ZpPSoIniQ=
X-Gm-Gg: AZuq6aJD73eIz+Maxolf9Y/dzeQwhDmSb2mQUzDh6fmaW51MrX8BplEBykt9ysXqZTA
	ttI3aoHHjKZEBHGDPpO6Vguc93e3Ge1zfpdQUl4Tm7idf+5eGbVsmBqwITLxpAq4z+BeRe2Oz3S
	YafiG9UgZN/Pkj4bke6ypDGB3BmCpBgjWL6/dnvH5HI4cqd2Vu4AnFtj7U4FOlxW3gjysoFpMVi
	Oy7EdbLoPqlEUSSeyrkxeQjc9NGS0G1wPoL1IyFw+E4m2EeSZgsYMytKXogVy2CJUDgsI7hXwrK
	0b/mIcRU2rTIC0GjbK+1rNFUxynHBsUrOjyfh57qIfMl16G7sfwk/RQsMtSKRcZn5zEdADEC+vb
	D/rXlFf/Tok2rxmqiH5Kwqm+byQ95+vnHUcAytRzrgGQNWSK8/GPDZ8G6p0iMCR2ESBqYU3H2+S
	OzP81acmDYicjMDpbe9WbWFWXKB7Dbl/2jEh3ThAGuq1ccqST+4aYwP7/QPFQB2ZngHeq3NjfM+
	FbXPKZatJ0=
X-Received: by 2002:a05:690c:4884:b0:794:ef94:120d with SMTP id 00721157ae682-797ac5263d8mr72932517b3.24.1771280204562;
        Mon, 16 Feb 2026 14:16:44 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c1a8222sm106705757b3.23.2026.02.16.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:16:44 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 16 Feb 2026 16:16:32 -0600
Subject: [PATCH v6 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-atlantis-clocks-v6-1-cb46d6a59c73@oss.tenstorrent.com>
References: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
In-Reply-To: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
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
index dc731d37c8fe..24cd2bbe1c78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22534,8 +22534,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
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

