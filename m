Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298367;
	b=5hCUvKqSiNxHnAj/jJgcyqT71nB3Pfpj5ivWLIrROb7spXx4DVHq9imv9lgqN4FM4p0b
	 w43NRDu5VUO4F/xg+aJvB8g8D10Lgqy1hm+QZfoLNjvStoAKBDdJRYfriZDP9HFLMWUEw
	 jyu6OQSraej8tdO8jbo8UVOptSAi6KslmkBjmQ4RBxz+0cVlGLl4TfgvmuZwTTpU0HbqX
	 J1181CRVhZ8BFt3V4xGRpA3TwMo5xGbDTUP7TKqXEL7jVg0v2PeBHB5XUJffsynquvx3i
	 d556tRKtHnjuqwlmxWLa0hzc1XTQHSRp/V/4YgLXsHX6e3IJcsIvwYbbC/yll5e8cXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dxEPcpS4//u6aXEyyE8MDvORUviH+hOJ9PQncscSovQ=;
	b=i+rZ2UUy/a5aTc0k5mGbj7GYL0cDDvhxTOsbgB/UhyYoz6LJEuS+suj2A2WyqHRHQ1Jk
	 jiIMpAKLUxz6ZkE6LEJHgwM97f5vRwVJhkTcdZxIlPtQy6+29lf4uOzUmVioAQVxr3FD+
	 EXH4fXVfTEbrhRDEx/4Qsm/eJOiVGJk0n4UPrW7nDFxtICclr8DInLXHcpxBSmfSakaPh
	 IDCrVkgJMpvjvUuhn9bmqYbV4W/BqaaLt1QMAJyBXKVzpwgtAasC21ZtwE5kviYDTHSO/
	 3SO9rGKRp8IG2/trE/wdJU/9nyYloCS/3b/1FRzFis8BWhsNJnkBW720qA28+Z9Rq+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zYfR4vF;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E901606A32C
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E901606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zYfR4vF
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so19953745e9.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795298365; x=1795903165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxEPcpS4//u6aXEyyE8MDvORUviH+hOJ9PQncscSovQ=;
        b=0zYfR4vFd0mJy9JRbKQMH+9P3Hfi6SiR/8fztH+uIh6m8ycdO6e1L0t39hWOYOoUXM
         ufQ5t1B7773A2zG5FYG8KhEpn+2u77WH2Dahc0g7GlkvzNCcr7pP99XGiyEUFNajnkJ1
         QEwpQnnv5iKnZAkzLWKeXbL+pGFJoyjlCARMeczCWHBJjy0GhXuhEAHrLx6nW/0S4FP5
         G0ERCgVBjg69GtyBY8hm6S8/8oQ9Cz9IrX5TBqfVbjo8HXqFvD+ujNWsBCGyZWyN9P0r
         ttN305NfKFADGXvN4ozDYPYu3f0b9YwWfLy4C7xr0owIgJ8nf6oqlt6QIGrCLmjyfQ6s
         XuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795298365; x=1795903165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxEPcpS4//u6aXEyyE8MDvORUviH+hOJ9PQncscSovQ=;
        b=D1MUMXhrG58qtO495GkBj2vgWmGdJ/kL2+zZA1tfhmfHZzdcgVq7i31Cv8vcrsd9gR
         uobdDH1D4lfenCmJwfCge78/zsu3GT3vh3xfUc7aYmh+GI1UQ2ROtTuHPf6nH7kj7jef
         euvmZeDKiWmGzEDxSfPKzWf2bccXUXagqmL69/QsuFiR5hKA1z0QWZdC6AVQ7FF0LxDg
         suLjSurQ4e/FKvW2PBFzASZPT6K3+ALR+AT8N4vx1q9bObpcmEZiKNn97RuZeeDZ8AYw
         GFfiXYgQmN/WdYu88RTjEzewgTXfUcPeCXhfKtMjHJMnK7M/LbXP6McHt0GJGwQFKgX3
         Sp9Q==
