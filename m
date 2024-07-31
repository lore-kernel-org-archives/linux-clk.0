Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C719116D4CE
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 23:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467421; cv=none; b=o6147gNBMdE3RUoraD2hGSRCxd6Ly3CRgoqhHC1X4Y06FEKrlnKqWdpNovBfXY1q2gdQpYp5BU0X/od1CDVZP8X0SAh29GqJ9mL2IjQIHcaXVmqpRw7bPJzyufchP9hIdrH/8G09x08tP3Ce8UCN4QPo641AkYJYk3ah2faBnP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467421; c=relaxed/simple;
	bh=CAk9ysRCcF3vskHHnHSmnixeypTkrfG/o972KRWzdMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVpmHLXK/DFuIJ4/awHu5gEG55MAGDluzoAZOdHDRzxLNdPF69pbV5Sm4dUvz3D6OdSh5RPqgBRlrLuqnUHJlmjF+lvFjVghWurXFHNrHfQa9y8VKXMI2g1FctT4HiIsER+MfIW0fU05W+UbSomYUnc4NnUMqxwBKj3F5adv8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H7tgGZK3; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7tgGZK3"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef243cc250so11990091fa.0
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722467418; x=1723072218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CypGwDRORaDBdaeBYRtf5G7bF1/i+g0iKz6yREaWD1c=;
        b=H7tgGZK3QoEi5mHHly4ZS8BVPWpLaYN7yuqmQRkl04hI2CLLu4pqnpxql+6AihoHUZ
         QF6PGATGHQC7A98LqMcYARHKLaNlOEcm16W9EW0PpKnNCY0vxXZ6+gwkQxTKAGOefRdL
         znk0tcp2grzc/uYCsyt7GiEomS1TNbUddXc6uTm8QdKZu3gEZb/7juHVHU0jmZpSNALk
         ebTQ2NDGfOJaMY4WgqbM2vrrIg/+LwvSzONethklQi4c/4heWi95dApqqnWhumHsQUNf
         qAuCZC5ZWxQT5i7O5i4bSc5tSt6OJaP4y1byDEMRQrcYGQQjjFjETJUGYvWehHLTOk+0
         xjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467418; x=1723072218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CypGwDRORaDBdaeBYRtf5G7bF1/i+g0iKz6yREaWD1c=;
        b=dSC7Txn5OgPj4GlIdHymx2h2gGs7R+yjt1vasUof9vbyuvmve/vTrpnySSwwQXmC8B
         vrkHdKJGQ+R2IieEhPJVjAFhjVtdNyEJxXSYuSwTpUit//1+XEFHstdsqZuBJ0H2SjEH
         u6J6UJuvKSlAXYfPZCyM2ZeHbtA4IEuZKGElSDeo8HbADy5Jtc38IbzRAcLbUORtByEv
         yjAOIKRlcVVAhUHJMZ4jxTUP4I3rOMRpoGWdXL8kxjeraWV6JvK31vD3FgRc6+DkcwyQ
         XmE0/gDUl3WrFFPUMzon57mkWPkgqdqbO0C0PwkMLZ/sA6sQStDRsMcs8Eebe+ADgY3q
         A6bg==
X-Forwarded-Encrypted: i=1; AJvYcCUMLFq/rDmySAk1Zv7QCwHOS4Q6ZmMgdPQLALVWJ1RvQy+lF9HN/mmd3B4go3LNk68N086CgGVzLB+qBGFwZoxTXx6iiv+E2FA7
X-Gm-Message-State: AOJu0Yzg8k7iyZtZfvaiiz10OCSfLE54VOc5elHM2zJJ1WQ/PpN0a9S/
	mcadOMy7SxFft4CyE8WlqpgRCg5GRT5NP+32c/wr2uQKvIO4EfABSJjYIWDpvqM=
X-Google-Smtp-Source: AGHT+IFtzNOWKxUx8nFCdmmu5o7DSqCQwuqvKIC9LKKbz4i7GsH5EMsq1GELa1yZk6QUxNV2IHOjww==
X-Received: by 2002:a05:6512:39cb:b0:52f:c22f:32a4 with SMTP id 2adb3069b0e04-530b61f7818mr140798e87.6.1722467417776;
        Wed, 31 Jul 2024 16:10:17 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd12cdsm2388761e87.92.2024.07.31.16.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:10:17 -0700 (PDT)
Message-ID: <0232aa10-5f40-433b-804a-2fff30e8b143@linaro.org>
Date: Thu, 1 Aug 2024 02:10:10 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: clock: qcom,gcc-sm8450: Add SM8475 GCC
 bindings
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
 <20240731175919.20333-2-danila@jiaxyga.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240731175919.20333-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Danila.

On 7/31/24 20:59, Danila Tikhonov wrote:
> Add SM8475 GCC bindings, which are simply a symlink to the SM8450
> bindings. Update the documentation with the new compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>


> diff --git a/include/dt-bindings/clock/qcom,gcc-sm8450.h b/include/dt-bindings/clock/qcom,gcc-sm8450.h
> index 9679410843a0..5f1f9ab71a22 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sm8450.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sm8450.h
> @@ -194,6 +194,8 @@
>   #define GCC_VIDEO_AXI0_CLK					182
>   #define GCC_VIDEO_AXI1_CLK					183
>   #define GCC_VIDEO_XO_CLK					184
> +#define GCC_GPLL2						185
> +#define GCC_GPLL3						186

To avoid any probable confusion related to the list of clocks on SM8450
platform let's add a new header file.

>   /* GCC resets */
>   #define GCC_CAMERA_BCR						0
> diff --git a/include/dt-bindings/clock/qcom,sm8475-gcc.h b/include/dt-bindings/clock/qcom,sm8475-gcc.h
> new file mode 120000
> index 000000000000..daafdd881892
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8475-gcc.h
> @@ -0,0 +1 @@
> +qcom,gcc-sm8450.h
> \ No newline at end of file

Instead of adding a symbolic link to the already existing header file please
create a header file, which includes the old one:

#include "qcom,gcc-sm8450.h"

#define GCC_GPLL2						185
#define GCC_GPLL3						186

In drivers/clk/qcom/gcc-sm8450.c file along with new functional changes
include the new header file instead of the old one.

--
Best wishes,
Vladimir
