Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C6355F45
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502947; cv=none; b=Ci4482BZXt1svU0zvE5jqKdaPeR7D16xQUsywohdDg8Rum0ZXkd0Ov80RqpfumN7nhdUB+946DS66Bs/yXv/vopag7ct1zI1T2nZGYd35hJbSzhDI8TP3s0UYOs/JGacMwRmRhmfZQL19V1HCJv5Re/Ogh6ZGSztT180rNQelpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502947; c=relaxed/simple;
	bh=secipyXIFe5nKwWxQDiFSflV2qpjNZ5UEC68A4oj4Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9CAKZztQ5FW1l8PGwQcaivN1NbCWmkQFqcgoi75+lrgAkuI0Z0Asa4LWUoHwBfXvDk1t0pMPyQuphSu4tkIrrNbkLqKqG9JtARi6yPpxc0zXif6unze3qs7vh2u2MvveprP1dTz7M08gyM+T5M6XclAp3PwPM4kOnlCd1OrNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6bZ2JnX; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6bZ2JnX"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-128e4d0cc48so716161c88.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774502945; x=1775107745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vj6+CrB7XzZSSoo0WZkVvcXGudvkrxFD+q5udVvUfM=;
        b=p6bZ2JnXNd4sm6qbImZEFNPmdgt66hyqPEyJeXFTyU4Co453P3A6RG4DJPqbpeQhll
         erdbi5Bjz9cKF7xCs549PhIMuugTPZ2zWAEFrH/NyoFXGbeQkhawfsRBAG8Gqd7WJ7ty
         0QS8L4pK9MTUBBSW2zvBQMtt6sxSdiQKkhZHrMCK8fA9gzcu6NG75SdPKPgU3eeAD4kG
         E9Kfhn9WRiIuuy1gOv4RUtMN22R+yn1wKa8Lh7qKNb79v1HR8RmV1xiOC+6JUA6W8m5V
         LeSZbehPnMDa/HtyASPf89d+o+3snYH319+ODoxKiMxzjNQtbIVzlRj7w3OfPKCvKgxs
         TfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502945; x=1775107745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vj6+CrB7XzZSSoo0WZkVvcXGudvkrxFD+q5udVvUfM=;
        b=RYC9zPVfZrp2OYYwnOYCIySvAZoGjfRjmxtMgs3HscanrFDKdWIzPZOMeoHw0sgJj6
         5r1kJHD4RUkS6C8bxGYevuQeC/TWSHcHvayipVGMWXrgkpOPQIkdKoM+RJuwv6gO9069
         l+hbM6kRnbTPksn8Q5vyIikGr04Kl5ZRqshyiaNPwXxXDyqwxaMGD807MzqO3Jq3aAj2
         xXCAMG0z6+LHCIT28By2OjaovfSNI/AUtvAoIqN1J0LGnqLjMrX0oJ+7FrrKzQ6VETTg
         VAqNP8uel4MfLwGFHIfAc6YfXdwPOi0+dtcHu5K0ysC8OiKWKjDT8mwmDzYX3i9MDHwe
         Y1Jg==
X-Gm-Message-State: AOJu0Yxl7ZreM5Sz1YrTIn30RVVMfx2SRll2Pz8aZ0oeQLxufIOmU5kw
	TD4irLzwiq4I+9U/fSUv52rDy2MBRBfYrDb6lI2DL4Q0WgoHwl0m1mZ2Ri/13D2/
X-Gm-Gg: ATEYQzxvuLrScQ4wLbzNiUt6bd5flCCyJctAVeHLFHDZUO0D+4lH79bP9IWWDk3HS7h
	46hkYEfLLDsxcxF2Hu3eXMUbU+XIhqA6LiFihMslyr64pjU9tBEg5SFqzfFuyPKr2x80+kLyZEF
	TrWCy3zLU6tBbMcmSS/Ihk8qIwm1aHFQO0HGHPYGvHC/h+jSQ0xjT3Qc7WwP2BkdCBRzp3PnHB4
	It+uGkCVhtyXoGl+94bkRqqpIMMg3op5KWJ8sSqoqF460ZEZ+ixwzn9LyeI3fJPlOytbmKlC0B4
	nwql20WzFBiHveJgkaReubi13E9ddiLDsgk6cgSbUjk/M7YtakvuaZK1CM25WKAyOJWeq26UZeE
	NNQuBEBxNSw/SYDKzOWI6uhGtf+5K9lCsG1kRl54PzNq3ah9Rvh91aSz1wjsiAL6b7Y4pg40mJI
	B7QaUYUET3l2p9XJCEGI7gMA+0kiYPmsDpVAumQUlpQbgfCLtVNlGJVYk=
X-Received: by 2002:a05:7022:ec86:b0:128:bae0:e044 with SMTP id a92af1059eb24-12a96ee7565mr3175255c88.30.1774502945123;
        Wed, 25 Mar 2026 22:29:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa78462fesm3013681c88.15.2026.03.25.22.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:29:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: clk-max77686: kzalloc + kcalloc to kzalloc
Date: Wed, 25 Mar 2026 22:28:47 -0700
Message-ID: <20260326052847.335089-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using a flexible array member to combine
allocations. Use struct_size to calculate size properly.

Use __counted_by to get extra runtime analysis. Assign counting variable
right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-max77686.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 3727d5472450..9149ce4f702d 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -47,8 +47,8 @@ struct max77686_clk_init_data {
 
 struct max77686_clk_driver_data {
 	enum max77686_chip_name chip;
-	struct max77686_clk_init_data *max_clk_data;
 	size_t num_clks;
+	struct max77686_clk_init_data max_clk_data[] __counted_by(num_clks);
 };
 
 static const struct
@@ -168,19 +168,7 @@ static int max77686_clk_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int i, ret, num_clks;
 
-	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
-	if (!drv_data)
-		return -ENOMEM;
-
-	regmap = dev_get_regmap(parent, NULL);
-	if (!regmap) {
-		dev_err(dev, "Failed to get rtc regmap\n");
-		return -ENODEV;
-	}
-
-	drv_data->chip = id->driver_data;
-
-	switch (drv_data->chip) {
+	switch (id->driver_data) {
 	case CHIP_MAX77686:
 		num_clks = MAX77686_CLKS_NUM;
 		hw_clks = max77686_hw_clks_info;
@@ -201,13 +189,19 @@ static int max77686_clk_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	drv_data->num_clks = num_clks;
-	drv_data->max_clk_data = devm_kcalloc(dev, num_clks,
-					      sizeof(*drv_data->max_clk_data),
-					      GFP_KERNEL);
-	if (!drv_data->max_clk_data)
+	drv_data = devm_kzalloc(dev, struct_size(drv_data, max_clk_data, num_clks), GFP_KERNEL);
+	if (!drv_data)
 		return -ENOMEM;
 
+	drv_data->num_clks = num_clks;
+	drv_data->chip = id->driver_data;
+
+	regmap = dev_get_regmap(parent, NULL);
+	if (!regmap) {
+		dev_err(dev, "Failed to get rtc regmap\n");
+		return -ENODEV;
+	}
+
 	for (i = 0; i < num_clks; i++) {
 		struct max77686_clk_init_data *max_clk_data;
 		const char *clk_name;
-- 
2.53.0