X-Forwarded-Encrypted: i=1; AL+hErEIyvUWXELPVbFpiaORiQKekgX9NyWI4FHbmrM7K3QdS0dQ0I1dPFFTI6TWPWaUZHQIca1O3L/N1CI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0w6MEXVVV0sEHKGfKbU9yj04tJBvnugKP4PkPIaezh9G1zLcq
	BMg26t146/8PQNaoRdAGoSU6TGonno4zlhkjUm65vgpE8JAQ4BfPq8gZ
X-Gm-Gg: AZFdTZc1BPlcYH++CW62xrqdTJ9CZq/8Bzx3fUU1s6CEcqHIvP5DZE3ZXr34qOpvAU0
	qZWaGO3V1nLmelficfm/ByZX1M/2cODVGjHxcpSx8vh88pE6E6O8ofATMzJ1j9VtAXOazhd6O6B
	GutfYdfYMVwVgxEbnO9ovAr8A++RHy8tIBL0N0+6oaiDsfFRLTtqkliyDoxag4JhgIGcIEAaQLP
	XA+p1cfKplt7bqKsd8guK4mSp7mm7uzbe/6hK/i0Q0lWrLqYFokR0ylGppD3C3yd4VVp5h2YHd6
	OHVJFpLBJq5tOVdLs1pbRfoqufL/9m4qQi+GFk3YtI9Bgy6yG/m0NoDbXOSrxK7Y0fT6XUbT5Yy
	QwoJHMKkYTV5QRnP9CJ/OhoIBFEQdE8Sx8fOSc9/Y1f4zFgv4qx9KQJOFPy1MlTeRa9M/GjvvsZ
	m5O9TzXFYPrsewuC9t+YBSb9iARWRiDYANKZRrmJp8JNADBVImoZqEo1Vdd/Uwl+Zv0zugLbX7n
	JLGifDShisGIrdyKeOwdEUq52XsT7RqKGJceugJzYBFMJB6krKPdVsksiY8Q1iWDDEIAYQugcM9
	hlzMIGZU4D7pDKntkcnsNIW07CcbDIvKJtMcbT/h/UPOP0z9RlvH6SVTI5OoU+Y0wT53IDr7hzA
	C2xHGpGKKXJ0Ep1NVuPo+P0P03nRU5PhKtdcR5l66dj8UCFeDPk0=
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr145620685e9.13.1795298364806;
        Sat, 21 Nov 2026 13:59:24 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm253651735e9.7.2026.11.21.13.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:59:24 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 2/2] clk: en7523: add support for .set_rate for en7581
Date: Sat, 21 Nov 2026 22:59:16 +0100
Message-ID: <20261121215918.183705-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121215918.183705-1-ansuelsmth@gmail.com>
References: <20261121215918.183705-1-ansuelsmth@gmail.com>
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

Add support for EN7523 driver to configure rate for Airoha EN7581 SoC.
The SoC expose both base clock selector and clock divisor hence it's
possible to change the rate.

This will be especially needed for new SoC AN7583 that require changes
for the MDIO and the eMMC.

The clock were assumed correctly configured by the bootloader but this
goes against the rule of "kernel should not depend on external
configuration".

To support the use of standard clock divider API, clock_div_table are added
where needed (BUS, SPI and SLIC) in additionl to the previous info to
derive and simulate the clock from the divisor registers.

Recalc rate for Airoha EN7581 is updated to use the divider_recalc_rate API
for consistency with .set_rate and .determine_rate.

