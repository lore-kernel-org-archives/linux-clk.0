Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2243AE6E5
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786649; cv=none; b=SV29QaqQrCdDYg7WggHxFctNt8dzLEdRkNtd/2NsjiMkgbVMbsaq/6+Jddzu89FOYf7Vq76vcd8QsymgUTo1c/YyrsxAw7XgN4NRRhjX47Q39uxjDZccLWi3J5PZrem3OlgZG0wf1t6HceJ5p5k2BVxtrOU3M3m3WUJu5yl6voI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786649; c=relaxed/simple;
	bh=DIC6OCNj7W0ie9aWmsBbkazgykPqmbs95QVc83oRswE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBic5p4d4xV/li4DOy//e6Lg5WmPRdTXgkWjaABdZIzJZNYy/9Yju9eFPXeuezi66FVTJX8z5MEL1krvNH5HIyfXM595Gs2gYNvfN4QbqH9erGfXqHt+F0HIxUkLMNXy/O4HB52SxYwym+tZw8nYwzskhbSK3tSWPDWQSL+m2u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMkDLIV6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMkDLIV6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8d2574fd9so3788245ad.1
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 23:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786640; x=1792391440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ym9pmTvHGCvGzIEIbpXI+Ln1kCI6J80Q0tQm6YawUg=;
        b=VMkDLIV6ud3CAWLFqKRoklpYVzeBtDG32BNqek2g89HOqTDVDFYvXG9ap1+FBUcrWG
         RV1IUGT5LyV7RVOujKX0Ssnjnfnq2Z0PqybPi6JCoCXI6QvfM5ORQUP8kHqFwRYixwAL
         FA1FGxlC+WFGMIsCMM1tcLSg+afYRw9b88jTWq0dvej941Y7ugs0jYrtrzAT3rM0OWHy
         NCq866a31OZ6qhhBk/bkuHqR/dvWo3+Jd54qsX1/5uIJgy7TmPVo5tUXw2YjDe2LPEz0
         Qk1Uwx2pOXIGV2DjGuZzRmGm+2079DEhPkPnFsySuurEgcyAYb7YZW7URPtpyrXpJFIH
         ZGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786640; x=1792391440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ym9pmTvHGCvGzIEIbpXI+Ln1kCI6J80Q0tQm6YawUg=;
        b=BLyGNpiHWFsnEVe5O1V6aRFFu9TR9BPQPMHvLIp5xTEg7zQzJxd4KrdFs8ncCQWT6d
         kc96V72fALn2skD9dsI/NpdmaJGN38stmFpLJVB12q/kZVfCtLtgP66EOyRf0I+ukGqD
         XZKUacEN3O7mc7dktbQoje+QuayCGGGY5pOOrA7OhCWdWq23o/A18yjAUOAEf0GQOkeZ
         502lPSp5phLwwRAkEc90gvI5tJJWP7a74fKC7rsMhMb7G9Ergw55w/HhzcpLaoKeuJbo
         KPHN3iQxtgKjnW5fDAIQtDqGlMxS6cfSOX5ihRHpmaLATPkXbgueWIxhRtzLAaDM1VnN
         9enw==
X-Forwarded-Encrypted: i=1; AKwUvBxexa3D/0JDpoQilZajkWWw3GBWHHQ2AyBUYCdoupAlEslQhfBUiPMKadhIKgOfkTGkRFAQezzMINM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgk5764Rm9C7c7QzjTifK+zsMtD73+6S9MniKcUclz9yE7xbse
	kt0OyJlBhGQACNWSycB0wSrxo4s+ItbYF8Wim6X0HRKVjhe966HNiEyf
X-Gm-Gg: AYBFou0MyH6HpfCLwr9jK60FnqNVgVlrdT0D39tvh7KpRhKiyGx8eNifhI8moMTeL35
	k2J8GlRhqj1ZonatJa82+7sWqyJYD3yrHgwp1/4120IO2ayQ7bRsfxfttaQDJzjVySfa0AomQIU
	U7vZ1iZtdzJTD2ZyeqrOJiDHMdV0ObBWTvGe1KVqUmcraM4/uU95PeswB/eWtTDbV4STQTPZ41C
	/P92f8jugSQF+cYpe2mVRqurqJOZRXJtUTvsPHIuKmrTVKEkX0qq6LBhys1ic8gqt6QqJLS5i9c
	wiEEJMa5k8at65Wv3Nek+qD1ScBqTuUI33/dmkX+RyjbGDAWrtyZFsKNzHq00xH6YYwfv81P60J
	O/05pjsU5u0tRnVZWoVYGSXyzhiO8hB0yXntWaf7+o1Ja5CXEUvZ/AbUYNuo03SZbAUDBl6jsCM
	x0pewl/f84FG1duqtp7W8D9PYX7Lr/ldMfkCv8IxHkR/uFXYWGPpKC/E9liSURdhXCx3qD0g3kn
	i6ZwvT5PeUug2ZShsl5UTx+ZTolHi7PURYzsPozHUAT9OwYIos29dOuyEqzu3I=
