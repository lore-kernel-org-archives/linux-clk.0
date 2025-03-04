Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB51FCD03
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080693; cv=none; b=ui4v3SFdJunUXfv6OyJc9iLaKdJouE+jcs1i1tG3/2lpnNo11wWpIotGnVfUnI/nNOYxQ+iOcm5fiNvMlv2s3PpPVAE+B3+TPSDn6x3uYNpe3xi5w3ELor/YGrprT1qjSSc4hT48h5tlPFad6qOaVi6rSU94GijvMUF0zO+IwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080693; c=relaxed/simple;
	bh=f0m1CDKNfTuQsPCxO4ffsoS1wvQEZPAKQ0P61rR00WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXgTPqy8QvSXhGmpsmusUrhQx8zZ9+s5PuT19boBuay98I8A/fAQeEX40t3EgjseSOkiAwmHDo5mabqRRxzLypse1gusjL36DoHRldihG4JDgUgtLGCq0DJSLJbkNlX4rEuaEmjicYQxkBSPvK8Ml/TEqhylWN0JYJqX0iyjlis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iq5OVPHh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iq5OVPHh"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso34882035e9.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Mar 2025 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741080690; x=1741685490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjiqFuGa9IcB3oeyaig5ZQnZ00t+YOxd30bANitLrmQ=;
        b=iq5OVPHheceJRwXMmBBkWDDIXePY4+nTw1w9RIzOx0lk0PlDX+s4ip4ggj//wjfVSq
         YxCToq93c18sH85js9pNLENi1Iq5eHYsdJTgm2EA6y2sote/PwTqx3r6oBgtl9V9Emro
         KmNMeZRf/L6qby8ICBoYQ8IONQy3fgwc1g06elkAPlbi2QSPv8Yijy1rPtarygNbZ2yy
         adGNCVVTFpRLPlIm2xWrqHZHnFv106L4ji4dlH8Ssc0XJbW/bQZpnmDfgHkE4gVLNR24
         Xt+JG2q48PpEddvFvGmTh4RLaJtbcmTeN3yW3QUP9MrlXlIFb9aSUgFIh2/sepMt2jm2
         8qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080690; x=1741685490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjiqFuGa9IcB3oeyaig5ZQnZ00t+YOxd30bANitLrmQ=;
        b=WkryR7RgAQh8aGSo+/QgK1OeUyw/iybb+7y+cGznL0xt86BuN8zhvs+34p0v3IzaMa
         SlaCjsegGO0+hKGV0l5y5P02n23Sqmwqxe1zpqsZHVAcgN3DvN69chPphXmky9NsVXJV
         TniqCEXuPPvU2J3eHR515/52Fh86RIY3D6AH9vOs1BGUH8dinKYy+vc9Ck+X2VNHbTnB
         RMTdlIbzGFzaz/yu7lbet2NdJJoXL3uoDOrej+tMpzSWgQSsTrmEFmRF910+Y9KJMAhh
         DYXkp33IwDEXZ/B+mntvpnJKWnMOO0FvxDzdUXDXjH91996crATTmUda/Qd/n3+lx1tm
         eYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWUnUrlxp9yCOTMOgYcOMNrhr9DRrPJpvnoskupLU++FncnT70i5K7s7HWtZzuCpL6bCyhETu1tXEI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa8hcxwnCHNzdZnENTIeZ0zAQpijeAnMr5LOzkebU0xgJeGXaa
	nnP7IJTg4dmALXZhl73R0sqOLTJgjipsXPZsRCKHUIPofTPUf78wFGAjX4h/edE=
X-Gm-Gg: ASbGncu7Yh9wTLSOUDY9WLzQ5RkJyh+awLyh/aUrD6YuBFUFmfK7m/oN07eYHDT0Tff
	HXVkJepzOBvvVqqMtMItxCHAdRsXQc6YZ/yEGWZ7ZAgjTayilNCCtID0pvCUrm3akAITGm0FXCZ
	5nBYylhlEkDZDmWvthfcdkj9MtgaSiofKq2iC/vPLL0YAuBub4x0RZoRa1/tDpdVn3rllqPPH4Y
	RzHIjntTvLIHJWTagY6jB5o3WpLxDnL+pekVB+qiAP1V4E+Anfgh2di2CnKc7GN+s8BOQwnA3Ek
	aUjshIk0UX8Nm2A36ZrHk7EQ4Ym6uKjNSnj6CHOstrfoSMWfNiuYYTfmv6mOUi7wzEjzH7N98DJ
	pB0r190anBQ==
X-Google-Smtp-Source: AGHT+IG2b8tLFvBTyW6XgxUEsNgYn+1nm37EUJ3QIriKIIZDPawo7iAw5RKC6G9gHRH1sm2cXjjVyg==
X-Received: by 2002:a05:600c:3c9c:b0:439:89e9:4eff with SMTP id 5b1f17b1804b1-43ba66e6b5dmr142345715e9.10.1741080689654;
        Tue, 04 Mar 2025 01:31:29 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc447a0b3sm57631335e9.3.2025.03.04.01.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 01:31:29 -0800 (PST)
Message-ID: <e66acb3a-7805-47f5-9179-1fab95754727@linaro.org>
Date: Tue, 4 Mar 2025 09:31:27 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom: sm8450-camcc: Remove
 qcom,x1e80100-camcc leftover
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 22:39, Vladimir Zapolskiy wrote:
> Qualcomm x1e80100-camcc was moved to its own dt bindings description
> file, however a small leftover was left, remove it.
> 
> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index b88b6c9b399a..9e79f8fec437 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -64,7 +64,6 @@ allOf:
>                 - qcom,sc8280xp-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
> -              - qcom,x1e80100-camcc
>       then:
>         required:
>           - required-opps
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
