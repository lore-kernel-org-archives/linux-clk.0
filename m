Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F88229B26
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570324; cv=none; b=BHbF0zPBbNdQYKf/hFjXuJ4GyvP3hT0Aq5HqU/00+rUCsXo84lW0WHAAc0A8flod3ba9XXzdEUTfmlBE3GLozY2El6mdwO8BtgjB446Sna5p7B9anJyEOOok5LAxkwtHvtlkY09JMhuwhGzY+K0OalntPI7H7GWd47JhIt2yLuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570324; c=relaxed/simple;
	bh=Kk9IOSp5FpiJPK6DAw2Z9Z0TfklnPeKukCwW/BwUYxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ch+jBkLqG/qvozJViVd5cz1i1hZIJ7pm9ZXCofIylnEIZQaCKNn+8J76PO+pKGupkJW6p5Vhj4HSLeMecdLJ/T5sB/AZpGlcb8C2d6POJjPrYNC/FMPEPb734c4Dw/+uzkpDid2B1AEcxB4kzF9tqy2ccF28Kb+JrjvAG2eM8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=IQOJiJs9; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IQOJiJs9"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85e15dc801aso173851139f.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570322; x=1743175122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=IQOJiJs93FVQbBhIoyx9Xt4BIBglQuCZ/w2KPgaxb/FdOIiC1+22g5jTWsDIbW5K9a
         PF0RGmmOHQhW9A2JMjRZ8jQruBcTCtiJgwkVq5vQWdswNsTD0YMBKZywM7XHDoZ14I/6
         QnbZZl7zmPseNAe10qSSMtGuLkmLCI+pu9oKXy84A6U2haA8dD/aLCT/BZf5sUUVrglB
         IIqPujU9VqoF/8AG55ILnatISjRO6StsxQEtu85z+wxHW5hp2EcxAImG4JBW60pyv8IV
         wQV0qtNwQNnfPFSmS6MkDvoWVXfCszQaz4JH5OlmiBn1G3rYBSEcMfmic9fpQKyrYwOf
         BTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570322; x=1743175122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9/aOcBOjeqmg8r4cUHY2uYIdNBiCau+sheqrs82fvw=;
        b=H+LhbQBHI5j+GUz6+X3op4pXOZdNDI2IKHY2oPFWtvdU/pn1DhSUu+7AUqZo0C29UV
         K6hFLYK+0B8u62hca1uMmEVixGHFQYPc2mUjR8c5ppT3SqwfDvzJLEh1pIbnzC+0QIU/
         aNTsY0l1iheG89MuYy87CqtMJlh3wfr+FLIon2XZTVw1UXshfPDkLE6+CYZDYV5wl2rO
         DEh2elmSSPB0c9NJY0vEGxOiHRtm6FUiH6vBi8A99yedGFKQZoLX++wGIFXjtp9FqQyu
         CT7TO5zHPlEh1SrKnkTLhiLhOKpxZGJTHb3ScA5haFr0fON0T0zhABehMDMz8nxCiWKy
         H9dw==
X-Forwarded-Encrypted: i=1; AJvYcCVXYjXAzkj0XmJOQGFFxAR8BUfrp3+qwfyLQiftHCHpw9X5wnUrJWWhYhSsNMtI33odXj2he58oDho=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqm8QUK19nRqkfSGT5lCJQEoRgO23z5DJgHLFs9yzZzzLw0Lie
	BhXEpQagJXoQsaFoDCms9/Q2/r7ULYlpAVlgOX6IOkiPF/KMdKP7k4UfVTWgtoE=
X-Gm-Gg: ASbGnct0uHfwvymT1NBcicU7v7KmVehuEqnJ45lIFkPIcnfnXBplycAdIxg093m4Yqp
	3vTKjFlSQbboAP/F23PywKHfFtZcd7RDD6FjfYQD5ZFOwSCkioLFgiF1kfJISbh36cFuyTP5O37
	wLT2+FoPZzqdz4j1G1Oy/WC2f+ANhLbpVwqZiGRMeNX5YtJe4uJ3wbI5x421cwR0czS9zQ+JtFH
	1PdJ30V9Tv8zukXzuq/58Mg7RcGNZATF/78eU9tpzX6+MGUmYMR/ziTk5ZynI/dYjS14phudNL8
	HBCCTkk2B7dR/1LimZprOixuNljrT4bWdv4l4oaaqWBcOj2BZwpjfymFw16yCqhKDW2XLZV3Ycy
	Tt2Z3PBCYI8UFsgmMKHe1v4ry
X-Google-Smtp-Source: AGHT+IFo/JEVnsqki/6fdgfg3xjuRm3SDdlZLf3knFyzM9tCDQmdiRd3jcBZUEzW8DfADwT94MufXQ==
X-Received: by 2002:a05:6e02:188a:b0:3d5:8103:1a77 with SMTP id e9e14a558f8ab-3d5960ce9b6mr45841105ab.1.1742570321661;
        Fri, 21 Mar 2025 08:18:41 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH RESEND 5/7] clk: spacemit: make clocks optional
Date: Fri, 21 Mar 2025 10:18:28 -0500
Message-ID: <20250321151831.623575-6-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
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
 drivers/clk/spacemit/ccu-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index be8abd27753cb..17e321c25959a 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1830,6 +1830,10 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
 
+	/* Clocks are optional */
+	if (!clks)
+		return 0;
+
 	for (clk = clks; clk->hw; clk++)
 		max_id = max(max_id, clk->id);
 
@@ -1903,7 +1907,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	int ret;
 
 	data = of_device_get_match_data(dev);
-	if (!data)
+	if (!data || !(data->clk || data->rst_data))
 		return -EINVAL;
 
 	base_regmap = device_node_to_regmap(dev->of_node);
-- 
2.43.0

