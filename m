Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7896279327
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570133; cv=none; b=fc+cJhMA+pquDzEwUrGHuG4rK0yakdQmyXLuxwle3RsLeVBz83f8eLQX3W70bOxykagoi4il7Nyh1ywwtXhBOqfgVbeS99cw9+KueJ2Ow0fjmIY+CcDAKAicTtmV8K/hQmRZh1amHnNXv2AtjKEfU8E3u/kemqXcMetrU9Qm9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570133; c=relaxed/simple;
	bh=1bB7L68kzJayTBvOhwCV/SjorHR+hB0GqpWfqKFMQiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv7X46hKV0KFBvzMhqk5mZ3Hs7hQHk94xU/TBu8Um/1OW/eiNAG6VfV4Z6XKvnw8eKtHUrHrhg+JDbdxgQSg6jo22ctm4NJ9lmtDcAF55MRBpYrgNPIVNemJaze3O81igsl0+EGiMMoDtVUCnPvL2WFjY/N0R5wRwVeBEuaWC4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwFg2t9S; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwFg2t9S"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-378d50e1c77so41882951fa.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761570130; x=1762174930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxCTtcPsN8230LeCJx3j5DlRF4pEORPX1pABk9GNfEI=;
        b=fwFg2t9SG/sQuwHr+iOuOpC3wwIySvcp88EAW5Qw6/Py2Yfu/2U3pqbMMiloyGL1yn
         G9+B5zMpSpXM4hzVroUx7nDp4F1WdWzgZg3/FxjVAiX/Cn2Qg5zLHAX0lZEjldlbL2p3
         sByH1SDT+v5XdZLtuZLBrns3GsT6co610lr6RHkGvnsXR3xhPpteK5/q/8y+qpLRVKv9
         tqxel4Y+g408wgC2IBHHrud94bIMJraSCJnK06sYsrH0aUCYiyPkLl3PKUu3WFvxd7fU
         BmmnRXhLT5m0u7X26zANng3rEGNz/8K0OXYPDigWUZrtMZdikTBFGHkLk6rpt4Ib2ehe
         kBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761570130; x=1762174930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxCTtcPsN8230LeCJx3j5DlRF4pEORPX1pABk9GNfEI=;
        b=E9wLQWFLlkSkfKoznJOoRabzS5dv9hV7E7Qs3MtgIBn3az2I0bd8ZdeAQAnqcymcC7
         uRRE31rx5did5eliCSQu+7hB+lDyK/I6TRCqwVC9NWXRf0pvPOs0SKeRGG0lQr9kKFsZ
         KBja+N9bLQLeh8J8K5ea7QD+JNJeKukrsS2tZ0uHruC8L8CeSPIlcifv+mfZQgWnYzqo
         NC5C/YDUy2ZbaVsBgf5PpuzYEnN08K+kspXbFSyzV/cyR8c1cXSLjMAInlabBnq8R5mI
         3OH4LKkiKBpX/9tRBvJowlIUGjmVlj6hhxsu+Psu/YmLH0L8JgYw+2M3q0b/0DcwYSsK
         CXMg==
X-Forwarded-Encrypted: i=1; AJvYcCUoxuCQ5U0rUiGiabMYEpqRDop05+BxnJE9yLIT3rYnBp52f8e5NvnI8uCsHvDkm9fjPvavsf5ylBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIKSUe/t5xzt+hx2nveGqSI695idUW42JTEzXeCbUJsG63Q1KR
	Ewjix6q3ZYjgQV7uhMr6DMIecir/epjAOBAl5wJtM/jIYewZ78fARpfW+aBC+Iy4
X-Gm-Gg: ASbGncu0UmwyLynW3Fyhb6uQHAFr/QkxBZJNphV2zkEv8ohL15xsSIMjfmE8nuxadZ+
	8aB6ldphpbBnd+I8vsbqaijOze+kqjLGeGbc9kBRS4AETnb/1eRtiVpTTVTezK9xeqApsM8WY7J
	thY9xM+LNGTHRI7ZmE9EGxxRE/l2iGXoNQZMSlEx9n82df2a58azFBGlL2X4+Ro4HIQMVOmvpYj
	KzdCmigza+KV8HadnJ8iXeL/m16Z84nRE2vDlDemrGHGgMQyOttR4dfZoxZsaVPOyXTZOGfqNDb
	a/QHhUPdnZwfC4Cg8iEz+zl95jfS3j4ERUnnnQBRBDhEZ6sg0mPOFWFatEz6LObyuVxywgPsyfB
	0y2TGZAdPUIzY2qvAely04ieSPSHxciw0ECsmxbQGi6AxxSDMYFFu03GgBdOlxjkH6QoA6U4HVL
	UqguLnGJLObXn0nGfBndKUY+o+LNtM2AgqlvTHEJe9pH4XDc2zfj6dIMIbcw9lnqmUHMud
X-Google-Smtp-Source: AGHT+IEl/ogSJ08y9LQ2dV4OaLLEyD6Fjj0ThgIRaIYYP5R3v0fiFqlQt8CBQpsPUF3Equew6ssOkw==
X-Received: by 2002:a2e:b893:0:b0:36c:f6:a4e1 with SMTP id 38308e7fff4ca-377978c6d84mr104935861fa.14.1761570129393;
        Mon, 27 Oct 2025 06:02:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d0028sm19860371fa.35.2025.10.27.06.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:02:08 -0700 (PDT)
Message-ID: <a74c9c52-7c39-4c66-bdcf-0fb9e1b8f77c@gmail.com>
Date: Mon, 27 Oct 2025 15:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] rtc: bd70528: Support BD72720 rtc
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <380ea1fdbb94a796418e8f463c6a9436001d572d.1761564043.git.mazziesaccount@gmail.com>
 <202510271238195ef3bdfb@mail.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <202510271238195ef3bdfb@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2025 14:38, Alexandre Belloni wrote:
> On 27/10/2025 13:47:51+0200, Matti Vaittinen wrote:
>> The BD72720 has similar RTC block as a few other ROHM PMICs.
>>
>> Add support for BD72720 RTC.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Note that we didn't get 07/15 that adds linux/mfd/rohm-bd72720.h which
> this patch depends on.

Thanks for the heads-up Alexandre!

For some reason the SMTP server seems to be blocking the 7/15 :/ I will 
try to figure out a way to send it :(

Yours,
	-- Matti
