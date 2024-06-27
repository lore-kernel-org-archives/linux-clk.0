Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A924D8C3;
	Thu, 27 Jun 2024 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482623; cv=none; b=Jh9V2+c9QmCcktRH+YKSOt+MrI1zNq1xlPKz7jOoKIdY9QRtdCwMicPHfmh7KdQadvvIocTvO+AoTllCMr3M+DC4yS/Hj4cvxcRdI6LxYthPbHpH+c7sPSnI6FNZwHJAyxAGCh3cCxGyUJOXfZBMDTQDLwaKx+xkSaZmKVfZJy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482623; c=relaxed/simple;
	bh=ZCTzlpwLsWbTLztEOQEh4XVwMCM6VQF1qZuE0NLxfhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/S3//614/ymL2NEH7XzZHBnrPMMkmr1ONBYO2xVC3uRAgKr62YjZUxEPwzUOEfNMrvJndMuRiwFf6dqHt/MuJHFbv1WdW8Kd4aPbUAISWOL3yqxEp7aUbEdEXa53SJi5u7VC8PppR1ZNLUIt/glR5HkwxMLr+KVplQXA94Q9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ggGaWUs/; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ggGaWUs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719482619;
	bh=ZCTzlpwLsWbTLztEOQEh4XVwMCM6VQF1qZuE0NLxfhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ggGaWUs/rmGhBU9s8SMuOMuju8gA2dG+j5aPFpDSYcSu08CDg56hKXiKOCrVB9JSK
	 0UmEMDDyiX/Y2exM7GBGdWg6tmTwOXUqf0tDmbKE9k07jWdvRkeDXnHOicH03ciiQs
	 0IP/dARslsQaMwJ8hwBDgEs6gcorsIAjHcyTJE1NyPiBvURc2dbwJKwipbExB7/8QL
	 /jDRAEIzuuwPzeKlO2Rv+oP1z2h4ngyedmU/rO5+hEHomwPSMvZrf6uOG0C++yf5ov
	 ZHm6o3Z2H5nhGqs3rEV9nj1sXkHxnd3iuA8YA7IxmAyfbHsS9SOOFe0/lsgk0c3jwu
	 yvDulUL//grjA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E54963782181;
	Thu, 27 Jun 2024 10:03:38 +0000 (UTC)
Message-ID: <0ae5ff1c-1abe-4b45-a1dd-4599a867f8c8@collabora.com>
Date: Thu, 27 Jun 2024 12:03:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: airoha: Add reset support to
 EN7581 clock binding
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org,
 p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.bianconi83@gmail.com, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com,
 catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com
References: <cover.1718282056.git.lorenzo@kernel.org>
 <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
 <d1021a8d-6e7f-4839-845e-88e2c8673c34@collabora.com>
 <20240627-vending-lisp-4e1cf45e552c@wendy>
 <b5bb67e8-ebd6-43db-b9d6-2aae38f2a08d@collabora.com>
 <20240627-undying-overcoat-192e5aa20c55@wendy>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627-undying-overcoat-192e5aa20c55@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/06/24 11:57, Conor Dooley ha scritto:
> On Thu, Jun 27, 2024 at 11:53:00AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 27/06/24 11:47, Conor Dooley ha scritto:
>>> On Thu, Jun 27, 2024 at 11:33:47AM +0200, AngeloGioacchino Del Regno wrote:
>>>> Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
>>>>> Introduce reset capability to EN7581 device-tree clock binding
>>>>> documentation.
>>>>>
>>>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>>>> ---
>>>>>     .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
>>>>>     .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
>>>>>     2 files changed, 90 insertions(+), 1 deletion(-)
>>>>>     create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>>>>> index 3f4266637733..84353fd09428 100644
>>>>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>>>>> @@ -35,7 +35,7 @@ properties:
>>>>>       reg:
>>>>>         minItems: 2
>>>>> -    maxItems: 3
>>>>> +    maxItems: 4
>>>>>       "#clock-cells":
>>>>>         description:
>>>>> @@ -43,6 +43,10 @@ properties:
>>>>>           clocks.
>>>>>         const: 1
>>>>> +  '#reset-cells':
>>>>> +    description: ID of the controller reset line
>>>>> +    const: 1
>>>>> +
>>>>>     required:
>>>>>       - compatible
>>>>>       - reg
>>>>> @@ -60,6 +64,8 @@ allOf:
>>>>>                 - description: scu base address
>>>>>                 - description: misc scu base address
>>>>> +        '#reset-cells': false
>>>>> +
>>>>>       - if:
>>>>>           properties:
>>>>>             compatible:
>>>>> @@ -70,6 +76,7 @@ allOf:
>>>>>               items:
>>>>>                 - description: scu base address
>>>>>                 - description: misc scu base address
>>>>> +            - description: reset base address
>>>>
>>>> Are you sure that the indentation is correct? :-)
>>>>
>>>> After fixing the indentation,
>>>>
>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>
>>>>>                 - description: pb scu base address
>>>
>>> The indentation actually looks okay when I apply this locally, but how is
>>> it backwards compatible to add this register in the middle of the list??
>>
>> It's not, and this is actually something done on purpose - there is no DT using
>> this binding yet (here, nor uboot), and Lorenzo acknowledged the mistake before
>> it was too late...
>>
>> At least this time, it wasn't a misattention :-P
> 
> The rationale for this being okay really should be in the commit
> message...
> 
>> Btw, as far as I know, the reset base address is in between misc scu and pb scu,
>> that's why it was put there in the middle.
> 
> ...but I don't really see why this needs to be done incompatibly at all
> in the first place. Just put it at the end of the list, there's no rule
> that the order of reg properties needs to match the MMIO addresses.
> 

It's just a perfection thing... but whatever, if that's unacceptable for you,
putting it at the end of the list isn't a huge deal anyway.

Your call - it's okay for me either way.

Cheers,
Angelo
