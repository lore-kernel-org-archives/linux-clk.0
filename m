Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EEB345729
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449824; cv=none; b=b9ck+B5Vu1EWC+7hyc/pBw/y7ZBZQaJY4X4M505ewO5eL9H/FDTHpdFMq1+cI08kPuDBmULth8SuEu4i4+GL/Mhaz2ESg6dpwX7H7j5ld/LHzFzlTv9gk9JMrXRZ2hFQBBdvFLJR3HCjkXJ4vqZy04ba/zjA9eFHV+zav88FFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449824; c=relaxed/simple;
	bh=TLIitXaILImUT8QDzQF5X5qxHd9HG0OHoiApdvltq/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dUFpAhsI/qFH3Y5h9DZSeb5tc3r1Dh7jBaAm6lgoZSzb6ezNNsgdLivThHdmG/q5vltMgRxYwoolRNqjyvINiaxUmM+MmtUHi2JEbOuzxJ9J1UaHWycoBdN80M1wIm5Qn2wDFgMW5LSQ9FAaWUGtHdQp731AVcavv6WIhJXO/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjR1+FAA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjR1+FAA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-441209fb77eso2136763f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 14:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449820; x=1779054620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QADFD2JLa1xQpLDQAKqdWRyNc6Wk4fnJTr4NJt3ESSU=;
        b=PjR1+FAAH/8elx1HfUWPNYXqxPw2Axcry0LLB75PFCPh8lFxA6MIH70swe3HhGehnI
         9d4L3QpmSXDAQFSmwUZoI2TuwRhn/IgVfFAFmGBJyXPa9+2sFO1+mtplCoICUA846+8q
         G6XcyOCiceA29/0ovjlOCm6QpK0fGPzOVT+1LsvcTcaz/q3blngRxwe4vZ0/2YKZgd5A
         f77bMqZ4doqjKuCueFd/udDPHF9J/SVBVWGYNzeYnMstMTNKX8VilyEI/q1A1ifoNTwZ
         F65gw1deHfEgN2NXXjr/NqY7znG3pq5v6OwhcJW5UIYXPchchuCezOXYUxzrm4Rkq4P/
         t5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449820; x=1779054620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QADFD2JLa1xQpLDQAKqdWRyNc6Wk4fnJTr4NJt3ESSU=;
        b=GHc071sstUG6six5xFJ4/6Jj380FUkPJ/nSVKaq+zRzh4pBOs8ABVc00yL1mMsDO9s
         gx7TP8H636mIKEg4jfEgmGWvdNNW9492ukZBulg/WLPxmuNcN6sTDnqagdJ1uniDqMf2
         8w5yH5CDGoK2cwszS/QS6KaAPtVkPPuG+5N/eAu9VS9ebLRQMk5R6PYvS3aRZXUlS79p
         s6Et85qJhHDcf8bzSK2a1wrSxVvPuXwk5IcSFGJC8Qr+Ei/EiOetlf6uKm3l3mxnGAka
         7wCxnEeqow17RVcF9XVcUfWyUK4j87oxDDl4EbV9t7Ekiqd7PFiLzxmHIH62v3MLJHFG
         E50A==
X-Gm-Message-State: AOJu0Yxi93M9sINC6bxByHCe3GMK+bxIN7kgrF4uxb6GctHwiC/mhfIO
	XrSaDqauNB/HSXbCsgIKXSTjdv8XV49Y+pMHFxL1e6h1yB6tGJrs20NT
X-Gm-Gg: Acq92OGDdUfqGrq3EBjCOhd/h4tpll0Ut5d14JWJL/WVWstaF8vT9eOaFn/YxaR/tEe
	mr6FGPHXHGs/TiTIqmxcPZwBjR1nIO14D0htAJVTQ0lwuMl8y2mzGZCVEW+YHyDPq/0dpS0TpMl
	fJZB62IDOTI2flWPDEpYiTLRE5esTtfTD7b/Vz1xrAH5tGpbUtJoblC+Q6UzLYe3dwSSLYpy2ew
	jy8aCr/bvMU8T1vtNi58SGQ/KEJ0ZCxtSSRCaG36TAOBtXtFC4hJA3sO+oJpDjJAEXNctOqOjO7
	1TyYtQDbx7Hs3+mcNqfeOCuJQmYbNWrstdKdydEhYsMWXOODxUz/hjQHDLEN8dxd87/aCa5NAN1
	cTM71dSc6m3Tqr4kB/GPJJENe8rRAmZHykFqvfbwJV+4Cduv1MQiAsiw8B8jinPPxgCxykVsSeJ
	1fnDf2jASa8Rrn/LWtOLIlU6+EJw+L48A=
