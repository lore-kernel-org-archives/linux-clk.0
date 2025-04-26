Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2B25B698
	for <linux-clk@vger.kernel.org>; Sat, 26 Apr 2025 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745676216; cv=none; b=b/oqS+D0PG+VL38RGAacACQfKXMnZY3DB7YTEXfA9S9sAxVhVZuoIoCYlyMxkhGVEDFf3KL/0hW7zbo2eaX9HRh1PCNJV81D8ncG7n0RmuVplL28giyApl4zlSTc72aoqlGV93O+/J1VET5oSxIqJ+pniwz6ua/j/CCeW3zzVTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745676216; c=relaxed/simple;
	bh=+/XlGJ40QyLJ1yxLqAsymj/3uMv2LvI3xGqt6JlJRkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GR7mVyuuWiDDlUClxRTMOjVAPEkgwroSnogs3o6bt9VV9xdw1i9nNPbQhS1VzrL46irq1bQ+dfhbCGzR7oA9Zxi+bimr+hUbYOeACT4hyC1XQuhRWrfwOLXbSordrJWj0vhBIhk28nUi4M9XWrxm2647bGwYfltIRyYXVGOEIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axSbnKP0; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axSbnKP0"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d4ff564c5so502055e87.3
        for <linux-clk@vger.kernel.org>; Sat, 26 Apr 2025 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745676211; x=1746281011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw+DsU15ptDiXJLxLZqHIzjz8lENUeO28XhBBnI/KzU=;
        b=axSbnKP0wzkqrG+zVQ4JMEx9nZm/UAJm+bWflfONPHvMKBEks3/n6M8P3IHkF1GTsD
         yRUGnayeerAJ4He7XxhCsDK+FWoel0bpLHpfILKT3nBBdzj0jenAfs65uYGGo6hHtZxS
         Ns6ZJ3SOC6pEvCd4Z8yDsAmIsbtaiEDyKWo3bSC4Xex9D2JN6nEhIk55D9+v3R7f5Xxw
         RrSqqMHpXjJXLBokbDwlOfpynUmtriP5IEjuUJNW5v+ZXM5tL7AzsmsDQz2MMLevGRuh
         Mz8K5kcC5kYuvM0U+zQDIhhqQzr8qDKj5CgehznFpK3/XCUhJJVvjypAYG4p0JADtGXH
         ZF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745676211; x=1746281011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vw+DsU15ptDiXJLxLZqHIzjz8lENUeO28XhBBnI/KzU=;
        b=il8rVYT/y75TPB3Kmcn+mRCpIsLN8NXTOZpjeZdEzYbsi14h7P8ONs3ZLJOXlvBzJ2
         aAD1LkHxjXXXuD6oObNDAiPiIy8kSCxuwGhHhh1uY+g4dVjmGunwIJ8mlZFQYbe87ZTJ
         RUBDj1FZABi2BYqjECwbAtDBv/y/hBZCfhdJMmp6T/zWklJLirZN7+vDOy4ewbwXr5ZE
         U4kvqa0kkmOxTbWqH7lm/GhdTrkomHA0ulXRrInaNCXap9xVXQBcdiSYQxhB0KFxQGHH
         GPZPbSbU4U+2Gp6oBtbfw+65Oklh6F3LKX+XuQGKwZbV8eeUE01xIqrIlXaTAbYZYzRS
         5wuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi0IcVERWtG0MkztrzawCr4WHE4Hfmh+McI9P7rZFRYRVfjmZNuy/nHoX8w6XrZJn/tPxvvqG2FX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaNvLCUxlQ7lJCvCuc3cTuayOeGocX1URHDhhWKPyYti6OovT2
	YmH4m3SfiAzuIJaambPvwm2aDPbslPmZ0CqN/UyPAYzhf3wSQ9pBGthoXU/gios=
X-Gm-Gg: ASbGncvrToTNsQhLxrH7+G6kXJfQK+bKnZ//SFPypp9aGJ2eXuGlDIOvMtXGHfbB9nw
	DM6hi2+2DXb4qX9OGJy5inEQEs//yh9HlF6VMwXleq34KT7qaGE2EvVQQndHG8q5zX1eSYJlWrB
	COxS9Vd6iQ1AIgbEy1oUGWohfC36b2OMSOSuUgg68H1m645uaYrty8GUpxvswiJFjHPb/+vYjTL
	dt1FE2M8PXMaMvvI9OepgRoiY4KxqG8zcmqkfJkEDaO6R68aClQ5sxcqnio1XnP2CPJ229S8eHf
	JMDGbsS2HLFLw5B/R7xXXq/8J+laGWAnKgmGXsnFG3mdQmyZZz3ZiUXHwdUHp/ITx8KHQ60iFg0
	Z0wTsi5L5oM9sjd+YVz7FyGUr1l8y7A==
X-Google-Smtp-Source: AGHT+IF1Ip7CcXoeKnygcwDIVwoNCBJjRB68C/jdSo6GKg66tIbe4aPB/aVZwdQypXq6CJVRBvutGQ==
X-Received: by 2002:a05:6512:3d9f:b0:549:8b24:9884 with SMTP id 2adb3069b0e04-54e8cbd53d5mr523947e87.4.1745676210813;
        Sat, 26 Apr 2025 07:03:30 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2633asm1000722e87.10.2025.04.26.07.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 07:03:30 -0700 (PDT)
Message-ID: <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Date: Sat, 26 Apr 2025 17:03:29 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
Content-Language: ru-RU
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 08:42, Satya Priya Kakitapalli wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 +++++++++++++++++++++
>   2 files changed, 246 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
> +
> +maintainers:
> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> +
> +description: |
> +  Qualcomm camera clock control module provides the clocks, resets and
> +  power domains on SC8180X.
> +
> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sc8180x-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source

 From sc8180x_rpmh_clocks[] in clk/qcom/clk-rpmh.c I get that there is
RPMH_CXO_CLK_A clock also, shall it be added to this list then?

If yes, and taking into account Konrad's ask for GCC_CAMERA_AHB_CLK, it
implies that the new dt bindings can be omitted, instead please consider
to add the 'qcom,sc8180x-camcc' compatible into qcom,sa8775p-camcc.yaml.

However still there is a difference, qcom,sa8775p-camcc and qcom,qcs8300-camcc
does not contain 'required-opps' property, it might be an omission over
there though, please double check it. The ultimate goal would be to get
a shorter list of different camcc dt bindings.

> +      - description: Sleep clock source
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +
> +  required-opps:
> +    maxItems: 1
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +  - required-opps
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    clock-controller@ad00000 {
> +      compatible = "qcom,sc8180x-camcc";
> +      reg = <0x0ad00000 0x20000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&sleep_clk>;
> +      power-domains = <&rpmhpd SC8180X_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...

--
Best wishes,
Vladimir
