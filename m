Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F8168BD
	for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 01:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992298; cv=none; b=qMYJc/Vk/6j/9Al8GjRHhbHc+eeEH0FhVZtdA3IKOeV0jvMCVAWPVoYGdG/mpxMn5iX7X2f2DByiiJrkaagoYvuxRuPHSvjOyeuq5xtAECj40UvL+YFa4lk/zqBz6gB91QYSYhGpK0K+6+cesduGMqxupeNJxy7NkxT95X6PJPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992298; c=relaxed/simple;
	bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k79bRshOF54cbBxlfmsiCKLmscE0f5F1ADq0mtLLf589d5ip4Q3dVXmXxkL06hfzG2Y/Vuw8VcaJxMIx2SsA5PhxOwXTKwFWrvu+VvGGNihrFdkhexCAMr7wpMs6Jbp4EjoV8qkEbEtQBy8AmqQbwbgvw7KG7LDeVntFefDk/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBoJN6BK; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBoJN6BK"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3195091e87.0
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 18:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992294; x=1730597094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=uBoJN6BKuXrHL9fpZsFlgAEqdq0N+eC75cVNArxS1XiwrxNaVQ2jTePvhybwvGqWhS
         Rx4/R2NnezrprzU7z/OvV+wpSf8oargQNshyZti6MexdpMZkyD3Uzlq3ZlbltnWhbYHS
         57G1212BLXWPknnvEzJB5t975xPBeABmDGgCNLCZ6JIM2wJb9aKc6R80tOVwQhIjddvZ
         fRlnyt3J6mAgvQODlJ09r6mUkbGi2qWDZgDWPchIM82y4oEx9m+sh7lg/5S3HtcAf0mV
         VfsqeYJKF73UayqNRarGKL+YWUrfeqNZ1eHkUr9onufECLnItKre80PAeJrBKfSM6uIx
         J61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992294; x=1730597094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=q2Vfw14H5wGNM3PtdmDis+ww5y6Qo8hrbWF+zbaZVBGAjj7p0/z+kt4jDKsLnhgTdW
         xLyJfxtSywwdkd4LNp2+2YVr5yHI7zzaN4vlPGpnH8RBAKvxTJe8YNUWg/iKfRb9uC2H
         TL1PwNmrMovYT+XJi4FdM8zto+JZPU9J5u3wq1JDeFsU5OcLA6xeiacfE0BQIt4Qj5Il
         S7QRvcab7nIHYReRPTn4VjEmi13OVYV/zoVX7BCpN4uAbFu9yxIP2zDTzogkFh7CbssM
         74+CyLaNxizYoDsqQ0UFzmHkz/wSn54sHjmCAwfHgjvBnhbobGOP5BtIdwHs2KQOJgga
         arCA==
X-Forwarded-Encrypted: i=1; AJvYcCVULgGabHlKo4Qr0gVjTcxaC1Xq6XdYOTq+z4nkRU/aSX++iMVfokmxXOGG/rxDxEIyTd92bwk7RIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHWyW4Ihxw+mcG91Ns7TlPsx6fucSoMdMmB9JVAJrUBQB6yeV9
	8ULsnj6ND8ym1dxOR/YKDl3JLwJkvvTlIzFWsACHatPYE7mGx0e1B+IoOpT0Zpbi1faM46VIwzk
	x
X-Google-Smtp-Source: AGHT+IGiYOPu0+miXsfKbA+BoUS68tGxCil0L/q/E6ujAC1kJirN/Wu3jo4yERfNnLwXRveE8yiTcw==
X-Received: by 2002:a05:6512:158b:b0:53b:1ede:9174 with SMTP id 2adb3069b0e04-53b33e6ba17mr1290073e87.28.1729992293845;
        Sat, 26 Oct 2024 18:24:53 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:40 +0200
Subject: [PATCH v5 01/11] dt-bindings: clock: qcom,rpmhcc: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-1-ecad2a1432ba@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZfelovW8yJwroP9DWSn+u371BwGZ39g4zhc
 X0WuaZACzWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WXwAKCRAU23LtvoBl
 uLZVD/9KjCZahhbIEWCxRuljPtAZCJkKcUGWGvCa0w5lwUnNWnjgY5+6VkYmP2um+WXK5M3kaEv
 gao7u/IVhO5ET42WZ7b9zIIcMjHAKLW3ESB0uKpxBkdYo8gMD1jENngKmoi2Krrq/psYT6u0Q5K
 ImiSxl2LFwoUo3zubaPCaIXEI7zSdWArT632jqephKF7FlQQ2h4rPo+CzZ8JY+Gj2bsw7CkJ0V1
 Om0EPxEXy10AagjZbOw9zuBfkCYkEPImOyXGHPT9z1vp3TGaHxzH4zYLLSgqigVLSg35qr+29oV
 c8DZcW5yHM3gID845CufHf0ZKvqoNEG0Ux3YQtKWYo8OEIS2Z+M3n2tqBre3V4FQEgXg9GLg5BS
 iuRxUKirMYJNbWSbxeTg6nWkOss32U072vttexkL/vy+0UmSFnT1vKgDvN4D1ZsSxGaIYyu4Epm
 26Pae1dyzUBqt3mT9I21DFCnZWv0j3YvmMSnE/dSs1V7Eux6/nACv29qD6sSh6cPBZKCHuoCLXh
 uF1ja/qj4kB7AfEzjdA8ipgomvDBijqc/Kuav7/bzpc35IKkgMXgcqAgyXqSej/BBCqIWnSZjJV
 kjyCRgLqMXkfwfR95nmR9FuypK6I/HQUQxeMtdUKVVhVWRK+dbWM+JLp+9nnLhtyTgLjpZ9Bu0H
 Y4daYsFZpLe4kcw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for RPMh clock controller on SAR2130P platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

