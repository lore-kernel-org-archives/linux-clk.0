Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9F41C07C4
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690351; cv=none; b=s109lnNU7WepAwO32sdrHpSWTV9SKOOlYMVLB3k/FAxyNyup2WKIKEl++YbMpkNR+Vss6EVLF8p9KcIwo0AIyizY6uVTMdIJO2Asx0ddPllJ8DpLkAlGE/QdBmIiZ/DAqHpxTERsoqxfFQ+najWjQ1qfHwUgTNwaNX2jrVwLk8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690351; c=relaxed/simple;
	bh=iUeX9wdAi43FUJsW47StJGB1Hl6nYX69ImjfhxaI5e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hv8+q9DtNIQf5/+9eFqNJmlFQgMXHB7ne9Si+sAbzmZfH7Px/T/ZmzIYyBsw6jlmGES1jtGHbCIR7o52YWZKPnbOkzTXtqg/llmWNd3sMSRiYyWGVxkb+mymZivnwxQ1IyhNlm3JvrAfaPR9aekWR/PuGyUhOooRYGSOi/TPOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tGI39dTk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tGI39dTk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283dedso16662495e9.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734690347; x=1735295147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB5LnFpvLXXFDiGc0aX0SzrXmBsCEEf198BzA0TMrQM=;
        b=tGI39dTkCNgzLa2MSAUXQIMYxGUmpB6ceUEPTwJYKyNSmF1Ys+gbNQWTcuB8PsIIaV
         LEt7+XCiKXkgxxNPXNEhi2p/12Cj+0zgKzLHqU3cq2ZL/Pwzpz+tFhSCrxEusjlC7TyA
         ktRu6j/+K+y8aSEWzWBe3MTMZ7QniArf9/3Ju3VQZzPRk731ZPUIUtwSvE8PDD9cdKag
         FI+DxpQsDNyfbtyUVJnK+j2sLWe7WUfhlsklCn14Df33rhl/XhQTzE9LCIupdEDM7ONx
         Jw43TUUeVpBMTDLQseSPeXgC+QAYxTmbiKLxgyOQLR6mWHLS/9AntTxN7tS76Ttfwhzt
         EI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690347; x=1735295147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB5LnFpvLXXFDiGc0aX0SzrXmBsCEEf198BzA0TMrQM=;
        b=K9x7uT6asc2IC2h9M/+E+Q//95wSfYUz/evpSbZYCrH4aB+LQtTxfdm2HUe2+dG3Ko
         xXxutNnFaGrrkgqcgDAVb3S/rc/S6Yv+jKP2M4G0bCawaPM6CWlEQG7FDOP8wWUjcvAz
         8qT1ute57+7KfLwHeX/LTMKvGTFoEB9+gs9QbvaZRnKsGorjVj2d7/z8SEauouWHCjNn
         sNGEeYq4au4gKPaURinx/tg4xCGot5cQu/TBWRny5A8kdOxn3Oyb0SzHi/XvLLZnXkOS
         47lAvjUW67J6qDKIvJ+6C+8Qs/OMmPRVcu0JcfZSZSe0DnFHzs4FinHBWh7rNrJr/27M
         Lw0A==
X-Forwarded-Encrypted: i=1; AJvYcCWtSvL/SkbqdbJ+96rpmavXms3zrpMwkVc0sLSirj/Xyarj6/qitnRszRjeg5DTMd9LEjYtwqZduSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0vepQp/dxghEqiBYqkZoJfX78uv9sy5JjWBjjt5h9Tbmp0IQD
	uZxM3F9GohihTsgr2QG7U+iu7GVuSUZk48bF9oHTX8jvbAI9IUZalPy4LUfk8VfjvI5eeAEQlwc
	Q
