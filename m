Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C5530C620
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758726678; cv=none; b=cEKWiYakLavb1gSlFLcNWpyYolgcz1d8g1KcYZwVf4jwY+5TuRgsDHE6fGa4nSMdMNNvdK5KGr1GySOIHOnQ2oNVijX2bYj2B8n6VQjdrOI9efC7aepyW7X4QQynTWUk0F0X+cHwtYVnBxvdPG8H2glXYsqSvTTenqXzp7DTeHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758726678; c=relaxed/simple;
	bh=xIpVlqe4DgqHRCmW3A7H3ri8twq/hpgQwg/JQ3/NwCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPngzBbBvfXuAc9mm2ykS6FpvUb47zyhS3bkIY9/PHlRBHUgSjAekVtKsEy+zEmjF/1rLuR8d2iHk7+UHM/S2E21WIXnmFAh6P+kj9JMP2gRUz3AveY9SvkzDzzeXx+IEpsZNBpha7K2is122AtdII2/wblgq7Amw6hW34hDa3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnQ7WPoh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnQ7WPoh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e1cc6299cso21197115e9.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726674; x=1759331474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5s4FpMZhs2JDSa9c1gCTflWw3s59360Z3ANCY77Ti6w=;
        b=NnQ7WPohdgVlptg3OytPDzjTtCLALbezoa8X2iyQsY+kE6LXXKjgKqzFkfIvmNcN6W
         OtPSwxoQnvjVZS+iJboMKlxSTg58ytl2JmPI8kbgYtEjX5FpqiM+KThg1r6g9KPpHFUY
         sdtmuvmXpKmr6sHOQ0OKCIRIclo62cnJa39ppPMzJs9Aokd90KjsyR1fs07hqXmBaafK
         XR/MMeYP7c48WD0WPWE668HuoBoraGSzkBS3Qi/T778Pa4EiV76CzHJWMOZdWD+1q08N
         ysZueqek0FqjoFQLyV9RGzGiYFQZfchEksjzwHbTsWDlrA6mbHRG1vPtuNvBspMFXJsm
         HlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726674; x=1759331474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5s4FpMZhs2JDSa9c1gCTflWw3s59360Z3ANCY77Ti6w=;
        b=Kp7qzjV0z3j8He16xNJy+y73sOuasO1i8gJqVJ7kacZlCVEb1JJJw7B16ZQw6GuHEk
         HwQhV7RgFYC4g2/eDdqPWBOs6dnygqzsu9ETZ3q0ketFV0liv/+DQLJksVrp2NMtq9a0
         YiJjbfD3SkEUtFmswf5DkUDOdb+Ouciu80JrvUG4W0gT7/K/wjkROEes9b6S1/G6mLg7
         OE0OTpKNZfx83oAYjv8dj1cD/c2Bdwr2jwhGWRlgjz+RviaTf9ollImEsnlYkVSRCQnb
         t/8hj7WMcyQlSrNgaCmmkJkqhnHHDqXZ8Pg++gvhcI03CKSYMt91RQLTA7byEfqDW+TI
         7kbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZlU00mKyTyz8cZ09y4ugezF1nw7Fv/VIKCMERjztYwB5R5fQNgBWFgTzJ6nyE0kgthfnbZV80kkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFc+m0PYy2FPr8GooeoGw3+ki+h5/D/VDaAUs+acv+5AUY4B9p
	kJe2KNQ5sBBteJJnF8WCsOQXlLQUhn9mDV3MBtRWMpxwl7D5tCC0i8tkQzos9bs9VX4=
X-Gm-Gg: ASbGnctGM6a9uwcZbNR0KLw1BFZGc/oEtDziqADTrx0GPQbKLQxdX5JVNy3VP0vhW7H
	QZGsAJD7tVlon2t6w90qS6YmkGDkn1HyEfjXaIs2qah9AYzEiJ6eo7qp2PWY+QjjyOapxcIQ2u8
	QnPm8Z2kEpwul/vrXAzKWte6gftRBaFRmsrQzptTkhVLVJSa7etott3TT2IuxL8e9spZDKHQbmp
	Oq9QTrUN8uX8G1dP9tPFvbCbwDU3AlJ+ZSgKFkHZNb1by1fHm62INSaS5roe856yJrWmiNyebvk
	ZHnTsxhNyJb9Du4htwtFP48L53NlFkNNTekG4ZZ//NHniiNChNBBANFrXGz1fHwqjqnocnzz0r/
	hLWfNz/GPDjeMxuXI2Auit9BGz6uIuG6KNjFhl70G0T5HjA6klgAjm8Bg01XtCMKJg2xc16SQSR
	c=
X-Google-Smtp-Source: AGHT+IHqxep/cc4oLyuE3HkDZXgTyzUFzuxNas67CCOIgFLvhkPXSKwzO0M1vA4oarAwjHeMAdt19w==
X-Received: by 2002:a05:600c:46cc:b0:45d:7d88:edcd with SMTP id 5b1f17b1804b1-46e32a030cbmr2096795e9.30.1758726673765;
        Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:13 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:11:04 +0000
Subject: [PATCH v5 5/5] arm64: defconfig: enable Exynos ACPM clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-clk-v5-5-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
In-Reply-To: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726668; l=946;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=xIpVlqe4DgqHRCmW3A7H3ri8twq/hpgQwg/JQ3/NwCA=;
 b=T1W9QO6+wC3/3UAC8KME30JBVVpkIcd/QWetlJFmV0a29DJ0ch+9QIyJk/3CeLRIN/rq+eDDL
 Wp7i7Gau7g5C0/rIp8NH9P+T+1wyVZVtps9in7VOZIRgtRa7ujunkW0
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..646097e94efe7f1a18fb59d5b6dfc6268be91383 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

-- 
2.51.0.536.g15c5d4f767-goog

