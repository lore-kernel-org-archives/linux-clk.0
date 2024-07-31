Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D516D9B3
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467658; cv=none; b=GJzorf0/dLD74isCmVGpNuwAhmJ05XZqnMog7ICIvHZ0nf84pU94EUvCaO9/+5zmOdunECiXNYLOj/fKNityNoATlH9icJTLfa240OMWE7p28hf+b2myJXx/D9QKr0DA00MkJGmSABCzfA2kwn2CrsL1DVFtDC3wOti7VjvQ2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467658; c=relaxed/simple;
	bh=DPiJW5NDDeSxy3mCpzAv8g5OyaHdfPhJ4OV9wn1T6n8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joIt46OlI49I6kVfCIV42cTpLxXvAPi6+DfbhWDtL3+ymSHc0IId2o2vfV9eqHOh7NVCEMMVnnD57ESgVJlslD2Tswm3MRLs64JkJxVAxfoJ3MM1M3D6ZdpwFFjTJXxrKF1DrwO6P2OXNbfxFTsQh7UpbV+Fg5s7KaDR8DMHxiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tlCGFgbQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tlCGFgbQ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef298ff716so11087171fa.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722467655; x=1723072455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVIkEiUFmcZTwfLHh9VWjF1Hcgwt0wWahOboNMKilr4=;
        b=tlCGFgbQTUOOrOgKtFLianXD7V1/4YpHi+iZz6g0n0H6w7ltmPKn97Iio3ioUY6vIT
         +g8ePpMGUie6vaQJoOTNmHhN40HLCBsA2hbgRHEPkse4r6pST9SZPRL7vNjW1lBVI06M
         V5snSYkCFI91T3moajxvw4EBO2X/dXEna0ivSFVkdEZi7QX9ZWexSwYAxe/mQDkfMTnF
         lOHzvKIpQ+irPFQCc54HU9s4IJuIwayE0taH3O0V6u/ahHxizBgeNzkmzw9Dx9798EFz
         v4bHB6t0Y1UuZCUGcGIRVzuaEIKCc7Wr/PKW9ntmyaoZaC9hlXM+8rlqKq5SIrEOdG8M
         3RxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467655; x=1723072455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVIkEiUFmcZTwfLHh9VWjF1Hcgwt0wWahOboNMKilr4=;
        b=wzg1ip/S9NGaSOAqX1UAxaDiL0pVDOIMKr+VgFpn/4WOOHIuex0aMb1OyESPEp37jI
         GqzrEHvPtsJ8EpEsnJGoju3SFUb3IcUg0wzuJwap16UZsCckWSgeKYC9Z7IFBCwGHtH1
         Ltk3NJ0RaZ7cOM6YD7AzcbOujE8icFA5RZKuaH1lYdDBfEy/OtSGxaOlg3YaKVQ47ZqK
         f+wCux0N0FRiLxaKM6Q+dbwIDx4WTHEBMikM/2tdOZw2uKpcjWjK4mPUBuEyvsMuncvk
         jxyb2srKP+MTcuu32llQ0qE2/Gw+1z3mjwgZex42ckwySDRmmbsyC0eUoeCN8lsBOllK
         qeIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnjvxuwYRrK3IA/cv+RFrsZsLiUyHj7EeTPsl8y63t4D+6bE3bUm9T3Aq6QzonOWGS9pPjlbWTKpl83QZ7Z8cLu1Ayy2LVOX4E
X-Gm-Message-State: AOJu0Yw447WzvsUMmQJu90Rko1i9vSU1FBkgMVHwVTGRjlUDTHhh/dX5
	+bfcHMfCaC+B8QMOqNjt+/gUJN0GACTfXxjMg4Dy0We4RrlhhMdKXNZOZoKHVWw=
X-Google-Smtp-Source: AGHT+IHOKjhruKtYSCVFydIC4h7W2fXEpXqqwH79gYTayKHSYhc6hJN7Eni8LmzhzkPjTEvMQZg+qQ==
X-Received: by 2002:a05:6512:39cb:b0:52f:c22f:32a4 with SMTP id 2adb3069b0e04-530b61f7818mr142469e87.6.1722467654641;
        Wed, 31 Jul 2024 16:14:14 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530abeefd04sm671995e87.121.2024.07.31.16.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:14:14 -0700 (PDT)
Message-ID: <590f4fec-24ef-4a1b-b1c5-eea67ec04def@linaro.org>
Date: Thu, 1 Aug 2024 02:14:13 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] dt-bindings: clock: qcom,sm8450-camcc: Add SM8475
 CAMCC bindings
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
 <20240731175919.20333-10-danila@jiaxyga.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240731175919.20333-10-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 20:59, Danila Tikhonov wrote:
> Add SM8475 CAMCC bindings, which are simply a symlink to the SM8450
> bindings. Update the documentation with the new compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 2 ++
>   include/dt-bindings/clock/qcom,sm8475-camcc.h                  | 1 +
>   2 files changed, 3 insertions(+)
>   create mode 120000 include/dt-bindings/clock/qcom,sm8475-camcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f58edfc10f4c..2dea246882c3 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -17,6 +17,7 @@ description: |
>     See also:
>       include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
> +    include/dt-bindings/clock/qcom,sm8475-camcc.h

This change won't be needed.

>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
>       include/dt-bindings/clock/qcom,x1e80100-camcc.h
> @@ -29,6 +30,7 @@ properties:
>       enum:
>         - qcom,sc8280xp-camcc
>         - qcom,sm8450-camcc
> +      - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
>         - qcom,sm8650-camcc
>         - qcom,x1e80100-camcc
> diff --git a/include/dt-bindings/clock/qcom,sm8475-camcc.h b/include/dt-bindings/clock/qcom,sm8475-camcc.h
> new file mode 120000
> index 000000000000..45444160d465
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8475-camcc.h
> @@ -0,0 +1 @@
> +qcom,sm8450-camcc.h
> \ No newline at end of file

Please remove the added symlink.

--
Best wishes,
Vladimir
