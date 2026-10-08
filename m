Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C603B9616
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441813; cv=none; b=YeqzVr4TceBGmgDJVOVt2g4h2tC3EbW/o+IKPuMWYsFoNZxQDwkVNh1azDEdgjDqDl1swn67Lb7D6eBFP29+9huliCjWSkGPSdKS+h8WUzFuUgJBGkBz8eKQG41IQ7hEeA7X/SgTbyiQ2JV6od+egvo0/11q2+ns3hlElvgx4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441813; c=relaxed/simple;
	bh=HnGgah0wBuNiHykmKHpREb3aXBADRquza6/DXRMn7Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czWDeMqhXzydPBQOUiX5tj8ARrPhyvOgCRC3L3LO9RmvLtN69ZOHPyqe+VuaQvZMq7WBmWqmtjZBrq3gv0ZkxrgwA/6Tv+ka+7tGwxqdPW/YPb81mWSFkWtcRRZARPnGZkwFa1YnFq7pgZKV2uo1kcs3yLzDG36C9zarQFOR8O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ut1bfziO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ut1bfziO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd9ec41bc4so17214555ad.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791441812; x=1792046612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAIjG4ZIMr61qlNuyGnhP301Ha6G3tgAGGAQLhPz8L4=;
        b=Ut1bfziOWOfNYQDjhwkMVuftq3E6WaBvKLA99+FEGa/qPOvofNGWdKO+jrUD/xvreQ
         HfU7BqDyIdDX/ihBIAHkwThOhlnXKcwMa4agONtO+xxFxQaSaVVbJKk03cEqD1DJhDWz
         ZstyP/ISYYBZHKe4cKpRPMESkDbNarCd9zBZEcHthO6/e1t1qosVDEL6BDtd3qkx2noF
         N3bxEw+AKDUt6QctLNfeNQ6xOfL2pactr/SV54W7GCrvXFRfXeXGquap8D6gwNDPpU9/
         h16aq7pbJHvYWecuCfJ2SBXeZgPVS3flZejl6AeS3xDqYyAygU9zMjDZ30xdPUfWKqJO
         Dyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791441812; x=1792046612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAIjG4ZIMr61qlNuyGnhP301Ha6G3tgAGGAQLhPz8L4=;
        b=DMkUZ0E3XPVYIHyIsveEyhDly5pvnAYQCY/AfNscjNg8FMLUIWR/aYycBdRt5QSKl8
         KcO3YZ4wQErlQHLXmCEMUx8zvaUh5+LctIVt+acZAZBYMBMMb/88i+kUjFa9CsKgZjPs
         2WVUJH8QuFdwaX2qZH5fChTN/OSVGkG8YZcqzhUG9ONyk+J7B8dlw9t7y/E+1ys8Be+Y
         V2/7/tsQVAJxvYa8A8dqqeHjeC+BWp0z3YpHLWGeC6oybvekx6RDruxhL65E7sX/rx8u
         1zyuYKzLO+xyahc/5Tfjj/UbpF4LLaEfrnBR/+qUFRX+2UiSl+Ur0EeO7PufX2Pzjs2c
         DB/w==
X-Forwarded-Encrypted: i=1; AKwUvBzU4B9MCUaeRyg43S818eAtCsarNrLgT8f+HvZgJv9NpPjdP3WHvHGzhORU9Nh2994VVI7Dvy/ec3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4/nBUQ3Pc1QeKI4QiqZAYnQXCgN3Wi2ko2weuJVcR9J952kMW
	dpg6pqCHuTl8QyVVjLHzzv1AslnTuvSTKzVdneCo1BBotvU4rvzQmg6A
X-Gm-Gg: AYBFou0ODcZuTw5D82KZhBqnO6vk67/3OT9XcJQ20mioB63x5Op6AZaUtE9q1dEceei
	Y2KejmN734lY922LMmPeu4uYf0w4Ww8ckwlDEpG/Fxg0ZskMXJfrT8aR2ocV3cFLkQkpPHvdsJm
	uIkJmJ/4kk3+W1RJP46VRvDGaHwK1ixVWduO8Ew50xHZXnkedfVZhySvsb2Cftj3DjRLv/xwScU
	DdHxRawNv6YkVU9AOJzMl4HLEnSzioESHmYCNYqY8d5JTNcy6euHKIfSEKCFcXX7YPnm5gvg+po
	zSunp5jmcoxoS6kLOVOrKhR4qoIK+k+fVtoMi+f3+CIuLtO25FddY3n5GgSxtnz0VkknbIrWJJ3
	7Jt9tbq2GVGBijOxTrq8KB0VMj6/V8DSXtodulngUyiGSGcV7DDBWzthxf537dKos4TYziaw+Im
	tPLK07AZYF6icYgqGxLL1Fl0+LMTOH8v9xMKmArst7ZffjW8+pRWiF7o/X24LbvwvbKYpC5BqAJ
	vEcEjyYK+uxRadc2mR+uBRstWRuM6JMQkhrXTloiAKfCOlDTPROZgoNpCMxYiE=
X-Received: by 2002:a17:903:3c6e:b0:2e5:3451:565 with SMTP id d9443c01a7336-2e6004e63e6mr38271205ad.33.1791441811505;
        Wed, 07 Oct 2026 23:43:31 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046feacdsm19997845ad.18.2026.10.07.23.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:43:31 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct formula instead of divider table
