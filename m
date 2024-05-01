Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283E282893
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714565223; cv=none; b=CnHWk1zCyEP0V4rV31w8iXPJhqTxz460K1QT2jZIOeJKBU+jm1FunzXmv3nOhotDX3xcEVpzCsIP2W7Na1ypCA2g2b0+K/xyqqoEKPrrL1cQJG0qnypv336zWQ5ZqVX58FmLJiXG9rMYhVOqKOgIKB9yLDP0ByuWnWVp296yqGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714565223; c=relaxed/simple;
	bh=u1dlaFlPJ+AaQyl9OQnnDFMsqcgVZH5TuPxFAlJ8bUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDByjUk3tptBQRIj+TElCLAAiHDKfehBRwJqEba9aE6/flNOyPSPUkgGbe6hwR6rnHjbdMhqenqhTlsAB2KSfESXQAr2D58iX56VwKaljEQD4zflRT6t8xrP4aY20hU/g0Nlz9oyGufntwExXzTfCvGWHORZdgIXWGDMVXWncR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a02aGNCL; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a02aGNCL"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de61424f478so1890983276.0
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714565220; x=1715170020; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mCvDUdkZWf1z1LfPrcItKDo/SV8BQ5Ruhas6l/TQZks=;
        b=a02aGNCLZBPsPZaT8aAzUDLNUmd7BcIv9zedqYB6qHEXSympFfIetGQESk+uZVXfx0
         OSWboePE0B96ENxY+3mgT2uAYbeibeve48w7OFuISq+fvzvWPTmQYY9omctr/um0VRFf
         cKrL2xwLPkx/xWUur/lh9lHjVos5s1DpoK1JnMpFbszxDiNk9VM11WubMHpSX07fN9nr
         sm98t7X1xNEyO2t1Z1dJNgTXRpmmXA33KcCxiNktAIM1zhExV8V7N6yXKAiVw5Yfzg/e
         6JDHzbVY2x3j7/IRNuw/riCCt/P/Q5sBtHtv/KIXUcnkkL9V/mzNMUgtQjJdvpE4LqbF
         x3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565220; x=1715170020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCvDUdkZWf1z1LfPrcItKDo/SV8BQ5Ruhas6l/TQZks=;
        b=IyRpl8SYy7bANElCWkJKVLVAL2jqZVZYtr+RGwoS5kXtg2Pgo8XLLEx5m3tVF/QxB2
         jBFOWwKs/z23+8b2M+rJ4s1V2Ba7BT3kF6YCTCqDn4zFqaNhLXBII/W6SXagg8Yjq+ON
         n/99mKtRXnjES45n7v4l0w1kaoL61Jv6CLExn9ciaID9mk51jgms+dHWqA4iSn/Yq2rb
         Y6Z4HJeVXNCrPjZY5rp0eE79wErLc2VW/A7E79aUb7KD5r3wTlW8QEqsRmFMUQlcullq
         7WJoOigRMjfB34WxvjMtQRj6+QUfrtc/nyH/iT5pBZINFmicJTv/Ip8jKqDHpCwyrsJY
         Yq5g==
X-Forwarded-Encrypted: i=1; AJvYcCVFdsmDIO8XnFwXm7u6PwgbOLgaNnak0MqjiuXt5+GEtfMA8RpzlRr5W9OQqgVgbO+2wDldBiDIUCpFgBKvzK1+XYxL0CGY2m3i
X-Gm-Message-State: AOJu0Yz137zd8G2KOjj9T5zD7MFUu8Uct6JsyByDue4eQfoeGRc+j0LM
	7e9EAVI82TmZVtjtwayCID2MPAHT+cZJ5baAIC2fGn63o7knXHaAz0p5m8AJ4IG6RyjvIldZxgS
	5F07uyZLPHeDOFjkrF6HA0g70pfF12Y3s3zA9dQ==
X-Google-Smtp-Source: AGHT+IFHeR4+6oPbMDpIgLANFPthRRl3FtDwtWeTDKENSgiYemQbaXFo5PkJ4rVesjVGx/goWAJdI8/djjHv/AbyLf4=
X-Received: by 2002:a25:ac07:0:b0:dcd:3663:b5e5 with SMTP id
 w7-20020a25ac07000000b00dcd3663b5e5mr1751231ybi.25.1714565220205; Wed, 01 May
 2024 05:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501-videocc-sm8150-dt-node-v3-0-2c4bd9ef48bd@quicinc.com> <20240501-videocc-sm8150-dt-node-v3-1-2c4bd9ef48bd@quicinc.com>
In-Reply-To: <20240501-videocc-sm8150-dt-node-v3-1-2c4bd9ef48bd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 May 2024 15:06:48 +0300
Message-ID: <CAA8EJpotvs3AOYO3ct=_JabBdYDops4Yfdutga9KBAbVPoZ5yw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom: Add AHB clock for SM8150
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2024 at 11:32, Satya Priya Kakitapalli
<quic_skakitap@quicinc.com> wrote:
>
> SM8150 videocc needs AHB clock, so update the bindings for sm8150
> to add the AHB clock.
>
> Fixes: 35d26e9292e2 ("dt-bindings: clock: Add YAML schemas for the QCOM VIDEOCC clock bindings")

The tag is incorrect. The mentioned commit didn't add sm8150 bindings,
so it didn't have a bug.

> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml         | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 6999e36ace1b..68bac801adb0 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -75,7 +75,6 @@ allOf:
>            enum:
>              - qcom,sc7180-videocc
>              - qcom,sdm845-videocc
> -            - qcom,sm8150-videocc
>      then:
>        properties:
>          clocks:
> @@ -101,6 +100,22 @@ allOf:
>              - const: bi_tcxo
>              - const: bi_tcxo_ao
>
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm8150-videocc

Could you please extend the sm8250 case instead of defining a new one?
Also could you please check if there is a clock (like ahb_clk_src)
that uses bi_tcxo_ao instead of bi_tcxo? If so, we have to add this
clock to the bindings even if the driver doesn't use/model it at this
point.

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: AHB
> +            - description: Board XO source
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: bi_tcxo
> +
>    - if:
>        properties:
>          compatible:
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