X-Received: by 2002:a05:6000:1445:b0:44c:53dc:8cb2 with SMTP id ffacd0b85a97d-452e9ca00f3mr23407055f8f.14.1778449819912;
        Sun, 10 May 2026 14:50:19 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm19207317f8f.1.2026.05.10.14.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:50:19 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:49:51 +0300
Subject: [PATCH RFC v2 2/4] clk: zte: Introduce a driver for zx297520v3 top
 clocks and resets.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-zx29clk-v2-2-29f0edc300f5@gmail.com>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
In-Reply-To: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=24932;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=TLIitXaILImUT8QDzQF5X5qxHd9HG0OHoiApdvltq/U=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqAP2SlQChNL/K7XToK3lm2GhW4Dx89ITDE2gP6
 YnudVi4GISJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagD9khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLIRw//RbwvTlCGJvYwwnCvNnGV8CnPwWB/r3D
 +yxpjOABQFQeDZuCzAqjOmVwGiPnaUebKTxJP6IszKOmzU4XsD/xjdWfCpx2yweYlepiCyFwJIL
 Yu2/UU+1eAJJHf9BC0vIneVFEqWB+vinLdWkk5eONix86upkB4DxPv0R7tG74lbHuDtFDocIArz
 d6BVfq8okqwvzQ+HTEzOKrIwgrNsbJkgKMk4E34elWz8nmb4VMFfJqIfhzwePxYLkE8yVoHH9Xe
 TWjei4vq21dvDOYM9lZyBnbDspaD4YylxHNKctksB49Hugq+vspMRXYricuYNB+aLgvFuQDCb+s
 gXg2FAhzKjgz5YCfsQy5rP0Ejn6oHIAVjvd+Jgg2n7J28Pouao9Ktva6dEML0NaGe0IUVWpBwyU
 BuPCcSeinsy71kr6WfPDm7DjkzfneegfnnS8nApvAWbHmhoyHqmSM0gylQf8XBTza7OR1qXqgjH
 fOdgSREDPS8dzccbmQcCoi3cZXjyQA+Y1Ru1nsvLoT8nHp4zUG4wtRuTs5aUtkUq/2+IOgwQqmM
 pg/txqLORDL08IPJnQC/DGVMWzXyL9AJd0cZIUP1RAE8kjaFmuUBr3Jj/EC1KE6g4NG7cd5w8Yi
 wMNSEw4YvLrjTheg5OFh4QbaFStb6F044xPYQnLflB/yzPiM1l4A=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This register space controls core devices: PLLs, the AHB bus, a lot of
timers, the USB controller, the Cortex M0 processor that boots the board
and a few other devices. For some reason the LTE coprocessor is also
partially controlled by it. The main application processor and DDR
memory are not found here though.

The register to reboot the board is also found here.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/Kconfig              |   1 +
 drivers/clk/Makefile             |   1 +
 drivers/clk/zte/Kconfig          |  18 ++
 drivers/clk/zte/Makefile         |   2 +
 drivers/clk/zte/clk-zx297520v3.c | 583 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 605 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3d803b4cf5c1..971ea6daa2b6 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -539,6 +539,7 @@ source "drivers/clk/visconti/Kconfig"
 source "drivers/clk/x86/Kconfig"
 source "drivers/clk/xilinx/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
+source "drivers/clk/zte/Kconfig"
 
 # Kunit test cases
 config CLK_KUNIT_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f7bce3951a30..c164a3de2b14 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -165,5 +165,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_X86)			+= x86/
 endif
 obj-y					+= xilinx/
