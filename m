Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F54396D14
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641644; cv=none; b=H7LOBoXpqKL0Ght0XFJzmx+dREVsbixHVd+xnH1Zx8oR9zc9GYz1WmJ0W+gs2JfVuEOeKTfxbpQ05FMRB0RCUr2r44oG9r8nQNyHGdfI49QFJx7QhVjTo8GcaZegvAa31DTUEZ/O+awEIVfneVYuszE7nvAfRkd75PyMgPnVZuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641644; c=relaxed/simple;
	bh=rjIuDqYIiFiv2gumQf48MMHKoYVI7rxTGDOhoRAmUz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=munayMzz7aAoKkwTZCPPB7ygYktb/eMJqi5fvnHrSic8BilKCUqzEB8lDkLU26Au/aM9L9XUCPwmfx5e7gg1tgBShAGJdLAvUA7aDLBuriFGGdb+1YjzvFV7P8zhSQL2GfIAEuTdus7x02sdaJSPQCRsiequkTyU1Tza9H7SRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8/qjxYk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8/qjxYk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso2254615e9.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641639; x=1782246439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upbiqC+lK2g94yNc4VZoGQXV/ZRQi7zmokJItxzYO7M=;
        b=A8/qjxYkMVFNTIKOLkw698+GDstfeDx1E9u/Jenn6mz8zYCLssj6yl7bGq76lG0pNd
         nRRK9oXhXxU2hatXuRgGdTyQIMZZfPT9IxOmDpnZ9wSkA0PnzEgU0osMUnWA2tck0jIx
         Wx/Q0614w4IGGPRCQ9Cs6cDpfEIpMdbf0kuIFeuyr2Y/9g/uHbVZuXQuPtIYJFybUaAJ
         4DA6ajf2ByRvyZ4y0A2LCH6CDhU6fg7R1B+Gy02QxnJsZFQlHoFPGCDcZzczahRc1Ilj
         I39MkXf46ABY/z+dz278/M9aulQcxNqK8z0SK6WRK0tX7EWILxniVI1vH6n4nCId1DUP
         Fm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641639; x=1782246439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=upbiqC+lK2g94yNc4VZoGQXV/ZRQi7zmokJItxzYO7M=;
        b=nEsrB1YWLP7UC4evenkNzn7OmIhfzD0bRIr/OdYk2j5OU3/5e+MbdmTk8vwCCGuvso
         OZ/pvB/jsTD3puLLIoqR3jtZqtz2ydzlAkhVBb7dTHXtelAK0f1R0tEw7GRTNt2LZgm6
         bGlEPgKA5nBTmGLe9b9JzfIviZ1PYPUhHe8LpVmLGEvKT664EYV1r5FOpKzAHkM+j8ND
         YDWpWA/18QTZIUqc609bbijPfAifSEKLvSYWyYTcgIJ8BfDXFft3rJFqLkgKSGC/J9OA
         YgGPjofZwvZyw0jzzSjMta8eAU4JGOGQ0YEpz9I6r23OdPZN44w2OVDpNZE1MLkfhHBJ
         aw6A==
X-Gm-Message-State: AOJu0YzHvWLFeDgxEusTQrbo0f5nHpskyKCCrGHg4PYHAkZqgfra7GcQ
	W+0ZApPCP+ZpwLwlM9/qHffOpVySI7oNZyDF1p9NbyhlxQvnUkhuLn9A
X-Gm-Gg: Acq92OHXMGng/r2ry5uuwt0ubDACXJjKOUHphuBUUs7GZdcQ/uEZVAhX5Vd+727d2Lk
	Me3+2lHLZxlRr/esph/1MaTzGDKrCdPsJ1vOGwTzKYQowAfai2SXQOGIPaa+Gsl70O+AJ+AlJ5T
	CQjC9vZOGNF739NG7xcp55JNYRixgNqpd969b230gTDQWKrtJSIYOzjrZFH3H9FP/lojtFYSlfC
	W4wiEYG9oCwRPcMyGN19RhtLAAik1mYoB7w1Z1s2YBEgGUj+aq6ftoCA3EFhAfcN3ajC5HvsXn+
	Shnk7b1qBttH7PWSTcCnrysewfVr66o80h+i7lFQIOqaxm3ofHFLBP1w8uq2naoO6hZZuNPLbIk
	lrbdRNoGZcKAygFw0uU0eYWxB+Gq/4iiXJWiXM7m1xOTd4rJuw6yFS7vAs1MB+XiBwfW7NFh0zk
	p86AAIKBagOHmnMg0qa2TXWuQpK8nYCUvYfw==