X-Received: by 2002:a17:903:15c8:b0:2e2:dc6c:a6d6 with SMTP id d9443c01a7336-2e842aa60cbmr66919225ad.16.1791786639721;
        Sun, 11 Oct 2026 23:30:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:39 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 3/3] clk: nuvoton: ma35d1: remove the unused ADC divider driver
Date: Mon, 12 Oct 2026 14:30:20 +0800
Message-ID: <20261012063020.3331443-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012063020.3331443-1-a0987203069@gmail.com>
References: <20261012063020.3331443-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC divider is now registered with the generic clk divider, so
clk-ma35d1-divider.c and its ma35d1_reg_adc_clkdiv() prototype have no
users. Remove them, including the divider table it built with one entry
per possible divider value.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/Makefile             |   1 -
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 133 -----------------------
 drivers/clk/nuvoton/clk-ma35d1.h         |   5 -
 3 files changed, 139 deletions(-)
 delete mode 100644 drivers/clk/nuvoton/clk-ma35d1-divider.c

diff --git a/drivers/clk/nuvoton/Makefile b/drivers/clk/nuvoton/Makefile
index c3c59dd9f2aaa..3d95466e69b9c 100644
--- a/drivers/clk/nuvoton/Makefile
+++ b/drivers/clk/nuvoton/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CLK_MA35D1) += clk-ma35d1.o
-obj-$(CONFIG_CLK_MA35D1) += clk-ma35d1-divider.o
 obj-$(CONFIG_CLK_MA35D1) += clk-ma35d1-pll.o
diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
deleted file mode 100644
index e992e7c303419..0000000000000
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ /dev/null
@@ -1,133 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2023 Nuvoton Technology Corp.
- * Author: Chi-Fang Li <cfli0@nuvoton.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/device.h>
-#include <linux/regmap.h>
-#include <linux/spinlock.h>
-
-#include "clk-ma35d1.h"
-
-struct ma35d1_adc_clk_div {
-	struct clk_hw hw;
-	void __iomem *reg;
-	u8 shift;
-	u8 width;
-	u32 mask;
-	const struct clk_div_table *table;
-	/* protects concurrent access to clock divider registers */
-	spinlock_t *lock;
-};
-
-static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
-{
-	return container_of(_hw, struct ma35d1_adc_clk_div, hw);
-}
-
-static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	unsigned int val;
-	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
-
-	val = readl_relaxed(dclk->reg) >> dclk->shift;
-	val &= clk_div_mask(dclk->width);
-	val += 1;
-	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
-				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
-}
-
-static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
-					struct clk_rate_request *req)
-{
-	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
-
-	return divider_determine_rate(hw, req, dclk->table, dclk->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
-}
-
-static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
-{
-	int value;
-	unsigned long flags = 0;
-	u32 data;
-	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
-
-	value = divider_get_val(rate, parent_rate, dclk->table,
-				dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
-
-	spin_lock_irqsave(dclk->lock, flags);
-
-	data = readl_relaxed(dclk->reg);
-	data &= ~(clk_div_mask(dclk->width) << dclk->shift);
-	data |= (value - 1) << dclk->shift;
-	data |= dclk->mask;
-	writel_relaxed(data, dclk->reg);
-
-	spin_unlock_irqrestore(dclk->lock, flags);
-	return 0;
-}
-
-static const struct clk_ops ma35d1_adc_clkdiv_ops = {
-	.recalc_rate = ma35d1_clkdiv_recalc_rate,
-	.determine_rate = ma35d1_clkdiv_determine_rate,
-	.set_rate = ma35d1_clkdiv_set_rate,
-};
-
-struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
-				     struct clk_hw *parent_hw, spinlock_t *lock,
-				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit)
-{
-	struct ma35d1_adc_clk_div *div;
-	struct clk_init_data init;
-	struct clk_div_table *table;
-	struct clk_parent_data pdata = { .index = 0 };
-	u32 max_div, min_div;
-	struct clk_hw *hw;
-	int ret;
-	int i;
-
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
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
-	init.name = name;
-	init.ops = &ma35d1_adc_clkdiv_ops;
-	init.flags |= flags;
-	pdata.hw = parent_hw;
-	init.parent_data = &pdata;
-	init.num_parents = 1;
-
-	div->reg = reg;
-	div->shift = shift;
-	div->width = width;
-	div->mask = mask_bit ? BIT(mask_bit) : 0;
-	div->lock = lock;
-	div->hw.init = &init;
-	div->table = table;
-
-	hw = &div->hw;
-	ret = devm_clk_hw_register(dev, hw);
-	if (ret)
-		return ERR_PTR(ret);
-	return hw;
-}
-EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.h b/drivers/clk/nuvoton/clk-ma35d1.h
index 3adee440f60a3..06300511987ae 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.h
+++ b/drivers/clk/nuvoton/clk-ma35d1.h
@@ -10,9 +10,4 @@
 struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const char *name,
 				  struct clk_hw *parent_hw, void __iomem *base);
 
-struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
-				     struct clk_hw *parent_hw, spinlock_t *lock,
-				     unsigned long flags, void __iomem *reg,
-				     u8 shift, u8 width, u32 mask_bit);
-
 #endif /* __DRV_CLK_NUVOTON_MA35D1_H */
-- 
2.43.0