Date: Thu,  8 Oct 2026 14:43:07 +0800
Message-ID: <20261008064307.2757324-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008064307.2757324-1-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
which was previously modeled by building a clk_div_table with one entry per
possible divider value (up to 2^width entries) and feeding it through the
generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
helpers. That is unnecessary overhead (a large table allocation and a
linear scan on every rate lookup) for a relationship with a simple
closed-form expression, so compute the rate directly instead.

Drop the mask_bit/mask mechanism as well. The previous code unconditionally
OR'd an arbitrary bit into the divider register on every set_rate() call,
and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
rather than a bit index, so BIT() shifted by an out-of-range amount, which
is undefined behavior. The divider field write already clears and rewrites
only its own bits, so no extra forced bit is needed.

Select the divider with a single helper shared by determine_rate() and
set_rate(), using closest rounding as before, so the rate promised by
determine_rate() is the rate that set_rate() programs. The helper clamps
the divider to the valid range and avoids overflowing 2 * rate for very
large requested rates, which would otherwise lead to a division by zero.
Reject a rate of 0 with -EINVAL.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 79 ++++++++++++------------
 drivers/clk/nuvoton/clk-ma35d1.c         |  2 +-
 drivers/clk/nuvoton/clk-ma35d1.h         |  2 +-
 3 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c303419..12a946c989e97 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
 	void __iomem *reg;
 	u8 shift;
 	u8 width;
-	u32 mask;
-	const struct clk_div_table *table;
 	/* protects concurrent access to clock divider registers */
 	spinlock_t *lock;
 };
@@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
 
 static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
-	unsigned int val;
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
 
 	val = readl_relaxed(dclk->reg) >> dclk->shift;
 	val &= clk_div_mask(dclk->width);
-	val += 1;
-	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
-				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
+}
+
+static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
+					  unsigned long parent_rate,
+					  unsigned long rate)
+{
+	unsigned long max = clk_div_mask(dclk->width) + 1;
+	unsigned long val;
+
+	if (rate > parent_rate / 2)
+		return 1;
+
+	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
+
+	return clamp(val, 1UL, max);
 }
 
 static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned int val;
 
-	return divider_determine_rate(hw, req, dclk->table, dclk->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+	if (!req->rate)
+		return -EINVAL;
+
+	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
+
+	return 0;
 }
 
 static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
 {
-	int value;
-	unsigned long flags = 0;
-	u32 data;
 	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
+	unsigned long flags;
+	unsigned int val;
+	u32 data;
 
-	value = divider_get_val(rate, parent_rate, dclk->table,
-				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
+	if (!rate)
+		return -EINVAL;
+
+	val = ma35d1_clkdiv_get_val(dclk, parent_rate, rate);
 
 	spin_lock_irqsave(dclk->lock, flags);
 
 	data = readl_relaxed(dclk->reg);
 	data &= ~(clk_div_mask(dclk->width) << dclk->shift);
-	data |= (value - 1) << dclk->shift;
-	data |= dclk->mask;
+	data |= (val - 1) << dclk->shift;
 	writel_relaxed(data, dclk->reg);
 
 	spin_unlock_irqrestore(dclk->lock, flags);
+
 	return 0;
 }
 
@@ -79,39 +99,21 @@ static const struct clk_ops ma35d1_adc_clkdiv_ops = {
 struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 				     struct clk_hw *parent_hw, spinlock_t *lock,
 				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit)
+				     u8 shift, u8 width)
 {
-	struct ma35d1_adc_clk_div *div;
-	struct clk_init_data init;
-	struct clk_div_table *table;
 	struct clk_parent_data pdata = { .index = 0 };
-	u32 max_div, min_div;
+	struct ma35d1_adc_clk_div *div;
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
 	int ret;
-	int i;
 
 	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
 
-	max_div = clk_div_mask(width) + 1;
-	min_div = 1;
-
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
-	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
-
-	memset(&init, 0, sizeof(init));
 	init.name = name;
 	init.ops = &ma35d1_adc_clkdiv_ops;
-	init.flags |= flags;
+	init.flags = flags;
 	pdata.hw = parent_hw;
 	init.parent_data = &pdata;
 	init.num_parents = 1;
@@ -119,15 +121,14 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	div->reg = reg;
 	div->shift = shift;
 	div->width = width;
-	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
 		return ERR_PTR(ret);
+
 	return hw;
 }
 EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517a..f91a8369a2bc7 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -1017,7 +1017,7 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[ADC_DIV] = ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
 					     &ma35d1_lock, 0,
 					     clk_base + REG_CLK_CLKDIV4,
-					     4, 17, 0x1ffff);
+					     4, 17);
 	hws[ADC_GATE] = ma35d1_clk_gate(dev, "adc_gate", "adc_div",
 					clk_base + REG_CLK_APBCLK2, 24);
 
diff --git a/drivers/clk/nuvoton/clk-ma35d1.h b/drivers/clk/nuvoton/clk-ma35d1.h
index 3adee440f60a3..1fdcd4658b5ff 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.h
+++ b/drivers/clk/nuvoton/clk-ma35d1.h
@@ -13,6 +13,6 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 				     struct clk_hw *parent_hw, spinlock_t *lock,
 				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit);
+				     u8 shift, u8 width);
 
 #endif /* __DRV_CLK_NUVOTON_MA35D1_H */
-- 
2.43.0

