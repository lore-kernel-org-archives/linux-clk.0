Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702599;
	b=shAvsFxEJ6wW7GQKHhrzh2LmM77d6zWK82kPcjZRcOa9U5ij6Lz+eqSbxbmbbQ+Va+Qd
	 OnQ+yf8DVbSdWadSPBE2ORMGUMK/fcMPz/HmkIeccFFeFpJRiAHVq9kzKtNBxc8SzXkF+
	 d7Mq8GbIXEGWU4DbQ64b++fqNMPWJ6YBs2j/DjIjMW8dzLYYQ9AYaSWHfIV0ojpzuGNOC
	 iP1Jdpwp7fJBQnNmAamAKxBfnapUdS7c3ei5Cqb1snFMShBL/9okhi/ajwP9FYHO3ohFT
	 HAOxitU591HsLd+xDIhVZQyuulEGdx9N4gG38kqqN8uIAPy3tAxHFw9lgUft0GmqqNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lU5a37ANqsH+/etFPtYMjt6cdViAcWdqe3yklDUWWHc=;
	b=znP6M4YBldScrMGObfN2UOS5w1y8YlYytBxxsypwogAlN8oBZ4fMmdOLKJqeaOF/xR67
	 LQSguDbimaMgvjiCnWhNIfLK2EbdoCo70yhiRYSd+sZg99a1B2xJOpoATiD3qCXfWfMou
	 K6ILGSDGyhegFfxRDwF0oMgQlGU+uBBSvMrFGnvbJKD7eRi1Y2xgCv4Qq+LYNinUCTnXz
	 NegQxOgd59a2Ed9vpfN4N+ihn2qksqMtyPBoXhiPJ6LUOUpNLw27Z+E+AxwYd3ACHtZ3i
	 UUR1TvwmtZaxcTv0OA6NyVdbzsNdamZA3I8/I7TzRdtgFojaanv9KKfAyDCzx0n0iiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A1cVgB2W;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0179606A328
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 20:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0179606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A1cVgB2W
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0728so61965f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 13:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702597; x=1793307397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU5a37ANqsH+/etFPtYMjt6cdViAcWdqe3yklDUWWHc=;
        b=A1cVgB2Wlfn2qPRMDZla52t/KylTxUPQYJ7E1/Y9+l1yeSh9i9pM2U+JYUIIwC86Cu
         vNzfoXFn5Uxb49DmtB4xjTV3KuhPu5tvy7Tp4eFh+AMBOT7KSjV+oJn7Sxvre5jeSxTr
         /Vlk9p2AKgPO0fMYyizBN+aP5Pdh1hLQq2cq2a7xYcZ0wRmGX6FuobL0nelqWvr8M2eV
         o24ffelyp9QxyvGy7XnbBSjR0VOz0OooQSf7PXNwd5hJcvLvXcIeMpyHUIbiiNWjlCve
         qu2ucLLUY2DFs1/ljRV7flpq/3mGb4d5aFOLmumpqnYlzpMMDbavFaS4fWvIE+FuSyr2
         8ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702597; x=1793307397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU5a37ANqsH+/etFPtYMjt6cdViAcWdqe3yklDUWWHc=;
        b=ddkUsLix3sCG/qkcjXesYKxVNqeQsSOJyTjc5cnaUkuq8iTlNTEPuEQay9hwywAkGN
         olGUOvcNuD3Axv2mThOOv2X+2iVzhp8nIFux8ft9aNNNmVa67CPsmuEYql9w099EZtsj
         x/oD9OYnwGZnRfnsLIh2ZMS81DCXptx1i6yhC87TwbaYqxdqIJcvhc9qDdXy6JS8d1uY
         BOjI4HI3PtFDe58JoHInYmadYtzpaUbjgGJA2tYE8Zv2FsKIKZ8ALP7q+IEnFaDrf6Ib
         dsh4oIni1QXE0p8sMESwGiCEagZNrFxQ9u77bRbAF+/0IoHDJlS8E7SmLX4yEOwJGww7
         YVZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5LVfhv/YbS0AUGFi3v2doAtupdgmhRV5jLJtE05n/OvjfkEQBHj3sqqiW0y7gs5ruG3Cfjh9HcSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWLPOF/azZJc1onDp68OyVMoaq/d2R6TsU7eLl6eJDCdcOcpyf
	pFDz5cMhHCZMbIBD6uSe6sQCtXSdtHBLNTOGltX/kIc8iWo3Qibv6ZiI
