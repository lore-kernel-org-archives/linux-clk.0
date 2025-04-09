Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75017154BF5
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231073; cv=none; b=H+IpxzBIvXlBO2ZSS0t9owWlpzXjcFvjfnQk55OYGmMI0OFNtj/0VdKNEOIVS3JoWgA2TtsHhz6K7iJE+Q8dLhFEgQbOucOUXsKtp8fYtpMNW1h/OOq9+Lktw0AxvbCjhItF+9dJdnTRdcS1w17yk7mP5Izt1TVGxZFUHmt5lzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231073; c=relaxed/simple;
	bh=9E57e45BxMl50555VhXLsBvSd4mm5Cl4BbZdxjc19jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqAbl5CmklF8W0HGJqWRPNTyEEqvjshUaX2mofmKpmpE0YVO+tl55rBl3crrlZiimLLjrWt9stdvA8SS6ed+4Qok0N1qbFfmPKxhTBDfLlxTqtAblsnRxCyCvZankyoSjwGS4AWbbYPCGjXT3n4NEQ/jlvHF/Rr98LnnDX4EkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dis10PpJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dis10PpJ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so16519866b.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231065; x=1744835865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=dis10PpJJhuLLHNlk8a/obGOaMJdSRYCXYh2upQuJb1jcQzWrlAC664y+VpfySvmQr
         UhVSEfDuvh0XFFSrh5FmL5wPe8zbp4Lj5rp2B6yWHqVJR3PEx9V+R7heoaSkq+ORV52i
         0Dr2NtbM6ALIb9Id10LekqdVU/hAp93o1u13B4MDR40LjI/j9BvYyqTWBvdA3qF3Td2g
         i+HFFQKseSUf0O9Pm9Hqg53z0nIBE6PGQls62GsR5T5JM/17Jf9EVDUiInOpdlMdl4QB
         0F7JmlU376JsFX6T1tAV8xZEVqKqSVWz/u1t86zWJtZbFbSK5QqTYkucdOA7k9hZkpBS
         mcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231065; x=1744835865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=ToKRgLDqJotHxwS+Mx4r2oingnb8cSMQXrEdgUNZBqid/i51/Sh9jPfhNpCpBsCQfX
         8Vo0b491HdquJMKzn1zjAgpmbA59maQeOUGhMiLHvmmdqFhtsNfJvkdiOFXynJJjMN89
         rLQZHsE2wvWH3CIox9PbV2dl8Gzs881hBLyurS69nyFjiRuB2IqjIYHD30gqas/R4TAr
         8z64mIz0ICP19KhrbSuOTgBa0XptO+VI6h78Dyo0jK4JqSQ8xYl772HUiD2aE0orJMZV
         NPIXZZkJUtSocH1+iIVuG/Wmmtz8arit+S5gj7eiS7+K2ii1Y9+J27RkqhPtMLvRPTg9
         lN6w==
X-Forwarded-Encrypted: i=1; AJvYcCW3uA5BWvWx/LOiB9MkXSsh6sSXMoOrzct9Cyzo6ZUBS80Vrr4sar5hyudwlqd1yy7Xvjn40qdS0+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyo71ZLHajSFyUaGnCdBxHvxjiunBU894Eu04EUEjH2I0ct99G
	H4MarKEvc6BvPDe8GDLD/GxugaXK7tqznbpDLgPN0kwc3KRbPT3gsTalaqGYae4=
X-Gm-Gg: ASbGncuBQNKsksHY2T3lhwX/0UrHyL76hh5JRzqFINICKBZnDFos6ibUzftTFPIVvLf
	rquhld+8HzdNVk2ClUYoieMox0U1Zuc27FytkTG5A4daY6Jy4UAspk6OWU5JCviY99QLcEMkM9X
	5vArVZS3XKSeZkvDGzF1sLJxqytV+nQ4UukD4iNsU3OjA5E2eTiMSuG+bW1eSW5DvfTa3f52wOr
	cOQ1eVRuQlFfEw5tw8SPzml7TKvOb3fx65CecMM3OXnimBY1HfzHeIGT+olqy2oA9Lmd+gwe6s+
	zib96Kx+oCOnCzJFeI97kxc0bQqN+ozGYP9OzNEHUK4/atbCsCY3bYA45mEEpKxLlrStjPka8jj
	3zDNFWuw1l+8puqB31+49UEHOn60=
X-Google-Smtp-Source: AGHT+IEdkkXow6n79ZWPbZRhN5XFCjydXvQNxgGlSC/PrHUaOACC0tp9PiBCaVoIN+0xJ5YXvd/Wlg==
X-Received: by 2002:a17:907:3e0f:b0:ac7:391a:e159 with SMTP id a640c23a62f3a-acabd4d8449mr5988466b.60.1744231065076;
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:51 +0100
Subject: [PATCH v4 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-30-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index f4caed953efdd23fd0132d74d5199dec9cdfd294..27115523b8c25794a9f3ac8e734bb1ed998e9518 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.604.gff1f9ca942-goog

