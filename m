Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352127E9
	for <linux-clk@vger.kernel.org>; Sun, 31 Mar 2024 01:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711848519; cv=none; b=boIIx9e24lp3l3mdTjCldwhQO62H9NADF3Pd3dshU007ttEZu4lpB/RhLKRIjMTux8NNiy1Y9YzEFLd+znRsn7NkUf68Wr3RALkhRBpdV5h1HLgoC1O7YWtEQrvsqugEbX5YWZFCJr/i036gnba29naIJlNlr3FgXqiCWK/Rw7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711848519; c=relaxed/simple;
	bh=fwCsj9KzvvZz8Fr0/8Sp6V8OFjpmhOC76hu56ZddtJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4yyoS+d1KLHKprIIwTSjwvoH0VsYdar6jEwuEfV7NAb2TPMFIaEm+l+c7N60m87h6U0x52lDRCkx6Ze1y5dWElosR5SiTZZY2TkF64ueIk85eDxpodZ5bjRRtga9cpcajpZtpyKyT9i4s9lYty521321K1SvJSHwzhI3ZsRpRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a36wuHNF; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a36wuHNF"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc74435c428so2930762276.2
        for <linux-clk@vger.kernel.org>; Sat, 30 Mar 2024 18:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711848517; x=1712453317; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BL2R1QAuvfVx+U9ruvI1fjJwx/fUUYB4YJfJTk35Ycg=;
        b=a36wuHNFC0DbmMRm9QNUNO76ibDrG+CFhwqGJNF/T+ZsGvxiiPPtHWtQB72uyywcgK
         mbG+KxWt05iQ305lA/75h/3MmLy6WwzZP8djSg2sXaomibAj4iOEy7+wdzlGvqwVgG5w
         KoVW2gzxJPD1dcSN2Qt9djf405pA3ToxA8/2VJ/4C0bT4kYHN7M3bv9ooJIxH/tRCnEp
         VHiF+Jre1VL6ShwiQdEGIoBaDCXUV46vfytw/Rp5O9fQfbxuEKfte+SRDessTADb5qof
         BQoO22I1wFbwWvETV2Bj7BoWXemSEfAl4Mix0N8GGxwPOCNnT+Mrn1WSa48XnoQKbL0g
         mChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711848517; x=1712453317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BL2R1QAuvfVx+U9ruvI1fjJwx/fUUYB4YJfJTk35Ycg=;
        b=t1EP8P8a2dFG0XRCNRJaeRNk2pLGQO71dl8cVeMbmAe7cx2CWW5830Vw/0YDuKrryj
         C5W+lpzDTHwi7bf4Ji96Y8dGEFa9u2U6U4snZ/fzQ1WJRyxfcAY48NtBeAmMvK3zeOMG
         a8wSiet7Xu3Fb1ceDdiR2AfJmGPjCpXSRxH9V44YKkYQY9ZotDQfMcb7WIKv8rzLW5aI
         eEa8xwZeK89rehMaswqyLrY2BCz6SFnDXXt6ypxExlDVLRQhOD7jH9s3FL0GGQ0ftEZN
         YJkCg2n3I+X8YnYesf9V8Q2w8Fbx0+B5BHKdaERRdPuMVwAAJVYLT3u2bmC1AI0cp30U
         YVSg==
X-Forwarded-Encrypted: i=1; AJvYcCWl3jg9Togq/ytnJBL56JhcSET6RyTB2cA71DP+0fYTszfwuOtaE8Tq5qjc2CMxUWn2Hvwnzna2hvozLpzaihilMGMx0A1tV0NR
X-Gm-Message-State: AOJu0YxlnMsG8AifL1UXWX3SwmYN1VjxiIxJvJk/9cP5L211yOMQXpml
	LeOsQqMZzgRi2JJZ7J3iqNyd80BGrhFt1O07dRULPRYHxyqm41l7rPrMVUNPIJ5UsJADhziX8D3
	CkV2+0ibuwp4zbG6BvyIxOtKp+GZVaVfH/3uwwg==
X-Google-Smtp-Source: AGHT+IH8rc6ukKZ431Xu+JFdWXSvpJY/UG2Kt+Pg0Sya5av9XYBdN41omRMHENn7AkaVIvIVLpbPE6RbB/yVwhyEjNc=
X-Received: by 2002:a25:890b:0:b0:dc6:9c51:760f with SMTP id
 e11-20020a25890b000000b00dc69c51760fmr4459130ybl.56.1711848517203; Sat, 30
 Mar 2024 18:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com> <20240330182817.3272224-4-quic_ajipan@quicinc.com>
In-Reply-To: <20240330182817.3272224-4-quic_ajipan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 04:28:26 +0300
Message-ID: <CAA8EJpqZjysw+YE=vKguearf_abSzocvYtMvW9eHAZD-tMKs0g@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: qcom: Add DISPCC driver support for SM4450
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

On Sat, 30 Mar 2024 at 20:29, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Display Clock Controller (DISPCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/dispcc-sm4450.c | 781 +++++++++++++++++++++++++++++++
>  3 files changed, 792 insertions(+)
>  create mode 100644 drivers/clk/qcom/dispcc-sm4450.c
>

[skipped]

> +static int disp_cc_sm4450_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;

Is there a MMCX power domain on the platform? See how other dispcc
drivers handle pm_runtime status.

> +
> +       regmap = qcom_cc_map(pdev, &disp_cc_sm4450_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> +       clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
> +
> +       /* Keep some clocks always enabled */
> +       qcom_branch_set_clk_en(regmap, 0xe070); /* DISP_CC_SLEEP_CLK */
> +       qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
> +
> +       return qcom_cc_really_probe(pdev, &disp_cc_sm4450_desc, regmap);
> +}
> +
> +static struct platform_driver disp_cc_sm4450_driver = {
> +       .probe = disp_cc_sm4450_probe,
> +       .driver = {
> +               .name = "dispcc-sm4450",
> +               .of_match_table = disp_cc_sm4450_match_table,
> +       },
> +};
> +
> +module_platform_driver(disp_cc_sm4450_driver);
> +
> +MODULE_DESCRIPTION("QTI DISPCC SM4450 Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry
