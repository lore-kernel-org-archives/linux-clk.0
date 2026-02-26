Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1F3D5256
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116136; cv=none; b=RMMQV7455HHTb4Zf9P64au2Mhz0KG77l4KKM7C/UK39J6X+G34YEUQ1E9nerFOR4WLvb+JmrP8Vtw5aeQN6qzB9u1K/mFYdMpoV0FgX4yFa0t10XIcO7zULIh0QaK/2El5TWfLXZ2G0FtPGgwMm0/ZLpY67tvl9Wh7bTcV+EniQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116136; c=relaxed/simple;
	bh=T56zPiTpvN0GBLBYQMGo9vQwbDNYOKXq8zVh3tggF/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAFQ6bDvovOOI57Zc4/tIw3z1AOypCSrnzWrbizvRXzDUmCg1R1D2HifHYPCrUzAjsPluoco8k5WkZAIXaLFIo2hW8FKBQ4p47VrHpFXx7eIsxwhfjZueqR8gYqlxphOr1zMnny2y69rszV3pV3xxyWQJml2DqiyPB9PS8hrib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nycydzJz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nycydzJz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4807068eacbso7903125e9.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 06:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116130; x=1772720930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJflEsJoWFuWsTkTz3+7munVvf3KCvZoSO705SUTMdI=;
        b=nycydzJzirTOBMNdtHm+Bi60nEds+2kfRU8ArAs6GdGYGqbdkve4XmfElmiD598pQO
         yav2DYsIIk7J/dmlg01ygdMCYUWhy4Zl3qv076J3b68mJV1YCI5rJNX/oCBmHu3dTINF
         v+gLKxqaH8C4ueZFewBOsm2NzTgPdtja6D6muSa+U7EdiSVxgqReXDmxyzNiMtID3B9R
         KceOe+8IeC546gGjyTKQeCbeV5Di3MvOAd+K3eOgyX7bPN831O+QwzDqVmt7yoqdHQmj
         tCCLM/3X0z1kTlhhSEwxeR4aoOkE+YPqWdxZrW/OPevAOdtjAl5UUOkZNRls03eWjPQJ
         Abfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116130; x=1772720930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJflEsJoWFuWsTkTz3+7munVvf3KCvZoSO705SUTMdI=;
        b=pdzKrXN1FMVAhgGMRC8IAzQ8GzOMvbXGrnbPHiYktPDswjbXKe1MQm8HSIFbPj0HLs
         nwtow7R7hXDNynWCXTWJ2q748mPgSUX3rkkv2cMiFgiVl5UKpSLZsc9FGdw96wN0b7Ln
         rfw/crjTEx9r45PNIYcbPAzZpO6suIX+iieW6DI35of1Ku8ya0tx0TYOy68ShTY+g+yW
         c6cuN0qVdXUmKBTnFIjNsciLrTDCNm9KbIbSkor02KHYDiPCoNM0jBlnvKXUR+mHiVfN
         nuOR7KGGI94tTXVoT5P2WEvE3T3AyYKXu7CVPsVprNmd6TP06Z5em1xAEwO82ctbeZmQ
         uNWw==
X-Forwarded-Encrypted: i=1; AJvYcCWCsPew1AHMCuIy7aNi+jW5CkgcjS5MKIkXh0Kg9UOghpzP29VqLo8wIv8zIiLFV/TEfPUqB+u5hB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0d3XNMKPtmduUUP9u2FFAS9jtgexLUv5iDnqubxcoIt3iz0l/
	xmb43K2i0TDoSy8zu9JeKRLtHI9IJ08YEcgRGDgG93uqBTYgT4q0Wz1bioxO8sjA24I=
X-Gm-Gg: ATEYQzzWV3kjLGYVXHBXqaO6MTmPftOhonpS8ffN20Y421mmaqatgoMkBpCYTVFUrMU
	IrHWHt8eOmwPXrdENzTMMGZg6GmKQsts1ZfgOHvnPYWbmGblhjkrBr92YZTs+i0KcTWig8tiXXJ
	xpw34LjMxecOlLn7YkhEyBbdaVj7zxeQ7J48Pmi/FA4rKE/UjSQz9WQYCfmOQKnf4XSL0QW7FRH
	tTrHrXscVroxRZy9T4COeXLnA+oyOP8CuatHS8rulUvsESJ8/D52PDl/OGDxGJ8RXjsHT+CoeE7
	Kst+wqimDZewvKf9g5HmefBFbyLXqMDEiRVZHAHPogSFuvM30lVZD1dHUQv2E+5dWADiwUiBE1+
	J+CbgBOuwNGIfVh6Ug/RsL+lnTNzCFgZ4ei08ZJGH5UTbHaSEeuhM+as+SfZDomiyyVb4Jove6C
	k6kSd/QSN71Ymkhh2qMktd3+eYB/C9KMyTK34GdTiq+VXabK09wCeKRVKK8tMt6yY7
