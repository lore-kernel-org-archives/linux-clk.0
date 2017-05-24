Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkda0V8dcxgaFg5M3jEK+wgsWR8ndK=LYwLdnpqFeKwzCbQ@mail.gmail.com>
References: <20170515171922.1069-1-linus.walleij@linaro.org> <CACRpkda0V8dcxgaFg5M3jEK+wgsWR8ndK=LYwLdnpqFeKwzCbQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 May 2017 11:10:03 +0200
Message-ID: <CACRpkdZ4k+CDtjTjqNzaXfqufZyxPMUWKU97biuNQ1ZKXC2HTg@mail.gmail.com>
Subject: Re: [PATCH 3/5 v3] clk: Add Gemini SoC clock controller
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Cc: Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 19, 2017 at 5:37 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, May 15, 2017 at 7:19 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> The Cortina Systems Gemini (SL3516/CS3516) has an on-chip clock
>> controller that derive all clocks from a single crystal, using some
>> documented and some undocumented PLLs, half dividers, counters and
>> gates. This is a best attempt to construct a clock driver for the
>> clocks so at least we can gate off unused hardware and driver the
>> PCI bus clock.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> ChangeLog v2->v3:
>> - Augment driver to probe directly from the system controller.
>> - Mike/Stephen: when you're happy with this please ACK it so I
>>   can merge it through ARM SoC. This is needed because of
>>   the mess of #include <dt-bindings/*> from the DT bindings
>>   that is then used all over the DTS files.
>
> Mike/Stephen:
>
> Can I have an ACK from either of you if this looks all right?
>
> I want to merge this through ARM SoC to get the dependencies
> for the DTS includes right.

I changed merge strategies after advise from Olof.

I sent a v4 of this adding the macros and the driver through the
clocks tree, so please look into that and disregard this old patch.

Yours,
Linus Walleij
