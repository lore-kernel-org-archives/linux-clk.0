Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C001D5AC6
	for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 22:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388920; cv=none; b=GTfAWEzC/Q4OjaSF3jGfUVu0eDTPjUm1cvSfYxSOg2c848GyH0mSrBvZ2hK+45Fa1yKLN8QHQ6r3IeFCgxAd2/FqWGsLR2Z+nZgJVh/cPFrns6DqmBzcg6WlDlQjdXyk64jdxj/BNSOvlwrDt0s7qc/fTzC8JhyaL3/R6NqbVn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388920; c=relaxed/simple;
	bh=VvwhMEH8kUe66+qw0Kg+jfPOcaLaStC6shKRZDsBkeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utEEve6oPzI50vMQYsbKzpIxB9QotDD+eAmEARCH1YIlQd8WMkszfeMJSmYu9HCKp0qvAUfA5cf+IkFUsHIcFI5T+Uphg3HEkErCr9RAgmK0HYVUR11Vo76XTodaxvyfr2KRPEal+61sKF1ZoVTkGMwGTZm94n/U6dCi+vVv/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OGSMpGgc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OGSMpGgc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2438736f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 14:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734388915; x=1734993715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgHEGOs3zRnlIJDFA130oT6k9XjZTGA0yhruWXfFN4o=;
        b=OGSMpGgchuPODsKfOcoonTqeww+nA1zSDPN/yel6xCPgB2tT+DXNsxgJDxs5pYK/7V
         6dhcCdQgyiMfuT4Nu0V1DhaMZ6G3qRLyba7UIVb/4CnKxWK18n0uoZX5hZQjS47e+vz0
         092iPrVRGdATGWis7PimB6e1wdRAQ1AY2yvLbtVDbpWNgVDf4Yo6I54bIEZH1fiQrYch
         uFn1RiTTyMnJcxeNC/TLN+KeTHXT01ma8pW2vLnHg3mAhk0rTKYuJUE5pysoa1tkq5jI
         WAElUgck1HUnYxYSlSNDR5VwIiV7inxgR9mgxmyOSK8vRWMFCAn64MsOoxpr2MgtWlzj
         jC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734388915; x=1734993715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgHEGOs3zRnlIJDFA130oT6k9XjZTGA0yhruWXfFN4o=;
        b=L8WF/TdargMoCK7io6MtgcPjMZpg/bcSGAn6BBVc45fEl6fmTUXUVH9e3zLYw/RzCk
         F3CSoz/8TXOtV8B9SY64bEPTFM49oYryHHGyhjCXl9lEotbcDSLitVS4MNpk+8NdroLq
         5k1FgNz+1VyOQP1XVxZ5i+088oKzexZS1RCSC97Aufa6vTzSzbaYPaIfWCiJzKdyRZKg
         bW1zDsgU9urjVFGnyFVDjK/nCpQ4nuSJMPl9TaOCcHBqLN99KPa9V+K2DOfZswfrInUE
         rMUlEwuVdSHsmgihBcwFXHidGaKohOlqeAp9ffyy/SjpN5BzrqRms8lMR/o5LuoHAk5u
         jDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTUfdteQWyDYKo95rYur2RsuAz0EJVNhCLV+gIe+nCcQRUpjsvDRO/tfY5fsRPIkBPVsypu1F0TnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0rrgqI6SN9/cyrS0IL/WINVV0jzYQ0etbfweijixJRZt+CZ0
	5FuBh/T1yX8yFJBPNTkcsYHKD0pk900q+SZzBluJad0P0hCt2im4VwDB/seZxJc=
X-Gm-Gg: ASbGncu/QQgbo09+3gc6c9mnRjBnVeM4CrBpHXmo5H9hxOMQRxOddQ/+gOGTcur5IKA
	FVHJp5hMCiQOlibZ4HC1sTCvk3i4dTTmhLBB9OSL5Y9p7vPocX6MjxJo/fJlH20yv3gkAg9Bzhg
	h3kKZ4dHsaovpfihmDMMCIIawKjPL56FC6OV4oZGRZmhObfPPHs6DCxUkZwi7AG9+lLN3dLq0g3
	Fy5VauaD0OZNM/Mr0eK7GscTC+VybohTJI3QrMK5oEGX/+xM5hmMYLLdtmaYzCLKNoRkg==
X-Google-Smtp-Source: AGHT+IERxSebFar5uEuhs3YGXdu/HdonjGhSKASUlK+LCSz+kd4iODulYlgl5ClEwq5A1hDOA8kHew==
X-Received: by 2002:a5d:47a7:0:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-3888e0ae608mr11291437f8f.27.1734388915425;
        Mon, 16 Dec 2024 14:41:55 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8047151sm9190330f8f.66.2024.12.16.14.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:41:54 -0800 (PST)
Message-ID: <56f606b8-35cc-4bbd-af39-106277530928@linaro.org>
Date: Mon, 16 Dec 2024 22:41:52 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] media: qcom: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-11-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241216223019.70155-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2024 22:30, Richard Acayan wrote:
>   .../bindings/media/qcom,sdm670-camss.yaml     |  72 +++----
>   drivers/media/platform/qcom/camss/camss.c     | 191 ++++++++++++++++++
>   2 files changed, 227 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index f8701a8d27fe..892412fb68a9 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -31,21 +31,6 @@ properties:
>         - const: vfe1
>         - const: vfe_lite
>   
> -  interrupts:
> -    maxItems: 9

I think you've had an error squashing some patches.

---
bod
