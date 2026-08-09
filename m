Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196637F72E
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310983; cv=none; b=MiUslrEJj4nUMMLzWTRH2XKwpPoT3WDoEz1GtIHVkDUT4VBM/06ma0a4z0egJhJSEtE0TGwkG3Sdl/vcZEuV7AJzam8hutgR/D/lG3fkBOKz0hlIrl+mssgEXo7mZiYsAP7e9z1Dyya160pK0SVb3dCiU034iXJfgxHWNPVm9i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310983; c=relaxed/simple;
	bh=mH7BV0ZsMk58T+i94Aurle61bqtDiW/6yvZ3psMeJDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ys3qAabgOTBnMN9xt+fQy+0R4FdL1soHQg+g/l4fiJQH6Yl3MNWFMYJj/tO/SHd/9KSVn2r/uyGtU0Ka1wt2tUOJ/3EhHmJQ7994Cwnl5EVIFHYCMHvLgbFusvM6nbfervUsslSJAtHQxgYgrYi1Nea78rJmA4yCCWGC12vgsns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9uLatIt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9uLatIt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49954b88fffso12525325e9.0
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310980; x=1786915780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOagqlU0nzjkKGYacpgPmccBMGhMNKdwmwuZVHUM47U=;
        b=Q9uLatItOgtKw9O0lxWONwvI/k5vzkTptE0bqpLY5ef/oPIWKezyJulrUh6GDwELai
         oy6dzkkuT3rcnpKjrWCngauBwE3BDPqh7z2Vx9Z7Bm3fDt+CS/VQweSEAKHQgD+s94aV
         pPQekG1mtaA4ynCKPS79tMBpNdbuk44d+tXjRvVqHVpRcCY4KJu9bwVkE0YRNL2/Otky
         xyBo43kUDyDHzD/uIf/Ly94qcPDBuNW3zSQo5V11JZAl/8ibTWPUAPqRwiXJVTvv2M8F
         R01N+UjgH1ZmgV5s8UGWbLK//+vxaw7OlC0YKtupjTfOW1YF/eooWxIdaTfl7IZpNDfy
         v9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310980; x=1786915780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOagqlU0nzjkKGYacpgPmccBMGhMNKdwmwuZVHUM47U=;
        b=AvSKpDAjzW3PWE8aOFQMeO3TiQrRMFMimuwl9NpUGAZp12fCtYraUtF7nvUuRtSdqi
         cSbVuqUn0vx2sDpESNQXifBdNGX/RFHaITAQ67brDlh6iKXbNFhpfyaycQkJZlU1TlmB
         LeSVC06ZRAvCLoWWOZUA+d1JXqYtLbl4okTcKB41ctGpL/Q4z4YctSCevrJhHBzefRYD
         rwxsal7wSTpzCwOZdspUx1z4qG9oIfelusjgb1Cql5mKID23q/cOSyhO6Ek53mAqKm1/
         TeB3M7u/sb51zkVDCclG635uRDuZ54XIx77QG55ETUnOdMt4YOc9gXuxz7Ps4hQqIufO
         ycdg==
X-Gm-Message-State: AOJu0YyZEBIgw7D4ew/PQv+yHnO0k1GOzoroJZJXj2xCDHWmpr3fWL9R
	1HdHsVT4DV72hPszv2ieV9LlGhUTX9oVC/QmsCeTBE8dQFF5dtWK2MPf
X-Gm-Gg: AR+sD10H5C1mJHC6M3CYYsOZIjTTwVcNKmVHbEBK5cTQ06t/Q88CJXaD0jLJyOwgAwt
	3aPBSZ+bPnR/H+qy/IQkZQUUeekDK7g1iVbn5/8L08TJFZn7/XN7VZeMgOQwTANQslp/NrkdwE6
	mxBd6U3uuZaiZfjKwCLzSuhL/mQk0hNN0dDAFFWwNvjJuCo3Uqo8ZgHnLPyHtbfzsLcYXJPmlZq
	yZK1p//+gUj6mdT3WZVHs/DvsfAP4OUcyGVwni29C8eWZ7Dllh+SNVj9ogU5YQjx7N+yLbrTmZX
	DyLYWJyJMcAQlFYza0wcrTNjaeqj2SRHn13yvKys5wzaBFGXPwMV33f9cbGX1mD9azmA/fALTIc
	QaqwZBV8KQ90yRzYHX6i6LM1231RjpCnQ2u+OV5hR069ZeUPyXj181RDCPqqmSQIG1GIvXmvde1
	e25ZHrvHZyK/A2aSXrSWw11Bvrm8KYxRf1ZuX/vgZZgfV10qfF8gn6+fbZD4TSR1tCyCCeprU=
