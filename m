Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5B2E339F
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201782; cv=none; b=eQD03JR2IN5VlcwDMZ7jZtW63p/4y3nrE4MWqmZBAWllrfWHguCj2llzHuTdFs8EpwCgzJ+B0mkfBnT9TBsrPm7I3MC/UE85utsfp7RjBb1JtKZGo/K8rpG7vNoa2zAKtabdkoMoHuEcu1Eh/BvUPU3pkeF2xyCLmmWZcRI3hTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201782; c=relaxed/simple;
	bh=YXN8hyLuHQAhrc9NEQKCCoyB39SPARw+nLAxEXiu7nI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TGQWghpzGkolpVZS5lI9NSfcDeFOZk+WRoIC1q65QaxKmEFlIB4nsdjXiw8bNIVHqt5tc0MCMhRsJHLo8eRB/JSCdlJuBAGCGvoChghC5K6PCPzx30Lu52yq4Cjudb91I9kP8qubFfKAGMVZ9gdkzOiksV4balbhM7SGczhhRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HK//WSce; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HK//WSce"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43935d1321aso8765675e9.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 11:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201779; x=1741806579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgIFZoxkbW0KwVO6zN97CfpiFd7piOBwwsm3LQac8GU=;
        b=HK//WSce+NmDOQYZFWgdWys+wby4qnHuMCS5n2Rjuhcya/4pyAFjzGvs5I7CHqcRgE
         CdjC8VZtrBOxUae7KZZencwDRWQP19KjHX/vZq3huCisginCQiNtENcOekHH07hNIqzJ
         LJ4zTJP7zNZq1zYgjGiL3GoqrMvxLH21LKzY49aX+GhTEesCBsuJZ8UrGDIskynoyNBh
         xJi9ViscitYAEmuX8oGV4TovYxzhZnDInwFQdkKQwDhOOVj9LkbaE8zuqY0sHHZLQSN/
         bNy5xVFVNi7KxJamVYw4htiZV8lyWq80236h7UAguTCICsfrDL3yrAlC5pUFMhz7yR0r
         2MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201779; x=1741806579;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgIFZoxkbW0KwVO6zN97CfpiFd7piOBwwsm3LQac8GU=;
        b=hhIYTEOndnu+WP62VLd3LNKE23hIbDL+vfXBOlFmoFpDToCsJthPQJa/fGdNohvmg1
         ugprYppx3aXlanKTmv4mhLTk8rXWNJI5Sk0Wbv3OjZkke2xA+UT7fmAwPXC+ACPUBaVf
         xpVL3jQOI4Z/lPF5C20WA2LddikLy6XA59+LC+hvJxgICvlMewATvKmrnKZa3vsd7y3I
         2sGql8b6De+uXBA6b8mid6ymtCmxhH2vmJ/BSuSs/uxKCOxsUDguGnvbHWvj4XQwK3Bq
         yrs8/tOcxs09qKaohiqv9ZVwiYP6+5ZzckfuDHL5iZ/z3QjFhDq/oQTBFVyKMICQqgAH
         7RMg==
X-Forwarded-Encrypted: i=1; AJvYcCWlaS0PmmfCH3bzYp8XcpT2CVv0cQlgzVdr6ht1oqmjd/UtN9AWX0koD4LnhrdPQoLoTgpijBbnehE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjapFfSjaQCZlCaNFj9Ouw6A+vX0cYen3Wqt25Lwif4tKOxtTZ
	7bg0qzCWBmFD2aZPvSw2zDVZVvdnLBe1NlzHpPofrC3xae1jh4Rc79S8E7HB98M=
X-Gm-Gg: ASbGncvZaxOf2EiKb462Np+lE4BuLhIwby8ZLE7MCI4DvK1CPXbDHyQLFV1aZMZfjgP
	5N5ctKa7SC+pdY1X/N0zwUVZ09bMg1dH/+ZKaVh6q7o1f71wtHvsHhrK3fY2yPKXg96J0b+VW+n
	XPxkQe5Nzp5Io6UZBXR6ea2ghBcAtf+vYJ/XyUlT8iAJiX8yUc8GXXPt3EWgS51EI5kpUcwyV8N
	RaknTVhM/Ggw+U6uAY9DNDMP6tCRB9QzPWFo/Jo2NGav7RDIPcIe+PEo7MknoMzqLlsa2iojL1N
	OORf1NxtPuHuhAlAvElC3D48Mn/CDC4qKWdNink1ICxJZ5lD6yX4OY4YaGYm
X-Google-Smtp-Source: AGHT+IFrSoo3gOE5FHktH87GAqLOOH8zzQprfwlqJYQydb/cjo2MTzmjtJwGHriaXSDaH9mOaM27Tg==
X-Received: by 2002:a05:600c:4750:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-43bd29d8578mr15177295e9.7.1741201779287;
        Wed, 05 Mar 2025 11:09:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352eb1sm25628705e9.31.2025.03.05.11.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:09:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
References: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: fix synchronous external abort in
 samsung_clk_save()
Message-Id: <174120177454.75135.6216013717633178470.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:09:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 03 Mar 2025 13:11:21 +0000, Peter Griffin wrote:
> EARLY_WAKEUP_SW_TRIG_*_SET and EARLY_WAKEUP_SW_TRIG_*_CLEAR
> registers are only writeable. Attempting to read these registers
> during samsung_clk_save() causes a synchronous external abort.
> 
> Remove these 8 registers from cmu_top_clk_regs[] array so that
> system suspend gets further.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: fix synchronous external abort in samsung_clk_save()
      https://git.kernel.org/krzk/linux/c/f2052a4a62465c0037aef7ea7426bffdb3531e41

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

