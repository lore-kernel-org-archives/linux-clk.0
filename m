Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1437C11D
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 01:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488500; cv=none; b=UQbGqRYvgym63wXGqKLHgJ7AmwMKa3upIIbTeODnmhbJuZMjJ06CTCIildvnkIWyb+jdUZY6mJ9M1LgeoGhP5LWRoK+6+WqKgsBn8+pmvKUvXwcF3miCYj8M/9f3KBsw8ol0Di3pEbnI8VT0WECie9TD8OHJ2pBIG/uvi3Hl7iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488500; c=relaxed/simple;
	bh=we5ywP7iRPMRTAg6yOKxUrxdHq7+NpGw0G97RgZw0gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p73wdfvhMwrXB45A28MsrOijaZRC7j5vaUeoGcOTYm+Oba9ciaMB3pVSZFjdZAwCVG36IKDtMt84bRaiDh8oMwtLeOEqkcUxQMqjMTjwhJcWLFu3A8AZ286bwTC5vJpqjEqN9UO3trD2kSVKozb15uThjuwbrfqWoFUQjHxbzlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2hibFnS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2hibFnS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b2965d4bso287420f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488490; x=1775093290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekM3vLkgNR/9kVDhmI/IiqMjFO2m+5M/TZ2EQg913rs=;
        b=S2hibFnS7z7UqamuRYPGNdC1kP+ia8WoFCBnZaIoQ1Kpg5ZHwgZ7QYy5D0r7WXKbb+
         e+a81wpJUmiLL/7hysVokUDxOWpDzic6qZWzQn8WUc4Rlrt1x61LcBUHJA4HK+mtl3uL
         r7ivIRJRfy621WKEQWVzjZieu+5463wCyzROYlqyqQwVjF0UbitDWfYxRapHFtFPL6D5
         ABtu9rZsUKElcqRa5+Ulp+Vhr+b4j0gXOnIrMPgp2Cmry27L8bpwp5Iay/rl3JAPCQVJ
         xs/m4+0hZW6BXWpgaP5UsHv0rhtlId04kMYedUna8ozYL//DTFBrDuRX0UuJTd7dWVV1
         E1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488490; x=1775093290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ekM3vLkgNR/9kVDhmI/IiqMjFO2m+5M/TZ2EQg913rs=;
        b=gzDCvoFpd/UwpqWmbSu1kqzTIu/qWKjokV+9CMBs3ERGQiKu25I5esSULJJX+PGy4u
         QL9pWYzNHSJx5PZ9ARYbE4OxjfIW2sTHV7xUFDwcClKEHhB+oJ1JC3LIE/HwHSDZXMlN
         l2iYPTHL/nzWSi8klxkAXZfxQTqBLYQ2hIbRQ5G33TF3H13FVa/bsvkttA4U4po0sZD4
         HSmKylYv6C4CX0QtqCPmQSSrf24rTZwTwz33KOq5idSMCz+ZKh+E6OKZQjNujhnYnMF4
         VeviLJAo+rYgOk5RZiTmsNBSS89Jjp+5hXBmNOOQEkWuFJkWHB9KF8P7E4sGUlxxBWpu
         5tag==
X-Forwarded-Encrypted: i=1; AJvYcCUQsw5JKDHZozIZSStjOZkn3tU9tcnXmzWg/NoE0DZ9gIYWKvy21xpWjmgbDhNpqJyZou7RuQrCkqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4e9tzcuaHc75FLS4A3OHouEqN9GsQOOe8m8aGIoH7Dv3p8AG
	yqlUCwTcH3IK5IUWUxF1/lD98AX6QR0v3mrSeooay4Cnjn/F7WZbG0UTeZVDm1j0AazxEvH700W
	5inSj
X-Gm-Gg: ATEYQzxOTx9XHwmRKOs87acthB637FLRKEwIIitd+x7Ff8E+VxMWAjRmLACxSEiwosW
	5rSu1b0pFShhF97MEL0XpiTY5YgaIr2Idf6zemMVIZOFQT9XakJxFkscfnjA18dRy4clqueFImF
	r3VpCk2S25bqxNYEtu/zcusR5wOn0lsREMJmwm+qzgkfnlV0wBJCR0TiwqSYZ2FvrqZvdZN41yg
	BQEX0ZMSfmgscxE5EgOZgnhylQs7JRlZD7evmMcg34Jt8r7mVtvSNG5PY9QrIw1MSBAiovL57Rh
	o9gnnII7g6l8vSjmepS6sXfvuZsU1IotMRqn7ciAcwlqZusXhuU5FKZYcXX+TbxCSrAiw+1mAQY
	Zu68m9/X7oYPMYre+3SWvBNf08X0H5+a0lvvozCPKHzXEkFoa92VdpDhs6hZEr20mdnTIF12+nr
	wItFWcQaELQz7a9niyLv0pOyidESJY2zKLbug=
X-Received: by 2002:a05:6000:26c3:b0:43b:42af:75b with SMTP id ffacd0b85a97d-43b88a3a379mr8156018f8f.55.1774488490319;
        Wed, 25 Mar 2026 18:28:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:33 +0000
Subject: [PATCH v11 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6433;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=we5ywP7iRPMRTAg6yOKxUrxdHq7+NpGw0G97RgZw0gY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIvARhAaqvf4pYzE1y4EDxMLp+F/9kmDukiyq
 4maGPZhhvuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLwAAKCRAicTuzoY3I
 Oh2DEACsXDzvF7YwEWShB3maiqgvopBIILEb0v6l1Q0PD6l5clhv1ks5cyRsWTbbPeIU+sz+gFB
 YOy16TjM329e1NAT21DCjZlumVO6ACXpjLnsf6vP5BFpkdjGFg2sDqcGmWDQO4xTe+a3ISMPhux
 ywmvKfwThxCfKX3+IWZWVdzqvz45Y+KqrAeo9HMvuik05VD1VD6okbzN8i/a5JXv3u4otjCS4MZ
 wIrUoEY/BSMSh0K9PH3fw+2Sd8R8Q6jFqYpQ36zupJcjA9nbwwgbCRF4wcHG7fAuk8IUGo3NJoc
 Q9ng2PWuqd5l/akKr6uoVcod47xmOmG/xVL6K2klmhnVgvXxnD0hfLmcDrcOcyLIpicfp7nNlEV
 RKeMdAWUpEQylJ6gq484VXmpw0LuG2JBhLejnLIQ7Ic4ICwapWuIicqRS2W22IlqmsajJkybJJ4
 GvJk+kquheyKh26OhgB5ZcPJ3xEelzIHM52F2vFCOnKBXh7TB+QzA5eiwIOeQWH1pRUM8TQfhhT
 3kiZfQ2ta7NzuuNsWeXelRDzPw4IaGq2+R0k+63uZ6jT6QuctGJPBpj6epzDLXg7ZzzZoH8rDv1
 OuKwScm9evoI9y0Lizq+wgo+O0bu7CwlR3Wk0vRRdRS+rh2hsifWC4sx0i/iP2kYUyeJmrvG3iO
 OgqDd24FsqINPBQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 66ea057291f6d..2749895152e32 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5107,6 +5107,7 @@ static void camss_remove(struct platform_device *pdev)
 
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x16,
 	.csid_res = csid_res_8x16,
 	.ispif_res = &ispif_res_8x16,
@@ -5118,6 +5119,7 @@ static const struct camss_resources msm8916_resources = {
 
 static const struct camss_resources msm8939_resources = {
 	.version = CAMSS_8x39,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x39,
 	.csid_res = csid_res_8x39,
 	.ispif_res = &ispif_res_8x39,
@@ -5129,6 +5131,7 @@ static const struct camss_resources msm8939_resources = {
 
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
+	.legacy_phy = true,
 	.icc_res = icc_res_8x53,
 	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
 	.csiphy_res = csiphy_res_8x96,
@@ -5142,6 +5145,7 @@ static const struct camss_resources msm8953_resources = {
 
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x96,
 	.csid_res = csid_res_8x96,
 	.ispif_res = &ispif_res_8x96,
@@ -5153,6 +5157,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,
@@ -5166,6 +5171,7 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8300,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5180,6 +5186,7 @@ static const struct camss_resources qcs8300_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5193,6 +5200,7 @@ static const struct camss_resources sa8775p_resources = {
 
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_660,
 	.csid_res = csid_res_660,
 	.ispif_res = &ispif_res_660,
@@ -5204,6 +5212,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm670_resources = {
 	.version = CAMSS_845,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_670,
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
@@ -5215,6 +5224,7 @@ static const struct camss_resources sdm670_resources = {
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
@@ -5226,6 +5236,7 @@ static const struct camss_resources sdm845_resources = {
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm6150,
 	.csid_res = csid_res_sm6150,
 	.vfe_res = vfe_res_sm6150,
@@ -5239,6 +5250,7 @@ static const struct camss_resources sm6150_resources = {
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,
@@ -5252,6 +5264,7 @@ static const struct camss_resources sm8250_resources = {
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sc8280xp,
 	.csid_res = csid_res_sc8280xp,
 	.ispif_res = NULL,
@@ -5266,6 +5279,7 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
 	.vfe_res = vfe_res_7280,
@@ -5279,6 +5293,7 @@ static const struct camss_resources sc7280_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
 	.vfe_res = vfe_res_8550,
@@ -5293,6 +5308,7 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5307,6 +5323,7 @@ static const struct camss_resources sm8650_resources = {
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

