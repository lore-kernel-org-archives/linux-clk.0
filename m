Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0C1A7AC3
	for <linux-clk@vger.kernel.org>; Wed, 21 Aug 2024 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239743; cv=none; b=ncAH0ghcZooCEYdhiHUPWlBie6gn1dNRBJnWv0rsK28yHb5SaxpMDAYLjkpYTH6I1GMNhJjBf4VD3vPkxBCKrukWITV/LDcdlR/QPGRaoyV2RBu0Y0AKSCwqV89nVZUryy9bpNsc5nkzEp6NOOqb74+V6nuw/pkK0hjtPkYr6+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239743; c=relaxed/simple;
	bh=M0Ooxo685v1POc7S1dTi/xgY7XnRXJDx1Ns73h4LP4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KKwM0oiSEhdfCtxsVfWDRYcDa1QngQ4p7fUcOr5fn3jKqMkwxvJC2Ninha3g99Q/s7fvNJ73oNJa2xbnJaNuTWrF4muv3u8xRfxA4fSY18iDj1gdtq5Cft0N/EZq6+/+qeVv0Cj6pm7DiCd1R7gSqkWFbqyuGRhUbLaaK+s+KKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ttied4kT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ttied4kT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42802ddfaa6so9121545e9.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Aug 2024 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724239738; x=1724844538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U98PhHfsQe7q0eoibYZl509/CH1f8+DFvvWpqdj0Cg=;
        b=Ttied4kT1+lfu/pbXW2WlALfx6LV1sZxy96Ei1ukPpSUXEaWyBAq/2oWLRBz4qj1rx
         mBb9uUiQWMid7rTeCJljTvdNWzxmNasgQsZCaZCOcnfKdBm8R007hNSuacD1c2pt8XkS
         q94dYBYrOHHQ82fSbvmvouUAMC2sBa1MkrYAyq1sRTdm5rPgXms2KsiG3D+Zd1vHKUjs
         1YlcLlFIjYnOzZJIVhBF+SQBHEl/ESSpAidq/2cPPbK+rsrqhpGORhJoc/5VxU55Y1FZ
         SKV78G5jueEci5fc8ExB4d6ECKnOwNNWRGhpfjwsH78cpk7P7uc7Bt/U5+rKQry/nK8d
         9miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724239738; x=1724844538;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2U98PhHfsQe7q0eoibYZl509/CH1f8+DFvvWpqdj0Cg=;
        b=fRLOwH85T9tVlZDAW7Q9LAgME5Nj9SVHEkhgl+erw9tXXw+WGWWKFqnUpPJRkvLLR8
         wELiaVmh4wOFGIR0gU7nykT7JO7u1wqiM6jSNBbTxbk5OKIeRXxf3AE5rhpM/fLJoGoW
         A/fWCcGjO7g8iBg/ULhb3BPBMeu2YkzTjiVqDQ2iQOwFgeI3VEqiEz6Nz3Ntcg21de5X
         7wjBWqZ70cHVRmIqdUeLWlU154scn5I9UWxvgHtE0tZW5gU0lG9j2PxVQW5JR0p/9m3S
         o15vUBsjzqTMREjmsPHhazzzjFhy0mTOnJKI9UshSckVYEHj2WvfZUpnLTnoVMvBx446
         fBGg==
X-Forwarded-Encrypted: i=1; AJvYcCU03wAA+TujpClRIku4FFsGcifQbtgPf5KKDgsPQ1CnsbDJrsoRZKjw3Tojl7yTgf1pzLj9bnixFio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ny0DSdvqp/BNnCmmWLZZYGVoQvNi2LmVurYzyKFJCBKC6OsA
	HcixdODU7fq53Md+qoxvx98QBZSTy1ARASHvNlyEHnjUhRf1o1uAJw7K0F8FzSUKJMpqGxcAFUs
	Z
X-Google-Smtp-Source: AGHT+IEIuQbc89lIhEz/EoJLwbR+11BG8ia7GTtZCJ5M/PeGK9/JE2t6rDDT3qG5CyMk8VcRiLyGDg==
X-Received: by 2002:a05:6000:154d:b0:362:4aac:8697 with SMTP id ffacd0b85a97d-372fd4d1195mr817938f8f.0.1724239738366;
        Wed, 21 Aug 2024 04:28:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897926sm15446926f8f.87.2024.08.21.04.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 04:28:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Virag <virag.david003@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240816175034.769628-1-virag.david003@gmail.com>
References: <20240816175034.769628-1-virag.david003@gmail.com>
Subject: Re: [PATCH v3 0/2] Add USB clocks to Exynos7885
Message-Id: <172423973629.252925.10167794996873239462.b4-ty@linaro.org>
Date: Wed, 21 Aug 2024 13:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 16 Aug 2024 19:50:30 +0200, David Virag wrote:
> This set of patches adds the clocks necessary for USB on the Exynos7885
> SoC.
> 
> Earlier versions of the set also contained some fixes for issues with
> the existing driver/bindings, which have been applied now.
> 
> Changes in v2:
> - Split from full patchset.
> - Added Cc-stable tags and fixes tag to update CLKS_NR_FSYS patch
> - Blank line fixes
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: clk-pll: Add support for pll_1418x
      https://git.kernel.org/krzk/linux/c/4e39e5b84361924006f4d7cf81e049a2793079a6
[2/2] clk: samsung: exynos7885: Add USB related clocks to CMU_FSYS
      https://git.kernel.org/krzk/linux/c/011a9de99793c3a2ee612ff3e0ce293dcbea6df0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

