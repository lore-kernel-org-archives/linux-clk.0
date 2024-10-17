Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC001E377E
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184238; cv=none; b=JHezPx8ZIDqzXGdrg3RJq3Gf8tP8htz3TIub8oEKg7+WFSVzVLWi3sRR+UtoVrB+isq6mMsWkVItBLX14lI+3YVZUBe1Rphy/CTZmHadZlUKajy0HEgOuVOO0jIaSyxNVvRT9TTwlu0lFk68ZKtWFp5Ewgg3P7dfFQOi/vrKaqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184238; c=relaxed/simple;
	bh=14axJ57FbtWb4/jR92DfjULo+XXCtDQGIgTfdhTzMXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddqw0Nm1NdEv3MrkpwSuOFKlrVm72rQa9i8f3/Vn2SZbQcjvFkGABcRX1qjuX6twgLca9XI+IbD5YHaOI8yXJPStijE0J3yNa/TWEQDhUDH3wrbp86jcUNpCIytyvoKFfLUQpjwpZcaC71P+hmyZUnvVuqp2dgG+aWWxbMvIrLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDX9n/S4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDX9n/S4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fe76e802so1513366e87.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184232; x=1729789032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENqIH0Vaspt2CZ8fDMyaIQtRaMVXtP7wRvavqANXfOo=;
        b=vDX9n/S4NUtBzOeIJgzXpFXihGV3j2FjBccrdJGNJQz3x1NGy/DAXwVnCFgoykApAz
         UwKJNQI7V07d3WrHroqh7LfhcIeZEvqAD51kElVRyvpLqUjHXuf9+roZ5K8FSDp8QeEl
         Yv18Jya4gJkf7VPaTq0Rgqph8jLXwqtVilmiGQ1zBpdHW9glSkDL0BUL9i4onatTyUj6
         hlOElLpS7kgT4sbiOMNfDyj/UdqBjv0ShWgcQNdpUHiqZ3pBmYJGRx41kpXKDWg3k7jU
         RUCxkgX671jAdMbKLgHwnh77NBO7mu4TQ1pdgVFK2v/PeJoQ0AsACp/ByF+CTCBK2PkC
         QfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184232; x=1729789032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENqIH0Vaspt2CZ8fDMyaIQtRaMVXtP7wRvavqANXfOo=;
        b=YsMkt90f96Xytz/C2ec2PCNMVXSAqiX97YZBVYJffzozlXuJ43Hw0visJnWxyv+lMs
         eP3mVU9dPZXJO/btNCFboYcgdaVjjwf+tVeQ6Y2kwWe6VW/XxqRdX03X2ru7pjiFk8Zk
         Z3e18wcAm3UOfoQh02216iy/tFA0ji+0MoEaxek53tR1W7GWq+t7kr/4CDAo8sxzNrxb
         RWludmSsevM1Ouq9lh3Posp2cbjpt1AcwXwz9kkM5k9LqegTfI4nrk/wquPaEo2OwIBw
         aau617jjQZILpH7a0Xah7IYWTuI1n9T+bIY3NBW0cBM0DH1rW91DBRHWrX/ILAiv2+4M
         rQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCWGzIGJ4CcriWhig9Ca85DzvmdQjKl2t7pd2hO7sIoaI+JKHR0MTyG5helqGlGE5z6sU4y5aVnBGu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DwW5X0OO567GUWa3ZwfA7kK+FvrLPC2XUV40Q57OeqnG+VoU
	UaJ9JM00bDnZmbdbM+zQKNW3CMH6n02yiOy1e80K6r5g75D2mZC1bEQ4JnWuEb0=
X-Google-Smtp-Source: AGHT+IEcGrDyVzcEIzZRfyzlFuV9wQDyJiLO4vLVAKRpWIKWz44COicxpmd9zvvP8vuCF2wnWNhVXw==
X-Received: by 2002:a05:6512:1598:b0:52c:9e82:a971 with SMTP id 2adb3069b0e04-539e54d77c8mr10757466e87.7.1729184232038;
        Thu, 17 Oct 2024 09:57:12 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:54 +0300
Subject: [PATCH 04/14] dt-bindings: clock: qcom,sm8550-dispcc: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-4-f75e740f0a8d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=14axJ57FbtWb4/jR92DfjULo+XXCtDQGIgTfdhTzMXE=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHaITb+BlRrcr5PjObGdH6vg9UuJ7Tx8zPv8
 GAu3FNRoDCJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB2gAKCRAU23LtvoBl
 uLLSD/0aOLEGwGB2tgzBdQXSAGiihf0HpuXVAsScLG3c3Ztgd7N/UxK6vH9yWtYCaA5+5L46Cun
 eDYrXsEteuKYAehHGKKbTma6aB0S/IEiTtLRueMrYabOq1DwYPbgUwHhU1lCxP3hwQqGqsAEXAY
 YRrQ/EJCItKfVsZyU/gUAIaHMd+g2ZyDocrTC12h6df0U0X9acsyBL6JszePBNlOvEMnfRjbfNR
 hKVqeB48kFHVaLlrENz/Z18+ERZRYRhEdePg+TU9J/TdIQblP/8gj/Kw38AUNO91f7zFJ4eZ1Ns
 dfqGgNhPKongci07+4EGjzd2qL//SszOXtjSZoZaiqZg5FQ5Xt1Bf5T9URUkXvyvZ7ZMnDKZUEn
 /KlQHbShdHzI7RpuO9E8j90DtZM9Psy6dUvbPSGBRDoOu6+9AaDZ7NMMgjZrM1p0EAVlGT/ZwY+
 VAKPHsX2p/fWgZV9F3PCIKPXxRePqgob1c14OyxzbLdTtcUoYXg3FHmXyM9yxZy/rB5tb+6j5bY
 vmDpCM0/z66n9C825zg0AZo3bNVoyuvmLoayizXSYHQC1i2dkT0ilf+fLAV0nFdew+qnRK8iOUo
 FjBuE63Hm6tLx8bo98SdfTorjv/G+71WCJIRviPKQGt2Ir9Zmx+M9xnpv1Fuz5NpI1sz3+VIRgl
 k83hPGTaszpimNA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the Display Clock Controller on SAR2130P
platform.

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

