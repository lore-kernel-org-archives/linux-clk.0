Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638111;
	b=aeMtm8Ldh+ky6KkL77kJWtsZ1hY5lnpyteUEAtCsOBdGBAGpoCNcbbzkJLvZcTlwtWF4
	 qyG9JprS32LDn63zJyxY46ireuPdg0C6QcDCj8BW9HH1VuazlV0wsMWyO4j1iLSfEMmm5
	 pOkNiTyQAAZsjBcz7prp1wED0N1231ebpMfRsHWAanHNYPb5cp+OvEI7eLkG2gJeqnit5
	 J+VZ+NWh+w6l/HNOBNSCVU8DL3bpqMnYE1Eq3TQmdvJLv1YKO/dB7WAPOjGGTyJiNDIKf
	 GBDy0kvtk+Y4jclGZ2RwEy+al3BOOQkdipf+1j658ZkRapQlwxGo/SnQYaQ0h+BnzNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O79Vd+fXfIq+VR2uVQlpXLAyV+Ok3kmr2rMar+N7Hms=;
	b=k2ueH1MlfzBi2KlurvLBsnrYTkcOQWkJugV2xms8Qf4OXVK3nvLmO7P1x02OCecdi/a1
	 7Jet6dDEn6ED63CkKx1UUvjjew0BdX72S/VbNbfzpmPRre6eVL1AYSLiKJOUXR/PR8MjE
	 ilQoFEtVY666gooqPMCyWcy8gRW6TGjZYYZvLX+ClylqTrErgb3oUWOounHNExXmD/sTj
	 bl6yIHA9l2fkm/78QVTms/3yoVI/yfV7tvOZD2gMT0UMnfbd0WJ//qOYBzTVkyTBhUQ6X
	 0PMaVJtKGVQmUwUtePS9z7xmsq24Ps0B9QZ3otxGDION+H5IGm4Cxu/IFU+yzyhYOBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=f3Y3nR6R;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F31606A687
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F31606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=f3Y3nR6R
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-86103aaac12so3924974a34.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638109; x=1796242909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O79Vd+fXfIq+VR2uVQlpXLAyV+Ok3kmr2rMar+N7Hms=;
        b=f3Y3nR6Ra6EqG3aBkDAPKlwTr/Hcj6QPSayKqADnD9mtGee+/zi7hJT5UD8hENvjcq
         bYBzIwAq8YgwOkLJ6lItYSq7MTT6I6rHfJE8sKQUlavErPzFpbGAiAEeYBWH/zz06Gbw
         reNP3eCEDn8RSIXngy0M3YMptiaiLNEs8cTBxdWmWwWNqQhg3E0F+RPQvS3eCNuxCfpQ
         Y8caovMqVESSTPlw9wt+SMYqTI87lUv0Bof9bCD/O8DtNpvQBxzY3Ncy2T5bp4Zvun1L
         p34EFdHd7AjZ9D0voKLe8m6p1NzrE2CS8UTr48Fd1Je4g6ZoMA6bOrOx52FOR9iIpvcx
         zGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638109; x=1796242909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O79Vd+fXfIq+VR2uVQlpXLAyV+Ok3kmr2rMar+N7Hms=;
        b=LKR8iGylmupmYjVP7fJY/sfj0+fZb79nnJ2z1zQmgqHe6KBitBeGZjkQOADZHID6sG
         eq/wULHRWvUrnlhG3kDSOlwrgQYOddisdcJWHku4uzWIQDHjR/zMXZgxYX8FeiO6jcjT
         kYcp6KSY+TjMY9+OyXfUo59S2eRUe9P5ihoA98u1O+UxKwJrdGIzqRrFgnK8vF8Fk2/P
         s/EqMPP/3Az5pifjra/JUzaF1ySjoRRfXkaMw9f5LM3iyVpYRgCT1G0Qtxlxbeyx/O1n
         I4x9VhBU+I0DDUGBdDIox0zPXXH5jvaHpYwQuTHa2e2j9au8cj26J/g80YkoJk3cNqe+
         +I9Q==
X-Forwarded-Encrypted: i=1; AL+hErFdJfaQClVfqzaLyOmVScbsGgGJGqNzzINono/2HI0KM2Iv2C1hRDLQhsKUitE1cLcavFbr1ojdUl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z92qQ+xLpO0kUy+mpqWEC5rSMkfvN83Al/uOUF3A6DPKWSC1zCp
	vOrQiBDkL0SgMlbWM/zeFhWrXCL/5sNEu00HdfOXAAEuDY3jiv9QMJjoA4FuB0l0IJs=
