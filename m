Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5EF189F5F
	for <linux-clk@vger.kernel.org>; Thu,  8 Aug 2024 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112887; cv=none; b=pw4Q1fL6A5l1cQ0SOi2Ji2xBqBnDB90QOyFtU0N0JDVzXHe60XiQY5jza4RpYrbqWetN7bK29X+vQW/fjeh683ZvOMqe6Yp/hsvBIWI090meh5O1dLUpnHl8lK7PMYgdRBM9ku3U5fZPObHfKDN1ibDvpkgqojOVYGOli7MA6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112887; c=relaxed/simple;
	bh=VxrGpDNMX8R5lgwAxG/KzKNsVWNXJHDG0Pc8zBTHDuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peCVzQXOs6cbi8TWvXlDJGMppFidpJBFaqKzJdLBltF4R5j+Dr9riVEnwwBK/CFC4on1YIHDQHSoBLOyE4cj6nJUhQHTiUvPDhVK7l7pOEOEJuQV2vnd6iucuxWq4MnUYQHeYasHOQLoa8sqPopVcHL0s0+PtJujH/kp8AWID9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R8OHwHbA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R8OHwHbA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3687ea0521cso587029f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Aug 2024 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112882; x=1723717682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3DHNRvZJ0qhVqYezcY5P08/4agts36gA+QW7VdWHFk=;
        b=R8OHwHbAJBsRO+niJl6HGn7NDKmzCgGVz412HBem08wu6nwvEUZyQdotZGYj69I7qo
         oHjJcFGStH6+FZrIWDciPgmkEPPexxxUZLkd9JGRcIupkom31i6Ux/96QAN3bvmQyodY
         gHEwG4b412i6o4fsp1yslUUc6EEOSlw9SmviBGnPyEs6kKn8cwria0omJkxpWHeRKtf7
         T6V4lNW0GnYCHrSufM079OPVWGw/wrO5YGlW1rLBfTnzLyX2gRNmFDZfGdiH7PCSae5e
         p+3wOW1yBfKb0mY42hW9y3rCdEYJlS3vaydG0mhiilqcdRSr1GtxB0b3UQg+mH+tltvs
         7vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112882; x=1723717682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3DHNRvZJ0qhVqYezcY5P08/4agts36gA+QW7VdWHFk=;
        b=CJRsj0lGV8skblimsI1uYMrkNnTdGBSSU4gb0qH1OTNWBM2ZDTuEStIOnykmM/KK0T
         gT+DA+fEFyEniT8wdUv1gxK9dDLgPh3SEVcUPYWnCKOluIcmdRaLI7hVVGNxG90AJ+Xa
         lVan6XcvZYhKIO4TJPwQkGdV2nsvI1kpz9stjghXv05bDT91zW8VVw2i5tkn43bYrlGR
         rrqFc7Ew+5tTcImUos9xdZjhWipmuPxrFlGdyU7MjyYM98Py0iyTe3wXHbn9kOqPiRR8
         y3XBRTY6NZ8aAdIddJ6wSPVaDowjlIrwYIhgucfkiID5UnKhB2Rd/Nub9x8jJ/aW470h
         a33A==
X-Forwarded-Encrypted: i=1; AJvYcCUK1sYG2Yqt3w073Kvt1LNsxanhK3nIpBZkmU+Z+hBXRMybbRDLsRMPk4D821YBItjTbMwAxv3hg0fssdEMVfA4V5TpA7nIdwTg
X-Gm-Message-State: AOJu0YyOPI6+7HeTmxQLQc72NKGOi2uXAqEpKB/N/6V2oNiE7tD+D7KD
	nrYB8UYAYJfX2kbcRNKBXnPNdwbcXyHuQ5SITBB101k7wKg4kVqcHaZmgDCY7OM=
X-Google-Smtp-Source: AGHT+IGrQMQ9Wgj8GAuLCg2l16C1IOiYtKXoO5s1FPVyD++kkP2maHUyZrFQlTnKv9XjfgZ94mwS6Q==
X-Received: by 2002:adf:a356:0:b0:368:78d0:c240 with SMTP id ffacd0b85a97d-36d2751ce11mr1193495f8f.35.1723112882103;
        Thu, 08 Aug 2024 03:28:02 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/9] reset: amlogic: convert driver to regmap
Date: Thu,  8 Aug 2024 12:27:31 +0200
Message-ID: <20240808102742.4095904-2-jbrunet@baylibre.com>
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
auxiliary ones embedded in the clock controllers, convert the
the Amlogic reset driver to regmap.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 79 ++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 36 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index f78be97898bc..b47431a21b86 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -11,36 +11,43 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#define BITS_PER_REG	32
-
 struct meson_reset_param {
 	int reg_count;
 	int level_offset;
 };
 
 struct meson_reset {
-	void __iomem *reg_base;
 	const struct meson_reset_param *param;
 	struct reset_controller_dev rcdev;
-	spinlock_t lock;
+	struct regmap *map;
 };
 
+static void meson_reset_offset_and_bit(struct meson_reset *data,
+				       unsigned long id,
+				       unsigned int *offset,
+				       unsigned int *bit)
+{
+	unsigned int stride = regmap_get_reg_stride(data->map);
+
+	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
+	*bit = id % (stride * BITS_PER_BYTE);
+}
+
 static int meson_reset_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+			     unsigned long id)
 {
 	struct meson_reset *data =
 		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int bank = id / BITS_PER_REG;
-	unsigned int offset = id % BITS_PER_REG;
-	void __iomem *reg_addr = data->reg_base + (bank << 2);
+	unsigned int offset, bit;
 
-	writel(BIT(offset), reg_addr);
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
 
-	return 0;
+	return regmap_write(data->map, offset, BIT(bit));
 }
 
 static int meson_reset_level(struct reset_controller_dev *rcdev,
@@ -48,25 +55,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
 {
 	struct meson_reset *data =
 		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int bank = id / BITS_PER_REG;
-	unsigned int offset = id % BITS_PER_REG;
-	void __iomem *reg_addr;
-	unsigned long flags;
-	u32 reg;
+	unsigned int offset, bit;
 
-	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
 
-	spin_lock_irqsave(&data->lock, flags);
-
-	reg = readl(reg_addr);
-	if (assert)
-		writel(reg & ~BIT(offset), reg_addr);
-	else
-		writel(reg | BIT(offset), reg_addr);
-
-	spin_unlock_irqrestore(&data->lock, flags);
-
-	return 0;
+	return regmap_update_bits(data->map, offset,
+				  BIT(bit), assert ? 0 : BIT(bit));
 }
 
 static int meson_reset_assert(struct reset_controller_dev *rcdev,
@@ -113,30 +108,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
 
+static const struct regmap_config regmap_config = {
+	.reg_bits   = 32,
+	.val_bits   = 32,
+	.reg_stride = 4,
+};
+
 static int meson_reset_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct meson_reset *data;
+	void __iomem *base;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->reg_base))
-		return PTR_ERR(data->reg_base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	data->param = of_device_get_match_data(&pdev->dev);
+	data->param = of_device_get_match_data(dev);
 	if (!data->param)
 		return -ENODEV;
 
-	spin_lock_init(&data->lock);
+	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(data->map))
+		return dev_err_probe(dev, PTR_ERR(data->map),
+				     "can't init regmap mmio region\n");
 
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
+	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
+		* regmap_config.reg_stride;
 	data->rcdev.ops = &meson_reset_ops;
-	data->rcdev.of_node = pdev->dev.of_node;
+	data->rcdev.of_node = dev->of_node;
 
-	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
 static struct platform_driver meson_reset_driver = {
-- 
2.43.0

