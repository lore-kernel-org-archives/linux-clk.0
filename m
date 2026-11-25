Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641208;
	b=tyi0qZU+fgAAcg/qx4/A/HnTeR7PUKFRTt5yF6373Ykruz2eisEkWP3XpBn3DlnwxTgy
	 YpsrVBkykkKHwRrHPl9DcUl1QyD8Osm6gld2ZexacsO0tI2ZHgJo6pVToj+FGdZxeY+LY
	 9JwiQvBPiHROjKCZn/bQTaiOPHO2dYAnL0i3XfAcrGqCXkWNM2QLW6hx9vVjf6x4zvC3E
	 N3MEGknS0BYfAG8Fgi0io05fHMl+kJuBIcdPLXqEZE9k9SezJ1icUCukq6F0OmRC5Nq1E
	 Ew00VrbV9jHd/7UiYIKTx/JZPePF/8PUdU/OE9kN7r9P4oNkGR/zp6WDYFzYbmXk5zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xXs6Urvjrwg0MhiNF5PgspNmB700LKi1Pl9ZIaKiWN0=;
	b=E7Th1rRGLUDAy5mOq2xKAP3FQdBmz5McHq++5qiyb2/hq5MtxQGvo28jGhnD4NWlnG6M
	 DekfTQ06bGIwkWhCWRCrveS/Sdz/K6KPk+cZRkY2jUCNC+ZNzxRn9sBVLFxwDTkAFxPx+
	 xyE/brbAnWi3c+WFEkK4m17lkMuRG8wLfXASQwz34zqyEbts3iW6Ct3fz2dfyEqHN3Pz8
	 Kii4B9+jYlpcXjFRWVsiQvegtuUHcMvdgbGCS402UFNwf48C141+gPrMWyNtYkolBR33g
	 KNHK2p6kE42zP1b3HGiwxc3qWnEcOnWnzAc001J9yOhEDpx0v9Q8dhFlvYKv3uh/zMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QYtmM41p;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334A606A321
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E334A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QYtmM41p
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so511196e87.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795641206; x=1796246006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXs6Urvjrwg0MhiNF5PgspNmB700LKi1Pl9ZIaKiWN0=;
        b=QYtmM41pqn1bybHC2O+QYm1el7W1qPS1RbFlwVwZKIANW5WMJ7BSwR/sN2qZ7k6IVZ
         dYYFZm78zNfQCVSeFNTqCmbUCgiXcTQQOWe9zHUyn+wH648TdUQKGADp0HVe+JCA2pTx
         Ysl00fc432si7vjAhucwAkk+sTcf6aPfxlBJaPkTxyiOohhujy3iHR9BC6Byu2Dz8LM5
         RMvwJU5Ug5GQ6QR655p8H94vB9MVeJ1eGKi9A5IIiNBYUa03VF7oBoDiiOjHpzj+0Bpy
         t0Ys09W2PE3u4L0K73AAnUGuordgjNp2fusaMUukklr53lCN/OrANUlEZh/NbR2Mxr3X
         54Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641206; x=1796246006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXs6Urvjrwg0MhiNF5PgspNmB700LKi1Pl9ZIaKiWN0=;
        b=fSYhPZnjsSyFbt24wfYRYmkrOCQoIp6HH3Z5n/kqCRQMhQAalxoBrSKqUdd1Orm6/2
         FnYKxUdKNT2hnyh4LaYcKu+jK8FQaSrTqREQmG/LeQfo7L3Fyz5aCYBNJt4VgAo75MVz
         ZR2Zw+DOuZxy3NqH1aGq+YzKis3y1jAKcMzbMfX+/FAcZxXuZ+ln5k7ioeQf0RVc0L3s
         2x60oBPP98680nrMJ7oAF5xxY/V0ObMj6SzsJDxRizwmB9wCoU7EU8fRYS12UHsoW5Od
         7d4R48Ztii2Ba6yA4F+YOWE5mXMI8IoAXNB4U9R6TawR4CFzEPJ6jT5HA2ZPnD1dx8Ct
         TSig==
