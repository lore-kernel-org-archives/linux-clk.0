Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684F2E542C
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808157; cv=pass; b=ub3o55m93HlcQL4fdHS9QRFjS9zhnCV7sXPafPpLmq/jaG8Rf4kLSM7vuazntuOOg9bh+Z3gm/zOKj39BU+8Ww65urmh4y5AnBEQ45fihr25yM+JZMUl7ulKljOmddqE1RDw6EOExYSETbSqhCfJ38OEuQ7URj3vozqjrU35bBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808157; c=relaxed/simple;
	bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGlN/R5D/0QtoQCQFJojSPc8HXP6VerDAT2zGY6MMSTkNiPk37K0s/6WvYBk6QCSNQPDpAUVF++7CCVmMZAUnspE1WYK7aFu+LCaaKce9y04sABJfbMFkMtTAPNy+ddx6LJy5DLGrlnL8cQ88tFpikQORcS4ICSACDdvocQJnsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v+AyHx9W; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+AyHx9W"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69f7af97316so591601a12.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 05:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808146; cv=none;
        d=google.com; s=arc-20260327;
        b=sOXbMfc3/lfOaMrvdBa/9RNiqPNjBstOoAncjCKFRAav9uTgWfkwzBWuo3ZMmU2qYe
         zDcEq4nudgiggeFBroqokxdI3ww7SlL/18uVNxy1W5kkA0+qB1mx6qJHPDUM0yHDDldI
         pFJdM3H9o/QbcLQdpY2d7IDdCptClE7loduFMBWPYWdqHllkLRKr93pjcav2cUcZXeh9
         Wqx6FzYUrn5y6Q/McmwqpBllwwK9m19ne7uE15KJB5MDy+WCgTuGOoYqQsXUXAhn0QkE
         9Pdwc6Zji6ToCPZO080ZuzNmvXHXjSY92rJv6NWIGnqC47ftJsPizZpfNeuD/fZqByF0
         tugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        fh=YjjiXH/jKBPDOM8Vq2Mps0zHGg5msmuoOUwXEjNXSg0=;
        b=MUnC5R5H1uehCRdotveLpbKPq4d1ffFTd9r6NRs4Mf/5pFNErPxHBhCFDNzHewJr2f
         MuiR9qBapvzt7AGtAbY5+Q4vMQVLtdIX+vGDUtCVQTC6KI0kxnyR4WFWkTur3PxmVdG+
         lACDnOGeETpufJ09ZN4VzqglLYf9ipO6gWFdUgy8SI9ztbYXBqBzuaxFUmf7PDHj3wCe
         WFXls2o60424ubo0XVIGydMcrC14/j6VnzWWnwMfxV/CwZXyRuDyowJxPfuc3/xyBYrO
         dWdrefihvWP0MZZ3/jQOL+3W8ufL16+wOKVZqkvLDHjQv6QAlYiAkc5DbIaMgoC5tWwz
         B3hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784808146; x=1785412946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=v+AyHx9WSDmiTYs5ZMYZcSIOJhG9HHngHhft25qdCmJnS9LNVI39tdQOJQreSXqB1j
         5VGsuYMRGQTWCpVhiZyw64xcOcxFgkHo5p/RYVVYU3c8hgOjnBigCiWuz2cqSg1KHc4Q
         SmPrVi8Mwnmq9/o07WPSWVLZpfrAItCjFodr9vtCc8CTECGumd1L2wU459np45EEUadk
         2go9EF73CGn/GV3V64TcnAsSn2c4MbnHx8OLTtRp/pcwmZcNpXCBqRk8PL3XN2kSLr+m
         7rDdE+YsioHMWh0JwvS3rwK0DHxdyYSkmmhVRC8jGO/TZ+MeQS0N0+W0s0TsxTLKplmt
         OqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808146; x=1785412946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tyWA1/2ISC+u9lt0b7ZwAN5p18uP4g/R9ttJqeaGfVU=;
        b=gKknEF2z6Z2jaBdoQO0Pl0SsXoCBLbVziIM6zLpdktXJh15EThkxnhTQ4gkjXnARxd
         JJgh7uGk9hwB/GEzps7np2BWjv8UEEbcrhksTTrsYZXNxRwbm7u+Ksg+0Qr1WK4iGsN5
         MNYFco/iQ44hDkv793yJtxA1yTqQ2nsMvMsIXQm4DRgfYdj0OrYjDLOf25CiogBNZc0/
         6Pzky3FgO4xUfTWIvscpO1xfoUZ4o+1AI+rT3O7zOdxFIabYRNWdKazLRyJ86ZB45tDw
         NwuDBANEn3TkT+jNcGFwU5rzeuXvoxidDQ8tdxdALHrS8hIZmXEz2+N22jpe7ttSuJiz
         YQ/g==
X-Forwarded-Encrypted: i=1; AHgh+RoTv8yzG97P3X0XL0SGa1130WszlwIY3QoR1tmewTqos3kGZObIHCuEp5UyFjxDi1bq0aKitTWTihA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5q5Mh7fhh7Zee2zJv60q9Brhaea4CB9xHaETWfAIU/unLwPb
	uoeugtMtQRtxpGiKZ/c8SI1noL4htJ0o06HHLyHhMpCSbs/wf0k1JKDUgczIUBXDnTNsbx7ZE6E
	az8dotOb1+aVJY2n6PD9dAiE6tvrt0/PirApMp1YpuA==
X-Gm-Gg: AR+sD12OZz4XIFafn49yqqkefkk2Kk8izSgb6CFEJ4OysswM0XiJ5w3EdimnL4JUiZD
	bdaP/WpVf3XKRRsA0CNCALKkzjsP+CsmNtydeKDRY1sNEgQleMJs0t0b/h1rBWylNUO6Da2MmUJ
	uS8D30q7GZf42E/PTYB/ProjZb0rbWQvt4vu2Ctal4lZ2ZGFwdHkSDZ01LLf9TgkYcPXoFQo7Gi
	kAHLd8zvD7oqscykWutpCJfzaTTpxlDy/RjP+t9EZ61a057O51YPYSxbwMXex/fEiO+YyC3qiGf
	gsD7Y2sq8J8G36qxAj72
X-Received: by 2002:a05:6402:3241:b0:698:a9de:16e4 with SMTP id
 4fb4d7f45d1cf-69f6bf1f611mr861984a12.20.1784808146288; Thu, 23 Jul 2026
 05:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro> <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
In-Reply-To: <20260722-exynos9610-clocks-v3-2-c672a2a30889@chimac.ro>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 23 Jul 2026 13:02:13 +0100
X-Gm-Features: AUfX_mx4AjbYjM6fZT-ntJeRozz1HqK4uJ3kqrvaInoQuZ9gHqexg1gg38S2Mz0
Message-ID: <CADrjBPqSc8kuC7AUg34CKrVSbRWjO7i90Bff0b0P7nOc+m=PCQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
To: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 21:44, Alexandru Chimac <alex@chimac.ro> wrote:
>
> Add bindings for SYSREG nodes (required for ACG), compatible with the
> standard syscon driver.
>
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
