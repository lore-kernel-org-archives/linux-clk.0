Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACBA29B8D2
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564375; cv=none; b=eoJ+0MhPjSNZ3GkSUE0ASSz1lx5ru8btykdWe12Dy+VCBRMGR6t7Lt+wyt1IJBfiZ+amBzQvulVFgQtf6uXIraXFSn8PBn/yPGd4AjVslNSiSv9Wd4rEbv1hsSa/MyUaeQCqYoao0mty7liDGMV8giC3aTIIeMIdOHBB3cLVsQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564375; c=relaxed/simple;
	bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LK7V1IxAvUbuYB4fCoC7nHUoPSlE6xhrSqSajxRSm6yMgRAO7t+hhQDKMygBc3ggZPZQ0Pzm1u/H9MUuEGdeQOJWTJ8mdvgiIa4TCW0NJd/Dvj6oRdsK2VCHYFbO3aoCu+yH8a1dh5i3XGeSzoqnFX90Fgieaj/rAh+q6EcO75w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phRFrQBr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phRFrQBr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so680942f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564372; x=1750169172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=phRFrQBrljrcRCzfuzcSLVY8F1cEMQM0goN6M0zSxW66J6znJU6Q9pZLGeAiqVwaIn
         az293bo4P7Dk+saEKLx0Wyi9vjaeVwbuAP9ZFU/YpV0lMYn4UNww00h0kDC+h9GDJEC8
         fQylDdg8BwZpzdKTI+FAt7wB0VWnxnlS0S3vQhI2MQgxuGPLsOImfPJzAKhFseG0ctf4
         7fGU0Q//YtXIzFap3d+uSZrrmQNF3g6LqQ0FT+BWwS0PLNz7rrfeRQFtv16jFveWhCtI
         S2brltkB+K3b72TobMlfZpE+r7LBkpo4RNTsd7rZ1eZ+ajyCekbA2AUqsX5k0/63KUMz
         QwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564372; x=1750169172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=bhqQcYZNwq9XSgiavFWZ+MR6KzmqL+iJpHHYlLMR7HvR8UAZ+fCDQBPVFdGssfklzh
         xjhjfNIcpI//9HOqPY3uQKzXX3Ru969AIqt2+3ORERJ/nIw3oUDExA4L6WdjvMKI7sNj
         dnKktjUSXfhzCVB+U5YSF4fxaG+nDHy0dMUqjTUE7OZMaWLLHuLhRlH/ze9foOpHSW2T
         r8FHz4GvMdwOsfnmur1tdl/+RWF7PySRXTUy8m/ikyIdrEfO99vyD5J+wkkaVhxgAC4Y
         z+St/i/4QxSWYwUJV0CMKTqN3DglyvbW7e6XVIUbUw1rvHqpEDLYPK2J/UaN07ii9vcq
         RTYg==
X-Forwarded-Encrypted: i=1; AJvYcCWz8adx7yXrqi/L8VxOaB8UTYoajcF8K/1Ln+lAa0uGW6BgYOTmQwbCPsyC8NztIO15EzFZ484Z0mg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4aTJVtdWaQLmhrLzlpxkBpJgfRwEh3rR6VGErBv2eO2dYa01Q
	Av5dmY+V9M6lHgiFMv3ZzRetgG/BrV6Y7aGyHiqC6Jnihxt7M1xYT7Hf9nSuP46Ge5Q=
X-Gm-Gg: ASbGnctxAnii2mlww/dEoAwckF3qBeDMMbaxaIWCJ9WlPC3KczJbV2s/tbZytaMp/pR
	o9GExxtWKYGnNC8iqpzN1yEOn+xL9GjcFw54kMxr2VOXZLF97YJ5jP0XwWhygOfUmUCp97ZxScR
	Lsk6h0TfDnXgw765ENB6B6ExTk3FNfUTod2LPjF1Gl9yGwjIQajIAfEil6u2bRERgwARUw9IbRb
	8pjgSmNuzEom2uez9KE2OnSURtMX01c4YKOumJNckdrArKFfQKBdcI9Qcp0j1jaSRcrYvrBQ1p+
	SKx2CaG1ygsr99WYzTYHSrn0ZxKI4fClT0+Rk+U3126F1ndJe6w1SA0z5OuNhDstHT2FaHkQoaS
	PFfdqcg==
X-Google-Smtp-Source: AGHT+IE1BPh9K0tsvS2irh9slIs2O8I2IOLea/2GWBdBPLJ7P+lih7SyOyAlCDTffkcTPSwFJR6kEQ==
X-Received: by 2002:a05:6000:4025:b0:3a4:eed9:755b with SMTP id ffacd0b85a97d-3a53315704amr4816797f8f.4.1749564371436;
        Tue, 10 Jun 2025 07:06:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:39 +0200
Subject: [PATCH v6 01/17] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-1-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDu/qPyxSZr5uQgETQ9z+HGRjh6JyUCMstBR5
 md4b/PmrcmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7vwAKCRDBN2bmhouD
 1w0PD/9GgT8PUxfu86n+kcyB03P7Gw4/ycsNaJmnr0wzsebLzXby5oB6UEvkB4/MCKHhdpfDL/a
 rCvIquz/8M7jMhEgVw2yLc0MWBwcsPSOi5z6iTGHLz43eN5J5517ETTrsG45jucq4LgZ928YkKR
 /VNFmPklDDRNd0KZhw471vuGhtJg9/O7GJunrg8CAyJ3igcEL8Xa1E8mG2y9RG2RRffqzyjgeCO
 fp8uDttlMY1wsSc5dmzQl1JyAyBKfVVkKnZOiRXyurhb7i4zK/skjmu8LxsX1nuYO81VWbU0b0l
 fA3C0eob3/kyHYnNqbhWIDjElj0TF7hCB4FR9bfD3FDCeFDCb2U4GcBGVULVfTV37uIV8kNLIhk
 5idnNT7l5NP8UICj6wMB2HSt/wrAMWjfLKYabTLOy3C0Fw6vsKzw6dBg11Qj5+ieoQfWodyUWgQ
 C6AV97Yil29ylhmXcRpw32CoSVhidWRKQ7uGB9Eg3ATYfAQq5ZXgxYqCE68NfIbeMd6rM1HK/LE
 DwUHSLE8r9CMzY/PwbNSo/AQp8gSoWo+bnDne2/YBayYMzpOTQ1t/uBMnVyY6Cy3ssEGcolks0Z
 y+tYb1Wb7L/25zKlBFGwYvb8QAP1/E3ahn3jtAl93W3Da8yDfwC7zmqAfJ+ImEz198M1TOMqs1Q
 COEegQZ5A86rK4A==
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

