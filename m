Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e8z7WlIn"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B147E1725
	for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 09:20:00 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4083f613275so15840935e9.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 09:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700846399; x=1701451199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d1leqtXuRjh3vDQD1vENVeJ67TD/CQIGzFzr3jZ/Rw=;
        b=e8z7WlInALi26lTFnVyEdD4XPSgTi+7R4sktHk5KQ6OOaAiDLr/hVDMz77d7A3uyB9
         qMIZZF9fnlw6dKHWi/2iB9nlkBUmLBM0g5eZH5qITaR8m7HnieRR6YiTcGhypMrRVnQw
         D8yYKP/68QBQPhHlhFJQ8ogpCcS2+2CgjBhHBpcs3orvqWYf6H9ay61Vnzer/9sAd710
         f4yBQJTo32R3iansQKw4aC7jXKmQFIv0xwqcoa45+k8GAlzYDFmpRBiOe/0UZpRQ7hqt
         0scuwRfgBhGHt642452YAn+HmJPOyZcjpuiUvexMGDXU3xAbB1MHIR52E8s4hAVAhAi0
         mTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700846399; x=1701451199;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2d1leqtXuRjh3vDQD1vENVeJ67TD/CQIGzFzr3jZ/Rw=;
        b=viBC2EWs6fG4MwLIxzlvu4ZIza3IFZmLdukVYOaXCdg1x2lL4qNMS5Czq5cyNZHFlF
         Ywm9B8SKnQMi19QRQZpAwohoDXr/dszkW12c/gC+N3zrtC2Q/je7TFZVlbClI9gre9jw
         0Utn2P/uxntfHsx5GUJ4YP7NWRtS/nUflbmuv1lmNl27+KUGpQ1MbnMzuBSRJnNgDlEj
         9icVLta5s+dUHA1OU5G1lJAHoWW73qq//sej4FrSyVaGANaKJWaIJA6io3tKQJaLaqmK
         4c7dUvjZ7S/zM89XxLw2q5DCM0gmzgAw8VFNM89KYfrvqzxK5r3JEP1pqvXcYhmbYdD0
         3BvA==
X-Gm-Message-State: AOJu0YxVmSzOU+CCP+COJ9c52J60gd5/QMqWibE1y19gpHd2tYfqb2Sm
	hcRzZEi9Gjy4XwIIky18VORYSw==
X-Google-Smtp-Source: AGHT+IGof/O1OGnHaLOZnn6ikBllpdYsJKE4lZGWZe1M6TLjaYOYsj7vsLD/q57/Kn0PjoMIKgomtQ==
X-Received: by 2002:a05:600c:450b:b0:408:3f61:cb4f with SMTP id t11-20020a05600c450b00b004083f61cb4fmr2927268wmo.23.1700846399037;
        Fri, 24 Nov 2023 09:19:59 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
        by smtp.googlemail.com with ESMTPSA id o18-20020adf8b92000000b00332e8dd713fsm2547663wra.74.2023.11.24.09.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:19:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
Subject: Re: [PATCH 0/3] clk: meson: add MIPI ISP & CSI PHY clocks
Message-Id: <170084639792.2638113.9821910765744986123.b4-ty@baylibre.com>
Date: Fri, 24 Nov 2023 18:19:57 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

Applied to clk-meson (v6.8/drivers), thanks!

[1/3] dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI PHY clock ids
      https://github.com/BayLibre/clk-meson/commit/439d3404addf
[2/3] clk: meson: g12a: add MIPI ISP clocks
      https://github.com/BayLibre/clk-meson/commit/773e4e987308
[3/3] clk: meson: g12a: add CSI & ISP gates clocks
      https://github.com/BayLibre/clk-meson/commit/5205628ab0bf

Best regards,
--
Jerome