en7523_get_div() is updated to use the div table to drop redundant values.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 341 +++++++++++++++++++++++++++++++++++----
 1 file changed, 307 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1bc11a01e61a..901c3b075e85 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -116,9 +116,7 @@ struct en_clk_desc {
 	u16 div_reg;
 	u8 div_bits;
 	u8 div_shift;
-	u16 div_val0;
-	u8 div_step;
-	u8 div_offset;
+	const struct clk_div_table *div_table;
 };
 
 struct en_clk_gate {
@@ -161,7 +159,88 @@ struct en_clk_soc_data {
 static const u32 gsw_base[] = { 400000000, 500000000 };
 static const u32 emi_base[] = { 333000000, 400000000 };
 static const u32 bus_base[] = { 500000000, 540000000 };
+/* From documentation divisor 1 is n/a */
+static const struct clk_div_table bus_div[] = {
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 3 },
+	{ .val = 3, .div = 4 },
+	{ .val = 4, .div = 5 },
+	{ .val = 5, .div = 6 },
+	{ .val = 6, .div = 7 },
+	{ .val = 7, .div = 8 },
+	{ /* sentinel */ }
+};
 static const u32 slic_base[] = { 100000000, 3125000 };
+static const struct clk_div_table slic_div[] = {
+	{ .val = 0, .div = 20 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 6 },
+	{ .val = 4, .div = 8 },
+	{ .val = 5, .div = 10 },
+	{ .val = 6, .div = 12 },
+	{ .val = 7, .div = 14 },
+	{ .val = 8, .div = 16 },
+	{ .val = 9, .div = 18 },
+	{ .val = 10, .div = 20 },
+	{ .val = 11, .div = 22 },
+	{ .val = 12, .div = 24 },
+	{ .val = 13, .div = 26 },
+	{ .val = 14, .div = 28 },
+	{ .val = 15, .div = 30 },
+	{ .val = 16, .div = 32 },
+	{ .val = 17, .div = 34 },
+	{ .val = 18, .div = 36 },
+	{ .val = 19, .div = 38 },
+	{ .val = 20, .div = 40 },
+	{ .val = 21, .div = 42 },
+	{ .val = 22, .div = 44 },
+	{ .val = 23, .div = 46 },
+	{ .val = 24, .div = 48 },
+	{ .val = 25, .div = 50 },
+	{ .val = 26, .div = 52 },
+	{ .val = 27, .div = 54 },
+	{ .val = 28, .div = 56 },
+	{ .val = 29, .div = 58 },
+	{ .val = 30, .div = 60 },
+	{ .val = 31, .div = 62 },
+	{ /* sentinel */ }
+};
+static const struct clk_div_table spi_div[] = {
+	{ .val = 0, .div = 40 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 6 },
+	{ .val = 4, .div = 8 },
+	{ .val = 5, .div = 10 },
+	{ .val = 6, .div = 12 },
+	{ .val = 7, .div = 14 },
+	{ .val = 8, .div = 16 },
+	{ .val = 9, .div = 18 },
+	{ .val = 10, .div = 20 },
+	{ .val = 11, .div = 22 },
+	{ .val = 12, .div = 24 },
+	{ .val = 13, .div = 26 },
+	{ .val = 14, .div = 28 },
+	{ .val = 15, .div = 30 },
+	{ .val = 16, .div = 32 },
+	{ .val = 17, .div = 34 },
+	{ .val = 18, .div = 36 },
+	{ .val = 19, .div = 38 },
+	{ .val = 20, .div = 40 },
+	{ .val = 21, .div = 42 },
+	{ .val = 22, .div = 44 },
+	{ .val = 23, .div = 46 },
+	{ .val = 24, .div = 48 },
+	{ .val = 25, .div = 50 },
+	{ .val = 26, .div = 52 },
+	{ .val = 27, .div = 54 },
+	{ .val = 28, .div = 56 },
+	{ .val = 29, .div = 58 },
+	{ .val = 30, .div = 60 },
+	{ .val = 31, .div = 62 },
+	{ /* sentinel */ }
+};
 static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
 /* EN7581 */
 static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 };
@@ -185,8 +264,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_EMI,
 		.name = "emi",
@@ -199,8 +276,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_BUS,
 		.name = "bus",
