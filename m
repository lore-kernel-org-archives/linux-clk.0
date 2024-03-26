Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEF43AA4
	for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443613; cv=none; b=rvHd3y1p3mc66mJ3I1ilPdKh/lXZv1OICXDhY40+kB67z8TX5l3yKQnsqcxabMXDIpviXkS3PGYTwHfYZ70B2aa2JN6hxJBBgyGUUBq+MgNFX2KNfa7WN4tF5fCTX7tvSqwNO986Q7d/M7T+AkboKyG38HYzMT5W3tygtP2DxNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443613; c=relaxed/simple;
	bh=aeF2NGTij5If1PKU12QjxNSfCgLheAL5j7HQ6bmibUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rlSDw92Bu40/lU/sTNG4Pe04vc+AsXpE42KPLEVaEdwKM7PxDqS5TTCNWZI3DJaVjcfGIY4NdWkzpN+eqXFJO13vBrd82drtWsDCYnZElV5YtPucuPmFpq4yHGvSMHaP3LX9pPJXCYh4LeBDKk++tviw2YV3LV9DJ/EesWvbCFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhbUcvXP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhbUcvXP"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a468226e135so620360466b.0
        for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711443608; x=1712048408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4Nl3F9buqLWWf/KucUiB+H6du4zgHC1jQU4GH+Nt64=;
        b=VhbUcvXP0S1DEmFQ3hIPaQicYrk5YT7mVSDeN/EqmiOK7pfrNhzk6o2rjLNrErTPNs
         TqR47sRnL8g/6Ftnuk+EPAGqaafus2/dT0CD+6qlw0dlHBQLuFeAfi/qRzbq2+p8zJ3d
         xrrwNo9ZzDlDNA6M9SotqRtYg8ei8m6ms6C9qTvoBUtD1i1E4jcqK0MGkUidLjc4sbGo
         jJP0sGtUOWTjxfc0QZKW7ZzmhZf/SPZSxzkgSJs7FOD0jIba3nlw6yiXZLgoeG6GqnHN
         HTphWr1FZTR4QxnEWZYv9CiasG2dkQfB0mbnIsGcvlWhuHj8QBjZifGbMCpXoXwEzQPK
         C53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443608; x=1712048408;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4Nl3F9buqLWWf/KucUiB+H6du4zgHC1jQU4GH+Nt64=;
        b=qYaj0JLG/bdvj3a8LZUCDgSgHFJEocmcZ6pa8F0VIklcs+QD0FZPdHWFLsJTczxZV+
         9knKgYsKdXuzsjBt0zod34sL9D8Pf0nuL3C+fjJDUs2WAmj7PM0qhcWWApTkL9a6R6r2
         N96LkMNuz8CDuu6EraVYq/K0wxM9AwjHoVW/X8OvVgbI0tMC/SB8ps7Sjee/Mp9bbVsB
         HJzlm9gj9qejHvW9NKRQptRs4j27IZ6c2TyzDhb7VNhp/0sMPdnnet+S2D1do/C1om58
         0V/0Ly67QojgnDX194o+OP6d01LcrfqcHC0JvGvaTR04U+4DpkaCS9l/eKmn0tb5xpJF
         FogA==
X-Forwarded-Encrypted: i=1; AJvYcCULV6YK5uoLM65UCr6WNfa2Mg8h1Pplll5BP5VP0ZWbV/eB6cU1nrfic0hL9PwF1uLi8ZGsZMMpphlLn5WNr3qLiVQVIn2X8TBo
X-Gm-Message-State: AOJu0Yyr2UMu2zM29Wul298WsCSa8mf5tCwyEFlgE1ODvPMrv9FUMDOC
	KVhYEszK8GSpAMBASvHsESdrT8BzN/DX718D2MnKKRKxmRg42iZEXIuMNIjKYDo=
X-Google-Smtp-Source: AGHT+IGHbr/J30tOPNsBgLbO6NK9FwXqFdmdVip9nvl59imBHyDVqix+jCYmkJwMT7KQ8cMPh+dvZA==
X-Received: by 2002:a17:907:7246:b0:a4d:f7ec:65bd with SMTP id ds6-20020a170907724600b00a4df7ec65bdmr437983ejc.41.1711443607808;
        Tue, 26 Mar 2024 02:00:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906845900b00a4673706b4dsm4010129ejy.78.2024.03.26.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:00:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240301015118.30072-1-semen.protsenko@linaro.org>
References: <20240301015118.30072-1-semen.protsenko@linaro.org>
Subject: Re: [PATCH v4 1/3] clk: samsung: Implement manual PLL control for
 ARM64 SoCs
Message-Id: <171144360581.95110.13664376466376764034.b4-ty@linaro.org>
Date: Tue, 26 Mar 2024 10:00:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 29 Feb 2024 19:51:16 -0600, Sam Protsenko wrote:
> Some ARM64 Exynos chips are capable to control PLL clocks automatically.
> For those chips, whether the PLL is controlled automatically or manually
> is chosen in PLL_CON1 register with next bits:
> 
>     [28]  ENABLE_AUTOMATIC_CLKGATING
>     [1]   MANUAL_PLL_CTRL
>     [0]   AUTO_PLL_CTRL
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: Implement manual PLL control for ARM64 SoCs
      https://git.kernel.org/krzk/linux/c/7fa37084061fef80dab81bc062c6ec0fa8c26b2d
[2/3] clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1
      https://git.kernel.org/krzk/linux/c/dedf87341ad66fa6889fedcf610b6941d2d3bcb6
[3/3] arm64: dts: exynos: Add CPU clocks for Exynos850
      https://git.kernel.org/krzk/linux/c/704094c5981287c85dfdb0bf53abdfcdcc1f8597

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

