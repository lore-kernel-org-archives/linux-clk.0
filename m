Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B263A961A
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 17:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707797; cv=none; b=dDZN6VFEikw0ahe6NwpjYRxS3xI1RvXreNZ9Qpzs4nlQd8QN0HSSA8xhzaRKttHFaYwypGCUOiOojWoGhYQLJB3LFXsMs6l1Lu/6vqNcUuz/vr/3amGC2S1Y3KzO31SBzb0QqEYZ0EmOH5PtiCdYF5Ox+9uHItBIfJQq7hH52Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707797; c=relaxed/simple;
	bh=yLVG4BfzCihb3EChTfLSGF+jYW4r8CaXsTi5uL4V6xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAEE3w1K9PAx862kI2KpACfM/1s1yOSGaw/YVm46WDzCcwqonuHf4KfQ7zGmiAZIlRARx7xPkEn27QeNluYlca8pJbRZC8rtsavTxL8oeBYyo+T8U/YRKMg3RSCxn6xS5ySVqSJ1XMb1WWGwHVrz9jrF4cMqAtzfH7E4B8cixg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYs/RC3C; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYs/RC3C"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso4456017a12.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776707794; x=1777312594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOAvT65Iv9zTvx9Y5S7ZxuAZo7YsqnpLZetQ/AQ+B5c=;
        b=ZYs/RC3CI5tfD3G0kv8h6FH6FoqnbBbQ5l0YyZMWV3V0H4DxpUX4AEMP8UixWBv2RK
         TMN17r2uJUeuubbT5FjsGCSbepgVrZJVU2ODzFZEnqHWr+66CL3lRJIsVGTSBiHzmCHR
         GZhg2Wwe5X7ezIx2C9XC2UHmcWXEo+ud0Py7QARcze54S8nlOHL7NJSIh2NvCwW0cgKl
         tPtVybwf7nH7qRh+itXpQBauR/U3twrieZNAdDV/CKezqJmgsjAzffpJLF3onx+RLFkh
         EcU31fsHnYlS5ZF1Pmv3muBx1fzuUaw/MsPIAmjp9ALJXCGMsidWUctk8HtJqJAYPgud
         HJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707794; x=1777312594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOAvT65Iv9zTvx9Y5S7ZxuAZo7YsqnpLZetQ/AQ+B5c=;
        b=FncSsPlLbife61QVx3+X1LvAoInKiFADyarHzY/CuEwbZlamEnRtHprhsKMXBbn1Rt
         QTqqLeyclsAygONi3Ib1JEUvmM9E/CR7WTzwnNrQ0uGxyllnHpWPleAaXozCXVZv3+CJ
         voCXNWx47it8a6fx8NCjWcDMQPWTbpY9wximeJu+Omx6FVGHSqJIZY7NHtdPlKR06XgO
         54wvPT9Ukb/AYt2xby8ufpDgV4w0VXDi03+EqI2gyoEqgFYDTZY53efH8Q8bfgBRjdUq
         rYKPwX2Vc/fOYQA67TgNWsSDHrKMiFv0I+UO0F11qGYlHGpTPUJvxHSp/6y7gIQk6/np
         2bdg==
X-Forwarded-Encrypted: i=1; AFNElJ8AJuPw9PPv9UkeofcLCxCNbkuaxvyfbzPfPGM5kgxXynjWuq2KpW/VnZb25D8yWlixHG2DAhERxas=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4gcEa0lyk5ZZECi9N+j9iPBbVK9yJJIYi6fqAfpM7NJBYM8k
	9l+jm8UAQNol0VlsYUPyZ++tyC0boeXC0Uj5lAfS3kbuaT4HAH4iFIr8BlanoTOZDnw=
X-Gm-Gg: AeBDies+Tjh0PPXYHdVoqoNlh3vI4tx7FNiW9s9SWoQCS+xhN5lwoowYmWonP91OGn+
	UIDGBdXfkHSYeyNkjuPgqgeG4VT4CyGrXW1kzpzRDO4QPE4k1ivl2NqcJhJlZ7Q4IoRe+CjfWXO
	tBH7BETlsd2h4pedIlmnzUPW3vKcz87wpMN7vo87gtGbwBEiRBnlLXb6pTxMaZZGp9eZfRF/LPw
	kNUzbWTNuy0JVo9rWKMBPQ5QduOIX1FWgUu8kLnjV5QXm5+WcFdYRgFZEZaBsyEztOZWGceh+fs
	qcWOWFJ6cTIUAufPGJD7okgyX5bYGN+L6WSx1ffvdFdr2BjLQog66pMjaYKGsLjSr4LYX1Wqov9
	HyoPSaGqxOlAk8mdSHDVClOlSpSzT9H6Xd/ROF+oPznva7obYgl9yAqZSbymKWeFdr+qHMkvGAk
	u4H4lWwhtaPETgpDLiGLm4uTV5eVTncvpprHr1S+VvInTs8FAtEA==
