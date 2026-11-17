Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938549;
	b=dQyBlu6IuFlmFJR5qy3hbF5hnxooIHaLB087TqDnYy9GAGOiLuVbYzxcd5OM5idbEs1w
	 zkgdz9ApLP8ZlGVhWkoWfBZiUp4y8kJXsazKFVKRLuC2d9ogD1Bo8UTwrl5XW6f+lo2Cw
	 lfY2+zrS0PXdfhJN1QrXEi7Qvad3y+or2g0FbV2b4tzp085SYUjh9/WVz6V4dvFhDq6pQ
	 cWjvkxJRvlNaxyFfHA3Dg72Pm2wsMq/HZMWmngZBdDHdv6H/iVSi60q6bVWUcScN5r3f1
	 iJMKl3wIjMc23tZWta2VELZETOO2nOskWVkahKcqbcUTELY5UyjbmGCAxdktHGwyw5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ahd5FDBdroepEwOBVkK30vW1LSS4D6hooNxcp0KCPGk=;
	b=Ml4m2ac7zuYidmr5j0l/Dm2LvGA1Ikd31EdZ+xhBeyi4tWXfRqYS6VDzYTwjEQ+iRdEX
	 j/jHkTb32JUNe1Q+ptd6W2GsUwbHfaQoHxq6LbGmCdRKIdqEXt0gkTZgrgBIAemgCXdTc
	 2CuHbKbaHJSKHeJpzgF8IXKWJZXHVBtgxxfdrTP6hnYqKyMRgOFw8x41tujY0oyZsELge
	 0LZN+EpgBlATe78AFgfj3hCrpIiBURtimuYfUAsS9/92XeHDD/E0paOs1ZXNTC4mBneGk
	 ZfD/whycaawpY8CNGEE0RtD/WYk6wRbY10fwjMULh5HtrvWbw4mx65kpnukNKqhHiSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b/YhnGAk";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995B606A32C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7995B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b/YhnGAk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a358881793so34787f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938548; x=1795543348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahd5FDBdroepEwOBVkK30vW1LSS4D6hooNxcp0KCPGk=;
        b=b/YhnGAkptrE09WjWxD3O1hu5FHHbtfn1SVd1WuG4EBHGC/pL0EHoJXDWKJI54V5ie
         E4F+V+jJR6TevZy+LHHIZtbgdwco7tYVlrFsrbJvUYrXXJAwJe5o9hjxos8t4serET1n
         wTnZbcWpT+aSD0GX5pIahVRLDpvxu4U7mNSX0z8H8N0MOT7jVJ4f8JIDNIUZgdv4DvgH
         HBrwpMIUlkxrZqlRoNgVqOebT9LODR+eoKUpRe12GAYVWeBAym3/cQCpPkXbRCuBk/62
         4hySnJ5Vfzu0X4NUPydtO3Itze93IfrhH1WI+VUaHcmnUdbCS8062Aw39Drm/Fb+XKFs
         xzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938548; x=1795543348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahd5FDBdroepEwOBVkK30vW1LSS4D6hooNxcp0KCPGk=;
        b=cnCcj0VIXGDyVZxP/PN/htMGF7hniMgR//a1fBWSjzuZd27vQSXceM/v0CWXfZvavo
         w02pK1GeGaeSYXifUD1rG2fkBCpTsGp5XUzdk2ERAatEmylXTOmivBT16Yy5TCy76m++
         vlNcrrX4S2WAInRgAsuQpsYo8Fy/EjAsjTLs2s5eHa6g70Y0Pt0iV/SFuWYtsSJ/gM5N
         evYy4dbuys7n3SKIytdjNQ01IpbvXXXlMU3i8EXth9gAuGGBadn1TuLEdznMbtujmeAI
         XUHCHu/U2w4g8g4nZbpdqdUV6ARpTQ7ClTqO3FmVfdag3A3GbNlDM10Amp8FL3JH9A9y
         4G9w==
