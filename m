Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3512AAD4
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028573; cv=none; b=s5rBmQR9A25ryi0J3Pfny0qjYkdXlskgkFx39ctqCiVytt758+xwGtAXjoCQccB6VduLlrKnWxTce3MAZSLB0EOs2vvmg5z1lMqdUny2hxgzSqHH6LDV5zAtpqNviNRZGE7KgFGDEKUeSPtINbvfPU/w6JX7ENM+sVe0LeScBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028573; c=relaxed/simple;
	bh=0GodLf30+iNTBjP5Gh6/duXnvzTXZV9C69MvyxMo8U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZPFRO2GGirhmxsX9uRNtxmP/qoAM1TaBud07J46L0MbVVnLTHO1mNH1VYn8uOhgjPIcg+50gO/UO3fh7yR0YVVgvevAMcFB1ZbbJVjUQ+hRZ9YcbbnLLlyf9JYu1a8+tt7G88UIjBpG/pY6fV/R/J/xtMPUGBd0u3gILcBJgB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCbhgJNJ; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCbhgJNJ"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ff7dc53ce0so33423167b3.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 08:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706028570; x=1706633370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aXz6WQyGCVGvl5jSp/sFyNgM0abYZYPNAeAICiPwHO8=;
        b=eCbhgJNJvcM1TmjWFhBZCwvo4N+jgvjxgMOR2MqTqudxEr99MPdQWJ+RJtEhwyxq7O
         eUqJTMAc32WZodMqMq9bhTuKCYpFqdH2q5DQw3qWnTJJz2KXCUqmZjpse1jA47qEr2Gm
         udGRMzYCeuPq2fQtBseRlG61FucIuhDcwa2JuYGJXldVDT2yDdKCB1vV8cZ4drdxw/ku
         Y0Yo7IT7FeW7sreqCbCreFWytvCnP6/L7RKDOAYl6MVzXX6a5HRRwBI4p53n/ED5Fh/+
         kq/F9dZaCW7sl3vYvWa4h9dKz/xXFsFhNfdQ7YWOTvNMFtTHN1fHXmAfkolTGRVOgRR9
         5D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028570; x=1706633370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXz6WQyGCVGvl5jSp/sFyNgM0abYZYPNAeAICiPwHO8=;
        b=f21rX8+SqUw/g0NAYGHCvSI7A4se5cVoA2zZdR57MoGAelvUhG0xxWlPNzkOyOZ4rC
         2isysKPtD//TQqOxILSynWA31lAMD09yorBcGplGlALe1G2t5FxK6lll0hS5ONY+uqk6
         WPRGQLbkPVJ5yjEo4HOyME9bhME5uQBflIkeppfOStT1Dsr4iecmXbWO5QJ6LxaR3u55
         htqPALGwlNuoKWjs+D73kV4A4Z9ex+lD9gsoxox4jJlx4gUgRsBc2U5m0ga1RD3g7HMS
         apVAjHdJI7B3lWheBhjZXB5YaeovGaWypne9THL9bklGiAl0vF3rQRRo0c0iKq4zkB9e
         vYog==
X-Gm-Message-State: AOJu0Yw54Tw57oBBDCR1Vq7nJ5a199N69huY48waCAUoSasbcE/Kvht+
	Sf4MeJAhW1zvefDSphakq5AXuHTNVc3AUEjSHbZaTJWF0DvBgiK+exndHG9IKLoECJ2t/2RRpnt
	GnwQk/kDMPQU2Lae1D4sLGvfMpZcc41zPoFiy+Q==
X-Google-Smtp-Source: AGHT+IEE5iwDZNZnKWCqP0X/hJ8GqixDXEFeBY9HQDXHizFGiA1pCXIi2xw17JvVbOPkrHIwHkzBMtTYGJvnD55grhc=
X-Received: by 2002:a0d:d50f:0:b0:5ff:9eaf:be5d with SMTP id
 x15-20020a0dd50f000000b005ff9eafbe5dmr3326432ywd.81.1706028570482; Tue, 23
 Jan 2024 08:49:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-gcc-ao-support-v1-0-6c18d5310874@quicinc.com> <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
In-Reply-To: <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 18:49:19 +0200
Message-ID: <CAA8EJpqLZQNMzn_oC7AbzXP2f==PujUe-atfUNgFC3VaFF8=Bg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sm8150: Add gcc_parents_0_ao support
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 18:35, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> Add active_only support for gcc_parents_0, this is needed because
> some of the clocks under it are critical which would vote on xo
> blocking the suspend.

The kernel should be able to work with older DT files. Please add
support for using bi_tcxo as a fallback.

>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-sm8150.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 05d115c52dfe..2a0608c5a104 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -123,6 +123,12 @@ static const struct clk_parent_data gcc_parents_0[] = {
>         { .hw = &gpll0_out_even.clkr.hw },
>  };
>
> +static const struct clk_parent_data gcc_parents_0_ao[] = {
> +       { .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
> +       { .hw = &gpll0.clkr.hw },
> +       { .hw = &gpll0_out_even.clkr.hw },
> +};
> +
>  static const struct parent_map gcc_parent_map_1[] = {
>         { P_BI_TCXO, 0 },
>         { P_GPLL0_OUT_MAIN, 1 },
> @@ -222,8 +228,8 @@ static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
>         .freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
>         .clkr.hw.init = &(struct clk_init_data){
>                 .name = "gcc_cpuss_ahb_clk_src",
> -               .parent_data = gcc_parents_0,
> -               .num_parents = ARRAY_SIZE(gcc_parents_0),
> +               .parent_data = gcc_parents_0_ao,
> +               .num_parents = ARRAY_SIZE(gcc_parents_0_ao),
>                 .flags = CLK_SET_RATE_PARENT,
>                 .ops = &clk_rcg2_ops,
>         },
>
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