X-Received: by 2002:aa7:c3d9:0:b0:66e:6ac4:2c01 with SMTP id 4fb4d7f45d1cf-672bfd8b436mr4725150a12.2.1776707794329;
        Mon, 20 Apr 2026 10:56:34 -0700 (PDT)
Received: from [10.43.65.76] ([185.94.190.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6744dcdf29fsm1581758a12.30.2026.04.20.10.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 10:56:32 -0700 (PDT)
Message-ID: <f3e27db5-d84d-4b6a-9d6f-25fcc9044efc@gmail.com>
Date: Mon, 20 Apr 2026 19:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Vyacheslav Yurkov
 <V.Yurkov.EXT@bruker.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <20260326-lustiness-borrower-530898a5ce28@spud>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20260326-lustiness-borrower-530898a5ce28@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.03.2026 11:44, Conor Dooley wrote:
> On Thu, Mar 26, 2026 at 10:54:52AM +0100, Vyacheslav Yurkov wrote:
>> On 23.03.2026 21:14, Conor Dooley wrote:
>>
>>>
>>> The binding you've got says "GPIOs used to control or guard the clocks",
>>> which is not what you're saying that is going on in this mail. A more
>>> suitable description would be "GPIOs used to check the status of the
>>> clocks".
>>
>> Agree, the description I provided is not very accurate.
>>
>>> I want to see an example dts user for this please.
>>
>> DTS example:
>>    clock_guard: clock_controller_guard {
>>      compatible = "clock-controller-guard";
>>      #clock-cells = <1>;
>>      clocks = <&h2f_clk 0>, <&clk_fgpa_rx 0>, <clk_fpga_tx 0>;
> 
> Unfortunately, this doesn't contain the part that I wanted to see - who
> the providers of these clocks here actually are.
> 
> To be frank, I am not sure how this block would know that these clocks
> are enabled but their providers do not. I can think of a few ideas for
> how this block would know, but I don't understand why the providers
> themselves don't, and therefore why you need this gpio to tell you.
> 
>>      clock-names = "h2f_clk0", "clk_fpga_rx", "clk_fpga_tx";
>>      gpios = <&fpga_ip 0 GPIO_ACTIVE_HIGH>, <&fpga_ip 1 GPIO_ACTIVE_HIGH>;
>>      gpio-names = "gpio-input0", "gpio-input1";
>>      clock-output-names = "clkctrl-guard";
>>    };
>>
>>    custom_device {
>>      compatible = "...";
>>      ...
>>      #clock-cells = <1>;
>>      clocks = <&clock_guard 0>;
>>      clock-names = "clock-guard";
>>    };
>>
>> The driver usage exaple:
>>
>> clk = devm_clk_get(dev, "clock-guard");
>> if (IS_ERR(clk))
>> 	return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
>>
>> ret = clk_prepare_enable(clk);
>> if (ret) {
>> 	dev_warn(dev, "Clock is not ready, %d\n", ret);
>> 	return -EPROBE_DEFER;
>> }
>>
>>
>>> TBH, I don't understand your driver implementation either and why it has
>>>
>>> +static const struct clk_ops clkctrl_guard_ops = {
>>>
>>> +	.enable =	clkctrl_guard_enable,
>>> +	.disable =	clkctrl_guard_disable,
>>> +	.prepare =	clkctrl_guard_prepare,
>>> +	.unprepare =	clkctrl_guard_unprepare,
>>> +	.is_prepared =	clkctrl_guard_is_prepared,
>>>
>>> any of these 4 implemented when you have no control over the clock.
>>> I didn't think it was required to call your parent clocks enables in
>>> your own enable either, thought that was handled by the core recursively
>>> calling clk_enable() on clk->parent. The one thing I would expect you to
>>> have implemented ops wise is is_enabled, which you don't have.
>>> Also no sign of any rate acquisition functions, which I thought were
>>> mandatory.
>>>
>>> +	.get_parent =	clkctrl_guard_get_parent,
>>> +};
>>
>> Good point on .is_enabled, I indeed missed that. As for the rate acquisition
>> functions I referred to this table
>> https://docs.kernel.org/driver-api/clk.html#id4 , and it see that .set_rate
>> is actually optional.
> 
> .set_rate is not rate acquisition. .round_rate and .determine_rate are.
> I thought they were mandatory, but for a gate clock I guess they are not
> and the parent rate gets used automatically.

Before I send a v2 I'd like to clarify a few more things:
- I provided a schematics by means of the URL. I believe there's no 
unified way to provide something like that in the documentation, is 
there? So the only way to describe it properly would be to summarize the 
description from the mailing list, right?
- I'm going over the Common Clk Framework again, and perhaps I 
understood it wrong. You mentioned that I have to implement is_enabled, 
but I implemented is_prepared. It seems that I just have to move my 
is_prepared implementation to is_enabled. Does that sound correct?
- In my particular use case I don't need enable/disable ops, but to keep 
the driver generic, I'd probably want to have the bulk_enable 
implementation inside, because I don't know which clocks are assigned in 
a device tree. The clk_core_enable function only enables 1 parent clock, 
not the the list of parent clocks. Or I'm missing something here?

Thanks,
Slava
