Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75668625
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626868; cv=none; b=ULj29kNgv48tvRKzGejvQkHy50oBc/hEWZCXj9l8TTTwikhmeo25qeEwotnkzj/c1hUZP9hxAMqay+AO7iFLL6aJgYYGcCswo2kmcucVrVPCOqsDTad5OZag4WyU7bezVW3TvIX4I9Ox/0Xn5Rjqga120OvtOcIHJ7H4j2JLvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626868; c=relaxed/simple;
	bh=HPaBKR3U80fvQSWgEj+y8B7ck4aIug1oSsSLAqE/2d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=If/ZR6y2NyDm3JqXkinmVMrO0C+v8qdhpekkImMk1u0hslAQbgDw0QO1LpAHLf4BRluB/RjA0ciUOwFAFVhUx2menC/kf4DqxJyS9QKax67Ggp3njtlsrztbJfhpoEVaSeGkcxnHdw8G59UkD7Ww0GdQoa8pJhQo+1G9kUdQnrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swu4qAbw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swu4qAbw"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a12c2c5b10so631969e87.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 19:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773626866; x=1774231666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpc22jmT6VGQLTKw1GYmfyJRKbbmD8YhSAyUKYDuoLA=;
        b=swu4qAbwCyHfJnb0idTa86iBrORMw1XPGnKWKZelBm88cGruQtM/VRr+45wNGWsYDX
         GIeHZhDWop1hf/j+yRZ1F7SmBezs1URR/DjrMtXcyWOclIZBkpc1S5BdpymGJi0R/3Jg
         6cP/ZQJOQvv73oOt1NCUX9YGpxFVNOgKhM3Gzxk1BQ7YMy/btKsSJAHcgU/6fJwig7NG
         TdSpknAIx28+3NXwba/8k/t0ZP4w0a0xxVJtrBx95dSw5maAzHJyITZ6aZHhcgeKjvJx
         /2YkvGo1YioHJWJPpDUkVb+8YaxiC+v+QzkxiC9o4VbZFM3tb7cvnYtCwpUwq3QsTX1k
         9jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773626866; x=1774231666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpc22jmT6VGQLTKw1GYmfyJRKbbmD8YhSAyUKYDuoLA=;
        b=ShM3zFRMg47mR5MAm9bc0f0ecbDdHCGLX+equRILzJ73RUzfWwd0dGugSS4h2htbnM
         vfAK4+2r8KtllD6zVTdlGvJLjRxd1rYZA+bIF9yxk2uaWFFHVEvGhqroiNONhNSiDybw
         48c55uUw8A5+jKDNPRpFYV07w4Vl9TQYx9bjdDzYYZYmA1Aj2og8P8ovYhs2CPZ3Wk5j
         +h6hHiasiXpNBXuZDe6+YmxAlBe71JOCftmGf1q7hxjfcwWibyxi84QYrvAUAvrWegky
         x356GELas/oxMdh3j3+4oUeygR4v1ncUqGXQE9Uq5198CPP/1n5xf4V6RZ7z59S+qR8U
         SbFg==
X-Forwarded-Encrypted: i=1; AJvYcCUq+YDsln8l1P8+XGLXz5CKl3s7HA/0OTcFjtkNbrzoZHiAzDn1jwNuKqDoOniJjfp/Xy76qh7OIRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+m0du2bezfdjmmJe2E2S9i8kxoOJMDJKvIO3mlarCg1HCbgjh
	0mSrUa4seGhIZrjHKo1R2I8Z7Itt+zqP4tKQzZ+/QFE0LbUHBwRaTt4A8rQUket066c=
X-Gm-Gg: ATEYQzwDEaySzE26a5f5o99Wz2B4Nxkt/d1BDzVP0TlXxOiVRxDH58uzVwvImHf1DdA
	YoPtAf23fAbcxrSTdKhRb8+j7xB89Io+Dd/wQQko6enxH4wHSzgUjt7W3EoKJVKf3nq5BkKVTIf
	99UA/NxWR1e7azsAgv7rx3ajtfyszRhd4IIoe2qAbyZbjUgLDkAt8ycM1afHKQ076F3yhKqnaA8
	N04l8F4vehgr7vBWPurp5cqACOQ4mRx8hls5kt4EKo/w+CMJDprNEMBgGSbKKwwgHSfSKGLTyHu
	2o5T48vxKK+acCKmUKiar86kXbxef3iL0du5+Dt/lOKPRMF2dBLpsIBF/d02umHRr1ZHGGS4A3u
	GsZ8Ln5T9ba3wEnA7NL352/fJvVn9vuZrJZIwcsplSYKfloEsbAeFtYfT2SR18aRo05aOzShzKp
	T0oschgAHAgN/q0fEd/3kYRE5fC92bMQ+vn15/2QZj0RrIs+zWaM4BbMCFdDvQgbNAKZjTdMILL
	DPmzA==
X-Received: by 2002:a05:651c:546:b0:38a:8602:71df with SMTP id 38308e7fff4ca-38a89769958mr19446821fa.3.1773626865535;
        Sun, 15 Mar 2026 19:07:45 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366676sm3121084e87.71.2026.03.15.19.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 19:07:44 -0700 (PDT)
Message-ID: <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
Date: Mon, 16 Mar 2026 04:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/26 03:02, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
> 
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.

The new proposed CSIPHY device tree nodes should be outside of CAMSS
device tree node.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index b5654ef71bd89..5442f981baebc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -43,6 +43,14 @@ properties:
>         - const: vfe_lite0
>         - const: vfe_lite1
>   
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
>     clocks:
>       maxItems: 29
>   
> @@ -130,6 +138,16 @@ properties:
>       description:
>         1.2V supply to a PHY.
>   
> +  phys:
> +    maxItems: 4
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -162,6 +180,14 @@ properties:
>               required:
>                 - data-lanes
>   
> +patternProperties:
> +  "^phy@[0-9a-f]+$":

CSIPHY device tree nodes shall be put outside of CAMSS device tree node.

> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object
> +
>   required:
>     - compatible
>     - reg
> @@ -175,8 +201,6 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>     - ports
>   
>   additionalProperties: false
> @@ -188,6 +212,7 @@ examples:
>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>       #include <dt-bindings/interconnect/qcom,icc.h>
>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>
>       #include <dt-bindings/power/qcom-rpmpd.h>
>   
>       soc {
> @@ -233,6 +258,10 @@ examples:
>                           "vfe_lite0",
>                           "vfe_lite1";
>   
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;

Here 'ranges' machnery is unexpected, the new proposed CSIPHY devices shall
be described outside of CAMSS device tree node, as it's stated above.

CAMSS is supposed to become a consumer of CSIPHYs, see phy-bindings.txt
for 'phys' property.

> +
>               clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
>                        <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                        <&camcc CAM_CC_CORE_AHB_CLK>,
> 

-- 
Best wishes,
Vladimir
