Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F45397350
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641650; cv=none; b=OhjydRUztKEfnUZ6aU/zB1EITm2w7LYGCp/D+Y04wp8i0P8dRLIwlphZh5AvvgUESh+Wj3joiCz/3RYkcjKUb7YgSyINk7k7MWqap1DNakmSf9LlwsczAS3VUirGNRpqU9obfqkF4nIXkewZ0PlBUm9wM/t3bE6wgvOsT1MByuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641650; c=relaxed/simple;
	bh=lbHHuSxqYynCWbB7Q+n6QPG7iIdM8EIGUyLv56zQRDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XASWUjIWNzTp7vvH6Hr38ESWH1TrjwfrFGC1N/A52v6mwRulCvZGvyGWOQyyGGq4LzZHWmciVz12wG9gI+TC0VdgimAxcIbz0NLMzXNjlM1UMWBi33uXc+BgBM9CWwwHs9F+N8+bKjQSHcezi+gyWaMm0DvHuVvrQMgGGN4RNB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvzRr8/T; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvzRr8/T"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b12270b3so30864465e9.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641647; x=1782246447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baR2tJhTCCpjbOvimxFzjlV0YgowSxYpo4W6Y4kO2+g=;
        b=XvzRr8/THiwh8ObcqyYSCMLygqjIvKd9ENlHy03DJ1NyyBwjg77pN5xTHtD+Ap3Gek
         Leb+wjfV1tTcyRUZEPWDn9QdOlDEvjvmWDkGuSfQiytce3hSYMbFpZqjEKBj48upIj8I
         00zFUiQNgh4ftaFiUKl4bKA4pFZT/ZivpUuRD71M9TiRRZMMZ3EXyC3H59GxHEGFAsyD
         YBpBzNpUmeGpwt+MFw0Fxb5qm0r/zGZvYAxCpzB+asUDNpc2fo/CXbIYg2ySPlQJIUMc
         mojef0Mm9WWMCEYMJ3AWFxp9OdPsK7vwbSeVM72S3xnBNxLzZXnv4dt179YaJB3hSir/
         kuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641647; x=1782246447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=baR2tJhTCCpjbOvimxFzjlV0YgowSxYpo4W6Y4kO2+g=;
        b=ImhBc9CrdUp/X72YZZHi5XdsW/3zz2Pr3yOcTRAU3YCpc4K1gxC0LCM0XCnjTgfOi7
         QERbi2465VpW/QrIAdJJC5s0B2+xPzKBzmiDNQBfT8Y+6oFmcNhqhb4UWm082LmMmsTr
         V2EtSLHwz/aonWK5/2sqir969rOySoT35q2iKZqSb9kzf+DGbdWh7V+PQcKVJljGMSdc
         y5ja8wNF8gc61o5VTeqw9i+00tDgHVj7GQaq8xTjQsD1pvBIznN/cRihSWX/IVmF/EdR
         5rHI7aog7i0fMRe220x+RRajunYCjSCOBCaQE3gLiOz+GXrZouVtoMb3BV7BsgR96Zd1
         FSOw==
X-Gm-Message-State: AOJu0YwBQNG0t0IzE9fhpERcLh66dMFDwELK0fBPUToy4KMJTiiTuKns
	HB+RIVg3wbl0Si23msGu3Ri+NBYrS3jfI+HAVTiU+iwX0TJdl4XBSXfk
X-Gm-Gg: Acq92OE0oNRad6zXVVTKQaFqcrYocAsala7HCq9x/oROE26kidzuNfClLUh9obIHw/e
	lsAo9YpwKl5jeIe1et5Fee93Xm3INJ1TYsfGo9PWDs1oNd3EJZLCwjfv0yg7rzg0m5vr6OcRNGQ
	dT3z58a4MzyIuR4puKWNeWL+8mu7SjW7bPgQnl4eORO6J/AZvwZ/LIm8IeV/hgWm/WnYkUEcCoh
	4Z+CLLYqszjtnCImdz70D/N3qxYMe4qH434BDI/HesDsQ3aknP0gYBDfZ1tRKf1pEm0JsXYdSZV
	7EmiYD4YGEB6ecxAxAtdShkxuIEka03tMwAf5bt59ytJmA5x8JoXLKnarbdoS49/ERcuIQFi/dI
	TJgQsoBf9ku5+H7hnXXwGFzpxs5JgAaWxMxxCANl6qX1WRNHbmID2Yi39QkWKJjBDQOkzPpJ4kc
	yP+B/+ay/iAD+CpveAhf3nmB3q7rhyUYjKSGebSNbCf4VD
X-Received: by 2002:a7b:c3d1:0:b0:490:b92f:ef5b with SMTP id 5b1f17b1804b1-492341088b1mr2343925e9.13.1781641647445;
        Tue, 16 Jun 2026 13:27:27 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:27 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:29 +0300
