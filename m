Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7716D2253B2
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313957; cv=none; b=iDMyWSLinwc+26izDPO4DdcFgCaKiHhbLcCf7geQAfpKYzrm75ZYprHi8QtvmhAaQX5t3Iodqt4yvEp4dlJ13a80PMZU9GGiZMlXTiBwUwxshfOr0KemX+mpXD8zIFnfGerAvscLD+HxbVbN+JOwRJ0CuNScAu53pRpLSqToSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313957; c=relaxed/simple;
	bh=OibAgO1lF+UrLS/2SrpwgUDc/nYn6zF9seSKQty2XPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UJpiGjROBTiCEjLYRghKrYgr3q333bsch2YtIzfAvuspEYP65sRzOiEonVOa8OzOVyxnrKBdBxe96j1iAQPVnFVhkBJn666vWg8YOUl4B3Mvi0Xib0BJR2TEf9yp9QVz18IIWxXyi0K1UQTIKPFo7Vm0UxEwUYReO7cwRNjFmgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SWJarbqB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SWJarbqB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso8301285e9.1
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313954; x=1747918754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=SWJarbqBBFHiPWCrYUdPCysLjD4CHx5I5ox6xTlD8puj8u6CIUmdLhxeoNqF5kGGq4
         PiQrGVg6toZdaz6aKdgWzTnZ6nNlPxe8U46Hnu7MNmYx4/eYsMcvYAkwosx37MT4KkCW
         F2fsezvj/QIFF9FQucom6LNfVAO6goDLcPT8E6JLK0k901Waq+AwUx53+K9jyu10w5X7
         8XEJoJSVOGJPe+REkyREO8SriQdH9jpxB5Ji/55m5+YqyrJMLuqMEyynrKj3kH8oSkGV
         C0/pSCCN7r6rc8VBdiWf2tpDv1eW4+zum65W4/eo+difKzxVinP0F32zB/ap1rRsdn06
         3/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313954; x=1747918754;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=LaWtSr9cTdMPFacFGjdRPwQicCQNhsKbmCXyDo4CQfAwyAZAjxm07u5pSRMn8zlij0
         InxDdpL8zhEEBuAFIMcdh7F9auU6SojCS7cNZZVKIL9QA2hCTuoyBg5BBd2L3RkVgmj0
         A1sT43lgCtXhJvmJK3+Ea/r75ZQ9hx/4m3+ZK7nZUd8WBnv+Ih7Y798TU4wGwRCKGtpx
         zr9Tc6NqjhV1RHEt/uZI8BEUoNARAB1sSCBsdCNDGKqV/kRRBLOan9ZDYM0jrSFZ1ODm
         7CGoDRDmG0qVv1HVfhcdHXnV6/YOzro6Nx8sK9AN9wSsSqMr8HiCt/kcV/XkVi+CYGuF
         PBRw==
X-Forwarded-Encrypted: i=1; AJvYcCVD2Le/TL86lWogKJ0dbb5LAUVH0Z7XFQHLFiFZ8eCEiBU828H90I3z3g4BWDVDKKxHr5SMO9MOIVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHMha3XkkL03zmMc0S5jk2fbm+vsVYdxrRcfAJ8IdMBXtKiM2C
	OL1wpY57KDEZx3zF8xIkILADV1PWNJYmO2pDEoaTiGp5boe+r+X2kirFwc4OWh0=
X-Gm-Gg: ASbGncujFq2xslAJuXQbs3d3Ulwp2Dor87yauueWxaIUNXxCglBXaXJ/gMB4AXPjrE7
	8JMpn8eC4/Ti+KjUw/uJOSd+ilj+LuKZY9hi85HGjFqZ4f7gXBo6lExY351uN6C1jzvrswsHH2M
	9Kb1NjtwU5B7rZndFNmNpFm5M6gk/APPH5Htri2aNQVLdeU0egfae3ctU3Jkz4CJ/2IjunCXyMS
	uaf0nK0bYRVerHFt12PCR4ir+trut3M8m/H7ubQqrGhQTVWlkOeyvUESKnw4KROobvNFb1K1JJI
	1A7NEVB5zMeDITFnCFwS9CV0+Q7Pkp/GY6LbpvHv962hUBx5D0JPneux68UW1kKg+w==
X-Google-Smtp-Source: AGHT+IFyeqD0A0IScg3QZihC1XrEVTucJipRcuMxEvf1pQxV8DR8pNFyFAx+gn85sF514EVzZ/V3/Q==
X-Received: by 2002:a05:600c:3554:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-442f970a9bfmr25956895e9.24.1747313953125;
        Thu, 15 May 2025 05:59:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Subject: Re: (subset) [PATCH 0/5] clk: Do not enable by default during
 compile testing
Message-Id: <174731395227.3761659.8617180462546520115.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/5] clk: meson: Do not enable by default during compile testing
      https://github.com/BayLibre/clk-meson/commit/0afce85ed26c

Best regards,
--
Jerome

