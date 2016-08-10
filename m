Return-Path: <ldewangan@nvidia.com>
Message-ID: <57AAF68D.7090707@nvidia.com>
Date: Wed, 10 Aug 2016 15:10:29 +0530
From: Laxman Dewangan <ldewangan@nvidia.com>
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH V3 2/4] clk: Combine DT binding doc for max77686 and max77802
References: <1466160667-28451-1-git-send-email-ldewangan@nvidia.com> <1466160667-28451-3-git-send-email-ldewangan@nvidia.com> <20160620163947.GA27492@rob-hp-laptop> <5768E2AD.8070004@nvidia.com> <57725F64.4030903@nvidia.com>
In-Reply-To: <57725F64.4030903@nvidia.com>
Return-Path: ldewangan@nvidia.com
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Tuesday 28 June 2016 04:58 PM, Laxman Dewangan wrote:
> Hi Rob,
>
> On Tuesday 21 June 2016 12:16 PM, Laxman Dewangan wrote:
>>
>> On Monday 20 June 2016 10:09 PM, Rob Herring wrote:
>>> On Fri, Jun 17, 2016 at 04:21:05PM +0530, Laxman Dewangan wrote:
>>>>
>>>>
>>>> +
>>>>   Following properties should be presend in main device node of the 
>>>> MFD chip.
>>>>     Required properties:
>>> I'd expect to see compatible strings updated...
>>>
>>
>> There is no separate compatible string for clock. The clock nodes is 
>> the parent node only and the compatible described in the parent DT 
>> binding doc.
>>
>>
>> Do we also need to add same thing here?
>
> Are you fine with the above? As there is no compatible string for 
> clock (clock does not have separate node), do I still need to add 
> explicitly here?
>


Can you please help here to review? If required, I can rebase and 
re-send the patches.


Thanks,
Laxman
