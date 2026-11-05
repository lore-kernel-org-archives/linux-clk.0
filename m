Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890946;
	b=wKRTpQ3tINCs/3ashpdxEkTR+1Rkv3glvONJs3juFYnOkOKDhBUNROFJsv0ji9vb2qWn
	 3nAI4QDt068CeFr55vTxk3uiFyBQrO052/zJVemtmDdPPaMn1nJW5JPxUxYiPheuV44N/
	 bEmGA3EsSHNOLt/Z4VPzGuPXJULOCBOGSceB9gaN1wPnS0DV1V2ChCpWV33uXoEpcYnaS
	 5h+6nn8aRqH+2/is76YoA/G4pBJs8o9bLkT1EgryRUOmguM+rwoA2B06qS5kDNxfvY+Wa
	 ehALcP6qs8I4xYiGWOWTIS+ElhrXTXtXzviq/sRnnoh9GSuC73UOTPYuxjD9XqLLyhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U8zcyQ2GM9ihw29A2+FiybNq7yl1znKX6rbpGcxvkTE=;
	b=tLrAcTGmvU+m1WRSksdamGSdMoAXJdakfUThRXzoDK3LwNhQuzDpodir3nDU0pizqqOh
	 bW/QiG7vfV/iO4+QnwmXX5kANskNI6fWkC1C447BKhiUC+ggvHZfwIIcRNSPxGXuKozn+
	 GR68t7tgrjqQXrb5aDbmNaq9SrieTlLa+vJxNcyH4niKcm4hT6PEiJ0iX8aleWDln0jEK
	 ffRA3zvdJr3SSEj9HImNuOsvWlFOdQc9PjQ04s5qzSyXqRYQpxBgt9VFc8hmydftr3pCQ
	 590VhnLcaRsbIjzVPXPkw8LFS5WKubQTgl9gVAkpDj+4kBUz9jg5dHl245VYm1t8LJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYL6NyFx;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C39606D832
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 15:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C39606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYL6NyFx
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so1645457a12.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 07:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890944; x=1794495744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8zcyQ2GM9ihw29A2+FiybNq7yl1znKX6rbpGcxvkTE=;
        b=gYL6NyFxmYLKmrX3srb2LFckyhDDL1TF8EH4DCvoWpL/WURfcgyN1RUmewLj42P+ZS
         Ge3Mha6vfG4Ij12pRjkwW9HufEqwnh7IGEcBTDO7jfS5huc09aI4Q7vdy06jKdRWCbXI
         W2bJ4Lbp1fedJ1g6QQg22vYgThBM+aYFgJYTVfLlK9rqDo0CQVT4ED0wjsp0ouTdsMXv
         /2e62FiUrekYa5sFS0otdPuFdCVBXBt/0ZZANYv6EKIFIRQ2VLo8n4HFs8tFRXS5UkLu
         qVeOhRygqz2TTA5T3LFkgJUwnvTHXhw/We2z7TEqwDqU/2DF1kk5bPUAza7Fb2itLmgT
         /nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890944; x=1794495744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8zcyQ2GM9ihw29A2+FiybNq7yl1znKX6rbpGcxvkTE=;
        b=wezGx0G/mSRPt/ppN1mvUzBAvpHtU8HYtmemfqOQVcQA73MJFA0bg0/e+kAwIwzx86
         g2qrNb2SeTG2AF9Z96/7lCLKHFYMuzFfn1i6BHgSHoYYmqJ3B8wLe3AAr0QuH0EA5UJk
         MKoj4O9a0zxcAAb00S7AOF9RMbnHNj175Xtx+ln32ja0JGx30p98WqOkQlgQh8R6beke
         G73c4bPi0erLW9KTc5tM4FzwE2qJYOoyEyrKqEh6RDIitS4rw57gwQMpfqZJbFOWxFU6
         iRAKE2trI+Xxi1fSz7EC3yw8u2Bomm92Q76tjsMIDSnat/bEp1ANY1MoID62f1rBsvgA
         r/KA==
X-Forwarded-Encrypted: i=1; AKwUvByMiafxKQ/B/ngUrW2v/vQftUKVNjP6XH/43iQrqtl8tXjksE2mJtHKrSfwolKynRx2ZHwsXGkiUP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HxuEPbBiZg3kTHjWZiksZavuQOXT9iSUcIrQwD1+1jkUM6crE
	vmANkvYDFmNxojq3JfiTvoacdk5PgEzDgsx50jTJX47VcqRKZJAp6Sqg
X-Gm-Gg: AYBFou2NTY1cyEgXvIJl0mUbyvB1YDp6EzswU1l7h71iaDxyBGdO/U+5oCVqTKry894
	f0xc1k3XuB5XNvCZnk3jub64/StmAkiS4o7P2eQFq8ExKgSv//YUuiXKMAu9mhmljLkpcFzZTy+
	m8JdlwoSuHIjZ+IrrcHOb6FO0+MAbE7nMQxCeZi1bVkHgktd+CKx02nCsvDJCnnBo6wkx+mNQNE
	KfVUKr37LYIudVdC/ncQ4Oke/e5O6UliAToWMeqdmOa+qQenfblOs3tGeCdrVv9nXV3pFNxh9wU
	KFd9JH3xPv03YrXcqIp87sBO+FQUPiLCAVyrdatQoDJvQUyD9/Dc/eOGO1iy6y8xUtbfjPxgJzn
	EiW/oU5yUenp1z314ZeCU5EodD+vVTgSoP86IBo5vuqN8vUY69nUeHkpj5FTesoM2knJVMUffy4
	GkW6+TbrfktGqShhM56+rt8SxavZ4yR/u8EcSacNt+mI/y5tq79mYitzknhdqLw6ugjaqDfar8l
	exlmP7afTHiA0H+NoySBGAFWA6VacOb2NIXsJTmXBF+AFOXDdwZtmLsm6Kznr1kas9vLvSRvx4S
	QdKD4KLCSgm+5UfRAPufZtSavNE6fa73ma/n0E0xrxPkH8kYyXtwhP1thpOleiKXtXnS+iMPFgR
	T+tJRacjy6JWplJ4XOxU7TKby7q8XDPWqYCFHPFt8CMWJvg==
