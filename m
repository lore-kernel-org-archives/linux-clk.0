Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB73A9D84
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024152; cv=none; b=PL8dAPV70BAB9kQOcJ+KXy0M94MDG1qBLFne7lnxmvHHEh5hdJYpEyHy4VmFWZ9ril9eBBu67RIwIJyL1jGH4vOwfpOqtSgzGQ9pzExxbByz7FMnV7JKjW+Hc+xQtkVWUpGV2JtwY8jdB5XRcn9oGYWDeavXnzzCAqQSa6BAatg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024152; c=relaxed/simple;
	bh=JkGwiUV5NaoyxNSNan/mWG4p6DpQpyQdA5BCE6eR9Wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDzaLb9Y+LYF3UhjqahxvnPoLP42EgIUFh8DBtpFNn+tLD17CZCc7Q6LqKP21Bw1WtAiq38GF/4g23lgDWAXIQLLa1EQfvPNTgzCE3mYQvz5aiViSQ6ObAiSHo2/KR25Wxh8zFPBCwmrvABb7PDyKDNu7518iQuamMaSJRtK3sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+EQsXXe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+EQsXXe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493be1b9564so16598195e9.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024148; x=1783628948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6ybdfg998W749iZ3nKzhSvA2go+HprTmnO8VV4q8mk=;
        b=L+EQsXXeSWTo7bIqeq8U/h78EVRUM3o19zHQ5k2QD/W/Tth8jJ9DjGoW262OdTozRg
         QQcz15S5mj3qSjhlQeeT1Q6hkAkHh4WMSetVkSznsy0DokID8qabx7Xzy5ckhSi3Y8G8
         kisQN9iWQ5haizoCYJqj00ubWkcAbuiyl4ywt7AtlMhZ5+GjlifOhCyBz5GZ7BL1kHIC
         Puo6QuQWzF8CrRs7ncRMxMO36ww5h/IttF0AtI0uOIb1jo/1n4DLWVVIlz6BgUQ+85VE
         bkTss9JttDJPbkcN5kLJxIZE41biMrv+78/hxhqNDfKn9cw+JvFk0ZKD/TDJgY9tgLlN
         3wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024148; x=1783628948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6ybdfg998W749iZ3nKzhSvA2go+HprTmnO8VV4q8mk=;
        b=UNbGvX4anGA/fjwgiYaMsDX4t/IE3GWk9Ngn/E0sA7LxBwqrFPoLMJ3iXZCJY1iCNJ
         dzhtAmMbM2+NhEzK0sj2XzRjfQuJ9DRyiwgizA6BfBOj/9ZvH9AKi5UdE7C0FD4HvwEl
         D/mjV0fZnn5NcEddVYfDsJuaEpvPN7aMvtWuQ7+qVnNOzGLpGl4XYUnUAI4Ft70z1qWw
         U8nGsGgDkOXDJ9gCfnqlnsYCz14Fhzdupvo02LVYXq9Z3HKDQvTYATrAV/PF92ofv3No
         +1t9LnVULEO/e+jUBC/B1+bw+NTveeqlrmfYJOf+5zXRhGGZjlwspFTMf1/k4GchFEbR
         0uBg==
X-Gm-Message-State: AOJu0Yzrt14zy3ufmaAKt+bsR1vNRKM1gr3eWZAiQtG6Qy81m70Oons2
	/B44q9K3FR3voHEFDG7OIZ9HrISzpcxjuQlQFqVzFdYasi7yAeMkrZ03
