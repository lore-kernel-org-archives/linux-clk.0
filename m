Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880692;
	b=XjBEzqTtbDYW6BCkbKCfZ/eC8xVV5UDHwdc/lh+fAlhyDeT+PgH9zuoIeXCBNHxC7Vu7
	 gMB7DQQy3fC/xomm9XQqdNV5AeJ7WSboCCMU5AiF2zGVdW3kc8tyUpSdC4/trpaoN18fh
	 u1J96DUrRF3VxJvq5H1sVct5MxWYGQBHJfsQcE8rvbiJma5f/g8aAFEhqfdCXeaeuPFhm
	 pCnlwi3hmZ7bNWTIlbYcUF6V7vOMZiUouXt9mO4Cq7iXVRa2JbatgS1JjuotsJ7KG0W4a
	 /F8BXkxycTqsFLLw02hPWJkPDVjJk8h0nX9UecAmcysE2LZCVna9SAfKTF+HPDwgdcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5NLhlxRi6dozkcm3iIPiD37SbT4OF/l9YGoVRA0KYUw=;
	b=x3axXiIyzjECsv55FJKXo3xO/vr21uAyHZSm3HLI522fphIPBQuXeTecOSrIAT1sZ8xN
	 EB+raqft9eEFJqGd/ePQHIJ9aWW2BgLFtJZsxKnA8mLrDoyyw0dFP44Usx1r1xY88he6K
	 +pLjNmjoSiBCaw54XoJMhmJ71/1WEvppFZ34Rl3Cvk0Wkch9G/8B2Dj2oNUzfD2a0ZM3G
	 bopuwACSYnTlqe7UJrHGtDK3OeHI7sR4h/3Xk8SDVWisLCGaaHi23NpCKsC52rzofwmTf
	 LbnHAr0rG6PvLqMwV/u0tuQl7VYRWMtIbXi8cUZ8hRK4VVaYd58YjTnfvZSu01WEFSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ue8/Ovlw";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881A6082BE8
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 12:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7881A6082BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ue8/Ovlw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so12818745e9.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 04:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880691; x=1794485491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NLhlxRi6dozkcm3iIPiD37SbT4OF/l9YGoVRA0KYUw=;
        b=ue8/Ovlwcg8QoSY8uw2B1yHw9BY04QS4gZAHfilSKXAUV/AOd2AbDlJnMx3Gy3bq36
         bowm3L7z+eFd1I/HvSmK4/IyZnHOzt4tHSK/jbiqq4QjR0cdSKxSiCIl5KwHPKNuHJuW
         pfQNi+LhyvcnloOgxJr+UzRpB+0YAgx6wLSptvJ6kcsuwF5R08vgpADFUtZfDeLlgjRc
         KaSrrpsmx8b7NX3p7ZU2VRUC0dcyyz4UQnSzZ18RnKyjqWVL3KKwNQbSK9V6Cgv+XEov
         2Q9BXMrhGrcGWuFX0oFzXDvFk2ctUFO6jfm1kAgIGlt6toqFgCicw/RrF7joooHGXcdG
         ahBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880691; x=1794485491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NLhlxRi6dozkcm3iIPiD37SbT4OF/l9YGoVRA0KYUw=;
        b=EZ1NHsSZDLtYv1O3rMFXMPaYUg0X3RT3omjSzf5401P5zhwamnmgHhIHUxmwgx5s+s
         Smf+ygsp120JLCt3XdeKDdG6lZ3w967pvb/oOlerA+bRkhZjsrxMvCgyP6Y8sU5OdaOi
         KoabGMNYzoeKQwA/nP0ja4CO5xbjKPmoZtcB01xTHkvv6Es1MckorPV/Yc/NI5GHVF5l
         12PeCumw0sz22cYthb2hra6xpxQGNNNqHTrVpqwec8Xm6hljRJ2+UxRdqrecEGoBdBLR
         P9yZWOKAGTjEi3w/lWe1m7Xj3qiKls7B+Lk2gkM8FeNN1zKn85fyWPG1cRDA5ygOwFf8
         jsEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSv/JEdCQTzC3vlfqRxY3jbl1P/pr5oj1W1zVmZ4K43oMagEzjpRza3EGA4L+KGksbK4vtiB026K0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ITJ9v7eUGfQNOGbOQWuy6u+I3DmNjSdcCLebmBxz9qO6CFKa8
	EbEjfJo9E0DQnacgP/ECzzkjWMJxb/zru3Mdco52ezvvJ3CflPGZbJMq
