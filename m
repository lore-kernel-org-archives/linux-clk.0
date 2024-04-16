Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F6136987
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713293539; cv=none; b=fEaqI6m1jfElfxuVgGmre/mo3l1WL7KfxZY2/jKxoWiG3OrHdGHz4w/c89fyMx1a6FbdZ3Ji+E3iCf6iqqXpJQz9M5oeJeIAOkrXMLZlun9QGvUWy5Dyzvq8XitY1hSUXFs1r0TUo7yH5640rLXgO/IsyItWpXgvZSOM1piljuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713293539; c=relaxed/simple;
	bh=y0uVH3oZE1a3APxihRtxusmQeZlfaUfpI73EDsl34Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXrrN0xQVj5dnpaljg126yIjCTqKyl0Y85xQ00n5hIAO4ggrUAEuqpRuqfnZ5K6IX9nQkOo/YrLaV+UUcr0DBjc2EnhgFpEmv3CB4p0ejcVX4gq4dabYT/q/439HZ7QxgtFCB4dgO34TacWn6W+6A5aK+b2F8bwLy7CafEeMSew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hE6e2M02; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hE6e2M02"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so4799130276.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713293537; x=1713898337; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W5vQzyryFWgKw/gamp30zKVmQkGglywjftI1PpywStM=;
        b=hE6e2M028SGdn1J6NmvTGc0lCnYRBo1IY3+/VzIBb3MWrQuKMXFHc5jKbZK2qWzNNt
         7PdZ79yy7q11oLk6TiikHUAUGrFMokjcDDrzwcxbZ/GegpglgHJJK7qBAJn7X45jWl1n
         S/14eYV+R3WcmcbxVIqX5vV6R/86JQykzksgHOj955lugAHoMt7897vfTVH9E6IOeuPn
         XxbdKEQP3P+ls8G60k8KdRY51dpvxr8zD4E1ydjl++DTY0/FJLB7YaFQVxSO1FZv7C9J
         +WigZwi3uCdz7KOm9N/b2svuqCmDMJE+RcEPVj/pTLwJLZjU6SVuRg/mrXwk7fsSb39K
         Lq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293537; x=1713898337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5vQzyryFWgKw/gamp30zKVmQkGglywjftI1PpywStM=;
        b=iSaGwon4zmGuLRdAKdP7rZllnv4S4MF3T5NP6zTbxfWpNaXUufGljD/HyyOVjDM+LL
         OwD0Nt0LRnBPjyZ/nOmFG0SUmejPj9F8jnNLwL2NihAXa0Vz9+TRQ254i6oU8vJcXXrK
         8p1GGCADiF25Q+pJBfe/KH4rZRUYBsfvhLcbGM1AM/CU5qaeSEd30eQOL6m2IeKl5+yg
         z7w81DECbtg3Fei3xJkI5wTCC22W0LJNw/YlOzCkPXmTDqjE+HeSdgQRK9jP8eX6itu6
         naMA0JQsqIa/wJSCMoWNOoNoDkUhbx9dyC2ghTbzQliBxOAT5wupYRP+4fF8QfevFSLb
         v2iA==
X-Forwarded-Encrypted: i=1; AJvYcCVggrlIaX+PDAx2EUrac9D63MdMR3Or1C9mtgO02O+FYSRtrup4FgIBb3IjTV7Z2EGGM9hUBGyxdyluf3FxFV6Zj8g3SDcx9HVX
X-Gm-Message-State: AOJu0Yz+xZ2sRGzwStKLRzxCm5PcXtNm95PmbCLuyBWgYFDH8I+ByvCG
	IEAc4Ka+09Z99q2vAjd2EtdQGROXouHAOwemmRFay4Qq39ZJdnqJ5O6sPgUm9fm5l4ACEzvipAh
	OIldiRbRiV10J4iN42wM1lsbtH+X02uudqdV7yg==
X-Google-Smtp-Source: AGHT+IEJjJJdzKD55UTLRTScRGrfAh2UPKsgtVqF6P2ql9N19AKf5+ktuo3JFOBl4aK0CuRCXG6qMrNHQ+pcEav3Cwg=
X-Received: by 2002:a25:1e56:0:b0:de1:1b21:4f8 with SMTP id
 e83-20020a251e56000000b00de11b2104f8mr10605271ybe.62.1713293536905; Tue, 16
 Apr 2024 11:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416182005.75422-1-quic_ajipan@quicinc.com> <20240416182005.75422-2-quic_ajipan@quicinc.com>
In-Reply-To: <20240416182005.75422-2-quic_ajipan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 21:52:05 +0300
Message-ID: <CAA8EJpox_C7hdHYxM4-w6YKHN2BMQqJ6xaGZqvzFdOYyrYtZFA@mail.gmail.com>
Subject: Re: [PATCH V2 1/8] clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override
 for LUCID EVO PLL
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 21:21, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> In LUCID EVO PLL CAL_L_VAL and L_VAL bitfields are part of single
> PLL_L_VAL register. Update for L_VAL bitfield values in PLL_L_VAL
> register using regmap_write() API in __alpha_pll_trion_set_rate
> callback will override LUCID EVO PLL initial configuration related
> to PLL_CAL_L_VAL bit fields in PLL_L_VAL register.
>
> Observed random PLL lock failures during PLL enable due to such
> override in PLL calibration value. Use regmap_update_bits() with
> L_VAL bitfield mask instead of regmap_write() API to update only
> PLL_L_VAL bitfields in __alpha_pll_trion_set_rate callback.
>
> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces")
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> Cc: stable@vger.kernel.org

S-o-B tag should be the last one. With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 8a412ef47e16..81cabd28eabe 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1656,7 +1656,7 @@ static int __alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
>         if (ret < 0)
>                 return ret;
>
> -       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> +       regmap_update_bits(pll->clkr.regmap, PLL_L_VAL(pll), LUCID_EVO_PLL_L_VAL_MASK,  l);
>         regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
>
>         /* Latch the PLL input */
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
