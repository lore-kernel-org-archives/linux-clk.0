Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC42E645
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160786; cv=none; b=Soe7GX/lpcsFrwOoROC4aiaB40D4Ew7XNdJH1LjuDIIlyErTjQY2W7wz6PbQBYaofN9QajoVDalgK7xYnyrypIcjP16902+B+Iln69VymlJ09Ha2ZD1dr+8yMKGoagItCByaLLp/ItFdTcdWPMhdzX5aa6rAiC4fv4ZgSiTaJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160786; c=relaxed/simple;
	bh=QmJIRkoJvSC1+X5XmHnKi501SEuHKyJrim2KrRQ9zFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SurMOzOXFU9E2qtbBWWOuqji2B7OZ0lSw+e/cCQXBbolGyqu4GMOi6u5Shweh/3hGMFDZlLfqY+FMuo5dCOb+MEUIp7ja9grWRd86jxpoEGyJ9p/zUwZtVsJL2CGcHXlwXhmKNHyiWi22wKMBjArvdslP93WfLgKD0ImP40/vZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmulR57Y; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmulR57Y"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-481188b7760so1126215e9.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 15:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770160784; x=1770765584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUf/+8BbxtoTRhkrLvjqMjX8iWnPM8A43bKR4Om6EwE=;
        b=HmulR57Y9xUwS++3m+y6PRPK9V6NDonO8k4I/xV0TO/7kiLFq/Ho2xjzP7ooDhG1x6
         zNrKEc8JT8gg2oAu8BFBkpGwe8Yp+RZ+276wce57FVHksEzTY7GZt99hckbwwlqHFAqX
         Qr0QdYOBAVgYE+jHjHngwJd1sK/FWDyhQWV1r/F0+47xqyAockZMF4KUNW5ogbpGZWJA
         Lq/u++bVG0v3C+9GMq/7AJYl6sgrjsg5dBwvQNYsNWKc8A9Pi7YOMrYT+dNM1xxzhR7H
         pgqke9AEg/gSWwmTyEoHE803g2QYxtaV3aCC9/vCP62alxSliLmVqcnlrPUi/1Cf4T/7
         +tDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160784; x=1770765584;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUf/+8BbxtoTRhkrLvjqMjX8iWnPM8A43bKR4Om6EwE=;
        b=ulEXNBfBrQtsXLglXJHNoJMINzRR807KInSJrEHU5XRHt0ecgMGv2MhvBeRWBBMPfK
         lSuSqOVRkbiLsIHNjfMOFlb8GrhboB7AwzA2F10Wo05lf+POMgsHZjqhWNiX+WVWyVFT
         jcjejEB8Tn41qwVJvkoI3tCoTytZd827JdjgukgRGg4dSmptQg2xE04T5ALgUdlqFhJq
         ieA85ugDuH0LSXy2i9ykPhmxhKxxlmDZ563PuZtztWFjitQXkrvan3vkvqK8eDG0NjTP
         nM3VQB6SMKHmXhTYvzwzWbLqeP88yvSWc25O6XS8r+cWkbMIbMgF2FqHcVPi1Prv6Iyg
         rFdA==
X-Forwarded-Encrypted: i=1; AJvYcCXUOsDS1dYSw8FXvQruHsNie5OYviCzrcsZJeZir1Xi0V0eU2OGiBbMzgvyoV1qhi3tldcJNRXiGR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPOe/1fCnXXJGtItICym8CcQteIOfO+FL5+CMddK5kha3L38B
	fiCBzoi4VWlDH2X2vcp19qCuPNkR0dGInPB+/+sOqpUYwpno/b6+UWsInXMPRa0Mxnk=
X-Gm-Gg: AZuq6aKmDWKBVcMR6UzsWBAOKJhky3XO+CIU9WNym2B995BJVFtW7nD1emFYm+0ga2t
	Afp//bwYOs9zL84/HUh25YH/UqGGbn9yDdj1rKBeQ9GuOAJtZvSnqvQAB6IS/4MEEnHXo8W+m1l
	Z/kTxd6Fi9y/X5E0vLblySD4F9t9h2qKQkvlcFggZe9EXkFxShHPagQZwTyc0Cm7Y5KuE0ltYdX
	127auX70ojhynhq8tv2cf/zFOFGJrPsab2BYTmDErExeQYgGsTyMYhnJsKJ7RmGVEfEvE7Jj/0D
	i1yEkROz+6j1nk1oGqbHH4qUv+p/oXFwH7vZTswNBouiSh9NLiFalKZ0MOIFyeQJkcUDs4Gk8dv
	9eI6/Xk2xFmQWjqlG8qg7NxkIizxOmYPU/t3KiI1Z2EazQKeL8nte35ufeODbc216rop4WVYqpe
	YXgYXytRK9PG6kdMQ/EO7ql7DUjXpSjQAL622sB3vyg6ZbjWULal6Q
