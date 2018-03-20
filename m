Return-Path: <prvs=0617642643=mike.looijmans@topicproducts.com>
Subject: Re: [PATCH v2] clk: Add driver for the si544 clock generator chip
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mturquette@baylibre.com>,
	<mark.rutland@arm.com>
References: <1521114608-21967-1-git-send-email-mike.looijmans@topic.nl>
 <20180318125219.ar7f2n4o73ljz6vg@rob-hp-laptop>
 <ec813ab3-88db-f6e3-eca1-b6ea58936fcf@topic.nl>
 <152149373621.242365.4815290210815209160@swboyd.mtv.corp.google.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <f25eb71c-efd9-f842-1a98-76c86b03a34a@topic.nl>
Date: Tue, 20 Mar 2018 08:15:36 +0100
MIME-Version: 1.0
In-Reply-To: <152149373621.242365.4815290210815209160@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

=EF=BB=BFOn 19-03-18 22:08, Stephen Boyd wrote:
> Quoting Mike Looijmans (2018-03-19 08:04:15)
>> On 18-03-18 13:52, Rob Herring wrote:
>>> On Thu, Mar 15, 2018 at 12:50:08PM +0100, Mike Looijmans wrote:
>>>> +Required properties:
>>>> + - compatible: One of "silabs,si514a", "silabs,si514b" "silabs,si514c=
" according
>>>> +               to the speed grade of the chip.
>>>> + - reg: I2C device address.
>>>> + - #clock-cells: From common clock bindings: Shall be 0.
>>>> +
>>>> +Optional properties:
>>>> + - clock-output-names: From common clock bindings. Recommended to be =
"si544".
>>>
>>> What's the point if there is only 1 clock output?
>>
>> I have a board with 6 of these chips, and the clock registration fails i=
f they
>> don't have unique names. Providing a clock-output-names property was the
>> easiest way around it.
>>
>> Should I just omit the line or change the wording to reflect the above o=
r is
>> there a better solution (maybe I can use the DT node name as clock name =
in the
>> driver, will look into that)
>=20
> I would leave clock-output-names for now. One day we can get off of
> strings in CCF. Soon perhaps.
>=20
>>
>>>
>>>> +
>>>> +Example:
>>>> +    si544: clock-generator@55 {
>>>
>>> clock-controller@55 is the standard node name.
>>
>> I'll change and post patch v3
>>
>=20
> I made some comments on v1. Please fold those into v3.


Thanks, found them on patchwork, somehow they didn't end up in my mailbox.

Comments are clear, will incorporate them, I only have trouble with your=20
remark on the DT documentation "Can this reference stuff go to the bottom o=
f=20
this document?". I copied the style from the other documents in the same=20
directory, I'm slightly puzzled about where the reference part should go no=
w.



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
