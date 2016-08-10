Return-Path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <57AAF68D.7090707@nvidia.com>
References: <1466160667-28451-1-git-send-email-ldewangan@nvidia.com>
 <1466160667-28451-3-git-send-email-ldewangan@nvidia.com> <20160620163947.GA27492@rob-hp-laptop>
 <5768E2AD.8070004@nvidia.com> <57725F64.4030903@nvidia.com> <57AAF68D.7090707@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Aug 2016 07:43:04 -0500
Message-ID: <CAL_JsqL+sZ1tX_Wnj=N+ku4Gs0dNRhKDe4vDkEitAu+M4HEBmA@mail.gmail.com>
Subject: Re: [PATCH V3 2/4] clk: Combine DT binding doc for max77686 and max77802
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 10, 2016 at 4:40 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> Hi,
>
> On Tuesday 28 June 2016 04:58 PM, Laxman Dewangan wrote:
>>
>> Hi Rob,
>>
>> On Tuesday 21 June 2016 12:16 PM, Laxman Dewangan wrote:
>>>
>>>
>>> On Monday 20 June 2016 10:09 PM, Rob Herring wrote:
>>>>
>>>> On Fri, Jun 17, 2016 at 04:21:05PM +0530, Laxman Dewangan wrote:
>>>>>
>>>>>
>>>>>
>>>>> +
>>>>>   Following properties should be presend in main device node of the MFD
>>>>> chip.
>>>>>     Required properties:
>>>>
>>>> I'd expect to see compatible strings updated...
>>>>
>>>
>>> There is no separate compatible string for clock. The clock nodes is the
>>> parent node only and the compatible described in the parent DT binding doc.
>>>
>>>
>>> Do we also need to add same thing here?
>>
>>
>> Are you fine with the above? As there is no compatible string for clock
>> (clock does not have separate node), do I still need to add explicitly here?
>>
>
>
> Can you please help here to review? If required, I can rebase and re-send
> the patches.

It is fine.

Acked-by: Rob Herring <robh@kernel.org>
