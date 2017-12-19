Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20171218190303.GV7997@codeaurora.org>
References: <20171218170007.28042-1-jbrunet@baylibre.com> <20171218190303.GV7997@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Dec 2017 09:50:54 +0100
Message-ID: <CAMuHMdUsiSvu7o3qELdhOhizKWaP5=M+Mr7tEXpcHFDUaEq-Pg@mail.gmail.com>
Subject: Re: [PATCH] clk: check ops pointer on clock register
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Dec 18, 2017 at 8:03 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 12/18, Jerome Brunet wrote:
>> Nothing really prevents a provider from (trying to) register a clock
>> without providing the clock ops structure.
>>
>> We do check the individual fields before using them, but not the
>> structure pointer itself. This may have the usual nasty consequences when
>> the pointer is dereferenced, mostly likely when checking one the field
>> during the initialization.
>
> Yes, that nasty consequence should be a kernel oops, and the
> developer should notice that before submitting the driver for
> inclusion. I don't think we really care to return an error here
> if this happens.

+1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
