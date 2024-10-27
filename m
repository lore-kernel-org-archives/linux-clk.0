Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7482EAE5
	for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992302; cv=none; b=Vs2RLpu8wTXuqXNIX1xMvdKAOkFrHXKTG2nw4r3fLjMCHkWsdHWUkr5DpHkg2AG2+Fb/kL/mHU35oqQRdBX4DhF8aTC3Gkv/wk49xNHRjEEgkLMr8bpb5pIzBNBXB/6drwRnUPAk4j9osh8S4w7ZIryXwWwup3i2ou/HttBLZZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992302; c=relaxed/simple;
	bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rkt1NTonl6zf14K0Ncz39Smz+7CNqsJq/hIuRNWv0XDk0NBrSa26S0iAJo+8qW0Z6GEN4y9X1AxFmzt6NNp3+W3/bRH8OmijjQ23RgJpX7lRwhCabvMlu2p3gcgax2JJgCOm5Y+V4zHUARZbaw9AWUc3sfwx6xjG5u+fUX4bCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tHJWDSkC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tHJWDSkC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so4447057e87.1
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 18:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992298; x=1730597098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=tHJWDSkCvBHoKWKwVMpa23wdZd0CGfIAhiR6WK0y6tybnQTek66thLY6WwHUj+zjX0
         ZLE/TrKmgu6Us78Rl/efyCZ1odEhJ8zC5J6ZOMbkh7mGmkjVPzjEo5EzzBR40DS5NrHy
         kShKn7HriJ+XKyCCsn5OSxAVNwMLwy6kWJKUJIY4vQ5huQq++26OWPiYCLtRvaSoTM1r
         PziV5lTvJcdfayzOsM0Yo9FEzbLFYgppTjfj/zNs4hBL3DFBqyieepMG9VB+0X++FoyR
         /+Dh8KPDUL8Hki23B98DCtaAaVcAxJSmTHkXxeZdc76iIdIi3CaYWiTbcXcTLQIJLyFX
         tk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992298; x=1730597098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=Xidq6JVZOWTDSQawPb7S2VwFuxV/MnElUO4TbKLYBt9uAnQ2cbB5AZisc4l93M8qAP
         K1RT1k2Pcd4E2kyTeTpAYix3elRs15rNKzKBcEpEKwONYlJRQRQyc8J2A14stme4Ilpc
         3xF6DpkIGkO4D9Z9/uSW2RlCN5v1ikF9bDszz+xM8EnYDmaW81rkCFL8eTh6yduC9nrQ
         vW3h3sFiUI7LJsI4/Rd/B3ErwKFXTToMt4Y5PwYH3sfMEGvTGlIPBB2TJghRUpczTSlI
         6HxJ/Xun4CZWMdNXM6wTXsJYQs4MmTDQ74XX88eoXKE4nJDrEenMChVCi0yb6i5s/mzn
         VHuA==
X-Forwarded-Encrypted: i=1; AJvYcCWFc89jZjoqy3Jqe30LebEfCP9nJZTo40PZhAqPbV2fW3slJOfoCFlYYQB2MPjixzT6/JEVcDoMXNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycc2t+Z4YY3vl+RsQe5LkSGDdBvISwAXFAA+JwWxtaTrfpGIWF
	3ceVWp/3SHDOvbDIBnT3LL3ma3eIrVUBcA4sV4orgPhgoX9WVPGFs/Sm5GbryH9DQs5vdM+ZOur
	K
X-Google-Smtp-Source: AGHT+IH5CXm26TQB3hvo17DN30FJ/sSvjL7L+2bBTzmwqfT1kDCTzAOthra7CCBxoi/qcNgrGyx+Bw==
X-Received: by 2002:a05:6512:39cd:b0:535:3ca5:daa with SMTP id 2adb3069b0e04-53b348ebf88mr1319185e87.7.1729992297772;
        Sat, 26 Oct 2024 18:24:57 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:43 +0200
Subject: [PATCH v5 04/11] dt-bindings: clock: qcom,sm8550-dispcc: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-4-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZgruVOVUsl0coI/dBDX1hksdPfI8/yc/qOT
 8UvkwuWupqJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WYAAKCRAU23LtvoBl
 uB+pD/9+UBnLFsgGXBvwMq6CMmo8grzYWpS2I/71QyjnBMv5BWXsxZvmq8VrPEK4OKQv83M1i6k
 Lfls5sl2zdugou0xNKpzvJRyanYYW8VB7kt1e5WQwJc09jQtyMvjApCp1lGvsUDXXWuakoSdPdG
 Ng33awMde//6uxN5sRFqhj+65Dhw31tB5Vb1oV/bgYyg46zi29jnwSm0Eb0KLSDGq9RShp0OQqW
 D7E1vX8+wQS/C1Tamas4D4PFSTA7vGv4+XO/dvgEMTYWZyq7D5IxbHoa+pMHXSt05VreKb+MN7b
 44UsBiTeSFwCp6SaU59XYNUKDpzcZbv/H4h9DaoWOPVvN+lBY07cGDEVpwTJhMBfqDRCfs3BdKs
 01nnOlhhXzdCrckVmY6CJmYH+Wb+Mqh84NrkjwTdLJe8pv2MX4yqWaVhoYcq5AKhw8647PooxyZ
 HqUffn3AKnKo43OHl8b8i3YY2AR+CwsqpIgvo7705WejNNK3wn/cmcDOZCUChLA3aQXtcVkdo+g
 INo4ycRWsR5SGeTeqo6eGJLNTSaGieUBoFGD+Ck2Gwe9jlHNpNC01E1X2I7KprnvVvSlJ/q0z+8
 mOlOfn8cGvRSRdFtNOKSoOJ/7h/LRUdpCO923lxXg4Wx1tIjuPXUK/Thfzaz7YPOACyNUsVt/9n
 kddjoqwPYN3LP1w==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the Display Clock Controller on SAR2130P
platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c17035a180dbf3dde715a281bc54165122739618..c57d55a9293c214c4c101902cdd9603074e2243d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -22,6 +22,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
       - qcom,x1e80100-dispcc

-- 
2.39.5

