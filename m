Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C622E18A6B1
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112887; cv=none; b=dtnzEAVKyA6+riybrGtSXlz6Av+W5CtdCquSNHpUxvTorYR1C4qafI00rfNkWQi6QUvpDvoch8x0DuweoRo2ewZaXwNZFoRBs4DEAFGD0PpqvFwrGXhNgeIv+H3m76CuqAgi+X5HoH9Y7j5jzuXS1/U0tEY/bnz52+7LhACaZ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112887; c=relaxed/simple;
	bh=mX97e01MPkA2KLIL7hS96bYzDDAlkGTLJdClNcccIkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prq6yA7Zi2m4MIu7zeZA0TGHC1GtqJFATA8tqvvPuXdDjQq1fYKc+ytGjmkHcypi3bevCYrU0rRAfLohTSqK3ImseIQJU8448L6MDKwFNqmPSrljR3iIU6uEcrcOQ9E/ndCwbRa/yZFcIw1Q2iM5LODs4BAOderMG3GDhFp9eO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ax7RODOk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ax7RODOk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso5933715e9.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112884; x=1723717684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr0Cx+l93ievhcSqcQh58PvVUEHk0s6N+Y0wdAmtxHg=;
        b=Ax7RODOkK2i3nuVWANl+CpYAiF+gF6VPqi2N+evFanfdJ5HyorfP2PCgOdId521bQC
         eK071sFqPcIukys0eTjWRmibgQ30I/X9lorXtI6pOcsZ8zc5ZTBpImR9W8NX5MY9LzKq
         5KrfXoXP67JZOMMDMFHn7+KOhUFlZp1YRmRQQuPWC1/Cq+GyxRz4sb2rtFP2k8AaV2Fe
         aNk1uMVb0v9LkaLrzTXyfiQRXgcPDx4MjhcZ49DPhwkQ4OSld2x40k8GscnVoZHm/WPI
         ufSlUvB7xoEXaRY693CJuH5z0UXTLjtBQTVQJnjX0Y8PpVBoFbiVuqsr6muOE7zx8RUM
         Humg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112884; x=1723717684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr0Cx+l93ievhcSqcQh58PvVUEHk0s6N+Y0wdAmtxHg=;
        b=oR24f+RA595S+35LHz4AWx3BmJDu3+LhXpL7c3X/oBLd8UZ8BQjQY0u3gQCCk8ciZ4
         TqGukNN8foADibvvM84gq4xw0tnuncj6+c3MKdeGSk2oro198yc5tcRXkN7PTCMOpO+z
         MkBuiF4xnSpf95aOHlWtXcd5Vu6Ai2mLRrYWKh7hAMkNgSWcS+L0pePHehoJ3M6pzIV1
         DMZ8ai6SmrjqqiTNgnc18WeFsU78/nAlpOTLgY5e7TjagTBlTg83G0CZ3eb73CXYYopk
         XjKKYkTQEeQyNf3OuiF+6r+lTp/pDb0ZP5XliJi8kKB4gBdEJe6UcbpxNj6mnH/2ji1V
         1png==
X-Forwarded-Encrypted: i=1; AJvYcCX0FU2lVqSaf6j7UjzJ6OSsjJZLP9GKpJ0ThUkgv5LvsiG+KF0Pg67afPYFnWwZfahydcU7E5HlNMeh+/HqDNPQAIal3i93eLfC
X-Gm-Message-State: AOJu0YwkGpr7bTj1BNud4dI037Nb1nCX5p//oav2xUbik1K1ACets8DB
	5+xuzcScZq1sK/SiD4nmEcBOuMWeNOKPreCqyeQVr64DEzBdBWsJcg0A+YOJ+Lw=
X-Google-Smtp-Source: AGHT+IH6euXTuyAeaO2rodq608/hHNhqkkeHwCHczxlGWUhhgunMEiXRlBHFZXboJ9LIxTbuP/bp9A==
X-Received: by 2002:a5d:64c5:0:b0:36b:a3f1:6333 with SMTP id ffacd0b85a97d-36d27554ae8mr1047306f8f.24.1723112884204;
        Thu, 08 Aug 2024 03:28:04 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 4/9] reset: amlogic: add driver parameters
Date: Thu,  8 Aug 2024 12:27:34 +0200
Message-ID: <20240808102742.4095904-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
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
index 460ad2f8360f..8addd100e601 100644
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
 
 	return regmap_write(data->map, offset, BIT(bit));
 }
@@ -59,9 +62,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 
 	meson_reset_offset_and_bit(data, id, &offset, &bit);
 	offset += data->param->level_offset;
+	assert ^= data->param->level_low_reset;
 
 	return regmap_update_bits(data->map, offset,
-				  BIT(bit), assert ? 0 : BIT(bit));
+				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -84,17 +88,23 @@ static const struct reset_control_ops meson_reset_ops = {
 
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

