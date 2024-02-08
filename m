Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4058692EE
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707375766; cv=none; b=bFOGj7/horblsJpEjcVTQ1d+1z02TgGXJ12R8DhcbBFOvMxiOyrqOgG9BdW/fG92muqzhGEfG7GTCzvyO67Lv+bdEWaVlRSemW5sKak/JN6aw926HKDxw03x35LDzTNxANTvCATNmneWrWD1nUrrrhBK3LswaWZL7bU/eLabpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707375766; c=relaxed/simple;
	bh=UOvPRAo6yU7uhAscNZqlVTzyS9Fqzjv1X3eKtZV4qL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3gu+PPyV4THrbsKOiWSoG8oDAOeDtFUbHqSYUIF5J8FHyumFXbuQMgSt4OORtx86gE8vd5qhYB7guX0FxWC/3LGLdnCImPGy6/rQ5+Ek3jJpIEdVzG/wiMzlHgQIv44hplDdZLj3XiLAHUtKN1abKzwb1n8Elgv/lbAT7cj19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gon8il+R; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gon8il+R"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-604a1581cffso7679737b3.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Feb 2024 23:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707375764; x=1707980564; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NtjhvkCTsupNHiRcbmushS8AR8fWxZ5XeczzVylDpVY=;
        b=gon8il+R7xJwIQHf9rsg3tsHSI3iUMIZUazxx1D8F+YRFNshBcw+fkHswHjN6gFGQx
         BIelEfeeOF/UIYeQXfVf10vOkJndm8342fmPH4F3e8WlhuBng6EWZ7huh1J9nd26OHS4
         rZOIuqqLy0ajhETckoKU5nAS3V6+k430Mi5TiAblEtmTpfBYEDZm+8w23WyBm1zTdPnI
         r1RebwDbWb0nnZMkr0L3lZKdYXqf3y82Zd/L6y0f/WPx6T0ZNpj9XF9zTkIq9ceV9O4v
         LzuH6tooHVAauJWQGKqA1eNOkExk44fHgSV8zRHsmzlztPpQe2bEblnm33vwEjXeGFQb
         9QAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707375764; x=1707980564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtjhvkCTsupNHiRcbmushS8AR8fWxZ5XeczzVylDpVY=;
        b=U2tzfbO9wd5Vb1NDjdXBPPi5VV3VYhi/I78QVnZHPxLlsfDvppoImE5cKpF7clzRSc
         flM2REdT75HGL569ch6u10N3MMusHXx+fq77RudU0WH1Th/1tmDrWiYo60HhhVUiyWZo
         XAOGYtoU5rvaliEofX76nECl/Lk/uXn/fnaX+gIadUua+01tfEyJbHTQ8HGq04SawFc6
         RctHOxLW2d10Nr70UGUNbEsoFm8sFx8Th+X1/7Faov79kwWNJamNE+MVkvHKLy/elAOP
         xrn9oo3AnnCWSoo5RIQxXBVE6w1ktAFUOfp2C664ytcFC2MEuh3sdBj1V90+FXvFJpVT
         CJug==
X-Gm-Message-State: AOJu0YyGFVvFn72fWWylcRaGvscNRogDayhqvhlkKiYbWFFPS03p/6Hw
	rH4taziq1YFMLmor+O9EA5x/0QZ3cy01+/NN1jHZJshVZPadCybSm+qvKJ7HfcbHqqsVutH5gs4
	TRjRzbAzyjDW3Mklb5qh8OujSlXQEhUdFrHvtRg==
X-Google-Smtp-Source: AGHT+IFZbg21CI2RlYLxUCFIJxo6jm0QjIMANZmNiamDHHuFVtORyDoDAFU93Jr3tbJ76PzdLJiXUIqxIPwYaNiwO6c=
X-Received: by 2002:a81:d202:0:b0:604:20ab:fc32 with SMTP id
 x2-20020a81d202000000b0060420abfc32mr7896414ywi.17.1707375763454; Wed, 07 Feb
 2024 23:02:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208062836.19767-1-quic_tdas@quicinc.com> <20240208062836.19767-3-quic_tdas@quicinc.com>
In-Reply-To: <20240208062836.19767-3-quic_tdas@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 09:02:32 +0200
Message-ID: <CAA8EJpq2MpZitzspd9RksTY7WWKAaLwvb30x8ArBfed5Ee8buA@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: qcom: lpassaudiocc-sc7280: Add support to skip
 PLL configuration
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> The PLL configuration needs to be skipped when remoteproc brings the
> LPASS out of reset.

Why?

>
> Also update the lpassaudio_cc_reset regmap name and max register to handle
> the regmap conflict warning between lpassaudio_cc_reset and lpassaudio_cc.

Separate patch, please.

>
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/lpassaudiocc-sc7280.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index c43d0b1af7f7..2619a8ced9d5 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>
>  #include <linux/clk-provider.h>
> @@ -766,11 +767,13 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>                 goto exit;
>         }
>
> -       clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
> +       if (!of_property_read_bool(pdev->dev.of_node, "qcom,adsp-skip-pll")) {
> +               clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
>
> -       /* PLL settings */
> -       regmap_write(regmap, 0x4, 0x3b);
> -       regmap_write(regmap, 0x8, 0xff05);
> +               /* PLL settings */
> +               regmap_write(regmap, 0x4, 0x3b);
> +               regmap_write(regmap, 0x8, 0xff05);
> +       }
>
>         ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
>         if (ret) {
> @@ -778,6 +781,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>                 goto exit;
>         }
>
> +       lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
> +       lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
> +
>         ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC Resets\n");
> --
> 2.17.1
>
>


-- 
With best wishes
Dmitry
