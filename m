Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1291E491
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718974485; cv=none; b=sM97mcuTXmZmHUsZIqH8wuaVnX06U1oPosAjoBSOkhwWOvmUK8gZOby10y/2/uZJf27WCCEj47DhIOIzXzm2KeX/kdc7BLiqnljTHyfbStRY0qglNcKjvoZ2iOQ2kPjg4EY0r2Lf3cL5WkxRhC9RqBcTppaDYS0jrw7ZjjDHnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718974485; c=relaxed/simple;
	bh=Od8+egiUvcnM9EgLFfEIVEJKblhocI4amkFz7FC2SEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JG/odcu5XBJwV48Ahi8pnJOicIUQx5Tg1OW+AnGg8Rcd6OGFABf5LZFRET4AfxDNyf3qPDONthWcX0WlZnF4sT2GY5Y39yp/zN/82ukAFE2V+D1woBlZsWJQ6UNFrDDYIEwvahEUe54nnBnO0B+ocWUajKzoRdVOJxt16QXLnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XXLst56z; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XXLst56z"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so37346211fa.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718974481; x=1719579281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nrTwlYyUewM020gU0HwmTEQfK5aZ3iGGdgEUfErTPYY=;
        b=XXLst56zeUsF0Vrvi0n105xPkTuR8iSMw3fHVNtoUgUUX/AxNUSnh34dP8DlNYK4mm
         OjRMu890lLlXj9oR75Vo/gD598zlIEX62g7RDKGsNnssDGS7v9l7LjGgWnIiplxBkuvX
         365GGqA2DhhFAGXV1jI/8Mhdi79tnJRHgWB/gKCPlT8fwSfcAaNTdUpSvUOjn+o0pWG1
         xQO6WFlf/8SUZBEujQX2LbwWx1o4xlcLlVkfXaDENyYRMhzDEi0V9cvfC8QNZ95rgRGz
         Ol17X3wQwRYGySmvvsyBQ7YT+KDzPsCRbNFPKyM+2LvlGfX9pRR9X8UU1z/cp6Ny/b+f
         1sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718974481; x=1719579281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrTwlYyUewM020gU0HwmTEQfK5aZ3iGGdgEUfErTPYY=;
        b=XXBr9Bfit71yOI0XDhOd5qEqrbjxKOZz3xLfDtc9TXZMQItUt5P6fAGw7TCvIa4xyd
         n0y7jYZJ6Z0gZieEDwUoY8P5N5kB+46BSK17SLtDtFqnLuBe84fwwJp4jirc4aManqK2
         4RCCviub2NBDnkY3Yd8qfmWIs5i8QP4E4qu/klolMMMfzBPCTlANj/XAwN5N7HsWRz66
         MnebDRq9H77+9EpaG/R6zohp1NHyd9HfZhocAk5QwxmKyHu/Xgaz+Q+K+SNRXfeyMWuw
         hg33TRc1SJrLeN2VUxCwWrvetxOZVKbF4eTEp/Vt/Y0OsY0VRiNm7cGe6KJbFUzd9DWK
         PNiw==
X-Forwarded-Encrypted: i=1; AJvYcCXYOuFF80A/Et8YivQ9k2TV08iTDvFtQ+hxqRg1g9js02+nNfdn6nqJl+gWj21qeHURHG7WdHClURECFtUw93ymmIM+9ePqfwBD
X-Gm-Message-State: AOJu0YwUqJ395K6PNlQmmZdV5lV0OuBxrUVGC9nhWJwrOifjorWzdw3v
	2Jj1aU3SL0Kr2bprRuHaXTNCHfQNkhem2zypCZceO9vk241HiMKeuU5riusi+h8=
X-Google-Smtp-Source: AGHT+IHnJUFdRaoNKZNGoZTXIVxvhc7reGoMUOhOtNv10BGFn0TeNceciLMxCfNCMU8M2tawShhFqg==
X-Received: by 2002:a2e:b01a:0:b0:2ec:5258:e889 with SMTP id 38308e7fff4ca-2ec5258ea0cmr3118831fa.46.1718974480740;
        Fri, 21 Jun 2024 05:54:40 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b3a6sm81477266b.87.2024.06.21.05.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:54:40 -0700 (PDT)
Message-ID: <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
Date: Fri, 21 Jun 2024 15:54:37 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.06.2024 15:34, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 21, 2024 12:23 PM
>> Subject: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with the version available on
>> Renesas RZ/V2H (R9A09G075). Most of the IP variants that the RIIC driver is working with supports
>> fast mode plus.
>> However, it happens that on the same SoC to have IP instatiations that support fast mode plus as
>> well as IP instantiation that doesn't support it. For this, introduced the renesas,riic-no-fast-
>> mode-plus property.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> index 91ecf17b7a81..c0964edbca69 100644
>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>> @@ -25,6 +25,10 @@ properties:
>>                - renesas,riic-r9a07g054  # RZ/V2L
>>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>>
>> +      - items:
>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>> +          - const: renesas,riic-r9a09g057
>> +
>>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>>
>>    reg:
>> @@ -66,6 +70,10 @@ properties:
>>    resets:
>>      maxItems: 1
>>
>> +  renesas,riic-no-fast-mode-plus:
>> +    description: specifies if fast mode plus is not supported
>> +    type: Boolean
> 
> Can't this info, as part of device data?? Based on frequency and device data
> is enough to derive this info??

We can't rely completely on device data because on RZ/G3S we have 2 RIIC
channels that support fast mode plus and 2 that doesn't support it.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju
> 
>> +
>>  required:
>>    - compatible
>>    - reg
>> --
>> 2.39.2
>>
> 
