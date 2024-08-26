Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8C82499
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724667352; cv=none; b=hSdA0ksgZE/0JBppbuao0JN9Vq2Hq5WO9w+xGdcT1XqcuMgBxm91Ps6+F/JG94L4u0qJGQMS8mYu5x1wAAMStJRT1vDLHYDtqDr0NHEPfYI1ys1FviWa45BYukJ3lIhS3KfO+9Mv91mLhxrveVjr2EIAMJi64KzP+7xwYv1zpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724667352; c=relaxed/simple;
	bh=dqF9qz6t/GVpGmum6vuUYfrUMXNhwX8AG3M4+n1M7ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogbZaHCVbu/mMY5lBmNEPyIzyMQGu8nartWu7UwFRgNB8JlJAwfIufnQEL2KoAWFev/vKRVqJs0YMqmaUmul7lk4E7aaDGwIZyZagqO0Sqfii+3et3OPaZste5ieVGAkgn+DFkicTrOSJ50eXzyfS7UP6a79gj8Y4Ts4JDxvWbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OEI+JDxC; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OEI+JDxC"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f4f2868783so35571741fa.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724667347; x=1725272147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXSb7P5yQsC6ZA7aZwkzK/D+oEX3tz1a/6VEPbOOF1M=;
        b=OEI+JDxC340hJbyzaELF9aZjkFT4nnaE1jma3SYSKf8FaDgA8sj2hzwybWxynxWA5X
         MgON+hpgEbKzURuwi8d3MBJ0Kt82nbfI8ZlyoqEmQozz3gmDJAuM64rbD2K3aR77C3AV
         eROpf5Q0KDSSNQMz4xScqqIHp9FFyA4M/Up6zMLY9HVH0RuZUzVuRa0hsik+ixO52Tyb
         jetbHtnX/vAHZjZMenomQw3dxEYAAjaz9+PnG4E7GEpg+ZincehP7SFzQyccplWrKTjc
         1bLx8Tu+9B23afbvzr66tCsDhNQ02DqmhgGeviPjyhL+fxBZ16refNaKBCLPFxI8Ftsz
         O9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724667347; x=1725272147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXSb7P5yQsC6ZA7aZwkzK/D+oEX3tz1a/6VEPbOOF1M=;
        b=Ho7aBh/B1Yc7k6eeMyC1HRyrPwu1JG7gSssE3d6m74cBVLzxm4fdSIb0aaD8s5wgwG
         JwLjMfaU/Zd8TtxrfOeNKJF+BXV3XlK/grR96RPrg4XqUxVPtuNWqel4O2R721HxUkmV
         iGzSilCsaKBhrQFZqZSP0fiEOb0fOecqZeZyWthiGh0us69bLd2Oa0HSZxd+qXjHqf5L
         kAeV+pD2r+e+JK5LsRUwg0yH9JVC6Q8l4iT9co7z1N0KuXb0kMJe3hrRu+wvP//gs1/E
         Ek7r+lW3+vdY6+lEjox3aW4PFGnAvHb9x0Bfvnb7qjbdgTYWoUiJsNektXgbQQA+TNh0
         FYsw==
X-Forwarded-Encrypted: i=1; AJvYcCV2MZ3eK7AL+viKm3Ei1zop1a3cxZ5XwksptBQhAk2krVQMYe9WvKE11XuPUepH2g1mswycbF25oPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW8PKw2AkS49S6WkH+sYMmgNhMbF4JvRk+/xCNlV+q6eAH+zSK
	M9yaZHr/5lXi3WucGU7Q1tY2OeJy9d0GHre9bcuQ51DrC2yzVZJPPWaONUeDGKU=
X-Google-Smtp-Source: AGHT+IGnOO+pYmBeCnoRQo4bouYucQfop3nBZsepSSurhHBVuFJ58XyC2lvaGwZIfEzC6OWNRHTbyQ==
X-Received: by 2002:a05:651c:198b:b0:2f0:1a19:f3f1 with SMTP id 38308e7fff4ca-2f4f48f0feamr66567071fa.7.1724667346682;
        Mon, 26 Aug 2024 03:15:46 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3e8f88sm5421649a12.42.2024.08.26.03.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 03:15:46 -0700 (PDT)
