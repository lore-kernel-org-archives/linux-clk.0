Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6601433027
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176765; cv=none; b=FG5XWE2M6mqe/Z67jtV/pzF9uyQuZoFIJiIbm95nqEx/rc3nO9I8ARjtNHCzfQ2ryZk7E6NB+vsOS3RJ8jUK8ZTGkVjJJB7PsW8dqfZFvE6Y1Jh5bp812gk7dWGzvZZ/KZJH+eUJ5iR2BKkznk30oY7iQB37HFDFQAl2QPNWROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176765; c=relaxed/simple;
	bh=aWKP4wz8en3a73DZLBgjodUg0s6WA5IGHzBW/vtAGg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5TS1iI/BtdNz6KBGNoWvjNHJdPsWGz/Wlz7Ibk0ffyfkqCZTMt61gpS2p7pL65YBECo9Ne1a8tNfTfD8pVny04c2oXgS4c6ShrunRxY6xEtbVFUogvNc60yC0p0IxkWxVIQ3lvt3EGh0aQQUxEoby+DYlNTWRZu/dOhRq+aiCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWmLuC3a; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWmLuC3a"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2641119f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176760; x=1785781560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xiDDTB0gbxMaeJJZvl/88wvXC16dYyNfqvyI6WroRmU=;
        b=NWmLuC3aYNy0tiWo/nxQc+kfIC61NJL69IoA4Fwi87iju3PQBvJSAh9vPx+TCJYVGo
         oJ5dG75w+7djytC6Q2aQsbQIu6u3eLEsaaGJPFTDOrZTlV5cYN8eWX+AVpb+a9ppwPnL
         EoKFemsf0L48jVk/HL78GUaqRGXX8+QtfTTOrhc4IWCzP0Hj24/B/e1oGFjLaf/IT+Pj
         VzCVULkC+T9mSFr17zAzYKWOiMPx4WuwwT+B9K641aPDwKd2V6vgJSihtDPp4bxda8A2
         7FledXNLkVv7Rnalu9t7nIbO/BwKXFpz/k4UiZQR+4er3ROqhdxnL54FiSQH2LpyJF1o
         XgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176760; x=1785781560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiDDTB0gbxMaeJJZvl/88wvXC16dYyNfqvyI6WroRmU=;
        b=Rb5Bri7uSecZK3eJ1j3rDGMnVKvj0bUxlLwGdsPVQzxG3XfOh7od8ETdRv5y7JAYOK
         Bt/lNKh8ex/x/i9t0chhNe1UsiOp56wcpxCD6svaSVv+ncgmrYN+i1Jiw5/qhNqsUCu4
         N8ly6+uG56lZvYrh9qYjkkYEMhBHBRCKUxoX+a+pz5lkTaTFKnaT+Q6tNEpPuo5ww2Bo
         LKM3Idlz3pyb6W5WYPdgizuEG9Z/6jG4vQSKV7f6IfWPPGzvjiFDIm9aAdTd1V1sv0ax
         Q2zHR3qNG9+2Kh3MmcyHHfDRFMDqkmi90gCsk0H/Asiulw52YNu2cjJhJnfXCIPM4eIN
         yH7Q==
X-Gm-Message-State: AOJu0YwIFo6QjGxEWtSK/sBL//WsNOWoV/mdEC7LwNbdYe6bCjUrt62O
	iIMEHyv86HLf/0S7TL4e/5lj24neX/yVbpeWPRy8UlAe8NRgrhT/5adE
X-Gm-Gg: AR+sD12F643rvyx7II+HOO+GTRgDX6Hh1s59Sw4+r1dcAzXGBQWscylvTHkLxS6Yl96
	jZRYRF9234syDMoOdV8ImcgsLIGo073k6/4swVVY8Pf7VLI8DqrbRszkZ0fvY2YBayHGthk18Eb
	WCDTvG3VdGK3QQtQkOPUxCEDCK2maFOxf9rH5Gqj4HFe6aH8k0Cx/0S93oy1eK5CU9vxh1Pz/2I
	6OhDD9yW3w9rfc+mzg18iUILI6KpVQmjYm5YtwQXh/qpEpTolngfShC579/CFkiU/EAK9rcKGuc
	Sgfsskv4BN/S/je8gzl2NGadVQxdtu4TTzFiXm/sG7mnpfWGOn3kdA0k5ps9ZNOrAdiq2GX5Pcs
	c96kccvIEm/JelzA88AzIC6h0JJlTS8z6jGp151ySE/Os0VZzAzt/E/+68Tj2isja/vtAE7piNA
	cZYFNagzrqe+X6
X-Received: by 2002:a05:6000:26cd:b0:47f:8554:a346 with SMTP id ffacd0b85a97d-47f9fc91bdamr12234023f8f.21.1785176759497;
        Mon, 27 Jul 2026 11:25:59 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:23 +0300
