Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA428E37;
	Thu, 19 Dec 2024 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734615406; cv=none; b=R8sV/IBGt+jZpFtH1HGE8T3pEnVg0RCAEt7dg9rHrdDCvvedcM6FhjByjKAKl5CuDAcUaDPfXn4Hsu158tiWfr83qhraySF7oRCAJkRq3WtGjskVdtkgiO1mrC+Qb2OoyFiKCsgaaKefziWGJ2M2/KYDs+YUe1xnuuf/WFg9ZoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734615406; c=relaxed/simple;
	bh=0IckwFL91Q4fxWJADgq3EYPJ/+DamnhHCBDNi7DH3LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZopJIZY2H6OM7wVKh48H5FVVl4e6pWVZeGCZA/K2Xd+/jrYR/FuWgfj8n9VlMtB163OLFbboPzcYEWXtsKSuGy/fU9mDaAhbmcozR2wURU3MajnIplc6pBpccHvWEGnOIYXIpe/LPy8fg8auLhU5RgifOUo4dwCvVB30/x+KQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oC7cHeEr; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oC7cHeEr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ5Ik67024760;
	Thu, 19 Dec 2024 07:36:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sCD+MGsuo/Z9wyljr5In2Zq1sfIHzX8XYf+WKwDTZjY=; b=
	oC7cHeErQPMLEYxYEJ6vrXHgnY4nbzC/qKW4qX48wsBB87pg6Xim4vYmYLd1by3s
	4w+KJhG2b79BY30kI81Y9Qqlok8vf82+zH5+CSB+7CiVVFsdj/T4lYg3gYwgLZge
	V3LXZUqwtEVrwikPpqR8KIFFImODhsdjpstRJz9S8GXRjMAQrRoNBhgYlBjgd858
	/l56GHjqgXmYJYeAQqtAgJ39fkSCEeSNdg1GNmZPtd4Z6utN9r+ZCjHjZzUWev0q
	HZVKAzuHCmNPLGOuh0YBSiZJE5NHO/xASKjVESQ+8oN7NzP+U8NaveX3DCucAFU1
	FDVLGD845ECvCajecGq4mA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a26aur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 07:36:40 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 13:36:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 13:36:38 +0000
Received: from [198.61.68.170] (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9B2CE820247;
	Thu, 19 Dec 2024 13:36:37 +0000 (UTC)
Message-ID: <a23a5e89-0a55-4b17-9911-a12cfa154ef2@opensource.cirrus.com>
Date: Thu, 19 Dec 2024 13:36:37 +0000
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
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <ebc6bc7d-d847-46fe-908c-c618d94e3345@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jeWE6MR1dbBk8fQEIC2xkxfQZbWNkYpw
X-Proofpoint-GUID: jeWE6MR1dbBk8fQEIC2xkxfQZbWNkYpw
X-Proofpoint-Spam-Reason: safe

On 19/12/24 13:16, Krzysztof Kozlowski wrote:
> On 19/12/2024 13:59, Charles Keepax wrote:
>> On Thu, Dec 19, 2024 at 12:39:38PM +0100, Krzysztof Kozlowski wrote:
>>> On 19/12/2024 12:02, Charles Keepax wrote:
>>>> On Thu, Dec 19, 2024 at 09:51:00AM +0100, Krzysztof Kozlowski wrote:
>>>>> On Wed, Dec 18, 2024 at 08:46:30PM -0600, Paul Handrigan wrote:
>>>>>> +/* CS2600 Auxiliary Output */
>>>>>> +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
>>>>>> +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
>>>>>> +#define CS2600_AUX_OUTPUT_NO_CLKIN	2
>>>>>
>>>>> I still don't see why these three are supposed to be bindings. Drop
>>>>> them.
>>>>
>>>> In a binding one would presumably do:
>>>>
>>>> cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>>>
>>>> Apologies but I don't quite understand what you mean by the values
>>>> are not used in the binding? The driver reads the property and sets
>>>
>>> There is no user of these defines, so not a binding.
>>>
>>>> the pin to have the appropriate function. Admittedly one could drop
>>>
>>> It's not a proof that this is a binding.
>>>
>>>> the defines and then DTS would just have to do:
>>>>
>>>> cirrus,aux-output-source = <0>;
>>>>
>>>> But that feels a bit less helpful when reading the binding.
>>>
>>> Binding and being helpful are two different things. This to be the
>>> binding, it has to be used as a binding, so some translation layer
>>> between driver and DTS. It must have an user in DTS. I keep repeating
>>> this over and over...
>>>
>>
>> Apologies, but I not sure I totally follow this, and apologies if
>> you have already explained this are there some docs I can look
>> at?
>>
>> I think you are saying because these defines merely represent the
>> valid values for a device tree property and are not translated
>> into different values you can't put defines for them in the binding
>> header?
>>
>> So this would not be allowed:
>>
>>    #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 0
>>
>>    cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>
>>    device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>    regmap_write(regmap, CS2600_OUTPUT_CFG2, val);
>>
>> But this would be fine:
>>
>>    #define CS2600_AUX_OUTPUT_FREQ_UNLOCK 1
>>
>>    cirrus,aux-output-source = <CS2600_AUX_OUTPUT_FREQ_UNLOCK>;
>>
>>    device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>    switch (val) {
>>    case CS2600_AUX_OUTPUT_FREQ_UNLOCK:
>>      regmap_write(regmap, CS2600_OUTPUT_CFG2, 0);
>>    }
>>
>> And this would also be fine?
>>
>>    cirrus,aux-output-source = <0>;
>>
>>    device_property_read_u32(dev, "cirrus,aux-output-source", &val);
>>    regmap_write(regmap, CS2600_OUTPUT_CFG2, val);
>>
> Yes. If you want to use in DTS user-readable values, then use string.
> 

I don't understand this. Why should we have to use a string value for
something that only needs a simple integer value? Why can't we define
constants with meaningful names?

> Best regards,
> Krzysztof