X-Gm-Gg: AYBFou1aUxyZBMGZzxoEk7Zv90X/p67m4NyExtD779UhDTjQ0R5PJAwerPDrV89LisS
	JKi11eaV1XKl1i4C2nUe1o2O9w3lLjuyGxbfqykgno86KCrEEKPfMphvDsOKPBMOYoe0MGm4gn2
	ZKdyxU0Jhro7AF+nywxIqM38HaFFMO57a0iydRBPqWpfACit5ZvIJfwJS37cQ5+kQDhARH9wjP3
	ImJ60vBK/nqB8ci51VW/L15m4IfCyZ+dqlIBAvJpAgpR5QmwjgBfkErGDO2EHodYiR780uwg6HN
	p9WQYBg7GXNo8pOfyUDZ1AZRV945kBKhOPzmhRHlz9VbiPW079jIONwFVD1le3884vf+l3H2UQi
	03tNErm+b8WU6jAcuCXwspK1L+RLDuHjVjuKekpuuE7oKWe9UOjlI82cu2Xub4TkaoeZSVsoHMh
	oifJjjCtGGM7N0YAz8sr2ygsXCdvQ1wsEbJ8Q30Cw3IwG1GPd586eftrQ/xZt24dBIGzXgl2Ac2
	2bd+4eamfCRoEzX7wlcEoUI6KgJCyq8n2l/eww1kv8ZApg7yZhnvWUtZO7IiIr4SGL+33Ahlsa0
	qggNqRFpZ03pMySOlQOdErBM/9WCEB24oJJ44Ulmx0OHQBVId8G3eobuw2NiOA==
X-Received: by 2002:a05:600c:8b32:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4a211ed726emr2669065e9.18.1792702596607;
        Thu, 22 Oct 2026 13:56:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm394006f8f.20.2026.10.22.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] clk: en7523: add support for .set_rate for en7581
Date: Thu, 22 Oct 2026 22:55:34 +0200
Message-ID: <20261022205535.688352-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022205535.688352-1-ansuelsmth@gmail.com>
References: <20261022205535.688352-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 136 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2f203c94f87e..832c43ae265f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -777,8 +777,144 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
 	return rate / en7523_get_div(desc, val);
 }
 
+static int en7581_get_base_val_for_rate(const struct en_clk_desc *desc,
+					int div, unsigned long rate)
+{
+	int i;
+
+	/* Single base rate */
+	if (!desc->base_bits) {
+		if (rate != desc->base_value / div)
+			goto err;
+
+		return 0;
+	}
+
+	/* Check every base rate with provided divisor */
+	for (i = 0; i < desc->n_base_values; i++)
+		if (rate == desc->base_values[i] / div)
+			return i;
+
+err:
+	return -EINVAL;
+}
+
+static int en7581_get_vals_for_rate(const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
+
+	if (!desc->base_bits && !desc->div_bits)
+		return -EINVAL;
+
+	/* Divisor not supported, just search in base rate */
+	if (!desc->div_bits) {
+		tmp_base_val = en7581_get_base_val_for_rate(desc, 1, rate);
+		if (tmp_base_val < 0) {
+			pr_err("Invalid rate for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+
+		goto exit;
+	}
+
+	/* Check if div0 satisfy the request */
+	if (desc->div_val0) {
+		tmp_base_val = en7581_get_base_val_for_rate(desc,
+							    desc->div_val0,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+
+		/* Skip checking first divisor val */
+		tmp_div_val = 1;
+	}
+
+	/* Simulate rate with every divisor supported */
+	for (; tmp_div_val < BIT(desc->div_bits); tmp_div_val++) {
+		int div = (tmp_div_val + desc->div_offset) * desc->div_step;
+
+		tmp_base_val = en7581_get_base_val_for_rate(desc, div,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+	}
+
+	if (tmp_div_val == BIT(desc->div_bits)) {
+		pr_err("Invalid rate for clock %s\n",
+		       desc->name);
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
+static int en7581_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	u32 div_val, base_val;
+
+	/* Just check if the rate is possible */
+	return en7581_get_vals_for_rate(en_clk->desc, req->rate,
+					&base_val, &div_val);
+}
+
+static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = en_clk->desc;
+	struct regmap *map = en_clk->map;
+	u32 base_val, div_val;
+	u32 reg, val, mask;
+	int err;
+
+	err = en7581_get_vals_for_rate(en_clk->desc, rate,
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
+			pr_err("Failed to update div reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	if (desc->base_bits) {
+		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
+		val = base_val << desc->base_shift;
+
+		err = regmap_update_bits(map, desc->base_reg, mask, val);
+		if (err) {
+			pr_err("Failed to update reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static const struct clk_ops en7581_clk_ops = {
 	.recalc_rate = en7581_recalc_rate,
+	.determine_rate = en7581_determine_rate,
+	.set_rate = en7581_set_rate,
 };
 
 static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-- 
2.55.0