X-Gm-Gg: AYBFou0eNOep6losVIRaMXcLl8KBipcHhZ25+MIwQqjRBLTv3ucuVRBqEdGNN6+nmDN
	b2F2fZWim1v3mTnhE45gU7cn6/RLKJ2Lr9maDPsV7In7dtITkA0JlnNchUpBMVRscSk1LlQeUVG
	BZzL9L3Sq2i5MIcVXx32U5DBF4FnR90A1oX5BM9uyTzzRC64ZglV1j8GXAe4x9G+Id0Vjvg1WVY
	cbGO5H4+u/NegbFR7MHXdxX1fS/agxTNGBsBZ4sX/tE4T6124EsVAMnljK7nIW03HyeYiZrBjJE
	yGUr40ZNgZZyaVKKRuOLRAjydOYi9uy+H/g/22XgvDz3oo3DRxOFIaLyYYUj0VmOC3YdO4urP59
	9CrylCRx0jr60kQgNYtuoZixMWjVtxFyOsVDWsR15K/zc/pcQ8IAHgwmBFib3ZdMD16ZMO/xzw/
	6aUm+7sdkk9Y398k5vT8zhxY+r6NkIRJay4+N/p82LdMls857UYqreDLrGEZurac4oGndtkHEUp
	rcGWCTZU4qSbBch1He4E6jhkgY8sgbBhOdWliMs62Mu2aLijmDsqv5gH1JZ7y1JI5DQIhQqh6CP
	vdtTaFdpxm0XneQtk7e4cjp8F0WjLWwwXCH+A+77oL1pDNhjiEaaN4naD1HwdTh02JxVXpKFGCi
	F9kbynZFW0CIbdruvFtGpM2jv
X-Received: by 2002:a05:600c:a49:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4ac177539eamr433406685e9.14.1793880690726;
        Thu, 05 Nov 2026 04:11:30 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:30 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v10 5/5] clk: en7523: add support for Airoha AN7583 clock
Date: Thu,  5 Nov 2026 13:10:58 +0100
Message-ID: <20261105121059.11201-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha AN7583 clock and reset.

Airoha AN7583 SoC have the same register address of EN7581 but implement
different bits and additional base clocks. Also reset are different with
the introduction of 2 dedicated MDIO line and drop of some reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 249 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 249 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 979dd9c20a4f..c1cc6fbc3c01 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -13,6 +13,7 @@
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,an7583-reset.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
@@ -170,6 +171,14 @@ static const u32 crypto_base[] = { 540000000, 480000000 };
 static const u32 emmc7581_base[] = { 200000000, 150000000 };
 /* EN751221 */
 static const u32 gsw751221_base[] = { 500000000, 250000000, 400000000, 200000000 };