X-Gm-Gg: AZFdTZdFET9j7oibR5yRPbaY3CdtXoPd8Cizf3hiF9kBQB1MDBRgg0XB9Nu45brrDeB
	KEcTPZ8XXNrFoJvE/vEPluaowD/lo79etAZCclE4hhbU6sslJNGwaoCNiyWppWTb69Kjx0UgrRt
	7WXrbDbSpGi1tJMgoPnO1ajMFBRc/cUesH0tjIeHuJSdU71KzRFlMSp4Hd6BxxOBT/EOqj1LQhm
	K1bp5K+JR/DVRGVDzQyFQYSkQP/eyGU9i/rhy4rzi+BlqVT6mf0baG+Lgtm5+HqEZzGNWiKnBO/
	rPb/bztVBXoKXREhhCa3DdEe7b2+MFCL6fzBF9X7YNO6gHpZO3NSaxXmDDXvnfU+jUzuZl0k3Zo
	7Wy9fmGrsPRNYiJIRI82ZrZPqlmOS6FMieMplfF/28IDn1RcS7/6rB5RYaTk92/Hz39cBuUkRvI
	8xLKWxfPRt30sJ85gPVzenpwefpH3ihMNCQJAVBMacrjgHUUYgLAc1QFdvFwCi+qkxOEUrqoh53
	29Lws3p7KSpPmDht6BO4FBLztM8uZR7oSF3+gp86ewT2l5ZK6fr3cWL/sSrPmtQZc7GeM32JSsj
	+p/QzvRTtuPZPjbkV46cWxKgjtxypNa31v3m
X-Received: by 2002:a05:6808:1645:b0:4d6:9133:cfeb with SMTP id 5614622812f47-5797e59a98amr13774304b6e.48.1795638108844;
        Wed, 25 Nov 2026 12:21:48 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:48 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset driver
Date: Wed, 25 Nov 2026 14:21:40 -0600
Message-ID: <20261125202141.1288493-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a new platform driver that manages clocks and resets implemented
by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
and disabled, but currently only the clocks that are (or will soon be)
used are defined to be controllable.  There are also 13 resets that can
be asserted or deasserted, but support for some of these is omitted as
well.

Two registers manage the state of the clocks, and two others manage
the state of the resets.  All four registers are found in a region
mapped for MMIO.  The region is provided via a BAR on one of the PCI
functions embedded in the TC9564 SoC.

The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
state should never be changed (and a warning is issued if changing their
state is attempted).

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Fixed problems/garbage in the patch header
    - The Kconfig option now depends on RESET_CONTROLLER, and can now
      be enabled if COMPILE_TEST is enabled
    - The generic gate clock controller code is now used rather than
      implementing a custom one
    - The PLL and internal fixed clocks IDs are no longer available
      outside "clk-tc9564.c"
    - The PLL is initialialized, followed by all fixed rate clocks,
      followed by the gate clocks, to ensure each clock's parent is
      initialized before the clock is
    - Updating the reset registers (read/modify/write) is now protected
      by a spinlock
    - "Unnecessary newlines" have been removed

 MAINTAINERS              |   1 +
 drivers/clk/Kconfig      |   9 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 467 insertions(+)
 create mode 100644 drivers/clk/clk-tc9564.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 36107e0790780..ac27a9bf55c41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28722,6 +28722,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
+F:	drivers/clk/clk-tc9564.c
 F:	include/dt-bindings/clock/toshiba,tc9564.h
 
 TOSHIBA TC9564 PCI DRIVER
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 6bfa2c8fffe1b..897f4a4c74edc 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -185,6 +185,15 @@ config COMMON_CLK_CDCE706
 	help
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
+config COMMON_CLK_TC9564
+	tristate "Toshiba TC9564 clock and reset support"
+	depends on TC9564_PCI || COMPILE_TEST
+	depends on RESET_CONTROLLER
+	default TC9564_PCI
+	help
+	  This enables support for the clock and reset controllers embedded
+	  in the Toshiba TC9564 SoC.
+
 config COMMON_CLK_TPS68470
 	tristate "Clock Driver for TI TPS68470 PMIC"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 99377a13ebc57..d67cfb6d623d3 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
