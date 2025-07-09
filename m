Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596552877E8
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055795; cv=none; b=k4lancLRc0+rfz3bk3QJNxHzfn/JE70u3LFAwqdIva5Ld6J53e40HiE586Y6Nq2RpMpXC+p5mGndlEKK0hL+hbTOjq2fYe04ih0jhoh27muBE+k+5zP6sPUL+qrDhUfMdMigNirPf+gxf1hHOF4WmKwuPqXMIHRTnnPwdCywg00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055795; c=relaxed/simple;
	bh=famRRvFrFYpSXcgLA4nbJLP0BYRXxaou57j/60RhaTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cx+y0wyH6/w3yMSOpQHYqf+8l/PcGMf6y2YxbkJxZJ8ASy5ai3SHp6XfoBUtKxSe+UVO85X1sIa4WXWbODOAYeCz9i0i2QikJanks39WOd5WFqD44J6h8bzd+fv2EXqDiyaiD7dvIfCczOyg7Q3PIv3/7rDU9T58r95dIHyrzZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuGiAtFx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuGiAtFx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so61584995e9.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055790; x=1752660590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMidPiz8WPRxgxTAsiQCyYCTxHgFambXMuO+HJdSTnU=;
        b=RuGiAtFxfe7V8SltGasThXEfB805tdDLOGRKSa8tRGZnt51aW8CAAIS5OSaexbmCfH
         kQR1Rq5AlylCmwtUa4FZ5FHjIBRtPOHZ2FvQOczz5r3Ki4AS7HnjWkwjdsjJ2KtKr7Mh
         d/10rnAn/j0G6sShLvQ3NTXVExhy0iwzpyB1My9ahCEGYvqaocFs4gytRSnLTt7Tj3gP
         38IEh7WLBKFLUU806CggYKFY+I0h+tMOf+FK+iUTVphygOExP4dw/5ifKVdkWcL78jO9
         yj/XN8lCD1cJuDF4qX1VE9WapJQQI/cYi3QNAAvqsNGWX+68RE/OeXxLnpgxig90+uRy
         knvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055790; x=1752660590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMidPiz8WPRxgxTAsiQCyYCTxHgFambXMuO+HJdSTnU=;
        b=xGrd9GknezNbEkJJ4k7ZBfxp4NgGl8PkqhR1l2pLgXOQBi9ipme8TsQClNoQIvR0WU
         XelXNWuIEZPhdIZY1DJNj5bWohYKj/V/7ErhDcPyGfOoABsgQyV2h70J9bhtGPP1t3Mo
         uKiB7udEcjXPYpwHoVMZj7szALx+wKVk/2z8jh6INeHZgCfVuj3SvgBSlPOU7ydN7Ypq
         nPb5dib3ceGBvasooE0gzmAx/GGsRS5ceixBCvnNAUMbflauGHSy0bc6DdDNfaRZCR4i
         v1km72+L67S0IaPsWUeoEKRXBwRB446WaPAaglnFft53/d13JlQRJfN2ChcsY1A6p2OY
         PncA==
X-Forwarded-Encrypted: i=1; AJvYcCXiGm+fmzR2rc2WzSR+ex3jRPtmA0t5hnXE63IkcmzulfQGeD9RiJ6qa5I26/bpdEq0rz0pa0zytNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dxUYRmGY02VHHxvSob04ti7LPrQ6kAjR6NsiFmMs7MC5aT4i
	3+CMrzLpUPk4M97QplLLJVgjVEmtbKCT3bQllrb6trHv8Mo2AGsNFgVZeP87Vwi3sdY=
X-Gm-Gg: ASbGncsjpZf8rYrSHeDMrOeljluGCCYVaxVnJruvJL4/R23w4sUfFnt0ofB0JzpAxEG
	4isOXUbKHmCmkqB33gGEnez+BwrtqhH/mV7t+FtSLRsqHrDMHSo8AxGOu4TH/Tf3AbSks0u1uMo
	P0w2aA0i/ybEWBgaolbjNzjGGBgA5/WLHSxHLszWBIsd1KKpxB9fpq1ZONS1SPZdN9B7+gBBcRn
	qCZSmsUocIXww2DE7NVM/z0aPfBcITLw2JbbV78dj6/rooG0IKMGG0GSn8bDstL0sHWXbMP3XkN
	xLxPBxyIdRZrnUJdW5oGxT8cWxwYDtROt6WDDez8nsBc+bnoZbYYnNjVABFcHhk5NIc5QalmXox
	PQg==
X-Google-Smtp-Source: AGHT+IEQkukkYSsMmMa7GE5Hjh/cy4YGqwOjr0P/jFLkEO6jYv+Hgr+mzq9RXN3BH/cGiA3SEVfLcQ==
X-Received: by 2002:a05:600c:4fcf:b0:454:ad94:4b3d with SMTP id 5b1f17b1804b1-454d5310e5fmr15844895e9.1.1752055790451;
        Wed, 09 Jul 2025 03:09:50 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:53 +0200
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom,sm8450-videocc: Document
 X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-1-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

X1E80100 videocc is largely identical to SM8550, but needs slightly
different PLL frequencies. Add a separate qcom,x1e80100-videocc compatible
to the existing schema used for SM8550.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 0d99178332cb99d3f02f50605e19b9b26e3ec807..fcd2727dae46711650fc8fe71221a06630040026 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
+      - qcom,x1e80100-videocc
 
   clocks:
     items:

-- 
2.49.0

