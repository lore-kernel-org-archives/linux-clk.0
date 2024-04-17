Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212F352F7C
	for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713333933; cv=none; b=YZ/KoPK+ERg2vMDAc/VGlhG0TGvmOdSC7LuKFY0V/FT5uxTr5Qw7ltms5Dx4FVtX0Yt/Kp9AtB/OSDdtJg7EvYjUK5krgKT5em5Jucq6o7mSaPDUbGYyAcD/OfbATXaR9c6+Gi8pZKvDX4KT4TK7+TNP9soCq7vSRJfw10XlYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713333933; c=relaxed/simple;
	bh=UC1sIFq1cP6r9vbQzk3FdwM8StBdT3LSYUFiXCYAAz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUTqjUq9vTnQRczReQvkiQOCBVNP+/fjivQW08ANaaPS//dRLN/Nf7wodHcYM+o5gcSIc8RGO62v0g23SEA/4dxmp03d8KAo35tRkY11BXK0NvllTkhaZ45Gf+ML+zKUtusIhGo4TJIXGY94pdyis8cZEpBScmhtJvyvJxjJHoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KXmNwQd2; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KXmNwQd2"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dd045349d42so4908715276.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 23:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713333930; x=1713938730; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1J/3E5E/mDz2QdtRZ5VOE2JUZN+fe6PP/1m29WJY37Y=;
        b=KXmNwQd22J4B9EdcFY0dB7E9HjmHlMjn21b3pcegO5r9tO1wTkb5Vj9LwgVj3gEs+t
         8cikhrY82407GGFyt6nNF0CqGv86cHRja8CvRMGRZ6LTtchTzAmdMSfmhhkPDsh62hHI
         eGK56xUleRv1GmFUiq1ZfzYVsEZYm7sx9n5O6htlxXEvvnSmEZIvPbM6ONFH2X9+e+25
         P5rTL0A25g7EB6BC3B8yDCQj4WKoAiuPyL1PakkTi7/RZWMxpVIYxtdI4ucTq67/CZUs
         RHaen943paLbhBvqn2p2kKYsWL6dNJbI7qB6QafJGYjj+odvIqxD6L9IgDcjEJrRthjo
         nhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713333930; x=1713938730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J/3E5E/mDz2QdtRZ5VOE2JUZN+fe6PP/1m29WJY37Y=;
        b=theqXlkQKIjQlGNyVBj1woK1nRDLmqRRvfX/Q19zvzXDCxLtjGzY5MMSBAetwK0UFa
         d8xc+VH+0z6tSMsmCy/IPtt3T1jANLDyhJi8Gy2kI4DrybUT/wT2n3wKDuSpDFMMj2nF
         BqnJU/h4LQhLc6i/fAetApGFxIEBbY8X8EFl6FgOA2qNE3CW4AIsiB5DnyY/IiAyL+fE
         V1EleZVFTwNfEWY5qC3zAvC/Nibv4wuZvc98+a63xjBMiIvIY60Ce2YnPtqw5a0e0WUZ
         0BbMM8gIcdTXOu0q4vKZ26/qcvwF56fURW7lnktH7Oy/49QfbT4l97EC7P3hqp62mu+v
         owiw==
X-Forwarded-Encrypted: i=1; AJvYcCXL3mfWSiyOuqwxXKL8c031ExynWQPIyizGN1313Iw3FgCy4xm/Kr+NwKXXmtZQVIvj2MrcXk/I7ZgVG6hStc5POh/JCLzWFci3
X-Gm-Message-State: AOJu0Yx1Hat062HTf8jD+i0s/KxFWFJaZ/asXRIV5xLN5sK7yHUiGng5
	9DwS6aI3YALkABWA1FFf3KyjhjAt++OcAEINfSmVWQbLkasGQvwFfNnMTVnvCFWOSN4QcoXJL1G
	PbclzFK+OK0CFfYjRHhNDqKNyO4One1WDmwgK+Q==
X-Google-Smtp-Source: AGHT+IG+zoMzQqQ/q6dE6vRDF4nodM3ANPMJAehmBQIdP7EryRcFqpoupwSxnU0cMOL78CpmhaUMLsaVKv/Pqf0CWmM=
X-Received: by 2002:a25:b9cb:0:b0:dcc:9e88:b15 with SMTP id
 y11-20020a25b9cb000000b00dcc9e880b15mr14409265ybj.41.1713333930018; Tue, 16
 Apr 2024 23:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416182005.75422-1-quic_ajipan@quicinc.com> <20240416182005.75422-8-quic_ajipan@quicinc.com>
In-Reply-To: <20240416182005.75422-8-quic_ajipan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 09:05:19 +0300
Message-ID: <CAA8EJpqwrKcgm7c57=LpxS7+CfrN2UxNg8k_46auBrdZG7vQnA@mail.gmail.com>
Subject: Re: [PATCH V2 7/8] clk: qcom: Add GPUCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 21:23, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |   9 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm4450.c | 805 ++++++++++++++++++++++++++++++++
>  3 files changed, 815 insertions(+)
>  create mode 100644 drivers/clk/qcom/gpucc-sm4450.c

[skipped]

> +
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

My main concern here is the AON clocks. If we don't model
gpu_cc_demet_clk as a leaf clock, then gpu_cc_demet_div_clk_src
becomes a clock without children and can be disabled by Linux.
Likewise not modelling gpu_cc_cxo_aon_clk removes one of the voters on
gpu_cc_xo_clk_src, which can now be turned off by Linux.
Our usual recommendation is to model such clocks properly and to use
CLK_IS_CRITICAL or CLK_IGNORE_UNUSED to mark then as aon.

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
