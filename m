Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCDB252900
	for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808012; cv=none; b=IKbDHlBxBrLtmrPnbjtTg9DIjza0vWgIC3tKUlaLdXJAb7cVAUAcf3s41TmzPD9t81dG+rhLjYQcqD36PaFB8L7FSmAyvnWtV77zc9r+tZFlxElR4ypz1945hUG1l6NINJLRgQxcK90V5sw1Br1zT6zVNAA1r/f14t7F5USPmDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808012; c=relaxed/simple;
	bh=vg42KvZVt3grWpFEwkoTaxWeHLF6xTh0VHrTgE6DOaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=icml6YaV85YdBrmsOtltb+FndY5gqyrHeDgs9LoQHXKo0vCqBPi+mbXkw3U+GnidOzPG9lfVSolfwGYtMoAwjNMUrmGDt0KolN18ynMDfJRkA1BFyCOEI0NcTyah7/UT0mHDsCtjETqWdSy14KYys37TF+n9ABKGk47zEVTHwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axR7RU/+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axR7RU/+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b484b15e72bso69111066b.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Oct 2025 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808007; x=1761412807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x00T8hSWTvPjR/PV+ewhXMDM1VtYrlavfAoGAuH1srE=;
        b=axR7RU/+cGPW/Jgs1pfiA0naDKMXwTOHaISJtu96WhpHfbIynBlQ3wKOIqyZFxqypM
         BSJcYXw6/WbifjO6tP9EWBFs5DCqMOd8BmKKzNULTyY43TsOh+jDa0ZrZ3aPzegdlIee
         N2W2Z9Vc/Jf3Hasz8Bbstm/MbFPiMPqP7zzjUfL2sv+hXeAERdgprxPwTIr4toGDvHEf
         SN5C9J2kL++7oXoYEUg2LgR2AB/JzdlHBKw/qyaQMwUKieWCo8oAdmKbzdIt3ocZaOpt
         1lQShfpZYdWF8A1VtsuSW1B5BDccgSBIZUJTzjEX9kCisQQkUXePZlyt1jXAh3T1wmzT
         1PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808007; x=1761412807;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x00T8hSWTvPjR/PV+ewhXMDM1VtYrlavfAoGAuH1srE=;
        b=QQWxW5eZbat7i7eg/nXZypgiuMIbZFlmqY0Oq+FHLip8olosNwpSRAw23/Y3dO6LKQ
         89gwDD3LJ8ooHTvJG5YE/ctU5yhHdrz7+HSWXF4XGACo1R64vvoGIYkjMDCxckYaIGy2
         BiBHxzQfmPi4TduQzcPk/ccCwprtXyd9iNmA2x1Izap6ZE0UmmOeZo8108H3F62Kn3z3
         34brOtmKctcU+ymAUxUVEfD+y8VPPt5S2oTieoMmyyPIvBwA4uzcqrir2U0m19dAn+87
         PpNqoVHEoeXR+o+iIJph6NWAFWAbeIrTOVWqxaEXlJhyMHQktnLIvbItYwp1nEOuraAr
         ULMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLh4/WphDUVgGB8u7LOpRfnEVEsQCecPbfTVV4vj7cr50+g1PLhWGh4o1r2a+5inQKFG92bZkP6jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMYIXC0+loY6zZmYeCXc+VgC7YreaSWF6Af8h27FGjG1gvrzF2
	jvJj9cwuL1zxEs2ncdZHor0D82bve376ne3Y+Pu90AYE67XZ0MsoxF537+L6xLDuuePUMyoynOb
	Na39O
X-Gm-Gg: ASbGnctk8zeQw8NLg8cHq9r8maXi0M/X9WHb0ufe48d1naioSVuttnKxqRHOVuk4HwL
	BzW/HBce/apDpoxrhv80tHxxmRLYxzUAtjccebHrfY6bc5IWAGpJSfApfTSlcFoGcI/iRJZdDGO
	/hZUHSyVs1exZbwmnlhaPWDEe8UeA4quebqn6RAgHEnGexNbZGkRRHRF1C2v/tTao6Gcrgk3UEE
	koOrLi7YPQ+6KxZCU+kRk0gd/BNFnqa2MM+cPbdoev/or7rc448s8yb2CJ1OhF48PCEqhPPOKFX
	0DAzxWUOHhBegxmnwzEvTAYoUZzi/UQYOGG2AxY2KekeyhBOZVsEwpM2t8MKn2Bvn/SM1g7gEu6
	7Z1ZbRYPEJBhVZDBZbSW5hsTyIt+tm60h+zB5UsrdRB0e+G2QvYrtePIoaVD8k3dd10Uv/8QtcU
	cpfOzoK/OA9qjMiCUG
X-Google-Smtp-Source: AGHT+IFSGq3ZEBbgPdz+Al3sMkuXJaRZsJGuzuIpXqA4Kk0u8lvyKGkeLN15Xp4kSmIuqK8SKTLelA==
X-Received: by 2002:a17:907:3e1d:b0:b2d:a873:37d with SMTP id a640c23a62f3a-b646f894876mr524393066b.0.1760808007534;
        Sat, 18 Oct 2025 10:20:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>
In-Reply-To: <20251013-samsung-clk-pll-simplification-v2-1-b9aab610878c@linaro.org>
References: <20251013-samsung-clk-pll-simplification-v2-1-b9aab610878c@linaro.org>
Subject: Re: [PATCH v2] clk: samsung: clk-pll: simplify
 samsung_pll_lock_wait()
Message-Id: <176080800602.47136.11869769472487961810.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 06:27:16 +0100, André Draszik wrote:
> readl_relaxed_poll_timeout_atomic() has been updated in 2023 in
> commit 7349a69cf312 ("iopoll: Do not use timekeeping in
> read_poll_timeout_atomic()") to avoid usage of timekeeping APIs. It
> also never used udelay() when no delay was given.
> 
> With the implementation avoiding timekeeping APIs, and with a caller
> not passing a delay, the timeout argument simply becomes a loop
> counter.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: clk-pll: simplify samsung_pll_lock_wait()
      https://git.kernel.org/krzk/linux/c/d669ec6be0b1965c67248407d87c848b1b7c12ae

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

