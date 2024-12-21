Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C992746C;
	Sat, 21 Dec 2024 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734812362; cv=none; b=Ze25FJGM+qNxLH45Jsz7ls25ELq05r2+qh+L89SuCfKn9QpgIgfkqJT05Ml0TulcOTs2pGvs/3v/ZdlTfLPnrwU101HAyegV7WIkZOwLguAExG4CMgNhwGC0Euh4AAk9i9kjCWLEyjj0daa5Oh08OmIJ94hgmdnrcARSWhH+TvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734812362; c=relaxed/simple;
	bh=eyn1IuEfhoj+k8zhwZKiparOtxsbTPRUkyexcAf3PyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHmnUaQcBwLc1cgEicPPVJ1TPS0CmObigUQJLqo6dP/lpCJB+OVDADx4xUMA1H+UxaXsske8FV4Z6N89kWkRu7xAnxAjbe3MvF/DPZq9vjoM0U4y6XcgUliv4O4R1xkv4yJ7UT5oQZhV5F+7EWHFY9FXXepaeNvb+46BmG1hbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYNXg6FT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYNXg6FT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D2DC4CECE;
	Sat, 21 Dec 2024 20:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734812362;
	bh=eyn1IuEfhoj+k8zhwZKiparOtxsbTPRUkyexcAf3PyA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EYNXg6FTg8zUB2xIpThMeVdxgIWLuJt26mUgEqs8yupIFJGyU5vzdqEG/4ql6IILL
	 LepgzyGplSl1WIQiOKGcxyrJOSbSeDBsZy1SQOaHOXKNBGdOJy2WBbv8UrCso3w4o6
	 heHBBYh9GTuhgAIaiO/P40Feljcs0sBaoBYyA2GFKsqzKxvqxileoyQyQn2X+XYRyJ
	 IZkQS/GZVVd9Wq9s6WHNT8THHK/V7yKKQnQr7IS1mCqeZ6mWWKlN3fcJX599gBhKxy
	 q74FKhkU5md/5/CM8zmdhS+DQc/C2UDCVNaz3jF06tge13UMKLV83Ba38H8N6+wgMX
	 c5SazDyk6+7zw==
Message-ID: <9067df7d-01df-44d4-8fcf-0e4c37c91770@kernel.org>
Date: Sat, 21 Dec 2024 21:19:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Paul Handrigan <paulha@opensource.cirrus.com>, mturquette@baylibre.com,
 sboyd@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-2-paulha@opensource.cirrus.com>
 <3glyuu4yg7wbykdsfm33m5evnn7fwg4dbplrkgzcceld3cgu2s@t3xjlhryt2y6>
 <Z2P9X5b+oTo4Du/n@opensource.cirrus.com>
 <3c09367c-808b-4414-bf6a-99e0bdaa3a27@kernel.org>
 <Z2QYooZJ9kFeYzgc@opensource.cirrus.com>
 <ebc6bc7d-d847-46fe-908c-c618d94e3345@kernel.org>
 <a23a5e89-0a55-4b17-9911-a12cfa154ef2@opensource.cirrus.com>
 <c7278ed3-9361-4cd1-ad28-cdbcc3d84bcd@kernel.org>
 <51a5c92c-be2d-4e05-a3d8-8ba4fb0b759b@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <51a5c92c-be2d-4e05-a3d8-8ba4fb0b759b@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2024 17:22, Richard Fitzgerald wrote:
> On 19/12/24 15:57, Krzysztof Kozlowski wrote:
>> On 19/12/2024 14:36, Richard Fitzgerald wrote:
>>> On 19/12/24 13:16, Krzysztof Kozlowski wrote:
>>>> On 19/12/2024 13:59, Charles Keepax wrote:
>>>>> On Thu, Dec 19, 2024 at 12:39:38PM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 19/12/2024 12:02, Charles Keepax wrote:
>>>>>>> On Thu, Dec 19, 2024 at 09:51:00AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>> On Wed, Dec 18, 2024 at 08:46:30PM -0600, Paul Handrigan wrote:
>>>>>>>>> +/* CS2600 Auxiliary Output */
>>>>>>>>> +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
>>>>>>>>> +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
>>>>>>>>> +#define CS2600_AUX_OUTPUT_NO_CLKIN	2
>>>>>>>>
>>>>>>>> I still don't see why these three are supposed to be bindings. Drop
>>>>>>>> them.
>>>>>>>
>>>>>>> In a binding one would presumably do:
>>>>>>>
>>>>>>> cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>>>>>>
>>>>>>> Apologies but I don't quite understand what you mean by the values
>>>>>>> are not used in the binding? The driver reads the property and sets
>>>>>>
>>>>>> There is no user of these defines, so not a binding.
>>>>>>
>>>>>>> the pin to have the appropriate function. Admittedly one could drop
>>>>>>
>>>>>> It's not a proof that this is a binding.
>>>>>>
>>>>>>> the defines and then DTS would just have to do:
>>>>>>>
>>>>>>> cirrus,aux-output-source = <0>;
>>>>>>>
>>>>>>> But that feels a bit less helpful when reading the binding.
>>>>>>
>>>>>> Binding and being helpful are two different things. This to be the
>>>>>> binding, it has to be used as a binding, so some translation layer
>>>>>> between driver and DTS. It must have an user in DTS. I keep repeating
>>>>>> this over and over...
>>>>>>
>>>>>
>>>>> Apologies, but I not sure I totally follow this, and apologies if
>>>>> you have already explained this are there some docs I can look
>>>>> at?
>>>>>
>>>>> I think you are saying because these defines merely represent the
>>>>> valid values for a device tree property and are not translated
>>>>> into different values you can't put defines for them in the binding
>>>>> header?
>>>>>
>>>>> So this would not be allowed:
>>>>>
>>>>>     #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 0
>>>>>
>>>>>     cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>>>>
>>>>>     device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>>>>     regmap_write(regmap, CS2600_OUTPUT_CFG2, val);
>>>>>
>>>>> But this would be fine:
>>>>>
>>>>>     #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 1
>>>>>
>>>>>     cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>>>>
>>>>>     device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>>>>     switch (val) {
>>>>>     case CS2600_AUX_OUTPUT_FREQ_UNLOCK:
>>>>>       regmap_write(regmap, CS2600_OUTPUT_CFG2, 0);
>>>>>     }
>>>>>
>>>>> And this would also be fine?
>>>>>
>>>>>     cirrus,aux-output-source = <0>;
>>>>>
>>>>>     device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>>>>     regmap_write(regmap, CS2600_OUTPUT_CFG2, val);
>>>>>
>>>> Yes. If you want to use in DTS user-readable values, then use string.
>>>>
>>>
>>> I don't understand this. Why should we have to use a string value for
>>> something that only needs a simple integer value? Why can't we define
>>> constants with meaningful names?
>>
>> You can and you will find plenty examples of this, but as I explained
>> earlier - this is not a binding. We avoid defining as a binding
>> something which is not a binding.
>>
> 
> What does that mean?
> Perhaps if you clearly explained what the problem is and what you want
> us to change instead of making cryptic statements like "this is not a
> binding" we wouldn't have to waste all this time exchanging emails that
> aren't getting anywhere.
> 
> You didn't explain earlier. You typed some words earlier, but they
> failed to explain, and you are continuing to fail to explain.
Mentioned defines do not meet criteria of a binding, because of reasons
I already stated very clear, so do not try to make them a binding.

You got also pretty clear answer from Charles what to do, so what is
unclear here? Drop these defines and use register values or better
strings. Or fix them to be really a binding (and then come with a reason
why these are bindings).

Best regards,
Krzysztof