Subject: [PATCH RFC v4 09/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-9-ca994bd22e9d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11110;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=lbHHuSxqYynCWbB7Q+n6QPG7iIdM8EIGUyLv56zQRDc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGG3cZnUlyNSfTHc6i03TNVKRGuxlVzqM1c0
 Z0guS11NSCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI0rxAAmYmX3RvSjLds5sb3ahEFkJzTNThkZP6
 YwB/Fyo/NA1qs+k8ryr2qqgGK3uifISAIQuPTdXTiqF5lbxGtg4OzfTJjGyQhSgnnH9PgvU0MUK
 AqFWD/1j2ydjjzK2KQtKsfG193a+PDu8mi7Dg+brHozhi7Df4WAURitykgQRhWfBoP77fB2XgGp
 3fyK5BazcrnYn2P1gRdY0fqR2YChWxx2H2so373DOK38K6pr0o3M6t6Ww36px+FsOqBf7MMbp6i
 oVGj6F5uUjG854BLBiBSojFdWIX51JKWeX3wAGldY63/88Cu09W8mKaRuqSK2wD0OZ1WuDO88pt
 fBtiYgoQPJipigIXynLVVIB3vqTyhkfgxmAzBZEovS3aytTGM4WwGR1MJCsxCSNLtboZXkpR/MA
 wgYACIu5wBUZjCiK6WZ56QkXnHNHKWBOg2jctuXSyTUruhYtMayLeCqrQIFl0xVCOyX60E5uz7N
 G64fdok2OtlAtjF9feYs2vAeBMwFO/C5hN8wO6hPvW+xo8c+xtor2sIoBhgWirs5P8qVw2ee+AZ
 9lfck/VAybD2oXkEShpkXo7tAiyKIPOPzTh4oEFOEedJBhI24kB2Hs0clhHXbiDutsgWowLdtWB
 a1s7vTcaA2evYlSTnT/R9qQp+K5SW39HqGmeDVgrZ/Z6AxS7jcxE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

"LSP" is ZTE's term for this part of the SoC, I suspect it stands for
"low speed peripherals". The main UART is here, together with the flash
controller and more surplus proprietary timers.

It also has two more I2C controllers that supposedly connect to a
battery charger, SPI for displays and I2S for analog telephones. The
boards I have don't have any of these components though.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/zte/clk-zx297520v3.c | 192 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index d90aadf18026..26b05f2bf97a 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -581,9 +581,201 @@ static const struct zx_clk_data zx297520v3_matrixclk_data = {
 	.reset_auxdev_name = "zx297520v3_matrixrst"
 };
 
