Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A71432E7A
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176778; cv=none; b=Au3h0gXi/OOOJyMJq3q89h0NNrbcW32JCQ+UxrwNkVULLmhxDpMc74oPxmqSxg5u/LMr+8eKaj29+vCI0QAG6dl/JC2QvmHK+FH8t/GTifp7/UCyR50RxTMuMZ8nP7s9JtCdAiE2Pijim8q2leU94DQ8rZeVztzSCRhTrK73OVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176778; c=relaxed/simple;
	bh=O9HrO7cDr+jcQBWDdEZ4KtXVjq2VHzsZthjQBPybWeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BR+ZnM9hxVH+85iVyvZfCqJ3s0iqk/cCETa/f8W60CBNfP367m9sRK2sIoQHiMJhmNMsOfhJ1rgcl916RboDB6O2ULAWeS0H+NWSKL22iUABu2PTwO08vs6XlFAIG3dh4IgVCLF4AQISbukQLRMtuULmMB8gOwJVDGShU1GFujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKSrh+nR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKSrh+nR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1949518f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176775; x=1785781575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hxS8kLIkPz0beLSp8IzvLVKt7VyPmWENLbkKE4lu1U=;
        b=GKSrh+nRvY7LwvDiLCpFm8t68CQ89HA1LECj9wCSGQU0TQpvkAuvgtYfuCnI/0jtiz
         WNcFsYiJ1EBM2ozYelIfhVB/NpPCOI5ED6Xm2aYGwFBgj1/YO0Ldh+UMMHKPE3PhYPv7
         lJ904weE65vizXiXy/Ycmk4si0r/f3foBcnZWVZ7NeIQSlHz7YGqsUk9iliauMN66ytj
         uwbvwiWCNbN/SXlloV/KD2M2LzbZIj4QqPxD3OdXVk1PTFFQNVtqIXYsLA3YgL6OK0Dl
         AYiRJ3xAAI1gggYNUODYZUhRWYMhts6K7PExBTrPbzQs7NQnvY/rqfv5ye8Tl4yIMLZP
         AHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176775; x=1785781575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hxS8kLIkPz0beLSp8IzvLVKt7VyPmWENLbkKE4lu1U=;
        b=V6Sz4J2+ID3lmukCvpyMt0v4o9daBJy1Mjh6lzQRdHyF/X/BK3r8MHf3DyfXbTiqPH
         /LiWK7bIhlzzMwT9QMeUw6Gisge4LDr+Yiv+BQDpylAfpNVFfy1ihoniz8RSyBzXtZ1z
         mwW5BgVY40H1NiYrx8tdv0pJErIMp1fWptSIOk/XIBNxaEKL5Gsj8Ml1YNZdOJo2LC2A
         lhd4kp5dZFfkfkfpn23KP8fhnGB5kpogKVuUGJyqA6y5IY64YtosZ2LwpkfRXmHnCbKU
         nqlsPdB4DR8lHXZfBjL30ip/WndEtlMVt5mHu1aY3E3Ni1O/HjiOgszv9Gm8VP9hZKV5
         YknQ==
X-Gm-Message-State: AOJu0Yw6DbeWpe4scNJ+zTYE66iSsMZh0AmjHrapmaYJi/8ZfoQQSyMC
	HnU3X8nt1PA0Qt7Gcxh+db2GOFgfwdcbyikxWakzXTPcEj57y8eBa89y
X-Gm-Gg: AR+sD101a2plUh0GX0+4UFTw4d6eWnqpFwtB5SULm/Nv7Ebp7H5mX0sn6I7dAarNGcu
	o9U6WGjIra+dT1LWyDpHfTHQ/hLQpQn02xH5u9ihxpjH4sPLKrvRTkcpgiAKt3Y5iAnWbXbh+di
	Iy1ANosVH2E6h7RnsiOBQ44PqFD45qzi85+7iPEYTbfXsFsBhSCTNzZ27m1e5FVR1fE8EYpLwZq
	Aoh46HWr92ZNRf25EE7s/kJ1Y0WoQEgEAU3Wzxr1J3PTOFEz0abcl9vNNDWYWfSTOZ3QYiO5097
	1nzndTOCJ4N76uEX1tG4c1gtDf0aDzK1gww543FPytB1sakX97I+tzqJOZT8LoS3RNTtdN6Ke+u
	tsVE5+/TdPYm1Qy37QdIHm6cMWuoB4NqXvil1qjDAXGOoAWk3rVWek5yeWrzoIXp+Lxd2fzPPqH
	OQexaOSZF7nkSQ39NKP0PswbU=
X-Received: by 2002:a5d:5f43:0:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-47fafa5e8fdmr334955f8f.19.1785176774820;
        Mon, 27 Jul 2026 11:26:14 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:26:14 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:25 +0300
