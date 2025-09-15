Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4387C1B4F09
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933939; cv=none; b=hbWv9NojkATD4sAVt+0NbE9qn0HElmMv5Rgh4x+Nd2xVborm4i6xJXy6sf0us2d3F81BB4WKKdbQVzlQUFmT8Rxt7tBK7Iw7YTpXqHJ1LjwGXtkEGHlquYiw4PZeKvT/u3MkJLQyExnwzF2nNGnIY+2Mx26gk11CY6+dRO4Q1kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933939; c=relaxed/simple;
	bh=tEh8ZoBXLUGU5jPXVKCduCcrrcA3PMn3JN5BnZgScxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQ0t6B7R/YFNHSHWFipJCbIkXyWVrqSJhMY+IE2jkvnzuetmkldQdwULXpEMdciRhdd1REX/nJDERK6/trRWz61J1yJREuD+X0XcyHt5eF8ALA1qKUeIR6Q9rS9tJ/k2OiKpOI5bvHA3IpJDTLN2/t0DqGCMyOEmu8gw4Wm9Ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQn4rFQP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQn4rFQP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ea115556b2so775657f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757933937; x=1758538737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAynPQhGGigAoLGUsNG/nP7nnU/F6joYqW8ReXsj3TQ=;
        b=nQn4rFQPF/cA/sB5OdFIegHt/pI/AP0qLmMhFzE6cR6xnx51Y/7rdtOIKXcDMqVfyo
         CE0EYzSakJxW/LsbT7yABwHReSF69ooOb/oPuRUC3oyJHLRppo3Rqmv+o7cbrK5HY4PI
         xH5SMqAsBmGqg+BwZdvt1LLjwwE+0s90uTg68wmJ//aQvrt/P8IS09JFZeDADnTUDm61
         6qxRviUyNxzTc0AxjF1L/uZn6CVBYARQD1S4jOXeFuTk5LPQdfH2ZuaF4icWJiNwMCe/
         HZP9TxKtkS5ar1kDQqFx5WK4+sd5OPUa9+OfGYCwmNP+23xouVYm2bjLX0IxtvS16oib
         i9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933937; x=1758538737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAynPQhGGigAoLGUsNG/nP7nnU/F6joYqW8ReXsj3TQ=;
        b=HU1DgyUwhwfdM13Drngg73TxXzYR5lZYu3qArw5BI5pMqGKdAWnIQAAt9vzB5onCA+
         eR4EgANVwSQs4Rjuk9SxSdV1fUBoifDHPLtAXIDTMRiIoYdUQt4VUFHcGSUuufJcrpp2
         mGrlJp83ds45AtaUbuojoKEs5h++w9BJaxGUJY0FFA6k7Rgig1lYOf1V8tGKE8w8FdeN
         tEl/v1nIn2SZsQliz+dnm+QwWAvuX/pnRUzztemCXizAxhDENHNuOr+svGMtslV9tkLz
         QQrb5Z1iqXRmIxIN6al506c78XIvjAZvCYwHsAlCPkEg8ZcpvUPGrLuVOZ2lSI7xGTlE
         MlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfvA+uGH9i/bWi8Vcw98Cs5FXxuwKEp/BXjiO5MXb4ReBwfd/73V+RyzPmwEc2AAdm75zED+r/Mqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzayBa/eeZFAazoBWifYSGffZJO53ZkVY5K9jUFpJVS/eOQIxAq
	tqInNYxOPwjORPvGos9icrFmIn52O9zC4R1D8JU36ClXSfSH5G5QeXIPhNLJi7aYEs0=
X-Gm-Gg: ASbGncuKeEgsCwOUlfxXvXyMY3AvVoNcvxgOAX1XzB84lBUunc+RDheOlUHoOLDa1m6
	aiZS6xGMByng6CXpl4AucZfMUumAXSzQIxeSfzmkr/5dn5qO+l7Uz03Qdtsiz0pTXX0qFr+5Uwp
	ylKB2L6ma53d224I138GXB2x2PPzyOpYKlx2/QGxeWTNOonoNNQ20DZmNC4/LbcUgNU8424fCro
	gHTUESZqIVH/tAXImNZgDsHEIRd7Vsx2iaEQUFBb9GkW5Q7E5Wxmp+3JwL+CWtO9L9yFxKYl+dV
	GyzHNA54hwTRG1KSNWMsxd3OaWTsGqc5X85PvtyQX0AM89Soh6rq1OM4uYCzG+r7y9FtWWdhGs3
	leE49l5maG/kb/o2v+oBPnxJhYfzZoEU4btsWzpfUebqBfBHQrDEKRTNdxW6r4I7X8d47g7E5EQ
	wlTsjEThXu9t5hUz5SFp5/18NE0w/HYQ==
X-Google-Smtp-Source: AGHT+IFTNWcYzpONk7q5sHZJPcB+MjCfusTYtLZp44gnfW+zyeIpjyoAejs0bsdSiNwXO1ddWHKtJg==
X-Received: by 2002:a05:6000:2b0f:b0:3e8:e7a6:e5bd with SMTP id ffacd0b85a97d-3e8e7a6ea8amr4633702f8f.36.1757933936590;
        Mon, 15 Sep 2025 03:58:56 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01865ff7sm94729955e9.2.2025.09.15.03.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 03:58:55 -0700 (PDT)
Message-ID: <d965949c-a7a0-43df-9bf1-c1232fc7e38e@linaro.org>
Date: Mon, 15 Sep 2025 11:58:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <EAIobHjo8rM1e0LwqDqaUllC0qjV5ElMMhk6KgT1oNnFt_-k7ctM2_6kym9OjEtse5o4pOFM7yCkXgrSGRZhuw==@protonmail.internalid>
 <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250829-sm8750-videocc-v2-v2-2-4517a5300e41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2025 11:15, Taniya Das wrote:
> Add compatible string for SM8750 video clock controller and the bindings
> for SM8750 Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../bindings/clock/qcom,sm8450-videocc.yaml        |  5 ++-
>   include/dt-bindings/clock/qcom,sm8750-videocc.h    | 40 ++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index fcd2727dae46711650fc8fe71221a06630040026..b31bd833552937fa896f69966cfe5c79d9cfdd21 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Qualcomm Video Clock & Reset Controller on SM8450
> 
>   maintainers:
> -  - Taniya Das <quic_tdas@quicinc.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>     - Jagadeesh Kona <quic_jkona@quicinc.com>
> 
>   description: |
> @@ -17,6 +17,7 @@ description: |
>     See also:
>       include/dt-bindings/clock/qcom,sm8450-videocc.h
>       include/dt-bindings/clock/qcom,sm8650-videocc.h
> +    include/dt-bindings/clock/qcom,sm8750-videocc.h
> 
>   properties:
>     compatible:
> @@ -25,6 +26,7 @@ properties:
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
>         - qcom,sm8650-videocc
> +      - qcom,sm8750-videocc

Shouldn't this be qcom,pakala-videocc now ?

---
bod
