Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAK7LNAQfwh3Z_=VWHvDi6EXFtVLuRMFVYzKMq8qCaZ30jfCq8g@mail.gmail.com>
References: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
 <20160804212553.GB15690@codeaurora.org> <CAK7LNAQfwh3Z_=VWHvDi6EXFtVLuRMFVYzKMq8qCaZ30jfCq8g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Aug 2016 11:00:30 +0200
Message-ID: <CAMuHMdX=VVQYZMNow_ycnGq8NWZ2Y0Sijx19jo4PtRE-N7pXnA@mail.gmail.com>
Subject: Re: of_clk_add_(hw_)providers multipule times for one node?
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sun, Aug 7, 2016 at 6:54 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2016-08-05 6:25 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>> +Rob in case he has any insight
>>
>> On 07/09, Masahiro Yamada wrote:
>>> I think the current code allows to add
>>> clk_providers multiple times against one DT node.
>>>
>>> Are there cases that really need to do so?
>>
>> If we have clk drivers that have a device driver structure and
>> also use CLK_OF_DECLARE then we could get into a situation where
>> they register two providers for the same device node. I can't
>> think of any other situation where this would happen though.
>
> What is the benefit for splitting one clock device
> into CLK_OF_DECLARE() and a platform_driver?

It may be useful if you want to provide a few clocks very early in the boot
(through CLK_OF_DECLARE()), and the remaining ones later (through the
platform_driver).

> If we go this way, I think we need to fix the current code.
>
> of_clk_add_provider() calls of_clk_del_provider()
> in its failure path.
>
> Notice of_clk_del_provider() unregister
> all the providers associated with the device node.
>
> So, if of_clk_add_provider() fails to register a platform driver,
> it may unregister another provider added by OF_CLK_DECLARE().

Do you have to call of_clk_add_provider() from the platform driver?
Can't you just populate the missing entries in the clk_onecell_data as
registered from the CLK_OF_DECLARE() driver part?

Alternatively, if there's a clear (non-Linux specific, as this affects DT!)
distinction between the two sets of clocks, you could register your own
twocell_get routine from CLK_OF_DELCARE(), and fill in a second
(third, fourth, ...) set of clocks from the platform_driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