+obj-$(CONFIG_COMMON_CLK_TC9564)		+= clk-tc9564.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
new file mode 100644
index 0000000000000..306781e2f7b4f
--- /dev/null
+++ b/drivers/clk/clk-tc9564.c
@@ -0,0 +1,456 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/toshiba,tc9564.h>
+
+/*
+ * Define the offsets for the registers that implement clock enable/disable
+ * bits for gated clocks, and those that implement reset assertion bits for
+ * resets.  These offsets are relative to the address space defined in
+ * devicetree.
+ */
+#define CLOCK0_OFFSET	0x0
+#define CLOCK1_OFFSET	0x8
+
+#define RESET0_OFFSET	0x4
+#define RESET1_OFFSET	0xc
+
+/*
+ * A PLL driven by a 25 MHz input oscillator provides a clock source to
+ * the chip.  A set of fixed rate clocks is derived from the PLL, and a
+ * set of gate clocks are children of the fixed rate clocks.
+ *
+ * The clk_hw[] array within a clk_hw_onecell_data structure tracks all
+ * of them.  The following definitions describe how these are laid out
+ * based on their indexes into the clk_hw[] array.  Gate clocks are first,
+ * so their "raw" public IDs can be used as indexes into the array.
+ */
+#define GATE_BASE	0
+#define FIXED_BASE	(GATE_BASE + GATE_COUNT)
+#define CLOCK_PLL	(FIXED_BASE + FIXED_COUNT)
+
+/* The total number of clocks in the clk_hw[] array */
+#define CLOCK_COUNT	(GATE_COUNT + FIXED_COUNT + 1)
+
+struct tc9564_clock {
+	void __iomem *ioaddr;	/* Mapped clock/reset registers */
+	spinlock_t lock;	/* Protects reset register updates */
+	struct clk_hw_onecell_data *clk_data;
+	struct reset_controller_dev rcdev;
+};
+
+/* Indexes into the fixed_init[] array */
+enum fixed_clock {
+	CLOCK_62_5M,
+	CLOCK_125M,
+	CLOCK_250M,
+	CLOCK_312_5M,
+};
+
+struct fixed_init {
+	const char *name;
+	unsigned int div;	/* Rate is PLL rate divided by this */
+};
+
+struct gate_init {
+	const char *name;
+	enum fixed_clock parent;
+	u8 offset;		/* Control register offset (0x0 or 0x8) */
+	u8 bit;			/* Bit in the control register (0-31) */
+	bool critical;
+};
+
+struct reset_init {
+	u8 offset;		/* Control register offset (0x4 or 0xc) */
+	u8 bit;			/* Bit in the control register (0-31) */
+};
+
+/* Add FIXED_BASE to index values to get their index into the clk_hw[] array */
+static const struct fixed_init fixed_init[] = {
+	[CLOCK_312_5M] = {
+		.name = "312.5MHz",
+		.div = 4,
+	},
+	[CLOCK_250M] = {
+		.name = "250MHz",
+		.div = 5,
+	},
+	[CLOCK_125M] = {
+		.name = "125MHz",
+		.div = 10,
+	},
+	[CLOCK_62_5M] = {
+		.name = "62.5MHz",
+		.div = 20,
+	},
+};
+#define FIXED_COUNT	ARRAY_SIZE(fixed_init)
+
+/* Add GATE_BASE to index values to get their index into the clk_hw[] array */
+static const struct gate_init gate_init[] = {
+	[CLOCK_MAC0_TX] = {
+		.name = "MAC0-TX",
+		.parent = CLOCK_312_5M,
+		.offset = CLOCK0_OFFSET,
+		.bit = 7,
+	},
+	[CLOCK_PCIE] = {
+		.name = "PCIe",
+		.parent = CLOCK_250M,
+		.offset = CLOCK0_OFFSET,
+		.bit = 9,
+		.critical = true,
+	},
+	[CLOCK_I2C] = {
+		.name = "i2c",
+		.parent = CLOCK_62_5M,
+		.offset = CLOCK0_OFFSET,
+		.bit = 12,
+		.critical = true,
+	},
+	[CLOCK_MAC0_RX] = {
+		.name = "MAC0-RX",
+		.parent = CLOCK_312_5M,
+		.offset = CLOCK0_OFFSET,
+		.bit = 14,
+	},
+	[CLOCK_MSIGEN] = {
+		.name = "msigen",
+		.parent = CLOCK_125M,
+		.offset = CLOCK0_OFFSET,
+		.bit = 18,
+	},
+	[CLOCK_MAC0_125M] = {
+		.name = "MAC0-125MHz",
+		.parent = CLOCK_125M,
+		.offset = CLOCK0_OFFSET,
+		.bit = 29,
+	},
+	[CLOCK_MAC0_ALL] = {
+		.name = "MAC0-ALL",
+		.parent = CLOCK_250M,
+		.offset = CLOCK0_OFFSET,
+		.bit = 31,
+	},
+	[CLOCK_MAC1_TX] = {
+		.name = "MAC1-TX",
+		.parent = CLOCK_312_5M,
+		.offset = CLOCK1_OFFSET,
+		.bit = 7,
+	},
+	[CLOCK_MAC1_RX] = {
+		.name = "MAC1-RX",
+		.parent = CLOCK_312_5M,
+		.offset = CLOCK1_OFFSET,
+		.bit = 14,
+	},
+	[CLOCK_MAC1_125M] = {
+		.name = "MAC1-125MHz",
+		.parent = CLOCK_125M,
+		.offset = CLOCK1_OFFSET,
+		.bit = 29,
+	},
+	[CLOCK_MAC1_ALL] = {
+		.name = "MAC1-ALL",
+		.parent = CLOCK_250M,
+		.offset = CLOCK1_OFFSET,
+		.bit = 31,
+	},
+};
+#define GATE_COUNT	ARRAY_SIZE(gate_init)
+
+static const struct reset_init reset_init[] = {
+	[RESET_MAC0_MAC] = {
+		.offset = RESET0_OFFSET,
+		.bit = 7,
+	},
+	[RESET_PCIE] = {
+		.offset = RESET0_OFFSET,
+		.bit = 9,
+	},
+	[RESET_I2C] = {
+		.offset = RESET0_OFFSET,
+		.bit = 12,
+	},
+	[RESET_MSIGEN] = {
+		.offset = RESET0_OFFSET,
+		.bit = 18,
+	},
+	[RESET_MAC0_PMA] = {
+		.offset = RESET0_OFFSET,
+		.bit = 30,
+	},
+	[RESET_MAC0_XPCS] = {
+		.offset = RESET0_OFFSET,
+		.bit = 31,
+	},
+	[RESET_MAC1_MAC] = {
+		.offset = RESET1_OFFSET,
+		.bit = 7,
+	},
+	[RESET_MAC1_PMA] = {
+		.offset = RESET1_OFFSET,
+		.bit = 30,
+	},
+	[RESET_MAC1_XPCS] = {
+		.offset = RESET1_OFFSET,
+		.bit = 31,
+	},
+};
+#define RESET_COUNT	ARRAY_SIZE(reset_init)
+
+/* Caller must free the returned pointer if non-null */
+static const char *clock_name(struct device *dev, const char *name)
+{
+	return kasprintf(GFP_KERNEL, "%s-%s", dev_name(dev), name);
+}
+
+/* Initialize the PLL (parent is the input oscillator); called from probe */
+static int pll_init(struct device *dev, struct tc9564_clock *clock)
+{
+	struct clk_hw *hw;
+	const char *name;
+
+	/* Initialize the PLL clock first (input oscillator is parent) */
+	name = clock_name(dev, "pll");
+	if (!name)
+		return -ENOMEM;
+
+	hw = devm_clk_hw_register_fixed_factor_index(dev, name, 0, 0, 50, 1);
+	kfree(name);
+	if (IS_ERR(hw))
+		return dev_err_probe(dev, PTR_ERR(hw),
+				     "failed to register pll\n");
+
+	clock->clk_data->hws[CLOCK_PLL] = hw;
+
+	return 0;
+}
+
+/* Initialize the fixed rate clocks (PLL is parent); called from probe */
+static int fixed_clock_init(struct device *dev, struct tc9564_clock *clock)
+{
+	struct clk_hw_onecell_data *clk_data = clock->clk_data;
+	struct clk_hw *pll_hw = clk_data->hws[CLOCK_PLL];
+	const char *name;
+
+	for (u32 i = 0; i < FIXED_COUNT; i++) {
+		const struct fixed_init *init = &fixed_init[i];
+		struct clk_hw *hw;
+
+		name = clock_name(dev, init->name);
+		if (!name)
+			return -ENOMEM;
+
+		hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, name,
+								 pll_hw, 0,
+								 1, init->div);
+		kfree(name);
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw),
+					     "failed to register %s\n",
+					     init->name);
+
+		clk_data->hws[FIXED_BASE + i] = hw;
+	}
+
+	return 0;
+}
+
+/* Initialize the gate clocks; called from probe */
+static int gate_clock_init(struct device *dev, struct tc9564_clock *clock)
+{
+	struct clk_hw_onecell_data *clk_data = clock->clk_data;
+	struct clk_hw *parent_hw;
+	const char *name;
+
+	for (u32 i = 0; i < GATE_COUNT; i++) {
+		const struct gate_init *init = &gate_init[i];
+		unsigned long flags;
+		struct clk_hw *hw;
+		void __iomem *reg;
+		u32 parent_index;
+
+		name = clock_name(dev, init->name);
+		if (!name)
+			return -ENOMEM;
+
+		/* Each gate clock's parent is a fixed rate clock */
+		parent_index = FIXED_BASE + init->parent;
+		parent_hw = clk_data->hws[parent_index];
+		flags = init->critical ? CLK_IS_CRITICAL : 0;
+		reg = clock->ioaddr + init->offset;
+
+		hw = devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw,
+							 flags, reg, init->bit,
+							 0, NULL);
+		kfree(name);
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw),
+					     "failed to register %s\n",
+					     init->name);
+
+		clk_data->hws[GATE_BASE + i] = hw;
+	}
+
+	return 0;
+}
+
+static int reset_update(struct reset_controller_dev *rcdev,
+			unsigned long id, bool assert)
+{
+	const struct reset_init *reset;
+	struct tc9564_clock *clock;
+	unsigned long flags;
+	void __iomem *reg;
+	u32 mask;
+	u32 val;
+
+	/* Warn on any attempt to change state of a critical reset */
+	if (WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE))
+		return 0;
+
+	clock = dev_get_drvdata(rcdev->dev);
+	reset = &reset_init[id];
+	reg = clock->ioaddr + reset->offset;
+	mask = BIT(reset->bit);
+
+	spin_lock_irqsave(&clock->lock, flags);
+
+	val = readl(reg);
+	if (assert)
+		val |= mask;
+	else
+		val &= ~mask;
+	writel(val, reg);
+
+	spin_unlock_irqrestore(&clock->lock, flags);
+
+	return 0;
+}
+
+static int reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return reset_update(rcdev, id, true);
+}
+
+static int reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return reset_update(rcdev, id, false);
+}
+
+static int reset_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct tc9564_clock *clock = dev_get_drvdata(rcdev->dev);
+	const struct reset_init *reset = &reset_init[id];
+	void __iomem *reg;
+
+	reg = clock->ioaddr + reset->offset;
+
+	return readl(reg) & BIT(reset->bit) ? 1 : 0;
+}
+
+static const struct reset_control_ops reset_control_ops = {
+	.assert = reset_assert,
+	.deassert = reset_deassert,
+	.status = reset_status,
+};
+
+static int tc9564_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct reset_controller_dev *rcdev;
+	struct tc9564_clock *clock;
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	int ret;
+
+	np = dev_of_node(dev);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	clock = devm_kzalloc_obj(dev, *clock);
+	if (!clock)
+		return -ENOMEM;
+
+	clock->ioaddr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(clock->ioaddr))
+		return dev_err_probe(dev, PTR_ERR(clock->ioaddr),
+				     "failed to map registers\n");
+
+	clk_data = devm_kzalloc_flex(dev, *clock->clk_data, hws,
+				     CLOCK_COUNT);
+	if (!clk_data)
+		return -ENOMEM;
+	clk_data->num = CLOCK_COUNT;
+
+	clock->clk_data = clk_data;
+
+	/* We need the driver data pointer to initialize clocks and resets */
+	dev_set_drvdata(dev, clock);
+
+	/* Set up the clocks and register the provider */
+	ret = pll_init(dev, clock);
+	if (ret)
+		return ret;
+
+	ret = fixed_clock_init(dev, clock);
+	if (ret)
+		return ret;
+
+	ret = gate_clock_init(dev, clock);
+	if (ret)
+		return ret;
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add clock provider\n");
+
+	/* Set up and register the reset controller */
+	rcdev = &clock->rcdev;
+	rcdev->ops = &reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->dev = dev;
+	rcdev->of_node = np;
+	rcdev->nr_resets = RESET_COUNT;
+
+	spin_lock_init(&clock->lock);
+
+	ret = devm_reset_controller_register(dev, rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
+	return 0;
+}
+
+static const struct of_device_id tc9564_clock_match[] = {
+	{ .compatible = "toshiba,tc9564-clock", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tc9564_clock_match);
+
+static struct platform_driver tc9564_clk_driver = {
+	.probe = tc9564_clk_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = tc9564_clock_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(tc9564_clk_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 Clock Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

