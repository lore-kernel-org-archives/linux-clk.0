Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109F21B81F
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894846; cv=none; b=EHvPphGDwGY095K7WbEJqQ+wMPkKX71Jsi0wOJ2GTTCczllskwilc2o3tLBxSA4pAgBuoCCYnwuINegS8ns1kZy1dbFHDahJrcq6jWBrMDmd2DeBS5K96UQ0ebvJ8vDjFqBa0QDn7v5m0h/NvnnTeDaitqRyy2I+SNyEY2DQ4nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894846; c=relaxed/simple;
	bh=unlIYXL3BwizleLlMEBQGYNfHGKdQOyg0kKHZe9dPEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9cEC0oGe2s8ueeCGiBFEuOOQOt/j7pGF+ajYhEYdRlTFh0HrX0Y7ospodC6amlo0YunmeHiRBWJOJOPKK/i0QEwUS1qjK/5wt/Hy33M7TyHcTpiFNN+M0XT7jXT5PetK9s/+ZI2CQ0R0gKiP5E6TbnTXxnrQF0gdlpkp0rmvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tksXgWRG; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tksXgWRG"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6084e809788so13747437b3.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 13:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894844; x=1709499644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KqbMk46NxtU+fpvdDcQrXCuDM/dEl6vfrxJr2Yihlwg=;
        b=tksXgWRGOsSgTIqcFZmmzJOxF6Cxkq8yU2hps6BDvX9wo48Kpt/PBHN0BdletCN8jG
         sloPCuUyKtPprdw4qZ6i7fUSRFg4p46dRxULw0UaQgDGEIBU+0YKG05Fqzhz5b9hh3Hm
         RZcrFL9iwC8OxCyQm/AXlywB8d+c0Vs9U4cWXaMCDbnz7OmiG9NlPkCWb5Z3R8igCfAs
         Zcy7Wbvm9l5KdlV9Uh7ABVFREOtyddOZlYHgITrssUaFMqsG3NtzaCYtoxHRgqvIcM+a
         WEY754Vi8kwv0gdT891lOQUn63yN7smvXA0hzUO1XBYQ868pBg4PSuI1jvmeUpG59dpa
         XFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894844; x=1709499644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqbMk46NxtU+fpvdDcQrXCuDM/dEl6vfrxJr2Yihlwg=;
        b=cStoVcVY/Isu1G0Q4k6WutzhjRRITvZmcxECDXRrduDUbuX36j/g9ytPeirG+YVelO
         7uWTh9J7cJaMcD01OSxo092gGWWGB7F0+KqakEh0D2sflM+FaPd9i6+gCCHryzqnpPvK
         bI81e2bj/qPNnOQWBoRHm/RSsW7/S+4qu4xmNxCOsKaJCsDWWywMvpOTTG58S3FhgWAk
         uWJIU4pa7rO5RigRKRZuULS7kC4NoxdjZYGrzGGDXPu02EmlAYspqC/lRjJLjswcHOAU
         JAje5B8Tn7wICuwacIVL5I+4w0C9Cc1BFEZYSDo3KqevM+F/Q2a8g8rkW+ymrEES+kO8
         CVMg==
X-Forwarded-Encrypted: i=1; AJvYcCVQxGzJFl2nXglrR7AHtfu/++h4GlNY6UQ3ni6yEfJw2+5XZa9kexTfT1+qLgObAaS/KfubxH0NGtvrW6PhtmyeVwmnRr72CwEu
X-Gm-Message-State: AOJu0YwRTjGk7dUIxcLuOGujO2zbXOxqGPN3C/knLAf+PBtsQEsi1DeF
	tIcKUeM5GIURDiq88HIRZp2wjFh+xWfrRMXRJU85wFxB6QLtjgIYaOD2E9SmJ1vOq1SEDai7nUG
	VSMMPS0RhKN4GX+WwROkvn9SiZgTwwUmg56cb3w==
X-Google-Smtp-Source: AGHT+IEqqz8HfqIigknKKk7AO/yotuhTPLw8B2KFACuiv8hx5tb8SwwFs8WBzSRjLRJOs2BSRjve+1IeMNGqw34uTP4=
X-Received: by 2002:a25:7e07:0:b0:dcd:a331:40ee with SMTP id
 z7-20020a257e07000000b00dcda33140eemr2928290ybc.14.1708894844066; Sun, 25 Feb
 2024 13:00:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225-gcc-ipq5018-register-fixes-v1-0-3c191404d9f0@gmail.com> <20240225-gcc-ipq5018-register-fixes-v1-3-3c191404d9f0@gmail.com>
In-Reply-To: <20240225-gcc-ipq5018-register-fixes-v1-3-3c191404d9f0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 23:00:33 +0200
Message-ID: <CAA8EJpr19P6P7COjP8YpFgK4x41Q8M8A3+n_avtzfpKBAuxBpA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: gcc-ipq5018: fix register offset for
 GCC_UBI0_AXI_ARES reset
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 19:34, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The current register offset used for the GCC_UBI0_AXI_ARES reset
> seems wrong. Or at least, the downstream driver uses [1] the same
> offset which is used for other the GCC_UBI0_*_ARES resets.
>
> Change the code to use the same offset used in the downstream
> driver and also specify the reset bit explicitly to use the
> same format as the followup entries.
>
> 1. https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.4.r4/drivers/clk/qcom/gcc-ipq5018.c?ref_type=heads#L3773
>
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
