Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533AB2FE05F
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672789; cv=none; b=KWNHQ6Ce+pS9hQwGEUmmGJjfQHnFHuGcRBaBqrdKD0RMrkhwRqtqz2CG1g3NEH7fvTQvag8uO0X6w+bDarBTKFR/Svxz6ql+GSiNS3QQ0ApwMy3+nQHBV6pNJDUhrOqNk7t0fBdeX4oXzLoVNJuy2ad2lp+mo8ABIbnWw0Pighw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672789; c=relaxed/simple;
	bh=hy/K6BGPw/RHqXahng2GeGBJJaR09CDU5bF5fZ2rVfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcNgzPuofGPYkxMHvKYoTKVkN8cnaeCvjxlJ9p/HIxuJvy1KtRAesH0vCSdbi4+vxWP8XvTZkE53axIxwwG28h9jxcz+kBrgYTQc2c4PV2GNw/oAl3f9lPFhz/7VuTMFOSt2ofqg7mLUIRGqPU+o0hIu9TmFo3u1G6hS5N481K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksY/XdeT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksY/XdeT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1128561f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672786; x=1764277586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGrpLSO7RqibWTIvvE58el48N4AMLKKXatRNlJSRkbc=;
        b=ksY/XdeTq12K5zcwXZXCAyyQ1GpS9oIl5WW+JfRFrHInfHHKRyXkeZ/y5/3NlF6LHT
         pJLiGPcM95lDO0RL/s3NwzAkqHAJAQQ1//bYMsytQr+BCvtkKNhHf+XeNnBRMrwD7yNd
         scGDD+5D0+Ex/4xhMIRfhUfrMqu7FtzRUMvIRVauK4+5s0BJciHpB3HiCyImeaovdjjo
         YLauLeLlUfntlC2QkVBV7Dzr6c4LyFWBFSvyFdM5wdxlBwvZT0M/K9vSxkC2j15madjb
         MHVr0Of7w446jxcsTlk/0tOWFUdXnikpRXqGTyawgmhX3Kk7O43hd6dI7EDUfW/oCXNf
         1z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672786; x=1764277586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGrpLSO7RqibWTIvvE58el48N4AMLKKXatRNlJSRkbc=;
        b=S/NDjU8zGAB5D8GWR3GMsFUwqHOHPl/lGQOOg670E/jO7Sp+GugJZhNy+q9LImm9A+
         Ayt+1pXV7LbhW/FC1d/NNhUv35+Vh4JZimDm53gGrLfErgHbHa1UmzpZYbTZfbBwt+5E
         /cnHkPI8yn5SFfBlHaqMi8MwMEHtTcN4uOym2W73I8e7hGGL5Zl5xk5TbYPeAX+LEPPG
         9wQkGdAaQDW3FxSjbmYwXfHpyhfvn06c01r8WNpaYB/9bNGxR4F/djdcI0FyR3fUN2ab
         dW90gs9ZMqOBhZklpxC+V5iQ7rP0wEpClFMM5TPhrzG2jErhKrtcOQhikdG41l8sPnIf
         0GbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWF/1i3BciAouhYHDiD8zJulah53r/BhPw8FKhTQi/BLNVZ8gVyxAJUUXGt+8FeeGMK10qcRvGXuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8EATJyBI5KM9NUfH1m/59HIBnoaECWzZKeIeNFTlE6xqEYJ4
	5LduabBRQmIDKSumCXnYtIqlJpz3Y77r+x2y0hsm0fVTGRa5vdKRxSnX6HnJ8qUFc/8=
X-Gm-Gg: ASbGncvEoyVQT6YtyvR7YJANVcOsbxaVqx+2y3Uhxg/8sykkIhDftNJNYgPO2ir8EK/
	2hBa5wG6nBIVCFcfINIYkThhSbmE7xdOYiujF0cSkEGPWWJIYS7jTaO/634NJwfBH0qIX7C7HfQ
	mRgIJHjMmyAGyWqmMckri7KJNZaX69RxHE7DlKmr5QJuhiQ2v7tljU5uYdb/4gSg9B8RyviQ7vo
	M/UBTo8jMa9H4Wxt6VTaPE8C4azVpBlo8iTr/I10TCGJHiQRr07Pa894uHfzEqaGaVH/E0kBW0D
	WeET6eXkf4zF89UrEWt0P8LBs+7QCJBptuCGzr/4eDdfJBP5LWCMhYNNYnbiaLcyPgH+BDUE3iW
	TCkxZvuhQMtPYYYj9e2q+nQw7BdX8ylwdtt8HarN3H9v3+ia5KVEAZO1jkWgCBltAYLNeVNcPP4
	RkiGxc9Bd4IA8flldSQLsV1YcnRPc/Va0wk8PWfl8=
X-Google-Smtp-Source: AGHT+IGRh9YI5GYMBjiLuiPtf2I0mkD9KZvk950BHI0yExr1aKpde6+NDWQM8tzXu5YIrtApVzQJ6A==
X-Received: by 2002:a5d:5f96:0:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42cbfb0864cmr837159f8f.30.1763672785635;
        Thu, 20 Nov 2025 13:06:25 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:25 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:12 +0000
Subject: [PATCH 2/4] dt-bindings: samsung: exynos-sysreg: add gs101 dpu
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-2-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=hy/K6BGPw/RHqXahng2GeGBJJaR09CDU5bF5fZ2rVfM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LKmGf5AQvj6tGjpwDAMh3/sbxlKcWzGEccy
 rqgIKhyMUeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CygAKCRDO6LjWAjRy
 ug9pD/92Ed6TgocOI6TPwbPNBdeEnDmaN0qY7edZYHy4zhr+Gqir3v12M4hhu2ud2IAwFzx2Y2Q
 rGB1UHYXGMZkAMdhKqNZodUw6eopkvqUaqtyCrEtcRsaAxRgATFlHrpu7RxfrUgtmq1W6rMFGbY
 SnbW69Q5TzevSTfcEI3RoMQs5U9D37YZDj8eIcJ27UD5q3E2yrHdcDhZteWBSMAsU6X/9d4PMZ4
 Fcyxk4TYEvasQHtPlhVEZ+ZrLIDkhjtr9DNkrWjsySnF465j8RnQScishN/C8gkOnUovNnTe/kT
 XyWOuuFHXSVCVSNFMLyZ9a2z+JtcgHqeT97ZOe2mnCLsM0WgeJC42acNdWBf3FieyO4eHrPVcUb
 RhHWgjj2v5FGWMXSJvL9O3Vrh1SpYsALsP6PQV66oxlynFV98xm6aGn3EEHIcrejftac5aYvT6X
 L9xSwuphPBxze2APX9E7DdxP13V5vOkHEnt5IcVPEnvdYEJDwnSezTOZ3a2oo93E0czHmthuKE+
 I6YeT6WOhIeWn5oTVEax8H/vgA79Ge/jStIgofj1dc6ZhvvM0W7Dq6iPNovAZqle9yxuR80L4Jj
 18skMFYo5GvGaFvc1MSaZ5I8biqifpLFNJK6xEgwZMgMnNB/qpNCNuZ5Xu+uymKPKldanRA2G8S
 qS21wV5IaZNh13g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dedicated compatibles for gs101 dpu sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 5e1e155510b3b1137d95b87a1bade36c814eec4f..9c63dbcd4d77f930b916087b8008c7f9888a56f5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg
@@ -92,6 +93,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-dpu-sysreg
               - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
               - google,gs101-misc-sysreg

-- 
2.52.0.rc2.455.g230fcf2819-goog

