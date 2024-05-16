Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F116014B97E
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872132; cv=none; b=HiAYLWOGOu3vkIg1ilVPvUFmjsfkjM6O7xxJ16F5tbsiZD3TmxJbM+uuZlT8IpFzVg+cAtinoRTlEtHXvBHU9+HHUy6pIO13vF2LsBqVItXne8PhdYiGA+ABORdJHCn1TEB8xXJdmwSqAhlsP8nK4lOsAoUzzdGJhr8qEQqkdgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872132; c=relaxed/simple;
	bh=XhLKaJpFjJZQj7yn2g+fkx1VUJf2EFpLz+SlbAbTNhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYiNWivm8+94B+DbBU8XM1p4+Be84C7/1ohhm0OXIKpt9SIdXcq3yfrCw+4/tjoECVfbvhysuaf4uQ9j2Qht01YZq5Fq5J17NJSQih/O9j9IH7II/tujuHdlYvLiH4IXT17F0KLuCFQ7xDnLQNJ/mNvlFRWQeWUXwz6ZO8lkVWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iLjE3YM6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iLjE3YM6"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e34e85ebf4so7685021fa.2
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872129; x=1716476929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=iLjE3YM6SqyFFYnVIJaEEKR/FT5pz6Lpbqi+8nFRWPD0qfNHvlKcJkW+Cs5EC2AfTL
         9LMWRTnc3QiWO9Cdqg05iFfli8BcmK9Szz6gTWksH5yosbWWSfCC8PIb28JJHBZh/3Uj
         Yh1OPE22by7518eAMO91u2Qn9gP73M9NuKHMPz4RCJQNNOsGAgfuKaSX2pI9W6sdcOEM
         R2Qm17PBTrd0GM1FXPoSthomDvesVOeahhH+JL7Ol4ayJqK9IwaTIewgMN9wiDx7Ob0F
         eTS6hk59JBYh0R1D6LU7U0g6YNTTJlQg1lNQEBrpz4/mQ6dYdTLjU+imEOFJ0vuClA/O
         tyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872129; x=1716476929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=fgmc9L+im7bJp6Z/4jFzO5CRToZGvuauKDZSiTgsPjcdnvtG6sG+5lkrohHhPQOYNQ
         yYdXcDCVgu7IMTGNK0dkyM8IGIiPdCIKuGQzEmbzBYevGYLuNoReAJwrHZbqpZhUOvXB
         jowjMTPcu5ukfDEiehogiDOwfqYoUIyduIISxVWvcm7bs1SwSFpfHsoFG+TaUQpaMhgD
         4H4Zpax7M1JepPx5sheJ5u8lIFpOqEm0F7N6YQWdzE4+Z6ZuQ3JVZcIPfgGoZywLO63e
         ltnwG7+vDJHKMLpdc6Dzs0F8SzZ3bd++JXjQhUlZFmZn8/2KGJTNGW0tfvsfXbph6BqN
         yizA==
X-Forwarded-Encrypted: i=1; AJvYcCVDRYZzII5t3n3lOFoDeeqBT9qSkUCv0TyAUa31Kf3O5QGyhzvYxREgOItTO6RVDYzKC8jQsDvBG+nFOfmQflTwjPYFLvZzV7Bb
X-Gm-Message-State: AOJu0Yw82K5Lec2qrYbQJRxAtTCuivEvvltZJmW3NlXhH6HO9jraEui8
	fbwoZukTDvyOncF6zUoyJmzJm6ZbXYjVUA5WEbLSNVEGD3EqOL5yxqDudAZCdSo=
X-Google-Smtp-Source: AGHT+IGYAck85LsbcTOvXFQY8nZM3fKLyOR5JchkAjsB3ueKLHe+uoUsgS+o6TUKMWmJKolx9ml/0A==
X-Received: by 2002:a2e:a412:0:b0:2e4:e15d:40b0 with SMTP id 38308e7fff4ca-2e52028aefemr120909581fa.32.1715872129220;
        Thu, 16 May 2024 08:08:49 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 2/9] reset: amlogic: add driver parameters
Date: Thu, 16 May 2024 17:08:32 +0200
Message-ID: <20240516150842.705844-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
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
index 8f3d6e9df235..59126c9f194a 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -18,7 +18,9 @@
 
 struct meson_reset_param {
 	int reg_count;
+	int reset_offset;
 	int level_offset;
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

