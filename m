Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE095674C
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016965; cv=none; b=rV9wUQrI8aeYwCyFF+pjsLmSHFdrZQzwguFetZzWxW8zqNYSlAfaqw5Ww6yanmhaZDV1fijsGQ+jD3uNcJjgPPCCNVHi/Mjth6m6x+OrdhbQQKJa614sFlEtaMrO4taGxC9VNyCrTZtH7qzBYudf9dNCT1SuTxbZqnMwlXgkMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016965; c=relaxed/simple;
	bh=lr/ld6LZKki83QfUyI11Gr3pibctAzUl0+BQ0vKyXpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BA0agF6PhWDyouf01XsHmFbiy6s5rzs0Oz4HTfyPNyy6ko8N9GUFGDHwEpEeOR/Vc/zkAwAbI3SXPxpw17TEYTqMTGOTT8p7o2Og2uVsSrPXossn4dKKxxyttGnfK9FNEaQpvrxEJKYDjkyMmisu5Ge1inr93sYUBrUxRWImfYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYFXpi9V; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYFXpi9V"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-609fb0450d8so8282067b3.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016962; x=1711621762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/sfGiMQOWE4qVjOwgz/wWhsIkX2dxibhY6pkQCwewf0=;
        b=JYFXpi9VN51y6ahg89/j8fUJONXl7O5g1SmSnlCMeUTWqg0M9G9WzflKjitpxEawpk
         85DphiFxO4qw2W5J4icoTfIbZYlAnvDLphOew7muUpaRrvi/NtP9gCkp6L1l2ACTtXst
         K14PMpkoZTozxxm8GIp1HLY12hIteHHh9MH/cvT+I9Hu6Nv92aiTJpwn+WVUhjDSJn/z
         skdz7xBa4J8HavstvE5XqxIv16fMrEpJKEuSc/iu71ozmuyEDggIP/svJYiHul38ptMx
         P1P7XiYf2LaoFjSjq9F8bxVtk5xit9jgJj59e7pVFB3HO7uLbpKQ9vTAs+7puKpFAi8v
         3mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016962; x=1711621762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sfGiMQOWE4qVjOwgz/wWhsIkX2dxibhY6pkQCwewf0=;
        b=rx1YH/ctfDhO5DhdoTz+xdPAx3OOYcLgujfuZMdrWzAi28oAoT7hrachnTGAzym8/Q
         /cR2VbFfb6f7iw5eEoD89vREFcqsXih/2i51yZTmZSjhu7AjqNLBGjyHpO+1gmb8bQI8
         kDrlBfespT8HpW/Feow0slYbOh2gcDKOgKzp0XyDhj8YctrmcU7O2hHFuByQXT7Kxa5X
         WMQjKRTX5rCqeUdeRMGdOg5BX30JFEGQojpQJVhgmhDuzQzIE2tEYIHMdwf2dR9lYUXT
         lEdZPvXD2v+V2JgEPWrpqVPmt2MF0OfWpy4qshIstuNq2ZLfUq5GzFx/aBarF0bsricP
         WNhA==
X-Forwarded-Encrypted: i=1; AJvYcCX3k2e5VBKdNP+78CD5XDi6uCWRgOIll+I0HijXzYwUmc+dL1UA5xbrpQcZSXI+RdzgSXjFxAzBH6tjRr2QyrqH2rHlbfVeQob3
X-Gm-Message-State: AOJu0YwcdxKjIySkslfMqaQEu19yjnWg+D0mPDArhGgS6PZbxc45U34f
	EYAlZ0sxzqOp77+xl7Qb6ujm5SPZmzrUQgFP5HVeg7NLRRSwAwwlpMooSctCnHSFsjIgR4Cfq5O
	c8EYIR9F34ciEizTX+ipOFOtFyi/cYyg6cUQbulPVvz6cVDtZZtE=
X-Google-Smtp-Source: AGHT+IExbdetzQ9xDBaxa779Os0rcJeKqehsNC5UOgPnByKQYAfthML80JKoXGc0ZMbS3XGvTEwkkqHMcTzwiPZ6/J8=
X-Received: by 2002:a25:b502:0:b0:dc7:4564:fe6b with SMTP id
 p2-20020a25b502000000b00dc74564fe6bmr4133015ybj.60.1711016962076; Thu, 21 Mar
 2024 03:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com> <20240321-apss-ipq-pll-cleanup-v2-5-201f3cf79fd4@gmail.com>
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-5-201f3cf79fd4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:29:11 +0200
Message-ID: <CAA8EJpqRs81-8wdufLcNFWKpAkF2=d+6TrOApJNOV2XMcYAT1g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] clk: qcom: apss-ipq-pll: constify clk_init_data structures
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The clk_init_data structures are never modified, so add const
> qualifier to the ones where it is missing.
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>  - no changes
>  - Link to v1: https://lore.kernel.org/r/20240318-apss-ipq-pll-cleanup-v1-5-52f795429d5d@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
