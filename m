Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7241D4C8
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330363; cv=none; b=ubATlM7N9UY5QNlHB1BPdzb2+tA3+TisAgEleA6VbfkTy7mrKzzO7wCuqUaJINxbbWu5CmNrlN3dyBgjv4BkOZ7IBqlD7HalkgFSmWf817fgOtYHd8Ycq3UA2hd+pr9RkDWao9NydJYHweslzbaCzfNkKBfzv2FBw7UcHwh40cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330363; c=relaxed/simple;
	bh=gRy0cN4LadJrCLwhwvNgyXM95hAtl0BkbsLdjuQgW6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aud7P/v4XD3/6PWF6opVlwSQlcNRTtukIzp9K5iqqELB626PV2b1o+37QcFTJv2LOS79eQe6WOmWUKnsMmW3FF3D/OFLm7HBp8ysYmUST4rj+duOpC5e9uw9hDPp66kTA8GyohE+YVaHrRQoCCaNCCoHgzOCjTrL/K606K6dNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AFvRO7xA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AFvRO7xA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso10916035e9.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330357; x=1783935157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=AFvRO7xAjGEzkpt6ryXRWzKzc+epUD3KhyJ7lVkwpdXW93uBaS6n5Wc2Su+u/10XJB
         9mgJ9QQq22neqpri/QlTXtfm3kP5QsrwYEfXJuLQTvllv+zJ/8XeMqR77dZ0atfYGN4c
         Pf/zQlsItqN80N2e2RwWSYkJflp17h+jMvaVVr1g61rA1yIkuTBLTVl+8NCPylDcXx+g
         ugavKRkkbg2kPpbFd4wZSALp3X4L17vGmUSckpkGIHGJ4jOFzlt4TBZQfwNgNdC7tFYA
         n3Z8YxX1IX9Nr5boCbkdSBseP2JXVc5QH6tGewsFoJKmt7S2zD+exh/HoM/9aCMcnNYF
         Vdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330357; x=1783935157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=UbSgpifyCRWx1gZ/N3KEiafqqWTO8IfgRpTtdzK5Un4UB3ar/loX6yWmpdGVXdET7j
         bohEvrZwISH4CEnbn9bG2R6ynCvnIcmdRE8FX+57rwy1lp9UIng8U50dfNhkMetDrANf
         f2MeR2piV3cV0jZD7e/k0//ulwqtu2yWCh1bJeM4RvxN2mf4+Ps/F8DITxp2xhSUnobM
         IZSt4F9nT4GEPfWx/SYcM+oMZpSjzoHtGwww5sjhkhIRESVq8vSHKpDqJSKDsq+Vaesg
         gIUEzaXzG58xPFpbDfGnroARnhTuQ8SzA/TVJIL5XvZF4Nyh/dD7EowyED/46RbKk7o9
         qJqg==
X-Forwarded-Encrypted: i=1; AHgh+RrDx+ENt7Oubq4X8i0rfSbQynNBpHx005ynYNXIiOuwQe21OpnU4uClAjneQt4JeoL+Q8IbccujJlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXcb5lpQdh6NJ3yHysxhnEBJRaTxEMG75R3KjLeUOmgQ2oROV
	qtqGBfI18WuV7iL21fYxBkcvN2CiTiszsr+K37+wU6thlsouH6eUBFCWdsZMkgWEuxo=
X-Gm-Gg: AfdE7cmbs7Wz8bmUtEvgu72UTHtJqWKC9/5mimUEmI6l5ZDMfoC9uUC5rWZLCqLXJ3L
	4E1auHiIa5EhG8zL+AErtfylVuUgi7cP3FC35U6ILWDHSTvmzRxl8w/XW772Jzi2dkGg9/evoto
	G/zAiSER5Jd9lmd/eW4lCIFkd5yISFpPWqcUF3RnI3JPuTvgIhUQ+gvrXFvZGH1jRe1tOi1dPxG
	NSENg36EWS3LU9OqHwWx4agVrXnPBr8/5Us9z0uK6bnm34fIG5ZfnPrrScwTufnN+ke+6enMgHc
	50135COUEsB6m3bDUpdoXfEH/78wIQzvT0ynfBGsFHxXycN1670KwM6C7uzVLdyRbaKfqUdf2U/
	nIk1oOkiLd+ZTke7ccSTKIJTaZZ7IhOslavkD8BxcrEp/mBOuS5vfhcpZOb5MkJeKzYmfUbc4tn
	Or0renFlBBG1w=
X-Received: by 2002:a05:600c:c118:b0:492:3e66:6c84 with SMTP id 5b1f17b1804b1-493d11f918cmr92947785e9.30.1783330356762;
        Mon, 06 Jul 2026 02:32:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef11338sm377772315e9.1.2026.07.06.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:13 +0200
Subject: [PATCH v4 5/9] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-5-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LjKLqtELI/k5Bm86qG39EiNLmLLQg2pvRCFKcypyAtM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Ykm1EkaDJ069gqM3tqzZUAo6EzOomoBvrrG
 TY60PbIiaqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JAAKCRDm/A8cN/La
 hY6PEACcL49Jv+12kjoAQsDpUPA5V1xw9VbQsEtOPVlm9vqqWLHZwoaPT4wAlORrO3AdWbLsP99
 3Va3GrObwSKZUgSScUTpAR9hNRd4uB9ay8wsEnI5doSKc0OxjECZvx5YIFWne9fn5wvJSY4dABo
 Nd1qkF+KcOd+L3w+z1WMzohuFIjRPeYo03b4QghplwZxrZrOO3erSNWE/6WdDYAVfiqCz8ozF7T
 sOBaTPh2Ya9YSPxG8OvqNnj8m1N/ozmgUCXMacKz6ZkiZUSWhwNSKytFZLrzlQHAV6d68XpK3Bd
 ztEjka3alClmehE5im7V14RfDcdAlcVDAIrxt2BCWmSHynOdEeykUKnkDaLBjC0VB3J9S0mK/Ea
 rfPUwIey53EGCzJWVafrOw20jOAmZYKXKC9jrmjmGIrrPI3kuQ9cb3jK+OlPdg2Dty7QiTX0Vnv
 smnFnurV6vL6UW4exhKbzae8TERopeRgMXTYpc1OYQuFqA7ayOUzRGbgj7eo/IIxrdfk1Am/LDz
 x9P69Vo0/ZnQUBQfQJD9pJPD30bDdiqSBFh4IGlArPzp/azMB7F7CxxS3rXjTlYfNTQAOOxYVQ4
 VUMsLMUDKkFUmjJH3j5UYg9xA0MhEEwbjcDiIPXoe9Lohy72G0WpUdGGtMMf45iETg/TYiK8S3/
 FwG9c4GpEzDcYfw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0f528bfaed00..b24c8b196e66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -52,8 +52,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -80,7 +78,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -119,7 +117,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -134,7 +132,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -148,7 +146,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -167,7 +165,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -358,7 +356,10 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.47.3

