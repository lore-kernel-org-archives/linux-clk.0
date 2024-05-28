Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65E913AD30
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900995; cv=none; b=JragQHvdPrWgKmrrVqfguoVUGOWXBhe+tzTBzq8SD8FzwbYI8MDKDk3bTI869TjUnQzoJRAZbjuql4qzV90+n32QmOVdA+RTsEXgm5jHZpLcuqb2V7qbNRu3huizD/0rVwyLazG3jmYY+mq+cNe/wbGi2W/x5gH75O+WSN8MTgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900995; c=relaxed/simple;
	bh=c6bKxcXWNYjOOH0xRtK0KGI6gOon/19zEjgMhAayAqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF5ozCOXnKujTtaAyA8QVUkUE9kQUeBVxVqpAS9R3NXaFU64GooYv85zN79Q4cA+8/UmrCnpJoPOelBgvx2SavraB1rq0LF1XT+b1WZAEJl90d6ON+//Ouy7dQEePf9OkLgP2QbmYyfhdaEhN7U4j9f0sxVYNqwvyruJhYRDZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfpQDhSw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfpQDhSw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52742fdd363so907242e87.1
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 05:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716900992; x=1717505792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBJydv2oVIxF33glNXhfsH0j7NMZZydOoyfGkqd3Bng=;
        b=rfpQDhSwEJGotNqLcxKrMS0y+28gjfTNNNHNkRA+UutyICUhBLYdckTobq8zgztGBf
         qtqKcyHM+v2Jh4umHeIotadX3d9/ZONqddlBisRiwRSaSpOb/7xVnKeaGAE8RaKYVVL7
         3HamyEo5WoOrbHTW8+4VtBob8j5GHwODjasLpuVS54zQ0Hw5cxBSoC9twYJIlJsYZGjw
         x8e9NzWE6EZBOfvVxxrl8F7pfjy3ebvN7vvCBzmHA2VGW7hhrOnb7nDQHtaVJd5ilX8d
         B4xkzwhLvV6EUWyoRvC9T1CFHvEf/VltbpviDc5xtDnME2Cfhgyu6y7NvEfdVqEP8dGE
         7Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900992; x=1717505792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBJydv2oVIxF33glNXhfsH0j7NMZZydOoyfGkqd3Bng=;
        b=VannpKqUqKa0zu78rnFcXc4iehGoyN8ku6l3O2Jjx8Oh52dP7wd+xFjovj/lTnMmbf
         N+WrCuYntVfXgYQv2f3vBdScJbt3U2k6i6OYlZyUyxEEAssQ7HKQ7Y/I6aDUmPq9x1md
         i4O7BxC1Xz5WKHmv2T9XWHSOjzflUptWBpSLXslQ3lrsdi+dGTXus2TVfzbJOjt7UODI
         MGOSv+J1JtdRT8ThI5vnZFEU/AEpb/MelZqUNxGZD9Gujy1TQxhepvcgpbwcB0HVzrSK
         OdNmtz0sVwtxL6+5C6wqbOwnaANiIVjFDjBzyU6ExdFOy1q7S+JqZ0T8blSHyj9fjPvJ
         KR4w==
X-Forwarded-Encrypted: i=1; AJvYcCWd/ls2JMxkJJ1lNmke089v09xqZ/2Oh+T2ALfJAQwXIANuV8gXzmbgh5iFGb+tiCanPFh4/Vk7Erlj2GWUI+01193dXPxedSU8
X-Gm-Message-State: AOJu0YxtCbeLKoWWqkGys1Bc/3y09klVeBeXDUjsVr+BPIABWjmDgCfe
	O3B2axOnHAzbYbXd9CnyWmdgLePsSO1+/WcR3a1FIWH9d01qcy5nQrihzolscxg=
X-Google-Smtp-Source: AGHT+IG0zOMeIXAZKtGkaGkYMDbA0TJClGnE+TMJJZXkxFvHDGGTT9Qi+laKp696WC+OBF1yN6ki/g==
X-Received: by 2002:a05:6512:b9c:b0:51a:cafd:3872 with SMTP id 2adb3069b0e04-529644ec0cfmr9508409e87.3.1716900992046;
        Tue, 28 May 2024 05:56:32 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm996984e87.127.2024.05.28.05.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:56:31 -0700 (PDT)
Message-ID: <39e8aa68-a68f-48d8-9845-0d273004e21b@linaro.org>
Date: Tue, 28 May 2024 14:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable
 USB multiport controller
To: Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/25/24 20:04, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The Lenovo Flex 5G has a camera attached to the multiport USB
> controller, enable the controller and the four phys to enable this.

Any chance you could leave a comment above each pair of PHYs that would
say e.g.

/* Left rear port */
&usb_mp0_hsphy {

...


?

[...]

> +&usb_mp0_hsphy {
> +	status = "okay";
> +	vdda-pll-supply = <&vreg_l5e_0p88>;
> +	vdda18-supply = <&vreg_l12a_1p8>;
> +	vdda33-supply = <&vreg_l16e_3p0>;

status last


> +};
> +
> +&usb_mp0_qmpphy {
> +	vdda-phy-supply = <&vreg_l3c_1p2>;
> +	vdda-pll-supply = <&vreg_l5e_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp1_hsphy {
> +	status = "okay";
> +	vdda-pll-supply = <&vreg_l5e_0p88>;
> +	vdda18-supply = <&vreg_l12a_1p8>;
> +	vdda33-supply = <&vreg_l16e_3p0>;

ditto


Konrad
