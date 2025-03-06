Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B1A1F5845
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255839; cv=none; b=jdCzCVcm1h+g1NVTQgkIT140s+EyDsAUgdTZgVU0sbbrez8i0gRbLR9gbaH0qwZX9AwsxzhRe8+z0UgcUmV0Ej+BlW9ZAVvveO3mheMZVuX/iosinlCkfMlLIYHCLoRsYuA+VW30ws7MHulLsyPVg5wSTv/qvpPHnzip775bRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255839; c=relaxed/simple;
	bh=eYHRpoGMbEGwPMptizuEYfx9VxESUqNfPyr+BhppZYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liu+rW7cw13ajCEiUVp84adI0rbGNN5fvXXDwETW8L5BFkn9qQRoU7Dq9fcgXCoqTVrdEpsE8VpdxWrdxJlRyrGf8R6yyNatpR78bABlpRI+3TdQVxxpTf/eNKJ8WyIjekHNPUc/L7kZ2uPYhlP/c3MAGpiuTXinWruTMiMHO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w++c08qH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w++c08qH"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5495888f12eso557308e87.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 02:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741255836; x=1741860636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lXiXH7m4bW7beAtDaeOppbANkLDTvV0BWddr1dN36Q=;
        b=w++c08qHzu5asHISohwyZH16TnRlJQMrE5DyPs14ENnb7BJezhusMneceSxxZ5ppB3
         bhSw+JIyj4055Tc8jpbKq4g3R/ytCZYWBhfINvpCHsqiOprHD7o2gngSpn8TvrogJZvu
         pmHrlZfAzYFsB74k1u65q0DdpUVfr1RKFotOc9E1zR+1VpEFtMR89rdb6v1m1NK+TXOu
         uicjB0Sqc6n1jYGajTUN2q02c0f5YO1+A2VmrQhYa0UL6bw6yKP+CRdJcuS1Ed1u3tzH
         c/2CxJLBtIj3IgKjw+LsuBXxyZqZv8RCgto2nqqsOrufEZp2OWnBPiCiVBvKcyfs9RXv
         Q/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741255836; x=1741860636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lXiXH7m4bW7beAtDaeOppbANkLDTvV0BWddr1dN36Q=;
        b=XVK9hGueRdw0qTW44w4Mg1FzIK/2d22+Rg1niy3AUqR1nrIyyXAClK6WhrFbE05Ei8
         Kjj0fl123j1MTXrHWFaCzIRms0qo2T+JP+3KR6BMDvn2tNlUQpl7C+y2oNVjpoWODf5X
         IJyJm1tUSDzmdv3cIAiZ983tbcoEkei+NcQ22aBhelSH/0BIYZuMVeeCu6RiIbv7Ty6a
         RUNQGGa9w1zD2WqUq4/+62k0vRksDPK2eQEIZDgdAzNPgZQIbl0BFnHBXfCxNYACi0Xt
         F0786hZi9x3T4aLXhunGjusjgJSwyy1o/HJ5vOqux6gmDbsFlbwkfQ2ehAnPl46zUvxG
         Fiog==
X-Forwarded-Encrypted: i=1; AJvYcCWgleOaDQeCZfmPEr+FUxnWaFmGFq55KmMPLRQafuk8hBAeMqlvaqEYqg9Qb22DXKVaesxNvv2bXEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDn/yMgrhJObdiMUQ1rxV4zBZi/D6GSk38Xie3x6a/9CJM/znB
	+AQeN4L8BE0c4K8UojywsF/8YU3C/zunK/He/ONEZQ6p8SJW9jtSNITdEzgdlTU=
X-Gm-Gg: ASbGnctKxOcuDI/OgvxvZOJeqnJYE30spSyoqxidZWCjW0XdveWqBrZBAiNccpM8hKE
	hxUKYB8YAAMxDOQIaPtKEdKwDXw3c2N8DatWbvCXCq5h1jq3Clf2aHP2kKt1ycVN/Gx9jrZLlQp
	LM+OLECzHGx9/IzwahqDNj9aFXV0cvM2K+CZkRo/6u7pAhyKW1wbNZeUKhNaPXs4bK96J2lq6vq
	HLqRmQIglGgAlalCpshv/72Bo19hTOxj8JMUsPRucN9bPCuiZ718SQA1dhKt+oKB0rMuLBkRx1w
	12FUyO9rubI4znkJEJT5aI/LQs9z05Bgrnn6R1GLrxNsRLn3kUsvR+Y1BoaPvlSK9HxVhWKZzx/
	wQCwyD1q0cA3cmj0rWVEZ7zyh
X-Google-Smtp-Source: AGHT+IEGoBCXiFknPijPVAnfPhY1JmrMAFB6C3192/jP8Nr//KDRez0P/W0L5K/UXtmr5uC8I7tOXQ==
X-Received: by 2002:a05:6512:1094:b0:549:4e79:d4c0 with SMTP id 2adb3069b0e04-5497d383257mr2057776e87.53.1741255835620;
        Thu, 06 Mar 2025 02:10:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae580c5sm130034e87.70.2025.03.06.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:10:34 -0800 (PST)
Date: Thu, 6 Mar 2025 12:10:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom,sm8450-videocc: Add MXC
 power domain
Message-ID: <mboqw4on22m24njo22r3xajjkgmyobynv5qdx4yhbblz5lekw5@xd6xkhlrh62w>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-1-0cd00612bc0e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-1-0cd00612bc0e@quicinc.com>

On Thu, Mar 06, 2025 at 02:25:33PM +0530, Jagadeesh Kona wrote:
> To configure the video PLLs and enable the video GDSCs on SM8450,
> SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
> with MMCX. Therefore, update the videocc bindings to include
> the MXC power domain on these platforms.
> 
> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index 62714fa54db82491a7a108f7f18a253d737f8d61..737efc4b46564c1e475b02873d2dc124329fb775 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -32,9 +32,11 @@ properties:
>        - description: Video AHB clock from GCC
>  
>    power-domains:
> -    maxItems: 1
>      description:
> -      MMCX power domain.
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: MMCX power domain
> +      - description: MXC power domain
>  
>    required-opps:
>      maxItems: 1
> @@ -72,7 +74,8 @@ examples:
>        reg = <0x0aaf0000 0x10000>;
>        clocks = <&rpmhcc RPMH_CXO_CLK>,
>                 <&gcc GCC_VIDEO_AHB_CLK>;
> -      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>,
> +                      <&rpmhpd RPMHPD_MXC>;
>        required-opps = <&rpmhpd_opp_low_svs>;

As pointed out by Vladimir, you probably also need a second entry in
required-opps.

>        #clock-cells = <1>;
>        #reset-cells = <1>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
