Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59892F12C6
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896087; cv=pass; b=hK71sLfC/qEnZPHthdNXcaaOEUiPzfL/mAx2byie4kvLr8TUL3X+jI9nFwYxY+sEUfGc+xLBNRbcoVj74EgafzPHK5QN+PbRnc25OKtKbCrHh2qd18KlttjQF2v1BtwoZQ4nkaPxHkr2HEPUGNWtdQovC2dd9Ue50HDTaOR+UdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896087; c=relaxed/simple;
	bh=PyOdwR8RmEZLeNzaYMYibBHCDqDFlBy+4FJ9rtN8PaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muf2jg9JHHuDhktiiwj238pf6Uxh+M+xA8BNyGpEfLp2kXlCFI35h0sWPmMwMlyLWpMQBk08GeCG3Qnl+jDswqJpjivjF5aglSLH5JBvtpZHrXctaSkbeBlrACLfRD4J0mnIltsGKcS6L59CuJTYnCDZRHBtpVxSpBCLQ7iZCbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHK3JeyG; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHK3JeyG"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so1898539e87.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 03:34:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770896084; cv=none;
        d=google.com; s=arc-20240605;
        b=iRtwsdU7GjTlt2DoXwsds1Rb22izo5QNz4j+UvEfanw3G0MUsNGvgdfL+Z8zjt9SnO
         lEGvZMB3iB8J6hp+xGv9gK84xhAEgojZG/eo0w0WDEyMy5I6BgpjYtTYcrCkXXIrz0Lp
         6ArJ7BgJUC02xNpfQM3uZ/2Ks/uU1p9dVbMt0Da5VuhU5YzG6VtYCRQwavg1CR1xWgY3
         Tn1ZFWh8t1QDd2N4QJRBpvIVs3kwAnZIVkm1YBKkNuNlvnFY0CLab7dnZ3VPyw5QE68t
         UzBYA5DdojQT6RRiiTx87ZUuDPYa1GQZ1/nSd7Z+245DmmPn4hnCInzbFPj8HJzGduVQ
         y6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        fh=QPVIJZgpOk43Vg/MRAS/X5CGl11yd+V9UjoP6uNTXP8=;
        b=aSIfN+NtpzRztyJ62EprwSrQpmP7nLZFbhSKyvbGyzEFQXiu77fHEiAi+DBf5uMheG
         vWsFnAGn3sROf4aIc4PwByctrsXyx9sSI+Ycbv5RWbrWBHL52GegQF/mw6ol91VLtO5F
         6qCfbfZmzRwQjp0dgPqQS4JjVMnX4igeU9HpoyRu6mvx+Hdkd6swfOqsD7mwq6Vx45qk
         uVPtwvW6BLegxV5FpFDFWOBxZRydnZmL1zjeaI2W2N4BkF8tLhYuX7jLNyjsNijxWzEF
         txbs8OSeh64kdYQ1WL95VkDEU73AUlekRPPrmJ7BHj7Ix3yq4DeIS7L7bn3UgDWvrkzL
         0XcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770896084; x=1771500884; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        b=MHK3JeyGHT9ejXB37U64B5DN96uJY5TTXSMnTYyIUrxlpCQC4fySv7PkAbRK7kV7Dq
         DfjiKMipvsv90pCGV1WYMMmyPGoNqXn+oyHHfZ3QHNkAlnlywF1siKhuttds5+bbGaoi
         Op/MPUQB9DWfSsrB4s2J6ljO2CqL7HWz0OduunRZFkbm4JDDHN7LekN24DgQLyLxs0SN
         Xeg0PRI04ESilKLfMxUGStyEyUJu6He8h0k+6xItZYBYVDifsh53W7Mx2/dNS8Rh6SSw
         dkmrym58vkr0BRd9kJio0S9Y5TIUbfgTgHvxzu0pLBFd2txLe7Y7bMXIqtMAsjA73SmE
         EwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896084; x=1771500884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct48jaILiyeWuqBIUxAF+6ly5hlTe20+NjTg9trJyi0=;
        b=Fze118h1tSLMDi1oO9OXGZ/uJT2oni+zXnWnEA0WuDgf8e0zKx2c9snx/HCv5kmj7y
         oOL+tX7riXyLV3LpcKiic8zjpGYNoKzmIaVDElXFNY4VhZKG3BgreCfyRn/4k9F3J4PD
         d9n4kTFBoK9cMD2NuyHeZrkTfwuxE1GeKRHWepDKa77uH5W4eVSekK/NF9kC3q4BrjRC
         OloPMXrB1u3V+FUCFYKjY7LNKNHvcGumV32JpuHcyvTXFYFK5LoHfXYuR+B5TDicRPxt
         2zkz/WyIRF3VaSm+jQ01/5KNDZuvQKMH066OLRA70V3B2Z/Eev4TH9T/32QX5MMU28gL
         dxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVjknAQjBIfULBGd8luSIsFHJbOBec6afVo/Sg2YIhO/Tr7hZCNZCa05JCRRKvBCrSl9r7t9qclyA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5jCdbXjAtPdoyi7/sbli6xfA5ViZ9niurOwFE2oxnZMrrGIj
	RaaR5GoLWjT9FLeauKrXf5ZsiNLhva6QQvqn85UUXWxXN8d62qSefBjj5sESq5hp8d+6FdvjRmL
	Ne9khItkidAJbseUgjjphDp7HFAPyoI+2K533oOYxNg==
