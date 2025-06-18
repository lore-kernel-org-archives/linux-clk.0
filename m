Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B112EBDC6
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257200; cv=none; b=ERMqumWHhMCjd00ykWsIs24GcB0sBS5B5YVAy8Pl0JwhZavhzhQ6cAV/x/PAWtC1dBayFelTOSH1XrNUGV+x/k1UzN3wR6byeY4OQXysA0otfW+gTEA/QPwXx6j8U7aBj/MFzvv/lQOZDg+CtJckU/4c3T2MII6u3v2NeMdD6sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257200; c=relaxed/simple;
	bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD2dlSqvsZjbVdUqxEoPqZf0f3oyTcBtpH0AWHQtXJ4vQnfcYVwsh4/wMTqbbASg9rzs5IJZfTHwsEv5UElwoNuQAFq7hb3UNyOKvj4KvNLg7VdMJ8cWIUzojIl7mn19y2dTuth4Xu+eTKA1cpOrIxKANxbIDa4jquWR2wNhgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eyzw8/+k; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eyzw8/+k"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adb229f6bbaso107056366b.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257196; x=1750861996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=eyzw8/+kfFdltOdKbFjBBhwXFn5p7gJm9M6SKiGQTmzUIeh/fARS/ZbUMt0jQhDcz0
         2xpweql7xQitV1YveBM81souZmj1L3qjrU0sw3QcNSK2cuQyc2fmdCuB9ko81EDIQS0r
         l/pQONAUpAZnClZPLIttcZuGBQeQOEdNSihvGvFr2AOdsY3zXEpEr1LpG6LzUXNl2p90
         T5QFhGGZOiz3xH/RwpK66QfQ++sF+hmTQo+WOfGES6acVhOg/Q9zGfNq05zo+N7hWud1
         tr83fe0z2yjuB9JnaXxHMwTRLrGeYlfT2Qya2UWuuNrKM+NOFm0YXWbN2tmgnZlBymu+
         gfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257196; x=1750861996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=EEbLe9BfIqNamDQ6+ZVymyfDTVipbuuNdlVA2R5c5EEk88OjEtBHCI/bJTx5obh9Qw
         SFCcsheVtRiwi7jr5TwLPdkA1rRWIx78uc+68i74r6O4vekAwJfg//pIp1BXPXM0/k1H
         PywEeeCmhZeNK55Cbo/qRuvO2IQPfmxh+cjc7vis+oxqN2bJdZl2eoJMBZEME3YDF7aN
         3ekibQD6r8WwEXXIOpW/vY4PuXNbQeytLbGdqDownVCJqgqCJLi+FwSBSwDb4f5IlwR9
         2kET75Azr6SGcKuiSf8wWYtITdMlreZvIFPINK0o8UIXsevMXrPTqvXQMhrU7nCYgYxU
         vWJw==
X-Forwarded-Encrypted: i=1; AJvYcCVkQhHbLS1LcMA3GVT/cnSF5ZQxTxMby9BBU22A8bL1XnJYPU6mA5xNJEyxlpVy5cn1VurW2fVkW1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsPzfWgrrpGoedSIKsQgUmxLoWng3+ss1aYqzqymZNBC91Ibm
	QEwui5oCp/YIQ/TVF1XCFI7DtNCYNzkNyxmcMeGcApvDx+uKWgS/P+3TToi78Mdnb0Q=
X-Gm-Gg: ASbGncsgzNPxLCSxfEYbjI7O1CmagY9itT/2P8XQmmiQ/Atga1tQchk0y5GaN9tY90I
	UsWCupkrC/xKh9WYHfIzVaQM4f2qQ2OgEXzJJMT1XbD7oHQN9PH8VNh1I95/mOBwED6PttSA9H9
	XH4TzZMtoqM5bnYR5dEHqV/Ps2JqHprqz0DvywImJjaM10xX2+P+bp+fhjZqwrYHtx3rVx+RoZy
	zOk2uah6Hb6Wj6mnjBp29gQpQrhi2vaF+3rwu79naEBanXKUf1G6gLn2pKtq/tBz9jUOKlrRjqV
	Di4BvFnYVIkodIn/ePwJgBVLNUW4/dS+ZaEKNQ8ClSULnas1n7bbCcP8gtWMkWvUiGDt8hRK30G
	kWuGHZBc=
X-Google-Smtp-Source: AGHT+IHXnKRDR3Ql5qmBBMwJv0NM899ZSndO0MgBPTy1nfGVrxEeMqChlf9unxqDA9c2qxWrRaa+yw==
X-Received: by 2002:a17:907:86ab:b0:ade:9b52:4d84 with SMTP id a640c23a62f3a-adfad5230b8mr605074766b.15.1750257196488;
        Wed, 18 Jun 2025 07:33:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:30 +0200
Subject: [PATCH v7 01/13] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-1-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4a7XDxGu9sj2aHu21RSAfhGgELU/Bw0aAYI
 wskTgq5XP2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOGgAKCRDBN2bmhouD
 19AgEACYoVeVBbfztNRqMn55p6VM0unzlIT/zvVGJPIR60HXWSs8IAfhOiu1ULWx3FCuSzyN5s3
 r7BHv1Qa1j5NYR2ckxCaTDjrNMtXMgJpihVNV+3y5kpgS9yMh6JOcxDqPKW0mTTUq6TVcH2u0Ad
 FcjOY46mcxEJeFs/U47eBlLhmniBp4/xUmCTmyFXbCkblkcLrbft8bmU6igMAwAuEtw37bdUIXk
 AzMq3+g9IHbEG4GTSyGvXMltaLTVp7A1jBHGmBBCte3cHlYwaML4H4B5LQz11y/U5AKMbAzd9zz
 4ZP6u5/qTCXt6V8oi8XKE78bpLwBexSdP3igQKKqXYt90rNOTHBUiMMqrdwbwK1yAE3KbN0Uj8y
 mdje9ZrKQsEzF2uVWDUL7FJr2C8B7aMSZSPEbHuWs0rc43xl5FSURBDr/i4ilKhbgHiaQDDyMJh
 g4wqepd/deZRbWir8IWaFaAa6lYN9wX+hF5KO9GMu+h2txpBKn3WCajyOntr/8Wys/AQXePcZTs
 q3SFC7JNPnJHFCOpboTihoiAx+5uPT7qEf9ghpZo7UJ9Byl89c8AOAH0ibzdaOza6QwbgQQ14s+
 DpYSk/mNy7t5Nzzvm7H/wh0OUw/WBFzvpKNTDJnFpxU9KH9hXreA8sPn+PxRqNoLjiJTYOphUUe
 31VaPalhhNu7/kg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 3c75ff42999a59183d5c6f9ad164023d6361ac07..1ca820a500b725233e161f53cbbbd59406326876 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.45.2

