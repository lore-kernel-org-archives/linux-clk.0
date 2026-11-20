Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180292;
	b=PXV2R6CI2sKPpV5OIP+lFj1JiyQWEQ8BOhgNnnHihpi4kSXCTUVf+qB8uiBKDhbTJ/uK
	 IiEm3ay3djVWob1+Jug5sqaF3iQWHeM+6mE0Q7HhCOhXn7i1jfa0CtJLu7/HnE+queG2U
	 dbGP7es/QWd9v+yBrNKUAbOMt4T4F5mB1q7gr6FNtEDQXR4XEZnWacV1dcGCEK+p2CkDG
	 zu0tEwPUHUGVg/8U69YJHoDlD3g27UyP3Wxm77mb4IwS0rOIwGySm08/Tp/kGzsohW2qJ
	 9fVTSwpZKF0IuAZU8FgQxkD9AuZTUG3muCUzRc8hwx2loK2N9gENh6jVcmD5rNPfhmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Oz3DzHqzANRXdOf1qOfILmgSuOIeY8r0MCU4DvwHK+g=;
	b=hQcHg5AxIpTcyX4M0QdZP3ELnqzCarBRStklXoVNJ0AP9GgC6qFNqFglw43na3vBiQxs
	 OhslBoZgK3v8Uk9KaYqgCZFDXMvizFLOu0MLYT63iJD9vzyRb5mgoFwVIRxKxvOckHdv3
	 Q9JNAVL3Ra14VPxsrCfqgyk7NbOYgK1RR+MLY/7vtR6Djsa5EHk4RokHBe6VZqyco3GJJ
	 Ji6xhy02V2RfUJepuDcQDEJWRNkkPppIjZcKhFIKTxWTGtYwHEA6vapV4lIlYuKyEUTkA
	 X6BOfcq2X4NQpVuR55Y8tX/6BpAgbkE1EA0HWviJRdt1kT+KsX+jGfH+b2l/nrFn4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2dwZVH6;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A3460A5BCD
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 13:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A3460A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2dwZVH6
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so7642115e9.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 05:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180289; x=1795785089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oz3DzHqzANRXdOf1qOfILmgSuOIeY8r0MCU4DvwHK+g=;
        b=K2dwZVH62DJ0MhbVE2obXAXq2YkOu0/ie7jWD9t03C9HOPWTOUiSNsruo/2KIYHhYp
         0wpnyzFGX3MyeTZqSUO9wntSkrjOZTljrVPKHUBbGm2uH4M+FReybhHtSFCegzb89xvF
         aGFz1JVwPSLYGLWCH7yxJGph6xOHa8Pm11HF4mDqLJxwyXVDGM8VAasik+y5QFRg0GXc
         wcAEZqDrX01/7uO9IDCwa8Ds+n2WKykkTmgMcUou7K0IpSHIan51dDQqxXbQhjV4pXhl
         tsWVUWFWhsnWT59CeBF/AGY9dQrdEGPpReAoRRWRIm4ZfP7KNZ6rK1YINhyg1Z2V5/3+
         GvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180289; x=1795785089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz3DzHqzANRXdOf1qOfILmgSuOIeY8r0MCU4DvwHK+g=;
        b=FpQUYlG8accI9urJQt5+nczde45DkXzosRNDKVqMbjnXAekYOGLMtpPXo3FbhcCWiS
         is80yfN4NRVmnmUnli1aIDhsWe3QPPqk35RMUILJ8x/RrjOmxpDbvn0qz4h5hLIZgGe4
         HnUx82E1EZJvzEIsoumyAZLlEN1+C3MNYEPNXtPKYw/Uy7HEE5o6vYE4o+Ceq4GtuPGD
         /iQyCC/A8kUXOWJKhP73G3dLGtcZKO2FUF8Lg8IAO88hS6pwTFZLrNEjheiXktCq8c3C
         POm8FB2s9akHxUYghVb6JVw9/S+OxL+5vPkGqbtc1kK6L3GdFOgHddUi6d8EgRPjurd+
         XWxw==
X-Forwarded-Encrypted: i=1; AL+hErEOhGzgQDXgZJMLgYCwnlF02vFjpnS89NfuNFm47BEp3qT44SI35pWOfJutfShBHunpGycGiZYZ6gs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j52mUX+XCWlkZsObxtRi7swyn5Xa0c+D2J2zBoiX8JoI2ko01
	Riw8HYTHElZxwGzHAg8Ugr0OQChQiry+a1gJ+jEZ3lrQfXyQ4Cq61Im7I1RXdipBqS8=