X-Forwarded-Encrypted: i=1; AL+hErFriik/us4iMVmVcbVskOnwgPLJDoD2TtAFR8jDT61kWb/FhDpwoi8UzlZty6o3uhMeYCHOMJQb1s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hnyEWmk/gNe5LmyQNu1Ds6sN6niPYcvvf6owXsU23LDazt9WS
	nhHIPnVJbsZYH6hbYRKAuC6ApP0gxMcC88Jn4MCmapyHvxUkJ31O8jg5sAyEr3sn5aA=
X-Gm-Gg: AZFdTZcszMHHAZZ7rh9j2bz4l3Dx75YhWbNe3vjWALrzwiD8gx7nY/f7MbYsPg4whyE
	NF56/oqGUHXk9k6QjhEdtOIkAs8JsOeYfWeEdVkg8PzhvEU/CpAbdV+rTPw2yJ/KbOme2HFEFXI
	c0pyA0OgO/bk6UAYo/6pEqkloBBJyyPVWPiWDa4SgY731u6dyTSX1dEBJcHxPtER5UhtpiP6dDS
	Dz7ZK1oGEnWSQ8MaAfamoEFGMEBTwsiGLHmbu34XvOm8/iN70XT2KgnO08TQFTGcDWrJ56/Vk+r
	Rpn+CJ87NvVPsSLjNxZfk/+BXHQWFNPMwzEfyeJbZn/IE9vifEt6oYB8GxF/hxiiZBOTFdMZESX
	9+QSjv9ZuCgi1OnGANXOemepkWWQCbLqoboxucaYVFcFNd27ffCdpPL6e4kahtsYecPHcWRsmIZ
	nUBVZN7R3cvfKUPhJYfzqD0pce/v4ZpmiB1MlKzXbuTCJYODTHDVRSB51qVVld5l/k5D2Pvmh0L
	NuBuum4CbJtRaa1JY7dxQQknTn3HopbsGYiQW80RiUY6z16/L2lcdrxo4jmgiRdCeMhAW/sSVIl
	Qx2TwFfzfraL5fZzQ+VGsdwLlF1wmQ91o9UBVfgSA09l1r5ivKMp8T0jbrFTJ55tWlZ7eQ==
X-Received: by 2002:a05:6512:1318:b0:5c0:465:3fc6 with SMTP id 2adb3069b0e04-5c1bc8601a5mr6550334e87.4.1795641206204;
        Wed, 25 Nov 2026 13:13:26 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4858972e87.23.2026.11.25.13.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:13:25 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: Configure SM8350 Lucid 5LPE PLLs properly
Date: Wed, 25 Nov 2026 23:13:15 +0200
Message-ID: <20261125211315.1437946-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
References: <20261125211315.1437946-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SM8350 GPU and video clock controller Lucid 5LPE PLLs are configured
as Lucid PLLs, however clk_lucid_pll_configure() is a macro for
clk_trion_pll_configure(), which sets PLL_UPDATE_BYPASS bit, while
clk_lucid_5lpe_pll_configure() does not do it. Configure the PLLs by
the Lucid 5LPE specific function and describe the PLLs by the Lucid
5LPE PLL type expectedly.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8350.c   | 8 ++++----
 drivers/clk/qcom/videocc-sm8350.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index 6d2660bdd825..b80f41361de7 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -59,7 +59,7 @@ static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data){
 			.name = "gpu_cc_pll0",
@@ -88,7 +88,7 @@ static struct clk_alpha_pll gpu_cc_pll1 = {
 	.offset = 0x100,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_pll1",
@@ -601,8 +601,8 @@ static int gpu_cc_sm8350_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
+	clk_lucid_5lpe_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8350_desc, regmap);
 }
diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 8528aeb3a342..1e52d07861bf 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -63,7 +63,7 @@ static struct clk_alpha_pll video_pll0 = {
 	.offset = 0x42c,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "video_pll0",
@@ -94,7 +94,7 @@ static struct clk_alpha_pll video_pll1 = {
 	.offset = 0x7d0,
 	.vco_table = lucid_5lpe_vco,
 	.num_vco = ARRAY_SIZE(lucid_5lpe_vco),
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_5LPE],
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "video_pll1",
@@ -576,8 +576,8 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
-	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
+	clk_lucid_5lpe_pll_configure(&video_pll0, regmap, &video_pll0_config);
+	clk_lucid_5lpe_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 	pm_runtime_put(&pdev->dev);
-- 
2.53.0

