Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DE221F38
	for <linux-clk@vger.kernel.org>; Thu,  8 May 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706640; cv=none; b=LKEtROew5en8qcbxMkq26U2pgCAAOZDp1Myo2YjgVKCTV9iRcVxTEvj28hsnQzGbXxjuOmzk+YvdpKCRiKKCI2j4U2c+e5pT3VfE094qY63gczn+bXhq81YRWGrW3Jj3LnX+Lk9ww4g287taZL6Ez3/0E19nUMC89MjHIo5gD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706640; c=relaxed/simple;
	bh=gI9+15/uiqpn2T7b42r1EP83YhqQAQmZi3IavWEk6Js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1azNlqsfPEBlMb75Y5UcM2gpigy9XzTmaXWMuk5BbTd+SHCsPGBmxXkU6qREdyyvpYEFSZI36RAgsXVd4XJp0/ufl7Q1oAMTvVee45teSOtoFmUMq8ziPsGsYoZXU26DgndOf/CorpoqoRcDE3qKcF9pEaZUiSZZ0mSL2dCbQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=k3w/widk; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="k3w/widk"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-864687c830aso76635939f.0
        for <linux-clk@vger.kernel.org>; Thu, 08 May 2025 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746706636; x=1747311436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITsof7vKMaX3jP45vYP8VvBDvnD7ar/ly91W1po1fYs=;
        b=k3w/widkR97bsDT61lsM4hK+UnsGe+OLVgb5KbiBJQYmL7Idof7dIWDZQ5Aj5LJrKV
         bZpxNWRFsDQtVkJC4jRsuxXKcunGSpiy691CTRdWzD9pnGhizU9V4lf5zD/14wKzk2Na
         ShQCKJzCBKRFn1+nPMy0b7mZuEIsZ8Rb9OIV0VR4oAt/AFyhgMaGF+QBrhbS9+WCWaYv
         lYZ8IVJTGxULjIswSIhurxkME4u6UUmu4o4daWrZD6OS7l7Ub7nlAtxsoumelTadM6m2
         quwsUd9lD8NdnnkWHea/Z4sZI6S6bkE9QCLhSWXYePs+1Cb9XY+gggvcYO/s8IwnlfYD
         eFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706636; x=1747311436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITsof7vKMaX3jP45vYP8VvBDvnD7ar/ly91W1po1fYs=;
        b=TcOriBn28tsBV0kjOdp8vUsXWE+1iIIEeUuyMmOhTYYxjhtSTYZSG+d0xeQ6MqxvaA
         1AYt0Giu+WV3N6+SdZQsmCMiwMWkBSu4013UW8rmNgSkTrnsJlKjs5ePhFqFvOClFwyh
         bLojHYpSNx9sk5ZBoEXH+Kp5QF8kcb5enpgN6W40AMFvG6cvpYqPOVP9LQZbmi0uzBnl
         OjaonlrZk+eHDa8LDPJJr6fQkGwTvMsmlVpcbO7DKX3l+o3GcL4B2+o3th25Ay7sT6bV
         fcT+GC+Fm5yba++3phyK6OR4z8Q6Wb9TBVxE1gL+7nXzydq72o7DAg1O6dPq0unK84et
         M+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV3b85lHgeSeTb2bk0DxbdC+zHDuPTgVIL9IOTjKrxs8zJcpjXLLjBv91KsiMhPsfEukrThzyq2Wj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0a1zyZK/ELImiM2ZhiHgo/BSIb98LpsKvL7NpBZ+7xHAIYro
	+sNhlKs4W+oFgjvB6pTTk1pN/RJHGyAz3BcqhK1DyP8d5SrRyCQa+9JPBtxalgQ=
X-Gm-Gg: ASbGncvM409z0wDnDbMogGvR3TrW+JnT7didWFgQ82W+iYG55s9AbpDdFZynhyTDd65
	GBL5sjaRZIu4m+WMoAf5clzY0H9bwai1/6LSiei/iY/PeObhTwwNAuIF4j6jCkKNY7D7sTbvKOz
	r0ILYIibeVljjoTykfRAdZu7zydt2JDIr20eUA2nbBetcIxdnHyKyWUsUNXI9roLkeAgU2k43iy
	GIG0nn4H+rJpDUIuUUYKV5Em5Q4uAAiVULuZQsLQiX7kFfKCyFAafFF1vFqJP337sL9WDCRzYcI
	hGOvBh0o9zSUSvtb4qDhODfLpmtKt16HG58WOxfN5RtoY4lGHdOlOScTZ0VJKNMz9Q8MpDKq9Oj
	y+x8K
X-Google-Smtp-Source: AGHT+IEpsfxrAkflVw0/hRABTEz4CwO/hvBuswU8lzk6t7nrXFnCj3fyA636Nq30np0oFo7xbeEBJA==
X-Received: by 2002:a05:6602:3f85:b0:867:3e9e:89db with SMTP id ca18e2360f4ac-867473170e3mr934513939f.8.1746706636487;
        Thu, 08 May 2025 05:17:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-864aa2bb1bdsm294250539f.7.2025.05.08.05.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:17:15 -0700 (PDT)
Message-ID: <1521c828-31f3-4e45-a651-750ce2e37364@riscstar.com>
Date: Thu, 8 May 2025 07:17:14 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu
 resets
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
 <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <22b7b5fc-6f5a-4ce8-ae12-a7423925c113@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 7:02 AM, Krzysztof Kozlowski wrote:
> On 08/05/2025 00:35, Yixun Lan wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - spacemit,k1-syscon-apbc
>>> +              - spacemit,k1-syscon-apmu
>>> +              - spacemit,k1-syscon-mpmu
>>> +    then:
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>> +        - "#clock-cells"
>>>   
>>>   additionalProperties: false
>>>   
>>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>>> index 35968ae982466..f5965dda3b905 100644
>>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
>> would it be better to move all reset definition to its dedicated dir?
>> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
> 
> 
> I don't get why such comments are appearing so late - at v6. There was
> nothing from you about this in v1, v2 and v3, which finally got reviewed.

Stephen Boyd said "please rework this to use the auxiliary driver
framework" on version 5 of the series; it was otherwise "done" at
that point.

Doing this meant there was a much clearer separation of the clock
definitions from the reset definitions.  And Yixun's suggestion
came from viewing things in that context.

Given the rework, I considered sending this as v1 of a new series
but did not.

> I just feel people wait for maintainers to review and only after they
> will add their 2 cents of nitpicks or even some more important things
> potentially invalidating the review. Lesson for me: do not review
> people's work before it reaches v10, right?

That's not what happened here--or at least, it's not as simple
as that.  Your quick review was very much appreciated.

Yixun:  Krzysztof was satisfied with things the way they're
defined here.  Do you feel strongly I should make your suggested
change?  Or are you OK with me just keeping things defined this
way for the next version?  I'd like this question resolved before
I send the next version.

Thank you.

					-Alex

> Best regards,
> Krzysztof

