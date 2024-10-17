Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716381DFE28
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184232; cv=none; b=VWjAIFF3D3G/kWkLbWdvipaOP57MX+pC85GWEhBtpi/aNxjuAUSj27K4MTgyI0Yxf6wCWUAcQd7suIWdFYFIEA1+Vzn3uAJ9ViNtmM5GsqXAjeAahpBAQgsM3rdBGwFIyTCFy9KYhSf4O8ryxdxEDww4QtotY7J0a0kvLTZ1CdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184232; c=relaxed/simple;
	bh=2RlnfXAvC+5RWHBwXyBuZ+I/mjr57HcoH5Usgs02gbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7cBS4Ygn0pmYew0R/FA95aBgSnrr2c/wPlqMCc/TIseRqV1CYgnc4f9dDoPhefoaeCEZcvhT4dX6nMQfUFJLPZzaARyTbt4fN0lLZ21vVCteT2b2fBi6y265L5kg7kivArHJjMGQU5HJ2Gm8p5h47cL2KujnjMRDweGfrB9GVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6sPWUwC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6sPWUwC"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c913aso1521096e87.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184225; x=1729789025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ow27IoNsvgkUupzx1K9O1/iQYpLFAAkG+OJE9/un3uQ=;
        b=I6sPWUwCwYRRoJyoDzg0CGuW/HXUToUPhsjogltVOm+9QcqTHEBu48l+qswUXx5nSt
         YmBTv27cDvyxYIyg0tSxMH+hRBLR8jjLwhjkr+qASvge300gOeJANL6On3zjanyuvkwW
         DlNk/dr53/18kH4iL1pgPuE88B9RzMydX5qnpJ2eR0ptjXB4+mZAXRYP0Zm1qTEsG7Yc
         SXHIkg2Wi3dkS5mVUMa4guG1CIpMkU3QArtbOXWscZWsb7MXM7iBAwYzPlbikSG11hFy
         8fU9A2VoryDgP8W91GMI/Hj884Dgci0FUFNv8xZx5CAc+wtK4yRtJvMglBx+fxnAK7A7
         /77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184225; x=1729789025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ow27IoNsvgkUupzx1K9O1/iQYpLFAAkG+OJE9/un3uQ=;
        b=tasL3SoE1LlpVrYuMaAd/Bx34Mctzjk9YvaBi5H67sSxvAikM2yttMyS0ULTwvSgFv
         mbCpW0uE4VKN1rqfYnf3h6yqlTs7Ama9QIQQxw7celDlIyWOy9z/eGbw//tNe4ZjEAKM
         OuH6nmfUg1Flvn6Ia58wdVj0gWf6eUvZmqg4k4kauW2eJgZ6JShzW/VGHUuqKt5RooCD
         GFamVkRHDgWOxDAJ1Rw9cJ6zms6KhO+aiv6ve4JtfinzrFc1rKTHfzv8ngY1g9QIMzkQ
         rltIsIXigVjQ6wCP3xGIpK5qeIR018G4m9sspgK1J7gfeV2+3jQmET3GFjuYzEzElIeF
         9gqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0AbiKgmATerzhmzzbTqt0VJe+Qsx7JO8xfl0Z82pSn3kaMvQebisVtRW4glTyMdu+PB4xe8/4uZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3t/ln2VTunXiQ+baToCvAhAW589OfIR2wZCxcfghv2s+wwBbV
	sKG6RnoWB01pEc5u1CMB4iExfDZRXIeyLwP2aTzI9Fr3OAvM9fEXOIzZ/+VUTAHEh3tViYmz2D4
	MUbk=
X-Google-Smtp-Source: AGHT+IFc4ig7f+6vzcYDgZZvBiqAMxNCfru1pY7VxzHxyGtbBc8iE+1KHZ3X/1EqGkdRsZY6VWQI+Q==
X-Received: by 2002:a05:6512:158b:b0:539:fcba:cc65 with SMTP id 2adb3069b0e04-53a03f19aadmr6114709e87.17.1729184225472;
        Thu, 17 Oct 2024 09:57:05 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:51 +0300
Subject: [PATCH 01/14] dt-bindings: clock: qcom,rpmhcc: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-1-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2RlnfXAvC+5RWHBwXyBuZ+I/mjr57HcoH5Usgs02gbI=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHZtvURDf55P37zDxb8LACSerxh8RPQFpM+4
 vxtlrrjT8iJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB2QAKCRAU23LtvoBl
 uCd6D/9ucuKiZe99n9JqqOAsDKH743m2Ki2WWapxCHDR/ZEiIrwHImb1+3ic0JfXWXkjGOrj0CA
 8UOvt09T2fJ8ODtTdZ0DbHnEU6aOr63yHc3gTksvUtanWfg2MYEB2mqmlCPLmGKOgsxd1ljeUmr
 gAGVtgFsEryzAgko6tRckm2q/uNMM+AJmlxHvmq/kjy1SU7CTmyioiranWVB3c1XLMMDMrUouJ/
 BKMkC1i9P2KF4strZAY4Xa0pAWiNiaMxLy/ClEiNXb5bfPXgRaMBeK2t7jT9yusNG3GV6KwrApa
 zoSGblN54EYPKi+u13Tas0zrgC2JnVNHV2asVdxSPkq3QJs6rZ/f9qOsoeekyw9aZruWxy1jHCy
 h4/cO4r7Vm2fqSq+QY/CjOmmdx4c5Pc7COockLvRgFWa97K1m5V8Aqaaa46wowdZm3Y63j8v1wZ
 HyuneXkADqDery6LG7XJRRWcfYV9p9Hs6X6Y42+3V535jGcssN8Qmc3ApjE9MCv3CfucVKxYVhL
 2ngo1Ohpbykufn2qFr1/AurQ7eXFiBPvDlqRWRFnjkukUhplL874ZdKZRK1HYdGpWLSVLZBgN2i
 Oh2jPwkiBKWQSWZ8JJNVuCA5e34uffkabL3mI+286bAOkc+r2B8xEZx240dQ+s+vBoJLNI3EilP
 2DnewJO3lRtdgAw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for RPMh clock controller on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c08cd4b906f18f6a48631da59ce9a..a561a306b947a6933e33033f913328e7c74114bf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
+      - qcom,sar2130p-rpmh-clk
       - qcom,sc7180-rpmh-clk
       - qcom,sc7280-rpmh-clk
       - qcom,sc8180x-rpmh-clk

-- 
2.39.5

