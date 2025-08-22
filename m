Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBFA2E9ED7
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858435; cv=none; b=p+XugfaQWGJ6F9Fyhv9NoGRhzD9PSweG+tMoibIyu1uzY4yiIP2XhdzyuxNtqP6eNF2XTXX5k6OEDo4c1epEiuHj5/QySdSNkdxdzxvG//Dn6EwdIuBpsdkrEYIG0TmFQghNRnsB3Hs+HvLVM5E6x+MP+7BacqEIt/kKOiW0gs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858435; c=relaxed/simple;
	bh=DKiNN1RMdn2Gn2M4I96hlwsVSaQvym/NqklBxGqQSGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dby4Oi5Earuhx2cdA1BaoBxqnNNoqKQiz9ZekNGhMQd0waDCXXGfilSZicLLgDBvKrYzJhoCO3BvsUa5Ev+FsmUofJb1bFFRWxbA465LI0I4yvvrBnbRaomoPFhIBwEj3s6/GNjjQMmWnUlr3wbN1MKOA8C9OKpmdAi4E5DhKnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/IIx3pr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/IIx3pr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb731caaaso285435966b.0
        for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755858432; x=1756463232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cd5s72x9mZV/+O9tEQqldJerG6gz6k4UPw65u8py8ZY=;
        b=I/IIx3prkNnuzMy6JBsKrt51brhDi4/t+bHBD5i5Sv9heUwQXkMIpVqe3qNVKj81g5
         OJs5QZS6wIJqcgSwdno2W/6regDlqUkqIX/krg4e9tfYfqt5xSMgvT2QWlCLN1iA32hC
         DdtBzxsBg+rDyTCuxu5uBZY8LDz+XH0We8qAo0tOtjrificJ2GM6C+etqH3MQaq779Dq
         RKc63E0Zwu7qImRpFb13gPYqtf5xktrNQGR0UABmZf0Cf0O012eyskgrZ2/BSlQ2jSTZ
         sR9Xkhme6UILSuXSTwRHoC07Wr6tDRVvoeyOs/AW7mA4RADcDv3F861lVtzsjmYQyFQQ
         B1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858432; x=1756463232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd5s72x9mZV/+O9tEQqldJerG6gz6k4UPw65u8py8ZY=;
        b=OOmXFPCbNtuTV03XGPB+OF4RLoFA2qMYuyKAkUeJ7MdoE5ssc/5hgupr/1A9UGbuOU
         M5kPj7lZir47RYXaRvAiqgLH/j0CfH4bgMvH9AtF5xfTH4zWCEcZz/emSGZySz81V2h6
         mq4HPDomi1vAPP+f4z3dFeRChsMxZQpPJg3JxxocvvrNS3j2PpV5tIuPF1HiwkuDHe15
         2fG+OdvpXO7AK/DpmSHyuzS8y+ofPf18toJ1jBzB032tdBO9E/wPpUZHCvhAXV1d/GoJ
         Cura0xmBzDUc2gHcRpDK198QMGxS4drhTMb6Y3nI/Xkts9QAYGhtWXSK6TOUVAZloQpL
         YDXg==
X-Forwarded-Encrypted: i=1; AJvYcCVYQMeRU6L1GXEEWc1BhHjywqzkLneJjqScGlK8/tKls6SVbfGxOhUJK8/1/bMPJk5sjVKCN+uqeQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVL0jHuWVfFip9WlcIgCQVVuESobkhqA/UX534H/NqQ8d9kQFH
	EkQjscmOpnEBMyj73ADym8SpsADYFrYYnLGEE4lvn3UY9u9DAQuqiAooMJO1u96gLxA=
X-Gm-Gg: ASbGncsGpdXug8C7aN2Kh6jx/ZQSROOO78+LM+yOjmUUCfNpw518Za679DuQhdDPLyt
	2wUpYLzUxfNZj2YESwCwm/SuK8dpEuQgbaoHNJ5rp9MdLNguS/8VN3x/pwSTfZbspxAqthv4+60
	1CFcRJCVtnlNREqE1KFlpEGTo5a/U8z5wy7MpOXFa1I8KV3Us2C7laWvTgkQG7cSdU9FnVy1f5v
	WUU02sWN1O1G+VGtKPDURiRGAEjZ6kqMXFf+JBuKDlDZTe1lkNQ/Y/IJIHrxH13Jxu1W7agmmU3
	cXchYfMe+SbCXvBWQ15satj8CnoKBZgOKfstx4vzNHrWfakFdnVr+c2GkxZlHpyNhvrVi361LxN
	ZvpTxDiHrX4Jyzo2S1BfXuCh6SP7bA0Ui
X-Google-Smtp-Source: AGHT+IEjRd6Tx5sKZi6OWN0Ddp+BLYTOG0lrQ3ub++Nybf0iOaCMKeFsTfA36+kF67hMQ9sg6CmMMA==
X-Received: by 2002:a17:907:3f11:b0:aec:76c6:6ef6 with SMTP id a640c23a62f3a-afe29605d34mr191833466b.50.1755858431819;
        Fri, 22 Aug 2025 03:27:11 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4ca67fsm585912066b.92.2025.08.22.03.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 03:27:11 -0700 (PDT)
Message-ID: <493a072e-352c-4e96-b58b-04b56fa56dc0@linaro.org>
Date: Fri, 22 Aug 2025 11:27:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org> <aKdmurrT1pFtLSI8@x1>
 <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org> <aKhFOHFGKPYXgIri@x1>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aKhFOHFGKPYXgIri@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/25 11:23 AM, Brian Masney wrote:
> Hi Tudor,
> 
> On Fri, Aug 22, 2025 at 09:14:03AM +0100, Tudor Ambarus wrote:
>> On 8/21/25 7:34 PM, Brian Masney wrote:
>>> On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
>>>> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>>>> +				unsigned long *parent_rate)
>>>> +{
>>>> +	/*
>>>> +	 * We can't figure out what rate it will be, so just return the
>>>> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
>>>> +	 * after the rate is set and we'll know what rate the clock is
>>>> +	 * running at then.
>>>> +	 */
>>>> +	return rate;
>>>> +}
>>>
>>> ...
>>>
>>>> +
>>>> +static const struct clk_ops acpm_clk_ops = {
>>>> +	.recalc_rate = acpm_clk_recalc_rate,
>>>> +	.round_rate = acpm_clk_round_rate,
>>>> +	.set_rate = acpm_clk_set_rate,
>>>> +};
>>>
>>> The round_rate clk op is deprecated. Please convert this over to use
>>> determine_rate.
>>
>> I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
>> as deprecated and add your Suggested-by tag? It would help other newcomers.
> 
> I am working to remove round_rate from the clk core and the various

ah, great. Thanks for the pointer!

> drivers. Your driver just needs to be updated similar to this:
> 
> https://lore.kernel.org/all/20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com/
> 
> Brian
> 

