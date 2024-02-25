Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9EFD2FE
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 21:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894817; cv=none; b=G6x5Sa3Y1V5tlKVLuH2D9kF6dvXDv9O4UH+EOMd+ZrK1Hpc+4MF5ZQO9VnnMvHDDzvjYztQxzOFIrrNvzawf7/hiW7wB4ynkc9lgA0fcH+k9s+I793iFXuT2zU6GW0EJSU6lN3MlG257tSJjT6V1B8zyrb9uyl8C3hneojOKC5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894817; c=relaxed/simple;
	bh=RGnNJIFh2RlxUmTf+Jzt1Dq2dHc/VwgJ5UcUdS+OMfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqowgWk7ahc8zAq5eylaBynaYAnU2IAcsMCWDR2ZNxvgDNdx/RKCknoX2ZWSuW6A4cKd5uX+RYjmt0W0grJtaGhSgU/rpGeQUR8Qt1AoT8NVjs04GHiiQCoj6kDiYx9QtedP7okGfimKTDk0ZJ4MJDJbEBQ6bvpk9CD4w2E5Jfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NE9GVINS; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NE9GVINS"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c15b7b36bbso968017b6e.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 13:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894814; x=1709499614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VTc8BgiqrwORqW1mws8ASxivs+vKldj5oWJyp0R6vLI=;
        b=NE9GVINS2qFWfiUWKyBakvO4wSHMySBRMVSl/MVDHDdNLpNtzJROtAt6+GAEqDList
         dykR5RVt9CnLS3MmZhTCkXA03N+Rn2RvPMYCwdRLaLf8fBucaHfPPxAlP2MqUcKhzqsk
         syPQNUFDv+HX/78LHiZmwzca56SLwgpPpiDpVCblAoX03h2U3fSKh6mFUWLquq8bSIeq
         h6wNAgdvgkBUflvgyjE86qgoo6TkSWqELDAvHHSKYV5F7vPIGH7by2enLNcURZiaqZUa
         SLMoc55IDiOmm0CMAk+QRCvSRSMGRzNQkdSZnnYMvyf+0xSqLmWdNhM+BwyoeEak+sFu
         FJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894814; x=1709499614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTc8BgiqrwORqW1mws8ASxivs+vKldj5oWJyp0R6vLI=;
        b=Sa1fvjVdk6f2WUnsK2brqBbCMzHhYQODbL/ROGI9jnmgirXsXsdMI1kf4WNrPEJZXq
         Qpa5XE6S5lCxjfh+/iXTGXk3Zd0FM35Jpo/7DClHK8EtndJGqpj+48sYTXScG3ao1gR8
         Sts/TktL7WSvBcSMa4v/MefkKWSA111F0ppLPSbs/y2jyAGmSA5S4//bX1KPAA/aMY2X
         rzhd4jJnWAPWM865D1Nxe7NQ85jaJdXFj2SLtmS0uzunwuKLcYsk+YbS2GU3CiwS+c5h
         OZ3/YZeh/m42EzOEcoak/J6Rqt13TF6lnevSa0j4OmJ7UMuFWQJTQCeAdElVddU4Td/4
         Urfg==
X-Forwarded-Encrypted: i=1; AJvYcCXtpi7pjcIS8+1W0H2gtxENV8yWNk5XLNKchQCRLAq81tpiGS1oZQJz1s60k4NoeG67jd/Nfzrnhegf05kwuwK4jeriYj6dYbps
X-Gm-Message-State: AOJu0Yw29/78/bhcJ7vzztklki9FuQxFyRtIcmSCujRmrY86aDD3Pk6s
	HjuNYr9ZWp5jo41WlJvHQbMtcSr/dNv3YfVo41zs99YyQ+B7dtKWrGtT0O0D8mCeOPc0E3yrq24
	Pg2qLWrGqMPEaY5WreJAPKb21auDbmf2UJ2wl+w==
X-Google-Smtp-Source: AGHT+IFdc0B7r0WWDHCZB3fKTckGL+wqd/Gdd8YziT9x9zVc2VZGhoIvTE0GCz3w3kcIFq43L0vVQvGlTDRZpVyRJWE=
X-Received: by 2002:a05:6808:2085:b0:3c1:51c1:f4ee with SMTP id
 s5-20020a056808208500b003c151c1f4eemr7018711oiw.48.1708894813963; Sun, 25 Feb
 2024 13:00:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225-gcc-ipq5018-register-fixes-v1-0-3c191404d9f0@gmail.com> <20240225-gcc-ipq5018-register-fixes-v1-1-3c191404d9f0@gmail.com>
In-Reply-To: <20240225-gcc-ipq5018-register-fixes-v1-1-3c191404d9f0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 23:00:02 +0200
Message-ID: <CAA8EJpqX5kwiQdPsSbJM=-7hd6mqwOSw_=7zyWOWQOi4=QYFJw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: qcom: gcc-ipq5018: fix 'enable_reg' offset of 'gcc_gmac0_sys_clk'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 19:33, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The value of the 'enable_reg' field in the 'gcc_gmac0_sys_clk'
> clock definition seems wrong as it is greater than the
> 'max_register' value defined in the regmap configuration.
> Additionally, all other gmac specific branch clock definitions
> within the driver uses the same value both for the 'enable_reg'
> and for the 'halt_reg' fields.
>
> Due to the lack of documentation the correct value is not known.
> Looking into the downstream driver does not help either, as that
> uses the same (presumably wrong) value [1].
>
> Nevertheless, change the 'enable_reg' field of 'gcc_gmac0_sys_clk'
> to use the value from the 'halt_reg' field so it follows the pattern
> used in other gmac clock definitions. The change is based on the
> assumption that the register layout of this clock is the same
> as the other gmac clocks.
>
> 1. https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.4.r4/drivers/clk/qcom/gcc-ipq5018.c?ref_type=heads#L1889
>
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry
