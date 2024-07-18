Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963512C522
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296691; cv=none; b=oOxvUw+H6KNpf+H0UzxyWiVB+1kQQssUL7cvOfyJzlQ4hfoHMqF3vmDT3sWxfA6gmdCJIYaZxb7M4e14jmJX5I5cMSOg9QezJ+BaEer1uct4+ktr10+MhZdSIvYVt/BO4ll0Dqv6A2M5GWn7DzK01pm4QcaZ9nFXwiLsIU2ELIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296691; c=relaxed/simple;
	bh=9cZe1kPmCTyObujoid9EqIB/vM/2BaIZArY0kMmMOUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tguVqvxxg/IpTWZG4O0jGRpqkvK44CD/KPMuRhTkI/VyS1s0zObGkDxCrz1YqdMERyNMyBquTIutgyDw15aWY5YsRDazYLyXFoxeaB9g1GMPQR0ZRrLBO3lvYNtnvJs+nHY60WYG2KfwBQXjHmljbYbBxYwxqIUKj6ea2dJ95Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pzeDSA2H; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pzeDSA2H"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso180841e87.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296686; x=1721901486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsHCgll+Hmm8fed0dFMQNF0ix1j3UG0Ow/yT3gZX+Ck=;
        b=pzeDSA2H1QSXwrIxx0wnrhmjy0fmcshnNpLWepNFiFMzLukaNqoz9TbkEn3MB/uLSm
         nyM+77sQh+usWkNGL7bF8btbyl5FxiJOCyfXEmSFXdArELQf5YZg1+YkKjXRwrCmpzvO
         N3+S4GyypX8FGAVCo8K4HNqwHielaCr9yiPHfs94ttpCdbJ36Kc3j2RriByeWHKPhDw1
         rXyuP5Xupn7ALbuyENNEQxLG9IKSKt287qZ4IZ+9hswA1FBPRRshANGgOMq9Z9jSXsuB
         WWSrAg3p+t2G+4AhAmSyym6sl9BkQC09jMngC2XbJyWXjiuKt27+m3OTAmZ88jOBRIq/
         xQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296687; x=1721901487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsHCgll+Hmm8fed0dFMQNF0ix1j3UG0Ow/yT3gZX+Ck=;
        b=H+fLrLsC+LrXsgOMFUWp5mmt1Vipy8LLQXqbNo8l7uZhAsfW081bhyscNzp0CzhXcx
         UE8Vi6MgXYPTpfG6eKxObkCReumD9c8PJRvf+qP5LcrIUlUfLCyBL1TD4Iw8gazuQc1c
         nh754T+6291scG2nNzxPWeNTf/qypHL4g+VwAnj22UtPpFHEN41AzE4U7uO1XrA/WcFY
         BAaZ79fDSJHpD1aYc3mPVMSrUL9kh2I4kNHag8Hpgig3IJU5Re26UJDEPsAu1xbwk84H
         Jl4j68n9jwkQgThfXoIXXF8d2wGNvgSS9TRh5yyNzatjXhqQDJidfuLXsW7jVbQ3wrMw
         0zew==
X-Forwarded-Encrypted: i=1; AJvYcCUrliCy1sYu5wNzrAG67XjMEchafWhx+BRsGqK3e9tXUIuFVge79GlPE+ML2jtSLFnOTS7LRME0fmpq+t2C+lmJhv+1Zkv6hQtz
X-Gm-Message-State: AOJu0YymlMjdXuhFm1cDGa6uWjympsceVzo5xrxN9OndgJ5WkJrg4k4E
	UH6zBrEjvudfTeD0MlUYHMXsXfdv/9YRvdCrCp4VXOfMXgjejq5TtYVOgLCyd3o=
X-Google-Smtp-Source: AGHT+IHCNw6mvVs0JqyoFHW8EQrkH7lFTfsUSnH12CIgfhfeQ/Vay1c4tow8aO7Uajm253zXYZe4DA==
X-Received: by 2002:a05:6512:2385:b0:52d:b1e4:b337 with SMTP id 2adb3069b0e04-52ee53b284dmr3180536e87.21.1721296686619;
        Thu, 18 Jul 2024 02:58:06 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/9] reset: amlogic: add driver parameters
Date: Thu, 18 Jul 2024 11:57:48 +0200
Message-ID: <20240718095755.3511992-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

To allow using the same driver for the main reset controller and the
auxiliary ones embedded in the clock controllers, allow to customise
the reset offset, same as the level offset. Also add an option to make
the level reset active low or high.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index a4705021b8f2..09b23f320f57 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -18,7 +18,9 @@
 
 struct meson_reset_param {
 	unsigned int reg_count;
+	unsigned int reset_offset;
 	unsigned int level_offset;
+	bool level_low_reset;
 };
 
 struct meson_reset {
@@ -46,6 +48,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
 	unsigned int offset, bit;
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->reset_offset;
 
 	return regmap_update_bits(data->map, offset,
 				  BIT(bit), BIT(bit));
@@ -60,9 +63,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
 	offset += data->param->level_offset;
+	assert ^= data->param->level_low_reset;
 
 	return regmap_update_bits(data->map, offset,
-				  BIT(bit), assert ? 0 : BIT(bit));
+				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -85,17 +89,23 @@ static const struct reset_control_ops meson_reset_ops = {
 
 static const struct meson_reset_param meson8b_param = {
 	.reg_count	= 8,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
+	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
 	.reg_count	= 3,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
+	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
 	.reg_count	= 6,
+	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
+	.level_low_reset = true,
 };
 
 static const struct of_device_id meson_reset_dt_ids[] = {
-- 
2.43.0

