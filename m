Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41548818
	for <linux-clk@vger.kernel.org>; Sun, 31 Mar 2024 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711849180; cv=none; b=IcpEszVCe9P7vCUaSuLfwrtAw5YfPmfB0DBhKhOg7RYMc/0GCHkx9C0FDy/blFvjxVXGopPZ+FYqHFT0iMSeapjpBZY9WsSdRpnuqwa0r2DKYpGW4KgXM2YIXyjf8twhHdhdpC0RXZ+Petwa9+Yl0FwOC4uqqYozFs1+LkzFjoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711849180; c=relaxed/simple;
	bh=Fn+TsTQBzYkr8BN5S8QtxbkmZytkFwSLWuUHGwvJlyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfcy2KMpzpPtEN3MMREnjCAjCRy6JRjHm+GyYVeyuivHMfZe4LWxEgvW1K4pPixxGrZW6nrhRtn7edyyTBqsKTVeSQRxrRK+uWOXOoN9RY3mtcD5D/mizQQd5xjDBCTycxVwdgDbRUFu/bQBeYIEuxMYJwBhdbDTRsg1NQ0uRuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec21xZ/T; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ec21xZ/T"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso2853545276.0
        for <linux-clk@vger.kernel.org>; Sat, 30 Mar 2024 18:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711849178; x=1712453978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IasEhL5XOtCSrP0eSjZWS05JFaU6jm3ChlspgQqiITE=;
        b=ec21xZ/TG7HJ1LadNOXPtAbdLUE0GLi2V1DvsA8oUTuSNLdZKdwLeeRDpcKVFNUXbZ
         yPztQK1YURJ/4KBRPm/rLfoGvYTpkKoLfIwuTdT69zFX7dX3q72m95O0PMHak5DaaQXI
         9ct84KgkjHV/+vqEW03DR/zfEpv8lsCF6RE9zVP7LvNnW1ky3+RIqMCCFNi11yuMhC8a
         zgaqKI3Dn6XPkGYD8Q2g3E4ozGXH4F3CEPfugWgaGDsoXxN9nLWh2BH/T2jtCTWPMnjF
         ZRDyC/2QkSC/M9M5cn7WCu8LerNJvg45lEa7MiKjLAMl2apwuh3XH2L63kEhFXMyPpwd
         288w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711849178; x=1712453978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IasEhL5XOtCSrP0eSjZWS05JFaU6jm3ChlspgQqiITE=;
        b=Udal56W4xw6LuSyD22zdrRKecUnH8Smqqkv0ftZEuzYGOs+hQV1oD3gko47wVJuV7i
         v+9w9X0QpveFPnNOiWOuuBG0sVd27PGzF0Vf9r/TR318kXjHJd2+TbBrk7LuqD7+jENZ
         XEfGlNB8serU3j7I6HcP6nu1Q99bnKr1D1mIuYrdaZLg0Or6TRgw8VhU261biq0dg/Kp
         Zt78qdH9TNs8AiUgOdugmXyQ4ckiHymdZEWfefXR9Byf15yRr9TEvfE4WfVR5VGaRSl3
         0xARq4VRRBgwBVBwIt0StnqUdFB4RIIRecfX/ZjCnUWHaHVH69pOs44ijALvDC/thbFi
         74zg==
X-Forwarded-Encrypted: i=1; AJvYcCVh2125pFBvrT7QRc6vFkyTiqcsGhNMsUJWF3GNizaItXPWpqKhX7+etpLMlJ+z3rv7eiVyyuF0nqcGd7WTUHIeHdRCUm3zEKV4
X-Gm-Message-State: AOJu0YyANm9DKmApM4FK9SIHYSGxW8g9mRna40tPPJTlLmEXHO8H9C8n
	hfeuNSftL7vZJRo90u43EP49clx7La43/ZbGnv/UD1kxRVSQqlmjhoN8R7vpXa4o3S/4cfkhgC+
	ccrmtAKcul1ZEvQNjQpZCulc4rx3Cuz6vEQ9KGw==
X-Google-Smtp-Source: AGHT+IFZngZH/RN6IjIHSHcLDidaqOdf5FUk3Q4dmjxq8F5vqdd8kZDwudv1k1scL3eXkUauYjD8gHOMM0SAY40Yw+M=
X-Received: by 2002:a5b:6cb:0:b0:dcc:57ff:fb70 with SMTP id
 r11-20020a5b06cb000000b00dcc57fffb70mr5248782ybq.60.1711849178283; Sat, 30
 Mar 2024 18:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com> <20240330182817.3272224-8-quic_ajipan@quicinc.com>
In-Reply-To: <20240330182817.3272224-8-quic_ajipan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 04:39:27 +0300
Message-ID: <CAA8EJprtCbePun+gpwxg5e6o5NaBnunEJrmDrCV+O8BdHEeuYQ@mail.gmail.com>
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

On Sat, 30 Mar 2024 at 20:30, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |   9 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm4450.c | 806 ++++++++++++++++++++++++++++++++
>  3 files changed, 816 insertions(+)
>  create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
>

[skipped]

> +static int gpu_cc_sm4450_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +
> +       regmap = qcom_cc_map(pdev, &gpu_cc_sm4450_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +       clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +       /* Keep some clocks always enabled */
> +       qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */

Why? At least other drivers model these three clocks properly.

> +
> +       return qcom_cc_really_probe(pdev, &gpu_cc_sm4450_desc, regmap);
> +}
> +
> +static struct platform_driver gpu_cc_sm4450_driver = {
> +       .probe = gpu_cc_sm4450_probe,
> +       .driver = {
> +               .name = "gpucc-sm4450",
> +               .of_match_table = gpu_cc_sm4450_match_table,
> +       },
> +};
> +
> +module_platform_driver(gpu_cc_sm4450_driver);
> +
> +MODULE_DESCRIPTION("QTI GPUCC SM4450 Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