X-Received: by 2002:a05:600c:1f83:b0:499:4ada:981d with SMTP id 5b1f17b1804b1-4996194b092mr204850875e9.7.1786310979557;
        Sun, 09 Aug 2026 14:29:39 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:39 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:29 +0300
Subject: [PATCH v10 10/12] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-10-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14670;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=mH7BV0ZsMk58T+i94Aurle61bqtDiW/6yvZ3psMeJDg=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEPpvYL0y0VfsKqig7HAG0xZkoy3/i4euanF
 rTekelwSRWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKuzg//VSJrVEZO6C6p8H00xncOFwEgGIjQ6q4
 dL+0f8Bch9kf5kqcYprdfMjuMtBR8xazgqekp1UDw+KPEt9QLF23cVd78GeNM0CPMTPSMpQ1EQe
 g5G00oObPlH6dZm9bcA86gcAbSHDrKySNmZnw92EmM1eZ7mW7N8fgfFacrbLQTHtqOCkgNjuewu
 zwbnryQE7elxj0vbNbQbx7ZbSN5uBVSf5lIE9srjLM1S2JueHVsV6JfpmAbQW78BtVJs8oyOIBA
 SFA/FvkkdmZtWea9nRc2SsvT9sIknyNa48qi5rKg1IFXFYPIwm2i+7+NX6TYO9AgwHfHCxbHaiA
 4aV8RCVPoVFNE/lOT9JWFK7whmvOxc/g+cKCLRvXheoVkXOrCknRZylucA8cb4YDjB5hqWHj1oR
 v6HIXdtINb0/D687A3/MetgmfOAz8wLZQP+GhMNshzHsSpZPDdfGjm6HIFa01MMJ4ILzNrcp8+N
 EENRxR7s/Y0iUNaFEte2QvEWy+46wXsmGl1X1GWGjtiJy356HikVLOsPYaau6NCFX4wPbb1pEa9
 9elZH0W4CEdZjXVMduCaiiXwHCoe/9mNW5oR6+qF3bjPLD9B+d5/P5p0XvDhS/WCQ4HY+nGMzAG
 vcO5fU8xSq0VJkaMMBEHnbEiVhh3rgpCTl5/q540nNoji+1s6C78=
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

Version 9:
Link internal parents by an (internal) clock ID rather than names.

One intentional clock tree change: The PWM device's parent is the 104
MHz mpll-d6 input. With some manual experimentation I managed to make
the WiFi led blink with PWM, so I could confirm which matrixcrm bit
gates off its parent.

Update the comments to say that the device at lspcrm+0x4000 is indeed a
Pulse Width Modulator.

@Sashiko: If you find any other clock tree changes compared to version
8, they are unintentional and likely bugs.

Version 8:
Double-checked pclk and wclk. They were the wrong way around in previous
submissions. Pclk is bit 0, wclk is bit 1.

Version 7:
Underscore in clock names to dashes

Version 6:
use MFD for LSP too

Version 5:
Removed unused tdm_lsp_sel. Fix zx297529 vs zx297520 typo.
Adjusted .compatible to zte,zx297520v3-lspcrm
---
 drivers/clk/zte/clk-zx297520v3.c | 285 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 3f59c8356910..e7411bafb3c6 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -1276,6 +1276,287 @@ static const struct zx_clk_data zx297520v3_matrixclk_data = {
 	.num_exports = ARRAY_SIZE(zx297520v3_matrix_exports),
 };
 
