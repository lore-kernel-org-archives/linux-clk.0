Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830920E33D
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998126; cv=none; b=VnKgL9umihZzwZ7CmRBgPBj1VaHI3HhokWcGVuiZex3BSecPN/Aaa64ike90BeYHMjI3Zvm3RbGLTAoFn9HC68xUk8spuTLwB1x/bwFZpGYGeQVdUpQfsxQqBjCp//G2VpmEcLQLuJ1xILS8uo/ywc0txe6fHFwaYz8eh6CvfJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998126; c=relaxed/simple;
	bh=e53RMc/o+t8G5olvYD6O3vocPg/yw7s63mJC5mGlYpo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JJjl+/kgNLH7CW6NBv8ko+gaqhzsoQ68CO0Tsi+qNA7O+XcrJDRW6YjDuOmYuewnKBIgri7V9JRnFWI/+AIIlsZsB8pTc6AEe5nfb2FVi4dWJto65DYvTZIJQl2veHawcZDksgqYaqv2aSCj+QvJ93wgTaDUD0gorxM1+EN9HYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIzUx+jy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIzUx+jy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cee550af2so4753785e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998122; x=1746602922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2GjBdyaKCtW3zYRYh1auVT0QVvykzGugn0sug1VEl0=;
        b=EIzUx+jySSqbuv8FRZBacpgvY6f31S4d7OtYZxxn7zg9u7aLTVDAqGCeWL4/92G5eB
         hU9cJVPHpft18eQslGTKyftmHFklemQWXzDBbwJRYGnOk56YXU0aMRS6OxPMKoFM6ZDx
         uUp4aB3B0qc2mUkdcp5E49d8KFiLL6SmyNR/DQRHSPegYM9rp+1Y69ibegsz85DodEcW
         X7Uu1QEvxeSCxuSwl8KIKqaugCsNknXye7iRqHhE/dW23sQb0avaXsEQueG0DUW3VlnM
         el/KNF2CqVJ0heDHP+Qe/aeQ++EwU9Hbeynw6AfUt/hUn8g8/M1xDnxnndGbXT559YHp
         4a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998122; x=1746602922;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2GjBdyaKCtW3zYRYh1auVT0QVvykzGugn0sug1VEl0=;
        b=IhDqInU1PR0FyKtLtlJpg8YyHOvCBTE3RO1GB9iCD7OfKScaTh021BTlHiJESjJfhy
         7TwqTMor5jm4lpJw9eAPFMqayh1u/d5KWnwL0vopjEUwBXMgGRzdL4vs4BU/AS/467cr
         lsftEpTLMF3PsUvQSv7v8WQAJsUWSsipIPXmxkI2YjYU4NWSX9HJnDA2SdO+iUJ5hS64
         OFgft+rsZuviw6PcIwSeW5cEOZD/aredHClxDRayGiwsa68R8Tm3cWaq7rtXh6vvLKEK
         hhn6a2BdHFtTloi0upbDEqlNnmQTkUeznbyfnU2B3XrXMqXFjuucj63dIAk9QZIf5lHM
         wwLA==
X-Forwarded-Encrypted: i=1; AJvYcCVURJiTMkKRbRk8R0lvQoT8ant0SqUkBhKLTtMP/CHbNlm4hTprSiExTl9Qtrz9Kzjq8bt2YM77zyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9Mlzoy+QzOD39iATNmlHv+ifVUzYH1nrzfw9cGySQZ0ssnpL
	slSuTfq8lOf9xeCf/1XIlh4weTMzfGMTl9qwVhcUETLnja1THmfmRTdJWABzCUl0Nfx0IznK4jb
	s
X-Gm-Gg: ASbGncvF1itwjJiwYllgyytw2I+TjmpNQfce+V4j89+uTg87OKHYluQ86SKVPYShgcA
	gJ45kE0hhS3fHDsCqNgbXRKZcR0sUjLxYUSGB2C+yDf+GaR8HqVQz4nW+DZZ44yY6tM4llFShH9
	KxAq1JhU77IubwKT3ya07nlr7duQc837PcvdZxZHDyI4d/ZD7InHzP59ZpUIz27LgvxyWVIw5ix
	jaHXjq2/i7UPLZv0QbF1RAcfDKM4ALodQ82Lu4k5qPfkkrAp+aaDvBzN8/UYWvZEzL7WLX2cuSO
	h+VCkklQiLLI5dnPXTSTxI1RnYtUP18vn4FE69FW132yFjn0r0ydJT/4mys=
X-Google-Smtp-Source: AGHT+IGwTtEZNxfD7gnxZYy8bdkJG1uCnoJXegRtohIUB9oy12vNvD806a9awgtKzyXNxJJUksNc/A==
X-Received: by 2002:a05:600c:46c5:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441b2dea5cbmr3804325e9.4.1745998122329;
        Wed, 30 Apr 2025 00:28:42 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-4-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
 <20250428113517.426987-4-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 3/4] clk: samsung: exynosautov920: Fix
 incorrect CLKS_NR_CPUCL0 definition
Message-Id: <174599812090.45412.3776257923926441199.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 20:35:16 +0900, Shin Son wrote:
> The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock ID.
> It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which corresponds to
> a cluster peripheral clock, not the last clock ID for CPUCL0 as intended.
> 
> This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,
> properly matching the last clock ID for CPUCL0 as intended.
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition
      https://git.kernel.org/krzk/linux/c/f00aef8e2ee0b642abdb91682bec5af38532faf7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