X-Gm-Gg: AfdE7cm3RWiOyPtr43ayvzjrl/MlRh7iJxMtXHqYE9rf9iYKxVsKIy4xLcAP07/zTuv
	sCEOQRQnXThWrssmjImb7yEesYpAWOZDHSjt49a96i1Iz+U8x0XHu3toEk4gbURR2uWQcBunw4X
	6jk4m3FleOFQhirQIk2USAwbon6xtGEkwHZyFZewbHsRho8Wjs22gpX8hrIgSZCNTLNW/Oo7AhV
	TcmfCVucTs+dI3SM8kQM7LMzvR6VaOSWTQWhDuq6BFTzEtkkoBSaWElTgvoxhsXrPdRZMOXZiol
	oegXLGLJpkseIGotq2RffLQQ6LF0MWeTSCFc4qblTO1d3XYu5izIR7urNL1GGBTWe0e0CBF4ehW
	rxJCb5m7bU2Lgth9LNVZUOCy9BpsFYBq7BnzpK0RI0+kmW/vmj5hV9mrIIP2F9b6Pc5KAVDLQFu
	y/qaltjkvQgG+URmMaxnhnO1T+EBrJH/JSlA==
X-Received: by 2002:a05:600c:6990:b0:493:bb45:d52c with SMTP id 5b1f17b1804b1-493c3cf55b8mr81379525e9.25.1783024147450;
        Thu, 02 Jul 2026 13:29:07 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:29:05 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:05 +0300
Subject: [PATCH v6 10/12] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-10-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11234;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=JkGwiUV5NaoyxNSNan/mWG4p6DpQpyQdA5BCE6eR9Wk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnqmfG6FTBACGBItrX6WV3LFfnj2Inj3AD6l
 rrTS/ETuxCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIXTg//SUzNKpQqpv6+nlZUto855eW0qjC5fbj
 2fmghI66OtIqrVfmdbEU+TncNU+LV2vKEJyzGnzR9TT4HQC+iy60mKLTNU8MrVf+SMqtryIRwmB
 Jo2EMfJ7esmSmYjL5JKNA6sRw1iRHfwBoRmibxPYoGbGYkEId05jvPRlJx2cT6yyWVwYizrUbWz
 0qVtn+QJSjnVHZb/xTQAqBa0dHF59aSo8MeR2WbdYElgKs6y3a3fLSyIC3VHpf8q868R0BmrQ/r
 3E24UYjuL9H8jOvWwB4EmtZ3864/vt4yoO7sF1HB0kEE0BO9lXtkdi0ZRsX9c3cZjN5KuiIF9JS
 r/KXUxkIbabqeS8chEhuQ4ztexvQFfay7sfB9QmNzQuRen7+GXF4vItQYbhk6K/76OATi5e3Y1/
 CvKJCciUzlsj1OuVarRw0X9NAWEQgOZbutAuuMBbaD3F0N6DFNCWSDO2phBPDvnxtHWzFlwW0gA
 VULchbx0459xxGDpsvwP51geoLS6BNFubgZQxjD3AP71XtfXZr/iGEOXzREyZgdtJhsSqe8v8DA
 i+/na4dWdJgP5dT9VBMZ3akco3rAqBaR6zwLN3xPzOFSwfPoq7Ve9DLnbBcYE8jf63crBduH1WB
 BCYClaZdntIxRlJ2wYzL46WAK37BARozs4XIGhtPoXJjqKTyoS58=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

"LSP" is ZTE's term for this part of the SoC, I suspect it stands for
"low speed peripherals". The main UART is here, together with the flash
controller and more surplus proprietary timers.

It also has one more I2C controller that supposedly connects to a
battery charger, SPI for displays and I2S for analog telephones. The
boards I have don't have any of these components though.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 6:
use MFD for LSP too

Version 5:
Removed unused tdm_lsp_sel. Fix zx297529 vs zx297520 typo.
Adjusted .compatible to zte,zx297520v3-lspcrm
---
 drivers/clk/zte/clk-zx297520v3.c | 189 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 501f333b84fe..a8fbc2429433 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -592,6 +592,191 @@ static const struct zx_clk_data zx297520v3_matrixclk_data = {
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
+static const char * const zx297520v3_lsp_inputs[] = {
+	"mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+	"osc26m", "osc32k", "tdm_wclk", "dpll_d4"
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
@@ -612,6 +797,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
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