+/* LSP clock entries have a common pattern: Bit 0 for WCLK, Bit 1 for PCLK. Bit 4 (and sometimes
+ * more) for WCLK mux.
+ *
+ * Bit 8 and 9 are reset bits. I don't know the difference between the two, but they both need to be
+ * set to deassert the reset.
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
+	"lsp_osc32k",
+	"lsp_osc26m",
+};
+
+static const char * const uart_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d6",
+};
+
+static const char * const i2s_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_dpll_d4",
+	"lsp_mpll_d6",
+	/* Unknown */
+};
+
+static const char * const tdm_lsp_sel[] = {
+	"lsp_tdm_wclk",
+};
+
+static const char * const spi_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d4",
+	"lsp_mpll_d6",
+	/* Unknown */
+};
+
+static const char * const qspi_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d4",
+	"lsp_mpll_d5",
+	"lsp_mpll_d6",
+	"lsp_mpll_d8",
+	"lsp_mpll_d12",
+	"lsp_osc26m",
+	"lsp_osc26m",
+};
+
+static const struct zx_mux_desc zx297520v3_lsp_muxes[] = {
+	MUX(0,                             "timer_l1_mux",   timer_lsp_sel,    0x04,  4, 1),
+	MUX(0,                             "wdt_l2_mux",     timer_lsp_sel,    0x08,  4, 1),
+	MUX(0,                             "wdt_l3_mux",     timer_lsp_sel,    0x0c,  4, 1),
+	/* PWM: No mux bit can be set */
+	MUX(0,                             "i2s0_mux",       i2s_lsp_sel,      0x14,  4, 2),
+	/* 0x18: Always 0 */
+	MUX(0,                             "i2s1_mux",       i2s_lsp_sel,      0x1c,  4, 2),
+	/* 0x20: Always 0 */
+	MUX(0,                             "qspi_mux",       qspi_lsp_sel,     0x24,  4, 3),
+	MUX(0,                             "uart1_mux",      uart_lsp_sel,     0x28,  4, 1),
+	MUX(0,                             "i2c1_mux",       uart_lsp_sel,     0x2c,  4, 1),
+	MUX(0,                             "spi0_mux",       spi_lsp_sel,      0x30,  4, 2),
+	MUX(0,                             "timer_lb_mux",   timer_lsp_sel,    0x34,  4, 1),
+	MUX(0,                             "timer_lc_mux",   timer_lsp_sel,    0x38,  4, 1),
+	MUX(0,                             "uart2_mux",      uart_lsp_sel,     0x3c,  4, 1),
+	MUX(0,                             "wdt_le_mux",     timer_lsp_sel,    0x40,  4, 1),
+	MUX(0,                             "timer_lf_mux",   timer_lsp_sel,    0x44,  4, 1),
+	MUX(0,                             "spi1_mux",       spi_lsp_sel,      0x48,  4, 2),
+	MUX(0,                             "timer_l11_mux",  timer_lsp_sel,    0x4c,  4, 1),
+	/* TDM: No mux in LSP. Instead, it is in matrix with a separate clk line to LSP */
+};
+
+static const struct zx_div_desc zx297520v3_lsp_dividers[] = {
+	DIV(0,                             "timer_l1_div",   "timer_l1_mux",   0x04, 12, 4),
+	DIV(0,                             "wdt_l2_div",     "wdt_l2_mux",     0x08, 12, 4),
+	DIV(0,                             "wdt_l3_div",     "wdt_l3_mux",     0x0c, 12, 4),
+	/* PWM: No div */
+	DIV(0,                             "i2s0_div",       "i2s0_mux",       0x14, 16, 4),
+	/* 0x18: Always 0 */
+	DIV(0,                             "i2s1_div",       "i2s1_mux",       0x1c, 16, 4),
+	/* 0x20: Always 0 */
+	/* qspi, uart1, i2c1: No div */
+	DIV(0,                             "spi0_div",       "spi0_mux",       0x30, 12, 4),
+	DIV(0,                             "timer_lb_div",   "timer_lb_mux",   0x34, 12, 4),
+	DIV(0,                             "timer_lc_div",   "timer_lc_mux",   0x38, 12, 4),
+	/* uart2: No div */
+	DIV(0,                             "wdt_le_div",     "wdt_le_mux",     0x40, 12, 4),
+	DIV(0,                             "timer_lf_div",   "timer_lf_mux",   0x44, 12, 4),
+	DIV(0,                             "spi1_div",       "spi1_mux",       0x48, 12, 4),
+	DIV(0,                             "timer_l11_div",  "timer_l11_mux",  0x4c, 12, 4),
+	DIV(0,                             "tdm_div",        "lsp_tdm_wclk",   0x50, 16, 4),
+};
+
+static const struct zx_gate_desc zx297520v3_lsp_gates[] = {
+	GATE(ZX297520V3_TIMER_L1_WCLK,     "timer_l1_wclk",  "timer_l1_div",   0x04,  0, 0),
+	GATE(ZX297520V3_TIMER_L1_PCLK,     "timer_l1_pclk",  "lsp_pclk",       0x04,  1, 0),
+	GATE(ZX297520V3_WDT_L2_WCLK,       "wdt_l2_wclk",    "wdt_l2_div",     0x08,  0, 0),
+	GATE(ZX297520V3_WDT_L2_PCLK,       "wdt_l2_pclk",    "lsp_pclk",       0x08,  1, 0),
+	GATE(ZX297520V3_WDT_L3_WCLK,       "wdt_l3_wclk",    "wdt_l3_div",     0x0c,  0, 0),
+	GATE(ZX297520V3_WDT_L3_PCLK,       "wdt_l3_pclk",    "lsp_pclk",       0x0c,  1, 0),
+	/* I don't know the LSP parent. It must be one of the LSP inputs though. */
+	GATE(ZX297520V3_PWM_WCLK,          "pwm_wclk",       "lsp_osc26m",     0x10,  0, 0),
+	GATE(ZX297520V3_PWM_PCLK,          "pwm_pclk",       "lsp_pclk",       0x10,  1, 0),
+	GATE(ZX297520V3_I2S0_WCLK,         "i2s0_wclk",      "i2s0_div",       0x14,  0, 0),
+	GATE(ZX297520V3_I2S0_PCLK,         "i2s0_pclk",      "lsp_pclk",       0x14,  1, 0),
+	/* 0x1c: Always 0 */
+	GATE(ZX297520V3_I2S1_WCLK,         "i2s1_wclk",      "i2s1_div",       0x1c,  0, 0),
+	GATE(ZX297520V3_I2S1_PCLK,         "i2s1_pclk",      "lsp_pclk",       0x1c,  1, 0),
+	/* 0x20: Always 0 */
+	GATE(ZX297520V3_QSPI_WCLK,         "qspi_wclk",      "qspi_mux",       0x24,  0, 0),
+	GATE(ZX297520V3_QSPI_PCLK,         "qspi_pclk",      "lsp_pclk",       0x24,  1, 0),
+	GATE(ZX297520V3_UART1_WCLK,        "uart1_wclk",     "uart1_mux",      0x28,  0, 0),
+	GATE(ZX297520V3_UART1_PCLK,        "uart1_pclk",     "lsp_pclk",       0x28,  1, 0),
+	GATE(ZX297520V3_I2C1_WCLK,         "i2c1_wclk",      "i2c1_mux",       0x2c,  0, 0),
+	GATE(ZX297520V3_I2C1_PCLK,         "i2c1_pclk",      "lsp_pclk",       0x2c,  1, 0),
+	GATE(ZX297520V3_SPI0_WCLK,         "spi0_wclk",      "spi0_div",       0x30,  0, 0),
+	GATE(ZX297520V3_SPI0_PCLK,         "spi0_pclk",      "lsp_pclk",       0x30,  1, 0),
+	GATE(ZX297520V3_TIMER_LB_WCLK,     "timer_lb_wclk",  "timer_lb_div",   0x34,  0, 0),
+	GATE(ZX297520V3_TIMER_LB_PCLK,     "timer_lb_pclk",  "lsp_pclk",       0x34,  1, 0),
+	GATE(ZX297520V3_TIMER_LC_WCLK,     "timer_lc_wclk",  "timer_lc_div",   0x38,  0, 0),
+	GATE(ZX297520V3_TIMER_LC_PCLK,     "timer_lc_pclk",  "lsp_pclk",       0x38,  1, 0),
+	GATE(ZX297520V3_UART2_WCLK,        "uart2_wclk",     "uart2_mux",      0x3c,  0, 0),
+	GATE(ZX297520V3_UART2_PCLK,        "uart2_pclk",     "lsp_pclk",       0x3c,  1, 0),
+	GATE(ZX297520V3_WDT_LE_WCLK,       "wdt_le_wclk",    "wdt_le_div",     0x40,  0, 0),
+	GATE(ZX297520V3_WDT_LE_PCLK,       "wdt_le_pclk",    "lsp_pclk",       0x40,  1, 0),
+	GATE(ZX297520V3_TIMER_LF_WCLK,     "timer_lf_wclk",  "timer_lf_div",   0x44,  0, 0),
+	GATE(ZX297520V3_TIMER_LF_PCLK,     "timer_lf_pclk",  "lsp_pclk",       0x44,  1, 0),
+	GATE(ZX297520V3_SPI1_WCLK,         "spi1_wclk",      "spi1_div",       0x48,  0, 0),
+	GATE(ZX297520V3_SPI1_PCLK,         "spi1_pclk",      "lsp_pclk",       0x48,  1, 0),
+	GATE(ZX297520V3_TIMER_L11_WCLK,    "timer_l11_wclk", "timer_l11_div",  0x4c,  0, 0),
+	GATE(ZX297520V3_TIMER_L11_PCLK,    "timer_l11_pclk", "lsp_pclk",       0x4c,  1, 0),
+	GATE(ZX297520V3_TDM_WCLK,          "tdm_wclk",       "tdm_div",        0x50,  0, 0),
+	GATE(ZX297520V3_TDM_PCLK,          "tdm_pclk",       "lsp_pclk",       0x50,  1, 0),
+};
+
+static const char * const zx297529v3_lsp_inputs[] = {
+	"mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+	"osc26m", "osc32k", "tdm_wclk", "dpll_d4"
+};
+
+static const char * const zx297529v3_lsp_inputs_enable[] = {
+	"pclk"
+};
+
+static const struct zx_clk_data zx297520v3_lspclk_data = {
+	.inputs_enable = zx297529v3_lsp_inputs_enable,
+	.num_inputs_enable = ARRAY_SIZE(zx297529v3_lsp_inputs_enable),
+	.inputs = zx297529v3_lsp_inputs,
+	.num_inputs = ARRAY_SIZE(zx297529v3_lsp_inputs),
+	.muxes = zx297520v3_lsp_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_lsp_muxes),
+	.divs = zx297520v3_lsp_dividers,
+	.num_divs = ARRAY_SIZE(zx297520v3_lsp_dividers),
+	.gates = zx297520v3_lsp_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_lsp_gates),
+	.reset_auxdev_name = "zx297520v3_lsprst"
+};
+
 static const struct of_device_id of_match_zx297520v3[] = {
 	{ .compatible = "zte,zx297520v3-topclk", .data = &zx297520v3_topclk_data },
 	{ .compatible = "zte,zx297520v3-matrixclk", .data = &zx297520v3_matrixclk_data },
+	{ .compatible = "zte,zx297520v3-lspclk", .data = &zx297520v3_lspclk_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_zx297520v3);

-- 
2.53.0

