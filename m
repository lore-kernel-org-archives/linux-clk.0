Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293FB194C66
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628744; cv=none; b=pXlCiqMvugCaCsq03bC/PejpNr9pP4+fvIuSSL/6oltBz2Pf9PRmDuDtiEQi1iBGo6RjVFParKVmdzeU6vgyXYcN9/jd0UiqJGk4qApx0cu7LVPc3WlFImqB1t0xki+O1NmmjIy/2U/pPUYnL/g9gHpT8cRZUMe/yqbgjSBvRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628744; c=relaxed/simple;
	bh=G+dvNYQOBLr+WoKmLXh98J7Aryp0MXfhIBc7+yfe0sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9qu9ixT2yLa6RNuAWHL5J81WX4Veqaq4/v6TXMj/jXx1OGxdvXFxs0YOEYh5dxB4wnzOwXb8nBgmf2NQRUle9pkg7zANV1vE4jwVkF+zTo14qWZd27HQD/KuByouuSHI9YzPQxH/j80wWINWaPRdy4SmaYZlkBfAnsp6VsicNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cfiw1nN2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cfiw1nN2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266b1f1b21so22067215e9.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628740; x=1721233540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=cfiw1nN2l+n0NtGqQDbJ78cuqjAZbQIuvGBIa05C8RKg2q6Xhj4mMtYMgmuwzaR5xw
         c0QnUva/2XNWm8s06iYu6i4xDhqSNczZlrbl7yuuJi2L3q3z0S8E6zphmpsYLhNMf04k
         kvhRxSbL+8bB8FJEKHYgCNOdA1zDkhzS0F9Qe5J2X+UeFYOZYgI87YDSIWumEBzg67s2
         6r61/KeAUAf0LCmWPgEVO5qxF9Ogs2uAoY40n9HP6gLaauCAwtOVfxNi4d9HaB9CDVhE
         saMLWpjnmLMlkwwOJnwm2Bgl4UMdR2byaDHY2f8nbKlHzGcxC4sc33/OAPOi4cREHAX0
         QqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628740; x=1721233540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypBfZt6woLl48yZMYWLwJnxD1n063j94AW3SXRtrghk=;
        b=LOZmyEZoQG8uND3Zcfu3kLXyFF1yqbxDoUTn5TJSY6/KCcvmP6/NQH3Z5PwwCMbHVD
         yncRyfVDDVEnYqvFuY1wkbmQ26hFz7mOzDwE0EznNw9rkMot+//3a2gv1A5lU/Kd7+kq
         95fjQBY19nfhBljqs4Jvsw2fUqrMU8R89eAsWpQY6E1TROmB8Zf+vw6b+4aFltMfq0sU
         Fi9KnBDbc3del+0CGAQDj7t1dQkvcJPGjJ81ftS5KZT9q/Deju2EA1gzhcB662c9l75z
         YGcz64K5scoSXQgvLISG6vy+BIaPUU0MSbbzIgz9aVRb4f+U3ZSLTKv2GaSSdV6IsEou
         d4bw==
X-Forwarded-Encrypted: i=1; AJvYcCXhwQfRRbamXherdS67MQN08K0aXroKd2b6ZI+UEyIY3gMfdI9jcs6E4yo/wouL5RMgjLm0Mh0TKJ8SNuFBOASMVQx+htdDcKkY
X-Gm-Message-State: AOJu0YxmqZo0iCODrtJ9WRQOwnWa/0ZEWkc47qKqfuiAGdHzyPt9l8sn
	tqKRwDkGyJ4G+Se6hV3LXiMWi9MOfFImgvzbZFUMQxvKPX1CMagkJw9kFsbbm4M=
X-Google-Smtp-Source: AGHT+IEY6Gw5O2963Scyj/oRKu7QUIVR4X1flEdWrgEg+3YfHL8aVdfzQffvR8CC//15Yu303pOoSg==
X-Received: by 2002:a05:600c:63c7:b0:426:5f0b:a49b with SMTP id 5b1f17b1804b1-426707e360fmr36598765e9.23.1720628740679;
        Wed, 10 Jul 2024 09:25:40 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/8] reset: amlogic: use reset number instead of register count
Date: Wed, 10 Jul 2024 18:25:13 +0200
Message-ID: <20240710162526.2341399-5-jbrunet@baylibre.com>
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

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index fec55321b52b..3e0447366ba6 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
+	unsigned int reset_num;
 	int reset_offset;
 	int level_offset;
 	bool level_low_reset;
@@ -90,7 +90,6 @@ static const struct reset_control_ops meson_reset_ops = {
 static int meson_reset_probe(struct device *dev, struct regmap *map,
 			     const struct meson_reset_param *param)
 {
-	unsigned int stride = regmap_get_reg_stride(map);
 	struct meson_reset *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -100,8 +99,7 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 	data->param = param;
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
-	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
-		* stride;
+	data->rcdev.nr_resets = param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
@@ -109,21 +107,21 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 }
 
 static const struct meson_reset_param meson8b_param = {
-	.reg_count	= 8,
+	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_a1_param = {
-	.reg_count	= 3,
+	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
 };
 
 static const struct meson_reset_param meson_s4_param = {
-	.reg_count	= 6,
+	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
 	.level_low_reset = true,
-- 
2.43.0

