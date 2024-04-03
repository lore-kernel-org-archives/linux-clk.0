Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1812413A25C
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141564; cv=none; b=jts2zRCB4CEW9x/UDtwwuDXdoDRlATUAtSAtgriPqDiA8nedWITfgHNKU9iZcvx+q+9xDBdunTH4o6aExfYjeNIaO5gLyLR5L9nj5WR1jIhNj89VilTZQOLLf73n9qnMzX9SMFad5Zn+nM6PxB8ofVzOuu8tuCxgc/Kuo2Vd07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141564; c=relaxed/simple;
	bh=9Z5bHmFFVRTiCPLQRYLIroFmSupP0sNH5s9g/ohYz2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcUUubwfN2Qjc+PYF9sugr1v/vIGcJvFTLE6yy0GxFSVJvdmU5Zeku0w/mYsMeCGP5Lg6iDyok3uEnCdLK/wkFCYgxP7n8lZdsrLbwbTicSTsPRUNqeKx7LAIIuYQPFUO9MY8q7borxPO8Zo7hVgDOpRuBEJwUWpv2T8VFvOYiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V12PyVF6; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V12PyVF6"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso6269729276.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712141562; x=1712746362; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gS0Z5+rdal2y5BY6tsyqb8H9cNT55lBmngpYPZ201Xs=;
        b=V12PyVF6wEKLoAC4Faa7kGa3ipXbETHkSLVg402T4E40GdBZ66fJfBHfG/6e5MlyRR
         AXAaVA21ozJueeIPjJeLe1tCZbzzjJx1xmtS9UTTIOQRNoCzi/Q7e5ld1di4cLd7jdbJ
         vB77DHbAJnp7B9Kuu0C8Y8ugB+cgCNLOHJkLQZD82jdrxsBMmfyjCDNEVKlZ9VPHCroL
         dFjOMIXHcHLW1k9HbDVoqElE6E5vMvw22yoRm3uGw3Gea8YZS1Ht+jdEt+u9ugBi6zGc
         7dvt1rvy3OpFN3bAxkdLkGn98gIY+t9759gte9GEXmGw/pq0RU9DmLFW0moV+ZKOnwb0
         SSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712141562; x=1712746362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gS0Z5+rdal2y5BY6tsyqb8H9cNT55lBmngpYPZ201Xs=;
        b=igQeC1Qz7bE0wBdQaXYgeYe0cBLmkz+0kcaROnUZswh+ck9HVzTubr3ZnUkieOT4fi
         RvyUlCtUDbdu4SjyM741IbTFOaOlFOjNX5x4C4u64kBFf3S5EuQfntWmm7ZNFXYhznfI
         YhOEf12ZffYMVpOithsO2F7PseasQei2qr/0eaG0vFqo2chpa21gTFrRHVugZEI+eR/q
         YRZ4S2poKNyMIhryP7AdgApZhTw+itkiTNsFN0HzBFJ+ihwIGaJphpF0WL2GNpR7r5MA
         7bexZqR/Hz7h1YPrmfv8VLm9BbYmDYARvbZmEKWpVtUdEdmuGetzmtpKDqgt0Fi0wLF9
         vwiw==
X-Forwarded-Encrypted: i=1; AJvYcCVhQuC1dmJ7PkOqNFvE3WH1h1moWsjyq7ybgV++g0JtvkTFw2Rn4pbdqjr+vnluBn9fQJhCObMPBHq44ms6411760xehtSXD2Se
X-Gm-Message-State: AOJu0YyC5MG6tGdtAUyKyu8AUVfk61axICKfVFXT9kLGq6P9BjlDsqe8
	ALts9vMFpVex1of96iWYR7op3hsLObtVRHCegp67fQtHhuMRpaI595svnEC0dO7thXKRDbUsLnS
	W4jocfSyA0qhFRQxd5E6a0FcTK6oUCcxZgtB/6g==