X-Received: by 2002:a05:600c:608c:b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-492340bc7fbmr3838635e9.3.1781641639129;
        Tue, 16 Jun 2026 13:27:19 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:18 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:27 +0300
Subject: [PATCH RFC v4 07/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-7-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=22898;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=rjIuDqYIiFiv2gumQf48MMHKoYVI7rxTGDOhoRAmUz0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGfJFYr68VfbgIODMGSNq1J8f69BlP81ZFT
 lOBTgArHgmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKRZg/8CIZvkpBaoVIRrfXnlSIR16gZdjKTW4K
 Xddqu6s9Y1DaHZhUoU11d8iWykNIjlr9FpdXXkS1ZdPWroZM5dz/wlFvjHf+YUN7j1heoI/Qhdt
 uv5Tf9QfkGCH+3A9eSMH4EkdBfg7OO8Q7sYpLNYsc31swJ1GJElRBscENKCxtgkKG2ABNPFAaQC
 caCpWuqgA3Vpxe7GeSnYV8SFLR6bJsiS8IvLNbM7Wh5qz6NW6Lnqn7cHoTLH+aZzaxefTOJ0uvQ
 /vCyOX5y+go2YrZ5xPf5NKPtvY2fDRc0/zq9nWDINCM1qCh+/37M0QjbyrsQvEaeSroytwraLzU
 Oip0h6Tydh4RgJAHzvJdSg1MSVV3F+5MYjKms4eJZVsjkzZMphb3PT8GRAjjrltCGeXa5IbhOFb
 +YtUZ6FOALPfDDUgF9G1vYyY/zsEa3qgLDCDowxs2dunZpcZ1lRS4tOHJqm/Edxgq68FH13kMiN
 dBaBfTbkJ5SWHgv6NqaoyWn+pN6VtLcWfKW3h5RvY5IsUWllqG4RM0wDitZmlZG/HYB7GC/Pzzi
 EVFdkSNC5V5SuSCzyTRl1GmDUCnMjD36ew921mgQivK14wDwknYsCNz8R1azGc0asb1nOKfXEgV
 asQV2OOkED27Fj58CFVMhNzwtJgGRGT0PEPxqqKOCXwZuVwe7tTc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This register space controls core devices: PLLs, the AHB bus, a lot of
timers, the USB controller, the Cortex M0 processor that boots the board
and a few other devices. For some reason the LTE coprocessor is also
partially controlled by it. The main application processor and DDR
memory are not found here though.

The register to reboot the board is found here, as well as a register to
control of watchdog expiries cause a board reset.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/zte/Kconfig          |  11 +
 drivers/clk/zte/Makefile         |   1 +
 drivers/clk/zte/clk-zx297520v3.c | 431 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 443 insertions(+)

diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
index b7b65a2172a9..12906212ec1e 100644
--- a/drivers/clk/zte/Kconfig
+++ b/drivers/clk/zte/Kconfig
@@ -15,3 +15,14 @@ config COMMON_CLK_ZTE
 	  of this.
 
 	  Enable this if you are building a kernel for a ZTE designed board.
+
+config CLK_ZTE_ZX297520V3
+	tristate "Clock driver for ZTE zx297520v3 based SoCs"
+	depends on COMMON_CLK_ZTE
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
index 000000000000..50263bca6e08
--- /dev/null
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+
+#include "clk-zx.h"
+
+MODULE_IMPORT_NS("ZTE_CLK");
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
+static const char * const zx297529v3_top_inputs[] = {
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
+ * Gates have 4 bits per clock - bit 0 for wclk, bit 1 for pclk, bit 2 for something the ZTE kernel
+ * calls "gate" (the bits we use here are called "en"), which I don't know what it does, and bit 3
+ * seems unused. E.g. offset 0x54 accepts all bits in 0xF77F7F7F - suggesting RTC, I2C0 have an
+ * extra gate bit.
+ *
+ * The default mpll settings multiply the 26 MHz reference clock times 24. A mux selection of 26 MHz
+ * could mean using the 26 MHz oscillator directly, or passing it through the PLL and divide by 24.
+ *
+ * If a UART is set to mpl_d6 (default 104 MHz), changing the mpll multipliers does affect UART
+ * timing as it should. This does not happen when the UART is set to 26 MHz input or timers that
+ * read 26 MHz input. This suggests 26 MHz clocks use the reference clock directly.
+ */
+
+/* AHB: The clock mux works and impact can be tested e.g. with iperf speed testing of the USB
+ * network connection. Values 2 and 3 give the same speed.
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
+/* The Cortex M0 coprocessor. It is responsible for booting the board and runs some power management
+ * helper code on the stock firmware, but isn't critical. We can run custom code on it but currently
+ * do not. These bits control the speed and the values are mentioned in ZTE's uboot. It isn't clear
+ * to me if this is directly responsible for the m0 clock, or if it is the input to another clock.
+ * Most likely it is the latter - setting it to osc32k slows down GPIO reads done on the Cortex A53
+ * a lot, although the speed of the A53 and DRAM access remains unaffected.
+ *
+ * I also haven't found a gate that shuts the m0 off and allows restarting. There don't seem to be
+ * resets either.
+ */
+static const char * const m0_sel[] = {
+	"osc26m",
+	"mpll_d6",	/* 104 mhz */
+	"mpll_d8",	/* 78 mhz */
+	"osc32k",	/* Yes, tested. It is SLLLLOOOOOWWW. */
+};
+
+/* Clk_out0/1/2/32k: These clocks are exposed on GPIOs 15, 16, 17 and 18 respectively. They are used
+ * in ZTE's camera and sound code, by directly poking into the clock registers from the device
+ * drivers. Until the respective devices are supported they can safely be switched off.
+ *
+ * For clk_out1 ZTE's camera code says the following:
+ *
+ * 0 -> 20 MHz
+ * 1 -> 40 MHz
+ * 2 -> 13 MHz
+ * 3 -> 26 MHz
+ *
+ * 0 and 1 read from upll. I confirmed their rates (upll_d24 and upll_d12) by setting upll to a very
+ * low frequency and sampling the clock by GPIO reads. The outputs of 2 and 3 are way too high to
+ * test that way. Both are not reading from any PLL. I am fairly sure that 3 is just direct osc26m
+ * because it perfectly matches what out2 is showing in its 26 MHz setting. Setting 2 is an enigma.
+ * It is not from any PLL (disable postdiv_out on all of them and the clock will keep oscillating).
+ *
+ * Probably the best way us to model this as a mux (bit 7) and divider (bit 6), but since this is
+ * not a plain val+1 divider like the rest of the divs I am leaving the divider out until an actual
+ * hardware user is found. It would need support for divider tables or flags in the regmap div
+ * clocks.
+ *
+ * Clk_out2 is similar, but it has only one control bit in top 0x34 bit 8. Neither setting selects
+ * a PLL output. When setting *0x34 = 0x080, clk_out1 and clk_out2 are in lockstep, presumably
+ * running at 13 MHz (clk_out1 mux select 26m, both have their divider set to 2). 0x1c0 also runs in
+ * lockstep (clk_out1 select 26m, both div 1).
+ *
+ * clk_out0 has a mux in bit 5. Value 0 most likely selects osc26m. I am not entirely sure about
+ * value 1 (which is the default), but the m0 mux has an impact on it. It looks like a debug pin
+ * that exposes some core clock.
+ */
+
+static const char * const out0_sel[] = {
+	"osc26m",
+	"m0_wclk",
+};
+
+static const char * const out1_sel[] = {
+	"upll_d12",	/* 40 MHz */
+	"osc26m",
+};
+
+/* Clk_o is similar to clk_out*, providing a clock on GPIO 20, presumably for driving a (R)MII phy.
+ * The 50 MHz value is documented in a stray comment in ZTE's GMAC driver. I tested it similarly to
+ * the above pins. Mux setting 0 gives half the count as setting 1 and setting 1 gives gpll divided
+ * by 4 - matching the 50 MHz suggested by the ZTE comment at the default gpll settings. Gating gpll
+ * stops the clock for values 0 and 1.
+ *
+ * Settings 2 and 3 are possible, but seem to return garbage. It is generally pulsing up and down,
+ * except if both gpll and upll are stopped. I suspect it just reads random electrical fluctuation
+ * from other places in the board. Yes, I had a pull-down enabled when testing this.
+ *
+ * This could also be a case of mux + inverse div, but since the settings we might possibly need are
+ * standard gpll outputs just model it as a mux.
+ *
+ * I am not aware of any board that uses this though. The Ethernet equipped ones I have all run the
+ * phy with its own oscillator.
+ */
+static const char * const rmii_sel[] = {
+	"gpll_d8",	/* 25 MHz */
+	"gpll_d4",	/* 50 MHz */
+};
+
+static const unsigned int mpll_postdivs[] = {1, 2, 3, 4, 5, 6, 8, 12, 16, 26};
+static const unsigned int pll_postdivs[] = {1, 2, 3, 4, 5, 6, 8, 12, 16};
+static const unsigned int unknownpll_postdivs[] = {2};
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
+		.id = ZX297520V3_MPLL,
+		.name = "mpll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.postdivs = mpll_postdivs,
+		.num_postdivs = ARRAY_SIZE(mpll_postdivs),
+		.reg = 0x8
+	},
+
+	/* ZTE's code calls this PLL "upll". The only possible consumer I found is clk_out1, which
+	 * outputs this clock on GPIO 16. The device that consumes this is an SPI camera, which I
+	 * haven't seen in any device so far.
+	 *
+	 * Long story short, shut it off.
+	 */
+	{
+		.id = ZX297520V3_UPLL,
+		.name = "upll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.postdivs = pll_postdivs,
+		.num_postdivs = ARRAY_SIZE(pll_postdivs),
+		.reg = 0x10,
+	},
+
+	/* Default value 0x4834902d. Feeds dpll. 46.08 MHz. Bit 25 can be set, so two parents are
+	 * possible. It looks like both values select the 26 MHz oscillator though.
+	 */
+	{
+		.id = 0,
+		.name = "unknownpll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.postdivs = unknownpll_postdivs,
+		.num_postdivs = ARRAY_SIZE(unknownpll_postdivs),
+		.reg = 0x100,
+	},
+
+	/* The documentation says 491.52 MHz and measurement with the LSP TDM device supports this.
+	 * The default value is 0x480c2011, but not all boot loaders set it up. To get to 491.52
+	 * with these settings it needs a 23.04 MHz reference clock, which matches unknownpll_d2.
+	 * If unknownpll is disabled, dpll loses its lock. We set the frequency on this PLL if we
+	 * find it is not enabled by the boot loader.
+	 *
+	 * The proprietary LTE driver or coproc enables and disables it. TDM and I2S can use it.
+	 *
+	 * It accepts parent values 0, 1, 2 and 3. Parent 0 is unknownpll_d2. The others look like
+	 * osc26m. With a parent != 0 dpll never loses its lock even when all other PLLs are off
+	 * and the TDM counter register increases at a rate consistent with a 26.0/23.04 clock
+	 * increase.
+	 */
+	{
+		.id = ZX297520V3_DPLL,
+		.name = "dpll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 491520000,
+		.postdivs = pll_postdivs,
+		.num_postdivs = ARRAY_SIZE(pll_postdivs),
+		.reg = 0x18,
+	},
+
+	/* "g" is either for "general" or "gigahertz". The VCO runs at 1GHz. Output clocks are 200,
+	 * 100, 50, 25, ... MHz. It is used optionally by SDIO and QSPI and can drive a GPIO clock
+	 * output for RMII, so it doesn't seem very general.
+	 */
+	{
+		.id = ZX297520V3_GPLL,
+		.name = "gpll",
+		.parents = clk_main,
+		.num_parents = ARRAY_SIZE(clk_main),
+		.rate = 0,
+		.postdivs = pll_postdivs,
+		.num_postdivs = ARRAY_SIZE(pll_postdivs),
+		.reg = 0x110,
+	},
+};
+
+#define MUX(_id, _name, _parents, _reg, _shift, _size) { \
+	_id, _name, _parents, ARRAY_SIZE(_parents), _reg, _shift, _size}
+
+#define DIV(_id, _name, _parent, _reg, _shift, _size) { _id, _name, _parent, _reg, _shift, _size }
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
+	MUX(ZX297520V3_M0_WCLK,            "m0_wclk",       m0_sel,            0x38,  0, 2),
+	MUX(0,                             "ahb_mux",       ahb_sel,           0x3c,  4, 2),
+	MUX(0,                             "timer_t08_mux", timer_top_sel,     0x40,  1, 1),
+	MUX(0,                             "timer_t09_mux", timer_top_sel,     0x40,  0, 1),
+	MUX(0,                             "timer_t12_mux", timer_top_sel,     0x3c,  0, 1),
+	MUX(0,                             "timer_t13_mux", timer_top_sel,     0x44,  0, 1),
+	MUX(0,                             "timer_t14_mux", timer_top_sel,     0x44,  1, 1),
+	MUX(0,                             "timer_t15_mux", timer_top_sel,     0x3c,  3, 1),
+	MUX(0,                             "timer_t16_mux", timer_top_sel,     0x44,  2, 1),
+	MUX(0,                             "timer_t17_mux", timer_top_sel,    0x120,  0, 1),
+	MUX(0,                             "wdt_t18_mux",   timer_top_sel,     0x3c,  6, 1),
+	MUX(0,                             "i2c0_mux",      uart_top_sel,      0x3c,  1, 1),
+	MUX(0,                             "uart0_mux",     uart_top_sel,      0x40,  2, 1),
+	MUX(0,                             "out0_mux",      out0_sel,          0x34,  5, 1),
+	MUX(0,                             "out1_mux",      out1_sel,          0x34,  7, 1),
+	MUX(0,                             "rmiiphy_mux",   rmii_sel,         0x11c,  0, 2),
+};
+
+static const struct zx_div_desc zx297520v3_top_dividers[] = {
+	DIV(0,                             "timer_t08_div", "timer_t08_mux",   0x4c,  8, 4),
+	DIV(0,                             "timer_t09_div", "timer_t09_mux",   0x4c,  0, 4),
+	DIV(0,                             "timer_t12_div", "timer_t12_mux",   0x48,  0, 4),
+	DIV(0,                             "timer_t13_div", "timer_t13_mux",   0x50,  0, 4),
+	DIV(0,                             "timer_t14_div", "timer_t14_mux",   0x50,  4, 4),
+	DIV(0,                             "timer_t15_div", "timer_t15_mux",   0x48,  4, 4),
+	DIV(0,                             "timer_t16_div", "timer_t16_mux",   0x50,  8, 4),
+	DIV(0,                             "timer_t17_div", "timer_t17_mux",  0x124,  0, 4),
+	DIV(0,                             "wdt_t18_div",   "wdt_t18_mux",     0x48,  8, 4),
+	DIV(0,                             "usim1_div",     clk_main[0],       0x48, 12, 1),
+};
+
+static const struct zx_gate_desc zx297520v3_top_gates[] = {
+	/* Turning off this clock crashes the device. */
+	GATE(ZX297520V3_AHB_WCLK,          "ahb_wclk",       "ahb_mux",        0x54, 12,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_AHB_PCLK,          "ahb_pclk",       clk_main[0],      0x54, 13,
+		CLK_IS_CRITICAL),
+
+	/* SRAM1 and 2 clocks. Leave them on for now, as turning them off carelessly hangs the M0 */
+	GATE(ZX297520V3_SRAM1_PCLK,        "sram1_pclk",     clk_main[0],      0x54, 18,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_SRAM2_PCLK,        "sram2_pclk",     clk_main[0],      0x54, 16,
+		CLK_IS_CRITICAL),
+
+	/* Pinmux (AON, TOP, IOCFG but not PDCFG). Critical as well until we have a driver that
+	 * consumes it. I don't think we'll realistically shut this off ever.
+	 *
+	 * Setting either bit 0 or 1 in register 0x58 makes the device work.
+	 */
+	GATE(ZX297520V3_PMM_WCLK,          "pmm_wclk",       clk_main[0],      0x58,  0,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_PMM_PCLK,          "pmm_pclk",       clk_main[0],      0x58,  1,
+		CLK_IS_CRITICAL),
+
+	/* Timers. We don't use any of them, just shut them off. The timers are named and sorted
+	 * by the IO address of the main timer controls. Some of the controls are documented in
+	 * ZTE's kernel, the others I found by trial and error.
+	 *
+	 * Timer T17 is used by the ZSP firmware. The rproc driver will enable it as needed.
+	 */
+	GATE(ZX297520V3_TIMER_T08_WCLK,    "timer_t08_wclk", "timer_t08_div",  0x5c,  8, 0),
+	GATE(ZX297520V3_TIMER_T08_PCLK,    "timer_t08_pclk", clk_main[0],      0x5c,  9, 0),
+	GATE(ZX297520V3_TIMER_T09_WCLK,    "timer_t09_wclk", "timer_t09_div",  0x5c,  4, 0),
+	GATE(ZX297520V3_TIMER_T09_PCLK,    "timer_t09_pclk", clk_main[0],      0x5c,  5, 0),
+	GATE(ZX297520V3_TIMER_T12_WCLK,    "timer_t12_wclk", "timer_t12_div",  0x54,  4, 0),
+	GATE(ZX297520V3_TIMER_T12_PCLK,    "timer_t12_pclk", clk_main[0],      0x54,  5, 0),
+	GATE(ZX297520V3_TIMER_T13_WCLK,    "timer_t13_wclk", "timer_t13_div",  0x60,  0, 0),
+	GATE(ZX297520V3_TIMER_T13_PCLK,    "timer_t13_pclk", clk_main[0],      0x60,  1, 0),
+	GATE(ZX297520V3_TIMER_T14_WCLK,    "timer_t14_wclk", "timer_t14_div",  0x60,  4, 0),
+	GATE(ZX297520V3_TIMER_T14_PCLK,    "timer_t14_pclk", clk_main[0],      0x60,  5, 0),
+	GATE(ZX297520V3_TIMER_T15_WCLK,    "timer_t15_wclk", "timer_t15_div",  0x54, 20, 0),
+	GATE(ZX297520V3_TIMER_T15_PCLK,    "timer_t15_pclk", clk_main[0],      0x54, 21, 0),
+	GATE(ZX297520V3_TIMER_T16_WCLK,    "timer_t16_wclk", "timer_t16_div",  0x60,  8, 0),
+	GATE(ZX297520V3_TIMER_T16_PCLK,    "timer_t16_pclk", clk_main[0],      0x60,  9, 0),
+	GATE(ZX297520V3_TIMER_T17_WCLK,    "timer_t17_wclk", "timer_t17_div", 0x128,  0, 0),
+	GATE(ZX297520V3_TIMER_T17_PCLK,    "timer_t17_pclk", clk_main[0],     0x128,  1, 0),
+	/* This watchdog is set up by the bootloader and in normal operation the m0 firmware will
+	 * feed the dog. The m0 firmware in turn wants to be fed in its own way. Since we normally
+	 * don't run any m0 firmware we shut it off by default and expose it to userspace via the
+	 * watchdog driver.
+	 */
+	GATE(ZX297520V3_WDT_T18_WCLK,      "wdt_t18_wclk",   "wdt_t18_div",    0x54, 24, 0),
+	GATE(ZX297520V3_WDT_T18_PCLK,      "wdt_t18_pclk",   clk_main[0],      0x54, 25, 0),
+
+	GATE(ZX297520V3_I2C0_WCLK,         "i2c0_wclk",      "i2c0_mux",       0x54,  8, 0),
+	GATE(ZX297520V3_I2C0_PCLK,         "i2c0_pclk",      clk_main[0],      0x54,  9, 0),
+	GATE(ZX297520V3_UART0_WCLK,        "uart0_wclk",     "uart0_mux",      0x5c, 12, 0),
+	GATE(ZX297520V3_UART0_PCLK,        "uart0_pclk",     clk_main[0],      0x5c, 13, 0),
+
+	/* ZTE says the USB input is a 24 MHz clock based on mpll. Testing shows that Upll is not
+	 * involved. The USB register space can be accessed with ahb_pclk gated, but not with
+	 * ahb_wclk gated. ZTE also lists ahb_wclk as parent for the second clock.
+	 */
+	GATE(ZX297520V3_USB_WCLK,          "usb_wclk",      "mpll_d26",        0x6c,  3, 0),
+	GATE(ZX297520V3_USB_PCLK,          "usb_pclk",      "ahb_wclk",        0x6c,  4, 0),
+	/* The HSIC hardware is listed in ZTE's code with a physical address of 0x01600000. These
+	 * bits are part of the ones that control it.
+	 */
+	GATE(ZX297520V3_HSIC_WCLK,         "hsic_wclk",     "mpll_d26",        0x6c,  1, 0),
+	GATE(ZX297520V3_HSIC_PCLK,         "hsic_pclk",     "ahb_wclk",        0x6c,  2, 0),
+
+	/* How does this RTC work? I don't know, the ZTE kernel does not talk to it. The actual RTC
+	 * is on the I2C connected PMIC.
+	 */
+	GATE(ZX297520V3_RTC_WCLK,          "rtc_wclk",       clk_unknown[0],   0x54,  0, 0),
+	GATE(ZX297520V3_RTC_PCLK,          "rtc_pclk",       clk_main[0],      0x54,  1, 0),
+
+	GATE(ZX297520V3_USIM1_WCLK,        "usim1_wclk",     "usim1_div",      0x54, 28, 0),
+	GATE(ZX297520V3_USIM1_PCLK,        "usim1_pclk",     clk_main[0],      0x54, 29, 0),
+
+	/* LTE: gate only as far as I can see. I looked for resets and did not find any. There may
+	 * be mux/div, but without understanding the behavior of this hardware it is impossible to
+	 * tell. They are sorted by physical MMIO address of the devices, which happens to be the
+	 * inverse order of the bits.
+	 *
+	 * I don't know what "LPM", "TD" and "W" mean. I copied them from ZTE's names.
+	 */
+	GATE(ZX297520V3_LPM_GSM_WCLK,      "lpm_gsm_wclk",   clk_unknown[0],   0x58, 10, 0),
+	GATE(ZX297520V3_LPM_GSM_PCLK,      "lpm_gsm_pclk",   clk_unknown[0],   0x58, 11, 0),
+	GATE(ZX297520V3_LPM_LTE_WCLK,      "lpm_lte_wclk",   clk_unknown[0],   0x58,  8, 0),
+	GATE(ZX297520V3_LPM_LTE_PCLK,      "lpm_lte_pclk",   clk_unknown[0],   0x58,  9, 0),
+	GATE(ZX297520V3_LPM_TD_WCLK,       "lpm_td_wclk",    clk_unknown[0],   0x58,  6, 0),
+	GATE(ZX297520V3_LPM_TD_PCLK,       "lpm_td_pclk",    clk_unknown[0],   0x58,  7, 0),
+	GATE(ZX297520V3_LPM_W_WCLK,        "lpm_w_wclk",     clk_unknown[0],   0x58,  4, 0),
+	GATE(ZX297520V3_LPM_W_PCLK,        "lpm_w_pclk",     clk_unknown[0],   0x58,  5, 0),
+
+	GATE(ZX297520V3_OUT0_WCLK,         "out0_wclk",      "out0_mux",       0x34,  0, 0),
+	GATE(ZX297520V3_OUT1_WCLK,         "out1_wclk",      "out1_mux",       0x90,  2, 0),
+	GATE(ZX297520V3_OUT2_WCLK,         "out2_wclk",      clk_main[0],      0x94,  2, 0),
+	GATE(ZX297520V3_OUT32K_WCLK,       "out32k_wclk",    "osc32k",         0x34,  1, 0),
+	GATE(ZX297520V3_RMIIPHY_WCLK,      "rmiiphy_wclk",   "rmiiphy_mux",   0x11c,  2, 0),
+};
+
+static const struct zx_clk_data zx297520v3_topclk_data = {
+	.inputs = zx297529v3_top_inputs,
+	.num_inputs = ARRAY_SIZE(zx297529v3_top_inputs),
+	.plls = zx297520v3_plls,
+	.num_plls = ARRAY_SIZE(zx297520v3_plls),
+	.muxes = zx297520v3_top_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_top_muxes),
+	.divs = zx297520v3_top_dividers,
+	.num_divs = ARRAY_SIZE(zx297520v3_top_dividers),
+	.gates = zx297520v3_top_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_top_gates),
+	.reset_auxdev_name = "zx297520v3_toprst"
+};
+
+static const struct of_device_id of_match_zx297520v3[] = {
+	{ .compatible = "zte,zx297520v3-topclk", .data = &zx297520v3_topclk_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3);
+
+static struct platform_driver clk_zx297520v3 = {
+	.probe = zx_clk_probe,
+	.driver = {
+		.name = "clk-zx297520v3",
+		.of_match_table = of_match_zx297520v3,
+	},
+};
+
+module_platform_driver(clk_zx297520v3);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

