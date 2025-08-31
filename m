Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C88190685
	for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637751; cv=none; b=shAnJcQZmSwJ/T5BOnqHmfyDErtE8UKn4zpg8W2ZTb+HmurwviuChyfYQTx7ReofmnHaF26YMig8co7E4lNSnaexMz54ZKi1HVqykxyk2GuAGv+qUrEHd6XRJzKBCHiaPOReAPrQxqI7Jj0/qN0MaVseJTwQ8PYXpW7CfbIlI1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637751; c=relaxed/simple;
	bh=xi1fLpfGfUX4eRrB19iaWWJsrywWFFqGcHHL0PuDem4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=slcbNthv0sx6BswfZ/DvD60JmUM2VwRR47lFNPagCk01U4FuVoLSRrZ64oCERw1e8zij8EgdGbhO7s3cfP95w2qq8msrNasC6+7FM2wVCkLfPl03z61/2DcdkWOlzOZfAh8o+9PdBb3w6wMM89MhMfMqGJ0Om+uYRs4B10LlamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7ZEfBg8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7ZEfBg8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb731ca55so54842766b.0
        for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756637747; x=1757242547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9Ikcisp0DawIJEHv4fsbvQNKoZVQCvvL3i/2eqE6R0=;
        b=d7ZEfBg8w+/45HKi1OdAwAejyFJwpmygh5Y7puMvIEh43PxrcgBIKbtrbWQ/SKKdzB
         1GvqM4nEBa5w0JE+WgOuQraSM7mp5pNdvf6rRioYh0VttSvrTtRHNVN72sHy+W4yrXqj
         dO4Z6kHDMTrb9VzGRRlK9JDpy9Tr4WQcNWOa7llccqBLeJvMQ3yyJl7JYjCII36d4yid
         0C3/V0lI5i7+cJJwjpsOjQVsMZhi+9d1EnCwaVLjsATtkfWgCgValWscRcpUtywgqbaL
         kZFCwPc6P0i3XL3JGo5Lf5LTdecRWjCUEy3IjcSFytRmU/9xfz/bYEL0WJY70wKoJLin
         /LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637747; x=1757242547;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9Ikcisp0DawIJEHv4fsbvQNKoZVQCvvL3i/2eqE6R0=;
        b=oP/GypnFVvCM+cQZ86SXkLYEx/cG6rqhD2CuQY8U/9LsnaVyjqofuQnBsoDhsxRQV/
         hhRLE157Os7mVaUeqbtP9bekw4p3sUxUyy8oFDT+JORXIDtNN1eysh8mmKUWBt8xQ+98
         aHuw/83ayCRv3/wL5uHrZn5gNI9y3TAedzECP7zYMN17Mhpwq4vRQUkF8UkBjHaYoW2n
         VYipUXYaCVnw5iScB7/JmGsVH3mNbClpNHPiUjPZImciCuhje8MwPPVCx+vdXXvM31bn
         pf8U5idFphA05fS4rvO/FS9IiEF0w99xZb2W2q1QFx5nnrjwDR+BoUzK7xIABKITVxGt
         DqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOEgDV+L9NwpmKO/3ofUGclhv9paDKSlPZsjIse2xmZJDs79MYLDgZ/tEiHBFi5MOE0qRH8R7su0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzngsoFJyDJ+oc33BhRAe4DQPkq3yPndKSBu5dnzYuyU4xNdXm6
	z8bTAVbfyPrPaV6eVtgrr6+bLdAjoAQuB3Kb+FoN6W/CbzlZv2USPsZpWclJEBBpYkU=
X-Gm-Gg: ASbGncuolYocGC5PHrzgmYHOG1/E3m7ydzY4CS5IHmAILbh7nZ1YA7jmx//bbxNb016
	4yuz8+8jJhF2igWmgWSgwDgqb1OmFrj/Rtkz5DQ1jvvqmFgLpUwfSyKhZLwN/ApklMzDa1neNCu
	Sy6OtQJu3JgZWWo34AEnzpTQpCEHdnRhLPFQUeZ5W/M05I8MGOCMuVqTxbET2UYTEZ4vFp1qygw
	PQI+2acLvqLAXxk8hvTUgUGZTRtiF+YGfrufEZD7VwzJXTpeZsV6bFVR4vHii18HVD8Gr+LWsyy
	6vAHjiES4ejs1iE5mZsDFaaTTOcDk/40JlcP+xyQIeXzrUzXak9jJapXWmrU63+eozGZ56OmBqr
	KQCgV4NIrpC+1X5oSw9XRO1UMmI6b49pvIHbDuTzlwjtxzy9ciw==
X-Google-Smtp-Source: AGHT+IGQnHEGxYKHduO0rCDVlsbQla5BpUnmcBYqLI8jWWy/4+T75FA5udztvTzcc7SvlOo9rfc4BA==
X-Received: by 2002:a17:907:e8d:b0:afe:d218:3d21 with SMTP id a640c23a62f3a-aff040b2788mr405254066b.4.1756637747009;
        Sun, 31 Aug 2025 03:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm468318066b.88.2025.08.31.03.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:55:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
Subject: Re: [PATCH v5 0/5] clk: samsung: exynos990: CMU_TOP fixes (mux
 regs, widths, factors)
Message-Id: <175663774498.35421.6694005756444857104.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 12:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Aug 2025 16:28:37 +0000, Denzeel Oliva wrote:
> Two small fixes for Exynos990 CMU_TOP:
> 
> Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
> CMUREF mux/div, and update clock IDs.
> Fix mux/div bit widths and replace a few bogus divs with fixed-factor
> clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.
> 
> [...]

Applied, thanks!

[1/5] clk: samsung: exynos990: Use PLL_CON0 for PLL parent muxes
      https://git.kernel.org/krzk/linux/c/19b50ab02eddbbd87ec2f0ad4a5bc93ac1c9b82d
[2/5] clk: samsung: exynos990: Fix CMU_TOP mux/div bit widths
      https://git.kernel.org/krzk/linux/c/ce2eb09b430ddf9d7c9d685bdd81de011bccd4ad
[3/5] clk: samsung: exynos990: Replace bogus divs with fixed-factor clocks
      https://git.kernel.org/krzk/linux/c/a66dabcd2cb8389fd73cab8896fd727fa2ea8d8b
[4/5] dt-bindings: clock: exynos990: Extend clocks IDs
      https://git.kernel.org/krzk/linux/c/76f1e2ee545b3165e1e24293b59414699118266a
[5/5] clk: samsung: exynos990: Add DPU_BUS and CMUREF mux/div and update CLKS_NR_TOP
      https://git.kernel.org/krzk/linux/c/8c82bb53669b1e82435b5a00a170b7c079940b82

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

