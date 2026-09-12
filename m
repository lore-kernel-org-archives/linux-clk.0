Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7913B58C
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789172613; cv=none; b=QnZI5fuBjjaV1M3G+kbur3SGmFT5OaUetnfWeft7sSGU+wkvyFL8Ke9eJcfVTfggghJ1Cbr5lJeAvL8elwaHfmHQF96sabhYUuSnklh1QnfC58hC3kHvMPTmpg0JN2Uilj/zbURgmo2v1PGuWNTvvYcSuH3//qimDfJuQ5V5W74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789172613; c=relaxed/simple;
	bh=0nPcm+58pJfEAXygSakPQx72e6W/l6Dp/b8T+CvBjD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k31jAfr33Fy2a9Xuyn5uivmfaeavA9sOxzcfnfM1D1o4mfOkIa273Wh9FeIn2vkK5RfmsBU/5RzKjnhgRPG0dWXOr9cTSmxTXaB1q0v767xZXMIX6LhrkUMxtRUTRW9DqprBEs3ZGfzAnzHdqZ372aNzQYW8GSISPCiL9w13X5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ0KvVJo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ0KvVJo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d715f4a587so20198245ad.2
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 17:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789172611; x=1789777411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eigGeAMP83LxrsKBiSA2Uv71rHDhlLqddwKc16SH2gs=;
        b=WQ0KvVJooAObOPgWZunfr4YKCQ7VUR3DdhiM1jrbU49c9y+W2x+VKHbj0880qjB8xO
         TH90u2cwGdR9jO2sDgrX35/l5+tl4AM8D9VZRgNfPpBH8Rne1QUZPrK6tX+ysBY+LPR0
         RrUOCUNfgotX0hcWg/vMqRi/iNz0MnzRd+tZdo/vC4LQ4pIaEtF2V6GEFzxQsy8v0kBu
         JPUbHF+dgds0fxBTEEJQ3JtRl5t9Flk4uVYtn7W731tKmDdXo7hX6IZL2tSj14IA6Oc+
         0NOiyixns9q4hn+/k0eSiqSaYV6aHPXazkPbo91nqWMx/Y2EG2bt+JyD9qYZROZe5wia
         mUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789172611; x=1789777411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eigGeAMP83LxrsKBiSA2Uv71rHDhlLqddwKc16SH2gs=;
        b=BGhzy//C5RfE7AK68phkBNYoKIZPC4xCxzVjHobmDb51T1UFTm0BfLliCePEkB5v1t
         w4NsrzL7pSeroTSG2BVtArpLdGmYN01Bzv0YvNHVRVewpDDLQcfTEvnrcdHrkcx+ZM7y
         6y4hR3G59X5RpzTFgicY48mavRRCVgpe6axXgUtTTMp1GTyqDJMPDtpT5x8O5LuNRvTF
         6FZtqVD2ib2nPJCA2hlLZpN9gqesJQMTPz8jXeug+JLe7BnHCL/R4/wrQF04CoHy2AkQ
         puQXOqg2fUDSQq7J3uIRVyh7oHYZfbJO/zN5FfRAOZhR84woGm+SXlkceXdoWWrN6QuI
         k+FA==
X-Gm-Message-State: AFuF++n6tvXX7MCbB708w1Gwx2H8OKYvPHVTkklxP+23yoQSkCyDZUiW
	yvycj7aHyCWz30umjurbspEYs4pWWNLRYMufEvgxUIG+Mm5cjpbE6DTpxN6m8Q==
X-Gm-Gg: AYBFou2mFcSHBlZBTWe/wTe+bWeLdi2rPVzTDf/CnwMqIHXvC/AQMrq8C/6b5zJA47d
	9j3+N4xMsTcXmr2L41ZmsxT/08jvdJxlyvNbCno1GWuHRMLzACRhiyLR70SqLlnESSHaKI/U/I4
	xk3ZkjYQgdQLdhtot770ns89IWiyWlGUiwjlCoJiUCD5vg0YPQ4WCrKZE87uRRnVNS2pj01DmS+
	rclrKQEPMYu5kJa1WgPWCZV3tZm5vZqMawa+tgaPoU+9KKDYRhqDY8ur6pn84CreVYZTHMdrULW
	HLPtYtFC9+p/eWewXPD9rFM1P/nh1SY28aEBLYYzvRIfX6hTO/FHO3fX1BLz6NEvecqgU1OZ5f1
	ITkqnoO67yuUGuYnwAlEac+nLjuXdPOpy6F25tZ14uf/ePfxzNsH/9XlAU4UlHatwvHps6gJHnS
	yINz5r8Ml4C1zw2VAwZli/kFnWe8xCSR4bTVPyHAX2S2s5MBIwZNFgXRp8lRQEwV8FdMunQWUDY
	pIb3gk4F0Y4qR32ylHXOuRnsZmcsrTHof4ZQLzimPUxr3EHxtd32pMKCN5Ubaiq5RuKrn5oYs7D
	eYKHjtLldjYpTYH3xFnoQh5ynqDPPejcNhftwDRJiJ3sMcTj
X-Received: by 2002:a17:90b:270c:b0:39b:a8d8:985 with SMTP id 98e67ed59e1d1-39d9c0ad3edmr11221696a91.12.1789172610740;
        Fri, 11 Sep 2026 17:23:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff6780sm17510475ad.76.2026.09.11.17.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:23:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NUVOTON MA35 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] clk: nuvoton: ma35d1-divider: simplify allocation
Date: Fri, 11 Sep 2026 17:23:26 -0700
Message-ID: <20260912002326.237419-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member instead of kcalloc + pointer that is not
actually const.

Simplifies allocation slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..6eaca5b35dd8 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -17,9 +17,9 @@ struct ma35d1_adc_clk_div {
 	u8 shift;
 	u8 width;
 	u32 mask;
-	const struct clk_div_table *table;
 	/* protects concurrent access to clock divider registers */
 	spinlock_t *lock;
+	struct clk_div_table table[];
 };
 
 static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_hw)
@@ -83,30 +83,25 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 {
 	struct ma35d1_adc_clk_div *div;
 	struct clk_init_data init;
-	struct clk_div_table *table;
 	struct clk_parent_data pdata = { .index = 0 };
 	u32 max_div, min_div;
 	struct clk_hw *hw;
 	int ret;
 	int i;
 
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
 	max_div = clk_div_mask(width) + 1;
 	min_div = 1;
 
-	table = devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERNEL);
-	if (!table)
+	div = devm_kzalloc(dev, struct_size(div, table, max_div + 1), GFP_KERNEL);
+	if (!div)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < max_div; i++) {
-		table[i].val = min_div + i;
-		table[i].div = 2 * table[i].val;
+		div->table[i].val = min_div + i;
+		div->table[i].div = 2 * div->table[i].val;
 	}
-	table[max_div].val = 0;
-	table[max_div].div = 0;
+	div->table[max_div].val = 0;
+	div->table[max_div].div = 0;
 
 	memset(&init, 0, sizeof(init));
 	init.name = name;
@@ -122,7 +117,6 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
-- 
2.55.0