Subject: [PATCH v8 08/12] clk: zte: Introduce a driver for zx297520v3 top
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-8-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=32271;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=aWKP4wz8en3a73DZLBgjodUg0s6WA5IGHzBW/vtAGg0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6j/NgxlmahBVs805H6iQIHtc2SpI0yihMu
 Fjj84NESsiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLkqA//a8t8FclfAdRSjbOjWUs14B7TamLY3+k
 LjNcfmCmbTSc5+fiW9D0vlclkTfRS1+J8k9BrScByMB+v27YXIzeNSNKutzzoooKicSrxdddwKs
 COT0piXgM7kSfJWx+gytr3wWWrPyDCBx2gnwZmM6Kb3+SdHdceOVrt2PUdndCgFR7JiJxpo0HwE
 FtoahpPEiePZNucxkNvPu4CdEUZm0rDj9yTQj7YM/4ToxjXzohko5k2Gpy2wPW6+KKNe3oYMN2W
 K++YCyjinKHL9BQ+fOlHDnTGoPIFF7B0+tuGbKkmTWaaIcgxK1/UV1rCiop90BXf3Yp7kzFGDXr
 /gJH3Y37OW+VspS5Z4camhw9KwzqkRA1bTv8aO9TG7lL6VhbiywtDnj6fNVaLO9hjw2DWedr0Gr
 X4emDqLpzE2uYvIr6HCR8rrEz+0qLeC5z7CTsKyiVKd1sAtb6RVwsZTM4xZBCR7bemdNZu+n3B8
 tORfNmR0JR15njrdN6F3wnsEQStKPO3wJm5mtjLmvoqSKQpTKBVOWk3bRwALt1/+6xN0OjZaLuF
 8fInfIBfx0pzqR1xzbhw5wF5couF8OSbtJ6hOuwE2uasSPD1qinsltDH4lL3G5rrNRhIcujAug8
 RMUXiioYfj9WwYCOVvm2DH3HT53zaXheFJeDVNQb5qqj4dsNNh0c=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This register space controls core devices: PLLs, the AHB bus, a lot of
timers, the USB controller, the Cortex M0 processor that boots the board
and a few other devices. For some reason the LTE coprocessor is also
partially controlled by it. The main application processor and DDR
memory are not found here though.

The register to reboot the board is found here, as well as a register to
control whether watchdog expiries cause a board reset.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 8:
Rename the expected clock name of the fixed oscillators to clock-26m and
clock-32k. Sashiko pointed out that "oscXXm" is deprecated, although
widespread in existing drivers.

Add a define indirection for the AXI candidate=critical protection.
While it holds true in a system with running rprocs, I find it useful
for stress testing the clock tree to disable it.

Double-checked pclk and wclk bits, fixed incorrect assignments in
register 0x54.

Version 7:

The register at top+0x140 contains a series of gates that control PLL
input into the top controller and PLL and osc26m work clock forward into
matrix. This allowed further insight into the clock tree.

The PLL subdivision list was replaced with fixed factor clocks that
divide PLLs before and after the input gate (and some fixed factor divs
go into matrix in the next patch). The number of clocks exported to
Matrix is actually relatively small.

As for Sashiko's suggestion about out of bound parents for dpll and
unknownpll: I have never seen a parent != 0. If that happens on a device
I want to know about it. At this stage of development I'd rather have
clearly visible orphaned clock than silently continuing at an unexpected
frequency.

"osc26m" -> "clock-26m" as "oscXX", although widespread, is deprecated.
In doing so, change underscores in clock names to dashes (Sashiko).

Version 5:

*) Make it a MFD child driver instead of binding to the node directly
*) Correct parents for dpll
*) Correct HSIC work clock parent
---
 drivers/clk/zte/Kconfig          |  11 +
 drivers/clk/zte/Makefile         |   1 +
 drivers/clk/zte/clk-zx297520v3.c | 576 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 588 insertions(+)

diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
index 0222549dd211..4a4b26c94a9d 100644
--- a/drivers/clk/zte/Kconfig
+++ b/drivers/clk/zte/Kconfig
@@ -14,3 +14,14 @@ config COMMON_CLK_ZTE
 	  of this.
 
 	  Enable this if you are building a kernel for a ZTE designed board.
+
+config CLK_ZTE_ZX297520V3
+	tristate "Clock driver for ZTE zx297520v3 based SoCs"
+	depends on COMMON_CLK_ZTE && (MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST)
+	default SOC_ZX297520V3
+	help
+	  This driver supports ZTE zx297520v3 basic clocks.
+
+	  Enable this if you want to build a kernel that is able to run on
+	  boards based on this SoC. You can safely enable multiple clock
+	  drivers. The one(s) matching the device tree will be used.
diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
index 27db07293165..2c073512e919 100644
--- a/drivers/clk/zte/Makefile
+++ b/drivers/clk/zte/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
+obj-$(CONFIG_CLK_ZTE_ZX297520V3) += clk-zx297520v3.o
 
 clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
