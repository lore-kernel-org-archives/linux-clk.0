Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269500;
	b=Cn/GI3//ajg9PP3iU0WvldWYHDyMtUEf/EzLo55WOLr9sEkZtv3q3k7AqcDdcNhdPdOx
	 t7LvQxrj+b52A4BsRKRuY1pFkV2bX9haazxugTBeaYrj0BW08/LuGUW7lzqsCQxcB0w1q
	 B9M9vbi8MzwbmdKSzkA7rw0lymLoMCKOsPQHxNLbQGSclri+hruSQjPor5IwXH1fm5tsI
	 t6Nme6u7p795hXGaADnc7bFpIzvag9oucXCGOCHWpwiOPtuk0Bs9kIlLXtU4ArfKxscsh
	 JO8gwvr4pi89F8YruBecHdyaRd8EQLFS2XO5fF1weNVRQYb/vGiXWKm4KMprVeoGuaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
	b=BFS5omw4VW19XUEDoNppgEYDUaFn7EAkaKTFvasqMstlzLwOzKbdPs0fcK3DgpAA2U7L
	 W1qO8A/8nYZERfapUmGsYgAABGvmznMs0eeqFOghJs/wJvQBB0ZgnimEsRyxlNRJBMPyU
	 MX6zBXvimhtK3pm8PnR0Ftj3XZdiOJMm2tzdQVm8QzSG0LX1qWEfHOlcYuRoZK9K0/c9v
	 Xz5/glPkbMITmfDmRMRYGE1A2Tp/uBCVlUP2CKoKJ7r+V2mkkjxscIN7xygvIAoyXTYv/
	 CCnItEo4VZWz+0B1wODPKX3+DUl2BZfIWmJCPrH3bhf/tZFid+tO2T+2wzy8cntQoQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ryaoZYZ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4660A2602
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B4660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ryaoZYZ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1003063f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 16:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269498; x=1794874298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=0ryaoZYZO76rs+nkoNW8Vyy8na1ii1EZ79AC9v/cHDQGiLWztsFXo4QBiE6trf6NEi
         UEcMUhUs8zqJa7IB4/eEBXbmYXcUoE8MEh38erix/CELtdhm7PyMthJgJWGQei0zYaJP
         vFgR4NLvlsnMvmNvrXs/1CKsmidFbnkT5z5LqY16aFjY/7XeIGMUv9pPF7/h4040wrT/
         OAshmsqCwnWJdq57GXzFeSrrJXTeVTjaiAuCAcZJy/udtKuFy9ORTPTL4NSc92s0rLIi
         NZUkB27ojw8m3NHg71utQfDJ7KUix6j2y4dHhJvd29pwhTMm0wjt7fb8Gt0ueb1kip76
         fW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269498; x=1794874298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhfC9zLe5HZoGXWudWFtnEm8q0utD3cNm8ZYGhH+ONg=;
        b=w5EbHtpVHf0xomS1WdMqwM7HVyTgDz0A8Fv2NPc9hEVCQqEGNZvT530VmvSj4RfKCO
         U5XE3qS9hQzdy2ZkbDTa9i7C6yYL2Vg1Tzfoj/lea1Le/nePReQ1q3m+gkbJ59N448xZ
         SlvHeZicxiYolmt0C8DE7+a5jTBHKqQz9ph4aoq8BOuPJxfqUiG/UJn8xgNVtoz1HG+q
         XXBmXwtCkFhqpObtKvVLp2ivv9IolVYRkXOSNpRuK9epf9E73kRxGwpF8a+9ey53sSQQ
         /kTZkhqy7DYwV0Ff9XE8GYBWUw8bqIeaeB6GRe3WpfJ/Ztv0Cbv8zK6pAtT/xQIjOuVY
         6B7w==
X-Forwarded-Encrypted: i=1; AL+hErFOCqHjvZusZ7rse2FTuc6KEMLl/lP7Wrd34YHNWKS7cWY03OgfuxeAYV8bxM2vZaPWhtAA84uU0YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0Pp/fVQSpKfhL1I/JXutV+PMuLYtbHdBepmft6p2oc4l+h+cm
	zvYGC8IGb03zMOXDHDUD49NjEs1154Xq9MwemEOT0YgkX3z6YgYlvb23whUmHg==
X-Gm-Gg: AYBFou03NFDJ+rDdINAnfytdkWDfe1rMYpsW+0y+jNffigYLWeVGFb+m9DrZfEsyhoZ
	3GeI4U2MvzU+ynivSKLsjOxabITLG7xOEpdjVQvhni5IA5rfcM7YaLFi+WWZ0+krrdYXrTPQsK6
	RBXelaJnivlFlmSo+9vAzO6jdDJnQYZgk7W5bQ8/T/xU+bf+oxN+YOPQHinXmoVTBgupJAKB39Y
	HXautTatVcn/WgOrYL7t9cGRWu1P2DVDLb5bie57fZWz+yu8yjar4hh00lTQ0mJTmQ8TzCwYnfa
	8qUGk24ezmyQEsS4ufGYLXeiZS5b/0UbT3OwI//B1WQ/kBp0OOMoHNjO8Lt37+q8RbnliAImUXt
	KUMsISiEpxcCANe+JVIlZmn1Cf6KAhv5sTUC076CIhWOeJpQgH8s5tiZJ+qPkt2nip8Tr6jplRi
	b27hen/xTHqaoK/MwA7T2uYsuTGrjx69HqW85xGhdYOWOEldEuQ275ujffD04YOxbWgcDZ5V4m2
	txxqrU1dsidJovW8HSYQh1WmvZblL/P44CLxynPfKcnrsE33nwLvVV0GBZgTSFqk+SqBYjXPtAo
	IS/23aWZaOv747O2eu9mTUOzd7v2kVl7X2gkFcwg9BkOlfRrlKdYfPfzWc0CV9ETUxrlFqwaL6W
	Wp6a8Cy4hIsmySSXS5KF9l2wbMgP9ahUkXN1KU+M0/xOWfwTVp9c=
X-Received: by 2002:a05:6000:2c13:b0:491:286f:8e56 with SMTP id ffacd0b85a97d-49830b979e6mr1412170f8f.33.1794269498133;
        Mon, 09 Nov 2026 16:11:38 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm1779366f8f.22.2026.11.09.16.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:11:37 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Tue, 10 Nov 2026 01:11:26 +0100
Message-ID: <20261110001128.1041-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110001128.1041-1-ansuelsmth@gmail.com>
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
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

This is just a rework and no behaviour change is expected.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..6640e814d36a 100644
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
@@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	struct regmap *map = c->map;
+	u32 val, reg;
+	u32 rate;
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
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
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
+		en_clk = devm_kzalloc_obj(dev, *en_clk);
+		if (!en_clk)
 			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
 
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
+		err = devm_clk_hw_register(dev, &en_clk->hw);
+		if (err) {
+			dev_err_probe(dev, err, "Failed to register clk %s\n",
+				      desc->name);
 			continue;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
-- 
2.55.0

