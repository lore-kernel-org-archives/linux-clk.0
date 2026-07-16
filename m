Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424B53CEBBB
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240253; cv=none; b=Dr/8vleVc/Pnhm66U+RRgXN2p8n/7YfEHBQOoyGg5/Ip0kmCYZxFWIAbHa+gfWoaWQfpGVlE4IWHb4NcC8hIw5SkeoWiB6yzMBNFHFaGXn77HttuaniYrs9Pux0mNAKRr5m39tDhqjmrrGX0JbtdHbQIbUJsEQy7mzlhuqbF1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240253; c=relaxed/simple;
	bh=11hngiqwPMWQKJYfHPUwm8JUHTQO6wNmP9fxdqFYKWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubSF/Fh+TY+1F3WL5S83gnQjKz9Ttxd9/Zqk18zSVj2bo7Lp2yQvw16MQjnIJ49THVnCcNj71e6nKUQ7v7+1qKOLugWOeHPAGXe8nQu6ko3egtuLZDKPG1rx1Lecwujue9YpR1nFSPCmd7JiiLSaHdjPao3Fj/jLIyKKbh/SbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJoGB+PY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJoGB+PY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47db714766aso444039f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 15:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240249; x=1784845049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uELeJYYbHg+El5mtXQD5UioQ3wVMOPdr6PSy7q66II=;
        b=OJoGB+PYQstK/jnyd30eoH94mk2lzLQPOzfniOOKmp4q71h0kvrUrU7avxMIGKfzeX
         AYdDeZinGkCXsg7DOWAdKIo4LCp9YoNw9ybhREuzTTrHIw6Y50Zcdv19+v5ngnn+V2sN
         szVHlwLhF38w9LaabwyJZL7oaEM7ybvuZEg757TnPMOBKTBxaXXqnQJpGbo8gPz5oxSR
         L6A4y17URjRsVjZaE/7S8o6S+vRqedqo3lQBMfox3ST0bW2YOVlsX5P/+hyvYBvl7PAp
         Pu6kKvAuU3KYCU3V39LBffb2OhL7OXsPZMZbhVY1wK7XngeSrCpmt4g/8xtwIqSBrEt9
         1pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240249; x=1784845049;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uELeJYYbHg+El5mtXQD5UioQ3wVMOPdr6PSy7q66II=;
        b=nPl+5gmxVfod2TPYEUDEOgE4Pq6lxc4zp5epH+OdABqqqNbjkHBB9d2w1BT/+YGqk5
         ZHq2cr2cn7J4/ypwJCuJzfwssJEvI+071fLnnVyvywi+XI8MfQxYOM3V+7uIEHrB8CZJ
         d9onO2w0g7mUKmlP2gzvXT6TmW1pnzCfl0AiIF90IRIeFqGJso5rySg643WB5opqJCTt
         yrBGmJAW/uVdHL4A2bNlRfWUkINkSTPF8Wi/3lXKSIdxbiGx6QkWR+M3Jrwn1/j8Xrce
         PTNZ7IG+LDOy//iZDA5x5i0oOufb/KodKYSdQFgFIMPl1JlJ1psG6VZgW5pxu4sza6Gd
         FDyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVW3ukbI6AYTfoLq1Q9N/PspmenmHYIB1ZFfBEQALfdZZBipCbIwua2WhIwWuc2Q782iygBPjA2wA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/5/oXCIOm9frUax3TtzI4MILTx70VQS4MBpDu1mubTjgtaug
	E/+4CzAYjiwnZ0qsSPIhMwOAcX/CxsIDXrCKda7gpnGxZAQuNZJwRkeN
