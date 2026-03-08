Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB87433D502
	for <linux-clk@vger.kernel.org>; Sun,  8 Mar 2026 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772988343; cv=none; b=ATqFcrMdVydPzV+N2hGvODemZ42mAr367DDGo4Asy3Q+tGMxzwMgKVrEE2afRvQJQg7gX0qf5Oj6yxzcsZ+XBG042z/GaeCG6GaFVgNg1xTZeQW07/nDu/n2WKaCd6RhdrJWXwMZUq06TfR1qaWuaN0gvD5oOz9ZZcbPwaoCOVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772988343; c=relaxed/simple;
	bh=Gx4dxJsQx0b07vbN8WAwxGrs5GBs6KLLGTVCu+elkwk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OXSKI3aiZZiymjclHxhs4jkmBqGUDqt+1WAOImp4027lhuYNLQQDdv47E6Letb8R+nxAFcO4Ar8Fyd90enFVmbiHPxPDECgmm7FApcU0OFti6jcuVGwiyMaPVCqSwlAfTV4MOf4QMvepg+VeMqcYRKWMSeuOn/iZAr9Jgy/ZaHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ihOENHvk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ihOENHvk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48534e9076fso3254365e9.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Mar 2026 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988339; x=1773593139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUsdONGIuqr07rjgXiFXfrB4ESlzFRwcXKo6efQ80SA=;
        b=ihOENHvkw6W3U7yyOdXp7JspoDq4Znr1lXFaJndthEMj3qaDk835YCYX9F+9DksYgN
         m22F1KtQYoWPI8WTXRkJPTyTkLEEKBY1XFF0boG0UG1RqdOKIMh2VmlOJLMokzSv21Ou
         D2umgv09hO/aASOSKiGxODrkC9LSlBTNe7aitwni0elzMVvLoc67CdwKCMlvlLK248Og
         P/0xJH2kXEQVefsKg+bILOHYVdXdrLL5fW5Mgo8M7o+Hc70r9kFlDOBZr8CCxYGPAkGP
         oK4pN+7OOSHAx+vsatkpEluVZeExtfuum48INMPFQipG43ZA4Ogkvuwv/Dp6YYmXuKPs
         /aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988339; x=1773593139;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUsdONGIuqr07rjgXiFXfrB4ESlzFRwcXKo6efQ80SA=;
        b=RYlHUUgKMaycnd1ggH2xd2kXJ852s4fnPOjz7Ei/5izcz6xtW3l/iQSYpk5G0W08Y3
         LpzzdMvUuJ3dHp45CSdwI7UmF2akcst6kRaydHMoFlcgNrQq80cu6h7Q2IkglROr2FOJ
         WuBYZ3YYAZSTzHpM5sSYWwxGxsYDboHmfizgUKVVYPW0uwINWUK83j75wQ7i11XKOYnt
         TmxrfvHo5AdPufkMK5FlnDiKRERtoo/Wz7Wndn6VLTzGV880UZDzoH+EQx4ceunh6DUT
         joedIpCJGzNR4uljmBYWvc/1yc5lm8Xhi3FU8hUpQJshqZyU4w6b+Q8+REJO1FrCR4Rr
         M3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVYGwHn+rm/CHpd5PAx6o9Yad2teTeNnLSxPmsBMeNU5ppboWvmhm2Aw/akT04L2nCEdQRmK867uW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlaJzjDXZPDn46Im667mjShwWUWN91Mz7gaKTdmCZ5V8d8ekeQ
	ukuxS1xXs+JXdYSQRgZYOuZyLT3WGD1vu04iuAgMy+hUAgIj6tj+HEEESKp7coaVRe8=
X-Gm-Gg: ATEYQzzWkR7KB0bnnHvFyJYgq/Ytoc4w0xPTiL2+AiJQL1I4UoNGOqDKxgdF1xE1qaF
	+a1CWhYIOUo2NnbsDZjAux3W2ZVdorura0d90waouGFWZJ/t14PdAa96GwJmnku4olb2G74e1D9
	55QAdKYWWduJV6wBjSLsYR6YHPb9HhtZI64LmIugWf/OfiInLqM9lsiF/T/cqjVfiaIm51eR8ir
	xWMJcUTid92Fcn6nJJ1RaAU+61hMlrJuE/i4zJjo0K0W4Eo2hNzQagGQy5/vTh/IsGs4NCanLsC
	oUsWuG6lcEcVzOIUenOJvuTnWHiIV//R7lYFNanBALTaycXWEjxpdjXpiOYwi/d9pxuhWTcB9sB
	nUHHDUWuWyICYvxM1GW+V8RKlYacIGh6ASN+fsHOEzBx6wd61jA9Re29fjToz63F3zpoFPmay3C
	x1XjJs7uBep0hhL/HXa66vcRT2C9axUA==
X-Received: by 2002:a05:600c:4fc2:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4852692bfa5mr139387065e9.13.1772988339042;
        Sun, 08 Mar 2026 09:45:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48539e574b5sm40900765e9.8.2026.03.08.09.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:45:38 -0700 (PDT)
Message-ID: <203fb24b-9ea4-476e-a866-0befcdcd6224@tuxon.dev>
Date: Sun, 8 Mar 2026 18:45:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add required
 clocks
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
 <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
 <cebf4298-4dff-481d-9a77-09d4fb4f7fbd@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cebf4298-4dff-481d-9a77-09d4fb4f7fbd@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+ Alexander Dahl

On 3/8/26 18:42, Claudiu Beznea wrote:
> Hi, Alexander,
> 
> On 2/20/26 11:58, Alexander Dahl wrote:
>> Hello Claudiu,
>>
>> Am Sat, Jan 31, 2026 at 05:47:05PM +0200 schrieb Claudiu Beznea:
>>>
>>>
>>> On 1/20/26 17:44, Alexander Dahl wrote:
>>>> The OTPC requires both the peripheral clock through PMC and the main RC
>>>> oscillator.  Seemed to work without explicitly enabling those clocks on
>>>> sama7g5 before, but did not on sam9x60.
>>>>
>>>> Older datasheets were not clear and explicit about this, but recent are,
>>>> e.g. SAMA7G5 series datasheet (DS60001765B),
>>>> section 30.4.1 Power Management:
>>>>
>>>>> The OTPC is clocked through the Power Management Controller (PMC).
>>>>> The user must power on the main RC oscillator and enable the
>>>>> peripheral clock of the OTPC prior to reading or writing the OTP
>>>>> memory.
>>>
>>> As this was not mentioned in the previous datasheet versions, the current
>>> driver don't handle those clocks, and it probably worked as the clocks were
>>> enabled by bootloaders, I think the clocks should be marked as required and
>>> this patch to be propagated as a fix along with fixes on driver and device
>>> trees.
>>
>> What do you mean by "clocks should be marked as required"?  Where?
> 
> In the bindings as you found that the IP don't work if the clocks are not enabled?
> 
>> How?  Is something more necessary, than already done here?
> 
> Update the required section in the yaml file with clocks, at least for the 
> sam9x60, as you found it is not working w/o it.
> 
> I presume it has to be done for SAMA7G5 as well (as this is what the newer 
> datasheets states) but that would involve adding required clocks now which were 
> not needed later. I'm not sure what is the procedure here. I'll let DT 
> maintainers comment on this.
> 
> Thank you,
> Claudiu
> 

