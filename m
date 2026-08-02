Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3998333D6D5
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702900; cv=none; b=avv9q+rKLughCfW433p+no53arCfCTQDpdGXnAMmPOqo3kfGDEH39lwIIy0EKJyIhIBc/YnmNsa+2zZu78iYibBhCn+2eAqFv+5NPSMUEMDP+ZF5jI5fNfeyXzBEHaBX5xls4YcWyuzL8VGt4Goq8iE9Mhm3833a03lx+bBop2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702900; c=relaxed/simple;
	bh=C5375xxEnTLIuAVbcLXdmJsH/FRVJgD8i9muuM48xpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJV3A8HQsdqRXaMzGPaP3r+ftp0KWQRbINQtHAqLkutAZeP/FL0w3Cru1VfWrMsdzI9AOAfJ1JoR66ZEAqqGFDeTBuVF4RaK18BnIY3Qxyzo73hhEESxz7O1Ke4TZZZnlp1hUQ3FW7OEiv95C8il2YAgi36ZIm3F/ZrZe53WrMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJkjGlLo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJkjGlLo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954aff6088so11639395e9.3
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702896; x=1786307696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10BaBHWhPqW3Sq2fUbg2o1Xh9gXPTQeiQu6yO2cZgXE=;
        b=FJkjGlLoY9eHpmTsHZZBOn0/KEXSalYf7FZccoVEUwrRlcuWne2SmSLU1WyKcujwAu
         4pfkof3ro2uZQ3YyEarpO953fFDVReUL393JFxX1KoYfFA9JOGunXn8RC//VJI/zME3V
         643NHQUifXFXv676cxyzAWhgyk2zmusWpMOiDvkdfgib7F/wtK9Jly1+s+CcPVgfxgPx
         KQgiO4rOHwuf+MHcGBu7ygysdjdFvC7XE2rzXv1q2+FB7/Js1EDx8duUj/d0Swxfgrfc
         XfIs6a2IfqGSPye28oghgwJAwe2udU0lG4VkKdzNunMlraliyMhXiBu4jK6oJ+5A1yei
         eagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702896; x=1786307696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10BaBHWhPqW3Sq2fUbg2o1Xh9gXPTQeiQu6yO2cZgXE=;
        b=Fws+baUoON3gkkVZwp4Gw9BdXvn3P13wEOigt+5uHRQ+eJjdgeG7l/+o+NAtgHyYgU
         2U5eZLN00J/1WYX6rQCr0PVJx4wIzzPBqfVcsSda3IjTqV1eFQCgoSZK7yg7TozLWWZl
         KJWy8CzPgO73a75ol06vAV2H4z4gJDoj9MBh4PduCQhV33IFBtybn6ykOI8BPkOaHOrh
         1XS3fYG48TbgDOs47ekHPq7nYmn4oDB8AskMQSYdVf1B7GJXzx5xUXl0gNblZZTya75T
         eo2D/BYMr5Ao6iBd0rwOgVH4aCNuLFLd/fRjy1ChoOc8vhTAXGST32wAebypMQ5GHe6p
         5+SQ==
X-Gm-Message-State: AOJu0YzPzPB7LLTYREjrN7anoM7sAuOBlyot13ORsPuxfCUfiMKKuLJF
	x9FI8LHAaY6L0ePKopX94sCBl2szeRkI/zUA0wJs3DFLtDhZvA6L1qz1
X-Gm-Gg: AR+sD13J+Shl0ZVjg78uh4jH+smRRmIdNNOP0/kDtrc1idc66H6XNwOF/9khUQBtG0u
	XMYm4YQabDYsZ7SiEBd8tJUnBTJwh/1OxBzMz54EEDrsEaT1xKINbZdZN70YgDIuBSh6boHoXti
	jOpyYeWrq4mSJIT5pCXCp6Iua6PlGYt75C9M/zSAxrZr8SRK9WmwgfnY7vALUeHC8HY2QNjW3BM
	DvvCLgEM2h31gvAs3gVvpArurT7DfdekLtxqwQ19j3rq7iIBRgQO+AE3ZiHFp89g0paQ5c7EPz2
	grHs5s8fgSJYJztO21K20+PY+wPlF5jSkKqRZlwnmQ3x+zcuZhytKBYNFcy/lSRV284lmo5IYN8
	ZRCW42Ka11FP+/SrPjkueaGcImChb3MPteM84VyaU2ciMH7TPbV4CsXkjMPa1OxNIlr2kymyAQB
	Uw+Rtm3jNZhvLgRdx8sjRKCc/WbLrHD2D7rZr6Xj8+AwUT0fB/nhpPlBW8hIcaNOg5/OFapDFD
X-Received: by 2002:a05:600c:871a:b0:498:952:e276 with SMTP id 5b1f17b1804b1-4980c66c991mr191005975e9.8.1785702896139;
        Sun, 02 Aug 2026 13:34:56 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:54 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:42 +0300
Subject: [PATCH v9 10/12] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-10-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14664;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=C5375xxEnTLIuAVbcLXdmJsH/FRVJgD8i9muuM48xpA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6my2h3VGYJ0NHyAl91bZxNL+mhClRUKgEPdI
 8Kz6Okr7NmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIyNw/+OzOo/E9XFWMu3huat+PdyVmaFBbOAWo
 UEFj2cGqWNElharQIfJD2yK+hTVA91ey9qQzRG0IQb3+ci/zgt0MuLrzcVXKuJUCYQdWU2u+otD
 3Iiz7zyyeoiOqyyYz/56jwR7UD+MgorxI5QVvzOgdSHP6U9v+MTPJEyM6LkgGbgkPx52QjK+rYm
 1/B2thFUI0vqcpcuA9QNniU04iWnz9jt7aH9Xmqc89PIRpI8seMqg5C/uPNqt99xs+JHI+H80IQ
 Bx6R8pp15Brwrre7G1fUKDmu4gj4bm00WTHN5QEcjaHe9r/kN5rLhoCqH0FvZwe9g3WxWHJnztl
 ta8u1M7aGP5qJLmu7qQuTt+iwu6PkUzzqGjjJI1hrAKSDX5ghJW1xwhzx86LfdmiBSaIa80e36z
 cugkc9+aI+3Adz0WtLXsNDemIsHBCv4f7b6lM+AX7kl8CnFF+3JbsGy83FLJzUJ1rei7N7HxxMw
 cisyjd28rz0LQlvwpM7bDMkox5qCMg1b6tbLQJESwjMWL8ITeJQeP0s+VCXbhST+DY83iCZYjwc
 KlYd9+jCpavp2WiiAd8GM2tD0RKlsf5d5ZRtncNtDITbFOi8RCx678M+UTRnrEC/Ui2P0c8xrMz
 zqOAYbtDOq/bURuPlQixOEOBz14FWJgODh9PQmaRweF0M0rbwJA8=
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
index 6c4a7a1c3a9b..286eaedffce9 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -1248,6 +1248,287 @@ static const struct zx_clk_data zx297520v3_matrixclk_data = {
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
+static unsigned int zx297520v3_lsp_exports[] = {
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
@@ -1268,6 +1549,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
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

