Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF61194AE6
	for <linux-clk@vger.kernel.org>; Wed,  7 Aug 2024 05:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723009464; cv=none; b=G5ZJaQ56v49lw+OYKx2IOhSwHW/CBkGjxqTc6M73TyIq0j36o/WGH+VwG1BhSVr7oU8V1a44Xr3LQ1ZWdPz5oxh3w7JXtJd8VEDP6yXvKdsFKBPr/zg0Mu5aOYwTkApeZWJS4w4sgqtlrfXiC7qCjQJ0h/wjkPxmYwvoMwVHiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723009464; c=relaxed/simple;
	bh=fapQ6x5gI2JOlVQoGQ5d8o/Q1AMF9TM+MVs5rh/JsJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1ZiTjT30yNXQcx5pL6V8feQdQsm63uWAQviUL6OOCK9oz7QPi5FagCvamXz5MIeuYbaaKI51KPjcoxTtT+6rdihrkO/vNNkuGSoh1p7TpYQflkMK1VppOtI5xyMHNu/E3NbgJbnWZM4p9u9S3qF4sVRQTUg1ZerB/kh37RylU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHKksDzv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHKksDzv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428243f928fso13343315e9.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Aug 2024 22:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723009461; x=1723614261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YYvtAZV3TwwDs8P6LWcM/NhmCgmBu7Q/FCcb43o0uvc=;
        b=GHKksDzvrlqXzabLG0pblhh7Xlq9xSximyZtY2+JFUu4aUTmGH+fGhDRMOvATCcWig
         8SyEa3D6aK7SHzdeyjPYS54wR6xqEhI0/lW/orMUyCIqNuMLupHQ3NXF2wEFLKhaHxiN
         ui6lmsOrE9Wuwv8r+zyv4VI7o9pUQ2H3kclinzquZGlva9wLLA/auPoptnGwdHbqeR5v
         HnFsikoFxd1lOp7Mo8fgWKFHEkVWn+kLHqalNsg5ZtlDMxooHT6BM0J67OJudYMaBfwe
         d85oDLXxMOD75rAEQ7RbVX+fQ6yZW94cab1Su6DSWzeMnB65MZFVxw/D0KQ04MsXBOQ+
         R7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723009461; x=1723614261;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYvtAZV3TwwDs8P6LWcM/NhmCgmBu7Q/FCcb43o0uvc=;
        b=ptIDffP5y9YFmTWAECsinGOaFfuNXqzKoFK/Q7WeZ2IsXNApJHE645PmQreLF+CP19
         KdUd49fUMZETtO6ykff197W8HpqBRGUCl8cQvmii7FUMiu3YYrlFFYWeaV30fu/BOxoB
         ih6vKYMt7L3+Wh06EQMotDY/c5dcq5JtEAtrF/pkz5luRRJ2SWc5lHCM4AJQRmnHpL9N
         RucbRap6t+m2SJ8FBI7cr2uAo39GOJz+Yv+N/gdj67Mno869JmUM2yDG1/gBAjUrUaNn
         RTS24B5gCSu9LNJLjv+JCYjiusY2smSNCTz8LtfOHDwsZ7OihCcNhKWbyOkoS7dmYC/a
         +/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY3du3l73DfScE13kNRF9PayLggjT1vaXP1hLDoSyLlslRhD5i8wYCK30RH2lpGXFlmwOSbPtXnN9bzIqSGEhITdcuOjPlnCfv
X-Gm-Message-State: AOJu0YwLfqp4lfFN440RukQGZODxT76gl/h/uKmHZqPrvVI5H0AXJBvT
	Sa3uI7iQxLFOxMBRVqDMjGg5HntKdleWvRu7GRxkQDdCNCrUKATEQuXmkOYLLFQ=
X-Google-Smtp-Source: AGHT+IHnxbGaADuzPzhsRwpihnt7TlQp4Jv+4CgR5BaN9LOP9hfqFhkfMtk5yaw27R7dHOFcHll7Rw==
X-Received: by 2002:a05:600c:a4c:b0:426:6e9a:7a1e with SMTP id 5b1f17b1804b1-428e6b95ac9mr124815655e9.35.1723009460544;
        Tue, 06 Aug 2024 22:44:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429057aa0bbsm11225755e9.26.2024.08.06.22.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 22:44:20 -0700 (PDT)
Message-ID: <2da06dac-7a1a-461c-956d-13b74320723e@linaro.org>
Date: Wed, 7 Aug 2024 07:44:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: fix C3 PLL input parameter
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240806-c3_add_node-v1-0-c0de41341632@amlogic.com>
 <20240806-c3_add_node-v1-1-c0de41341632@amlogic.com>
 <b63fe216-ee29-489e-a175-e1525ac12722@kernel.org>
 <86b01ecb-6ca8-496e-b3a8-0b21bb951a60@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <86b01ecb-6ca8-496e-b3a8-0b21bb951a60@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2024 03:55, Xianwei Zhao wrote:
> Hi Krzysztof,
>      Thanks for your review.
> 
> On 2024/8/6 21:10, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 06/08/2024 12:27, Xianwei Zhao via B4 Relay wrote:
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Add C3 PLL controller input clock parameters "fix".
>>
>> What is "parameters" here? Why you are adding it? Is it missing?
>> Something is not working?
>>
> Yes. The previous submission was lost.

What submission is lost?

> 
>>>
>>> Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock controller")
>>
>> Why? What bug are you fixing?
> 
> The input clock of PLL clock controller need the clock whose fw_name is 
> called "fix".

Then explain this in commit msg.

>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>> index 43de3c6fc1cf..700865cc9792 100644
>>> --- a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>>> @@ -24,11 +24,13 @@ properties:
>>>       items:
>>>         - description: input top pll
>>>         - description: input mclk pll
>>> +      - description: input fix pll
>>>
>>>     clock-names:
>>>       items:
>>>         - const: top
>>>         - const: mclk
>>> +      - const: fix
>>
>> and that's not an ABI break because?
> This is "fixed" clock.
> I will modify "fix" to "fixed",in next version.

With "fixed" it is still ABI break, right?

Best regards,
Krzysztof

