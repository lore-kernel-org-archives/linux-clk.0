Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+WQijqm43U_SzSVzCn6_eeFLjggcWnbwbCpW99ct4XOQ@mail.gmail.com>
References: <20170508201159.31634-1-linus.walleij@linaro.org>
 <CAL_JsqLAMObobPrBDdA8bjaKTX4rEo2=_qd86ibbA2kQP6AvBg@mail.gmail.com>
 <CACRpkdY+EzbbTy6PzN5-YhCnSxPoKej2z=t-7eC3CPqDa6Q4_w@mail.gmail.com> <CAL_Jsq+WQijqm43U_SzSVzCn6_eeFLjggcWnbwbCpW99ct4XOQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 May 2017 17:47:12 +0200
Message-ID: <CACRpkdbMqwGj3gx1h_GXy1xxkxeEgj6LTy1y8rd04WRorGSymg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] clk: Add bindings for the Gemini Clock Controller
To: Rob Herring <robh+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, openwrt-devel@openwrt.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 9, 2017 at 4:23 PM, Rob Herring <robh+dt@kernel.org> wrote:
> On Mon, May 8, 2017 at 4:41 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, May 8, 2017 at 11:24 PM, Rob Herring <robh+dt@kernel.org> wrote:
>>
>>>> +Example:
>>>> +
>>>> +syscon: syscon@40000000 {
>>>> +       compatible = "cortina,gemini-syscon", "cortina,gemini-clock-controller",
>>>> +                    "syscon", "simple-mfd";
>>>
>>> There are no child nodes, so you don't need simple-mfd.
>>
>> The example is taken from an actual device tree (look below),
>> where there are child nodes, I can trim it down.
>>
>>>> +       reg = <0x40000000 0x1000>;
>>>
>>> Looks like you have 2 nodes pointing to the same address with your
>>> reset binding? You shouldn't have overlapping resources. It's allowed
>>> for historical reasons but breaks resource creation in Linux.
>>
>> No... they are all in the same node, just sharing the same
>> resource by way of regmap (syscon).
>
> Okay, then please document at least the parent syscon node in a single
> doc. Splitting it is very confusing.

I'm sorry. :(

I'll patch the document in arm/gemini.txt
where the syscon node is documented, with a single patch adding
both clock and reset bindings.

>>                 syscon: syscon@40000000 {
>>                         compatible = "cortina,gemini-syscon",
>>                                      "cortina,gemini-clock-controller",
>>                                      "cortina,gemini-reset",
>
> This mostly looks fine, but you shouldn't need 3 compatible strings
> for the block.

OK I'll see if I can make it work with just "cortina,gemini-syscon"
and skip the two others.

Yours,
Linus Walleij
