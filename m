Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE216D9D8
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 23:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467625; cv=none; b=mvNIHXhvVZkVlGkmYukkpPZCTRkzS2d9dhfM6+z1dG2z5yfTr+zKg7uGDt2PblY9kqtWVuq9WxzyXfGoxmS8pnvQyAWdN7mPiAUl8w2gzBSbgywL5YhwUi1RSRsGAnbO5qGJtAnh9Qo3zxZYaRM3qzMPVRKdYkHUxPNIYRHihVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467625; c=relaxed/simple;
	bh=VyJpcTQ4QOnZkSwkJW7Hc93Gms/6UVZFKZBOeAtTHFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA0asQDNr7W72ziVn/AI9aHko8xm0d0V4CcbddtHaygU1Q200P0oQ8oeLopebdAQ4Hrrmom9+NPNirWu7vQzkNKHncGnNU3qFYmi5lRfOru3AfIQOqjcxZJKPOCR2eNxyAhVVU3QqJ20X8qN9lPS1J6Tny12bt6eoBs8xX1tW3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9IMll/j; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9IMll/j"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f015ea784so1042184e87.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722467622; x=1723072422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nm0Xwjt+29MOSwfuccAriuqumY0vc7/Lx87pSACSnGc=;
        b=M9IMll/jhPcIZZErPZUpVobxjMykBy655FwYzYC4W5LWZUk7PWfoRBQhGAxhprX3hc
         f+TeZpitKM3qF4Yh27tdTJAI/oHN9gz17bvQYxLr6aYkcJzaXiTYHR3SyiFMyWioPfDI
         vCItZY+P4s3Y6KzOx8pcEBOUt07eBNDFoCOQrSrZ7ItirxWRXRdVta74+88jDV8pWEMy
         FFYZyQH6OLPiwLtpQTd0isbuITqh/RO+cqSL0FdwYR54iTw7UndKBs/G+hm2tR5Zv4Be
         sBwXaAy584eXtwwE+B1Vrw3OWAGb4pT3oDnws6gwN7RiZZDgl1f9pLiSPkDLjPgdGm3J
         on7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467622; x=1723072422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm0Xwjt+29MOSwfuccAriuqumY0vc7/Lx87pSACSnGc=;
        b=Uff3PRj7UcjfgrWIxOBGIpJCT4BuNs+NZsNQqPWjShoPsbYJIV/3dimLKcpKMQe1dN
         eB86VgYIFrkN517kgfOw76HLWnaSUNRkQT64w9GOIXEnz0ngCxgUoQJTn7mDThZx7aIN
         pWR6+mFAYM/1COT66/T9FFQhHl7ido+uSsz+BjHrqy0pi+NdMNVBF2hqjevzF5K5RRTO
         /Def8rOkYldAIWe1b3d845WdGA13sbbpJ0mL/nB0+AR5aIAyIb531DPGZ/9oVbFSz2go
         M2pyBIb5G+pH2tn4AmG0nwr9Gprryc3k2rkI2ima02+JrRFHu/KgqxfjiRxdSWyLGAHf
         1cGw==
X-Forwarded-Encrypted: i=1; AJvYcCXTSyUoKqkHqTnLlhWeOeEQLvjr/aQVbOB6epujh0F13FYQFJV8FGnmgR54X/+/TtyERmIoC5PEXG7sRg9m3dLoqKp3Ow//fLij
X-Gm-Message-State: AOJu0YyuOq/aPyd5ZFyoR9HlTkuRs/r2W0s52KtsbmEZrz+9H8sztY/A
	TW8Hkgk9OoL6BPy910b3yRsVDe/uHlvxMxcFGIdCcoNpJNqtOlNegGc6PjoHmYM=
X-Google-Smtp-Source: AGHT+IFtA548ZKHz41CyPsrXPin66nMAe94DZLZT2aDUq+/ZTHUGdm+iBpDTOUKzJpBgPlCMMKm6xw==
X-Received: by 2002:a05:6512:3d86:b0:52e:ccf4:c222 with SMTP id 2adb3069b0e04-530b6210ef1mr134150e87.9.1722467621495;
        Wed, 31 Jul 2024 16:13:41 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530abeefd04sm671995e87.121.2024.07.31.16.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:13:41 -0700 (PDT)
Message-ID: <e306073d-b0ba-495e-a19f-d433c74f6666@linaro.org>
Date: Thu, 1 Aug 2024 02:13:40 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] dt-bindings: clock: qcom,sm8450-videocc: Add SM8475
 VIDEOCC bindings
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
 <20240731175919.20333-8-danila@jiaxyga.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240731175919.20333-8-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 20:59, Danila Tikhonov wrote:
> Add SM8475 VIDEOCC bindings, which are simply a symlink to the SM8450
> bindings. Update the documentation with the new compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml          | 2 ++
>   include/dt-bindings/clock/qcom,sm8475-videocc.h                 | 1 +
>   2 files changed, 3 insertions(+)
>   create mode 120000 include/dt-bindings/clock/qcom,sm8475-videocc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index b2792b4bb554..9186d2ee87f8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -16,12 +16,14 @@ description: |
>   
>     See also:
>       include/dt-bindings/clock/qcom,sm8450-videocc.h
> +    include/dt-bindings/clock/qcom,sm8475-videocc.h
>       include/dt-bindings/clock/qcom,sm8650-videocc.h

Won't be needed.

>   properties:
>     compatible:
>       enum:
>         - qcom,sm8450-videocc
> +      - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
>         - qcom,sm8650-videocc
>   
> diff --git a/include/dt-bindings/clock/qcom,sm8475-videocc.h b/include/dt-bindings/clock/qcom,sm8475-videocc.h
> new file mode 120000
> index 000000000000..231cd153052c
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8475-videocc.h
> @@ -0,0 +1 @@
> +qcom,sm8450-videocc.h
> \ No newline at end of file

Please remove the added symlink.

--
Best wishes,
Vladimir