X-Received: by 2002:a05:600c:8b35:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-483c3db518dmr37366855e9.7.1772116130379;
        Thu, 26 Feb 2026 06:28:50 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:46 +0000
Subject: [PATCH v9 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-5-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6305;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=T56zPiTpvN0GBLBYQMGo9vQwbDNYOKXq8zVh3tggF/U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFicPCtmAzYPmUyS5HacNdaTvKDcw1dpuJf5J
 ZbOvgYLr4uJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYnAAKCRAicTuzoY3I
 OsC+EADC4ubfnfi7+snjoCswaKyRpJyw3t37B4+7oRdHbRjiNzinZdHXIt01BLu2UNJyvqfWnFw
 NWRkGu/stz/Ee/ex8hmG82C3xUF1Rutp2+tIDQdGHATho9v5s3a+jCo7YDFq5mIqWINvYEzeuJd
 ATpxRi6YWwb465abC3YYLLKyzCiVXZ1VhLF91LMa5XpDa3lOKsveDSqCw+js1YSSASpgDgVVxnj
 S/EMeA+dryeW/UaMMUo0t06r2m3hl27m1LOa5MC9QlndAbDm0wxcbNMguIvzC1fDHakm1f6/80t
 +R6p1m/LMnkJG0yQIof6Pn/+/Og1d+KjCuBV4oKuX2eDo3fjgRslcGhcvf5XvZx0XATsgli2Vif
 1fkGsAYU546dAzbQPbr4WDfTcWsUzc0WBVD+uPLoRkWapTSBOsnrUUZG/tkvnNMcLthT918GaJf
 8rWb8O1tcOzxLNxHITctQXxHuYVXgluSzKrwzf7E4/oS0uZy+41IuaWxatUSLAcxrdHuT2/GWCz
 WCykOtv1qa5OOi3ROWAwuaSztLBa23OjrbGREhmivYlswag7h2ZsTcGISM+aC86gCqe3qAKP1iH
 apCCALjWBoztPk2CoA++UIV8cUNXm4c3CQebKDeSPNuO/XSv+c8PALG9zHDHM+G0dbHXIxOO6PT
 HwPI9FIIgwxKufw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd8..5fb5ad87e1671 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5104,6 +5104,7 @@ static void camss_remove(struct platform_device *pdev)
 
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x16,
 	.csid_res = csid_res_8x16,
 	.ispif_res = &ispif_res_8x16,
@@ -5115,6 +5116,7 @@ static const struct camss_resources msm8916_resources = {
 
 static const struct camss_resources msm8939_resources = {
 	.version = CAMSS_8x39,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x39,
 	.csid_res = csid_res_8x39,
 	.ispif_res = &ispif_res_8x39,
@@ -5126,6 +5128,7 @@ static const struct camss_resources msm8939_resources = {
 
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
+	.legacy_phy = true,
 	.icc_res = icc_res_8x53,
 	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
 	.csiphy_res = csiphy_res_8x96,
@@ -5139,6 +5142,7 @@ static const struct camss_resources msm8953_resources = {
 
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x96,
 	.csid_res = csid_res_8x96,
 	.ispif_res = &ispif_res_8x96,
@@ -5150,6 +5154,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,
@@ -5163,6 +5168,7 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8300,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5177,6 +5183,7 @@ static const struct camss_resources qcs8300_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5190,6 +5197,7 @@ static const struct camss_resources sa8775p_resources = {
 
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_660,
 	.csid_res = csid_res_660,
 	.ispif_res = &ispif_res_660,
@@ -5201,6 +5209,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm670_resources = {
 	.version = CAMSS_845,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_670,
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
@@ -5212,6 +5221,7 @@ static const struct camss_resources sdm670_resources = {
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
@@ -5223,6 +5233,7 @@ static const struct camss_resources sdm845_resources = {
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm6150,
 	.csid_res = csid_res_sm6150,
 	.vfe_res = vfe_res_sm6150,
@@ -5236,6 +5247,7 @@ static const struct camss_resources sm6150_resources = {
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,
@@ -5249,6 +5261,7 @@ static const struct camss_resources sm8250_resources = {
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sc8280xp,
 	.csid_res = csid_res_sc8280xp,
 	.ispif_res = NULL,
@@ -5263,6 +5276,7 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
 	.vfe_res = vfe_res_7280,
@@ -5276,6 +5290,7 @@ static const struct camss_resources sc7280_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
 	.vfe_res = vfe_res_8550,
@@ -5290,6 +5305,7 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5304,6 +5320,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919e..24ec3ad7990e7 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -104,6 +104,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const bool legacy_phy;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.52.0

