Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFC13C90F
	for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713353211; cv=none; b=KaR73ptXpFFLIGabcuh9ad5IeVz/4ZkDoDjavseDte/QX14TuDGUKEHi2AZXE/OpBb99I+DdZdpFcqh/n/WN1BeX6R68TkuFQeD9XIr/IT0RDLTELk2JxePQd0kL7E+J8iLGiUfl8s5mG9d1nNn8uVFdOcYTEB1IYgLMEuZwQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713353211; c=relaxed/simple;
	bh=9w15mbaH1qCPmMzqW2fuVbi4t+4cdxNW7m9J6W+SAcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMQPtZSJs+Ut+rSGq2Gkyi83huf2QvuWFBlIY3eRwfDwfP7NTSbOkCfoAFMM3soG/94gZNVL6GKLvuCO/2e733NLt8BCL3eDJcqolQ7teuLTao4rMNn6qRqQx3Y+smKBnfi4Gh+oB4MYG6gsYihDoRV7tFYEWrsO8NgolTYWhrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y5fIZBeH; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5fIZBeH"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so5468926276.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713353207; x=1713958007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEf0tlVvOtKKoShUsakltVb3hD3/VpXcFyQ1gefjJfU=;
        b=Y5fIZBeH5Vy4N3V6A691s9vvWkxIhtBUw9MmdpaEoVD3T9H1MljZRsfDVdd4zrdwub
         egO8NOLvTbbn0FedpzowPCK1rMFTJA4IjEygopfIzqnFyhdaeQBAD6XeRTOd+2OZHCiX
         KSfb7inzPb0p/Jf/F0I4GxCtZmG9z/V9I4IiOt4sopzJu8GGT40diQllvXnHsWG95P9i
         e/uOaDCNA+Azoik6ysPUxkrtaz29gLO7solHQQLdkpE25+hGGEBS0GQ/xLCogiFiyXlC
         MDGSUVHCyEXvANBW+LZywlaO3orhHIRWz0/SCCWj7oaru5ZcLNi3um46BuNY5b7kG+ft
         5T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353207; x=1713958007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEf0tlVvOtKKoShUsakltVb3hD3/VpXcFyQ1gefjJfU=;
        b=xNongeFKmujiX93DKFnCHz6Zym3o5b3OQoZH/vHo5W5uIIYUl0zJh/t+M2vRHDbns4
         vAV7UBZwVqDNa5iW6vECvZ6DE3NyFfwp3v1hdP7mKp0ynKMJCYGMkHdKIQlnFZLankjt
         wASbzcQ98yrbkH7XwD+aDyqftBfKekfgjJHJi2+74k9GXUpPvvFrOnqwPWfhk+GqNf86
         ELHJG8iHkfGD+XRdu78qbOYogctyA0GSzgOxzdVE/4MjxpGw4qBxQB3sM5+IUFqODORD
         c+QyePmx9nEuwzREeoCs6Zmpaaa29YtmoRh7IJI3S3wwQq6saOmpMoLlexUsey7/chbR
         eXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3kyKl3p2W+FpEm/cOiDTNuIrrJu/pGld4U4GF6RDAzhp501okNrG/2tPGBVQH91lTkKFFB4l3cT/lQ7zwFBeBVygs8x4Qb223
X-Gm-Message-State: AOJu0Yx7AMJyN51ftOUk9dHIMyJjam4Gk79KE6n2BsSFRxBIYfm9MN8c
	QP1q7zRx/v1b9QmKfXEZclv0gCKsCRCG0va6j3GxYBBJ7aaO8KFd/NzcJ0LqGQljYYsXk4297WQ
	D0tgg/uIsrZzqjWKnusuf04Wi62cqFVWpZauphA==
X-Google-Smtp-Source: AGHT+IEQk/I5LetE/DhGDVVO0twPSlWrg1ZbN08OoWEw3G7KQntEEGuJ8Lq3vNPpkhg2jG26xZma+XZL1vf3+BIUoXY=
X-Received: by 2002:a25:d354:0:b0:dc7:45f4:44f7 with SMTP id
 e81-20020a25d354000000b00dc745f444f7mr12803841ybf.14.1713353207586; Wed, 17
 Apr 2024 04:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417105605.836705-1-quic_varada@quicinc.com> <20240417105605.836705-3-quic_varada@quicinc.com>
In-Reply-To: <20240417105605.836705-3-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:26:36 +0300
Message-ID: <CAA8EJpqaXU=H6Nhz2_WTYHS1A0bi1QrMdp7Y+s6HUELioCzbeg@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] clk: qcom: cbf-msm8996: Specify master and slave id
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 13:56, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> The icc-clk driver has been changed to take master and slave id
> from the caller instead of auto-generating them. Update
> clk-cbf-8996 accordingly.

This should be squashed into the previous patch. Otherwise the driver
is broken between two commits.

>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/clk-cbf-8996.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
> index fe24b4abeab4..a077d4403967 100644
> --- a/drivers/clk/qcom/clk-cbf-8996.c
> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> @@ -237,7 +237,12 @@ static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct cl
>         struct device *dev = &pdev->dev;
>         struct clk *clk = devm_clk_hw_get_clk(dev, cbf_hw, "cbf");
>         const struct icc_clk_data data[] = {
> -               { .clk = clk, .name = "cbf", },
> +               {
> +                       .clk = clk,
> +                       .name = "cbf",
> +                       .master_id = MASTER_CBF_M4M,
> +                       .slave_id = SLAVE_CBF_M4M,
> +               },
>         };
>         struct icc_provider *provider;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
