Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7B5379EE4
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 01:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488491; cv=none; b=WLcQSN1fn5F2FAFfBS1f+DxqWJXOfeQqSQA34oY3MClw0aBn2jfzvLmzM3MWsiGl0sHO5XfldIAEoIvqSpkddDJwOfrL2ul5CK2aMSe6ugAruqGrfZ0KqG/AsLNVKN0dXaSYYSTDyWPRV8GiezNP8Lsj0JepezwyuJBIKCQ838A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488491; c=relaxed/simple;
	bh=YKW1V7XuMJ4AeReIm3Qwtpj6WjYoSkYt9XgvGuaFoSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRLm81SoyVKw90/0FKmvG3t4/PuIRhx77AXSwioW39PXJIFGmZNthfOpIcPyxwyHxapHM1KkvBoOXjIS73psl29N69ta2xyOjEKV1IAOk5LCN+5pKr9lcJrmfq+KcA6b76TWRoh1RThe0t754wKyplhsg/n8/DP7Pvo/OkFj84I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0FS7gpb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0FS7gpb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48704db565eso5999295e9.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488487; x=1775093287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P21FDgbBj2GIbBZ7VBtv5L9RLy5tJ4WiwvtA0ou3a9I=;
        b=c0FS7gpbKxS2+Xj8brsaRetc01HMQlP32vMUmD6UIpvhCifFbTq667FgcIIkjPuaLx
         4owO6xI946gRIKuDKObsunpfEUssxPunoZpIr+fnnM4Tq2Yl5+4ClPvS4o9hvu894LA0
         FEtj35O7R2V+Gj138aNbltNjAaXXhvrtiVvrID/WUiQ7qyguczAVzew0pYd3xqzlNq3D
         HAz/Pdc+6DjkpoxgoBPI3sGe2agMHggxE0bGGh/WPD/HHvCmcnS+W+09OaliTItO8tJ+
         XFR8d0VqrB+EaMMCvKljDexCwpVC1uSgRYqQ0uSdSmDCVEQgC+zOTTy0NBS5HuwkEDGv
         ZE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488487; x=1775093287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P21FDgbBj2GIbBZ7VBtv5L9RLy5tJ4WiwvtA0ou3a9I=;
        b=OHAF2ILiOmqLBX7bcJW9MYsQo3kwqf4NFLIXYYFCfvnFtTaGkddmj2LLSRD5DPYGQw
         JLMTfSHZKZ/XgdZ1s2oeyxMTAnbVgo2QsS83wZqM1txLim+/9HpJQizbfW2XVzQmcWaO
         9q9YGX0pRVwZC9Oi16yHperVyT/MD9c/8Hj7iY5f8/kfeBXcoRXe2jMYK1gYOQ0vvRIm
         Lcfrw4FIeDWpiBAclsa7puqGk8qS5EOh/tf1ObQP2zcUnsGtw4ynVGE1CmguE1XMe2AK
         WmVsmmfL3W4Jrb3snhonzs53x88IkE7wpOrnyj6cS/LVVNR95FtI0hbpQYlzpw03cwIW
         nf6A==
X-Forwarded-Encrypted: i=1; AJvYcCXC7c9ufSuqQX0uITlnzTEL9jVXjAlhLMd+RomibZYiOosum7Km/50xdLav6smyCtNgc2Xh7bRbqjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNHsZjUjgenDR/P/nPRKd3lKkwIuTkQ0PuZbPHMeKwGSdM04ek
	ltiy4327d4EdYTYHTXGgWq3svJxT6ROEzlqS0uTGvN9GjkOAGDLEnbOpW7YepqjuJZNdgI3JZl9
	U+igG
X-Gm-Gg: ATEYQzwe3+idMkOlNBnc3DKxAutzv9TgBsKKaIhqr1poRA2GmAizrFW4yjkxluVM+O2
	rnucUHDMIE3TlTRh/WXa573AM9OrXIBSj0k0sfKqFsAYnSx3nQrCkbS0GEHC9I35nUatMk+bxVo
	rArck0IxiHYEKI0BZMsUdrPVH9U/6mPPivwkSZOM77MKQiLekPbfDMYv8uACViStEs5sHeeNGdA
	p8t5f5mbvaIH3J1Q+hHlNLwzivc5atI0gLFA0dzSC1GoOLEDTDt0jw5W1zjKt/oabfnsoFXJFlK
	y7AKj1njZ/u+4if4sq7aYvhkHGzsvpjXwBMdwqiwODrHVK/qnmEk4+Fx57E2nFo00NIzC5DKF15
	YIVrNGhKmwV1DtMbm8oIXtRkx1fE0IviB5GU6y6MPVxoPsw35QUmDu/J5m0UbD0Xe65f7RYwaKG
	w5x3WwSm4J57i2ZuFC1CzVL4Us8eifWh04Xg4=
X-Received: by 2002:a05:600c:350f:b0:485:40c6:f528 with SMTP id 5b1f17b1804b1-487160a213bmr80479925e9.30.1774488487128;
        Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:31 +0000
Subject: [PATCH v11 3/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-3-5b93415be6dd@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YKW1V7XuMJ4AeReIm3Qwtpj6WjYoSkYt9XgvGuaFoSY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/t9wn0hjOdBeGp1+ZXyrdnpvlJZRgwHIFn
 gVTWXwfNdGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OoLtEACy/NhZw3B+kOA16FZWbXQzqgmtyi90H8KVps1zpqy5P/5Wnx7Yyhack7yH/S/WazGWavk
 nu1rmIM5HpFqDEFTOiL6dtQ/4UZ4mr+NmyQMxMDRkVNmwDRlUC1wOI93eYIWl5AmF63jfhytaMl
 buqSyEga2A5R4VeocXLwPL6YrLsdYBjo85PJt4NZpL+8sMq3iIQY4c214oQ0tE7wRlYzARDSnNs
 wWs8/7XDsgC8kiXOC2X42nVFbEXyv8GROVnSllMUNXtyt8BHNtryTpmM1ecdiRa3fR+L+fpxs+/
 sxTSkko+IahfRebJPkqGcAqxlbtOz9dTUuTmfV4/Qo1ZwVAr5H6v55byB1ocViBNKde8fyq40tY
 CB6qHjT9hhz83YYLMAR9F7M6mWNc7T1L8fdstLDnHVb1VdL/r9I9MUHDopr0O0pu4ozgS36Uj9A
 Bkw/dG9zJ8DYDRRtFoWeBETVto7aIeA6sney65DtIAwgjpSA5koaVbS6JNRd9AKoeqGy0vTbunX
 MfdzrV6tsl44jMEfVq+Xk/Yag4aeLwpWLSdAhv5J/FInbVV30WgysEMIK4T2zLqYfgFHAm7Riph
 r7FZAwrJ+xJNNZSfDljO3clL/iRFQj7K96i7NbD17n5qPEW/IIzQcUL2SDj9bBBaymXEhSUp7FT
 8GRl/ih9TlzVCdw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index f44138f522bba..d2763977a494d 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -112,7 +112,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -422,13 +437,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.52.0

