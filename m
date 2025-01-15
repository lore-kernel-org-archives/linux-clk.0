Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D27B236A7B
	for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736928614; cv=none; b=ZKcqbALiIMeZ6LlpcP8DbYgoDnlPHGsF8QhUo2yfeoIFtL911+njvfiiBpFuCqjrW4CTAKCh3V4+mhgK7IXpiiodwEjiKN7K+QibKPRmVpbjM3fZk8eD5+y79w2K+oxR7XwmXwaGrH9Iz89xvtrmohEGy4qZJFH+2MvZF/zF8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736928614; c=relaxed/simple;
	bh=1syB/yTFe9pOxtUgkfKTZOUhX8XikyYYbP8bmiyG/p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IzKJDWhT0n4NiOcAZEd01jd4tSokgdL282nzwrMV2YBdnYDfZYAcaUQwuMQy0rZrk25WkzbsPmMMcGwrKOqBzfhK2gOeeyFIZm1X/E2HdvCIW3RH6BxMpPa0vNK3jIzxBEImsEhUHuGeVsnA1HmzEqQjkRAQuEk5iBd+6Sp6SHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUGBAygu; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUGBAygu"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso1173382a12.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 00:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736928611; x=1737533411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2x8pd15zEdXV/nC469cdN0tUhzRio5oRNAxqPdMlKlY=;
        b=lUGBAygutaKXUnNPH5qAw9NPHRD4d4Qtz96tWqoWiabC1xRb/LE3bcPxdhS5oFiOaM
         p3uqFDfs9c8Xxc6lgttyQyyL865sBdNJp1vVHGskcG/2tFDlUH7NKVHFeGgdpjJqA3Bg
         Dypz+jl6xpMlzxEUPdA5LPsBiyd+29YXsf9HD5SH/sCh4tlaQVw5/9F7vtunRWckboAP
         5vPP+b/Axf9AbwZVtg8bpguHub2tFN1IBNWsb/8SsR3kJgKN5tvEN3WcGzodjZ8FQ/2D
         rc77tVWKb2suEq1FXkkdHm3u7JRFZFs6l94uYvOygS4pAXV9wSQq1ONl3ouqPW+Y6IvH
         qUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736928611; x=1737533411;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x8pd15zEdXV/nC469cdN0tUhzRio5oRNAxqPdMlKlY=;
        b=IS1IrBgtO0qHe0swxMbMzmfcXq6Vfk9RKBcqfr564Q/zunsYLvKx2TCdWd3+nA3y4+
         CI0iFOi14p0MQaQ2UfonGJh6naNbeFxqFJ47Zs2wkKgReQt3thx6hAoMUn8J9XqsN+Xt
         NyAaiaGbsBFov4mVqm3xjN5VPDzpf/Bkng5I5/8MvpsiACAnTDQKH9cOV2hve16S51e3
         UuM8OFqUS6VG2oQICyRguKqCZKuPLUZLqGkifJ79Rwvd8D76645Lkd4W0t4lB8sIe5Zn
         /zJMq29bRzSF8AIR73rx22H41cR/8903ptCbsdtBamKf1CMuL6HZgBLMNfx4e7rwJKyg
         teKA==
X-Forwarded-Encrypted: i=1; AJvYcCUv6sjuIP2egO+BECH1rAZHQdf+JVf09Vm+t1q+seQnlWTDfRXkmNxmhatU+8neh/y/1wkJ02zIvpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk7gxvfs9/RxO+x+pHutoh1bkj+fBayKFYw+BFwmv3Hj3cP0jt
	SlCoxzDQFYpKox91iYqW1TOvizteHKgS2FhAoCfFmK0EZWhWyPeg3RqL2AWRW3A=
X-Gm-Gg: ASbGnctAFgyS1XJtole/4UP/p6mg7Lc4HQ3yIypNq3cVYctzKSAIQlfHELJWHFeUmpf
	GjY+a1UiT09ta1vRA3jkrEehrOp+RDag1lABVB9bS+XdpxpKwpugGfrhBnBB9CyKf+xyHfI0Wsz
	99umYR9QNtOruIeYGDn0vqY2Mq4NJ6N1MZTI3KQNXf6u6z7wxSFduAMR4PhP+FIlP54lvVMj6y9
	rVEDHdpbvEjyliWW0NHEqDsVLVdjnn0ZXUSzfyb2JaNPwdhoFunXNR3eDhAgYXQbFi1IRleRmiS
X-Google-Smtp-Source: AGHT+IHZpaGL9nGZhARhY/bI9CN8fg77ZL6feb3p3onUCZo34QeqSggtoso0GFqHvFB4Oq1TvYuo0w==
X-Received: by 2002:a05:6402:370c:b0:5da:b46:9395 with SMTP id 4fb4d7f45d1cf-5da0b46943bmr853479a12.3.1736928610732;
        Wed, 15 Jan 2025 00:10:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046a07bsm7164457a12.65.2025.01.15.00.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 00:10:10 -0800 (PST)
Message-ID: <29bd1baf-f1cb-4c74-9d31-051c2b8efae6@linaro.org>
Date: Wed, 15 Jan 2025 09:10:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: Use str_enable_disable-like helpers
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
 <Z4diEj__bbQl4ULS@standask-GA-A55M-S2HP>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z4diEj__bbQl4ULS@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 08:21, Stanislav Jakubek wrote:
> Hi Krzysztof, 1 note below.
> 
> On Tue, Jan 14, 2025 at 08:06:12PM +0100, Krzysztof Kozlowski wrote:
>> Replace ternary (condition ? "enable" : "disable") syntax with helpers
>> from string_choices.h because:
> 
> [snip]
> 
>> diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
>> index 06245681dac7..f3a73ac5a1b9 100644
>> --- a/drivers/clk/clk-nomadik.c
>> +++ b/drivers/clk/clk-nomadik.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/debugfs.h>
>>  #include <linux/seq_file.h>
>>  #include <linux/spinlock.h>
>> +#include <linux/string_choices.h>
>>  #include <linux/reboot.h>
>>  
>>  /*
>> @@ -116,9 +117,9 @@ static void __init nomadik_src_init(void)
>>  
>>  	val = readl(src_base + SRC_XTALCR);
>>  	pr_info("SXTALO is %s\n",
>> -		(val & SRC_XTALCR_SXTALDIS) ? "disabled" : "enabled");
>> +		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));
> 
> It seems like you flipped the logic here. Was this intentional?
No, overlook. Thanks for noticing.

Best regards,
Krzysztof
