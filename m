Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215563;
	b=O/8vWjFMwvBKGnsHaZEImpBJMfLiYbwsMTOdLlPtQHK59D4zsDn/jJs9HotCeISlnfae
	 a6vnU99tAePMVNXv+XFkBIk61dS9UGksXyJxtbflwFnXc+mkZbvXscy4U82VgTOQmTxfh
	 UCQQDN1MB05I0+y2pivFLVwV61VPvzs4rzRN8fvhOK/Rs3oWFXHiKV5ZkZCDuJ3vwckcq
	 gmZRfdLe9h0TxTs8nRXsGU+sQpgMgLpZlxFFl354QKJE1rj6yek3LM4/XjpP2+zIzYMhI
	 a+c9+us84iXVziL3Ne2MrurdB+eGNmy6dOo9+J4KzHLseHHWXcUwAvqBSpEbkWQ8www==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xUhP7waQ51kBNpEMjHHLg0XEPzaDkrU5/JeyYLEYxaM=;
	b=bLgJiAJayia9jHmaG5eqgPoknHdOI5/JvVGG/QzGYYabEYVO/4u41hzn619JPQn0tQ4G
	 m3LdA9WAx1qh4WApvr9jx82v7TuRkkh2D1yVlDZQAPvRwzif5JtfFEng2fKjAHjSeGvfH
	 ZEeqd0wu6/EllLT5w9kIlzRfZJEQ82cFsNCWeTZ6B058qvky5OAkIIaPDKZHinjIfWOpp
	 aDQVQdu0EufO+g76V9mByGWx1XhqcY0OM6syY09ZCZWGCHf11cl/cr2T5yGv6JkffIyPk
	 VquMSDuZsgBaNI9s5aQxvHgbz/6mTuEKQov8iepnQRAEPkHNKyE84gYMS8TQCSt2xYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdTXKGdQ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1804B606A334
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 22:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1804B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdTXKGdQ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so12462835e9.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215560; x=1795820360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUhP7waQ51kBNpEMjHHLg0XEPzaDkrU5/JeyYLEYxaM=;
        b=rdTXKGdQcsIN8kySVfCYKF6t/jloktI3889uEHC1etuTjade4Ji4uT3O4j3D4ocsNM
         TqeCpAXSzqheF73j0eeCs5wP0YKoNJFXhZQx6FhaGR929IXn1QvgRUc4my+CCNXCpvW4
         KM0LVZqmml4zwmVIZ5JtP5CJuXLFftNXa8IYkdPvBe81RECMps4y96zp1TauvfRGN3YG
         /Mdd5CeR2TAm5IGlyizZdJcVMfJSy39fYBofbhbMzb1QoUkmDy1uKmUJVTUMsHl1jU5x
         1I8WrrDa2wXkNrHmPWEIqTKpP/t0qqO2jlwIEjaE8Oaf6Goshv1NAYxqgE0hxcwepmC6
         BJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215560; x=1795820360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUhP7waQ51kBNpEMjHHLg0XEPzaDkrU5/JeyYLEYxaM=;
        b=R+Oe7LzKK+YfOm2p4BP3RwBNLADDk6Kvbzv1Tuo4RPo1jpmERyyVJxWonhq737H346
         WlOzFtaozFBdB35m6cxsuYLHKykn5ZOObeTcpRrdTJ9E1fvDTOiEx7YMJJ1E5wuTfbkf
         kv7+V8n93GoRiUQczAzdfxbpE/48+U8AK5JE9LPrC0T22bg9DtQVWRvJph8C6YMjpZ4y
         GVu9+tq4hKzDad8UST6SPB4ZcZde8fSQ/HukfXXXlwSaNbSXW5CdeVrtp8c2vUznTIAy
         6+wUl1wpSBiY7761mdTrECPX31X/hGsriR0CXgCQBFXNR9HMzCX2UH8EsLK4z7Uge6LY
         ohNw==
X-Forwarded-Encrypted: i=1; AL+hErH91Cy5cFW0XqLN8JsPuj+dRZTGE3lwJRpA32nbFzLBXzos+U7riHet+P4qATrOyXos0wisZXdjhnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z88xW8PWaQRVtvtgLhEDrfNXDBMtQMpLwokgdpra4xa0xQ5bhKc
	OuMDVjx060LVWPvNTrT4cqIZsMFLg/YmHXDt32FnbaqIZ3hZpETHq9yf
