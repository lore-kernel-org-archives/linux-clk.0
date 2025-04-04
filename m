Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FAC1E9B04
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767823; cv=none; b=YUOSYkdda58fmZKh1lDB0kEjfioD/G+F1UmxUR5L9PWQaRFr0RwRRjmgA3ZefPBrhEN6IsczdWc1Nh5qkeEUfAFLZde/U2N0hX2TUfLQ29s2GQOl7KiEDsEDFZ3Co9zKWv151F9t1UnvkN1qZBFGOeXUfBebBg519kOdnarZGcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767823; c=relaxed/simple;
	bh=zsqexfN3olOy8cznO5MQ/mSDVYhWtEHBp8RW8IswWus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XM8QA1py9P7XgjlhJ6QQSDvBE8mvYDnQhU18U/9cTSOUzGQIlWqIbBl7PdjYd/okDKna9R3iA5QJd4R2bMyDhR285sGmPrXPkj5/dvYuBUMTJW5/B3o0lhiWM6XkVM1LzdLHuRKrgqdjuVXBSz7PDF3R9ZNIRzQTuRu7OLUVHFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+OMxxRK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+OMxxRK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf861f936so2720635e9.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767820; x=1744372620; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
        b=e+OMxxRKy/g2uN7leyfObciSAUKmNOxxbi2U5KH6KKQSXBy89Fv2EW6Y0xSquM0uXu
         fTX79pMaFihoj+cmeCNXlbJ6I0nAp5okizWugzQRFTyDIuWQLkr3RGKIz8zq2QRUnyx6
         Yp9wj3JBiXc4Q1P3mYsph0xzLrX0YGQ8GvP/X+PnudYBoYLIkr944w8AiNomHnKwXkhE
         J1qJ1/JQ6Rfi93veVX7VtataD5uf155YAuEQvynF5xUewYcJnk91XNaIGYiHP6JJ7Czm
         QOUvqOpXGwq1grvtjEt6B2HRFLen3zpqadR+oNeu2zb/485p28RRwBVfJoHvwYTDT/I6
         QGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767820; x=1744372620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y9jtm3UdXwtwABizUC1WU+17uEhYP0YGv4IThPOMns=;
        b=HRny4NsO83uS+cj91bN9aHSd74U2Ie0EwID3hWL9bG+1RE5IIcA52mpDTQOVyfWThU
         apm1cICpvQEFm+/lz+Yf9CGc1YwlmWTaoO3tid4QlWJ5GQCTR7NWJ3/LJG5WXQ+R5/5U
         lNrGXBO7UD2pSczjITqpFwGdUGnxtXHMRBFEgdyz7uHRnwzS4kJT3Pp2Cvf3vVtANtHs
         a67do/zbPUYShc5cGAQRQzUV3OUW2mY0D4Qic6DTknoVnq30POvlpYpaErV4JSPI2qps
         z91WcZ2WCDLphFdv9U9LJ5kNgBMGUVuH727gUz5k5W7ovpPGF9EYn0X62RzatM9T96/A
         cn3g==
X-Forwarded-Encrypted: i=1; AJvYcCUsT4XGYhDoZxTVwIjDaXdB++rhapdk+ZkjXZTVsN1jkHl39uL+0jRSuiYffi3/9qDudY+bcVuf/X8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4uXFM8j6pwsSKTU82eEpMk/C3TASpjcZOEVAmpwevaiB99r2
	o8g33TbFB1JMQKppGkMQazZB5WFlzo06Zlm7KrJEiW1uCGOerOZ72CQ2OOSsQP8=
X-Gm-Gg: ASbGncunp4NnAZi8UzTpq80Mfyw/fkcd6xkJU1eF1Ja9yt/Bhod7UcdaJAdPDNjT3Kh
	bYAjLmGI/dxfM4ffUw2YVZVb807sWoz+cdvLz+mSnVIy0Y1ElQfNn/QbiWKjWc4V0DFVjkoKmL1
	VXJIbU8QVOTCvoSo5Rj0sVSFLFCMFqJh3V7TWDBAbaHhid5lCuLuN64f2ATvBcHbEY3qY5UfdHB
	gFlE0TJN7RKMOheOWNRu4IXHUZc7M11TidT3AR0NNxiVlPt9KiGBMfwH9+/bufZtzluNcQg3hxU
	5bWblaqs3mGeudZPb08oVRglKn9ahazyn29V3NhLot2cuROs/MkQ5ojLTDhMqMQ=
X-Google-Smtp-Source: AGHT+IE3YMdROfy4Pz/lL2bVAErbCHUi9OQZGeJfx60uexq6ErgRMWHK+iTZDQBEUem01jamr5n43g==
X-Received: by 2002:a05:600c:3ba2:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-43ecf81ce08mr9264575e9.1.1743767819747;
        Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:56:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] clk: Do not enable by default during compile testing
Date: Fri, 04 Apr 2025 13:56:56 +0200
Message-Id: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjJ72cC/x3MQQqAIBBA0avErBsws4iuEi1EZ2ooLLQiiO6et
 HyL/x9IFIUS9MUDkS5JsoWMqizAzTZMhOKzQSvdKKMMLm4LLBN6YnuuR0K3LshWG+68aytTQ07
 3SCz3vx3G9/0AHeSjdWYAAAA=
X-Change-ID: 20250404-kconfig-defaults-clk-fa24f8dc6143
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.

No dependencies, can be picked by individual maintainers.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      clk: meson: Do not enable by default during compile testing
      clk: nuvoton: Do not enable by default during compile testing
      clk: stm32: Do not enable by default during compile testing
      clk: sunxi-ng: Do not enable by default during compile testing
      clk: sunxi: Do not enable by default during compile testing

 drivers/clk/meson/Kconfig    | 16 +++++++--------
 drivers/clk/nuvoton/Kconfig  |  4 ++--
 drivers/clk/stm32/Kconfig    |  8 ++++----
 drivers/clk/sunxi-ng/Kconfig | 48 ++++++++++++++++++++++----------------------
 drivers/clk/sunxi/Kconfig    | 10 ++++-----
 5 files changed, 43 insertions(+), 43 deletions(-)
---
base-commit: 07951d09335e96138e0595208fcc66c35ce0447e
change-id: 20250404-kconfig-defaults-clk-fa24f8dc6143

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

