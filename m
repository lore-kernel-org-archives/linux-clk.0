Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4021190462
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426110; cv=none; b=MQVjSZsZC2x25TWE3+GtaHBl6tpP5FK9K5O0aB/XGwVXXvLItv8yAkjl+0VYrweeNsuPxIWLeWd22Xl26sHsbZTnMFXkk+L83AEBn9AoSQQKu87GGnQ259OoRzEKaZVs1DeGIJSpffxcC/530fda/2aDF7MWB2jkQXySlCcy+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426110; c=relaxed/simple;
	bh=6TYIPbPS4R6iweSpc2w1PZdKid1Wu6t/ISBPYdapvbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvLmuqcgk3R07ksafNuEGJNk0dTULODPj/pp+gAHSy1h+6Atc2FHx9YaO2YW39aa8wGz/QTEP9AaLutVKXW0En0G/jbNjdn842tr1a7eLp4rTf9PWV6GGO/TrcBImZkZ185uWJmbjrGujpcbX8LmrJTbcKJ6GOSNahTxnsSbPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbYU32NS; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbYU32NS"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ce6c93103so4754719e87.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719426106; x=1720030906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=//MpmAILITzcKEizX/9gxPn9UDOA+9PRAYCNpg/DcRs=;
        b=fbYU32NSCLChz93v6SvxehylSi91JXAVA0I7Iz1fvcq4LbVVs0mRyRCVxAprAv+RbP
         CuDSPKJ2O+HNwe6zIGFI/4FRgcWsRDmexIGuneZtraj2I/E83LDkGyt1V0fG152OF262
         5QjVOBCkf+IY5iKtLh7EdKXnSEwoQoukGmxL8gzBzLuAPX9bumVYy9kf5PwcVyA6M9j4
         ECGDc+f1sRMqrvDHyvh8lSmAxE4PT5k0TfKOS4KadOMH9JP3SI8j4t6hPYogXGGcgE3U
         q9KrzxTt+Hxcb8hqs2Rdap/JwqcyA2EsF2F8Tde/adb8HGOLQV8ezYVCEbUVV+U064on
         ZyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719426106; x=1720030906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//MpmAILITzcKEizX/9gxPn9UDOA+9PRAYCNpg/DcRs=;
        b=aKfoGh7k1gDbK40NoDPJ+wzzLYYQSKnp5ly+5SZ+NfRVZtQnPKDlRrvFb49B0P3cnz
         8fAH+d+Zbzm03b/RDiQjlynYm8t6osMlpHe6RGiSlbJm4k8r1GjnvokVD3QPycGDgGXJ
         Efu9fuvCVOBZ4IUWnHS45QI6B5U8Q2/jKEPG/cbybwihpohFP8FQYq0aopMa72HisO0P
         tW55tAgSCbmQrJMRUJ8TwnG+ymDbOL0ER59ykK6XGF8+mRmWOKCoO28luUxUhD/vguSJ
         1BVoQPTx+ZTgmpRxRDbj/sWr23qKp/38GtSBYXF5XvUyyHUctph60Ct2s2xeM55LdBtn
         tN8g==
X-Forwarded-Encrypted: i=1; AJvYcCX9CJsRByAwaFwZFPOIA/aef9BZBt3kBgjpJOnTYmXfsTQ7wIwE0rUoKwB9O5awSB6DL4WG4kw3RiVXN2QVBDwvE7LpYfbLDQEC
X-Gm-Message-State: AOJu0YxLTB0yjiC+d29MfR7bJ46H2HnTdJ4Y527J2r+BcJiW1Trqs5i3
	NvrXMXQx4qyU9Ns9flXJYJFf5blUfwmTr/uXh6963FjiLQBFGtT6gq9s9rH0xzY=
X-Google-Smtp-Source: AGHT+IHJ4p//CH+AaNp/ZmyKwZ/tji9Ag3MV6cZw2C1QzU/zz+/aY3hOnCofp3e1KT6QUiZEBrnMNA==
X-Received: by 2002:a05:6512:308c:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-52ce185ce9amr11764612e87.60.1719426105827;
        Wed, 26 Jun 2024 11:21:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdcdb981esm1450255e87.122.2024.06.26.11.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 11:21:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:21:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	otto.pflueger@abscue.de, neil.armstrong@linaro.org, luca@z3ntu.xyz, abel.vesa@linaro.org, 
	danila@jiaxyga.com, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/9] soc: qcom: cpr3: Fix 'acc_desc' usage
Message-ID: <jgboqj56nfeuv7qmi34chan46u5urdxyezqhfmqdq3clvcv2k6@k7aktead5qbk>
References: <20240626104002.420535-1-quic_varada@quicinc.com>
 <20240626104002.420535-2-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626104002.420535-2-quic_varada@quicinc.com>

On Wed, Jun 26, 2024 at 04:09:54PM GMT, Varadarajan Narayanan wrote:
> cpr3 code assumes that 'acc_desc' is available for SoCs
> implementing CPR version 4 or less. However, IPQ9574 SoC
> implements CPRv4 without ACC. This causes NULL pointer accesses
> resulting in crashes. Hence, check is 'acc_desc' is populated
> before using it.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/pmdomain/qcom/cpr3.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pmdomain/qcom/cpr3.c b/drivers/pmdomain/qcom/cpr3.c
> index c7790a71e74f..c28028be50d8 100644
> --- a/drivers/pmdomain/qcom/cpr3.c
> +++ b/drivers/pmdomain/qcom/cpr3.c
> @@ -2399,12 +2399,12 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
>  		if (ret)
>  			goto exit;
>  
> -		if (acc_desc->config)
> +		if (acc_desc && acc_desc->config)
>  			regmap_multi_reg_write(drv->tcsr, acc_desc->config,
>  					       acc_desc->num_regs_per_fuse);
>  
>  		/* Enable ACC if required */
> -		if (acc_desc->enable_mask)
> +		if (acc_desc && acc_desc->enable_mask)
>  			regmap_update_bits(drv->tcsr, acc_desc->enable_reg,
>  					   acc_desc->enable_mask,
>  					   acc_desc->enable_mask);
> @@ -2676,7 +2676,7 @@ static int cpr_probe(struct platform_device *pdev)
>  	desc = data->cpr_desc;
>  
>  	/* CPRh disallows MEM-ACC access from the HLOS */
> -	if (!data->acc_desc && desc->cpr_type < CTRL_TYPE_CPRH)
> +	if (!data->acc_desc && desc->cpr_type < CTRL_TYPE_CPR4)
>  		return -EINVAL;
>  
>  	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> @@ -2703,7 +2703,7 @@ static int cpr_probe(struct platform_device *pdev)
>  
>  	mutex_init(&drv->lock);
>  
> -	if (desc->cpr_type < CTRL_TYPE_CPRH) {
> +	if (desc->cpr_type < CTRL_TYPE_CPR4) {

This is incorrect. This disables ACC usage for CPR4, while GFX CPR on
MSM8998 (which is CPR4) seems to use ACC.

>  		np = of_parse_phandle(dev->of_node, "qcom,acc", 0);
>  		if (!np)
>  			return -ENODEV;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