X-Received: by 2002:a05:6402:5009:b0:6b4:d731:4bf3 with SMTP id 4fb4d7f45d1cf-6b4d7315217mr16010214a12.41.1793890942614;
        Thu, 05 Nov 2026 07:02:22 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm11042960f8f.40.2026.11.05.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:02:21 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/2] clk: en7523: add support for .set_rate for en7581
Date: Thu,  5 Nov 2026 16:02:06 +0100
Message-ID: <20261105150207.23023-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105150207.23023-1-ansuelsmth@gmail.com>
References: <20261105150207.23023-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 207 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 6640e814d36a..cf0b6ccacede 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -119,6 +119,8 @@ struct en_clk_desc {
 	u16 div_val0;
 	u8 div_step;
 	u8 div_offset;
+	unsigned long div_flags;
+	const struct clk_div_table *div_table;
 };
 
 struct en_clk_gate {
@@ -161,7 +163,88 @@ struct en_clk_soc_data {
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
@@ -215,6 +298,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_shift = 0,
 		.div_step = 1,
 		.div_offset = 1,
+		.div_table = bus_div,
 	}, {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
@@ -230,6 +314,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_shift = 24,
 		.div_val0 = 20,
 		.div_step = 2,
+		.div_table = slic_div,
 	}, {
 		.id = EN7523_CLK_SPI,
 		.name = "spi",
@@ -242,6 +327,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_shift = 8,
 		.div_val0 = 40,
 		.div_step = 2,
+		.div_table = spi_div,
 	}, {
 		.id = EN7523_CLK_NPU,
 		.name = "npu",
@@ -311,6 +397,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.div_shift = 0,
 		.div_step = 1,
 		.div_offset = 1,
+		.div_table = bus_div,
 	}, {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
@@ -326,6 +413,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.div_shift = 24,
 		.div_val0 = 20,
 		.div_step = 2,
+		.div_table = slic_div,
 	}, {
 		.id = EN7523_CLK_SPI,
 		.name = "spi",
@@ -338,6 +426,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.div_shift = 8,
 		.div_val0 = 40,
 		.div_step = 2,
+		.div_table = spi_div,
 	}, {
 		.id = EN7523_CLK_NPU,
 		.name = "npu",
@@ -775,11 +864,127 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
 		return 0;
 	}
 
-	return rate / en7523_get_div(desc, val);
+	if (desc->div_bits) {
+		val >>= desc->div_shift;
+		val &= (1 << desc->div_bits) - 1;
+
+		rate = divider_recalc_rate(hw, rate, val,
+					   desc->div_table,
+					   desc->div_flags,
+					   desc->div_bits);
+	}
+
+	return rate;
+}
+
+static int en7581_get_vals_for_rate(struct clk_hw *hw,
+				    const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	struct device *dev = clk_hw_get_dev(hw);
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
+
+	if (!desc->base_bits && !desc->div_bits)
+		return -EINVAL;
+
+	/* Search requested rate with every matching base rate + divisor */
+	for (; tmp_base_val < desc->n_base_values; tmp_base_val++) {
+		unsigned long parent_rate = desc->base_values[tmp_base_val];
+		unsigned long tmp_rate = parent_rate;
+
+		/*
+		 * Simulate rate with every divisor supported
+		 * 1. Search the divisor for the requested rate
+		 * 2. Simulate the final rate with the new divisor
+		 */
+		if (desc->div_bits) {
+			tmp_div_val = divider_get_val(rate, parent_rate,
+						      desc->div_table,
+						      desc->div_bits,
+						      desc->div_flags);
+			tmp_rate = divider_recalc_rate(hw, parent_rate,
+						       tmp_div_val,
+						       desc->div_table,
+						       desc->div_flags,
+						       desc->div_bits);
+		}
+
+		/* Matching clock found */
+		if (tmp_rate == rate)
+			break;
+	}
+
+	/* Failed to found matching clock, return error */
+	if (tmp_base_val >= desc->n_base_values) {
+		dev_err(dev, "Invalid rate for clock %s\n",
+			desc->name);
+		return -EINVAL;
+	}
+
+	*base_val = tmp_base_val;
+	*div_val = tmp_div_val;
+
+	return 0;
+}
+
+static int en7581_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	u32 div_val, base_val;
+
+	/* Just check if the rate is possible */
+	return en7581_get_vals_for_rate(hw, en_clk->desc, req->rate,
+					&base_val, &div_val);
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
+		if (err)
+			return dev_err_probe(dev, err, "Failed to update div reg for clock %s\n",
+					     desc->name);
+	}
+
+	if (desc->base_bits) {
+		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
+		val = base_val << desc->base_shift;
+
+		err = regmap_update_bits(map, desc->base_reg, mask, val);
+		if (err)
+			return dev_err_probe(dev, err, "Failed to update reg for clock %s\n",
+					     desc->name);
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