X-Google-Smtp-Source: AGHT+IEEx+Hm1VlBuPgg41RYUCAiHYUa6D2rWvGbAtMUtMb9ELHVG9UdlidCEQhp0jbJ3eoGyrjS1dVWy7ygd0zKrRc=
X-Received: by 2002:a25:5887:0:b0:dc7:47b7:9053 with SMTP id
 m129-20020a255887000000b00dc747b79053mr12868622ybb.15.1712141562074; Wed, 03
 Apr 2024 03:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com>
 <20240330182817.3272224-8-quic_ajipan@quicinc.com> <CAA8EJprtCbePun+gpwxg5e6o5NaBnunEJrmDrCV+O8BdHEeuYQ@mail.gmail.com>
 <9106b0eb-e15d-f2fa-d681-4017412c4a76@quicinc.com> <CAA8EJprP4Skq0GxyuzoF7Eu9pF+2Vm2wwbu9m6jBohdSKjLR9g@mail.gmail.com>
 <2e70f208-5a8e-3feb-d484-23b78c70d08f@quicinc.com>
In-Reply-To: <2e70f208-5a8e-3feb-d484-23b78c70d08f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:52:31 +0300
Message-ID: <CAA8EJprPeGMvN49HDEjc+cLSA+cwd=yDKOt2neFnuAmoO44gsw@mail.gmail.com>
Subject: Re: [PATCH 7/7] clk: qcom: Add GPUCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 13:49, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
>
>
> On 4/3/2024 12:53 AM, Dmitry Baryshkov wrote:
> > On Tue, 2 Apr 2024 at 21:26, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/31/2024 7:09 AM, Dmitry Baryshkov wrote:
> >>> On Sat, 30 Mar 2024 at 20:30, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
> >>>>
> >>>> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
> >>>>
> >>>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> >>>> ---
> >>>>    drivers/clk/qcom/Kconfig        |   9 +
> >>>>    drivers/clk/qcom/Makefile       |   1 +
> >>>>    drivers/clk/qcom/gpucc-sm4450.c | 806 ++++++++++++++++++++++++++++++++
> >>>>    3 files changed, 816 insertions(+)
> >>>>    create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
> >>>>
> >>>
> >>> [skipped]
> >>>
> >>>> +static int gpu_cc_sm4450_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +       struct regmap *regmap;
> >>>> +
> >>>> +       regmap = qcom_cc_map(pdev, &gpu_cc_sm4450_desc);
> >>>> +       if (IS_ERR(regmap))
> >>>> +               return PTR_ERR(regmap);
> >>>> +
> >>>> +       clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> >>>> +       clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> >>>> +
> >>>> +       /* Keep some clocks always enabled */
> >>>> +       qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
> >>>> +       qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
> >>>> +       qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
> >>>
> >>> Why? At least other drivers model these three clocks properly.
> >>>
> >> These clocks are POR on in SM4450 and required to be kept always enabled
> >> for GPU functionality hence keep them enabled from probe only.
> >
> > Please, check how this is handled on the other platforms, please.
> > Hint: `git grep GPU_CC_DEMET_CLK`
> >
> yeah these clocks are modeled and handled via always enabled clk ops
> (clk_branch2_aon_ops) in few other platforms like SM8450, SM8650 which
> also do same functionality and keep them in always enabled POR state,
> while we kept them enabled from GPUCC probe in SM8550.
> Since we need such clock to be always enabled irrespective of consumer
> votes I guess modeling with aon_ops isn't really required and we can
> simply keep them enabled in probe similar to other always on clocks.

Why are they required to be kept on even if there is no consumer?

> >>
> >>>> +
> >>>> +       return qcom_cc_really_probe(pdev, &gpu_cc_sm4450_desc, regmap);
> >>>> +}
> >>>> +
> >>>> +static struct platform_driver gpu_cc_sm4450_driver = {
> >>>> +       .probe = gpu_cc_sm4450_probe,
> >>>> +       .driver = {
> >>>> +               .name = "gpucc-sm4450",
> >>>> +               .of_match_table = gpu_cc_sm4450_match_table,
> >>>> +       },
> >>>> +};
> >>>> +
> >>>> +module_platform_driver(gpu_cc_sm4450_driver);
> >>>> +
> >>>> +MODULE_DESCRIPTION("QTI GPUCC SM4450 Driver");
> >>>> +MODULE_LICENSE("GPL");
> >>>> --
> >>>> 2.25.1
> >>>>
> >>>>
> >>>
> >>>
> >>
> >> --
> >> Thanks, and Regards
> >> Ajit
> >
> >
> >
>
> --
> Thanks, and Regards
> Ajit



-- 
With best wishes
Dmitry