+obj-$(CONFIG_ARCH_ZTE)			+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
new file mode 100644
index 000000000000..e7acd28832cd
--- /dev/null
+++ b/drivers/clk/zte/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# ZTE Clock Drivers
+#
+menu "Clock driver for ZTE SoC"
+	depends on ARCH_ZTE || COMPILE_TEST
+
+config COMMON_CLK_ZX297520V3
+	tristate "Clock driver for ZTE zx297520v3"
+	default SOC_ZX297520V3
+	help
+	  This driver supports ZTE zx297520v3 basic clocks.
+
+	  Enable this if you want to build a kernel that is able to run on
+	  boards based on this SoC. You can safely enable multiple clock
+	  drivers. The one(s) matching the device tree will be used.
+
+endmenu
diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
new file mode 100644
index 000000000000..3751ebcba0b0
--- /dev/null
+++ b/drivers/clk/zte/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_COMMON_CLK_ZX297520V3) += clk-zx297520v3.o
diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
new file mode 100644
index 000000000000..aa304dd34b7b
--- /dev/null
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
+#include <linux/reset-controller.h>
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/reboot.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+
+static DEFINE_SPINLOCK(reg_lock);
+
+struct zx29_reset_reg {
+	void __iomem *reg;
+	u32 mask;
+};
+
+struct zx29_clk_controller {
+	void __iomem *base;
+	struct clk_hw_onecell_data *clocks;
+	struct reset_controller_dev rcdev;
+	struct zx29_reset_reg resets[];
+};
+
+static int zx297520v3_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zx29_clk_controller *data = container_of(rcdev, struct zx29_clk_controller, rcdev);
+	u32 val;
+
+	val = readl(data->resets[id].reg);
+	val &= ~data->resets[id].mask;
+	writel(val, data->resets[id].reg);
+
+	return 0;
+}
+
+static int zx297520v3_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct zx29_clk_controller *data = container_of(rcdev, struct zx29_clk_controller, rcdev);
+	u32 val;
+
+	val = readl(data->resets[id].reg);
+	val |= data->resets[id].mask;
+	writel(val, data->resets[id].reg);
+
+	return 0;
+}
+
+static int zx297520v3_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	ret = zx297520v3_rst_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	usleep_range(100, 100 * 2);
+
+	return zx297520v3_rst_deassert(rcdev, id);
+}
+
+static int zx297520v3_rst_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct zx29_clk_controller *data = container_of(rcdev, struct zx29_clk_controller, rcdev);
+	u32 val;
+
+	val = readl(data->resets[id].reg);
+
+	return (val & data->resets[id].mask) == data->resets[id].mask;
+}
+
+const struct reset_control_ops zx297520v3_rst_ops = {
+	.assert		= zx297520v3_rst_assert,
+	.deassert	= zx297520v3_rst_deassert,
+	.reset		= zx297520v3_rst_reset,
+	.status		= zx297520v3_rst_status,
+};
+
+/* Used for gates where we don't know the parent input(s). Assume general bus clock. */
+static const char * const clk_unknown[] = {
+	"osc26m",
+};
+
+/* Used for gates where we know it is using the 26 mhz main clock. */
+static const char * const clk_main[] = {
+	"osc26m",
+};
+
+/* Top and matrix clocks are chaotic - I haven't found a consistent pattern behind their register
+ * and bit locations. Generally there are two gates (pclk, wclk), one mux, one reset and sometimes
+ * one divider, but exceptions apply. For some devices there is only a reset and some general
+ * (parent) clocks need setup. This structure plus macro handles the somewhat regular parts.
+ *
+ * There are some patterns that can be observed.
+ * mux 0x3c, div 0x48, gate 0x54
+ * mux 0x40, div 0x4c, gate 0x5c
+ * mux 0x44, div 0x50, gate 0x60
+ *
+ * For a 0 - 0xc - 0x18 pattern. Muxes from 0x3c to 0x44, dividers from 0x48 to 0x50, gates 0x54 to
+ * 0x60. The pattern is broken for timer t17 though.
+ *
+ * Gates have 4 bits per clock - bit 0 for wclk, bit 1 for pclk, bit 2 for something the ZTE kernel
+ * calls "gate" (the bits we use here are called "en"), which I don't know what it does, and bit 3
+ * seems unused. E.g. offset 0x54 accepts all bits in 0xF77F7F7F - suggesting RTC, I2C0 have an
+ * extra gate bit.
+ */
+struct zx297520v3_composite {
+	u32 reset_id, wclk_id, pclk_id;
+	const char *name;
+	u32 reset_reg, reset_shift;
+	u32 gate_reg, wclk_gate_shift, pclk_gate_shift;
+	const char *pclk_parent;
+	u32 mux_reg, mux_shift, mux_size;
+	const char * const *mux_sel;
+	u32 mux_sel_count;
+	u32 div_reg, div_shift, div_size;
+	u32 flags;
+};
+
+struct zx297520v3_gate {
+	u32 id;
+	const char *name, *parent;
+	u32 reg, shift;
+};
+
+#define _ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, pclk_parent,\
+		mux_reg, mux_shift, mux_size, mux_sel,\
+		div_reg, div_shift, div_size, flags) \
+		{ZX297520V3_##name##_RESET, ZX297520V3_##name##_WCLK, ZX297520V3_##name##_PCLK,\
+		 #name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, pclk_parent,\
+		 mux_reg, mux_shift, mux_size, mux_sel, ARRAY_SIZE(mux_sel),\
+		 div_reg, div_shift, div_size, flags}
+
+#define ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift,\
+	       mux_reg, mux_shift, mux_size, mux_sel,\
+	       div_reg, div_shift, div_size) \
+	       _ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, "osc26m",\
+		mux_reg, mux_shift, mux_size, mux_sel,\
+		div_reg, div_shift, div_size, 0)
+
+#define ZX_CLK_CRIT(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift,\
+	       mux_reg, mux_shift, mux_size, mux_sel,\
+	       div_reg, div_shift, div_size) \
+	       _ZX_CLK(name, reset_reg, reset_shift, gate_reg, wclk_shift, pclk_shift, "osc26m",\
+		mux_reg, mux_shift, mux_size, mux_sel,\
+		div_reg, div_shift, div_size, CLK_IS_CRITICAL)
+
+/* The default mpll settings multiply the 26 MHz reference clock times 24. A mux selection of 26 MHz
+ * could mean using the 26 MHz oscillator directly, or passing it through the PLL and divide by 24.
+ *
+ * If a UART is set to mpl_d6 (default 104 MHz), changing the mpll multipliers does affect UART
+ * timing as it should. This does not happen when the UART is set to 26 MHz input or timers that
+ * read 26 MHz input. This suggests 26 MHz clocks use the reference clock directly.
+ */
+static const char * const ahb_sel[] = {
+	"osc26m",
+	"mpll_d6",	/* 104 mhz */
+	"mpll_d8",	/* 78 mhz */
+	"mpll_d8",	/* 78 mhz */
+};
+
+static const char * const timer_top_sel[] = {
+	"osc32k",
+	"osc26m",
+};
+
+static const char * const uart_top_sel[] = {
+	"osc26m",
+	"mpll_d6",	/* 104 mhz */
+};
+
+static const char * const m0_sel[] = {
+	"osc26m",
+	"mpll_d6",	/* 104 mhz */
+	"mpll_d8",	/* 78 mhz */
+	"osc32k",	/* Yes, tested. It is SLLLLOOOOOWWW. */
+};
+
+static const struct zx297520v3_composite top_clocks[] = {
+	/*    (NAME,       RESET,     GATE,         MUX,                        DIV        ), */
+
+	/* AHB: Don't turn this one off. The clock mux works and impact can be tested e.g. with
+	 * iperf speed testing of the USB network connection. Values 2 and 3 give the same speed.
+	 */
+	ZX_CLK_CRIT(AHB,   0x70,  0,  0x54, 12, 13, 0x3c,  4, 2, ahb_sel,       0,     0, 0),
+
+	/* Pinmux (AON, TOP, IOCFG but not PDCFG). Critical as well until we have a driver that
+	 * consumes it. I don't think we'll realistically shut this off ever.
+	 *
+	 * Setting either bit 0 or 1 in register 0x58 makes the device work.
+	 */
+	ZX_CLK_CRIT(PMM,   0x74,  0,  0x58,  0,  1, 0x00,  0, 0, clk_unknown,   0,     0, 0),
+
+	/* Timers. We don't use any of them, just shut them off. The timers are named and sorted
+	 * by the IO address of the main timer controls. Some of the controls are documented in
+	 * ZTE's kernel. Some I found by trial and error.
+	 *
+	 * Timer T17 is used by the ZSP firmware. The rproc driver will enable them as needed.
+	 */
+	ZX_CLK(TIMER_T08,  0x78,   4, 0x5c,  8,  9, 0x40,  1, 1, timer_top_sel, 0x4c,   8, 4),
+	ZX_CLK(TIMER_T09,  0x78,   2, 0x5c,  4,  5, 0x40,  0, 1, timer_top_sel, 0x4c,   0, 4),
+	ZX_CLK(TIMER_T12,  0x74,   6, 0x54,  4,  5, 0x3c,  0, 1, timer_top_sel, 0x48,   0, 4),
+	ZX_CLK(TIMER_T13,  0x7c,   0, 0x60,  0,  1, 0x44,  0, 1, timer_top_sel, 0x50,   0, 4),
+	ZX_CLK(TIMER_T14,  0x7c,   2, 0x60,  4,  5, 0x44,  1, 1, timer_top_sel, 0x50,   4, 4),
+	ZX_CLK(TIMER_T15,  0x74,  10, 0x54, 20, 21, 0x3c,  3, 1, timer_top_sel, 0x48,   4, 4),
+	ZX_CLK(TIMER_T16,  0x7c,   4, 0x60,  8,  9, 0x44,  2, 1, timer_top_sel, 0x50,   8, 4),
+	ZX_CLK(TIMER_T17,  0x12c,  0, 0x128, 0,  1, 0x120, 0, 1, timer_top_sel, 0x124,  0, 4),
+
+	/* This watchdog is set up by the bootloader and in normal operation the m0 firmware will
+	 * feed the dog. The m0 firmware in turn wants to be fed in its own way. Since we normally
+	 * don't run any m0 firmware we shut it off by default and expose it to userspace via the
+	 * watchdog driver.
+	 */
+	ZX_CLK(WDT_T18,    0x74,  12, 0x54, 24, 25, 0x3c,  6, 1, timer_top_sel, 0x48,   8, 4),
+
+	ZX_CLK(I2C0,       0x74,   8, 0x54,  8,  9, 0x3c,  1, 1, uart_top_sel,  0,      0, 0),
+	ZX_CLK(UART0,      0x78,   6, 0x5c, 12, 13, 0x40,  2, 1, uart_top_sel,  0,      0, 0),
+
+	/* How does this RTC work? I don't know, the ZTE kernel does not talk to it. It has an
+	 * external RTC connected to I2C0.
+	 */
+	ZX_CLK(RTC,        0x74,   4, 0x54,  0,  1, 0x00,  0, 0, timer_top_sel, 0,      0, 0),
+
+	/* This doesn't see to be talking to the physical SIM card. I can turn it off on the ZTE
+	 * firmware without breaking LTE, and the "uicc" IRQ count keeps climbing. I think this is
+	 * a eSim-like chip that can be provisioned with data at runtime, but I have no idea how to
+	 * do it.
+	 */
+	ZX_CLK(USIM1,      0x74,  14, 0x54, 28, 29, 0x00,  0, 0, clk_main,      0x48,  12, 1),
+
+	/*    (NAME,       RESET,     GATE,         MUX,                        DIV         ), */
+};
+
+/* Stand-alone topclk gates. */
+static const struct zx297520v3_gate top_gates[] = {
+	{ZX297520V3_USB_24M,		"usb_24m",	"mpll_d26",	0x6c,	  3},
+	{ZX297520V3_USB_AHB,		"usb_ahb",	"AHB_wclk",	0x6c,	  4},
+	/* LTE: gate only as far as I can see. I looked for resets and did not find any. There may
+	 * be mux/div, but without understanding the behavior of this hardware it is impossible to
+	 * tell. They are sorted by physical MMIO address of the devices, which happens to be the
+	 * inverse order of the bits.
+	 *
+	 * I don't know what "LPM", "TD" and "W" mean. I copied them from ZTE's names.
+	 */
+	{ZX297520V3_LPM_GSM_WCLK,	"LPM_GSM_wclk",	clk_unknown[0],	0x58,	10},
+	{ZX297520V3_LPM_GSM_PCLK,	"LPM_GSM_pclk",	clk_unknown[0],	0x58,	11},
+	{ZX297520V3_LPM_LTE_WCLK,	"LPM_LTE_wclk",	clk_unknown[0],	0x58,	 8},
+	{ZX297520V3_LPM_LTE_PCLK,	"LPM_LTE_pclk",	clk_unknown[0],	0x58,	 9},
+	{ZX297520V3_LPM_TD_WCLK,	"LPM_TD_wclk",	clk_unknown[0],	0x58,	 6},
+	{ZX297520V3_LPM_TD_PCLK,	"LPM_TD_pclk",	clk_unknown[0],	0x58,	 7},
+	{ZX297520V3_LPM_W_WCLK,		"LPM_W_wclk",	clk_unknown[0],	0x58,	 4},
+	{ZX297520V3_LPM_W_PCLK,		"LPM_W_pclk",	clk_unknown[0],	0x58,	 5},
+	/* There are PCLKs for BROM/SRAM2 in 0x54, bit 16 and SRAM1 in 0x54, bit 18. Turning them
+	 * off locks up the Cortex M0 coproc. Not added to the kernel until a way is found to
+	 * recover the Cortex M0 or evidence of power savings.
+	 */
+};
+
+static int zx297520v3_pll(struct device *dev, void __iomem *base, const char *name,
+			  struct clk *parent)
+{
+	/* These are the fractionals of the PLLs I have seen. There should be a better way to
+	 * generate them than hardcode the list.
+	 */
+	static const unsigned int pll_fract[] = {2, 3, 4, 5, 6, 8, 12, 26};
+
+	unsigned long ref, refdiv, fbdiv, vco, postdiv1, postdiv2, freq;
+	struct clk_hw *hw;
+	char plldiv[16];
+	unsigned int i;
+	u32 val;
+
+	/* PLLs are configured by the boot rom, we only read their settings to know how the rate
+	 * of the derived clocks. ZTE's sources explain the PLL register contents only in a .cmm
+	 * file (A Lauterback TRACE32 script). When calculating the frequencies with the default
+	 * PLL configuration the results match the fixed rate clocks from their clock driver.
+	 *
+	 * The 26mhz and 32khz clocks can be easily observed with the timers. The 104mhz output
+	 * can be observed through the UART. All others can only be indirectly observed by e.g.
+	 * comparing the CPU speed at 26mhz and 624mhz.
+	 *
+	 * The contents of the PLL registers is as follows:
+	 *
+	 * Bit 31: PLL Locked
+	 * Bit 30: PLL disable bit (0 = PLL enabled, 1 = PLL disabled)
+	 * Bits 29:25: Unknown. Could be a parent mux
+	 * Bits 24:18: refdiv
+	 * Bits 17:6: fbdiv
+	 * Bits 5:3: post vco divider 1
+	 * Bits 2:0: post vco divider 2
+	 *
+	 * There is a second register following immediately afterwards that is supposed to have
+	 * another value that gets added to fbdiv, but it doesn't seem to make a difference in my
+	 * testing and it is always 0 in the preconfigured values.
+	 */
+	ref = clk_get_rate(parent);
+	val = readl(base);
+
+	refdiv = (val & GENMASK(24, 18)) >> 18;
+	fbdiv = (val & GENMASK(17, 6)) >> 6;
+	postdiv1 = (val & GENMASK(5, 3)) >> 3;
+	postdiv2 = (val & GENMASK(2, 0));
+	dev_dbg(dev, "%s: reference clock %lu HZ, PLL setting 0x%08x\n", name, ref, val);
+
+	if (!refdiv || !postdiv1 || !postdiv2)
+		return -EINVAL;
+
+	vco = (ref / refdiv) * fbdiv;
+	freq = vco / postdiv1 / postdiv2;
+	dev_dbg(dev, "%s: %lu MHZ\n", name, freq / 1000000);
+
+	hw = devm_clk_hw_register_fixed_factor(dev, name, __clk_get_name(parent), 0, fbdiv,
+					       refdiv * postdiv1 * postdiv2);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	for (i = 0; i < ARRAY_SIZE(pll_fract); ++i) {
+		sprintf(plldiv, "%s_d%u", name, pll_fract[i]);
+		hw = devm_clk_hw_register_fixed_factor(dev, plldiv, name, 0, 1, pll_fract[i]);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		dev_dbg(dev, "%s: %lu hz\n", clk_hw_get_name(hw), clk_hw_get_rate(hw));
+	}
+
+	return 0;
+}
+
+static int zx297520v3_composite(struct device *dev, void __iomem *base,
+				struct clk_hw_onecell_data *clocks, struct zx29_reset_reg *resets,
+				const struct zx297520v3_composite *input, size_t size)
+{
+	char pclk_name[32], wclk_name[32], mux_name[32], div_name[32];
+	const char *wclk_parent, *div_parent;
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < size; ++i) {
+		strscpy(wclk_name, input[i].name, ARRAY_SIZE(wclk_name));
+		strcat(wclk_name, "_wclk");
+		strscpy(pclk_name, input[i].name, ARRAY_SIZE(pclk_name));
+		strcat(pclk_name, "_pclk");
+		strscpy(mux_name, input[i].name, ARRAY_SIZE(mux_name));
+		strcat(mux_name, "_mux");
+		strscpy(div_name, input[i].name, ARRAY_SIZE(div_name));
+		strcat(div_name, "_div");
+
+		resets[input[i].reset_id].reg = base + input[i].reset_reg;
+		resets[input[i].reset_id].mask = BIT(input[i].reset_shift) +
+						 BIT(input[i].reset_shift + 1);
+
+		if (input[i].div_size)
+			wclk_parent = div_name;
+		else if (input[i].mux_size)
+			wclk_parent = mux_name;
+		else
+			wclk_parent = input[i].mux_sel[0];
+
+		hw = devm_clk_hw_register_gate(dev, pclk_name, input[i].pclk_parent, input[i].flags,
+					       base + input[i].gate_reg, input[i].pclk_gate_shift,
+					       0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		clocks->hws[input[i].pclk_id] = hw;
+
+		if (input[i].mux_size) {
+			hw = devm_clk_hw_register_mux(dev, mux_name, input[i].mux_sel,
+						      input[i].mux_sel_count, 0,
+						      base + input[i].mux_reg,
+						      input[i].mux_shift, input[i].mux_size, 0,
+						      &reg_lock);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			div_parent = mux_name;
+		} else {
+			div_parent = input[i].mux_sel[0];
+		}
+
+		hw = devm_clk_hw_register_gate(dev, wclk_name, wclk_parent,
+					       input[i].flags | CLK_SET_RATE_PARENT,
+					       base + input[i].gate_reg, input[i].wclk_gate_shift,
+					       0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		clocks->hws[input[i].wclk_id] = hw;
+
+		if (!input[i].div_size)
+			continue;
+
+		hw = devm_clk_hw_register_divider(dev, div_name, div_parent, CLK_SET_RATE_PARENT,
+						  base + input[i].div_reg, input[i].div_shift,
+						  input[i].div_size, 0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+	}
+
+	return 0;
+}
+
+static int zx297520v3_gate(struct device *dev, void __iomem *base,
+			   struct clk_hw_onecell_data *clocks,
+			   const struct zx297520v3_gate *input, size_t size)
+{
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < size; ++i) {
+		hw = devm_clk_hw_register_gate(dev, input[i].name, input[i].parent,
+					       CLK_SET_RATE_PARENT, base + input[i].reg,
+					       input[i].shift, 0, &reg_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		clocks->hws[input[i].id] = hw;
+	}
+
+	return 0;
+}
+
+static int zx_restart_handle(struct sys_off_data *data)
+{
+	struct zx29_clk_controller *top = data->cb_data;
+
+	writel(1, top->base);
+	mdelay(1000);
+
+	pr_emerg("Unable to restart system\n");
+	return NOTIFY_DONE;
+}
+
+static int zx297520_topclk_probe(struct platform_device *pdev)
+{
+	struct zx29_clk_controller *top;
+	struct device *dev = &pdev->dev;
+	struct clk_hw *hw;
+	struct clk *clk;
+	int res;
+
+	dev_info(dev, "Registering zx297520v3 top clocks and resets\n");
+	top = devm_kzalloc(dev, offsetof(struct zx29_clk_controller,
+					 resets[ZX297520V3_TOPRST_END]), GFP_KERNEL);
+	if (!top)
+		return -ENOMEM;
+
+	top->clocks = devm_kzalloc(dev, struct_size(top->clocks, hws,
+				   ZX297520V3_TOPCLK_END), GFP_KERNEL);
+	if (!top->clocks)
+		return -ENOMEM;
+	top->clocks->num = ZX297520V3_TOPCLK_END;
+
+	top->base = devm_platform_ioremap_resource(pdev, 0);
+	WARN_ON(!top->base);
+
+	/* Offset 0x0 is the global board reset
+	 * Offset 0x4 gives some static boot information - raw NAND or SPI NAND
+	 */
+
+	clk = devm_clk_get_prepared(dev, "osc32k");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "32 KHz input clock not found 1\n");
+		return PTR_ERR(clk);
+	}
+
+	clk = devm_clk_get_prepared(dev, "osc26m");
+	if (IS_ERR(clk)) {
+		dev_err(dev, "26 MHz input clock not found\n");
+		return PTR_ERR(clk);
+	}
+
+	/* Default setting: 0x48040c11. 624/312/156... */
+	res = zx297520v3_pll(dev, top->base + 0x8, "mpll", clk);
+	if (res)
+		return res;
+
+	/* There is a PLL at 0x10 called "upll" in ZTE's code, but I don't see any documented
+	 * consumers. Default setting 0x48347811. 480/240/160 MHz.
+	 */
+
+	/* Default value 0x4834902d. Feeds dpll. 46.08 MHz */
+	res = zx297520v3_pll(dev, top->base + 0x100, "unknownpll", clk);
+	if (res)
+		return res;
+
+	/* The documentation says 491.52 MHz and measurement with the LSP TDM device supports this.
+	 * The default value is 0x480C2011. To get to 491.52 with these settings it needs a 23.04
+	 * MHz reference clock, which matches unknownpll_d2. If unknownpll is disabled, dpll loses
+	 * its lock.
+	 *
+	 * The proprietary LTE driver or coproc enables and disables it. TDM and I2S can use it.
+	 *
+	 * FIXME: Isn't there a nicer way to get the struct clk for unknownpll_d2? I don't want to
+	 * return all generated clocks from zx297520v3_pll or store them in the controller because
+	 * I need one of them here. I could always pass the parent by name though.
+	 */
+	res = zx297520v3_pll(dev, top->base + 0x18, "dpll", __clk_lookup("unknownpll_d2"));
+	if (res)
+		return res;
+	res = zx297520v3_pll(dev, top->base + 0x110, "gpll", clk);
+	if (res)
+		return res;
+
+	res = zx297520v3_composite(dev, top->base, top->clocks, top->resets,
+				 top_clocks, ARRAY_SIZE(top_clocks));
+	if (res)
+		return res;
+
+	res = zx297520v3_gate(dev, top->base, top->clocks, top_gates, ARRAY_SIZE(top_gates));
+	if (res)
+		return res;
+
+	/* The Cortex M0 coprocessor. It is responsible for booting the board and runs some power
+	 * management helper code on the stock firmware, but isn't critical. We can run custom code
+	 * on it but currently do not.  These bits control the speed and the values are mentioned in
+	 * ZTE's uboot. It isn't clear to me if this is directly responsible for the m0 clock, or
+	 * if it is the input to another clock. I also haven't found a gate that shuts the m0 off
+	 * and allows restarting. There don't seem to be resets either.
+	 *
+	 * Also note the comment about SRAM1 and SRAM2 PCLKs. They can be turned off to crash the
+	 * M0 by feeding it garbage instructions.
+	 */
+	hw = devm_clk_hw_register_mux(dev, "m0_wclk", m0_sel, ARRAY_SIZE(m0_sel),
+				      0, top->base + 0x38, 0, 2, 0, &reg_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	top->clocks->hws[ZX297520V3_M0_WCLK] = hw;
+
+	of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, top->clocks);
+
+	res = devm_register_restart_handler(dev, zx_restart_handle, top);
+	if (res)
+		dev_err(dev, "can't register restart handler (res=%d)\n", res);
+
+	/* Stray reset bits follow.
+	 *
+	 * I haven't found any clocks for GPIO. It probably wouldn't make much
+	 * sense anyway. Only one bit per controller.
+	 */
+	top->resets[ZX297520V3_GPIO8_RESET].reg = top->base + 0x74;
+	top->resets[ZX297520V3_GPIO8_RESET].mask = BIT(2);
+	top->resets[ZX297520V3_GPIO_RESET].reg = top->base + 0x74;
+	top->resets[ZX297520V3_GPIO_RESET].mask = BIT(3);
+
+	/* USB reset. This is slightly special because it needs to wait for a ready bit after
+	 * deasserting.
+	 *
+	 * FIXME: Actually implement this waiting.
+	 */
+	top->resets[ZX297520V3_USB_RESET].reg = top->base + 0x80;
+	top->resets[ZX297520V3_USB_RESET].mask = BIT(3) | BIT(4) | BIT(5);
+
+	/* This bit is set by ZTE's cpko.ko blob, it looks like a reset bit for the LTE DSP
+	 * coprocessor. Clocks for it are in matrixclk.
+	 */
+	top->resets[ZX297520V3_ZSP_RESET].reg = top->base + 0x13c;
+	top->resets[ZX297520V3_ZSP_RESET].mask = BIT(0);
+
+	top->rcdev.owner = THIS_MODULE;
+	top->rcdev.nr_resets = ZX297520V3_TOPRST_END;
+	top->rcdev.ops = &zx297520v3_rst_ops;
+	top->rcdev.of_node = dev->of_node;
+	return devm_reset_controller_register(dev, &top->rcdev);
+}
+
+static const struct of_device_id of_match_zx297520v3_topclk[] = {
+	{ .compatible = "zte,zx297520v3-topclk"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_topclk);
+
+static struct platform_driver clk_zx297520v3_topclk = {
+	.probe = zx297520_topclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3-topclk",
+		.of_match_table = of_match_zx297520v3_topclk,
+	},
+};
+module_platform_driver(clk_zx297520v3_topclk);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

