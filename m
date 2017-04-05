Return-Path: <Alexey_Firago@mentor.com>
Subject: Re: [PATCH v2 1/3] clk: vc5: Add structure to describe particular
 chip features
To: Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
References: <1491392819-698-1-git-send-email-alexey_firago@mentor.com>
 <1491392819-698-2-git-send-email-alexey_firago@mentor.com>
 <CAMuHMdXEa=1__WMtsRphKbN6h+jVkP7szudENsM3hvGSzDfbwg@mail.gmail.com>
 <de978809-5bec-d675-1ea3-cc61804e2c61@mentor.com>
 <23dd9324-ee97-633d-129e-6063af757f47@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
From: Alexey Firago <alexey_firago@mentor.com>
Message-ID: <1ddf7610-035a-eb00-caf7-90f9d25f0172@mentor.com>
Date: Wed, 5 Apr 2017 18:09:09 +0300
MIME-Version: 1.0
In-Reply-To: <23dd9324-ee97-633d-129e-6063af757f47@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

On 05.04.2017 17:20, Marek Vasut wrote:
>>>> +
>>>> +/* flags to describe chip features */
>>>> +/* chip has built-in oscilator */
>>>> +#define VC5_HAS_INTERNAL_XTAL  BIT(0)
>>>
>>> VC5_HAS_INTERNAL_OSC?
>>
>> I'm fine with renaming it, but shouldn't it be consistent with the rest
>> of the driver (see "internal-xtal", VC5_XTAL*, etc) and IDT datasheet?
>>
>
> Do you have one with internal ring oscillator or with internal xtal ?
> The one I had has internal xtal according to the datasheet.
>

The one I have (5P49V5935) has internal 25MHz crystal according to the 
datasheet.

--
Alexey