new file mode 100644
index 000000000000..4444c2eb1382
--- /dev/null
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ *
+ * There are no public datasheets for zx297520v3. The controls on this clock controller have been
+ * extracted from ZTE's kernel and U-Boot sources and a LOT of manual testing. Some clocks can be
+ * found in the power management (evb_cpurpm.img) and LTE (cpko.ko) blobs shipped with the routers.
+ *
+ * Because ZTE's sources are wrong or misleading in some parts and testing can be misinterpreted,
+ * this file contains a LOT of comments on how particular clocks were tested and how the impact of
+ * changes to them can be observed.
+ */
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+
+#include "clk-zx.h"
+
+MODULE_IMPORT_NS("ZTE_CLK");
+
+/* AXI speed is either determined by a fixed selection in matrix+0x0, bits 0:2 or by a voting system
+ * with ballots in matrix+0x120, 0x124, 0x128. The voting system is enabled by setting matrix 0x12c
+ * to 1. Otherwise the selection in 0x0 applies.
+ *
+ * The fastest selected speed wins. This holds true for values 0 (26 MHz) and 7 (6.5 MHz) too, so it
+ * isn't a case of lowest selector wins. I haven't tested what happens if mpll is changed to output
+ * 5x the normal clock, so 7 beats 0. Presumably value 0 would still win the election.
+ *
+ * AXI speed 6.5 is a child of matrix-osc26m, not a PLL. This can be seen by gating it off in
+ * topcrm+0x140.
+ *
+ * The system initializes with voting disabled and all preferences set to the lowest setting, 7.
+ * The zx297520v3_matrix_init function transfers the global mux to our vote and enables voting.
+ *
+ * Because rprocs may change their selection without notice, all possible parents of the AXI mux are
+ * marked critical. This can however obscure bugs in the clock tree. Define ZX297520V3_AXI_CANDIDATE
+ * to 0 to disable this protection for testing and either not run anything on the rprocs or make
+ * sure Linux votes for the fastest rate.
+ */
+#define ZX297520V3_AXI_CANDIDATE CLK_IS_CRITICAL
+
+/* Used for gates where we don't know the parent input(s). Assume general oscillator */
+static const char clk_unknown[] = "clock-26m";
+
+/* For clocks that use the ungated clock-26m input */
+static const char * const clk_main[] = {
+	"clock-26m",
+};
+
+static const char * const dpll_parents[] = {
+	"unknownpll-d2",
+	"clock-26m",
+};
+
+static const char * const zx297520v3_top_inputs[] = {
+	"osc26m",
+	"osc32k"
+};
+
+/* Top and matrix clocks are chaotic - I haven't found a consistent pattern behind their register
+ * and bit locations. Generally there are two gates (pclk, wclk), one mux, two resets and sometimes
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
+ * Gates have 4 bits per clock - usually, but not always,  bit 0 for wclk, bit 1 for pclk, bit 2 for
+ * something the ZTE kernel calls "gate" (the bits we use here are called "en"), which presumably
+ * enables automatic clock gating. Bit 3, if settable, seems unused. E.g. offset 0x54 accepts all
+ * bits in 0xF77F7F7F - suggesting RTC, I2C0 have an extra gate bit.
+ *
+ * The default mpll settings multiply the 26 MHz reference clock times 24. A mux selection of 26 MHz
+ * could mean using the 26 MHz oscillator directly, or passing it through the PLL and divide by 24.
+ *
+ * If a UART is set to mpll-d6 (default 104 MHz), changing the mpll multipliers does affect UART
+ * timing as it should. This does not happen when the UART is set to 26 MHz input or timers that
+ * read 26 MHz input. This suggests 26 MHz clocks use the reference clock directly.
+ *
+ * The general clock flow on this board goes from clock-26m into the PLLs. The PLL output is
+ * branched into a small number of divided frequencies (mpll, mpll-d4, mpll-d5, mpll-d6, mpll-d8,
+ * gpll, gpll-d2, gpll-d4) at a high level. These divided frequencies as well as clock-26m go
+ * through a series of gates at offset 0x140 in topcrm. The output of these gates provide wclks for
+ * everything.
+ *
+ * At least 3 of those gate outputs (mpll, dpll, gpll-d2) are further divided behind those gates,
+ * presumably in the matrix controller. There are multiple paths how 104 and 78 MHz are derived,
+ * some specific to topcrm (0x140 bits 1 and 4), some specific to matrix (0x140 bit 9). There are
+ * likely 3 "copies" of the 78 MHz clock and two 50 MHz ones.
+ *
+ * Pclk is not gated by the 0x140 gates at all. Likewise clock-32k is fed to the timers without
+ * passing through this gate, even for consumers on matrix/LSP. Topcrm clock-26m wclks are not gated
+ * either, but top-consumed PLL clocks are.
+ */
+
+static const struct zx_fixed_divider_desc zx297520v3_top_fixed_divs[] = {
+	/* clock-26m division for clk_outX */
+	{"clock-26m-d2",		"clock-26m",		 2},
+
+	/* This one is a parent for dpll */
+	{"unknownpll-d2",		"unknownpll",		 2},
+
+	/* Pre-0x140 divisions. They enter topcrm through different bits in 0x140 */
+	{"mpll-d2",			"mpll",			 2},
+	{"mpll-d5",			"mpll",			 5},
+	{"mpll-d6",			"mpll",			 6},
+	{"mpll-d8",			"mpll",			 8},
+	{"upll-d12",			"upll",			12},
+	{"gpll-d2",			"gpll",			 2},
+	{"gpll-d4",			"gpll",			 4},
+
+	/* Post-140 divisions. They enter through the same bit and can be selected by different mux
+	 * values of their consumers or get piped to multiple consumers with different documented
+	 * rates - in particular, USB wclk (24 MHz according to ZTE) shares bit 1 with M0's 78 MHz.
+	 */
+	{"top-mpll-d2-d4",		"top-mpll-d2",		 4},
+	{"top-mpll-d2-d13",		"top-mpll-d2",		13},
+	{"top-upll-d12-d2",		"top-upll-d12",		 2},
+	{"top-gpll-d4-d2",		"top-gpll-d4",		 2},
+};
+
+/* AHB: The clock mux works and impact can be tested e.g. with iperf speed testing of the USB
+ * network connection. Values 2 and 3 give the same speed and depend on the same bit (3) in 0x140.
+ * The mpll-d6 rate is gated off by the same bit in 0x140 as m0's mpll-d6, but the d8 is different.
+ * This may indicate that one of the two uses a different clock rate than documented in ZTE's
+ * kernel. The M0 speed is easy to measure, so I am confident in the M0's 78 MHz rate. AHB looks
+ * like 78 rather than 52, but confidence is lower because RAM read tests are influenced by CPU
+ * overhead too.
+ */
+static const char * const ahb_sel[] = {
+	"clock-26m",
+	"top-mpll-d6",		/* 104 MHz */
+	"top-mpll-d8",		/* 78 MHz */
+	"top-mpll-d8",		/* 78 MHz */
+};
+
+static const char * const timer_top_sel[] = {
+	"clock-32k",
+	"clock-26m",
+};
+
+static const char * const uart_top_sel[] = {
+	"clock-26m",
+	"top-mpll-d6",	/* 104 MHz, sharing M0's and ahb's 0x140 gate */
+};
+
+/* The Cortex M0 coprocessor. It is responsible for booting the board and runs some power management
+ * helper code on the stock firmware. The M0 rproc itself is not critical, but most of topcrm's
+ * registers become unreadable if this is gated off or become slow when clocked at 32 kHz, e.g. GPIO
+ * becomes borderline unusable at 32 kHz.
+ *
+ * There is no dedicated M0 gate. Disabling ahb-wclk looks like the M0 stops from A53's point of
+ * view, but it merely breaks the A53's ability to communicate with it, and M0's ability to
+ * communicate with the standard UART on LSP. M0 keeps running with both ahb-wclk and ahb-pclk
+ * gated off and can re-enable the gates.
+ */
+static const char * const m0_sel[] = {
+	"clock-26m",
+	"top-mpll-d6",		/* 104 MHz */
+	"top-mpll-d2-d4",	/* 78 MHz, but different gate than the ahb counterpart */
+	"clock-32k",		/* Yes, tested. It is SLLLLOOOOOWWW. */
+};
+
+/* Clk-out0/1/2/32k: These clocks are exposed on GPIOs 15, 16, 17 and 18 respectively. They are used
+ * in ZTE's camera and sound code, by directly poking into the clock registers from the device
+ * drivers. Until the respective devices are supported they can safely be switched off.
+ *
+ * For clk-out1 ZTE's camera code says the following:
+ *
+ * 0 -> 20 MHz
+ * 1 -> 40 MHz
+ * 2 -> 13 MHz
+ * 3 -> 26 MHz
+ *
+ * 0 and 1 read from upll. I confirmed their rates (upll-d24 and upll-d12) by setting upll to a very
+ * low frequency and sampling the clock by GPIO reads. The outputs of 2 and 3 are way too high to
+ * test that way. Neither is reading from any PLL, they keep oscillating when all PLLs are disabled.
+ * I am fairly sure that 3 is just direct clock-26m because it perfectly matches what out2 is
+ * showing in its 26 MHz setting.
+ *
+ * Clk-out2 is similar, but it has only one control bit in top 0x34 bit 8. Neither setting selects
+ * a PLL output. When setting *0x34 = 0x080, clk-out1 and clk-out2 are in lockstep, presumably
+ * running at 13 MHz. 0x1c0 also runs in lockstep, presumably 26 MHz.
+ *
+ * clk-out0 has a mux in bit 5. Value 0 most likely selects clock-26m. I am not entirely sure about
+ * value 1 (which is the default), but the m0 mux has an impact on it. It looks like a debug pin
+ * that exposes some core clock.
+ */
+
+static const char * const out0_sel[] = {
+	"clock-26m",
+	"m0-mux",
+};
+
+static const char * const out1_sel[] = {
+	"top-upll-d12-d2",	/* 20 MHz */
+	"top-upll-d12",		/* 40 MHz */
+	"clock-26m-d2",
+	"clock-26m",
+};
+
+static const char * const out2_sel[] = {
+	"clock-26m-d2",
+	"clock-26m",
+};
+
+/* Clk-o is similar to clk-out*, providing a clock on GPIO 20, presumably for driving a (R)MII phy.
+ * The 50 MHz value is documented in a stray comment in ZTE's GMAC driver. I tested it similarly to
+ * the above pins. Mux setting 0 gives half the count as setting 1 and setting 1 gives gpll divided
+ * by 4 - matching the 50 MHz suggested by the ZTE comment at the default gpll settings. Gating gpll
+ * stops the clock for values 0 and 1.
+ *
+ * Settings 2 and 3 are possible, but seem to return garbage. It is generally pulsing up and down,
+ * except if both gpll and upll are stopped. I suspect it just reads random electrical fluctuation
+ * from other places in the board. Yes, I had a pull-down enabled when testing this.
+ *
+ * I am not aware of any board that uses this though. The Ethernet-equipped ones I have all run the
+ * PHY with its own oscillator.
+ */
+static const char * const rmii_sel[] = {
+	"top-gpll-d4-d2",	/* 25 MHz */
+	"top-gpll-d4",		/* 50 MHz */
+};
+
+static const struct zx_pll_desc zx297520v3_plls[] = {
+	/* Default setting: 0x48040c11. 624/312/156. Only a single possible parent. This is the
+	 * PLL for pretty much everything, including CPU, RAM and USB.
+	 *
+	 * Changing this PLL makes it possible to overclock the CPU or do more fine grained
+	 * underclocking than the CPU's mux allows. It does run into two problems though: The USB
+	 * device uses this PLL's output directly and is *very* sensitive to differences. DRAM
+	 * is also fed by this clock and needs to be re-trained on larger changes, which needs to
+	 * be done by the stage 1 boot loader.
+	 */
+	{
+		.name = "mpll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.reg = 0x8
+	},
+
+	/* ZTE's code calls this PLL "upll". The only possible consumers I found are clk-out1,
+	 * which outputs this clock on GPIO 16 and HSIC. HSIC doesn't have anything connected to
+	 * it on the devices I tested. The device that consumes clk-out1 seems to be an SPI
+	 * camera, which I haven't seen in any device so far. ZTE manipulates this PLL directly out
+	 * of the camera code, so it is unlikely to have another consumer.
+	 *
+	 * Long story short, shut it off.
+	 */
+	{
+		.name = "upll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.reg = 0x10,
+	},
+
+	/* Default value 0x4834902d. Feeds dpll. 46.08 MHz. Bit 25 can be set, so two parents are
+	 * possible. It looks like both values select the 26 MHz oscillator though.
+	 *
+	 * Since dpll's prepare may depend on this clock generating a usable signal, it needs to be
+	 * enabled when prepared.
+	 */
+	{
+		.name = "unknownpll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.reg = 0x100,
+		.flags = ZX297520V3_PLL_PREPARE_IS_ENABLE,
+	},
+
+	/* The documentation says 491.52 MHz and measurement with the LSP TDM device supports this.
+	 * The default value is 0x480c2011, but not all boot loaders set it up. To get to 491.52
+	 * with these settings it needs a 23.04 MHz reference clock, which matches unknownpll-d2.
+	 * If unknownpll is disabled, dpll loses its lock. We set the frequency on this PLL if we
+	 * find it is not enabled by the boot loader.
+	 *
+	 * The proprietary LTE driver or rproc enables and disables it. TDM and I2S can use it.
+	 *
+	 * It accepts parent values 0, 1, 2 and 3. Parent 0 is unknownpll-d2. The others look like
+	 * clock-26m. With a parent != 0 dpll never loses its lock even when all other PLLs are off
+	 * and the TDM counter register increases at a rate consistent with a 26.0/23.04 clock
+	 * increase.
+	 */
+	{
+		.name = "dpll",
+		.parents = dpll_parents,
+		.num_parents = ARRAY_SIZE(dpll_parents),
+		.rate = 491520000,
+		.reg = 0x18,
+	},
+
+	/* "g" is either for "general" or "gigahertz". The VCO runs at 1 GHz. Output clocks are 200,
+	 * 100, 50, 25, ... MHz. It is used optionally by SDIO and QSPI and can drive a GPIO clock
+	 * output for RMII, so it doesn't seem very general.
+	 */
+	{
+		.name = "gpll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.reg = 0x110,
+	},
+};
+
+#define MUX(_id, _name, _parents, _reg, _shift, _size) { \
+	_id, _name, _parents, ARRAY_SIZE(_parents), _reg, _shift, _size}
+
+#define DIV(_name, _parent, _reg, _shift, _size) { _name, _parent, _reg, _shift, _size }
+
+#define GATE(_id, _name, _parent, _reg, _shift, _flags) { \
+	.id = _id, \
+	.name = _name, \
+	.parent = _parent, \
+	.flags = _flags, \
+	.reg = _reg, \
+	.shift = _shift, \
+}
+
+static const struct zx_mux_desc zx297520v3_top_muxes[] = {
+	MUX(ZX297520V3_M0_WCLK,            "m0-mux",        m0_sel,            0x38,  0, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "ahb-mux",       ahb_sel,           0x3c,  4, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t08-mux", timer_top_sel,     0x40,  1, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t09-mux", timer_top_sel,     0x40,  0, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t12-mux", timer_top_sel,     0x3c,  0, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t13-mux", timer_top_sel,     0x44,  0, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t14-mux", timer_top_sel,     0x44,  1, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t15-mux", timer_top_sel,     0x3c,  3, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t16-mux", timer_top_sel,     0x44,  2, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-t17-mux", timer_top_sel,    0x120,  0, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "wdt-t18-mux",   timer_top_sel,     0x3c,  6, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "i2c0-mux",      uart_top_sel,      0x3c,  1, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "uart0-mux",     uart_top_sel,      0x40,  2, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "out0-mux",      out0_sel,          0x34,  5, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "out1-mux",      out1_sel,          0x34,  6, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "out2-mux",      out2_sel,          0x34,  8, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "rmiiphy-mux",   rmii_sel,         0x11c,  0, 2),
+};
+
+static const struct zx_div_desc zx297520v3_top_dividers[] = {
+	DIV("timer-t08-div", "timer-t08-mux",   0x4c,  8, 4),
+	DIV("timer-t09-div", "timer-t09-mux",   0x4c,  0, 4),
+	DIV("timer-t12-div", "timer-t12-mux",   0x48,  0, 4),
+	DIV("timer-t13-div", "timer-t13-mux",   0x50,  0, 4),
+	DIV("timer-t14-div", "timer-t14-mux",   0x50,  4, 4),
+	DIV("timer-t15-div", "timer-t15-mux",   0x48,  4, 4),
+	DIV("timer-t16-div", "timer-t16-mux",   0x50,  8, 4),
+	DIV("timer-t17-div", "timer-t17-mux",  0x124,  0, 4),
+	DIV("wdt-t18-div",   "wdt-t18-mux",     0x48,  8, 4),
+	DIV("usim1-div",     clk_unknown,       0x48, 12, 1),
+};
+
+static const struct zx_gate_desc zx297520v3_top_gates[] = {
+	/* topcrm input gates. These are complicated, but shed a lot of light on the board's clock
+	 * distribution.
+	 *
+	 * Settable mask: 0x017333FF. Generally one nibble per PLL, except for MPLL that has more.
+	 * One for clock-26m work clock. pclk and clock-32k are not gated globally here or anywhere
+	 * else as far as I can see.
+	 *
+	 * If you want to test your understanding of this board, try to manually configure it into a
+	 * setup where bit 24 or bit 9 are off without crashing it.
+	 */
+
+	/* Bit 0: No known consumer */
+	/* Bit 1: M0's 78 MHz selection, but somehow also involved in USB too */
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "top-mpll-d2",    "mpll-d2",       0x140,  1, 0),
+	/* Bit 2: No known consumer, named "mpll_48m_clk" in ZTE's cpko.ko blob */
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "top-mpll-d8",    "mpll-d8",       0x140,  3, 0),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "top-mpll-d6",    "mpll-d6",       0x140,  4, 0),
+	/* Bit 5: No known consumer. "mpll_156m_clk" in cpko.ko */
+	GATE(ZX297520V3_MPLL_D5,           "matrix-mpll-d5", "mpll-d5",       0x140,  6,
+	     ZX297520V3_AXI_CANDIDATE),
+	/* Bit 7: No known consumer */
+	/* Bit 8: Has a consumer, LTE depends on it. But unknown what and how. Most likely one of
+	 * the gsm clocks in topcrm+0x64 listed in cpko.ko.
+	 */
+	/* Bit 9: Big MPLL provider for Matrix. It is an AXI voting candidate, but it is protected
+	 * in Matrix's 0x118 gates.
+	 */
+	GATE(ZX297520V3_MPLL,              "matrix-mpll",    "mpll",          0x140,  9, 0),
+	/* Bit 10: Always 0 */
+	/* Bit 11: Always 0 */
+	/* Bit 12: No known consumer. Existing patterns indicate a dpll consumer in top itself */
+	GATE(ZX297520V3_DPLL,              "matrix-dpll",    "dpll",          0x140, 13, 0),
+	/* Bit 14: Always 0 */
+	/* Bit 15: Always 0 */
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "top-upll-d12",   "upll-d12",      0x140, 16, 0),
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "top-upll",       "upll",          0x140, 17, 0),
+	/* Bit 18: Always 0 */
+	/* Bit 19: Always 0 */
+	GATE(ZX297520V3_CLK_NO_EXPORT,     "top-gpll-d4",    "gpll-d4",       0x140, 20, 0),
+	GATE(ZX297520V3_GPLL_D2,           "matrix-gpll-d2", "gpll-d2",       0x140, 21, 0),
+	GATE(ZX297520V3_GPLL,              "matrix-gpll",    "gpll",          0x140, 22, 0),
+	/* Bit 23: Always 0 */
+	/* Bit 24 covers all 26 MHz on matrix, but not pclks. Clock-26m consumers on topcrm do not
+	 * use this, they get the ungated clock-26m. It is an AXI voting candidate, but does not
+	 * need protection because it is the slowest speed. It will only be used if every processor,
+	 * including us, votes for it.
+	 */
+	GATE(ZX297520V3_GATED_OSC26M,      "matrix-osc26m",  "clock-26m",     0x140, 24, 0),
+
+	/* AHB clock gates: Disabling these cuts off the A53 from register access into 0x130000/
+	 * 0x140000, including the topcrm region, so it can't be re-enabled. Mark them critical for
+	 * that reason.
+	 *
+	 * Gating this off does not stop the M0 rproc, nor does it stop M0 from accessing topcrm. It
+	 * does however gate off M0 from the AXI interconnect, so it can't read RAM, Matrix, etc. So
+	 * these bits here merely gate the bus, not the actual devices.
+	 */
+	GATE(ZX297520V3_AHB_PCLK,          "ahb-pclk",       "ahb-mux",        0x54, 12,
+	     CLK_IS_CRITICAL),
+	GATE(ZX297520V3_AHB_WCLK,          "ahb-wclk",       "m0-mux",         0x54, 13,
+	     CLK_IS_CRITICAL),
+
+	/* SRAM1 and 2 clocks. Leave them on for now, as turning them off carelessly hangs the M0 */
+	GATE(ZX297520V3_SRAM1_PCLK,        "sram1-pclk",     clk_main[0],      0x54, 18,
+	     CLK_IS_CRITICAL),
+	GATE(ZX297520V3_SRAM2_PCLK,        "sram2-pclk",     clk_main[0],      0x54, 16,
+	     CLK_IS_CRITICAL),
+
+	/* Pinmux (AON, TOP, IOCFG but not PDCFG). Critical as well until we have a driver that
+	 * consumes it. I don't think we'll realistically shut this off ever.
+	 *
+	 * Setting either bit 0 or 1 in register 0x58 makes the device work.
+	 */
+	GATE(ZX297520V3_PMM_WCLK,          "pmm-wclk",       clk_main[0],      0x58,  0,
+	     CLK_IS_CRITICAL),
+	GATE(ZX297520V3_PMM_PCLK,          "pmm-pclk",       clk_main[0],      0x58,  1,
+	     CLK_IS_CRITICAL),
+
+	/* Timers. We don't use any of them, just shut them off. The timers are named and sorted
+	 * by the IO address of the main timer controls. Some of the controls are documented in
+	 * ZTE's kernel, the others I found by trial and error. Timers in register 0x54 have the
+	 * pclk first, the others have the wclk first.
+	 *
+	 * Timer T17 is used by the ZSP firmware. The rproc driver will enable it as needed.
+	 */
+	GATE(ZX297520V3_TIMER_T08_WCLK,    "timer-t08-wclk", "timer-t08-div",  0x5c,  8, 0),
+	GATE(ZX297520V3_TIMER_T08_PCLK,    "timer-t08-pclk", clk_main[0],      0x5c,  9, 0),
+	GATE(ZX297520V3_TIMER_T09_WCLK,    "timer-t09-wclk", "timer-t09-div",  0x5c,  4, 0),
+	GATE(ZX297520V3_TIMER_T09_PCLK,    "timer-t09-pclk", clk_main[0],      0x5c,  5, 0),
+	GATE(ZX297520V3_TIMER_T12_WCLK,    "timer-t12-wclk", "timer-t12-div",  0x54,  5, 0),
+	GATE(ZX297520V3_TIMER_T12_PCLK,    "timer-t12-pclk", clk_main[0],      0x54,  4, 0),
+	GATE(ZX297520V3_TIMER_T13_WCLK,    "timer-t13-wclk", "timer-t13-div",  0x60,  0, 0),
+	GATE(ZX297520V3_TIMER_T13_PCLK,    "timer-t13-pclk", clk_main[0],      0x60,  1, 0),
+	GATE(ZX297520V3_TIMER_T14_WCLK,    "timer-t14-wclk", "timer-t14-div",  0x60,  4, 0),
+	GATE(ZX297520V3_TIMER_T14_PCLK,    "timer-t14-pclk", clk_main[0],      0x60,  5, 0),
+	GATE(ZX297520V3_TIMER_T15_WCLK,    "timer-t15-wclk", "timer-t15-div",  0x54, 21, 0),
+	GATE(ZX297520V3_TIMER_T15_PCLK,    "timer-t15-pclk", clk_main[0],      0x54, 20, 0),
+	GATE(ZX297520V3_TIMER_T16_WCLK,    "timer-t16-wclk", "timer-t16-div",  0x60,  8, 0),
+	GATE(ZX297520V3_TIMER_T16_PCLK,    "timer-t16-pclk", clk_main[0],      0x60,  9, 0),
+	GATE(ZX297520V3_TIMER_T17_WCLK,    "timer-t17-wclk", "timer-t17-div", 0x128,  0, 0),
+	GATE(ZX297520V3_TIMER_T17_PCLK,    "timer-t17-pclk", clk_main[0],     0x128,  1, 0),
+	/* This watchdog is set up by the bootloader and in normal operation the m0 firmware will
+	 * feed the dog. The m0 firmware in turn wants to be fed in its own way. Since we normally
+	 * don't run any m0 firmware we shut it off by default and expose it to userspace via the
+	 * watchdog driver.
+	 */
+	GATE(ZX297520V3_WDT_T18_WCLK,      "wdt-t18-wclk",   "wdt-t18-div",    0x54, 25, 0),
+	GATE(ZX297520V3_WDT_T18_PCLK,      "wdt-t18-pclk",   clk_main[0],      0x54, 24, 0),
+
+	GATE(ZX297520V3_I2C0_WCLK,         "i2c0-wclk",      "i2c0-mux",       0x54,  9, 0),
+	GATE(ZX297520V3_I2C0_PCLK,         "i2c0-pclk",      clk_main[0],      0x54,  8, 0),
+	GATE(ZX297520V3_UART0_WCLK,        "uart0-wclk",     "uart0-mux",      0x5c, 12, 0),
+	GATE(ZX297520V3_UART0_PCLK,        "uart0-pclk",     clk_main[0],      0x5c, 13, 0),
+
+	/* ZTE says the USB input is a 24 MHz clock based on mpll. Testing shows that Upll is not
+	 * involved. The USB register space can be accessed with ahb-pclk gated, but not with
+	 * ahb-wclk gated. ZTE also lists ahb-wclk as parent for the second clock.
+	 *
+	 * There doesn't seem to be a separate PHY clock. usb-wclk stops controller registers from
+	 * updating, but doesn't cause the USB device to disconnect like asserting the PHY reset
+	 * does. Bit 0 in this register can't be set, so no PHY clock is hiding there either.
+	 */
+	GATE(ZX297520V3_USB_WCLK,          "usb-wclk",      "top-mpll-d2-d13", 0x6c,  3, 0),
+	GATE(ZX297520V3_USB_PCLK,          "usb-pclk",      "ahb-wclk",        0x6c,  4, 0),
+	/* The HSIC hardware is listed in ZTE's code with a physical address of 0x01600000. Unlike
+	 * the USB controller, it does consume upll. ZTE says 240 MHz, but 480 is the usual one for
+	 * HSIC.
+	 */
+	GATE(ZX297520V3_HSIC_WCLK,         "hsic-wclk",     "top-upll",        0x6c,  1, 0),
+	GATE(ZX297520V3_HSIC_PCLK,         "hsic-pclk",     "ahb-wclk",        0x6c,  2, 0),
+
+	/* How does this RTC work? I don't know, the ZTE kernel does not talk to it. The actual RTC
+	 * is on the I2C-connected PMIC.
+	 */
+	GATE(ZX297520V3_RTC_WCLK,          "rtc-wclk",       clk_unknown,      0x54,  1, 0),
+	GATE(ZX297520V3_RTC_PCLK,          "rtc-pclk",       clk_main[0],      0x54,  0, 0),
+
+	GATE(ZX297520V3_USIM1_WCLK,        "usim1-wclk",     "usim1-div",      0x54, 29, 0),
+	GATE(ZX297520V3_USIM1_PCLK,        "usim1-pclk",     clk_main[0],      0x54, 28, 0),
+
+	/* LTE: gate only as far as I can see. I looked for resets and did not find any. There may
+	 * be mux/div, but without understanding the behavior of this hardware it is impossible to
+	 * tell. They are sorted by physical MMIO address of the devices, which happens to be the
+	 * inverse order of the bits.
+	 *
+	 * I don't know what "LPM", "TD" and "W" mean. I copied them from ZTE's names.
+	 *
+	 * Like PMM in this register, either bit enables register access, whether they control pclk
+	 * or wclk cannot be distinguished.
+	 */
+	GATE(ZX297520V3_LPM_GSM_WCLK,      "lpm-gsm-wclk",   clk_unknown,      0x58, 10, 0),
+	GATE(ZX297520V3_LPM_GSM_PCLK,      "lpm-gsm-pclk",   clk_main[0],      0x58, 11, 0),
+	GATE(ZX297520V3_LPM_LTE_WCLK,      "lpm-lte-wclk",   clk_unknown,      0x58,  8, 0),
+	GATE(ZX297520V3_LPM_LTE_PCLK,      "lpm-lte-pclk",   clk_main[0],      0x58,  9, 0),
+	GATE(ZX297520V3_LPM_TD_WCLK,       "lpm-td-wclk",    clk_unknown,      0x58,  6, 0),
+	GATE(ZX297520V3_LPM_TD_PCLK,       "lpm-td-pclk",    clk_main[0],      0x58,  7, 0),
+	GATE(ZX297520V3_LPM_W_WCLK,        "lpm-w-wclk",     clk_unknown,      0x58,  4, 0),
+	GATE(ZX297520V3_LPM_W_PCLK,        "lpm-w-pclk",     clk_main[0],      0x58,  5, 0),
+
+	GATE(ZX297520V3_OUT0_WCLK,         "out0-wclk",      "out0-mux",       0x34,  0, 0),
+	GATE(ZX297520V3_OUT1_WCLK,         "out1-wclk",      "out1-mux",       0x90,  2, 0),
+	GATE(ZX297520V3_OUT2_WCLK,         "out2-wclk",      "out2-mux",       0x94,  2, 0),
+	GATE(ZX297520V3_OUT32K_WCLK,       "out32k-wclk",    "clock-32k",      0x34,  1, 0),
+	GATE(ZX297520V3_RMIIPHY_WCLK,      "rmiiphy-wclk",   "rmiiphy-mux",   0x11c,  2, 0),
+};
+
+static const struct zx_clk_data zx297520v3_topclk_data = {
+	.inputs = zx297520v3_top_inputs,
+	.num_inputs = ARRAY_SIZE(zx297520v3_top_inputs),
+	.plls = zx297520v3_plls,
+	.num_plls = ARRAY_SIZE(zx297520v3_plls),
+	.fixed_divs = zx297520v3_top_fixed_divs,
+	.num_fixed_divs = ARRAY_SIZE(zx297520v3_top_fixed_divs),
+	.muxes = zx297520v3_top_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_top_muxes),
+	.divs = zx297520v3_top_dividers,
+	.num_divs = ARRAY_SIZE(zx297520v3_top_dividers),
+	.gates = zx297520v3_top_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_top_gates),
+};
+
+static int clk_zx297520v3_probe(struct platform_device *pdev)
+{
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+
+	if (!id)
+		return -ENODEV;
+
+	return zx_clk_common_probe(&pdev->dev, pdev->dev.parent->of_node,
+				   (const struct zx_clk_data *)id->driver_data);
+}
+
+static const struct platform_device_id clk_zx297520v3_ids[] = {
+	{
+		.name = "zx297520v3-topclk",
+		.driver_data = (kernel_ulong_t)&zx297520v3_topclk_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, clk_zx297520v3_ids);
+
+static struct platform_driver clk_zx297520v3 = {
+	.probe = clk_zx297520v3_probe,
+	.driver = {
+		.name = "clk-zx297520v3",
+	},
+	.id_table = clk_zx297520v3_ids,
+};
+module_platform_driver(clk_zx297520v3);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

