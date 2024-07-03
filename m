Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB71741FC
	for <linux-clk@vger.kernel.org>; Wed,  3 Jul 2024 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003621; cv=none; b=AsOGMSBkngqegVy3y1kQj43VNvq12tM5sDnsirP/hCBzm7eNgZWi7zv6sTW32zYq6Bz7tic0+AocLj6wMQR8G9yA9jSQrEktG1NM3ZjLJ6WqgIqJAWhjOmmKDQuzpstvHA5cVD0c+ZlAYvwZaHEj6q4s04MJQ9J2ph25IVYUqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003621; c=relaxed/simple;
	bh=foPMIvvTPseXesFoCi3Y6Msx3NpMb+EdXsD3e3zHHT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxGwsAERaepDofX8WD93bGpo1RxF8wsosnMRCxIUqEVscwJibtXiFZVWX8yczfOgDL9Vnn3/Z+XoosCCV9fqVu3nIbBDHM1nVzPhBNxEjvfCVBfFXJjwptP8VEcIGLZGABRY6vwm23Owa0JNcPoFPMMUOK4pKl40qctQENYCMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bv+mtDSc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bv+mtDSc"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52db11b1d31so7300666e87.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2024 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003618; x=1720608418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6RqGX8VTMC710d07ZkPLdr6JCBvXddZZa+hWl6qD7c=;
        b=Bv+mtDSc4VpJyl9o7hOA8LPvSe6ExZzmRTBwgM+K5p17KkSLGR7Xu2EnogWzZmxnjJ
         SeSuN8ib18XT508IFxgEDgLdqHRTbCgt+h14MR0u8bvGVfrhVsHup1QTytsViZ4a4g9A
         B7Vd7WcDZtfIxEWZ+8uOnXej6MxTJkXpcvEwKIEEfDXMl/DHekHAV76bIjoZ7PjwNqyh
         PtV1M/Brnq7cUHOPflAfrUkppolTA2lwxslsR1PJqB2hlSnHpZhyjeet2CVAkKt2r4QW
         tCOR9nddCLRIqQF5RUnhmvCPk0tz5Geor3AGQls+Sz1BUembO8Gu8RVbp9Vx7kdBhCld
         MLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003618; x=1720608418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6RqGX8VTMC710d07ZkPLdr6JCBvXddZZa+hWl6qD7c=;
        b=N04p5BFq+uqt9lMgY6fofr3orxQysJAwDnGYCGU9bG2f1CV0zGQuxVRkeAFJM7DIet
         LZVMS9yIOxy+XSfbYBX+ew1G+fud7lAkQDsrpKZ0FZ811Zg9d/n7QGTeMbDO8Fr0OHjY
         SHyq9m3gvjL39XMbApdhrfpIQP1sZtPy2oEIdPUTZ3M6dApJLJ7uhp6rLcpveSsTzjOY
         Gj2pxlYdz8ufSjv4r7UYQFVeqYsjVEDTbFyDHfnNODm85nyrgNHVezbvgY4kBnxpG2u9
         uHymKYyEaj5IsdoxjB4u5kH8C2Fhm8JEcEhpW/vOrexAOSb7LqF3GDaVIoroE9FWKJVB
         hYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCULqh5eNacltEGBMXx1CDTCEUC/U7qqrKyNtByv0VRrmGTUTNgiC43tFZii6xRUE9C+32+i8wr/OPp2Uzn0V9ojB/nIrTGq+RUV
X-Gm-Message-State: AOJu0YwAXHcfmxLpbedUR1YV7g1ZCJuX9i9sLqBeNcJBlK1Qurp/TYW6
	TfzC+B2mYl50Jw4uQonNmiwtpwBlU6RQH2gYFozCJ/N8/5JcuUZ6UJeTIb1MAcU=
X-Google-Smtp-Source: AGHT+IEP56pHbP4DCZFL0TzwnwRKdgriFsrjpsNp9TvUXF81k3NcrKi5DJQNSBnNphOP/g4IRsep+w==
X-Received: by 2002:a05:6512:6d2:b0:52c:84d1:180e with SMTP id 2adb3069b0e04-52e827344e4mr7597722e87.67.1720003616744;
        Wed, 03 Jul 2024 03:46:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b263sm2093468e87.268.2024.07.03.03.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:46:56 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, angelogioacchino.delregno@collabora.com, 
	andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	ilia.lin@kernel.org, rafael@kernel.org, ulf.hansson@linaro.org, 
	quic_sibis@quicinc.com, quic_rjendra@quicinc.com, quic_rohiagar@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, danila@jiaxyga.com, 
	quic_ipkumar@quicinc.com, luca@z3ntu.xyz, stephan.gerhold@kernkonzept.com, nks@flawful.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 01/10] soc: qcom: cpr3: Fix 'acc_desc' usage
Message-ID: <u4hzxnecdyow6h4vhddcp53tuxrqhbqu6cv4cznytihsyshzy4@lqxhsn3qvjbz>
References: <20240703091651.2820236-1-quic_varada@quicinc.com>
 <20240703091651.2820236-2-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703091651.2820236-2-quic_varada@quicinc.com>

On Wed, Jul 03, 2024 at 02:46:42PM GMT, Varadarajan Narayanan wrote:
> cpr3 code assumes that 'acc_desc' is available for SoCs
> implementing CPR version 4 or less. However, IPQ9574 SoC
> implements CPRv4 without ACC. This causes NULL pointer accesses
> resulting in crashes. Hence, check if 'acc_desc' is populated
> before using it.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4: Undo the acc_desc validation in probe function as that could
>     affect other SoC.
> ---
>  drivers/pmdomain/qcom/cpr3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/qcom/cpr3.c b/drivers/pmdomain/qcom/cpr3.c
> index c7790a71e74f..6ceb7605f84d 100644
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

Should the same fix be applied to other places which access acc_desc?
For example cpr_pre_voltage() and cpr_post_voltage() which call
cpr_set_acc()?

-- 
With best wishes
Dmitry
