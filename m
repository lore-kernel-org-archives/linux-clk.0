Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028AD14D6E0
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872135; cv=none; b=AFxoYHVYAwiCfhX3xP/LfQOe/Wvot8e8+Zud0QMEu1XP3LuvZ25WInzJE30cafQxalJSa/Rad0NzWAbgdCsp63h47WAmUPJ1Q090RoIAddCPFFZW1upsyoESRWLWjBEAmXDCIk/Pgspj8GPAdD+FLmLiTPVYlXQkK4htHw7QFwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872135; c=relaxed/simple;
	bh=iaknELToT+8y0KfW1nvtsEVAwfzQue3+xA6phI3OqV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8kNWh9NgKgT6haWGjtp10sYa0Qid3oXzh2nlsQKlU2hIJT1bpCa65dUswqEoUImVLMyxXM4CbslSOdt/wh3o1toBZhEaILZdFygC8b+MMACCrNvjTb3VO7CO+kx15J1OZSo+HPeSCGzPhZDCvsnzHFFCgoaa9lnhPbDZKWNfsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uiqrYctu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uiqrYctu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-420298ff5b1so9464015e9.1
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872132; x=1716476932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKLxWZMdcIpvnKpiYpSqkgcStnHEt9yT8sCcERiOd18=;
        b=uiqrYctuTsCr0cP46z67CvPT3Av3VYvAodWSJPVzI4bSDfJbHMWx41e6sCxSWmAW2V
         gNvh5WxQUcTUE2R5zFhfMQrP28R8lXZTbvIVwQwdB3akI/909gBnZIxtg/8uZUoTnGTa
         K2oTOgjvKJfwzmSUSYVbDl3LdRPyDiHQsJqlqn23b82PT8fkvvWmYGJAMzynWlFlpq+R
         4cxD/QHcP6qNR+Fl1encudwEu/qdvPgrpfjqMl3BUAYpYsIA7VSyhV3mFsy4/gfEYdmk
         gw2I4hVxMGfyP/kg2KwKUCV6HKtZr9ggM3W0QFnj8fuebAbwnpjoV8STvxdRxhDoJOAK
         AE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872132; x=1716476932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKLxWZMdcIpvnKpiYpSqkgcStnHEt9yT8sCcERiOd18=;
        b=sUr1stYhCtBq33/si7mN3Wwoxa2biD3HqpiVtivKdHftQnvVZP0TH9MPW3BcvYzFUR
         FGsdaX2MJQK+SSzQYNghV+JLpYB9X21BiCeB15Co7JkFT5wWbwPaSX+m/nGq44Szo2aw
         q3g+Nw/EkiVCD4TxWh1eZrTLKr6ISmAzpzQEAoXcb1hBxAK+jNI7opZFGbqaDy7NNZ8w
         Nxv3e2pUsQ01ZQz8VwNXVgq+Z6uGj3N1Q6EJMwuwbmkHcUwG8BKyJkbTPRwpwUdA0Js3
         De+A27Kr7prniXi7bJD6JApaOIXDxwQr4fOEptb1ui7pbYAIs3cdBqHMe3MO9Od8Vsp2
         x3gg==
X-Forwarded-Encrypted: i=1; AJvYcCUQb2JsjEfVTg1gaPL1mT2FHulgaDUA56TCWS4hHhAZFdZzbAmbBqd3G2H/os8y9e522b3Z1Q5L8yX2ZIXsea2xwtk1juxRQ/+3
X-Gm-Message-State: AOJu0YzGatAEfwQxY/9XzqwVZD6V+wDXPNK4RZmHg8TAz2gZwRgv+T4b
	uCepRNkW68Gllj6YslqMgVDYQHchM/7AtQge4t7CNxhDqQT30RMV4MliSf2pRq4=
X-Google-Smtp-Source: AGHT+IG/ykFXrbe/CvlsHN4du9qU8bGGEbwc+8VNXOgZYoQoZ5vQI4mqtGU2dnI3Uc7WqDGAtugK6A==
X-Received: by 2002:a05:600c:3594:b0:41f:e10f:88b1 with SMTP id 5b1f17b1804b1-41feac55eccmr187308155e9.27.1715872132571;
        Thu, 16 May 2024 08:08:52 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 5/9] reset: amlogic: add reset status support
Date: Thu, 16 May 2024 17:08:35 +0200
Message-ID: <20240516150842.705844-6-jbrunet@baylibre.com>
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

Add the callback to check the status of the level reset, as done in
the reset driver of the audio clock controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 3e0447366ba6..65ba9190cb53 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -69,6 +69,23 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 				  BIT(bit), assert ? BIT(bit) : 0);
 }
 
+static int meson_reset_status(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct meson_reset *data =
+		container_of(rcdev, struct meson_reset, rcdev);
+	unsigned int val, offset, bit;
+
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
+
+	regmap_read(data->map, offset, &val);
+	val = !!(BIT(bit) & val);
+
+
+	return val ^ data->param->level_low_reset;
+}
+
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
@@ -85,6 +102,7 @@ static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
 };
 
 static int meson_reset_probe(struct device *dev, struct regmap *map,
-- 
2.43.0

