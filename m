Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2F3644CE
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 01:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489889; cv=none; b=O9BNxpN0C9U5P+nSw9z2hLDf6ZM5OzUU548NskqiUfDwoo0sKYj+5klTSYfUroAaqbyXi1cxD8IVXzxCTnla7Qwr6bB7LZnqIaEuFEcQSIoGP9CRqhA4SxbpUX6rjFsRkTNhyV6Kc6XdmXUOlqoM5WjVrk2F74OKQfHcVNHCw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489889; c=relaxed/simple;
	bh=rUxcPY1pKjNKkuCXrvvt2Y64QqdkwyCUDmgJEVlUu1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo9fha4dxUK7xcIKvg0CWbG0XJPOLbgCHKsGnP4FjvwLQov3M3L4DQGqS248ryi33suWC9VCh/K0xxu+gehblya5WiVQsyb9elNldpXZSkXW5IbV3QsesX/aJu85nvcG72iOTwlVz4A4WIDxrUDvZWriqaoclIfJZLPastuCHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0jzwhZ5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0jzwhZ5"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a277d9c5b2so85507e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774489886; x=1775094686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66PFHV45L6JK0kry67ATm2uMaTr448PNAnY9DrkuAGQ=;
        b=Z0jzwhZ5VCZrEG7aMHOE4DuQCvbcopnNUuw4YMLPimt/BcEk8EoX/LXUyktCv8NB+f
         tOPnRNvvs+MGYUOuVVgORuBdbL+Vze2oYzeqmXnigPByc/iTnG5rG41bErWgcXzY+vIW
         hgli3quiszUd/fJ5qLfaay6B3QnfhEsr7BNDaIujQ7a/YF0YGfwUumAXqaD+//vqXQqR
         P66T8YMsUfyMlK7x8U1a5Il3fyurLF9l0a9pCpSYa5EigUyttaK35Mjas9UOOPCJB5Wb
         3OBirHB/rMQXctCp4aaTIQQRjPGHD1OhWZFWyncuQF0UNOrn2jcP/tNPnIdXFEID39K5
         /mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489886; x=1775094686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66PFHV45L6JK0kry67ATm2uMaTr448PNAnY9DrkuAGQ=;
        b=Uj+vfAQFIDcTNQVmcN97FvE1E0vzvh0AYfPAgTQ89Oud4pd9R6ioyGsb9BUIgusb6H
         YeZcQKP0+eNHZjQEDYkQU1N0EJS8SaX19s5gc7R2baSG2hhoNhIhW+PpXpX/kVOFiZ/5
         IBcd3f1SgihTOpPlB70s+CkPi+bBaNQ5A/zeMwIiTHbuo2ACgx/C5GpPCznpylIpSviK
         /vvJuqNyelNOhOQAsDoR7Oj/w5VmXCXg71IU2HIJbXBJaCZZYH7o9y45VvG24A9xdNC5
         kIM9cduOqq0/Sc26+2meSbpZaKGknPwTDC+PEGuEbBB1kQZ4mPfTSYXNgLcnMnXVm/s4
         To/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE2AEJrAu058eUakG6PJG4JesLxUoHJBtru3nG5EhQJytFU2RX1pmWdM5FOuTi8Vv056VdBDKPzJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqp6h8nE5j5og5JyXcRG+6S22z0G8aJ0ta6CO5MDl9RsSy2ULs
	Jv/YxqR8JkkHXK8w7dv6Vrl6UkjTIG9X6Yr9OOjeV349UcwZ4xTI4hjUXn/BZTQCapM=
X-Gm-Gg: ATEYQzwbA95/gQG2TJ5OemYtSFugX+IF4NCgvxNEbzB1i580UcYE2yfSANc8bR9l6Ig
	VkwMzZlNUSzsd6aSMAv7TKRp5YBsFSUKDCwUD1wDeD9GphsQpWCC/jQOZgD+Rz08N7lhxOeI5RY
	oS31oRbmftMZHjJpTCNfM8zszHFGV/zjOMCGTlFx7TxUeHWY1RGs/m2Z0LrH1TcLDfEMjo1kU1i
	CCVgwEKZLCz+IfrV2VEnI/MjMK5tSOUaADZSdU+PwiXW1TSbPnsRM6UH2VqgfZjO1+LUKnXR3YE
	ao+UXaKyWIHfIz6iNx5sUJX80H6czS8hcg/xtYr41EhOuVQqDhxjzA74E+FKGUynbv91izkBrWx
	QWzJp/uBNkb53VsldSMv930Tv1W3vosGefYTZDLECrvKG1FxsflJfcnzbPRbVO3xe9XJWfNBMxp
	JyqIu00/hV6XowQW6VZAUQ2lOI2DxutLZDXZ1EDnNj6NWoV7r+W12z+bK09EQVbO1o9U5lT9Bvc
	nHULw==
X-Received: by 2002:a05:6512:33d1:b0:5a1:2ec0:7442 with SMTP id 2adb3069b0e04-5a29b947c2emr1087597e87.0.1774489885671;
        Wed, 25 Mar 2026 18:51:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063ef5bsm252287e87.17.2026.03.25.18.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:51:25 -0700 (PDT)
Message-ID: <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
Date: Thu, 26 Mar 2026 03:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
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
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 03:28, Bryan O'Donoghue wrote:
> Qualcomm CSI2 PHYs support a mode where two sensors may be attached to the
> one CSIPHY.
> 
> When we have one endpoint we may have
> - DPHY 1, 2 or 4 data lanes + 1 clock lane
> - CPHY 3 wire data lane
> 
> When we have two endpoints this indicates the special fixed combo-mode.
> - DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane combination.
> 
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
>   1 file changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c17b9757b2c86..f44138f522bba 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -148,7 +148,8 @@ properties:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
>       description:
> -      CSI input ports.
> +      CSI input ports. Supports either standard single sensor mode or
> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
>   
>       patternProperties:
>         "^port@[0-3]$":
> @@ -156,26 +157,86 @@ properties:
>           unevaluatedProperties: false
>   
>           description:
> -          Input port for receiving CSI data from a CSIPHY.
> +          Input port for receiving CSI data.
>   
>           properties:
> -          endpoint:
> +          endpoint@0:
>               $ref: video-interfaces.yaml#
>               unevaluatedProperties: false
>   
> +            description:
> +              Endpoint for receiving a single sensor input (or first leg of combo).
> +
>               properties:
>                 data-lanes:
>                   minItems: 1
> -                maxItems: 4
> +                maxItems: 4 # Base max allows 4 (for D-PHY)
> +
> +              clock-lanes:
> +                maxItems: 1
>   
>                 bus-type:
>                   enum:
>                     - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>                     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>   
> +          endpoint@1:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving the second leg of a combo sensor input.
> +
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                const: 4 # Combo is D-PHY specific
> +

It's unclear why both 'bus-type' and 'phys' cell argument are needed
at the same time, they are equal and thus one of two is redundant.

-- 
Best wishes,
Vladimir
