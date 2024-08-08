Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF3618A6D6
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112888; cv=none; b=VKJ6t/K5BSsfouZHPP3rdJkH8IyuIzsFUrQ97drl1DtVwnaQ6au2hUGSyKK/WFRRk5kYLy1j81ZqCr594iuMB1afgbbLRQi53omj7iSpYyuhGdmmXYzrz47fCN+JjoGf54JNbiw/I1+nR4YNEgVfhlhsZv5WXAu168ckByb1Pc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112888; c=relaxed/simple;
	bh=QSWG+r3Q0UIT+KgY1i3jfYrp1y6wAWuw6wMU7KYNqvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqY8L/WAuIA+yrJq6uTf4G474l1shW3i/kxzPj7OFEN5p4KkcKEMr1UWFOTJ9eZRciUCD/SJRivKGIz2b1OzvNgYTyhDfnN8f8NHMHqHMesFs2tTkR3CKfbMNXInLA24CVr9M+QSkq4opvIcAwO+kNNbxdtrEABpbI4HYUFYLKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=w9kpg5+z; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w9kpg5+z"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-368712acb8dso449339f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112885; x=1723717685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPYzDSfyZeo+xZ43EsOSaQrJlRNd4kYLYsIOWeBqO/s=;
        b=w9kpg5+zHyEZm6QLmPA+jRtvjlFWB73KKW30gbO8cyQxSE3vNR65uWu2jONonveNnD
         SyVg23rTODLDrPLq3oh+X6JipYObIREM0mGt6dHc9andA95FQgzcecRYJrC6qWonoJja
         BKlkMOBLNIbzoi05bdXhrTEQ1Lb7g6KeckW+nFfWqnXjUTEVuP/G+FzCcY21RceCImwV
         KHnP/DQZS1/Y9w2TInsXYhaE2qc2rwEjU7ejNgy+4c8Q0cKJRg8Ega2QW7RLpy+yONo2
         6kvPwIaOijsptX4Xx+7DFtLR2i4WK09KWtWJwFjHl4oz4uizDz/mzSENuxJXeunRKrZX
         HIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112885; x=1723717685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPYzDSfyZeo+xZ43EsOSaQrJlRNd4kYLYsIOWeBqO/s=;
        b=AmPsLxyWA5YZadctZSqI6m/T7rgFJUVVTTQiC0r2TmlnUBlWwHujK53IbisVgSygva
         eDS64pH51ao+8nwunFYK57kBBNNfUkANQGg/A8OFm9jR6nzYmnKgDzWYul+bB7kMtQX6
         WMFE7gu/GHzcREpQYlsylqXUqi8/tjw9Ft2ogrIsA6CgD6AD1pr6esUIRuT7vbo3eOuP
         fntBeRpFtxTNO7q7OP+nt/wRWwk7NNgbR+PWUONt8h3zsEx/O3gxD7angHYVa9vyOS5s
         4T9WTYyGmaaO/r1a4o1Kssw5gaJIqn/UlyTcLPCFTFeMlFCCcG8hy/NOxhJuBdavCPrT
         SYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ8eJmQfWJ8R0RH77mh6mtJCgugXOs6BtJ4Ercn71SoLxLx7Yxq9Ok/tqfmy18RzbV8aaIQcYmiU4As1sucev3SdPsPrGTZ5Do
X-Gm-Message-State: AOJu0YyhZf4NAX88DRKZsy/lBf6DE6qJrW9J0a9xpxyEuY6tDCRQ+NS3
	pfUI72sQCr366tSGsRFRqR/R+vtg2IPoqF1DTEvQUa2CNocPo2hmD65TpO5CMXY=
X-Google-Smtp-Source: AGHT+IEvuEQLxY5NIcMxDxzPylcOhqHiALm1zbKzM1rXD702BA4RHo40fITpoOTHXRDRu8mJI7TSYg==
X-Received: by 2002:a5d:588d:0:b0:368:4e38:a349 with SMTP id ffacd0b85a97d-36d274e0773mr1313790f8f.22.1723112885055;
        Thu, 08 Aug 2024 03:28:05 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 5/9] reset: amlogic: use reset number instead of register count
Date: Thu,  8 Aug 2024 12:27:35 +0200
Message-ID: <20240808102742.4095904-6-jbrunet@baylibre.com>
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

The reset driver from audio clock controller may register less
reset than a register can hold. To avoid making any change while
switching to auxiliary support, use the number of reset instead of the
register count to define the bounds of the reset controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 8addd100e601..5b6f934c0265 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,7 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	unsigned int reg_count;
+	unsigned int reset_num;
 	unsigned int reset_offset;
 	unsigned int level_offset;
 	bool level_low_reset;
@@ -87,21 +87,21 @@ static const struct reset_control_ops meson_reset_ops = {
 };
 
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
@@ -148,8 +148,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
-		* regmap_config.reg_stride;
+	data->rcdev.nr_resets = data->param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
-- 
2.43.0