X-Gm-Gg: AYBFou32CejFpa/qDfnmiv9Ot6AnhktR9kiGRpfJf/SD2xaLR2QQ/tlQjA5S1mk1PA8
	VkvVsUNG/exdmvCOxQql7ezB4MB5l2icP9Z3H+QQSnpvCLiY6CFlgeBdFLJe8tRktXn4gH4Wn6U
	npJEZRtjDjDZ/D2xGO12tybZphVeAnQoaDxFRw4MvH5npZmvGHPDDtRQtoV8fQZ0Xi+XKISmWQ4
	yle+oFOD7mdIkhIJaw9h3olbRWZ4L3sJ1LO486/4fXk+tHGDbH1TSpeExmwGIeeh1Y0KAjvh1qF
	gQEvQ5X8sgZiOwXOzCz7Alj9hJa3Q6hy4zxAAq+bYh1EeXKo0lHQStvUbwZtjH7wBlbQXvRpYR7
	/MU0ohn+CPRMQvp/tc1MhqJEHrboXqb/oIN7WuQoqy4PGwGlGc+oCpj9bI77ubPaB/AXgKyRBOA
	IFephaZOKbKch7qKa8jjhpBnjsSkQdeuNnKB06knx04/v4oFNiZy0bgjz3gIk6QuJ4rNffSfT5a
	zwNJd/5MiJJ2IRqJ4Zorny+7KA361i/kbcqCqSKW3a2SmMMRY/4/UKbVM2yU6YGlfmF64JADlMc
	J872gETH+K8medzZWa2iqZEUjOR/3x3ZczA8SNqqfHu8zWxyb+WRQhr6tQ7r7f/ZA4kwwA7AxY0
	r4DeD4nYfJSPV92vWPpvybTmRtQaVbR+wTo9aM2+Qcp/1QQ==
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr72990565e9.4.1795180289461;
        Fri, 20 Nov 2026 05:11:29 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:29 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:07 +0100
Subject: [PATCH v2 4/6] clk: amlogic: Add S7 PLL clock controller driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-upstream-s7-clk-v2-4-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The S7 PLL controller provides the fixed PLL with its fclk dividers,
the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.

Add a driver for it. The GP0 and HIFI PLLs are expected to run with
their input divided by 2 (div0p5) and the HDMI PLL without it, as the
firmware and the init sequences set them up.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/Kconfig  |  14 +
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/s7-pll.c | 696 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 711 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index d460514bb8a1..35f2971448af 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -229,6 +229,20 @@ config COMMON_CLK_S4_PERIPHERALS
 	  Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
 	  devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
 
+config COMMON_CLK_S7_PLL
+	tristate "Amlogic S7 SoC PLL controller support"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_MESON
+	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_PLL
+	imply COMMON_CLK_SCMI
+	help
+	  Support for the PLL clock controller on Amlogic S805X3 based
+	  devices, AKA S7. This controller provides the fixed PLL and its
+	  dividers, the GP0, HIFI0 and HIFI1 PLLs and the HDMI PLL. Say Y if
+	  you want the S7 PLL clock controller to work.
+
 config COMMON_CLK_T7_PLL
 	tristate "Amlogic T7 SoC PLL controller support"
 	depends on ARM64
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 56b04254eb1a..9d439106d11c 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -28,5 +28,6 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
 obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
 obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
