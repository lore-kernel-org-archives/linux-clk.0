Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B74879B
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710769737; cv=none; b=afRN/VpwD9OhLVtEoHsdjh2OrzkAYOkB9BznXMBdI6SQKCYWYHWiUGl6UxbtynMfvNOWibD4L0FPE1zCI3w3i9pYsm4HJYyawG+qfT5eWnsNK4gL3IMqivg48cKowKJ41nOZM1Li7woUQM21IDIWF7Viu9Kintf4e43z6qWZS1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710769737; c=relaxed/simple;
	bh=R2UaOpKnY97aWVhZ/hgFlH9poNa+7COfnT3VW02GUGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/VjR5ZxNr1Wt/x5B9ElkACow46kfz9krb2V7c4KHY2kepOCj3AOykZfzMAuhgbjKdRR/KXKQfBaamzsl1BLAm5cO8jsu0josL4Tu8rtGvUxueQuX/qtE1Fi+w5MbKBAsDfowYPJumiGFZRIMhmogxApV7VnOEvxZ9UoEc+rk3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cZQKAkzU; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cZQKAkzU"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60cbcd04de9so40335267b3.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710769734; x=1711374534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V3FYhI19+7mXvMPKmKsCyQbdJxb3cWwyAzFHyh7qwU8=;
        b=cZQKAkzUxWZ3DiR2+CMXuDmMSWC1MZpfCZmvrHvdd3Lz6yu4xL0TUE6I8U2qJoQuqp
         gR1C3iF8TrOC8gOKApo2HaV/oaE8gr2z/qe6U4B5A1hPrD5PoGxta9VsAwR2T8DI5wWv
         l/Y7ve+R7fE9UWq/LljsR6glDc5e6FYQNLu1WRvETPB/eE+Z533dEnsZrdDC79oHAaFj
         ascsj6lIhV5shoOLJXIAEcOjPpHQKFZskuv7QeLR0x1o/xH1BHMwqA4I2SWUD2UB4SBs
         TzAFfOB9FyAHUNV7B1xyK/7WBPHcv4g4SIXNoEIyUaxo0ZC0r+KxoxE9M0PEcK0wyvUa
         TWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710769734; x=1711374534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3FYhI19+7mXvMPKmKsCyQbdJxb3cWwyAzFHyh7qwU8=;
        b=qSL+6umCHQYez2GrlFBLKKCsr6DFG3pa24y734BMafsAIMpcKSVUibKaCdnMN6wvr6
         aX+RWt37R5aCNLfW2qrvcDS2mXBlN8dQV+GpkW/NgOc61am2KJFdCoqhlXtGxK6uwpcm
         uJ/Qi3+A4WksBUQ+mYcb1IuDm0IlKXxhCo0Xw7Od+e9r0a2HiDrIVVRnolTinS1oJByR
         axjwAudX0+NR/l9yI8kZyUtThzb+pwmKzr7x7IF5uQQn/+FabaSZtWZ43RGIiToBKuQg
         nDmFfaObNjwbZGp/l3aYyx4x/XzakJlK/9W0mBEwPu1wwUT9Ca7jvB/inomuo59P6mpy
         haDA==
X-Forwarded-Encrypted: i=1; AJvYcCW2raYYQl4DpnuxJAfY0EPi6U4F41sPf0BrjDsVOIoN0oK5glpb8jey18V6dyKPLWr4EWCGPPQCwC3YglNqRCb1sBU90CxLzH0m
X-Gm-Message-State: AOJu0YykArFKmpLvH/tGfkkYNtenjDtDsqT1RQkP8eL0eLKBigf2ndu7
	+1E8AeYDM5xsnhAJ0CzDckrei7QKU2Z2RACZ8Ld3j+4I1od2gzB6M2Uy7TGg+52gX8gtNu4HdKt
	m2kK5mUJLFlQJ4plEmLu5DxCQo4V5yRk+tGLLgA==
X-Google-Smtp-Source: AGHT+IHIKdJh6Ea44QB/HJYggMw6MDwULWny87xsrwu5PR/MnhdaDTL0l9BRYsgBrUOoIuoSQyIdEFoMdSPlHuMn2yY=
X-Received: by 2002:a25:db08:0:b0:dc7:4460:878a with SMTP id
 g8-20020a25db08000000b00dc74460878amr8986047ybf.3.1710769734613; Mon, 18 Mar
 2024 06:48:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-apss-ipq-pll-cleanup-v1-0-52f795429d5d@gmail.com> <20240318-apss-ipq-pll-cleanup-v1-1-52f795429d5d@gmail.com>
In-Reply-To: <20240318-apss-ipq-pll-cleanup-v1-1-52f795429d5d@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Mar 2024 15:48:43 +0200
Message-ID: <CAA8EJppE8Pt8XX-e9=b5g-4+GGbw8pEgg6Jyj--HDCmC1n5N1w@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: qcom: apss-ipq-pll: reuse Stromer reg offsets
 from 'clk_alpha_pll_regs'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 13:20, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The register offset array defined locally for the
> CLK_ALPHA_PLL_TYPE_STROMER_PLUS is the same as the
> entry defined for CLK_ALPHA_PLL_TYPE_STROMER in the
> 'clk_alpha_pll_regs' array.
>
> To avoid code duplication, remove the local definition
> and use the global one instead.
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Depends on the following patches:
>  - "clk: qcom: apss-ipq-pll: use stromer ops for IPQ5018 to fix boot failure"
>    Link: https://lore.kernel.org/r/20240315-apss-ipq-pll-ipq5018-hang-v2-1-6fe30ada2009@gmail.com
>  - "clk: qcom: clk-alpha-pll: Stromer register cleanup"
>    Link: https://lore.kernel.org/r/20240311-alpha-pll-stromer-cleanup-v1-0-f7c0c5607cca@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