@@ -213,8 +288,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
+		.div_table = bus_div,
 	}, {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
@@ -228,8 +302,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_reg = REG_SPI_CLK_DIV_SEL,
 		.div_bits = 5,
 		.div_shift = 24,
-		.div_val0 = 20,
-		.div_step = 2,
+		.div_table = slic_div,
 	}, {
 		.id = EN7523_CLK_SPI,
 		.name = "spi",
@@ -240,8 +313,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 
 		.div_bits = 5,
 		.div_shift = 8,
-		.div_val0 = 40,
-		.div_step = 2,
+		.div_table = spi_div,
 	}, {
 		.id = EN7523_CLK_NPU,
 		.name = "npu",
@@ -254,8 +326,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_CRYPTO,
 		.name = "crypto",
@@ -281,8 +351,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_EMI,
 		.name = "emi",
@@ -295,8 +363,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_BUS,
 		.name = "bus",
@@ -309,8 +375,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
+		.div_table = bus_div,
 	}, {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
@@ -324,8 +389,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.div_reg = REG_SPI_CLK_DIV_SEL,
 		.div_bits = 5,
 		.div_shift = 24,
-		.div_val0 = 20,
-		.div_step = 2,
+		.div_table = slic_div,
 	}, {
 		.id = EN7523_CLK_SPI,
 		.name = "spi",
@@ -336,8 +400,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 
 		.div_bits = 5,
 		.div_shift = 8,
-		.div_val0 = 40,
-		.div_step = 2,
+		.div_table = spi_div,
 	}, {
 		.id = EN7523_CLK_NPU,
 		.name = "npu",
@@ -350,8 +413,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
 
 		.div_bits = 3,
 		.div_shift = 0,
-		.div_step = 1,
-		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_CRYPTO,
 		.name = "crypto",
@@ -568,16 +629,20 @@ static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 
 static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 {
-	if (!desc->div_bits)
-		return 1;
+	const struct clk_div_table *clkt;
 
 	val >>= desc->div_shift;
 	val &= (1 << desc->div_bits) - 1;
 
-	if (!val && desc->div_val0)
-		return desc->div_val0;
+	if (desc->div_table) {
+		for (clkt = desc->div_table; clkt->div; clkt++)
+			if (clkt->val == val)
+				return clkt->div;
 
-	return (val + desc->div_offset) * desc->div_step;
+		return 0;
+	}
+
+	return val + 1;
 }
 
 static int en7523_pci_is_enabled(struct clk_hw *hw)
@@ -710,10 +775,18 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		const struct en_clk_desc *desc = &en7523_base_clks[i];
 		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		u32 val = readl(base + desc->base_reg);
+		u32 div;
 
 		rate = en7523_get_base_rate(desc, val);
+
 		val = readl(base + reg);
-		rate /= en7523_get_div(desc, val);
+		if (desc->div_bits) {
+			div = en7523_get_div(desc, val);
+			if (!div)
+				continue;
+
+			rate /= div;
+		}
 
 		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
@@ -776,11 +849,211 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	return rate / en7523_get_div(desc, val);
+	if (desc->div_bits) {
+		val >>= desc->div_shift;
+		val &= (1 << desc->div_bits) - 1;
+
+		rate = divider_recalc_rate(hw, rate, val, desc->div_table,
+					   0, desc->div_bits);
+	}
+
+	return rate;
+}
+
+/*
+ * Simulate rate with every divisor supported
+ * 1. Search the divisor for the requested rate
+ * 2. Simulate the final rate with the new divisor
+ */
+static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
+					     unsigned long rate,
+					     unsigned long parent_rate,
+					     const struct en_clk_desc *desc,
+					     int *div_val)
+{
+	*div_val = divider_get_val(rate, parent_rate, desc->div_table,
+				   desc->div_bits, 0);
+	if (*div_val < 0)
+		return 0;
+
+	return divider_recalc_rate(hw, parent_rate, *div_val,
+				   desc->div_table, 0,
+				   desc->div_bits);
+}
+
+static int en7581_get_vals_for_rate(struct clk_hw *hw,
+				    const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	struct device *dev = clk_hw_get_dev(hw);
+	int tmp_base_val = 0, tmp_div_val = 0;
+	unsigned long parent_rate, tmp_rate;
+
+	if (!rate || (!desc->base_bits && !desc->div_bits))
+		return -EINVAL;
+
+	if (!desc->base_bits) {
+		parent_rate = desc->base_value;
+
+		tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
+						   desc, &tmp_div_val);
+
+		/* Matching clock found */
+		if (tmp_rate == rate)
+			goto exit;
+	}
+
+	/* Search requested rate with every matching base rate + divisor */
+	for (; tmp_base_val < desc->n_base_values; tmp_base_val++) {
+		parent_rate = desc->base_values[tmp_base_val];
+		tmp_rate = parent_rate;
+
+		if (desc->div_bits)
+			tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
+							   desc, &tmp_div_val);
+
+		/* Matching clock found */
+		if (tmp_rate == rate)
+			break;
+	}
+
+	/* Impossible, should be validated by determine rate */
+	if (tmp_base_val >= desc->n_base_values) {
+		dev_err(dev, "Invalid rate for clock %s\n",
+			desc->name);
+		return -EINVAL;
+	}
+
+exit:
+	*base_val = tmp_base_val;
+	*div_val = tmp_div_val;
+
+	return 0;
+}
+
+static void en7581_update_best_rate(struct clk_rate_request *req,
+				    unsigned long requested_rate,
+				    unsigned long tmp_rate,
+				    unsigned long *best_diff)
+{
+	unsigned long diff;
+
+	if (!tmp_rate || tmp_rate < req->min_rate ||
+	    tmp_rate > req->max_rate)
+		return;
+
+	diff = abs_diff(requested_rate, tmp_rate);
+	if (diff < *best_diff) {
+		*best_diff = diff;
+		req->rate = tmp_rate;
+	}
+}
+
+static void en7581_find_best_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req,
+				  const struct en_clk_desc *desc,
+				  unsigned long parent_rate,
+				  unsigned long requested_rate,
+				  unsigned long *best_diff)
+{
+	struct clk_rate_request div_req = *req;
+	int ret;
+
+	if (!desc->div_bits) {
+		en7581_update_best_rate(req, requested_rate, parent_rate,
+					best_diff);
+		return;
+	}
+
+	/* Treat each internal base rate as a fixed parent for the divider. */
+	div_req.rate = clamp(requested_rate, req->min_rate, req->max_rate);
+	div_req.rate = min(div_req.rate, parent_rate);
+	div_req.best_parent_rate = parent_rate;
+	ret = divider_determine_rate(hw, &div_req, desc->div_table,
+				     desc->div_bits,
+				     CLK_DIVIDER_ROUND_CLOSEST);
+	if (ret)
+		return;
+
+	en7581_update_best_rate(req, requested_rate, div_req.rate, best_diff);
+}
+
+static int en7581_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = en_clk->desc;
+	unsigned long best_diff = ULONG_MAX;
+	unsigned long rate = req->rate;
+	int tmp_base_val = 0;
+
+	if (!rate || (!desc->base_bits && !desc->div_bits))
+		return -EINVAL;
+
+	if (!desc->base_bits) {
+		en7581_find_best_rate(hw, req, desc, desc->base_value,
+				      rate, &best_diff);
+		goto exit;
+	}
+
+	for (; tmp_base_val < desc->n_base_values; tmp_base_val++)
+		en7581_find_best_rate(hw, req, desc,
+				      desc->base_values[tmp_base_val],
+				      rate, &best_diff);
+
+exit:
+	return best_diff == ULONG_MAX ? -EINVAL : 0;
+}
+
+static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = en_clk->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	u32 base_val, div_val, reg, val, mask;
+	struct regmap *map = en_clk->map;
+	int err;
+
+	err = en7581_get_vals_for_rate(hw, en_clk->desc, rate,
+				       &base_val, &div_val);
+	if (err)
+		return err;
+
+	if (desc->div_bits) {
+		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+
+		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
+		val = div_val << desc->div_shift;
+
+		err = regmap_update_bits(map, reg, mask, val);
+		if (err) {
+			dev_err(dev, "Failed to update div reg for clock %s\n",
+				desc->name);
+			return err;
+		}
+	}
+
+	if (desc->base_bits) {
+		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
+		val = base_val << desc->base_shift;
+
+		err = regmap_update_bits(map, desc->base_reg, mask, val);
+		if (err) {
+			dev_err(dev, "Failed to update reg for clock %s\n",
+				desc->name);
+			return err;
+		}
+	}
+
+	return 0;
 }
 
 static const struct clk_ops en7581_clk_ops = {
 	.recalc_rate = en7581_recalc_rate,
+	.determine_rate = en7581_determine_rate,
+	.set_rate = en7581_set_rate,
 };
 
 static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-- 
2.55.0

