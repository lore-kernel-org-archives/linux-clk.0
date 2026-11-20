Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215569;
	b=jkYlKb1ndvny580/o5F5UrcsgfTtS3/C8fQB/DHzMTv3DnI0l+1yB5rIlL6eLdEKB/dh
	 IwXQ/9nIdzxjREz3GJ9f7ub4fAJElg+vv0P0dD8rzSpyAUEJ3YOePeeO3SDstb7SkXdA5
	 uBi8Di1ojrvnALmcJlD/RpJLMH4DMCwcJl3GblZUkcnADk9QC19cRAAy2FBRRycPvwhsz
	 CiYL+bZEE3YEMh3CMD6OYXsb2G4iLFAQGNfsqbALF4CIzpq2m2kaljG/AszIBDLI9qwsN
	 30iVX7Ret91TevKiqiQlZyLnHs/YLQdWvPyrnaKlJWqHR9pUNAB/d6sDP4oKvr+N+lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jJ/1J09VSxltKw8nVK1pqnDOKUTrQNMyl6MovZUuf98=;
	b=zQ7UaIyRc4CTEYgJ4zk30pCf3by8mn8FCaurrRDEUDX2uWRAAlYo1GpplnswFIXCseq/
	 OwJF2TXmpsVnHA3Ua3/CCMaC8wU4gfDikUzVugsFbozWEW0zgN3iB4OpKRZLE+IFuq29R
	 OGJsk7ZkxL4sp6NgDxHjZEdgHfga9jWYRDAdlrXfADG942s87NFXmBbRiAGYavYrs6uij
	 r3guiVDk0Z6bWwjpeOH3bZK0BorvGs4nkrgLfcIbg6/ydcejshFFL+kOy1Xxr9LeRX471
	 FA4vnPx0GRQ4VdV9dhdHFn39iU562HSwB/rGwNL9n/WTP8SLwTzswx36C7C8b40SMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGw2JTxp;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAAA606A68C
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 22:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEAAA606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGw2JTxp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso13733475e9.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215561; x=1795820361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJ/1J09VSxltKw8nVK1pqnDOKUTrQNMyl6MovZUuf98=;
        b=BGw2JTxpxYXHQAPG6dywS1HTxBwcw95HiKkmmdGhOZYtjebO3PbCI0p9AaUJZp/lAr
         ZH9zbbhCv53qcB5fPtoYW95wnmQCoiq8WbMW/htFPtxOe06HAXMJJibkfQ+lFF//jltd
         O5BNrW41SJQNTamTqwyU2LK5ZzBo2hPuj+q4nkQganaSPCFn7N+H6aIEpS/oN/VKYU/6
         jPiZNpry0WZgdgFjx/Zsc841g6UVwm+ASFVpqPas/R7bUDZftfsTJFkG/JhKvRYXyJWV
         Xk7dHclLpackPTYMddu/EpdLBaU3bykbDSzUQhGr3jwO5o/B4dgXoEBFjHQb4n2oFfaI
         URRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215561; x=1795820361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jJ/1J09VSxltKw8nVK1pqnDOKUTrQNMyl6MovZUuf98=;
        b=DpwgHdp022wrWO2CFdrBUVwRCTBfvGB2mgF/D5ON8eQPtpmtgkwaaUvkrtymH5RLHR
         Vdpei+QsWvDTf4PLTq7eeUefaED7FLc/NGMPU6sF/FfMQkgsE0lv5bM4U9zphzYNB8Kg
         8zeTcBxfSR7tLplO7AlriAa6vKjhDqEJEjxJXL55ocT0FTKWS/0inuLBCABLlRZCRo1m
         DlzzpUpUjw0cDBwmfS/w0FNAQ3c/jONhKKPA+BEmu95z9m/WqAlFL5LpE5kcQ3WtMtf3
         wY8IBOaRTga/+B8+qxLdDW8O/PO03M5dVsfpPxfkGJ0CosruSXDrTeXc0BFw1xgpeVHu
         /0Cw==
X-Forwarded-Encrypted: i=1; AL+hErFcN2KJLbfTpdjZ1qNyNG+TPjjqbZlHZB6RKjtzPuoCteQCxEF1MqbsdWsoFnm+bPa9JYqNgqsakHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h8ErzckgJMvNeCKKGtX2XNydj4wTwsuRCWD7qMvYATQL7AuTq
	CHxCBrabzWiUVLRqEmbBG4hXfNm0BoXw4bIoWNO6rzWmKDzj+qANxDdv
X-Gm-Gg: AYBFou3HJiNwMPoX4t9UH4iwi7a3eErNNBFb0a99DqfwfTnD7MMW2IUODM70AxelhZO
	LmhU8J/sVnVSqePSip0IMPRBNtsPIX/urVBX5tWzTBwazWGWpKlTgwWBEdU52w+ZwX1jc95CD5V
	vDuyk4jBgcsLm3oud9qpvGFnlKkwCnK1DeiDmHb092J5UxA/n5fdeDydgJZwxeSxa5l0WU67Bg0
	lS1tkUk4WxciJ5U5EO0hYCg6xNQvwFY4xPYKeOSMBsNZ4g8QTfp4pkX5qNFLBHeg/3Y6Vz0oLsS
	hHLBC+pnPJ3VqdCXNep8r+2Ox/u4fZ4QXxIMmrUeGeddVuySIGo1w/JqIZgpe6OMRFlVTL9Gomz
	wsLKeZQl1kTvis2U9xPS0f4F+XFuopio9K+/m9etN7dsMaC/dvoh0py7EmH1tN2J3kKiwyTsxYo
	5O4FB20xq74FGMWCPPPTyfQnO5sEdItu69VYeU08s+nWpWfULbAHP4kJ2ORw2+q/bGMeAlounty
	4E2tD7P11Ciy44YReFURy6PnV0Mpr21RbFVqwcxncp3nkYfdW1rchMShmaU58WyQPp1xkg6eHPP
	L69j+6iUEjDSvRMSb3W0/YQqAMxgwtnF/smly2vf78dCD97AWsrSTPthTxSb8HuyIevF6S2gRRL
	CIgqKHQRfWOU0SXmywQIvOWX4P1N4jAL/V3CsYlBnmGOyordY8JyP
X-Received: by 2002:a05:600c:8b83:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb8880642cmr102201805e9.17.1795215561227;
        Fri, 20 Nov 2026 14:59:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm125915915e9.15.2026.11.20.14.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:20 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 2/2] clk: en7523: add support for .set_rate for en7581
Date: Fri, 20 Nov 2026 23:59:15 +0100
Message-ID: <20261120225916.158641-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120225916.158641-1-ansuelsmth@gmail.com>
References: <20261120225916.158641-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 340 +++++++++++++++++++++++++++++++++++----
 1 file changed, 306 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 8c00646ecdc6..f47f3ee75057 100644
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
@@ -773,11 +846,210 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
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