Subject: [PATCH v8 10/12] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-10-7a107b00f1dd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11015;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=O9HrO7cDr+jcQBWDdEZ4KtXVjq2VHzsZthjQBPybWeU=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J70sbVNrOgDTbSvXtJGMFPe1HRBymgZaT7U
 gpxLASDrLGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiexsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLuCQ//YTKj2K2OMrS+pN35e5/kPT+oL8dTuv6
 EkNbSzmcJYhXIY/TcACF0c6jI2UH0lhziMSKtS7qsXBi4GqEBPwuQ2Ck8chXXkB90/NKHiugfEF
 lID3845vKYuGdXV5naIuNbrqPyYn/x5xH0ImETDACwQySSa+YA4p/Q6xJ4NNDdbo6WHVSgR+tLX
 2UFWHN3aiZr32L9G9mpdCsbP+oll9rSLt0BCrtf/xpKtQ/wk8qM1CeSV5VJURLgxF2r1h2mv6QK
 sal4JYAMu2RJEL3N+WOPwyDBAOdmcUvCdD7ULN9rDkRv7kcoTQmweXLHuEjfkj/bTd5ahTYAtLH
 jSvv11eaVbBNiIJz3xYwTGdJr5qm7uhmAENRVYHAcCVFLThcGdEQLNj/uVcWsLx90uhcZ09A1Qb
 CgGNXhrascTt9swgINC/hyp8f5fqh9IYMDCbkb4oYlO2tVEGvbXKsLE+D87KRJIdH+SvnKJrt+q
 Nj13eiuGfuRaexe5lYIlpRo8Lalqf/juY5BurdNA64wTGl4fIZkQwgydp2O0R2RZmgGxbAxS/VJ
 Z5/PgsQ006tSgr7lGRTG7BYEfHCKmpOIiXQMctIOaoMEf9YM3ruXX42BPQjtFPZjnWmITAOvpRw
 anFxMeZMysALRUYG9V6QL8as4VtHDWueKFfgUjqC7zSGDrAiFFKw=
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
 drivers/clk/zte/clk-zx297520v3.c | 189 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 9299449097b4..2fe7ac389325 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -876,6 +876,191 @@ static const struct zx_clk_data zx297520v3_matrixclk_data = {
 	.num_gates = ARRAY_SIZE(zx297520v3_matrix_gates),
 };
 
