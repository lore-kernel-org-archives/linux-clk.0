Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6F226548;
	Thu, 19 Dec 2024 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734625347; cv=none; b=PThgLBI0f4fLCpg8Utpbj3LUuHQQqShpajpDl2GnMsDvx5rJyhwZed9zGA4WBsgkGxPv92pT0fEeMgLgQFPEta7l9rfwEXZQhpLs5nwYPLBMKvg9GXHD92rUDmYiwBtPyKef5ryLDefDMqr4b1wBxpfHEadxYS/hqqO06c0s5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734625347; c=relaxed/simple;
	bh=jhYWaF7rygKseby78w3TXRVgNmrEpYYL8D4xAGSRa+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ikBlpk/pc1TZMi3GL7Gzsj2krj6v0tT17xAsCdDBVEpji4pXWdQeIxI9cftH5ZcLWdhMSGCOPx7Q+wTCR0De+l0ObV6ucSQbEtOp63UOtmMcLK4Z6u273vLCmlS92dPczerqOU/8+3OTuRjYyFxGWjUZ8dhJBzP9w8woxrZUS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gWH6GGi2; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gWH6GGi2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ5KRww027660;
	Thu, 19 Dec 2024 10:22:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=suDOwpk7TtpVAHoyNPbA3gkZQzr+ZsNZtrP3JHnnAWM=; b=
	gWH6GGi2H1GaoRwkNJMHAcmqa4AZuc16NArR5zWYSbwCtEHqrOXPqe1nfIeckNZC
	q9jKJPHSnog487ulT4jMMVdSJenZ5aSedq9AJIpK4sElLUSoJq6+4sSrIZXQNM60
	gmM7roW/tqDi4lEY7MxqFvpTRjGQjVG3E5vMoIlMwv+RNtNa495cJL0t4iS3jIWH
	zwwv2wRMFHyUuq46e9yNnCCOyCu8OeMjpBwsXQoJ9cCIDgqb4i6imFpseDPlAN8D
	S4PMhFzgdehK/grTPLNfCcKODUDxvNi336xUyB27PU7Q232F3n0gKqKxb48FSNS+
	MyCcrMvfY548qOma3s2ktw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a26kdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 10:22:17 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 16:22:15 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 16:22:15 +0000
Received: from [198.61.68.170] (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 96B76820247;
	Thu, 19 Dec 2024 16:22:14 +0000 (UTC)
Message-ID: <51a5c92c-be2d-4e05-a3d8-8ba4fb0b759b@opensource.cirrus.com>
Date: Thu, 19 Dec 2024 16:22:14 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
CC: Paul Handrigan <paulha@opensource.cirrus.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-2-paulha@opensource.cirrus.com>
 <3glyuu4yg7wbykdsfm33m5evnn7fwg4dbplrkgzcceld3cgu2s@t3xjlhryt2y6>
 <Z2P9X5b+oTo4Du/n@opensource.cirrus.com>
 <3c09367c-808b-4414-bf6a-99e0bdaa3a27@kernel.org>
 <Z2QYooZJ9kFeYzgc@opensource.cirrus.com>
 <ebc6bc7d-d847-46fe-908c-c618d94e3345@kernel.org>
 <a23a5e89-0a55-4b17-9911-a12cfa154ef2@opensource.cirrus.com>
 <c7278ed3-9361-4cd1-ad28-cdbcc3d84bcd@kernel.org>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <c7278ed3-9361-4cd1-ad28-cdbcc3d84bcd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Eb7PFffvg74n4wHZHjtAlV4pin8MiV_z
X-Proofpoint-GUID: Eb7PFffvg74n4wHZHjtAlV4pin8MiV_z
X-Proofpoint-Spam-Reason: safe

On 19/12/24 15:57, Krzysztof Kozlowski wrote:
> On 19/12/2024 14:36, Richard Fitzgerald wrote:
>> On 19/12/24 13:16, Krzysztof Kozlowski wrote:
>>> On 19/12/2024 13:59, Charles Keepax wrote:
>>>> On Thu, Dec 19, 2024 at 12:39:38PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 19/12/2024 12:02, Charles Keepax wrote:
>>>>>> On Thu, Dec 19, 2024 at 09:51:00AM +0100, Krzysztof Kozlowski wrote:
>>>>>>> On Wed, Dec 18, 2024 at 08:46:30PM -0600, Paul Handrigan wrote:
>>>>>>>> +/* CS2600 Auxiliary Output */
>>>>>>>> +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
>>>>>>>> +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
>>>>>>>> +#define CS2600_AUX_OUTPUT_NO_CLKIN	2
>>>>>>>
>>>>>>> I still don't see why these three are supposed to be bindings. Drop
>>>>>>> them.
>>>>>>
>>>>>> In a binding one would presumably do:
>>>>>>
>>>>>> cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>>>>>
>>>>>> Apologies but I don't quite understand what you mean by the values
>>>>>> are not used in the binding? The driver reads the property and sets
>>>>>
>>>>> There is no user of these defines, so not a binding.
>>>>>
>>>>>> the pin to have the appropriate function. Admittedly one could drop
>>>>>
>>>>> It's not a proof that this is a binding.
>>>>>
>>>>>> the defines and then DTS would just have to do:
>>>>>>
>>>>>> cirrus,aux-output-source = <0>;
>>>>>>
>>>>>> But that feels a bit less helpful when reading the binding.
>>>>>
>>>>> Binding and being helpful are two different things. This to be the
>>>>> binding, it has to be used as a binding, so some translation layer
>>>>> between driver and DTS. It must have an user in DTS. I keep repeating
>>>>> this over and over...
>>>>>
>>>>
>>>> Apologies, but I not sure I totally follow this, and apologies if
>>>> you have already explained this are there some docs I can look
>>>> at?
>>>>
>>>> I think you are saying because these defines merely represent the
>>>> valid values for a device tree property and are not translated
>>>> into different values you can't put defines for them in the binding
>>>> header?
>>>>
>>>> So this would not be allowed:
>>>>
>>>>     #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 0
>>>>
>>>>     cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>>>
>>>>     device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>>>     regmap_write(regmap, CS2600_OUTPUT_CFG2, val);
>>>>
>>>> But this would be fine:
>>>>
>>>>     #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 1
>>>>
>>>>     cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>>>
>>>>     device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>>>     switch (val) {
>>>>     case CS2600_AUX_OUTPUT_FREQ_UNLOCK:
>>>>       regmap_write(regmap, CS2600_OUTPUT_CFG2, 0);
>>>>     }
>>>>
>>>> And this would also be fine?
>>>>
>>>>     cirrus,aux-output-source = <0>;
>>>>
>>>>     device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>>>     regmap_write(regmap, CS2600_OUTPUT_CFG2, val);
>>>>
>>> Yes. If you want to use in DTS user-readable values, then use string.
>>>
>>
>> I don't understand this. Why should we have to use a string value for
>> something that only needs a simple integer value? Why can't we define
>> constants with meaningful names?
> 
> You can and you will find plenty examples of this, but as I explained
> earlier - this is not a binding. We avoid defining as a binding
> something which is not a binding.
> 

What does that mean?
Perhaps if you clearly explained what the problem is and what you want
us to change instead of making cryptic statements like "this is not a
binding" we wouldn't have to waste all this time exchanging emails that
aren't getting anywhere.

You didn't explain earlier. You typed some words earlier, but they
failed to explain, and you are continuing to fail to explain.

> Best regards,
> Krzysztof