+/*
+ * LSP clock entries have a common pattern: Bit 0 for pclk, Bit 1 for wclk. Bit 4 (and sometimes
+ * more) for wclk mux.
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
+ * CRM Reg	function	div	dev offset(lsp + xxxx)	ID
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
+ * The device at offset 0x4000 (clk reg 0x10) is a PWM device. The ID matches that of i2c, it has a
+ * larger register set. ZTE's kernel does not operate it at all. The old upstream pwm-zx.c driver
+ * provided enough instructions to blink the Wifi led and isolate the parent.
+ */
+
+enum lsp_clock_ids {
+	ZX_CLK_TIMER_L1_MUX,
+	ZX_CLK_WDT_L2_MUX,
+	ZX_CLK_WDT_L3_MUX,
+	ZX_CLK_I2S0_MUX,
+	ZX_CLK_I2S1_MUX,
+	ZX_CLK_QSPI_MUX,
+	ZX_CLK_UART1_MUX,
+	ZX_CLK_I2C1_MUX,
+	ZX_CLK_SPI0_MUX,
+	ZX_CLK_TIMER_LB_MUX,
+	ZX_CLK_TIMER_LC_MUX,
+	ZX_CLK_UART2_MUX,
+	ZX_CLK_WDT_LE_MUX,
+	ZX_CLK_TIMER_LF_MUX,
+	ZX_CLK_SPI1_MUX,
+	ZX_CLK_TIMER_L11_MUX,
+
+	ZX_CLK_TIMER_L1_DIV,
+	ZX_CLK_WDT_L2_DIV,
+	ZX_CLK_WDT_L3_DIV,
+	ZX_CLK_I2S0_DIV,
+	ZX_CLK_I2S1_DIV,
+	ZX_CLK_SPI0_DIV,
+	ZX_CLK_TIMER_LB_DIV,
+	ZX_CLK_TIMER_LC_DIV,
+	ZX_CLK_WDT_LE_DIV,
+	ZX_CLK_TIMER_LF_DIV,
+	ZX_CLK_SPI1_DIV,
+	ZX_CLK_TIMER_L11_DIV,
+	ZX_CLK_TDM_DIV,
+
+	ZX_CLK_TIMER_L1_PCLK,
+	ZX_CLK_TIMER_L1_WCLK,
+	ZX_CLK_WDT_L2_PCLK,
+	ZX_CLK_WDT_L2_WCLK,
+	ZX_CLK_WDT_L3_PCLK,
+	ZX_CLK_WDT_L3_WCLK,
+	ZX_CLK_PWM_PCLK,
+	ZX_CLK_PWM_WCLK,
+	ZX_CLK_I2S0_PCLK,
+	ZX_CLK_I2S0_WCLK,
+	ZX_CLK_I2S1_PCLK,
+	ZX_CLK_I2S1_WCLK,
+	ZX_CLK_QSPI_PCLK,
+	ZX_CLK_QSPI_WCLK,
+	ZX_CLK_UART1_PCLK,
+	ZX_CLK_UART1_WCLK,
+	ZX_CLK_I2C1_PCLK,
+	ZX_CLK_I2C1_WCLK,
+	ZX_CLK_SPI0_PCLK,
+	ZX_CLK_SPI0_WCLK,
+	ZX_CLK_TIMER_LB_PCLK,
+	ZX_CLK_TIMER_LB_WCLK,
+	ZX_CLK_TIMER_LC_PCLK,
+	ZX_CLK_TIMER_LC_WCLK,
+	ZX_CLK_UART2_PCLK,
+	ZX_CLK_UART2_WCLK,
+	ZX_CLK_WDT_LE_PCLK,
+	ZX_CLK_WDT_LE_WCLK,
+	ZX_CLK_TIMER_LF_PCLK,
+	ZX_CLK_TIMER_LF_WCLK,
+	ZX_CLK_SPI1_PCLK,
+	ZX_CLK_SPI1_WCLK,
+	ZX_CLK_TIMER_L11_PCLK,
+	ZX_CLK_TIMER_L11_WCLK,
+	ZX_CLK_TDM_PCLK,
+	ZX_CLK_TDM_WCLK,
+};
+
+static const struct zx_parent_desc timer_lsp_sel[] = {
+	PARENT_FW("osc32k"),
+	PARENT_FW("osc26m"),
+};
+
+static const struct zx_parent_desc uart_lsp_sel[] = {
+	PARENT_FW("osc26m"),
+	PARENT_FW("mpll-d6"),
+};
+
+static const struct zx_parent_desc i2s_lsp_sel[] = {
+	PARENT_FW("osc26m"),
+	PARENT_FW("dpll-d4"),
+	PARENT_FW("mpll-d6"),
+	/* Unknown */
+};
+
+static const struct zx_parent_desc spi_lsp_sel[] = {
+	PARENT_FW("osc26m"),
+	PARENT_FW("mpll-d4"),
+	PARENT_FW("mpll-d6"),
+	/* Unknown */
+};
+
+static const struct zx_parent_desc qspi_lsp_sel[] = {
+	PARENT_FW("osc26m"),
+	PARENT_FW("mpll-d4"),
+	PARENT_FW("mpll-d5"),
+	PARENT_FW("mpll-d6"),
+	PARENT_FW("mpll-d8"),
+	PARENT_FW("mpll-d12"),
+	PARENT_FW("osc26m"),
+	PARENT_FW("osc26m"),
+};
+
+static const struct zx_clock zx297520v3_lsp_clocks[] = {
+	[ZX_CLK_TIMER_L1_MUX]     = MUX("timer-l1-mux",   timer_lsp_sel,    0x04,  4, 1),
+	[ZX_CLK_WDT_L2_MUX]       = MUX("wdt-l2-mux",     timer_lsp_sel,    0x08,  4, 1),
+	[ZX_CLK_WDT_L3_MUX]       = MUX("wdt-l3-mux",     timer_lsp_sel,    0x0c,  4, 1),
+	/* PWM: No mux bit can be set */
+	[ZX_CLK_I2S0_MUX]         = MUX("i2s0-mux",       i2s_lsp_sel,      0x14,  4, 2),
+	/* 0x18: Always 0 */
+	[ZX_CLK_I2S1_MUX]         = MUX("i2s1-mux",       i2s_lsp_sel,      0x1c,  4, 2),
+	/* 0x20: Always 0 */
+	[ZX_CLK_QSPI_MUX]         = MUX("qspi-mux",       qspi_lsp_sel,     0x24,  4, 3),
+	[ZX_CLK_UART1_MUX]        = MUX("uart1-mux",      uart_lsp_sel,     0x28,  4, 1),
+	[ZX_CLK_I2C1_MUX]         = MUX("i2c1-mux",       uart_lsp_sel,     0x2c,  4, 1),
+	[ZX_CLK_SPI0_MUX]         = MUX("spi0-mux",       spi_lsp_sel,      0x30,  4, 2),
+	[ZX_CLK_TIMER_LB_MUX]     = MUX("timer-lb-mux",   timer_lsp_sel,    0x34,  4, 1),
+	[ZX_CLK_TIMER_LC_MUX]     = MUX("timer-lc-mux",   timer_lsp_sel,    0x38,  4, 1),
+	[ZX_CLK_UART2_MUX]        = MUX("uart2-mux",      uart_lsp_sel,     0x3c,  4, 1),
+	[ZX_CLK_WDT_LE_MUX]       = MUX("wdt-le-mux",     timer_lsp_sel,    0x40,  4, 1),
+	[ZX_CLK_TIMER_LF_MUX]     = MUX("timer-lf-mux",   timer_lsp_sel,    0x44,  4, 1),
+	[ZX_CLK_SPI1_MUX]         = MUX("spi1-mux",       spi_lsp_sel,      0x48,  4, 2),
+	[ZX_CLK_TIMER_L11_MUX]    = MUX("timer-l11-mux",  timer_lsp_sel,    0x4c,  4, 1),
+	/* TDM: No mux in LSP. Instead, it is in matrix with a separate clk line to LSP */
+
+	[ZX_CLK_TIMER_L1_DIV]     = DIV("timer-l1-div", PARENT_ID(ZX_CLK_TIMER_L1_MUX),
+					0x04, 12, 4),
+	[ZX_CLK_WDT_L2_DIV]       = DIV("wdt-l2-div", PARENT_ID(ZX_CLK_WDT_L2_MUX), 0x08, 12, 4),
+	[ZX_CLK_WDT_L3_DIV]       = DIV("wdt-l3-div", PARENT_ID(ZX_CLK_WDT_L3_MUX), 0x0c, 12, 4),
+	/* PWM: No div */
+	[ZX_CLK_I2S0_DIV]         = DIV("i2s0-div", PARENT_ID(ZX_CLK_I2S0_MUX), 0x14, 16, 4),
+	/* 0x18: Always 0 */
+	[ZX_CLK_I2S1_DIV]         = DIV("i2s1-div", PARENT_ID(ZX_CLK_I2S1_MUX), 0x1c, 16, 4),
+	/* 0x20: Always 0 */
+	/* qspi, uart1, i2c1: No div */
+	[ZX_CLK_SPI0_DIV]         = DIV("spi0-div", PARENT_ID(ZX_CLK_SPI0_MUX), 0x30, 12, 4),
+	[ZX_CLK_TIMER_LB_DIV]     = DIV("timer-lb-div", PARENT_ID(ZX_CLK_TIMER_LB_MUX),
+					0x34, 12, 4),
+	[ZX_CLK_TIMER_LC_DIV]     = DIV("timer-lc-div", PARENT_ID(ZX_CLK_TIMER_LC_MUX),
+					0x38, 12, 4),
+	/* uart2: No div */
+	[ZX_CLK_WDT_LE_DIV]       = DIV("wdt-le-div", PARENT_ID(ZX_CLK_WDT_LE_MUX), 0x40, 12, 4),
+	[ZX_CLK_TIMER_LF_DIV]     = DIV("timer-lf-div", PARENT_ID(ZX_CLK_TIMER_LF_MUX),
+					0x44, 12, 4),
+	[ZX_CLK_SPI1_DIV]         = DIV("spi1-div", PARENT_ID(ZX_CLK_SPI1_MUX), 0x48, 12, 4),
+	[ZX_CLK_TIMER_L11_DIV]    = DIV("timer-l11-div", PARENT_ID(ZX_CLK_TIMER_L11_MUX),
+					0x4c, 12, 4),
+	[ZX_CLK_TDM_DIV]        = DIV("tdm-div", PARENT_FW("tdm-wclk"), 0x50, 16, 4),
+
+	[ZX_CLK_TIMER_L1_PCLK]  = GATE("timer-l1-pclk", PARENT_FW("pclk"), 0x04, 0, 0),
+	[ZX_CLK_TIMER_L1_WCLK]  = GATE("timer-l1-wclk", PARENT_ID(ZX_CLK_TIMER_L1_DIV), 0x04, 1, 0),
+	[ZX_CLK_WDT_L2_PCLK]    = GATE("wdt-l2-pclk", PARENT_FW("pclk"), 0x08, 0, 0),
+	[ZX_CLK_WDT_L2_WCLK]    = GATE("wdt-l2-wclk", PARENT_ID(ZX_CLK_WDT_L2_DIV), 0x08, 1, 0),
+	[ZX_CLK_WDT_L3_PCLK]    = GATE("wdt-l3-pclk", PARENT_FW("pclk"), 0x0c, 0, 0),
+	[ZX_CLK_WDT_L3_WCLK]    = GATE("wdt-l3-wclk", PARENT_ID(ZX_CLK_WDT_L3_DIV), 0x0c, 1, 0),
+	[ZX_CLK_PWM_PCLK]       = GATE("pwm-pclk", PARENT_FW("pclk"), 0x10, 0, 0),
+	[ZX_CLK_PWM_WCLK]       = GATE("pwm-wclk", PARENT_FW("mpll-d6"), 0x10, 1, 0),
+	[ZX_CLK_I2S0_PCLK]      = GATE("i2s0-pclk", PARENT_FW("pclk"), 0x14, 0, 0),
+	[ZX_CLK_I2S0_WCLK]      = GATE("i2s0-wclk", PARENT_ID(ZX_CLK_I2S0_DIV), 0x14, 1, 0),
+	/* 0x18: Always 0 */
+	[ZX_CLK_I2S1_PCLK]      = GATE("i2s1-pclk", PARENT_FW("pclk"), 0x1c, 0, 0),
+	[ZX_CLK_I2S1_WCLK]      = GATE("i2s1-wclk", PARENT_ID(ZX_CLK_I2S1_DIV), 0x1c, 1, 0),
+	/* 0x20: Always 0 */
+	[ZX_CLK_QSPI_PCLK]      = GATE("qspi-pclk", PARENT_FW("pclk"), 0x24, 0, 0),
+	[ZX_CLK_QSPI_WCLK]      = GATE("qspi-wclk", PARENT_ID(ZX_CLK_QSPI_MUX), 0x24, 1, 0),
+	[ZX_CLK_UART1_PCLK]     = GATE("uart1-pclk", PARENT_FW("pclk"), 0x28, 0, 0),
+	[ZX_CLK_UART1_WCLK]     = GATE("uart1-wclk", PARENT_ID(ZX_CLK_UART1_MUX), 0x28, 1, 0),
+	[ZX_CLK_I2C1_PCLK]      = GATE("i2c1-pclk", PARENT_FW("pclk"), 0x2c, 0, 0),
+	[ZX_CLK_I2C1_WCLK]      = GATE("i2c1-wclk", PARENT_ID(ZX_CLK_I2C1_MUX), 0x2c, 1, 0),
+	[ZX_CLK_SPI0_PCLK]      = GATE("spi0-pclk", PARENT_FW("pclk"), 0x30, 0, 0),
+	[ZX_CLK_SPI0_WCLK]      = GATE("spi0-wclk", PARENT_ID(ZX_CLK_SPI0_DIV), 0x30, 1, 0),
+	[ZX_CLK_TIMER_LB_PCLK]  = GATE("timer-lb-pclk", PARENT_FW("pclk"), 0x34, 0, 0),
+	[ZX_CLK_TIMER_LB_WCLK]  = GATE("timer-lb-wclk", PARENT_ID(ZX_CLK_TIMER_LB_DIV), 0x34, 1, 0),
+	[ZX_CLK_TIMER_LC_PCLK]  = GATE("timer-lc-pclk", PARENT_FW("pclk"), 0x38, 0, 0),
+	[ZX_CLK_TIMER_LC_WCLK]  = GATE("timer-lc-wclk", PARENT_ID(ZX_CLK_TIMER_LC_DIV), 0x38, 1, 0),
+	[ZX_CLK_UART2_PCLK]     = GATE("uart2-pclk", PARENT_FW("pclk"), 0x3c, 0, 0),
+	[ZX_CLK_UART2_WCLK]     = GATE("uart2-wclk", PARENT_ID(ZX_CLK_UART2_MUX), 0x3c, 1, 0),
+	[ZX_CLK_WDT_LE_PCLK]    = GATE("wdt-le-pclk", PARENT_FW("pclk"), 0x40, 0, 0),
+	[ZX_CLK_WDT_LE_WCLK]    = GATE("wdt-le-wclk", PARENT_ID(ZX_CLK_WDT_LE_DIV), 0x40, 1, 0),
+	[ZX_CLK_TIMER_LF_PCLK]  = GATE("timer-lf-pclk", PARENT_FW("pclk"), 0x44, 0, 0),
+	[ZX_CLK_TIMER_LF_WCLK]  = GATE("timer-lf-wclk", PARENT_ID(ZX_CLK_TIMER_LF_DIV), 0x44, 1, 0),
+	[ZX_CLK_SPI1_PCLK]      = GATE("spi1-pclk", PARENT_FW("pclk"), 0x48, 0, 0),
+	[ZX_CLK_SPI1_WCLK]      = GATE("spi1-wclk", PARENT_ID(ZX_CLK_SPI1_DIV), 0x48, 1, 0),
+	[ZX_CLK_TIMER_L11_PCLK] = GATE("timer-l11-pclk", PARENT_FW("pclk"), 0x4c, 0, 0),
+	[ZX_CLK_TIMER_L11_WCLK] = GATE("timer-l11-wclk", PARENT_ID(ZX_CLK_TIMER_L11_DIV),
+				       0x4c, 1, 0),
+	[ZX_CLK_TDM_PCLK]       = GATE("tdm-pclk", PARENT_FW("pclk"), 0x50, 0, 0),
+	[ZX_CLK_TDM_WCLK]       = GATE("tdm-wclk", PARENT_ID(ZX_CLK_TDM_DIV), 0x50, 1, 0),
+};
+
+static const unsigned int zx297520v3_lsp_exports[] = {
+	[ZX297520V3_TIMER_L1_WCLK] =	ZX_CLK_TIMER_L1_WCLK,
+	[ZX297520V3_TIMER_L1_PCLK] =	ZX_CLK_TIMER_L1_PCLK,
+	[ZX297520V3_WDT_L2_WCLK] =	ZX_CLK_WDT_L2_WCLK,
+	[ZX297520V3_WDT_L2_PCLK] =	ZX_CLK_WDT_L2_PCLK,
+	[ZX297520V3_WDT_L3_WCLK] =	ZX_CLK_WDT_L3_WCLK,
+	[ZX297520V3_WDT_L3_PCLK] =	ZX_CLK_WDT_L3_PCLK,
+	[ZX297520V3_PWM_WCLK] =		ZX_CLK_PWM_WCLK,
+	[ZX297520V3_PWM_PCLK] =		ZX_CLK_PWM_PCLK,
+	[ZX297520V3_I2S0_WCLK] =	ZX_CLK_I2S0_WCLK,
+	[ZX297520V3_I2S0_PCLK] =	ZX_CLK_I2S0_PCLK,
+	[ZX297520V3_I2S1_WCLK] =	ZX_CLK_I2S1_WCLK,
+	[ZX297520V3_I2S1_PCLK] =	ZX_CLK_I2S1_PCLK,
+	[ZX297520V3_QSPI_WCLK] =	ZX_CLK_QSPI_WCLK,
+	[ZX297520V3_QSPI_PCLK] =	ZX_CLK_QSPI_PCLK,
+	[ZX297520V3_UART1_WCLK] =	ZX_CLK_UART1_WCLK,
+	[ZX297520V3_UART1_PCLK] =	ZX_CLK_UART1_PCLK,
+	[ZX297520V3_I2C1_WCLK] =	ZX_CLK_I2C1_WCLK,
+	[ZX297520V3_I2C1_PCLK] =	ZX_CLK_I2C1_PCLK,
+	[ZX297520V3_SPI0_WCLK] =	ZX_CLK_SPI0_WCLK,
+	[ZX297520V3_SPI0_PCLK] =	ZX_CLK_SPI0_PCLK,
+	[ZX297520V3_TIMER_LB_WCLK] =	ZX_CLK_TIMER_LB_WCLK,
+	[ZX297520V3_TIMER_LB_PCLK] =	ZX_CLK_TIMER_LB_PCLK,
+	[ZX297520V3_TIMER_LC_WCLK] =	ZX_CLK_TIMER_LC_WCLK,
+	[ZX297520V3_TIMER_LC_PCLK] =	ZX_CLK_TIMER_LC_PCLK,
+	[ZX297520V3_UART2_WCLK] =	ZX_CLK_UART2_WCLK,
+	[ZX297520V3_UART2_PCLK] =	ZX_CLK_UART2_PCLK,
+	[ZX297520V3_WDT_LE_WCLK] =	ZX_CLK_WDT_LE_WCLK,
+	[ZX297520V3_WDT_LE_PCLK] =	ZX_CLK_WDT_LE_PCLK,
+	[ZX297520V3_TIMER_LF_WCLK] =	ZX_CLK_TIMER_LF_WCLK,
+	[ZX297520V3_TIMER_LF_PCLK] =	ZX_CLK_TIMER_LF_PCLK,
+	[ZX297520V3_SPI1_WCLK] =	ZX_CLK_SPI1_WCLK,
+	[ZX297520V3_SPI1_PCLK] =	ZX_CLK_SPI1_PCLK,
+	[ZX297520V3_TIMER_L11_WCLK] =	ZX_CLK_TIMER_L11_WCLK,
+	[ZX297520V3_TIMER_L11_PCLK] =	ZX_CLK_TIMER_L11_PCLK,
+	[ZX297520V3_TDM_WCLK] =		ZX_CLK_TDM_WCLK,
+	[ZX297520V3_TDM_PCLK] =		ZX_CLK_TDM_PCLK,
+};
+
+static const struct zx_clk_data zx297520v3_lspclk_data = {
+	.clocks = zx297520v3_lsp_clocks,
+	.num_clocks = ARRAY_SIZE(zx297520v3_lsp_clocks),
+	.exports = zx297520v3_lsp_exports,
+	.num_exports = ARRAY_SIZE(zx297520v3_lsp_exports),
+};
+
 static int clk_zx297520v3_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -1296,6 +1577,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
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

