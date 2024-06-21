Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3932D17A92C
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005954; cv=none; b=UHN1MJWqhxULbkb416IGKvn7wp9+au1Mlp3+weGCqSp4h95gYnVO9tR5kCPlzdMABaay10D5RwTfG5HbiDHoc8X64XgbFTmSL86CR6FXHw6a+Q8EvvEUGocPqVmGhD+U0ThLhuJ8K5WLRSmqcQQBrgN8BKJJU+TZg3HViJf0Fu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005954; c=relaxed/simple;
	bh=vk/Kc1Mhoj5nmPc+qDe/B8P83iSnOPyVaiTk5PDpqk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl4re/lF3Opi8lLEQQrEosxi9fptHZQ2mZe6y9vRxYDN8wtgnGKkn/WJevFDtzsM0VkF3MAK32WC1r8cYp+aN9tXd4jOyQHl66tYyRMiayr8wBfhkcJJByp8YmtZAPnNXnsFkuYuyfzqGfF48XZyToUKaNfwHLTISv9iHG7wyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=raWQa9YD; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="raWQa9YD"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e72224c395so25714661fa.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719005950; x=1719610750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skFvaEuwTRDxfj0jK4358SnRO7UY8UWxFaZcx0fjpQw=;
        b=raWQa9YDPcd7vWJJcMJfpmm6PeBI3oCoQGsuWGaRGqPuUGfgGK+p2cMxlY4KZan6+K
         PkL6uxvLf7iNpislGXqVMQ/Hn0A5AGUJlsvhO/bO+6XDF+y6kGprSGD40brZskTdb/JZ
         gwdIAsoGUkhSnysxlQVZfU9Yg9BoPE6T1VuKYrd/7enHll8QL49+i//BwEFG8G/1COAF
         +CPKfE98xaOVbvoYUtBIjloHYALHBD//Cl462UNg9EWekSqLWm5ejJQEWYqHYHFTWG4I
         GaxtzwUIKpsJ0qlAldON0x/AmucGCs1SAPcQU3Hvu9aoynEQMIEHOGCSU2/XJCpd9L12
         dykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005950; x=1719610750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skFvaEuwTRDxfj0jK4358SnRO7UY8UWxFaZcx0fjpQw=;
        b=VjZJ6qqkUc5mEMeA8isEzANSujQEi13UnIY/5bUKouFPuPR6SPieoLiEMuybN8+f4I
         jIwzntdpu9Vx5RGATnG8SSfekfV3TzO+pvQNWS0fCSBzcYHPTQNHo/YFXydz9OfNpdqf
         Jh5Bo3S9JP/gq+Nng8UENpfcClDinAmmE+nMspt1ll/3WRI15kt++Fo1iEquO9silWVA
         hfVWOFCIsa8y172UfWuZY+KF0GQER5ueb1l/lIBC8rXVaOML0Cb//HTU1qV7+PlEeFBU
         BYUVs3P2jdW8USIWNru0wutl97G3GhANidLXIerPrpzYhv2fac35qe33stHoTNUW0MWH
         mW/g==
X-Forwarded-Encrypted: i=1; AJvYcCUFuyuoeay97csa02Tkk/PJQo7708M1lsHLl45IFgiOyzGIN4EcBUUBYWFiS1MNvhsTUpZ9YT+YguPacO2j+F0xQRyyeM9cSrd9
X-Gm-Message-State: AOJu0YzHtBKqrm4Wg3/JsjMhpj4waPmJ4lPmLaRCsxHcVacUjiSxEka9
	txJp3x0aF6Ec91xq5xkqHBllD7Z+L2Vm0iLiSzlkHkFARVDcR2CazTGB/dovSqs=
X-Google-Smtp-Source: AGHT+IGFPRTcCB3OrVBmbjXX87fk2IILQ0FFzqYFiC08NLylPPQ+tyD6EMpRvq9CM22EI5WcXc8bkQ==
X-Received: by 2002:a2e:780e:0:b0:2ec:4acf:97dc with SMTP id 38308e7fff4ca-2ec4acfa444mr30105041fa.11.1719005950389;
        Fri, 21 Jun 2024 14:39:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5113d366sm1693161fa.61.2024.06.21.14.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:39:10 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:39:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: qcom: dispcc-sm8650: Update the GDSC wait_val
 fields and flags
Message-ID: <tbslwm4xfknta4ufcvhxhknj3ypfi63spvm5askl2pqmuqssgj@v7a5oa3xfelc>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-5-7b297dd9fcc1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-5-7b297dd9fcc1@linaro.org>

On Fri, Jun 21, 2024 at 04:01:18PM GMT, Neil Armstrong wrote:
> Update the GDSC wait_val fields and flags as per the default hardware values.

If they are default, do we need to program them?

> Add the missing POLL_CFG_GDSCR flag.

I'd say, two distinct fixes.

> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
> index d88eebb32575..2da3c11b0c3d 100644
> --- a/drivers/clk/qcom/dispcc-sm8650.c
> +++ b/drivers/clk/qcom/dispcc-sm8650.c
> @@ -1604,20 +1604,26 @@ static struct clk_branch disp_cc_sleep_clk = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x9000,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>  };
>  
>  static struct gdsc mdss_int2_gdsc = {
>  	.gdscr = 0xb000,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_int2_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> +	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
>  };
>  
>  static struct clk_regmap *disp_cc_sm8650_clocks[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
