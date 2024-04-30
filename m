Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1083E181323
	for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714502825; cv=none; b=UeCFAWHkKm6gAQw73vjaFu+AkN/OzqEoYsTs57gEXobqydhKoBaJ9qldktF6pkRU9ItodWFnqTGrZKILl/8VGJahpbPI2tqKQHCWRr98bZCexewVR3MPfuvQ2GVzKj10nuHODNrHe1hnnaE09ia5UE1L9W/FNLedreYysja1dQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714502825; c=relaxed/simple;
	bh=oFbvGomouOb8wzM7GcwTJ0k1uS7OddQR4amzfZvK6FE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuaN3qDhuYHWPhYoUYXlTf6fxWhMzuOAKd+siHJUrN3Cf+glivlfiZwQT32/RUD9BODLSYJ4tMIEUVPy5S6TBXTlAkThvQpPdWf7FjhvTeF+MXA6xhAbNxaswCfz/Kkpsv5Y4vZgQsjGHQ7LtapsPiLOPjfRx0D4YABNmm60/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z/Gy4o4A; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/Gy4o4A"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51abf1a9332so8322813e87.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714502822; x=1715107622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGUPpr9ka2yo3ECRl+7yFv4d0kGzQn5S5/kDIVOZE0U=;
        b=Z/Gy4o4ALnVTB50fcnzVJRekAWA8JElRd1LZWx7MZNlwBW/ol/ZIZXqq8qR/lC3ap/
         j6wEc/wg8XFLD5CpPpo6zFCEoe16+jBDFkFnnI41eOQZXSYtWdtEAuboWfsHxgVmvWwa
         UNWri2oHx9t9l1yThFgiaNMSRHmn5RScj3Ws06YY7EPc8c+t16Z9Y09nsu5Y8wkSGm6C
         grSweDJtdnt+ZwXh7aLdT29clKYBd+Ozy7Sw8M1mEqZ9y3CYWleRpZTGKEDqE7zc9tRL
         sM80VAkswi4BGVecbaYfQPUtACFiziUl8TvBneo6+4NiqY7wgiIwURiiwLf6wAmAdPvi
         ICvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714502822; x=1715107622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGUPpr9ka2yo3ECRl+7yFv4d0kGzQn5S5/kDIVOZE0U=;
        b=Cs0BvVk3UQYA5TWODP0Ku1XmTcZHl06AaTokCt6PL3sRWK5osnq3FRkEoe9P8+ZnjC
         7dMnss9oAF7vUMZdN82sZvOyLr1e6/ZNAEuun79/u6P5/rHS0Fb4hoFzByLP+PlcRuFv
         4Vjh9Onx2GcuW+xfcKR5qP90G/fy6BWZyNarJs4VwU1XPVNcmAL6EGQ7imp9A4kV4hv5
         ZL/+hKYOZFyaueFaoQCis8mzC2M+ZXUsSsfE+Ub5wNOgWMp+w1mD53M1KaxlnUH4nLA2
         4M/PW2EcDc6C+BqegVh7/KeqU6lXepHikyP1o6qSp6OxuZh7d+Ytf3eH+FNnP3+IgOUv
         +1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVtftBK451TrJbHC5BMzWBlfwQ9h7Cjd5Q+KaxAn936XJtsY+kRDkoHAAiuwHe21xx1pzUvAwA8VZ+UQtVoVfZS/obw97TcJ1JM
X-Gm-Message-State: AOJu0YxWjgIWvMK7gz+154bNP6H481WlH8ckvPvp64StR+Vw4bBiIlhd
	OANnsZf4I7SQVJAyaUrYhXqm9ae18pa0ZOw/AY2AczYx42SkDCqmhGdrSwx0jeo=
X-Google-Smtp-Source: AGHT+IG4e1N5kGq9RemNty3JjtAiFeV19cBEznK7pJz0Dw3AMf8mPmfPXykgRg20OdNXsoggOTEmfg==
X-Received: by 2002:a05:6512:3b8f:b0:51c:22fb:182f with SMTP id g15-20020a0565123b8f00b0051c22fb182fmr266000lfv.13.1714502821885;
        Tue, 30 Apr 2024 11:47:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id wg7-20020a17090705c700b00a55b17418ebsm11331493ejb.89.2024.04.30.11.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 11:47:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: [GIT PULL fixes PATCH] clk: samsung: Revert "clk: Use device_get_match_data()"
Date: Tue, 30 Apr 2024 20:46:56 +0200
Message-ID: <20240430184656.357805-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Szyprowski <m.szyprowski@samsung.com>

device_get_match_data() function should not be used on the device other
than the one matched to the given driver, because it always returns the
match_data of the matched driver. In case of exynos-clkout driver, the
original code matches the OF IDs on the PARENT device, so replacing it
with of_device_get_match_data() broke the driver.

This has been already pointed once in commit 2bc5febd05ab ("clk: samsung:
Revert "clk: samsung: exynos-clkout: Use of_device_get_match_data()"").
To avoid further confusion, add a comment about this special case, which
requires direct of_match_device() call to pass custom IDs array.

This partially reverts commit 409c39ec92a35e3708f5b5798c78eae78512cd71.

Cc: <stable@vger.kernel.org>
Fixes: 409c39ec92a3 ("clk: Use device_get_match_data()")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/r/20240425075628.838497-1-m.szyprowski@samsung.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Hi Stephen,

Please take this patch into current fixes v6.9.

Best regards,
Krzysztof


 drivers/clk/samsung/clk-exynos-clkout.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 3484e6cc80ad..503c6f5b20d5 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -13,9 +13,9 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
-#include <linux/property.h>
 
 #define EXYNOS_CLKOUT_NR_CLKS		1
 #define EXYNOS_CLKOUT_PARENTS		32
@@ -84,17 +84,24 @@ MODULE_DEVICE_TABLE(of, exynos_clkout_ids);
 static int exynos_clkout_match_parent_dev(struct device *dev, u32 *mux_mask)
 {
 	const struct exynos_clkout_variant *variant;
+	const struct of_device_id *match;
 
 	if (!dev->parent) {
 		dev_err(dev, "not instantiated from MFD\n");
 		return -EINVAL;
 	}
 
-	variant = device_get_match_data(dev->parent);
-	if (!variant) {
+	/*
+	 * 'exynos_clkout_ids' arrays is not the ids array matched by
+	 * the dev->parent driver, so of_device_get_match_data() or
+	 * device_get_match_data() cannot be used here.
+	 */
+	match = of_match_device(exynos_clkout_ids, dev->parent);
+	if (!match) {
 		dev_err(dev, "cannot match parent device\n");
 		return -EINVAL;
 	}
+	variant = match->data;
 
 	*mux_mask = variant->mux_mask;
 
-- 
2.43.0

