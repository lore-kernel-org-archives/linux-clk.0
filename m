Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF3425CE4
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330359; cv=none; b=ENlOtBPFIBU1Pp2eKt9L3mmL7fYam+slIMEjIss0GfZTmeIYsm1BWDfiBXUuDOEtlGURvD4p1EklfoCTBiBQiNyoVxtwbQ5EPN9hnrq8kImiJjPdsPAKbHgwVttUxJOugwl2XnSeHT+mKFC/WmZsSsBeQG9c8rvjLmCqu3I4W1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330359; c=relaxed/simple;
	bh=0wL9DFcZk2JYigmbAzm9ZXDoHfKQS3sFzWW4YpBPgNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IlF2adnV9Yhre+YXksiq1fI9xOJDNZ5olOy8myLNtyqViXKHEBo/yX9jXQObYdPMfEfottt7CyuzNteV6YlwJE4m79mRtc7hrEGfZgQvOYPEUV+wPxZqgIumItsCwLx/Izdc31n11+lawpX/aGrSeE8BwdMn7NMz24aqUJEv7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S37kx95m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="S37kx95m"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b1710405so16765325e9.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 02:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330353; x=1783935153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=S37kx95msxJaGoT+W6QX8zv6JZ3pD6eP2P714H+3zgFgeJiDeVVg4RfhcRrkUr7Pr7
         UriD9Z4PPgX/tPhpp/VTOUwWxrB218T1UDHrgTYmQEEBpaPStv+BoCj7BO+0xvL9fxrT
         +27BvdNqNlWF9zw6YcYIExLF4MagtNzBfKCdzX2U/p5PB/LB9yGvwP/mCFE333Yacc82
         jGxrd4ybZMsivrH3Y9waD0gyv6xu7DHloVb0BV9vYETRcpQlp6ZgnDvxrhXY6JaFWobJ
         IF8SC8EzYs1S3sj1D2YxOU7dHovsg0NS6U3QPVwNMgkIbfCn3sgmsokGYZgf+bKDeJtY
         eIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330353; x=1783935153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRVceNWKrizopvzD3aCqIwZgJOVArB+G3JrWb7+Dpwk=;
        b=DNZyyvfXuuD07Uk9pOLn/qW/WTWRSVCTev9+9/thNWqrPlQuO65U84jxhZdJ01iyoo
         x+N92VEHM0yAhUu6Gc4cx0GGjCWIL6lY+fI4+9F8eZg6ae1SYhWBF2T7dtlCbxv3bvE6
         8dlcTKXt3+qoq5Moh9UV1NHS1sa0YbfLZEEwxBqPsYkXgEHownAAL7eaqiZk31c+vL5s
         FAIDmax6Wh3aNhK5a1flub1VXOy1/DSiyqKVrWuV3elz5rj03xBVVMft8WpapNEE7t6+
         7jOClaPP3Ox9lRipuREwr4+AMQJmpyx3yXhamgQNjIB1ilYS53g3lIkTLDpct6MQHxE+
         SkUA==
X-Forwarded-Encrypted: i=1; AHgh+RqKZOQyqEUV3naWhJ8ekAZD+BFZ50CCPso+n3abKu6MdKgiPGYpQAKOFKi3cE8GKf0IrHvxG+V16lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxorXpW5d6Y5ZmTn5vS2TPFWv8pwORRSB/NwJtWoinM/xiNapiE
	Whhjst/6u0uWyh9Xh5Dq5UemHLQp4GUAQSfqnVR2P4FS6PyLE4xV2NGi7WSm89g/HMA=
X-Gm-Gg: AfdE7cnkRmxIZ4O7q7PqBKLgouF3UWJyJoDBsXfnBe4ZLjn91OHe/Dfnqu8QmMLYfR5
	I4LqN+qcNzcmfWQbd/7n47W63OnPtTbUc+AJJVJithYyGaLBTU7Inq9rsbkOIjphBrvoUXDKmtQ
	Xo5KNFphaOtRMAnh4VJkVs1CNnws0GqdBQpEXTWAFQUkKYl2c/2HDtqYOQvqULHKKqPosCAfSl0
	KkIxuPHDCYPJIb6xQTWgaoNYcc0xFpM1k/yV0oPFreT05yW9K+fIi3qipctIJwuK0TWgNJqkx5h
	/1vT+Lk4gNWG15yPItdLg8ECwnWv6s3+FSwRGeR5BtuGuUtyE8gAiR6/lODABmTm6s7k9+hOFVW
	i7/598kJpKiRDSJUZrwfPYqPkHybssg78DDdBu/B3dn/+apJpirLCbzqw1ti87fiqpBzH5dujcm
	DFO+PFQOBGfmc=