+/* LSP clock entries have a common pattern: Bit 0 for pclk, Bit 1 for wclk. Bit 4 (and sometimes
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
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-l1-mux",   timer_lsp_sel,    0x04,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "wdt-l2-mux",     timer_lsp_sel,    0x08,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "wdt-l3-mux",     timer_lsp_sel,    0x0c,  4, 1),
+	/* PWM: No mux bit can be set */
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "i2s0-mux",       i2s_lsp_sel,      0x14,  4, 2),
+	/* 0x18: Always 0 */
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "i2s1-mux",       i2s_lsp_sel,      0x1c,  4, 2),
+	/* 0x20: Always 0 */
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "qspi-mux",       qspi_lsp_sel,     0x24,  4, 3),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "uart1-mux",      uart_lsp_sel,     0x28,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "i2c1-mux",       uart_lsp_sel,     0x2c,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "spi0-mux",       spi_lsp_sel,      0x30,  4, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-lb-mux",   timer_lsp_sel,    0x34,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-lc-mux",   timer_lsp_sel,    0x38,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "uart2-mux",      uart_lsp_sel,     0x3c,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "wdt-le-mux",     timer_lsp_sel,    0x40,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-lf-mux",   timer_lsp_sel,    0x44,  4, 1),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "spi1-mux",       spi_lsp_sel,      0x48,  4, 2),
+	MUX(ZX297520V3_CLK_NO_EXPORT,      "timer-l11-mux",  timer_lsp_sel,    0x4c,  4, 1),
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
+	GATE(ZX297520V3_TIMER_L1_PCLK,     "timer-l1-pclk",  "lsp-pclk",       0x04,  0, 0),
+	GATE(ZX297520V3_TIMER_L1_WCLK,     "timer-l1-wclk",  "timer-l1-div",   0x04,  1, 0),
+	GATE(ZX297520V3_WDT_L2_PCLK,       "wdt-l2-pclk",    "lsp-pclk",       0x08,  0, 0),
+	GATE(ZX297520V3_WDT_L2_WCLK,       "wdt-l2-wclk",    "wdt-l2-div",     0x08,  1, 0),
+	GATE(ZX297520V3_WDT_L3_PCLK,       "wdt-l3-pclk",    "lsp-pclk",       0x0c,  0, 0),
+	GATE(ZX297520V3_WDT_L3_WCLK,       "wdt-l3-wclk",    "wdt-l3-div",     0x0c,  1, 0),
+	/* I don't know the LSP parent. It must be one of the LSP inputs though. */
+	GATE(ZX297520V3_PWM_PCLK,          "pwm-pclk",       "lsp-pclk",       0x10,  0, 0),
+	GATE(ZX297520V3_PWM_WCLK,          "pwm-wclk",       "lsp-osc26m",     0x10,  1, 0),
+	GATE(ZX297520V3_I2S0_PCLK,         "i2s0-pclk",      "lsp-pclk",       0x14,  0, 0),
+	GATE(ZX297520V3_I2S0_WCLK,         "i2s0-wclk",      "i2s0-div",       0x14,  1, 0),
+	/* 0x18: Always 0 */
+	GATE(ZX297520V3_I2S1_PCLK,         "i2s1-pclk",      "lsp-pclk",       0x1c,  0, 0),
+	GATE(ZX297520V3_I2S1_WCLK,         "i2s1-wclk",      "i2s1-div",       0x1c,  1, 0),
+	/* 0x20: Always 0 */
+	GATE(ZX297520V3_QSPI_PCLK,         "qspi-pclk",      "lsp-pclk",       0x24,  0, 0),
+	GATE(ZX297520V3_QSPI_WCLK,         "qspi-wclk",      "qspi-mux",       0x24,  1, 0),
+	GATE(ZX297520V3_UART1_PCLK,        "uart1-pclk",     "lsp-pclk",       0x28,  0, 0),
+	GATE(ZX297520V3_UART1_WCLK,        "uart1-wclk",     "uart1-mux",      0x28,  1, 0),
+	GATE(ZX297520V3_I2C1_PCLK,         "i2c1-pclk",      "lsp-pclk",       0x2c,  0, 0),
+	GATE(ZX297520V3_I2C1_WCLK,         "i2c1-wclk",      "i2c1-mux",       0x2c,  1, 0),
+	GATE(ZX297520V3_SPI0_PCLK,         "spi0-pclk",      "lsp-pclk",       0x30,  0, 0),
+	GATE(ZX297520V3_SPI0_WCLK,         "spi0-wclk",      "spi0-div",       0x30,  1, 0),
+	GATE(ZX297520V3_TIMER_LB_PCLK,     "timer-lb-pclk",  "lsp-pclk",       0x34,  0, 0),
+	GATE(ZX297520V3_TIMER_LB_WCLK,     "timer-lb-wclk",  "timer-lb-div",   0x34,  1, 0),
+	GATE(ZX297520V3_TIMER_LC_PCLK,     "timer-lc-pclk",  "lsp-pclk",       0x38,  0, 0),
+	GATE(ZX297520V3_TIMER_LC_WCLK,     "timer-lc-wclk",  "timer-lc-div",   0x38,  1, 0),
+	GATE(ZX297520V3_UART2_PCLK,        "uart2-pclk",     "lsp-pclk",       0x3c,  0, 0),
+	GATE(ZX297520V3_UART2_WCLK,        "uart2-wclk",     "uart2-mux",      0x3c,  1, 0),
+	GATE(ZX297520V3_WDT_LE_PCLK,       "wdt-le-pclk",    "lsp-pclk",       0x40,  0, 0),
+	GATE(ZX297520V3_WDT_LE_WCLK,       "wdt-le-wclk",    "wdt-le-div",     0x40,  1, 0),
+	GATE(ZX297520V3_TIMER_LF_PCLK,     "timer-lf-pclk",  "lsp-pclk",       0x44,  0, 0),
+	GATE(ZX297520V3_TIMER_LF_WCLK,     "timer-lf-wclk",  "timer-lf-div",   0x44,  1, 0),
+	GATE(ZX297520V3_SPI1_PCLK,         "spi1-pclk",      "lsp-pclk",       0x48,  0, 0),
+	GATE(ZX297520V3_SPI1_WCLK,         "spi1-wclk",      "spi1-div",       0x48,  1, 0),
+	GATE(ZX297520V3_TIMER_L11_PCLK,    "timer-l11-pclk", "lsp-pclk",       0x4c,  0, 0),
+	GATE(ZX297520V3_TIMER_L11_WCLK,    "timer-l11-wclk", "timer-l11-div",  0x4c,  1, 0),
+	GATE(ZX297520V3_TDM_PCLK,          "tdm-pclk",       "lsp-pclk",       0x50,  0, 0),
+	GATE(ZX297520V3_TDM_WCLK,          "tdm-wclk",       "tdm-div",        0x50,  1, 0),
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
@@ -896,6 +1081,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
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