+/* AN7583 */
+static const u32 gsw7583_base[] = { 540672000, 270336000, 400000000, 200000000 };
+static const u32 emi7583_base[] = { 540672000, 480000000, 400000000, 300000000 };
+static const u32 bus7583_base[] = { 600000000, 540672000, 480000000, 400000000 };
+static const u32 spi7583_base[] = { 400000000, 12500000 };
+static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
+static const u32 crypto7583_base[] = { 540672000, 400000000 };
+static const u32 emmc7583_base[] = { 150000000, 200000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -372,6 +381,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc an7583_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = gsw7583_base,
+		.n_base_values = ARRAY_SIZE(gsw7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_EMI,
+		.name = "emi",
+
+		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = emi7583_base,
+		.n_base_values = ARRAY_SIZE(emi7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_BUS,
+		.name = "bus",
+
+		.base_reg = REG_BUS_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = bus7583_base,
+		.n_base_values = ARRAY_SIZE(bus7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_SLIC,
+		.name = "slic",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 1,
+		.base_values = slic_base,
+		.n_base_values = ARRAY_SIZE(slic_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 24,
+		.div_val0 = 20,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_SPI,
+		.name = "spi",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = spi7583_base,
+		.n_base_values = ARRAY_SIZE(spi7583_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 8,
+		.div_val0 = 40,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_NPU,
+		.name = "npu",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 9,
+		.base_values = npu7583_base,
+		.n_base_values = ARRAY_SIZE(npu7583_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_CRYPTO,
+		.name = "crypto",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = crypto7583_base,
+		.n_base_values = ARRAY_SIZE(crypto7583_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 13,
+		.base_values = emmc7583_base,
+		.n_base_values = ARRAY_SIZE(emmc7583_base),
+	}, {
+		.id = AN7583_CLK_MDIO0,
+		.name = "mdio0",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 15,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = AN7583_CLK_MDIO1,
+		.name = "mdio1",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 19,
+		.div_step = 1,
+		.div_offset = 1,
+	}
+};
+
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
@@ -547,6 +688,64 @@ static const u16 en751221_rst_map[] = {
 	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
 };
 
+static const u16 an7583_rst_map[] = {
+	/* RST_CTRL2 */
+	[AN7583_XPON_PHY_RST]		= 0,
+	[AN7583_GPON_OLT_RST]		= 1,
+	[AN7583_CPU_TIMER2_RST]		= 2,
+	[AN7583_HSUART_RST]		= 3,
+	[AN7583_UART4_RST]		= 4,
+	[AN7583_UART5_RST]		= 5,
+	[AN7583_I2C2_RST]		= 6,
+	[AN7583_XSI_MAC_RST]		= 7,
+	[AN7583_XSI_PHY_RST]		= 8,
+	[AN7583_NPU_RST]		= 9,
+	[AN7583_TRNG_MSTART_RST]	= 12,
+	[AN7583_DUAL_HSI0_RST]		= 13,
+	[AN7583_DUAL_HSI1_RST]		= 14,
+	[AN7583_DUAL_HSI0_MAC_RST]	= 16,
+	[AN7583_DUAL_HSI1_MAC_RST]	= 17,
+	[AN7583_XPON_XFI_RST]		= 18,
+	[AN7583_WDMA_RST]		= 19,
+	[AN7583_WOE0_RST]		= 20,
+	[AN7583_HSDMA_RST]		= 22,
+	[AN7583_TDMA_RST]		= 24,
+	[AN7583_EMMC_RST]		= 25,
+	[AN7583_SOE_RST]		= 26,
+	[AN7583_XFP_MAC_RST]		= 28,
+	[AN7583_MDIO0_RST]		= 30,
+	[AN7583_MDIO1_RST]		= 31,
+	/* RST_CTRL1 */
+	[AN7583_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[AN7583_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
+	[AN7583_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
+	[AN7583_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
+	[AN7583_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[AN7583_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[AN7583_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[AN7583_UART_RST]		= RST_NR_PER_BANK + 12,
+	[AN7583_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[AN7583_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[AN7583_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
+	[AN7583_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[AN7583_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[AN7583_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[AN7583_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[AN7583_FE_RST]			= RST_NR_PER_BANK + 21,
+	[AN7583_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[AN7583_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[AN7583_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[AN7583_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[AN7583_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[AN7583_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
+	[AN7583_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[AN7583_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_PCIC */
+	[AN7583_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+};
+
 static int en7581_reset_register(struct device *dev, void __iomem *base,
 				 const u16 *rst_map, int nr_resets,
 				 const u16 *rst_reg_ofs);
@@ -1152,6 +1351,43 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	return en7581_serdes_phy_register(&pdev->dev);
 }
 
+static int an7583_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	struct en_clk_priv *priv = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+	void __iomem *base;
+	u32 val;
+	int ret;
+
+	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->base = base;
+
+	en7581_register_clocks(dev, clk_data, map, base);
+
+	val = readl(base + REG_RST_CTRL1);
+	val |= REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+	val &= ~REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+
+	ret = en7581_reset_register(dev, base, an7583_rst_map,
+				    ARRAY_SIZE(an7583_rst_map),
+				    en7581_rst_ofs);
+	if (ret)
+		return ret;
+
+	return en7581_serdes_phy_register(dev);
+}
+
 static enum en_hir get_hw_id(void __iomem *np_base)
 {
 	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
@@ -1305,6 +1541,18 @@ static const struct en_clk_soc_data en7581_data = {
 	.hw_init = en7581_clk_hw_init,
 };
 
+static const struct en_clk_soc_data an7583_data = {
+	.base_clks = an7583_base_clks,
+	/* We increment num_clocks by 1 to account for additional PCIe clock */
+	.num_clocks = ARRAY_SIZE(an7583_base_clks) + 1,
+	.pcie_ops = {
+		.is_enabled = en7581_pci_is_enabled,
+		.enable = en7581_pci_enable,
+		.disable = en7581_pci_disable,
+	},
+	.hw_init = an7583_clk_hw_init,
+};
+
 static const struct en_clk_soc_data en751221_data = {
 	.num_clocks = EN751221_MAX_CLKS,
 	.pcie_ops = {
@@ -1318,6 +1566,7 @@ static const struct en_clk_soc_data en751221_data = {
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-scu", .data = &an7583_data },
 	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
 	{ /* sentinel */ }
 };
-- 
2.55.0

