Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6031922DD
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089954; cv=none; b=qOEjOMZLaGDU72lPHc05AE4keeReDIKBIGd6zbUOWZGbcZagWP0nMmvrqBz0xpWQzo4aOCOwh/22I4MiTF/Ram84/qb3fmpLJ/QjPbXPQvnGmN6MWl+fxlG2toS4R3JhBb8a8LeID0rLS+nygGVnswoG/YBYC3gyx6gBjJHbCbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089954; c=relaxed/simple;
	bh=iAOo3qQbFdHRPvpiwQ6URvgLoftj9WyyrxLOyXzy7dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzYBi3ydUCQWDb6qp91M1ckt1TptUjesS2VmVil7Obb0UBtFjiblwyWZKaSqM+gcS6ijnIosc1yvXU/O+ePXVYGimnBuG2th6exnxp0lRP1ip8PVZJ9GkainvzvKuOQ9SxE0BnXrg0wekMYD8y/8+wncKAhJp4/9RS4cPMVl+ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fiNAEZ/d; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fiNAEZ/d"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391342fc1f6so949808f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743089950; x=1743694750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymoLsASUKMBlyvnyVSwfPY6l90pScenHxGprvSvqScE=;
        b=fiNAEZ/d9tALL/K9+gx5dOddzfLq5Ka6+AHb1oYBXgOqvuO+GmvaI5suqkj0y6nhWA
         rlPePQSuOl4Mgm3bIO8kWfEH1OhRa1SHZ9ZfyFveQeqo6XXylGeHbgLgkTafHw5f3sny
         QPUll3C09sHHs0p8HsKSZ5SlIMu4Ih76lzUMb6uAFTmZAAGyCRixOXoPD3PSHekIWqQX
         d4fRPi6GOaRiUWBIhhfPrTDZQ6Gyzmzrz8O/m7aA2ihMkEqM27raNKJYIcmkhv3oNrEg
         oeWQ6rY7ritNZzpPCQadUgqB42Ha3OyZaSRdhiTZ4vqtHsXQS24+Q+d0IG+bXr0wCnlv
         UdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089950; x=1743694750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymoLsASUKMBlyvnyVSwfPY6l90pScenHxGprvSvqScE=;
        b=P/Yjm5iVDhC8hvzOaDOEGMyDxjicvy3ghG8X9MOYlPGvHPyxwowdaaTCc8OK+NFTJb
         qmA4Qs3SPNXICs1UbBA4LBlzJC9AAv0ymJPLjcWF0fztpFTgZBI2GhqwOxGNE0d39iMU
         YlzkTiGjk7DDvyPXDPvvHfv4xxJfBIO7+8pi2azkFpqEIOQSfW5bT5bHBrcUa586ZArn
         BfwgJnbNSgy/7jjFaIgsk5yNEGR/6/GCpm3D7v3z2/LiOl4YXcjsUAhlrwRpY2uUxzHn
         CC2JK6BMuwwsC3VB2QVsNhOQeKvHg1twyNFf3UaA6HyCkKVaIQLjr6PTolhSHqOanIW/
         bcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNh7QTwJpBUgvdqog8u97fZ7Q7xPVDfuTnEaLp8tRA6PBXuyJyEeHeXrE9Ax7jNf+6LBTgt/9NwG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNbfFRUWqHYYVAlJhvkmUZ1ZhM5a2SqckgJiueuMMaAy3GXPk
	TZgIwdW9XCSGDg/j10/h3F3d00L7yCGrsZGZkWQiWfKKUYwZK1qaOSRjdd9OHE8=
X-Gm-Gg: ASbGnctusp/Q5mYpagyVlZnjCQjaIjhVANXYtYgzufKq4skNkeZu2BAsJYAfzMgRma5
	OxvIrPDxVWjVaJ6RR0bA1UrtsC6s8/FIZlgD+96uaKfndtVOnzECxxyJ3EMUw7tpB5xhB7wlTQl
	yl+VtQGqIuK6fdJ7Copghqgp9+aBpxp7LZTOF3h2CS2fuG0Q5wVkTjFfNVqpY8IpQ4q102b4mHf
	4RoeW3v4i79BnIl+h1qRd8RocVeWa28FFUsDz5HSW5Rj3qao4Nrel0GnPXqt+HrFMQScv41tvc3
	houf78RAtGmoIiNEuzpATGYWK7GKciVRRUbR0OUZME87cRJ96E0e5gRep9jmbE8hcnhALWoqlue
	XYsXYIdT0sqYteOxXwLas
X-Google-Smtp-Source: AGHT+IGyrq8BLj3GNTEbMeK2aMER+K+7T12e75iuTsRmZkET3cjw7uq2dfr/7idg5JtEdGKRe48sdg==
X-Received: by 2002:a05:6000:2a1:b0:391:466f:314e with SMTP id ffacd0b85a97d-39ad1741a73mr3848575f8f.16.1743089950131;
        Thu, 27 Mar 2025 08:39:10 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef16csm20195844f8f.86.2025.03.27.08.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:39:09 -0700 (PDT)
Message-ID: <8721c38b-3414-4635-871d-2bd142fd23ab@linaro.org>
Date: Thu, 27 Mar 2025 15:39:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> Move SC8280XP camcc bindings from SM8450 to SA8775P camcc.
> SC8280XP camcc only requires the MMCX power domain, unlike
> SM8450 camcc which will now support both MMCX and MXC power
> domains.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 2 ++
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml  | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> index 81623f59d11d73839e5c551411a52427e2f28415..127c369dd452608e5e7a52c7297b6b343d1c1bf8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
> @@ -17,12 +17,14 @@ description: |
>     See also:
>       include/dt-bindings/clock/qcom,qcs8300-camcc.h
>       include/dt-bindings/clock/qcom,sa8775p-camcc.h
> +    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>   
>   properties:
>     compatible:
>       enum:
>         - qcom,qcs8300-camcc
>         - qcom,sa8775p-camcc
> +      - qcom,sc8280xp-camcc
>   
>     clocks:
>       items:
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 9e79f8fec437b9aecb5103092f6ff2ad1cd42626..883f12e3d11fa16384108434f6de120162226a28 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -15,7 +15,6 @@ description: |
>     domains on SM8450.
>   
>     See also:
> -    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -23,7 +22,6 @@ description: |
>   properties:
>     compatible:
>       enum:
> -      - qcom,sc8280xp-camcc
>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