X-Gm-Gg: AYBFou0iFwPZ0uf7YTfdY5XkHwspWNhb7UtdzlXIzGOpqNEN/pe1IDL/7sJ2gZjFy4h
	RRCQD9cr5EVcT34mT7BGhxOnBGPP+MAcg7Pl1f7iIqY/NWKgN364/U0K5RsMhs1vt3UFcfgnNHu
	/HrO99cdM6c+Z5xCETv+ebob8JwhQ6Iv5oVOdSusegiS2nAW2Un8oUxMZct764fsikbIlnUNo2b
	4wTibloHjXuVBvbF+skkqEbej0JbSMQXCuF7HnxjO+D5O4XFOavmIEepxqKXIQav1iz8iR1NYXf
	Anm/P9ft+G+kQsM5tG4sierKJ8K+dmsospRkn16c7s/EvKsaDNB482v8g4dGYm3IpjY6zyGvHGa
	CNn1+k70E36Nl1srjkLyLqmY/f4JzLG9KfX5pBgE3enqLRs3EmqLuljf3gAZ9IoEdMpNib3+yv/
	3+url/CAE3U1TRn14Fn76dT5rIxxYZCYoaDUiuqDvKUTE6QkKmTh96G8S+TsMGjRvz19dlDOXC2
	90kN6c0lMHAafo1XgOeU3cJs2MPDBor4Ze1QrSIA4iW2C7eGHTD/ahHExN7x9un8fPWFAxiWzaU
	c93S/Y37CUP6oGSdUVH2mL5VqH+43ROmZlSFEyA/ccsAWYJU9Z4EYQDKIK7w6i4okmlOJm4ZtC8
	GlkLwnciFraHQv5oYYgm2rGOlwEvap+BVHnJGZWWUEIs/Io7X/piP
X-Received: by 2002:a05:600c:4584:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb887e266amr96247485e9.1.1795215560370;
        Fri, 20 Nov 2026 14:59:20 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm125915915e9.15.2026.11.20.14.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:20 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Fri, 20 Nov 2026 23:59:14 +0100
Message-ID: <20261120225916.158641-2-ansuelsmth@gmail.com>
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

In preparation for support of .set_rate, convert the clock register
logic from fixed clock implementation to full clk_hw implementation with
dedicated OPs for Airoha EN7581 SoC.

While at it also rework the en7581_register_clocks() function to return
error on clock register fail or on allocating dynamic memory.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 88 ++++++++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..8c00646ecdc6 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -126,6 +126,12 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+struct en_clk {
+	struct regmap *map;
+	const struct en_clk_desc *desc;
+	struct clk_hw hw;
+};
+
 struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
@@ -741,46 +747,76 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
-static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, void __iomem *base)
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	struct regmap *map = c->map;
+	u32 val, reg, rate;
+	int err;
+
+	err = regmap_read(map, desc->base_reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
+			desc->name, err);
+		return 0;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
+			desc->name, err);
+		return 0;
+	}
+
+	return rate / en7523_get_div(desc, val);
+}
+
+static const struct clk_ops en7581_clk_ops = {
+	.recalc_rate = en7581_recalc_rate,
+};
+
+static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
+				  struct regmap *map, void __iomem *base)
 {
 	struct clk_hw *hw;
-	u32 rate;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7581_base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		struct clk_init_data init = {
+			.ops = &en7581_clk_ops,
+		};
+		struct en_clk *en_clk;
 		int err;
 
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
+		en_clk = devm_kzalloc_obj(dev, *en_clk);
+		if (!en_clk)
+			return -ENOMEM;
 
-		err = regmap_read(map, reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
+		init.name = desc->name;
+		en_clk->map = map;
+		en_clk->desc = desc;
+		en_clk->hw.init = &init;
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
+		err = devm_clk_hw_register(dev, &en_clk->hw);
+		if (err) {
+			dev_err_probe(dev, err, "Failed to register clk %s\n",
+				      desc->name);
+			return err;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	return 0;
 }
 
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
@@ -1060,7 +1096,9 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 
 	priv->base = base;
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	ret = en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	if (ret)
+		return ret;
 
 	val = readl(base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-- 
2.55.0

