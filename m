Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F03194C94
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720628745; cv=none; b=QkE/LdRXfCPignnJq+YYipmuSgjX4VCr3WYskpez8jyHb+uyvw/sSTAViKAoRIUUhoGLc2QcDYZedyRkZMxhAalMLme936ee9Mi3rDuKqmCodxqI8YcoFnKEpWUrWOTItnM+was74ZNTFGxXSUuaeNvv6QxAmQxi0XZjBqD53iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720628745; c=relaxed/simple;
	bh=Aw+qOfPBAhV3Wh+oUUeS3SfuDDbpI8Ih1xiyhtsZ7/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aoa1HNVe97nlTX3NXQLLJaztrO98GTLWDVtRa8Z4PvoUiexQg+8zQvGjulvz8RIBDTePXCOHPeNxTs6MoPahRyFIkWpinoDteq0hrK07lsO6RyLoAxWf0vmvv4amfV9vB0xYdcRrtKlmOzfxO0mdFmtbeszbeTSqtGWR4KEWF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fQlilCJg; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fQlilCJg"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eec7e43229so933441fa.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628741; x=1721233541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pscEsLCW2+xzc/V+pxCdqIstr838YuHky5BjadKIhsg=;
        b=fQlilCJgsnJrT41FPRSbcJpkoaM1cWudDFazfemBhyXsvNp5iNLTbQOAaoWsBYwPKu
         J/P5R9KEwhrWtzqNDaS+gdb8gH5dk2ej+ooffFVdtNjY2/IIvg5adTm50SEdgyrTAQ4U
         MfJmpBLW5Opy42Vp8nBgEh2phSSjYOxvxTef/U11hUYsPlgfPThyjDfLF7B+rbyuZMuf
         WqpL1vuOfiEEjfQyOsaWWZSDYs3oQWoUyvSumw8ja/doTw8kPBej712VW5CQKZ7rjg6Y
         9vIKRRmZ0qWuiwrlxq0mWF7au0Z0cj4u/FgLPLlYU8SsPAJ7aTQxYlZl2acFqwMgxJiS
         d4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628741; x=1721233541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pscEsLCW2+xzc/V+pxCdqIstr838YuHky5BjadKIhsg=;
        b=MTA0UXWHmjE3lhKQLpIYGbvA5IV5E1oYOkJWQhWhXUGXKANva6kh/OZNmBsa93Q718
         AmXsMLK27Hy3uKNgdbNd5H/I9+ykDZpcZGB5GoxOby5YoL9m9J39uqZkr1hzvNHjirnQ
         ijuBMRgWr0ztY1zTkqLC38X6w1/Zaxx6CZYgXpJcbkAdeE52jyB+FHTOPwpeOHyEqXHy
         /bPHK1fAecqMeApxy+9Ksio9ZfCsOfhF/g1w1wcTCd5QK8b1C+nJ28IrntEhSQpKBStf
         oUihQi75eTsUEeWPTYZN64efKSAeibhPMGOY+6NEuHR8IW7x6no0IO0pdf67ImGarCr5
         eeZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGsxwjV/Qygg8T42F8VxrKNwp5Kz44rDKr2ky7roqU2AqyistYcu5om5STcYuq7YBJ/vYTf/jwxfieI+c+kNdxICC1GsEAffsc
X-Gm-Message-State: AOJu0YzPdgFBrSSMXmkIxqwoEpFI7AWcbis6SudXCqr5ImLZz20j3UH+
	GiPkRkBPPr20gcuSTx4TUvtVtWrHZPy+BZgLOiw+UEMDy6hGhDI7qODwjefH2DU=
X-Google-Smtp-Source: AGHT+IFIOpVSt5nlbmui7fixIPX2FqGConbERPv2cHi/A6AIyFf4bo75VDo2gZeMvyu3iyHJ9ZWGTg==
X-Received: by 2002:a2e:3315:0:b0:2ec:543a:b629 with SMTP id 38308e7fff4ca-2eeb318a0f7mr39237081fa.34.1720628741455;
        Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 5/8] reset: amlogic: add reset status support
Date: Wed, 10 Jul 2024 18:25:14 +0200
Message-ID: <20240710162526.2341399-6-jbrunet@baylibre.com>
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

Add a callback to check the status of the level reset, as done in
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

