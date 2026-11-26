Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727051;
	b=QRIHrGPSPizbQoNYWF8o9yP13RDZX5XCOaaRRfZX6ZTCTit3MwOUUKT50dSI7lIrjDnL
	 7YWTw8rIHI5wJXrYVpU+nJoEHctxYyKFZ6MOUf9SzOZFE/k5OplGMCxLFNGQ8yDUszH6w
	 8uBpuEmD/Z7rz3ZiVTvWgxiNdU5RRSTp/ubVoWARWGJQGiwiSqJYPRzsm6TnNAoYOpNfD
	 KoT3kOCS9zTojQbvIkNTIp/iqaxUsAWDgpN6j5ZYjaIFaNUu4WKYy5xtq6Jdz9WVrAg7J
	 ko+feemqyrGnYFhUB4TisescOej0ExYIh/82jauRp/Opexi/mg1fXsLGoMiMWkb16MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727051;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I+GHeDLJbWPdVlZNtAD4UCFOiWzWA153dGpfwYm/3PA=;
	b=Sw1HufgcHflo0MnbPvXr+43fxW9o/CAYeiRzRE9q1Se4P0R5D8jqSLohIXTFKgytUBk0
	 XcKoK/MFXtPGOcoiUDeNBF8l6me9+PQBWM9q70qeuTuM3JO0Jn8qJICHtGVy8PbVHP9nw
	 FIkOCvx+IF2kBJhyEERtpJy9Cq0BMuSyhCdFlYTbjHpcpmNRxzQXXH1+vo7p7PjoIxLTn
	 n2GgXOvsvlGmymjq8tTD3igElJyrGOWBe18JMK5lsOjaMd/A6fdoaYYC+Y+tE2hGuUtKT
	 7N5yU46zBBO+mJUQr9zgPOXFNMl72O7OveCKkzYHYVbs26flwKHLi9facwO97MPrMKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOIgPFWO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3D606A31C;
	Thu, 26 Nov 2026 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOIgPFWO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0381F00929;
	Thu, 26 Nov 2026 21:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795727050;
	bh=I+GHeDLJbWPdVlZNtAD4UCFOiWzWA153dGpfwYm/3PA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=oOIgPFWOf2um49LLSz8lSJkrRgbyOjNubAgsvK+J4q5Vj9VH4dV0sZfFOX+CleQCI
	 clASUH0PAaov1VbRj83JhMhFJkl5ydB48BbDw9Acp0tPkjQJVEr1UzvWAUU4wX5nEe
	 ekeNLxI99SaoXYqT9l1GZvBtzdJhLWtETxijQ4xb3S7mW17hsBDvWmIpLIpvgFSAbJ
	 ou+L7R4lzYNBf6rvybBr8wXDNtm2sdI/DW5T6WRy93tCnjH0c3kF7E1XUbFOE3cfoL
	 l/RwIyTK5LC+WYcSZtP2h9CYU9LwAniScYHlOs5GM6K8PU5W2TxgYKbGoNQHZxCrAj
	 TqyqITZ2o3OSg==
Message-ID: <f73334a2-17e9-4ffb-8f54-e3db224be282@kernel.org>
Date: Thu, 26 Nov 2026 23:04:07 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-4-ada@thorsis.com>
 <5273baa7-aae5-4364-bb09-dccee581200b@kernel.org>
 <20261119-sixfold-tradition-ab9492ca6c2e@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261119-sixfold-tradition-ab9492ca6c2e@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Alexander,

On 11/19/26 16:53, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Sun, Nov 15, 2026 at 04:34:30PM +0200 schrieb Claudiu Beznea:
>> Hi, Alexander,
>>
>> On 11/5/26 13:06, Alexander Dahl wrote:
>>> The main rc oscillator will be needed for the OTPC to work properly.
>>>
>>> The new index introduced here was not used on the four affected SoC
>>> clock drivers before.
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>       v4:
>>>       - change index for sama7g5 and sama7d65 after re-adding unused PLLs in patch 2
>>>       v3:
>>>       - adapt to different base changes, added lines are the same
>>>       v2:
>>>       - new patch, not present in v1
>>>
>>>    include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
>>>    include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
>>>    include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
>>>    include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
>>>    4 files changed, 4 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> index 050e5e774b274..830e247ba2532 100644
>>> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> @@ -10,6 +10,7 @@
>>>    #define SAM9X60_PMC_MCK		1
>>>    #define SAM9X60_PMC_UPLLCK	2
>>>    #define SAM9X60_PMC_MAIN	3
>>> +#define SAM9X60_PMC_MAIN_RC	6
>>>    #define SAM9X60_PMC_PLLACK	7
>>>    #endif
>>> diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
>>> index 292c5873e101e..58d2a08116795 100644
>>> --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
>>> +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
>>> @@ -10,6 +10,7 @@
>>>    #define SAM9X7_PMC_MCK		1
>>>    #define SAM9X7_PMC_UPLLCK	2
>>>    #define SAM9X7_PMC_MAIN		3
>>> +#define SAM9X7_PMC_MAIN_RC	6
>>>    #define SAM9X7_PMC_PLLACK	7
>>>    #define SAM9X7_PMC_AUDIOPMCPLL	9
>>>    #define SAM9X7_PMC_AUDIOIOPLL	10
>>> diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
>>> index 08581418b9115..17105a6bedb54 100644
>>> --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
>>> +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
>>> @@ -19,6 +19,7 @@
>>>    #define SAMA7D65_PMC_AUDIOIOPLL		10
>>>    #define SAMA7D65_PMC_ETHPLL		11
>>>    #define SAMA7D65_PMC_MCK1		13
>>> +#define SAMA7D65_PMC_MAIN_RC		14
>>>    #define SAMA7D65_PMC_LVDSPLL		15
>>>    #define SAMA7D65_PMC_MCK3		16
>>>    #define SAMA7D65_PMC_MCK5		17
>>> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>> index 27668634b0a2b..4a1c4af8ecc9a 100644
>>> --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>> @@ -19,5 +19,6 @@
>>>    #define SAMA7G5_PMC_AUDIOIOPLL	10
>>>    #define SAMA7G5_PMC_ETHPLL	11
>>>    #define SAMA7G5_PMC_MCK1	13
>>> +#define SAMA7G5_PMC_MAIN_RC	14
>>
>> I think we can use 12 instead. Correct me if I'm wrong. Otherwise, you
>> should change also driver code to allocate space for this clock. See
>> pmc_data_allocate() in drivers/clk/at91/sama7g5.c
> 
> The old definition had this (with PMC_MAIN = 3):
> 
>      #define PMC_CPU                 (PMC_MAIN + 9)
> 
> That's the 12 which is missing in the new list.  PMC_CPU was not used
> in the current code base.  Personally I'm fine with using 12 here, but
> I was not sure if this is again some value Microchip wants to keep for
> some reason?

It looks like a mistake. Let's drop it.

Thank you,
Claudiu