X-Received: by 2002:a05:600c:1c17:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-4830e930f73mr17628865e9.11.1770160783238;
        Tue, 03 Feb 2026 15:19:43 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483108ec315sm2221095e9.8.2026.02.03.15.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 15:19:42 -0800 (PST)
Message-ID: <0c3acd1c-5860-4819-9b36-6935137deea8@linaro.org>
Date: Tue, 3 Feb 2026 23:19:39 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom,sm8250-videocc: account
 for the MX domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <gfDLl0QXQ6wHp-p_Lm8sRAgCea7hCkOH5OWeF2Rj3rLMllCVIut5Je7AqhSNCTptN0w13hXwkQvP9rjH9hNUHw==@protonmail.internalid>
 <20260201-iris-venus-fix-sm8250-v2-1-6f40d2605c89@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-1-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2026 10:48, Dmitry Baryshkov wrote:
> To configure the video PLLs and enable the video GDSCs on SM8250,
> platform, the MX rail must be ON along with MMCX. Split the bindings
> file in order to provide separate file utilizing MMCX and MX power
> domains.
> 
> Fixes: dafb992a95e1 ("dt-bindings: clock: add SM8250 QCOM video clock bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
>   .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
>   2 files changed, 85 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
> new file mode 100644
> index 000000000000..341d3cbb7cbb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sm8250-videocc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Video Clock & Reset Controller
> +
> +maintainers:
> +  - Taniya Das <quic_tdas@quicinc.com>
> +
> +description: |
> +  Qualcomm video clock control module provides the clocks, resets and power
> +  domains on Qualcomm SoCs.
> +
> +  See also::
> +    include/dt-bindings/clock/qcom,videocc-sm8250.h
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - qcom,sm8250-videocc
> +
> +  clocks:
> +    items:
> +      - description: AHB
> +      - description: Board XO source
> +      - description: Board active XO source
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +
> +  power-domains:
> +    items:
> +      - description:
> +          A phandle and PM domain specifier for the MMCX power domain.
> +      - description:
> +          A phandle and PM domain specifier for the MX power domain.
> +
> +  required-opps:
> +    items:
> +      - description:
> +          A phandle to an OPP node describing required MMCX performance point.
> +      - description:
> +          A phandle to an OPP node describing required MX performance point.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#power-domain-cells'
> +  - power-domains
> +  - required-opps
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    clock-controller@ab00000 {
> +      compatible = "qcom,sm8250-videocc";
> +      reg = <0x0ab00000 0x10000>;
> +      clocks = <&gcc_gcc_video_ahb_clk>,
> +               <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>;
> +      clock-names = "iface",
> +                    "bi_tcxo",
> +                    "bi_tcxo_ao";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>,
> +                      <&rpmhpd RPMHPD_MX>;
> +      required-opps = <&rpmhpd_opp_low_svs>,
> +                      <&rpmhpd_opp_low_svs>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index f4ff9acef9d5..8676c7e22b4c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -19,7 +19,6 @@ description: |
>       include/dt-bindings/clock/qcom,videocc-sc7280.h
>       include/dt-bindings/clock/qcom,videocc-sdm845.h
>       include/dt-bindings/clock/qcom,videocc-sm8150.h
> -    include/dt-bindings/clock/qcom,videocc-sm8250.h
> 
>   properties:
>     compatible:
> @@ -30,7 +29,6 @@ properties:
>             - qcom,sdm845-videocc
>             - qcom,sm6350-videocc
>             - qcom,sm8150-videocc
> -          - qcom,sm8250-videocc
>         - items:
>             - const: qcom,sc8180x-videocc
>             - const: qcom,sm8150-videocc
> @@ -128,24 +126,6 @@ allOf:
>               - const: iface
>               - const: bi_tcxo
> 
> -  - if:
> -      properties:
> -        compatible:
> -          enum:
> -            - qcom,sm8250-videocc
> -    then:
> -      properties:
> -        clocks:
> -          items:
> -            - description: AHB
> -            - description: Board XO source
> -            - description: Board active XO source
> -        clock-names:
> -          items:
> -            - const: iface
> -            - const: bi_tcxo
> -            - const: bi_tcxo_ao
> -
>   unevaluatedProperties: false
> 
>   examples:
> 
> --
> 2.47.3
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
