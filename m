Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C4F2475F7
	for <linux-clk@vger.kernel.org>; Tue,  7 Oct 2025 06:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759819924; cv=none; b=ltLm236O0WY6eNiw/cvlzWodnfQiFjq6yVeeqY/c+5mOIrl61RL9jdH7B4G7Kv561Y3QTS1m5yjoi/0la+nYfvBZQ64OCoVdTytuIya9+cg7tF62zMN8lCoVvr3NDEwZKtz9I46Kvfx7MYD7sXLVAl5iccc6K0nlW9yApTMM9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759819924; c=relaxed/simple;
	bh=4loRM5gaCb0DmrQhpmPykT92MCQHM1mMk27AIHOqax4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKD/MTR6Vw04wdv0G2kGc8y3RKxZFKtjsHgmk81L2n4fmbN3K3qcVdhMaJDftUz4Vwu7xhljFPmp6FD88mV3ofMeYghbLXeQ9CRuaJY3478lupCRVUNntYI77cpL7zJKFHnKIdxPniziIgpD5nLqVfjHwTi3HXKH0B2k3pQOBwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK50/cll; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK50/cll"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7a16441so950780166b.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 23:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759819920; x=1760424720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi4jSexlkWUECSgX2tttLCZoyDCErk3ZozLNSj/B39w=;
        b=NK50/cllulywJQvmFClNR3eoMhJoWhwLHrjoPJAntq0k5TnKhI1hc87JVOgqS5RZFi
         WVmSeGYqh/tRDuBH825GEzcCUTxOcL1xZtYdEI3CU1RdUnOtnjzqc/JEPm6896+SludR
         WL6Zz8g0mr9q27ytEuYthP5C56YkAFvCzk6rFJBWO9K12Eal3Cbl9QqiCMBkrpSEmpUM
         Q6w5dV995K/0W8XdLbIFXWQmhRMD0M3ZlaOK3ZDrwMjjEjKQQsF6yGr3Hmo7SuYU+fqS
         HRfzGA34a+cfgbrWGu1qEGjykmzG5QgDexGAbh4YdFDbCPUd+LWiM0qUQuy0Rpe6INbs
         fiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759819920; x=1760424720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qi4jSexlkWUECSgX2tttLCZoyDCErk3ZozLNSj/B39w=;
        b=E6Lf6F8XDahAimoqfAIYRuRXWFIwjqSecNwEtyOSrlLCvHs65X9ur3lTG/8JM0ygtO
         RESWhzSrpHy+W4ilCTWsWrJPRx57HphzWUx6pWZHML2jEXTVnFc7oLp5DPFOXAzilX1H
         42aQi8a6sIFuqNFBuTaXYqs1kZJsiPjnpeiYlbPSwbTpCSZFsrsiB2XYNgO8CFpxMWJi
         auISMX0Zb6cD/vQSx0bxzrdIEjvcE/Fe1eWTkBVF0wgPoXt04uPxZdr/ae0PDGRbL7uR
         9sa9tN9ksSFy+QHGqxzVJ/0Q2aA2kXKdwOJs+uW/a6cNB6Glen9HBmr0g2tGPaXKwSp4
         NpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdwtGNw4NxFyfwsntdyAUh1+LIZhsbIP3pmH3MLjyZlmVhV/7LV6HilFFaw9/+VtyOeF5InQNOP8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRt987uu2u+SSPSWi+vgVzyvEYNnCPCFsf6R/EAhTmAL/FDjXQ
	p7q6QAZDweyhiRYKYisY1iJTbZqQtsfv4VeoN0vo66DEs1LLbEo3+8Ft
X-Gm-Gg: ASbGnctSF0954ESeWM9W3+xTWPh5jXFcYiESGyPNZ0lYQJ39diebs8kkByz9DGh8YJq
	blU9gHMr3hz+fMax6HJ+ctCXPcJlrQHHRcJqvWmOPn/5uX/Oj6TLxlnpcyt0qOjnWV8dulCBOEj
	VmdWSqtO3DfZVe6H0sEos11b5ffffJv034BgNJxPk10IRjyOpi29CgzUMzhZH1hmsEWsmpivmDM
	wzBaRrUPFeaoxUhFhbYmfkpIM/5M8IuyRTQnOoP2OF7bFfIPC482F3vTyiB1N06sQUI3tWINW9M
	UPKoUJbntUi6mswxjzyuD6GUBO8yinVaxxBNLUhf9mdnvqvxpD+JFwHRkSEce5yW6Kf9G+htNcC
	rmU46Ny5fFazJj+5xEbPoZA9vaYNQI02NlLRA5zYqEUafG4H1+s7EHtlSoewxSo8TkGNaQ2bm9w
	zMlBdhBTOktP1doO2ihg==
X-Google-Smtp-Source: AGHT+IFvQ+6sECDp6X1RNdh4i7W+52rk1hyacY0z/SIBtBQwCNvXpsQ4sXmTPd2Hk7QYTKW33PKEiw==
X-Received: by 2002:a17:907:7ea6:b0:b43:5c22:7e62 with SMTP id a640c23a62f3a-b49c408734dmr2046124866b.50.1759819919751;
        Mon, 06 Oct 2025 23:51:59 -0700 (PDT)
Received: from [192.168.1.10] (83.21.74.153.ipv4.supernova.orange.pl. [83.21.74.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a684sm1299412866b.52.2025.10.06.23.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 23:51:59 -0700 (PDT)
Message-ID: <cd54058e-0208-4357-8a5b-4c6bb9f6cfb9@gmail.com>
Date: Tue, 7 Oct 2025 08:51:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 0/9] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Elder <elder@riscstar.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
 <d36c5597-e26e-4ddc-93b3-222d8b40dab7@broadcom.com>
 <175834646902.4354.13114906749225372224@lazor>
 <7eed7848-b3ca-4415-85c6-7267c91560a6@broadcom.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <7eed7848-b3ca-4415-85c6-7267c91560a6@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25.09.2025 23:04, Florian Fainelli wrote:
> 
> 
> On 9/19/2025 10:34 PM, Stephen Boyd wrote:
>> Quoting Florian Fainelli (2025-09-04 11:28:34)
>>> On 9/1/25 10:07, Artur Weber wrote:
>>>> This patchset does the following:
>>>>
>>>> - Introduce support for bus clocks. These are fairly similar to
>>>>     peripheral clocks, but only implement policy, gate and hyst.
>>>>
>>>> - Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
>>>>     and update device tree bindings to match.
>>>>
>>>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>>>
>>> Stephen, are you OK with taking all of those patches through the clock
>>> tree? Patches #8 and #9 have a dependency on patches #2 and #3.
>>>
>>
>> I don't normally do that but sure. Is that a Reviewed-by?
> 
> Sure, let's make it official:
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> if you prefer that I take those patches through the ARM SoC tree, that 
> works just as well, I would need a suitable acknowledgement from you to 
> do that.
> 
> Thanks

If it helps, I could re-submit the DTS commits as a separate patchset, 
and only keep the clock subsystem changes here. Then the clock patchset
can be merged first, and the DTS patchset can be merged once that lands.

Best regards
Artur
