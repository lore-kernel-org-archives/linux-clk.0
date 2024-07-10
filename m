Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC0194AEF
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628742; cv=none; b=L3z9aZSB8SSCCWjsdLqyHZO89s6xytLahYkRNFyBfS7/YyARGv97tmUIkVXcozwJe9Bkc75hXnN1kMQ8VA8dRkIGrlPXflqQzQgWMIgAaDr0sk6T8i1jEf+pdI6q8l4c4bxSpJbuV8v01VBmqy/Y1j3ipNEhErYgbv5vY3OACv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628742; c=relaxed/simple;
	bh=XhLKaJpFjJZQj7yn2g+fkx1VUJf2EFpLz+SlbAbTNhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T18iSDiCfUk+yirPUP9YeQn1p5hg+AQqrABinCcWZOaiV+E1/ohhSi+K383/LKJRUNrxXd24iIyBx0k7uI/hk2MAC+T2zSZUwQ69VrkozAbg2EzGfsHjpnPctjlV5Dzd7fjmmPbG5ReV1lhOXDwVnQuek5k9FoB36zbe7E16TLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CXFEs00Z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CXFEs00Z"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso6352445e9.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628739; x=1721233539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=CXFEs00Z5J8adHO87gz3RcJ7bmRRklG+NcgawE0SzldweQrbyWvBmyc2GRKK8wXT3p
         pMe3vdSW8fSE6h7By/iWb7DgCMdjeFbnNevvky4Z7yqa0DUzrouO/429ZEQ3PbpmtGQM
         3J6/LZPvJYxJmQXuLlTmu6u4B6pWBKq0evKRMk6bc44Qe31ONu9BIeSDyKZ7JRp8bWny
         JdDuqrOdy7+JhkSsYyO8Vw9ROh+0Sb1jPVr8MTkXOecauVm04KIMYgGOYmh3j5nWF1bg
         WtiAYCRA+2qJlwr8hNofyEdJBRQJhDHPh1FG7C4hmR/Uxfo5YX82IHI2pMmVc00GTRSE
         SwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628739; x=1721233539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEvOpWPnO+AdwLbOiUNmMA/qUdgyKNblxOI/csLZzos=;
        b=o1/DI+nY4E8q6Ym4GvJMkI+ByJogCtR6AlG/Lqeo1Xt/4XdrygPW93WSe9FV9f+Pba
         IDVjI+3q+EJHX0FtZo/aQRJaspjk8U01AJtwiSSwTzKBIDwxnLCV/0f0d+/9zqKSHanq
         zjUE4VxFXOPeIMAkid3XwRAb4Yr01gtj/gZTsgrZtMf0rV/AZtd8Gh25SAc49jZPirCF
         2vM6BuvREQoYyREdxl/iECAI1NRUMyuojiLKCheaSwx7AMcBv2K4q6bzeuDUTFGGm5m+
         frqxvKTYoQVwfXvK/6IDqNeaPp7ltqSZhfzTL0+zJiZ2gLV+HKl8toM503US5RiTpac3
         28Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWpVbq8OumIpHxhVP4Auuf2fZzquXxH54q2tdoEbX9RRuw6VP980G38OB6cy+pc0nTWacN576zBQmajpEsSJbCXS2dNav32HEHR
X-Gm-Message-State: AOJu0Yxz451csFaSs0EjDzqnT13hjLmD1TPsvjiFcmLXiDQqldyeA99h
	rwVzpOPYaT0ypFIYikh849EM/fw2OOrnNTk6vqqkpqedaceIEn/NPC8IQDl148M=
X-Google-Smtp-Source: AGHT+IGEAqgF56Q6WhhGNsntYmhXMllSRTjGVzvDJz7QmMwzchYfln7Fkm+0PHq8i2T834Jv9qxoxw==
X-Received: by 2002:a7b:c4c7:0:b0:426:6fb1:6b64 with SMTP id 5b1f17b1804b1-427981b7727mr1634915e9.7.1720628739119;
        Wed, 10 Jul 2024 09:25:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/8] reset: amlogic: add driver parameters
Date: Wed, 10 Jul 2024 18:25:11 +0200
Message-ID: <20240710162526.2341399-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
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