X-Forwarded-Encrypted: i=1; AL+hErE4Nefp8iyPBG0hOllYsDFp/BVy8nCh4CqWMZr46X3h+3nPf6Bv/MXNe1refrvLOCLI5a4xyO2jlWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i0J0cb7nEqLcMbZwfoSAXa2OPfPYEAqv0NMQPByrcaasBf+Yu
	uqMHDea7qMYAQUNppjnShqSW+LOI8v3mhXIB4lZURZNDoGofZfw7UaDj
X-Gm-Gg: AZFdTZdAy5Rm8OCcTuXYLw2NG9n67XyMKX67LEZAmFaq7AUT4Z+ix0yrftLTD+WtFOG
	42/4NhwsZ8KsvZzOvCSvLoTtRSDVJnqMvEcn2TYCdu3i4Vbi8CCT0gLG6RZwKzqFo02G9HtFeOw
	cUgOc1Pk/ITxVKWI+dulo5cjsqlARYvcVXdmru6N6P3oBtTFsA5hYk+R6kBKjwxkJW9sPgn+hr3
	cqN3ixrnzg/0+VYxZhI2NGNB1EUHcuqumKHukTos4000P/IYQmaSRAXddgVAjTH4J7UnvYThjyx
	h3wppbjaOYxjOoNzqNXU976o7AEg/FcAUDpU9HGFvMxIgGrygwI1p0Hyjuw7gkfavEtDa1oKQt0
	rF/cSSxVT0I+N9bLBHXaMMhewhQbondxZAk3oqA/3vZ0D7pEgfAWRaqWgXyYSIfUaoOjmrtop1t
	7wthnYg+ICYhuWM8Y3ryDrwYIk8HOJWO0Ck8YUJC12s7JSC5wfQHjrcwvCRMThnW5kB3lmFzwIM
	43ARKSYCygKnek6AYRZ0cD6emBsgH4+YF/x/vlY0UlYoi1N6cWJPCs5RSha66VUzHEp537a93vd
	GkXTY1NfDuh2B9y7tg7WMcHzElrgTe2zMU/fQl0v1+Y9JHm6MH4NkFXs72LXa2YUlzzxdWpAfuk
	/HGXAAh3aaTVU3AtqQ6BvCA/fFBvbb+0mbA==
X-Received: by 2002:a05:6000:41c9:b0:4a3:777a:a964 with SMTP id ffacd0b85a97d-4a62d6d4875mr654692f8f.0.1794938547536;
        Tue, 17 Nov 2026 10:02:27 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm52567f8f.36.2026.11.17.10.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:02:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 2/2] clk: en7523: add support for .set_rate for en7581
Date: Tue, 17 Nov 2026 19:02:12 +0100
Message-ID: <20261117180213.88046-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117180213.88046-1-ansuelsmth@gmail.com>
References: <20261117180213.88046-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 322 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 288 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 27ead83b639e..a41eabd40401 100644
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
@@ -708,10 +773,18 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
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
@@ -774,11 +847,192 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	return rate / en7523_get_div(desc, val);
+	if (desc->div_bits) {
+		val >>= desc->div_shift;
+		val &= (1 << desc->div_bits) - 1;
+
+		rate = divider_recalc_rate(hw, rate, val,
+					   desc->div_table, 0,
+					   desc->div_bits);
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
+	unsigned long parent_rate, tmp_rate;
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
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
+static void en7581_find_best_rate(struct clk_hw *hw, struct clk_rate_request *req,
+				  const struct en_clk_desc *desc,
+				  unsigned long parent_rate,
+				  unsigned long requested_rate,
+				  unsigned long *best_diff)
+{
+	unsigned long tmp_rate, diff;
+	int tmp_div_val;
+
+	tmp_rate = parent_rate;
+	if (desc->div_bits)
+		tmp_rate = en7581_get_div_for_rate(hw, requested_rate, parent_rate,
+						   desc, &tmp_div_val);
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
+	struct regmap *map = en_clk->map;
+	u32 base_val, div_val;
+	u32 reg, val, mask;
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
 
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-- 
2.55.0

