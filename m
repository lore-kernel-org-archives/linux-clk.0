Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5C26AA94
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739897052; cv=none; b=pNRr7Hsb3YqEPYbE/4zw2LeeS3kSbJxrJ9tcyYOh2Bq5OKzgSkm433IkArH7KD6Z60luvjeKfF1fX7G55cjh7cjsh8RWSPXw3HQjR2+yhjMewvjeL84noZrApymgV5e9vX47MrKHDJY2FcHewgebRAMrRrlF784+QT6oCL+N1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739897052; c=relaxed/simple;
	bh=ecVY+gv1Bw65DvJhP3WRsBzu8IgIbbZITzxHtqJ/Ow0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tFbmJ3ZLpbUHEwuJ/Xhj4ktClDy4EUw6VJHR1znts7ntrNvsBpgvRwKK7IlnhWKSeAbzTgk5fe6oU1pQdKYXyqCXSKdhrsuidigB5yLR0tSqwoPdP5V5xH32Hkk6Lmu7MQJGdOUOqK+5YWy3IKrQHqfpAuwzuOJl4CtOCNGtuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LLnSo7/W; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LLnSo7/W"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so38753375e9.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 08:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739897049; x=1740501849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rNolTsZiemwL3MqHvmSKz5sOO+WofguQrhSb8yM7bJM=;
        b=LLnSo7/Wrx/TOXZwwpTh5iDQKrGRXm0/eyiHuMxnt2ej+x4bPCI9hWm6PLXr6QZsCP
         ltxaopu5I0UNowQbvj5DnMtVAOZbQ3ntdERzRyBKoKvGJJ6CB/fpr+O/L7N1Xb34Ybbh
         b6XAP+nF/lV2+YoWBu1rKlIXX6eMekxmrdbYlREwWrKiRkEgmxmgY37SI3qpsItnLNPM
         kko4UmjalEHMmp8LgZNybTuzmE0MAPF7qWGDnB5ceu45ClJv3aINB56mEGxCtYRkO+yg
         fq8M51JKcmw1BiYmAnZxZRdFGJr/fP9LJ0N3GnzrsbParooItfs3q679uDyemXe5WoIx
         OsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897049; x=1740501849;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNolTsZiemwL3MqHvmSKz5sOO+WofguQrhSb8yM7bJM=;
        b=SCQOznjrysBCatN+SkoF4xYlS1mRHSYJ69J9q0EcbNbLh0UifRHpTGZP6LOq967+/i
         V0qd1yaJFOAjF92eMz0M0oIR2ddEw4aSjGoa083cAdEoX8RmTFAci6xwd/KXjSX5WQ59
         ZlpgMYPZX9Zu7FY5DtDGmTn0NqhY/ze+TE2sHAMrYuprn46qMmN4XsqJkSfUFPBWWMpG
         jsxcNdpF+hdGaRGUxdDCVbtdxCB7geffI0XOjn+8dEpDXSw5nmjXhSghBGVxjTsyrtrh
         RSp8ho+MsSf4JPrJjxOPvnB+bLfMW2Z8//FUDsPuKiQ/DxSOJ78LlsMYMFhQ/KiDBMq9
         iXsw==
X-Forwarded-Encrypted: i=1; AJvYcCXOExqHg92tpbXj/Adc8a2HZMydQLZSZ1amcEY8ojISjoFBV1ehskOE9uX+TfJnoMY5Cj7IsrQuuEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXU4WqMq0q4BjgfuIoNuCC0t5tMPtWX4b0PTdaZ0aMnLBj9E6
	uguTNR7q/DWO8+MKY3uvZopQQ30UfaVb0A0mW6jzpeK1c1sW2I9SA0n/AxUjEJk=
X-Gm-Gg: ASbGncsxdHAddjfEljdOaoyHm9jfJcvCvXWnuvHWmN17KO6njIq4/21bJfRSG5LkkF8
	KLaIolpP/8hBE3OiflXtlaNIDaFs69BJMI8r3ceuJGFrPZ3Wc1usulg+0vxAbO9MZzsILKyLGO8
	ma/ic83hon20AZPbS/zKdU7stBToocTVKDuWmMi6LCD/FmLNMPoHovQasUtvNeYUjaqGrkw3Gu/
	1awO/y3Jmw+ciRbEKAwdFAye4ipZlTyKKJWDX+DbxmuyxljZOl3kwwUu7o+LgagtrjdUAgp/Jzx
	WNh6MuEL5lt3Pf1+fxcUE89G169Of7hELyzThRPMEA+YOo/vaP6E9UC7
X-Google-Smtp-Source: AGHT+IHRNK4mSxCdis54SwXkqCDZrb5jymOcpWY4wAXt2MV8r6iy6nxS/LiPmAc4W5Fyl5byIMaTTA==
X-Received: by 2002:a5d:5f50:0:b0:38f:28dc:db50 with SMTP id ffacd0b85a97d-38f33f11953mr14595414f8f.1.1739897049224;
        Tue, 18 Feb 2025 08:44:09 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbbdsm15567675f8f.37.2025.02.18.08.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 08:44:08 -0800 (PST)
Message-ID: <9e9f742a-2972-476a-91cf-fc596221bedb@linaro.org>
Date: Tue, 18 Feb 2025 16:44:07 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
Content-Language: en-US
In-Reply-To: <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/02/2025 15:46, Bryan O'Donoghue wrote:
>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>> +    if (ret)
>> +        return ret;
>> +
>>       ret = devm_pm_runtime_enable(&pdev->dev);
>>       if (ret)
>>           return ret;
>>
> 
> What's the difference between doing the attach here or doing it in 
> really_probe() ?
> 
> There doesn't seem to be any difference except that we will have an 
> additional delay introduced.
> 
> Are you describing a race condition ?
> 
> I don't see _logic_ here to moving the call into the controller's higher 
> level probe.

I see you're saying do this before waking up the local PLLs prior to 
really_probe.

hmm.. the existing code works for me on the CRD but not on the Dell 
Insprion14 so I missed this on my series.

Instead of pushing qcom_cc_attach_pds() back up one level and having to 
do that over and over again for each clock controller that has multiple 
power domains, we could just move the configure pll logic to a callback.

Add a new callback to qcom_cc_desc()->configure_plls()

Then qcom_cc_really_probe() would look like:

ret = devm_pm_domain_attach_list();
if (ret < 0 && ret != -EEXIST);
	return ret;

desc->configure_plls();

There's no point in having devm_pm_domain_attach_list() twice within < 
20 LOC we should just force the sequencing in the right order once and 
IMO do it in really_probe() so that we don't keep adding custom logic to 
multi-pd controllers.

Its a generic problem we can solve closer to the core logic.

---
bod
