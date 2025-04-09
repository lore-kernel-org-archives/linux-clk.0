Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD321B918
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233474; cv=none; b=WkzaUzeAZvz1DLkZBLYfTFbZxAEsB/Knb9jhsSrm2NXC+ysZM31+FqklbZb3/bqfZBUt7TotaaJ7YOW0fbMeSBpSXs0miQ2Y6bFPwnPHcDHItLfxYbQz3RukqsIIdRrrNZvW9Bua2Tu833VJsj3jun0SCmNcu4WzUUOVBcC6E5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233474; c=relaxed/simple;
	bh=i6QMZeQliBXGkXhmELOM3S9fM4/68sTvez+Y1SdurqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdfIYHr1daZNs0YriUM7ZhvQsRzODQaOQlmFBj5j144B09D1+6aWbG3tvxeRYHdAe5fCFgx2hv04QqM/cWe4ko/3QARHpgDIvgffQ7r6/hncswa1DoruuEptuBc+16SclN9etfsG66yCYETPoSwuAtvjaX6Dr2T/y5stbpqsRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Jv5U8pSw; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Jv5U8pSw"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso7176739f.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233472; x=1744838272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=Jv5U8pSwGE5dCm5GzyKQtQnvrY7WWQlmE2bKPetwdPURqru1LDDAqAYi8gRJWtS3HT
         WOpnQ1gKikOkH7LaOsFkvCl+CYFugwQFQ9hNBfiZKKHa5BLaHdtHdXUUru3NA91HyNts
         wtEAWQZLhTJ0fBI8u0+KoYCmKTogGuHzrWk2KCWBQyXUnj9dRBGTDa8g5FFnOMVYXGhD
         kI8zoa1bA9ZHcb4QOIK6SW6u4hvoYL6siQgEji8XZ+IuwMbGSD/iyVxAYVtiuzXZ1KON
         xNjSQaLlmqZ0TI56H+h8OU7UVQLmzQ+xtocJBcSxchDjQ1SepNmvD+R5mR7ovcnlWbv9
         +lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233472; x=1744838272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=VAevqUiJ+kZ08dUz/eXizfwzsKlm31DVmzSI2+EXb8I06d3Ta806zSZS2sOTR+x6wa
         NpW6tL8fLoTV7d11Yg7TGYqbu6mC7jZIn7Z1ENMy4e0bbMCX/wXnev4NdTjAk24vbYTr
         pDhEeXeyX4xRtA78W5eKs3Zyk42VrkZpiHfTsoGbCYTMBmATK8N+v/cif+t/Zb07oSRn
         XOF6vIIWB/NmO80e0Jpes+wmnR9j9yGvqHrSPAx2Qp305OoTFX9ct9Ph2LYmuF9CJf66
         bbb4cjl54QtWhdoM/F5yYVXhSqjCAgD7WzZH3gFk6yozEdYpV61710YjIF2bgaxrFsyM
         eB8g==
X-Forwarded-Encrypted: i=1; AJvYcCV+15YNbArE2970DTyqNY4cL5O55+FVUB8iQJaLiZg1WiqLAK/Y5tES1icaUr31W3cXm6hJKOrJphE=@vger.kernel.org
X-Gm-Message-State: AOJu0YztYs2ts6ZSg36WNMNA84ZqxPMfLN0caCVRS64AFg+XNK3v24tN
	jlZcj7+LbIsZvT2+jzpDg+EQc8EE6rC6GiVllZ37my4MYxgFIEb4NXAXwsDuePc=
X-Gm-Gg: ASbGncvpsDN9McuKPi5WN1tSUyuEJ3nzrF0IWR6mfiJLiajdkisbNUn60oKLiUHtdia
	wa1Ltggu6CkifuizsAj0DifUWIN8VZ4/WKC/aC2sRfomYj2Kttu8e7kSBWS9Hh0LcdiU3B4P7bA
	5n747XpQ0ocwXa0Qz9mEtImJnFMO7GvydgtNeh74OBeoJHkoC9Kf27maO+0Yxe8YyCfaIh4avua
	WR/szXYlf6NT049Iszvraj1ZpDBU3/uB1Q31ZTDK5uWx8zmnURS2N1GyMu7p8bXYL53HAokbJus
	r1hJeOFmEowN1D3eaLyUsgOzqnhArkKcaaDtmrcdSTlC0ZWaJiciRhiB+gIDgQNOW1xbtE3Ro3R
	fxW472cgb5DAuZg==
X-Google-Smtp-Source: AGHT+IFEHPef9F0uv3pXsoWPI4R+kvDCIMm2kirESEgvm8sQs83/WxUO71MEUbAIM50tLqB7gPts0w==
X-Received: by 2002:a05:6602:19c3:b0:85b:3ae9:da01 with SMTP id ca18e2360f4ac-8616f19e832mr27550439f.4.1744233471871;
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: spacemit: make clocks optional
Date: Wed,  9 Apr 2025 16:17:38 -0500
Message-ID: <20250409211741.1171584-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 7715cd38434f7..201ffefa5fa9f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1369,12 +1369,17 @@ static const struct reset_control_ops spacemit_reset_control_ops = {
 };
 
 static int spacemit_ccu_register(struct device *dev,
-				 struct regmap *regmap, struct regmap *lock_regmap,
+				 struct regmap *regmap,
+				 struct regmap *lock_regmap,
 				 const struct spacemit_ccu_data *data)
 {
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1486,6 +1491,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