+obj-$(CONFIG_COMMON_CLK_S7_PLL) += s7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PERIPHERALS) += t7-peripherals.o
diff --git a/drivers/clk/meson/s7-pll.c b/drivers/clk/meson/s7-pll.c
new file mode 100644
index 000000000000..737420027d83
--- /dev/null
+++ b/drivers/clk/meson/s7-pll.c
@@ -0,0 +1,696 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Amlogic S7 PLL Clock Controller Driver
+ *
+ * Copyright (c) 2026 BayLibre, SAS.
+ * Author: Carlo Caione <ccaione@baylibre.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "meson-clkc-utils.h"
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+
+#define FIXPLL_CTRL0			0x040
+#define FIXPLL_CTRL1			0x044
+#define FIXPLL_STS			0x05c
+#define GP0PLL_CTRL0			0x080
+#define GP0PLL_CTRL1			0x084
+#define GP0PLL_CTRL2			0x088
+#define GP0PLL_CTRL3			0x08c
+#define GP0PLL_STS			0x09c
+#define HIFI0PLL_CTRL0			0x100
+#define HIFI0PLL_CTRL1			0x104
+#define HIFI0PLL_CTRL2			0x108
+#define HIFI0PLL_CTRL3			0x10c
+#define HIFI1PLL_CTRL0			0x110
+#define HIFI1PLL_CTRL1			0x114
+#define HIFI1PLL_CTRL2			0x118
+#define HIFI1PLL_CTRL3			0x11c
+#define HIFI0PLL_STS			0x120
+#define HIFI1PLL_STS			0x124
+#define HDMIPLL_CTRL0			0x1c0
+#define HDMIPLL_CTRL1			0x1c4
+#define HDMIPLL_CTRL2			0x1c8
+#define HDMIPLL_CTRL3			0x1cc
+#define HDMIPLL_STS			0x1dc
+
+static struct clk_regmap s7_fixed_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.n = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 11,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = FIXPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll_vco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "fix",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_fixed_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = FIXPLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_fixed_pll_vco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+#define S7_FCLK_DIV(_name, _mult, _divider)				\
+struct clk_fixed_factor s7_##_name##_div = {				\
+	.mult = (_mult),						\
+	.div = (_divider),						\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_fixed_factor_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_fixed_pll.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
+
+#define S7_FCLK(_name, _reg, _bit)					\
+struct clk_regmap s7_##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ro_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_##_name##_div.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
+
+/*
+ * The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field, but
+ * each bit enables one divider.
+ */
+static S7_FCLK_DIV(fclk_div2, 1, 2);
+static S7_FCLK(fclk_div2, FIXPLL_CTRL1, 30);
+static S7_FCLK_DIV(fclk_div3, 1, 3);
+static S7_FCLK(fclk_div3, FIXPLL_CTRL1, 26);
+static S7_FCLK_DIV(fclk_div4, 1, 4);
+static S7_FCLK(fclk_div4, FIXPLL_CTRL1, 27);
+static S7_FCLK_DIV(fclk_div5, 1, 5);
+static S7_FCLK(fclk_div5, FIXPLL_CTRL1, 28);
+static S7_FCLK_DIV(fclk_div7, 1, 7);
+static S7_FCLK(fclk_div7, FIXPLL_CTRL1, 29);
+static S7_FCLK_DIV(fclk_div2p5, 2, 5);
+static S7_FCLK(fclk_div2p5, FIXPLL_CTRL0, 25);
+
+static const struct pll_mult_range s7_pll_mult_range = {
+	.min = 134,
+	.max = 265,
+};
+
+/*
+ * BIG FAT WARNING: each VCO must be registered before its div0p5 divider.
+ *
+ * div0p5 divides the PLL input by 2 when set. Linux doesn't change it at
+ * runtime, but the VCO init sequence writes it (set for GP0, HIFI0 and HIFI1,
+ * clear for HDMI) unless the PLL is running and has
+ * CLK_MESON_PLL_NOINIT_ENABLED. A divider registered before that would keep
+ * the power-on value as its rate.
+ *
+ * meson_clkc_mmio_probe() registers the clocks in ID order, so each VCO has a
+ * lower ID than its divider: the VCO init runs at registration while the VCO
+ * is still an orphan, then the divider reads the final value and the framework
+ * recalculates the VCO rate. CLK_GET_RATE_NOCACHE makes the divider read the
+ * register again whenever its rate is queried.
+ *
+ * WARNING: the multiplier ranges assume the init values, div0p5 set for GP0,
+ * HIFI0 and HIFI1 and clear for HDMI. A PLL the firmware leaves running with
+ * the other setting is reported correctly, but the same multipliers then give
+ * twice (GP0/HIFI) or half (HDMI) the DCO rate, possibly outside the hardware
+ * limits, and the driver still accepts them.
+ */
+static const struct clk_div_table s7_pll_div0p5_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ /* sentinel */ }
+};
+
+static const struct reg_sequence s7_gp0_pll_init_regs[] = {
+	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_regmap s7_gp0_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = GP0PLL_CTRL1,
+		.shift = 27,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "gp0",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = GP0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = GP0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_gp0_pll_init_regs),
+		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = GP0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s7_hifi0_pll_init_regs[] = {
+	{ .reg = HIFI0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_regmap s7_hifi0_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI0PLL_CTRL1,
+		.shift = 27,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi0_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi0",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_hifi0_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi0_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi0_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi0_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi0_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi0_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi0_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s7_hifi1_pll_init_regs[] = {
+	{ .reg = HIFI1PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI1PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI1PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI1PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_regmap s7_hifi1_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI1PLL_CTRL1,
+		.shift = 27,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi1",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI1PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI1PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi1_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi1_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI1PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct pll_mult_range s7_hdmi_pll_mult_range = {
+	.min = 125,
+	.max = 249,
+};
+
+static const struct reg_sequence s7_hdmi_pll_init_regs[] = {
+	{ .reg = HDMIPLL_CTRL0,	.def = 0x00881000 },
+	{ .reg = HDMIPLL_CTRL1,	.def = 0x2c6011cc },
+	{ .reg = HDMIPLL_CTRL2,	.def = 0x86801000 },
+	{ .reg = HDMIPLL_CTRL3,	.def = 0x00000000 },
+};
+
+static struct clk_regmap s7_hdmi_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL1,
+		.shift = 19,
+		.width = 1,
+		.table = s7_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hdmi",
+		},
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HDMIPLL_CTRL3,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HDMIPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s7_hdmi_pll_mult_range,
+		.init_regs = s7_hdmi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hdmi_pll_init_regs),
+		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+/*
+ * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields.
+ * [22:19] holds two cascaded power-of-two dividers, od0 [20:19] and od1
+ * [22:21]. [18:15] holds two parallel ones: [16:15] is hdmi_pll, [18:17]
+ * feeds the PHY and is not modelled.
+ */
+static struct clk_regmap s7_hdmi_pll_od0 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 19,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od0",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_od1 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 21,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od1",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od0.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 15,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od1.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div5 = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div6p25 = {
+	.mult = 4,
+	.div = 25,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div6p25",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div7p5 = {
+	.mult = 2,
+	.div = 15,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div7p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_pix = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = HDMIPLL_CTRL0,
+		.mask = 0x3,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_pix_div5.hw,
+			&s7_hdmi_pll_pix_div6p25.hw,
+			&s7_hdmi_pll_pix_div7p5.hw
+		},
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_hw *s7_pll_hws[] = {
+	[CLKID_FIXED_PLL_VCO]		= &s7_fixed_pll_vco.hw,
+	[CLKID_FIXED_PLL]		= &s7_fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]		= &s7_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV2]		= &s7_fclk_div2.hw,
+	[CLKID_FCLK_DIV3_DIV]		= &s7_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV3]		= &s7_fclk_div3.hw,
+	[CLKID_FCLK_DIV4_DIV]		= &s7_fclk_div4_div.hw,
+	[CLKID_FCLK_DIV4]		= &s7_fclk_div4.hw,
+	[CLKID_FCLK_DIV5_DIV]		= &s7_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV5]		= &s7_fclk_div5.hw,
+	[CLKID_FCLK_DIV7_DIV]		= &s7_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV7]		= &s7_fclk_div7.hw,
+	[CLKID_FCLK_DIV2P5_DIV]		= &s7_fclk_div2p5_div.hw,
+	[CLKID_FCLK_DIV2P5]		= &s7_fclk_div2p5.hw,
+	[CLKID_GP0_PLL_VCO]		= &s7_gp0_pll_vco.hw,
+	[CLKID_GP0_PLL_DIV0P5]		= &s7_gp0_pll_div0p5.hw,
+	[CLKID_GP0_PLL]			= &s7_gp0_pll.hw,
+	[CLKID_HIFI0_PLL_VCO]		= &s7_hifi0_pll_vco.hw,
+	[CLKID_HIFI0_PLL_DIV0P5]	= &s7_hifi0_pll_div0p5.hw,
+	[CLKID_HIFI0_PLL]		= &s7_hifi0_pll.hw,
+	[CLKID_HIFI1_PLL_VCO]		= &s7_hifi1_pll_vco.hw,
+	[CLKID_HIFI1_PLL_DIV0P5]	= &s7_hifi1_pll_div0p5.hw,
+	[CLKID_HIFI1_PLL]		= &s7_hifi1_pll.hw,
+	[CLKID_HDMI_PLL_VCO]		= &s7_hdmi_pll_vco.hw,
+	[CLKID_HDMI_PLL_DIV0P5]		= &s7_hdmi_pll_div0p5.hw,
+	[CLKID_HDMI_PLL_OD0]		= &s7_hdmi_pll_od0.hw,
+	[CLKID_HDMI_PLL_OD1]		= &s7_hdmi_pll_od1.hw,
+	[CLKID_HDMI_PLL]		= &s7_hdmi_pll.hw,
+	[CLKID_HDMI_PLL_PIX_DIV5]	= &s7_hdmi_pll_pix_div5.hw,
+	[CLKID_HDMI_PLL_PIX_DIV6P25]	= &s7_hdmi_pll_pix_div6p25.hw,
+	[CLKID_HDMI_PLL_PIX_DIV7P5]	= &s7_hdmi_pll_pix_div7p5.hw,
+	[CLKID_HDMI_PLL_PIX]		= &s7_hdmi_pll_pix.hw,
+};
+
+static const struct meson_clkc_data s7_pll_clkc_data = {
+	.hw_clks = {
+		.hws = s7_pll_hws,
+		.num = ARRAY_SIZE(s7_pll_hws),
+	},
+};
+
+static const struct of_device_id s7_pll_clkc_match_table[] = {
+	{
+		.compatible = "amlogic,s7-pll-clkc",
+		.data = &s7_pll_clkc_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s7_pll_clkc_match_table);
+
+static struct platform_driver s7_pll_clkc_driver = {
+	.probe		= meson_clkc_mmio_probe,
+	.driver		= {
+		.name	= "s7-pll-clkc",
+		.of_match_table = s7_pll_clkc_match_table,
+	},
+};
+module_platform_driver(s7_pll_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic S7 PLL Clock Controller driver");
+MODULE_AUTHOR("Carlo Caione <ccaione@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_MESON");

-- 
2.56.1