X-Gm-Gg: AfdE7cmJyD3tdiJEA8jw64/aA2Z5rX1lObzX6MYYcvkC0latl31mygITHG2y4UlBU+E
	MzCrfXZuq9kfU1avziRI59nQedpPDtI+cVEXe5XlzFmJKjlODCl9F8ON/90aRnSC0IIz1w7KKYW
	VSX284xY4SK2Ft0f9gV6Lxvjd7pm9RN+590FWD7W9lriqTKt3nY5Us96K0qO4orJr5kxEBjt4II
	iSaETVGtvaP023Qj0uxcU0Mf1tJiAzpxjBf3RMWKRvUJj3q/w7z+LIZ28Rbgy4JdNh1DnfXjr9f
	YblEEv/2ZBDnv5kLZHuVmRH+LUZGp1r2gxWSCwKITGoYNRXIEEGylorQ+Od3xyqlBxx119oBYq+
	OoIAo8T/hI9OYifOEAAho/LfsXXFmoj4ghXiGY1+VJNK91pyL7RFrNqSdsJWGuQLQxtxPfIFi4R
	gfGvxyw/LJreEyyQ==
X-Received: by 2002:a5d:64e8:0:b0:460:395c:7404 with SMTP id ffacd0b85a97d-47f5a43ce80mr5745386f8f.20.1784240249185;
        Thu, 16 Jul 2026 15:17:29 -0700 (PDT)
Received: from strix.doe.home ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c4320sm26192846f8f.32.2026.07.16.15.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:17:28 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 11/13] clk: zte: Introduce a driver for zx297520v3 LSP clocks
Date: Fri, 17 Jul 2026 01:17:17 +0300
Message-ID: <20260717-zx29clk-v7-11-50abfa8dd594@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

"LSP" is ZTE's term for this part of the SoC, I suspect it stands for
"low speed peripherals". The main UART is here, together with the flash
controller and more surplus proprietary timers.

It also has one more I2C controller that supposedly connects to a
battery charger, SPI for displays and I2S for analog telephones. The
boards I have don't have any of these components though.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 7:
Underscore in clock names to dashes

Version 6:
use MFD for LSP too

Version 5:
Removed unused tdm_lsp_sel. Fix zx297529 vs zx297520 typo.
Adjusted .compatible to zte,zx297520v3-lspcrm
---
 drivers/clk/zte/clk-zx297520v3.c | 189 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index e08ba9623345..8179c8b80433 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -818,6 +818,191 @@ static const struct zx_clk_data zx297520v3_matrixclk_data = {
 	.num_gates = ARRAY_SIZE(zx297520v3_matrix_gates),
 };
 