X-Gm-Gg: ASbGncugA8/5+7w8Qpc058+QK5v0kFmvIcPs9BgawdGGUDxkgSmIOY2quDt9k7TTBJR
	8z4ki7nmWrqdcyRaaYpz73yVqJ0DGkxvSBP0oVbB2amiZpPOQUV6aMbyAF80n1ADeuwoU+65wxf
	7w4j6UtiBhOpdCa4856c/g2XXMd9JKDUrV4D/x+G4aRGiZuCV3NR1/A6uJ+VdDZ3vx9g2G8izfz
	3idB8fDex5rB94lQjfWSRbA3zQOSYvsN8O8R98hOOBhWYUqFWIgnh46/ZLfJADiLmpK4Ks=
X-Google-Smtp-Source: AGHT+IExJcj7R6Fj2hV3B78SaEFs9sQdEDmlwmWEUeExDxy3OaKLM9OJhZYp5CvU0W0mDQYhl3y1rQ==
X-Received: by 2002:a05:6000:144b:b0:385:efc7:932d with SMTP id ffacd0b85a97d-38a223ffb44mr2188704f8f.46.1734690347320;
        Fri, 20 Dec 2024 02:25:47 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2b0sm3752071f8f.82.2024.12.20.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 11:25:36 +0100
Subject: [PATCH 1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iUeX9wdAi43FUJsW47StJGB1Hl6nYX69ImjfhxaI5e0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZUYnKbGrf4tfndrwYB812r9wmrvzkUkC69KFa
 clu7oxTHt2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2VGJwAKCRDm/A8cN/La
 hVIlEACtOj35dKmDN1tybjFaCIu4xF8Khx/59xxrLcZ72LPQZmEwhe9n44Z+Zgbcz21Qjv6RYce
 1FlxtnC9JYdihIzlyM2MHbCXqMyrSfUBYRafhADTATpnFTdI5k5HzWwBYg7QXJ4qIJe/CSB/+3H
 g9Nse6kuiK1pK7zjP3GoXu5Ww7XMuB86jyt/dS7dGcOOv3sQ3qLfM3Lq3PqhHbRZ9GTKg/JFn5X
 UkstNlz4uaIFR3gjt0lapkfGSslp8gaL/OoSoHmHAf6RGQz+RMN76q8LKuWTBAbxLsz76I/tF1E
 DE2FDf06nUWYCp1HHMizs0lGKg5uf+smor4HJRWkP3VStyA3Da75n/U34n3yPrx8iL/2x6sJshS
 TLuAcyzPcG6gk+Udj2fv2CfJc3zkvAR0eaKcvsNP3Kzz4t1s26Etw8O9jqBXevyn/VAxQUBui5u
 yEMccu9HVuQf17KUlkYQrY6F7E+2I/phtVcZwk03sOv7Hp18WoTccErkfBYolxHmgkxpttLiPe4
 DDAaOxi48lCpeN9m9Bmzv7XZ5p0093WdMBpysY0lKXzBiGHEoKtTcqtDnt5bv3FQ1MmfkaVAODO
 S+mv26036FYLE0/zjNRwCwYc6IQIs6utX2rVxiJ1liYEeMeQ0BTq3CT3biKOcazUJ/PcOaB0p6Y
 dYS29VoIqx86J7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

gxbb_32k_clk_div sets CLK_DIVIDER_ROUND_CLOSEST in the init_data flag which
is incorrect. This is field is not where the divider flags belong.

Thankfully, CLK_DIVIDER_ROUND_CLOSEST maps to bit 4 which is an unused
clock flag, so there is no unintended consequence to this error.

Effectively, the clock has been used without CLK_DIVIDER_ROUND_CLOSEST
so far, so just drop it.

Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 262c318edbd512239b79e5ad26643ae6c7b0173b..62494cf06e7d775bdb18b2242c3d45bf246bdd0e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1306,7 +1306,7 @@ static struct clk_regmap gxbb_32k_clk_div = {
 			&gxbb_32k_clk_sel.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_DIVIDER_ROUND_CLOSEST,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 

-- 
2.45.2

