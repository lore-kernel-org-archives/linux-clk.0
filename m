Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0524E16D9CC
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 23:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467591; cv=none; b=nL/k806SCIPTjTy7FLt6/1OKuxXs1tX1pIeS98NewgzgQflln5CyqYFQX6+r+8ksG0pvUmiteAFf/g4K5E1nAQ2xILi6I5XHVb4E4vSlEEaKnOHekGjhSdpc3GHLGu+pdCgC354QX7WWAsFITrnumGzP7Ixg7BcZ7ePtbS340aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467591; c=relaxed/simple;
	bh=AVt6aayRlVI4u4lXQ38g5LptWQXU1wjBRjWmLIjh0dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSTcxjgIk9kkBZoke91EDzZEUQSbl1b/giF7FlvZ8r8+lMKXtr5Gfm0D3zbGrpOZ8jWCVaPxvq+syAmsNEXKLOX3L7p08RG7yzK9jKyEuHRoEIxmpT06i55eKOy3ekVT0cJIVbD/0fU1tYrBw4niqE5FgV77b/3MXWNA9OXlG18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qnpszk2Q; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qnpszk2Q"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ef298ff716so11085301fa.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 16:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722467587; x=1723072387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9FwulalC5BN3JPzCPlj/3jn9GulBvv3L0dsk5iTXac=;
        b=qnpszk2QQOZ/cHgGoav0IhbsV4+vLWas5tx+xzksFslz8Msf1bmg4Pc9+Ph8XMGeGo
         M4fwLA5F6ayPI3y+YMNsqXbHOezzwbl8c9kk44N4ZrsTXmIsxw94GIMj4N3AgkaWwML8
         juSQe1GCKf1erLSJh0pwB4X+4+F2FFAKvG4PbXpbEZCzYCxI7uPyYezEXv7bmFX/g3JU
         z1dSct5bPFkru/bTl+ysgcBFY8EZ8U45yjzpSmZbOef7eTC8HaeqMJTU1mX7zEr306rk
         X/XnAFmGy8iwsyrx7Zn6srA8LKgybPhx385sxx1yTNsUEAPpk67SIXnW6Z9bi0L2yGXt
         Eq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467587; x=1723072387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9FwulalC5BN3JPzCPlj/3jn9GulBvv3L0dsk5iTXac=;
        b=BRDkUKLchd+BH2XXw67ACsaAT5kVuBzHE6jft7qU+0P3cF7VO6U8f6fSXRVYuXzB/4
         SJiRd4e0QMZx+B62IX5o5zmHRXi/uluni69VnyPeXUaP8sMA2ofGuTIYQ+wpPHIaBIG5
         yqcZx4zvJ61OnIlo9lFGyXwWbGZ3P9OiO8erh7IlZGCmTpbRGUVDd8rZsyXw5LznAJNz
         4YLMpEXRza0Mjs41z7HyrGYoPCNfAJSlnELKpnXBa9kZ1a5pDgmIpEb4j8RObATEOi98
         jk4ngdRiEuXhoJSc3ls1Ibz10mVCmppNqQDmW+e8jg/GL4VxXTBCqNU0QoyP+I8x9h2H
         jf+g==
X-Forwarded-Encrypted: i=1; AJvYcCU3wLBtP4DUbSMQi2i09bFdMgL9eesXmmDftz1AMcF0BsPOLURY7lJW+7f+/ROR0Zh+ogWJZoqgyFyr/88UKckey4gmP3v/BhyS
X-Gm-Message-State: AOJu0YzoeKFC2INJqwL1yeZg0rMHQMW40m0VKZ3pDtPHNGACEvkAJWyE
	DIhLOdeiQ9oWkAyG2WwavQPlfBR+sTtezg1GUoAya4ol/y8SK5mhxZ1JLpDKNpc=
X-Google-Smtp-Source: AGHT+IGqyMlEYX2+sT4G392f7X7dB6d41xG6FEU9f+59xOrGeXr7RGxTPSasSiLCScH1hTs87g/jJQ==
X-Received: by 2002:a05:6512:2809:b0:52e:9beb:bc09 with SMTP id 2adb3069b0e04-530b61af9eamr137194e87.3.1722467587196;
        Wed, 31 Jul 2024 16:13:07 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530abeefd04sm671995e87.121.2024.07.31.16.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:13:06 -0700 (PDT)
Message-ID: <0062e300-cfbe-4d6a-8985-04699ee1d467@linaro.org>
Date: Thu, 1 Aug 2024 02:13:06 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] dt-bindings: clock: qcom,sm8450-gpucc: Add SM8475
 GPUCC bindings
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 vkoul@kernel.org, quic_jkona@quicinc.com, dmitry.baryshkov@linaro.org,
 konradybcio@kernel.org, quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org
References: <20240731175919.20333-1-danila@jiaxyga.com>
 <20240731175919.20333-6-danila@jiaxyga.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240731175919.20333-6-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 20:59, Danila Tikhonov wrote:
> Add SM8475 GPUCC bindings, which are simply a symlink to the SM8450
> bindings. Update the documentation with the new compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml | 3 +++
>   include/dt-bindings/clock/qcom,sm8475-gpucc.h                  | 1 +
>   include/dt-bindings/reset/qcom,sm8475-gpucc.h                  | 1 +
>   3 files changed, 5 insertions(+)
>   create mode 120000 include/dt-bindings/clock/qcom,sm8475-gpucc.h
>   create mode 120000 include/dt-bindings/reset/qcom,sm8475-gpucc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index d10bb002906e..608fe63fb43a 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -15,8 +15,10 @@ description: |
>   
>     See also::
>       include/dt-bindings/clock/qcom,sm8450-gpucc.h
> +    include/dt-bindings/clock/qcom,sm8475-gpucc.h
>       include/dt-bindings/clock/qcom,sm8550-gpucc.h
>       include/dt-bindings/reset/qcom,sm8450-gpucc.h
> +    include/dt-bindings/reset/qcom,sm8475-gpucc.h
>       include/dt-bindings/reset/qcom,sm8650-gpucc.h
>       include/dt-bindings/reset/qcom,x1e80100-gpucc.h
>   
> @@ -24,6 +26,7 @@ properties:
>     compatible:
>       enum:
>         - qcom,sm8450-gpucc
> +      - qcom,sm8475-gpucc
>         - qcom,sm8550-gpucc
>         - qcom,sm8650-gpucc
>         - qcom,x1e80100-gpucc
> diff --git a/include/dt-bindings/clock/qcom,sm8475-gpucc.h b/include/dt-bindings/clock/qcom,sm8475-gpucc.h
> new file mode 120000
> index 000000000000..2ba622290833
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8475-gpucc.h
> @@ -0,0 +1 @@
> +qcom,sm8450-gpucc.h
> \ No newline at end of file
> diff --git a/include/dt-bindings/reset/qcom,sm8475-gpucc.h b/include/dt-bindings/reset/qcom,sm8475-gpucc.h
> new file mode 120000
> index 000000000000..2ba622290833
> --- /dev/null
> +++ b/include/dt-bindings/reset/qcom,sm8475-gpucc.h
> @@ -0,0 +1 @@
> +qcom,sm8450-gpucc.h
> \ No newline at end of file

Please remove the added symlinks.

--
Best wishes,
Vladimir