Message-ID: <7b16791b-0d7b-49a1-82aa-c4db99ff2bfd@tuxon.dev>
Date: Mon, 26 Aug 2024 13:15:43 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] dt-bindings: soc: renesas: renesas,rzg2l-sysc: Add
 #reset-cells for RZ/G3S
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, gregkh@linuxfoundation.org, mturquette@baylibre.com,
 sboyd@kernel.org, yoshihiro.shimoda.uh@renesas.com,
 biju.das.jz@bp.renesas.com, ulf.hansson@linaro.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <20240822152801.602318-3-claudiu.beznea.uj@bp.renesas.com>
 <20240822-vanilla-enigmatic-f0b05ecca4b6@spud>
 <0d8b1322-cf15-4ed9-b958-06516bbb64c7@tuxon.dev>
 <20240823-plywood-unfixed-d8d8a2d93f14@spud>
 <5eae2ddb-2a7b-4c1d-a7f7-41fb39058de1@tuxon.dev>
 <20240823-dilute-juggle-7e2d43b8b630@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240823-dilute-juggle-7e2d43b8b630@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.08.2024 19:33, Conor Dooley wrote:
> On Fri, Aug 23, 2024 at 07:26:42PM +0300, claudiu beznea wrote:
>> On 23.08.2024 19:18, Conor Dooley wrote:
>>> On Fri, Aug 23, 2024 at 10:54:06AM +0300, claudiu beznea wrote:
>>>> Hi, Conor,
>>>>
>>>> On 22.08.2024 19:42, Conor Dooley wrote:
>>>>> On Thu, Aug 22, 2024 at 06:27:47PM +0300, Claudiu wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The RZ/G3S System controller has registers to control signals that need
>>>>>> to be de-asserted/asserted before/after different SoC areas are power
>>>>>> on/off. This signals are implemented as reset signals. For this document
>>>>>> the #reset-cells property.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>  .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml | 16 ++++++++++++++++
>>>>>>  1 file changed, 16 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>>>>>> index 4386b2c3fa4d..6b0bb34485d9 100644
>>>>>> --- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>>>>>> @@ -42,12 +42,28 @@ properties:
>>>>>>        - const: cm33stbyr_int
>>>>>>        - const: ca55_deny
>>>>>>  
>>>>>> +  "#reset-cells":
>>>>>> +    const: 1
>>>>>> +
>>>>>>  required:
>>>>>>    - compatible
>>>>>>    - reg
>>>>>>  
>>>>>>  additionalProperties: false
>>>>>>  
>>>>>> +allOf:
>>>>>> +  - if:
>>>>>> +      properties:
>>>>>> +        compatible:
>>>>>> +          contains:
>>>>>> +            const: renesas,r9a08g045-sysc
>>>>>> +    then:
>>>>>> +      required:
>>>>>> +        - "#reset-cells"
>>>>>
>>>>> Given this is new required property on an existing platform, I'd expect
>>>>> some mention of why it used to be okay to not have this but is now
>>>>> required. Did firmware or a bootloader stage take things out of reset?
>>>>
>>>> On previous SoCs the SYS controller has no support for controlling the
>>>> signals going to different peripherals (USB, PCIE in case of RZ/G3S).
>>>> I'll add a note about this on next version.
>>>
>>> My initial thought here wasn't about previous SoCs though, it was
>>> because you didn't add the compatible in this series for /this/ SoC.
>>
>> RZ/G3S compatible is already present in this file:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml#n26
> 
> I know, first thing I did when I read the original patch was open the
> file ;)
> I don't care about the old SoCs, cos you're not applying the property to
> them, so what's changed between SoCs isn't really relevant. It's a mention
> of why, on this SoC, it is safe to add new required properties that I want.


> 
> AFAIU the answer is that no consumer of the resets existed before, so

That's true.

> there's not some special state there, and I am guessing that the new
> sysc driver you're adding isn't going to fail to probe if there are no
> resets, 

That's true.

it just won't register a reset controller?

It will register it but,

the new sysc driver is going to probe only for this SoC (RZ/G3S). On RZ/G3S
we have 2 resets. These well be registered unconditionally, currently, only
for RZ/G3S. If there will be no DT users for it then it should be no
problem, AFAICT.

SYSC variants have common features b/w different SoC variants (one of them
being chip identification). The feature implemented though reset controller
in this series is not common but particular to RZ/G3S.

When the SYSC will be extended for other SoCs the reset driver registration
would have to be adapted to not be registered. At the moment, as the SYC is
compatible only with RZ/G3S and the reset driver is registered on auxiliary
bus though SYSC there is no restriction, reset is registered all the time,
but SYSC is only compatible with RZ/G3S.

> Which is fine, cos all
> devicetrees that have the new peripherals will have #reset-cells etc.
> 
>>> What's worth noting isn't about the prior SoCs, it is about what makes
>>> it okay for this one.
