Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F030B9A4
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641742; cv=none; b=axWqPyDwrZuLRCFygSI31rNS8UEebeM7A051nBtHPSQAq/DOAsyClTe/dhdvTg5EaLJh8Wh9hU8EZwsU7OKFNJXcF9QTv+lRSAZ3t2dhbO75BsSJjnwLAf6sQ3xLhG7rPtBQ4DQjZoi1M5VpYjyOi47/id4ZiH5nVBREyiB6dz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641742; c=relaxed/simple;
	bh=ipnj/ShwN4qWMwlvjTyy3Pk2w7mwcXypC/ulNiTQd8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbbE1z7BAvBj+a1r1oac6riQ8YVzVkB4m4ZYkoCOJCK1mox/68DZMKoWofZRbLtRl8OS7pAzJYrkWJAevp58D/yOkozcHJGkKvXsiz+M59pEcZt+jp0TJj1xvsHNAdLKaAilffo+PiEbqzjIeOnTgAH6E1RYN5dGpKmpPTsjgFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjL//tdH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjL//tdH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a522224582so416188f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641739; x=1752246539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOyFHtQS4VvsDjcbQRHgwxAxnr6aZ/PpVMTdfF6upkw=;
        b=zjL//tdHwM1nPlxPr0X0VJABfizrP+XW4CC/IqymV0u1mUbOVB5ZFlu8a1B8CPPUhd
         NToLmjtZMm9wlwcWceHG+gS7pN+MJBX0ZeoOWZWnIazFqtgPbubtTKGZNA03ISF75un1
         1q/nVz8wY6oo9E9IXgYNCNKpqYGY1RB+jdH86BrTywAI/RPgyIU8INkTOkusfI2n/Bpr
         2kPxJTG4B1aCA0llDKXSxqSOohL+FOcT0fpXNdn+I6YV5MlM/WWamfzMSaf/ay124h0y
         3PZgB6WE3ADDSreqeAoh8gpXNvcwj/6hTPuXzQrSnM7HElJ38B5+FoPI9oCnNzcnpg2k
         7w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641739; x=1752246539;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOyFHtQS4VvsDjcbQRHgwxAxnr6aZ/PpVMTdfF6upkw=;
        b=vNZJAkPs62il4jblkhlFIF5WuY6MyudRnwW9/q58U38MEvhzeE+UILC/LtCySOINTR
         pftPOIG4TWv8Smqk6pOTIcEL1xKeFtadZKmjgiLQ9HSdFt82vaBrIq+dCsAmqlKIBaYt
         MQSAfz1/0TbFqkzepshQPxJbCW2zm2M61OHz/2fOscKJqisiLHe+H55g8ygIGZlshv3S
         PrFx3o1sVEGxKxQp31slin7+z5LWgamHs8dMHe2yrCCCYCSykJcybCjBGQUqr6o8Mayb
         Xi/D27iK7S+s5aP5cnHoJzhdB0muFS8JS16tKVBwzRT1bdkfsrOcjn+pz8TPqo01ztU0
         /Fog==
X-Forwarded-Encrypted: i=1; AJvYcCV9VTAF3SV1Fu/xxOA+3zzzf9PRb9B9EqYpev+dG/pP8d1/K7CHt44PsXg4CLIj3Iq6PlB24ShPQ44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybk57RfhmPoiq70pz693nEhL9M9PjsnUw7nSAnfiL1nU8LETYa
	a27Vfn5S2GTESNuL8L9EOnfaOC3ZjHkmC2UvdGLN6PTjwwrwTM5o9lzXPuDo3esYuej6cVZSlfX
	ybQqBSSw=
X-Gm-Gg: ASbGncuFei4USSqjikxoi0n7yv24HYUaKwF0IZihVICXUKw2l0SWP9VZSi2k8+YN980
	yVYFEsbzwtN/IjdUWltm2tD31uQ+PsSb7iHhEOYOcPyrQJuitkHhPUKRIqVNoGps64k3tb3bmAz
	xA9COK44C1x6MWHZRGkXkA9OXWyjB/k1yfH1rXRCl9cv/ynKrcdv6BmqCE2L1xtnKEQpIw3GquY
	9Vzo3l1AJcOeCQKxqHLq3u7TICNoWk48y4VK6hKD85vnhl1fwKUrLUpuYFvTYJY2/CZrMZY/fxH
	jTpjxkCM8lDAiLT8AedjNwnRrNlOVcUgJdIALPGVwftwUMNZraSQbEyV8oCwsSVxyNQc9xgGU0r
	gjpJG0KQ07h/W56pKn+U5o0sDGYU=
X-Google-Smtp-Source: AGHT+IH9cnwUoqoWS5/qQDudbSz0QU2bdpH6UeAa65SEFEoIDoAtlPs1SdHDTe/5FJH8jfA2orMi5Q==
X-Received: by 2002:a5d:5e0a:0:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3b4964f6f85mr2726920f8f.26.1751641739273;
        Fri, 04 Jul 2025 08:08:59 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b975efsm2667049f8f.46.2025.07.04.08.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:08:58 -0700 (PDT)
Message-ID: <0b526bee-dd8b-446b-9b79-00fcf811837e@linaro.org>
Date: Fri, 4 Jul 2025 16:08:57 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: videocc-sm8550: Allow building without
 SM8550/SM8560 GCC
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-2-785d393be502@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250701-x1e-videocc-v1-2-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
>  From the build perspective, the videocc-sm8550 driver doesn't depend on
> having one of the GCC drivers enabled. It builds just fine without the GCC
> driver. In practice, it doesn't make much sense to have it enabled without
> the GCC driver, but currently this extra dependency is inconsistent with
> most of the other VIDEOCC entries in Kconfig. This can easily cause
> confusion when you see the VIDEOCC options for some of the SoCs but not for
> all of them.
> 
> Let's just drop the depends line to allow building the videocc driver
> independent of the GCC selection. Compile testing with randconfig will also
> benefit from keeping the dependencies minimal.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..26752bd79f508612347ce79fd3693359d4dd656d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1391,7 +1391,6 @@ config SM_VIDEOCC_8350
>   config SM_VIDEOCC_8550
>   	tristate "SM8550 Video Clock Controller"
>   	depends on ARM64 || COMPILE_TEST
> -	depends on SM_GCC_8550 || SM_GCC_8650
>   	select QCOM_GDSC
>   	help
>   	  Support for the video clock controller on Qualcomm Technologies, Inc.
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