+/* LSP clock entries have a common pattern: Bit 0 for WCLK, Bit 1 for PCLK. Bit 4 (and sometimes
+ * more) for WCLK mux.
+ *
+ * Bit 8 and 9 are resets handled by the reset-zte-zx297520v3 driver.
+ *
+ * Bits 15:12 can be a divisor, but not all clocks have it. Some clocks have a divisor in 19:16.
+ *
+ * The ID given in this table is the first register in the device's MMIO space. ZTE's drivers
+ * usually call this a version register, but it looks more like a device identifier.
+ *
+ * It looks like the registers map to devices like this:
+ *
+ * Timer reg	function	div	dev offset(lsp + xxxx)	ID
+ * 0x0: Read-only, probably device identifier			0x00752100
+ * 0x4:		timer_l1	Y	0x1000			0x02020000
+ * 0x8:		watchdog_l2	Y	0x2000			0x02020000
+ * 0xc:		watchdog_l3	Y	0x3000			0x02020000
+ * 0x10:	pwm		N	0x4000			0x01020000
+ * 0x14:	i2s0		Yh	0x5000			0x01030000
+ * 0x18:	always 0	-	-			-
+ * 0x1c:	i2s1		Yh	0x6000			0x01030000
+ * 0x20:	always 0	-	-			-
+ * 0x24:	qspi		N	0x7000			0x01040000
+ * 0x28:	uart1		N	0x8000			0x01060000
+ * 0x2c:	i2c1		N	0x9000			0x01020000
+ * 0x30:	spi0		Y	0xa000			0x01040000
+ * 0x34:	timer_lb	Y	0xb000			0x02020000
+ * 0x38:	timer_lc	Y	0xc000			0x02020000
+ * 0x3c:	uart2		N	0xd000			0x01060000
+ * 0x40:	watchdog_le	Y	0xe000			0x02020000
+ * 0x44:	timer_lf	Y	0xf000			0x02020000
+ * 0x48:	spi1		Y	0x10000			0x01040000
+ * 0x4c:	timer_l11	Y	0x11000			0x02020000
+ * 0x50:	tdm		Yh	0x12000			0x01040000
+ *
+ * Registers 0x58, 0x5c, 0x60, 0x64, 0x68 seem to contain more controls for i2s and tdm.
+ *
+ * I am not sure about the device at offset 0x4000 (clk reg 0x10). The ID matches that of i2c, but
+ * it has a larger register set. I suspect it is a PWM device, but I have not seen any ZTE kernel
+ * operate it - even devices with displays only use a GPIO to control the backlight.
+ */
+
+static const char * const timer_lsp_sel[] = {
+	"lsp-osc32k",
+	"lsp-osc26m",
+};
+
+static const char * const uart_lsp_sel[] = {
+	"lsp-osc26m",
+	"lsp-mpll-d6",
+};
+
+static const char * const i2s_lsp_sel[] = {
+	"lsp-osc26m",
+	"lsp-dpll-d4",
+	"lsp-mpll-d6",
+	/* Unknown */
+};
+
+static const char * const spi_lsp_sel[] = {
+	"lsp-osc26m",
+	"lsp-mpll-d4",
+	"lsp-mpll-d6",
+	/* Unknown */
+};
+
+static const char * const qspi_lsp_sel[] = {
+	"lsp-osc26m",
+	"lsp-mpll-d4",
+	"lsp-mpll-d5",
+	"lsp-mpll-d6",
+	"lsp-mpll-d8",
+	"lsp-mpll-d12",
+	"lsp-osc26m",
+	"lsp-osc26m",
+};
+
+static const struct zx_mux_desc zx297520v3_lsp_muxes[] = {
+	MUX(0,                             "timer-l1-mux",   timer_lsp_sel,    0x04,  4, 1),
+	MUX(0,                             "wdt-l2-mux",     timer_lsp_sel,    0x08,  4, 1),
+	MUX(0,                             "wdt-l3-mux",     timer_lsp_sel,    0x0c,  4, 1),
+	/* PWM: No mux bit can be set */
+	MUX(0,                             "i2s0-mux",       i2s_lsp_sel,      0x14,  4, 2),
+	/* 0x18: Always 0 */
+	MUX(0,                             "i2s1-mux",       i2s_lsp_sel,      0x1c,  4, 2),
+	/* 0x20: Always 0 */
+	MUX(0,                             "qspi-mux",       qspi_lsp_sel,     0x24,  4, 3),
+	MUX(0,                             "uart1-mux",      uart_lsp_sel,     0x28,  4, 1),
+	MUX(0,                             "i2c1-mux",       uart_lsp_sel,     0x2c,  4, 1),
+	MUX(0,                             "spi0-mux",       spi_lsp_sel,      0x30,  4, 2),
+	MUX(0,                             "timer-lb-mux",   timer_lsp_sel,    0x34,  4, 1),
+	MUX(0,                             "timer-lc-mux",   timer_lsp_sel,    0x38,  4, 1),
+	MUX(0,                             "uart2-mux",      uart_lsp_sel,     0x3c,  4, 1),
+	MUX(0,                             "wdt-le-mux",     timer_lsp_sel,    0x40,  4, 1),
+	MUX(0,                             "timer-lf-mux",   timer_lsp_sel,    0x44,  4, 1),
+	MUX(0,                             "spi1-mux",       spi_lsp_sel,      0x48,  4, 2),
+	MUX(0,                             "timer-l11-mux",  timer_lsp_sel,    0x4c,  4, 1),
+	/* TDM: No mux in LSP. Instead, it is in matrix with a separate clk line to LSP */
+};
+
+static const struct zx_div_desc zx297520v3_lsp_dividers[] = {
+	DIV("timer-l1-div",   "timer-l1-mux",   0x04, 12, 4),
+	DIV("wdt-l2-div",     "wdt-l2-mux",     0x08, 12, 4),
+	DIV("wdt-l3-div",     "wdt-l3-mux",     0x0c, 12, 4),
+	/* PWM: No div */
+	DIV("i2s0-div",       "i2s0-mux",       0x14, 16, 4),
+	/* 0x18: Always 0 */
+	DIV("i2s1-div",       "i2s1-mux",       0x1c, 16, 4),
+	/* 0x20: Always 0 */
+	/* qspi, uart1, i2c1: No div */
+	DIV("spi0-div",       "spi0-mux",       0x30, 12, 4),
+	DIV("timer-lb-div",   "timer-lb-mux",   0x34, 12, 4),
+	DIV("timer-lc-div",   "timer-lc-mux",   0x38, 12, 4),
+	/* uart2: No div */
+	DIV("wdt-le-div",     "wdt-le-mux",     0x40, 12, 4),
+	DIV("timer-lf-div",   "timer-lf-mux",   0x44, 12, 4),
+	DIV("spi1-div",       "spi1-mux",       0x48, 12, 4),
+	DIV("timer-l11-div",  "timer-l11-mux",  0x4c, 12, 4),
+	DIV("tdm-div",        "lsp-tdm-wclk",   0x50, 16, 4),
+};
+
+static const struct zx_gate_desc zx297520v3_lsp_gates[] = {
+	GATE(ZX297520V3_TIMER_L1_WCLK,     "timer-l1-wclk",  "timer-l1-div",   0x04,  0, 0),
+	GATE(ZX297520V3_TIMER_L1_PCLK,     "timer-l1-pclk",  "lsp-pclk",       0x04,  1, 0),
+	GATE(ZX297520V3_WDT_L2_WCLK,       "wdt-l2-wclk",    "wdt-l2-div",     0x08,  0, 0),
+	GATE(ZX297520V3_WDT_L2_PCLK,       "wdt-l2-pclk",    "lsp-pclk",       0x08,  1, 0),
+	GATE(ZX297520V3_WDT_L3_WCLK,       "wdt-l3-wclk",    "wdt-l3-div",     0x0c,  0, 0),
+	GATE(ZX297520V3_WDT_L3_PCLK,       "wdt-l3-pclk",    "lsp-pclk",       0x0c,  1, 0),
+	/* I don't know the LSP parent. It must be one of the LSP inputs though. */
+	GATE(ZX297520V3_PWM_WCLK,          "pwm-wclk",       "lsp-osc26m",     0x10,  0, 0),
+	GATE(ZX297520V3_PWM_PCLK,          "pwm-pclk",       "lsp-pclk",       0x10,  1, 0),
+	GATE(ZX297520V3_I2S0_WCLK,         "i2s0-wclk",      "i2s0-div",       0x14,  0, 0),
+	GATE(ZX297520V3_I2S0_PCLK,         "i2s0-pclk",      "lsp-pclk",       0x14,  1, 0),
+	/* 0x1c: Always 0 */
+	GATE(ZX297520V3_I2S1_WCLK,         "i2s1-wclk",      "i2s1-div",       0x1c,  0, 0),
+	GATE(ZX297520V3_I2S1_PCLK,         "i2s1-pclk",      "lsp-pclk",       0x1c,  1, 0),
+	/* 0x20: Always 0 */
+	GATE(ZX297520V3_QSPI_WCLK,         "qspi-wclk",      "qspi-mux",       0x24,  0, 0),
+	GATE(ZX297520V3_QSPI_PCLK,         "qspi-pclk",      "lsp-pclk",       0x24,  1, 0),
+	GATE(ZX297520V3_UART1_WCLK,        "uart1-wclk",     "uart1-mux",      0x28,  0, 0),
+	GATE(ZX297520V3_UART1_PCLK,        "uart1-pclk",     "lsp-pclk",       0x28,  1, 0),
+	GATE(ZX297520V3_I2C1_WCLK,         "i2c1-wclk",      "i2c1-mux",       0x2c,  0, 0),
+	GATE(ZX297520V3_I2C1_PCLK,         "i2c1-pclk",      "lsp-pclk",       0x2c,  1, 0),
+	GATE(ZX297520V3_SPI0_WCLK,         "spi0-wclk",      "spi0-div",       0x30,  0, 0),
+	GATE(ZX297520V3_SPI0_PCLK,         "spi0-pclk",      "lsp-pclk",       0x30,  1, 0),
+	GATE(ZX297520V3_TIMER_LB_WCLK,     "timer-lb-wclk",  "timer-lb-div",   0x34,  0, 0),
+	GATE(ZX297520V3_TIMER_LB_PCLK,     "timer-lb-pclk",  "lsp-pclk",       0x34,  1, 0),
+	GATE(ZX297520V3_TIMER_LC_WCLK,     "timer-lc-wclk",  "timer-lc-div",   0x38,  0, 0),
+	GATE(ZX297520V3_TIMER_LC_PCLK,     "timer-lc-pclk",  "lsp-pclk",       0x38,  1, 0),
+	GATE(ZX297520V3_UART2_WCLK,        "uart2-wclk",     "uart2-mux",      0x3c,  0, 0),
+	GATE(ZX297520V3_UART2_PCLK,        "uart2-pclk",     "lsp-pclk",       0x3c,  1, 0),
+	GATE(ZX297520V3_WDT_LE_WCLK,       "wdt-le-wclk",    "wdt-le-div",     0x40,  0, 0),
+	GATE(ZX297520V3_WDT_LE_PCLK,       "wdt-le-pclk",    "lsp-pclk",       0x40,  1, 0),
+	GATE(ZX297520V3_TIMER_LF_WCLK,     "timer-lf-wclk",  "timer-lf-div",   0x44,  0, 0),
+	GATE(ZX297520V3_TIMER_LF_PCLK,     "timer-lf-pclk",  "lsp-pclk",       0x44,  1, 0),
+	GATE(ZX297520V3_SPI1_WCLK,         "spi1-wclk",      "spi1-div",       0x48,  0, 0),
+	GATE(ZX297520V3_SPI1_PCLK,         "spi1-pclk",      "lsp-pclk",       0x48,  1, 0),
+	GATE(ZX297520V3_TIMER_L11_WCLK,    "timer-l11-wclk", "timer-l11-div",  0x4c,  0, 0),
+	GATE(ZX297520V3_TIMER_L11_PCLK,    "timer-l11-pclk", "lsp-pclk",       0x4c,  1, 0),
+	GATE(ZX297520V3_TDM_WCLK,          "tdm-wclk",       "tdm-div",        0x50,  0, 0),
+	GATE(ZX297520V3_TDM_PCLK,          "tdm-pclk",       "lsp-pclk",       0x50,  1, 0),
+};
+
+static const char * const zx297520v3_lsp_inputs[] = {
+	"mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+	"osc26m", "osc32k", "tdm-wclk", "dpll-d4"
+};
+
+static const char * const zx297520v3_lsp_inputs_enable[] = {
+	"pclk"
+};
+
+static const struct zx_clk_data zx297520v3_lspclk_data = {
+	.inputs_enable = zx297520v3_lsp_inputs_enable,
+	.num_inputs_enable = ARRAY_SIZE(zx297520v3_lsp_inputs_enable),
+	.inputs = zx297520v3_lsp_inputs,
+	.num_inputs = ARRAY_SIZE(zx297520v3_lsp_inputs),
+	.muxes = zx297520v3_lsp_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_lsp_muxes),
+	.divs = zx297520v3_lsp_dividers,
+	.num_divs = ARRAY_SIZE(zx297520v3_lsp_dividers),
+	.gates = zx297520v3_lsp_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_lsp_gates),
+};
+
 static int clk_zx297520v3_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -838,6 +1023,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
 		.name = "zx297520v3-matrixclk",
 		.driver_data = (kernel_ulong_t)&zx297520v3_matrixclk_data,
 	},
+	{
+		.name = "zx297520v3-lspclk",
+		.driver_data = (kernel_ulong_t)&zx297520v3_lspclk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, clk_zx297520v3_ids);

-- 
2.54.0