X-Received: by 2002:a05:600c:34c2:b0:493:d9f7:a3cf with SMTP id 5b1f17b1804b1-493d9f7a46emr40792585e9.17.1783330352689;
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f21328sm23563937f8f.32.2026.07.06.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:11 +0200
Subject: [PATCH v4 3/9] clk: sunxi-ng: fix ccu probe clock unregister on
 error
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-3-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0wL9DFcZk2JYigmbAzm9ZXDoHfKQS3sFzWW4YpBPgNE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yi2lp9VUHi+gso0+D9KwXzeep3V0RfyNlFD
 8oFLIsmOIuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IgAKCRDm/A8cN/La
 hRUhD/43mj/jSnmTPc6rmiE4hnV86LDOF0szU0PUXIpytazGHAtIxmIDIlDKZTKCzeCtFb+X2yN
 O/s/rHXB1C+BZ9MaOlMCYM0niirJAu00pMeBFGETxKG3I8YRHs+rNdJmC6VoqYC4z0Xz6ouUuB6
 F7H4bIvuRdl/OyxsKmlj68XDBC6sEmE45CWMw3K495dkJO2MVRzo44+PdOeS2CBMGaqyMm6rlLQ
 HfcyybFMnwendBHYvURq3Tj5X7jtU2Z7OU874xC513CD24FpoPPB9XlZEV7WC9VtuJATL+FDQKU
 quYzgL6d0ZupraF4eBWGwMhmS6c6K7XL6utTkJcVwkriLHpqpG7EYAIFYLhv3f2qeXg6Dhp0FTQ
 MT8mWJzoeWF0osIDidUxMJXyVokwTSLbcz9hl+erkiIcpeBCVAK8lDg6jGlI3n7cJmfobT24H0y
 Oav4Vbj5g5N4MVMWj+xPc2USxc/fHEVfFUb51Ah8xbogDUhoqXVN9TAluM65k0ZT466yFRMs7XP
 6584kIeGiCARD+aRYt7m+Hbu79oTxky41yMn7qDhoh9x8jkZLXaO6E2yTxjwaKrOJTf/1xRNgex
 wCMFX/3ZZOlE8ra7Ib9VghVqUgvZe8/5yH3ZQweTa5lMCEdY5u4Sj8XWdBV6IcUprwnLKdIf/fB
 FYqd09N7mJzneZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

When registering clocks with sunxi_ccu_probe(), the number of ccu_clocks
and the number of hw clocks might be different, eventhough they usually are
the same.

If they are different, it could lead to out-of-bound access or registered
clock left behind on error.

Use a different variable when iterating on hw clocks so every registered
clock, and only those, gets unregistered on error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260629131254.7E34C1F00A3A@smtp.kernel.org
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 1c083b4d0b7e..43d8eca6abee 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -114,7 +114,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			   const struct sunxi_ccu_desc *desc)
 {
 	struct ccu_reset *reset;
-	int i, ret;
+	int i, j, ret;
 
 	ccu->desc = desc;
 
@@ -130,8 +130,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		cclk->lock = &ccu->lock;
 	}
 
-	for (i = 0; i < desc->hw_clks->num ; i++) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	for (j = 0; j < desc->hw_clks->num ; j++) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 		const char *name;
 
 		if (!hw)
@@ -143,7 +143,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 		else
 			ret = of_clk_hw_register(node, hw);
 		if (ret) {
-			pr_err("Couldn't register clock %d - %s\n", i, name);
+			pr_err("Couldn't register clock %d - %s\n", j, name);
 			goto err_clk_unreg;
 		}
 	}
@@ -186,8 +186,8 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 err_del_provider:
 	of_clk_del_provider(node);
 err_clk_unreg:
-	while (--i >= 0) {
-		struct clk_hw *hw = desc->hw_clks->hws[i];
+	while (--j >= 0) {
+		struct clk_hw *hw = desc->hw_clks->hws[j];
 
 		if (!hw)
 			continue;

-- 
2.47.3