X-Gm-Gg: AZuq6aJquIW26yxPPOlASgF7oriSfFm0mMHOWtmCExYd/hqF8nGFjeO58e0pAtmNhBH
	LPRKgems3Vt/7fDyp0PStkrbDaA2EixRVpDp54OeFMBbNj2VwxwmWtNatx11XNez4ziv8unGewO
	5GeQ1jTy0Spfa4SWqiztNI6MoTyMViT7gAXi7fIkICeQ62pggKkiiBMkwwDf0sw601VFk0b9ZZd
	JP8t3/44KQ+qOMUg2874ktMU0Q9F3ZyfKVYoTyni5TsLlBPN4h7XSAQiKbe7bK8qqMKa3XOq6+8
	D7h9qRXs
X-Received: by 2002:a05:6512:22d5:b0:59e:5d0c:e2 with SMTP id
 2adb3069b0e04-59e6414e8bemr537633e87.30.1770896083713; Thu, 12 Feb 2026
 03:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com>
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 12 Feb 2026 12:34:07 +0100
X-Gm-Features: AZwV_QgO3Ow5QyeJg9yfF4esWqYhwcZC_L0GtKjw3_i47HZRQkNGD5zGxr2FDM4
Message-ID: <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: Adam Ford <aford173@gmail.com>, angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
>
> The wrong value of the number of domains is wrong which leads to
> failures when trying to enumerate nested power domains.
>
>  PM: genpd_xlate_onecell: invalid domain index 0
>  PM: genpd_xlate_onecell: invalid domain index 1
>  PM: genpd_xlate_onecell: invalid domain index 3
>  PM: genpd_xlate_onecell: invalid domain index 4
>  PM: genpd_xlate_onecell: invalid domain index 5
>  PM: genpd_xlate_onecell: invalid domain index 13
>  PM: genpd_xlate_onecell: invalid domain index 14
>
> Attempts to use these power domains fail, so fix this by
> using the correct value of calculated power domains.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

We should have a fixes tag for this too I think:

Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
Voter power domains")


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 58648f4f689b..d2b8d0332951 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
>         scpsys->soc_data = soc;
>
>         scpsys->pd_data.domains = scpsys->domains;
> -       scpsys->pd_data.num_domains = soc->num_domains;
> +       scpsys->pd_data.num_domains = num_domains;

Not sure this is the complete fix, as scpsys_add_one_domain() seems to
be using the wrong value of "num_domains" too, no?

>
>         parent = dev->parent;
>         if (!parent) {
> --
> 2.51.0
>

Kind regards
Uffe
