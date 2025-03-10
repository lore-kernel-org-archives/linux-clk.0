Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8826D1E1A3F
	for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741642539; cv=none; b=sgosQeVEcMg28sGqIp+vMGLCiL0D/95MGfOTJlvUdFCb3SkTblJuogljTv6IHGGucP0ePHY3KbD0Bte7ke8vGZSS/cVr0+quYOQfJa1E8NF4NcG7/DE83983VU12/aEMuhmzeZdDmOITQI1aE+OpzbT6th5bhoqxoqRJLoUi+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741642539; c=relaxed/simple;
	bh=yOO+kcznc9jGj+Su8RqYwWEA8F6gmuzqRQmyUr/FcyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky2dOELK7NEcwnY4UOS00/V+dnjEOlNjuBYAzXWcX9RmBRc2zt9nP0N97pEU20uXgp0vqI83pBkNGmtttEFzB8SVTVNymaBxPinLbo3+zlkCbHQaYAqY5/IpI5yibjrVikYL3hu3MAk+5sNGctCJoqPNK6K5pCFkPj8Gao6FeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHXsfkyz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHXsfkyz"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54958954c63so692854e87.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741642536; x=1742247336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5nGNIjoZJal1by6jAmqJfEMBdj6g2CPD4ZYPpb59g0=;
        b=lHXsfkyzZMHhhFuKdlZ6wP9rupu1JIYKBC0xy+xgjfuoqoctUzu6KswF6VJMgJc80S
         Qkk4lPXZotV8DR7xv2Utsig4m14df16mbYh/v0oDIHYIOaC6i7wzGolY5VRFTjf3gGDU
         I7Rzgh3HGB0kFPvGR/YtMQvzyC3Y7YWODcvsFpiL9lbyBBLfy5ATQWTjz0FfxHmnM2Ph
         bHG1kxqy7OJNOhLRAdAUVF7b7yXNvZJBrxqI/ca3Oxmfx/xx1X5UZdWc6eHw6TAUcZE8
         +BtSvvYU6uR0KJD7qN+K8dj5mMrVHnGzsL1a8Oa7JLDNIY/fEfNW2CFuQIZ6xk3R3VSy
         7aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741642536; x=1742247336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5nGNIjoZJal1by6jAmqJfEMBdj6g2CPD4ZYPpb59g0=;
        b=Tcyw5gO15oU4x5EnNLwX2kwjRMzwoXInWj5mso7kWOXRicTcQY6vvnflDDyerm9VVO
         SZAI+7VuaKvV/TUQ4+XrCrWfJIICpDMQlFaiV4qNMzZ0lrFLfp/wgNXJJo8qF3t2YYwo
         wYUnTuSYqPl2SxgWxwyfLbCd05xiLVty367UIIxPG1bnj4i7Ic4A8MNLrq7ua81Nd4t6
         v6ivhBaU3UlY9VrX/lieVdVhk29gwTd9/lrTfVypQVpAx8BJOi1dUAv8Uw5Ej8JkHCSJ
         magq7r2EyKMhhcELuSeOF0y+8gsVbGHpg6+FxpK164gmqgvmDUeEi4XQkgOAxE2gQXIS
         Emrw==
X-Forwarded-Encrypted: i=1; AJvYcCU0J741EtoZydT3Xueh83zXFcOD6182VHL7h2czmB+IKYo/+plLpwpmigmiU/RjK6M94UTQVf9EKzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwJ1dp1hsbkAA6xvARlqhGIrVuCbiEtFjRxAwCXHE9D7ki/h8
	Ory60Rggnc6uOReQkft8ilqX0QCnRkC4HOoi8ch6hMhr8ldSa6dWfOl8RSGM+gI=
X-Gm-Gg: ASbGncvDJyeP7nm9+r0enzD792GitAy0uX30A+K0IQt/Pcvhr/g9ib8h4sgQ41jFUE4
	F9c4WoYZs0K2txcJ++NeZMcid2TxPENk/O0M3naRMYU8iP2rqTRdAbpD7SKOMci6CBedZWkJsT/
	1OWtw9QVMCT1IIJP3+8YroVrz8pfVFeC14Ji5jVcwl8+VDouV5EGNA40kr7j7sSVyN8sZzk+9Zz
	xifXcnpSJC2RQk5BJNMe1ltWhQLSCZWXIC7KsbaIKGcYeXB942ao3xG5LKABynXfzs7IcfKHIJ6
	E0hZH9wvw1k0bEMdpajhYIo0Jmx1Wma74+ujo9NfEdOLsjRh40ic2gVTsGh/v7/7nwiJz2v0h/8
	jYuvv+LvQiYMtAomOFJXddks=
X-Google-Smtp-Source: AGHT+IF3UbdFVNzHKttXVepOd/BWp8z+1ePpZ96mJNjgJzTuGPbY+EoLScTTvRSPkloK2EvbHVRnsQ==
X-Received: by 2002:a05:6512:3b9a:b0:545:8a1:536d with SMTP id 2adb3069b0e04-549abaadbfbmr140818e87.2.1741642535438;
        Mon, 10 Mar 2025 14:35:35 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bc679sm1569216e87.194.2025.03.10.14.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 14:35:34 -0700 (PDT)
Message-ID: <7928a52a-ff6f-4705-a55c-8b60fd7797bc@linaro.org>
Date: Mon, 10 Mar 2025 23:35:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
>   1 file changed, 367 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> new file mode 100644
> index 0000000000000..88eeac262f0e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -0,0 +1,367 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,x1e80100-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |

Please drop '|' here.

> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +

<snip>

> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_mnoc
> +      - const: cam_sf_mnoc
> +      - const: cam_sf_icp_mnoc

Once Krzysztof objected to the "cam_" prefix in the interconnect names,
and it's a pretty reasonable comment, and also it's been applied for
sc7280-camss and sm8550-camss:

https://lore.kernel.org/all/087e7f29-1fa8-4bc2-bb3d-acb941432381@kernel.org/

<snip>

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false

It's a smart enumeration, nice to see it.

After minor updates done,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
