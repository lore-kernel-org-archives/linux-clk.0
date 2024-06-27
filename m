Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B9913AD09;
	Thu, 27 Jun 2024 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719481985; cv=none; b=QfMt2S4u/wEiYKyYo0QTCFGFTZS0Xz0XoQwkD2qUHJtm1KB0ImCphfrLRwrfvwcQAdfLWs4fOhD84+w3XSPz0QUQosxb5cfGnbLKWREf+GC5V4wm+x+WRK5ZfQOfEJNEZmdlGpaw9s7aqBs9Qy+u7XLritkRj1OEalnBbBihBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719481985; c=relaxed/simple;
	bh=lQ6DZuV1MIf49SNkyEYjAOSZq1CCitf77+c9UVPABIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SYXygdT63AtRRpTIg+Hgp1z2YfKeLk3Nr/P3/vTieknUFc+gQhY9s/Uoi/iylj9tkgeMwkbblf9aqa5paRoACxx5H17Ivl/CA1A1Jmd0fhJIrT1MkoOJ7uZPnMR2NSzQ6h7z6KvN0rIQtoQJhhJF2sixQxxqmJxtDcf+7DjGbAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ki0GmH9D; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ki0GmH9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719481982;
	bh=lQ6DZuV1MIf49SNkyEYjAOSZq1CCitf77+c9UVPABIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ki0GmH9DwSk4BJbAk4tWjyZkVUEoHnZ5ie1gsExxyL3MuNtbTuP2E4zlK+er+RkHA
	 3eNy1vN0NwqrPy/0Q0M+KJc9YyrF988yaJFQhHrFlsrAZyEWQAdDeYe7InmchyBuDS
	 0dFtUM7HNchGWhZRAlmiANzpMgjFnc1875fQ8+weLTo+k+s1RgK3rgH6qNTBF1MudQ
	 tC5lodeoqRwxagtB4HDp476UmbzZsZ3tZCzoQeSs5UYV2ur3Ex6CFCwDLVHBaeNJRO
	 wYsKcNc2iKjIN1vf4fGlirgQWHW681H/Jj8Z46AqFs8o7YCn/Jxc1pYbEwat9X6j5k
	 xST95ASScAtLA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 165EE37810CD;
	Thu, 27 Jun 2024 09:53:01 +0000 (UTC)
Message-ID: <b5bb67e8-ebd6-43db-b9d6-2aae38f2a08d@collabora.com>
Date: Thu, 27 Jun 2024 11:53:00 +0200
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627-vending-lisp-4e1cf45e552c@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/06/24 11:47, Conor Dooley ha scritto:
> On Thu, Jun 27, 2024 at 11:33:47AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 13/06/24 14:47, Lorenzo Bianconi ha scritto:
>>> Introduce reset capability to EN7581 device-tree clock binding
>>> documentation.
>>>
>>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>>> ---
>>>    .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
>>>    .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
>>>    2 files changed, 90 insertions(+), 1 deletion(-)
>>>    create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>>> index 3f4266637733..84353fd09428 100644
>>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>>> @@ -35,7 +35,7 @@ properties:
>>>      reg:
>>>        minItems: 2
>>> -    maxItems: 3
>>> +    maxItems: 4
>>>      "#clock-cells":
>>>        description:
>>> @@ -43,6 +43,10 @@ properties:
>>>          clocks.
>>>        const: 1
>>> +  '#reset-cells':
>>> +    description: ID of the controller reset line
>>> +    const: 1
>>> +
>>>    required:
>>>      - compatible
>>>      - reg
>>> @@ -60,6 +64,8 @@ allOf:
>>>                - description: scu base address
>>>                - description: misc scu base address
>>> +        '#reset-cells': false
>>> +
>>>      - if:
>>>          properties:
>>>            compatible:
>>> @@ -70,6 +76,7 @@ allOf:
>>>              items:
>>>                - description: scu base address
>>>                - description: misc scu base address
>>> +            - description: reset base address
>>
>> Are you sure that the indentation is correct? :-)
>>
>> After fixing the indentation,
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>>                - description: pb scu base address
> 
> The indentation actually looks okay when I apply this locally, but how is
> it backwards compatible to add this register in the middle of the list??

It's not, and this is actually something done on purpose - there is no DT using
this binding yet (here, nor uboot), and Lorenzo acknowledged the mistake before
it was too late...

At least this time, it wasn't a misattention :-P

Btw, as far as I know, the reset base address is in between misc scu and pb scu,
that's why it was put there in the middle.

Cheers!
Angelo
