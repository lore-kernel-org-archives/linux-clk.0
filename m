Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170120230000.GC8009@codeaurora.org>
References: <1484657190-12838-1-git-send-email-geert+renesas@glider.be> <20170120230000.GC8009@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2017 10:34:43 +0100
Message-ID: <CAMuHMdUG40hrefKvu5HSRv0rTEo68kTcEh4JMLb5jyY3pmn-bQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: renesas: Use CLK_IS_CRITICAL to handle critical clocks
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Sat, Jan 21, 2017 at 12:00 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 01/17, Geert Uytterhoeven wrote:
>> This patch series adds support for the CLK_IS_CRITICAL flag to drivers
>> for module clocks on Renesas ARM SoCs.  For now, this is used to prevent
>> disabling of the ARM GIC module clock, which would lead to a system
>> lock-up when accessing the GIC's registers.
>>
>>   1. The first patch migrates the Renesas CPG/MSSR driver from the
>>      never merged CLK_ENABLE_HAND_OFF flag to the CLK_IS_CRITICAL flag.
>>      Note that as the driver already handled critical clocks (i.e. it
>>      ignored them :-), this is not a prerequisite for linking the GIC to
>>      its module clock in DT.
>>
>>   2. The second patch makes sure the CLK_IS_CRITICAL flag is set for the
>>      INTC-SYS clock on SoCs not (yet) using the Renesas CPG/MSSR driver.
>>      Note that this is a hard dependency for describing the INTC-SYS
>>      clock in DT on R-Mobile APE6 and R-Car Gen2.
>>
>> I plan to queue these patches in my clk-renesas-for-v4.11 branch, if
>> you agree.
>
> Would the runtime PM patches for ccf make things any better here?

It won't make much of a difference, as typically you'll want the GIC running
all the time anyway, also for wake-up sources.
We just have to make sure it's not disabled indefinitely.

As such it's different from a real critical clock that kills the system
immediately (e.g. some secret core clock): you can disable the GIC clock,
just make sure to enable it again (and have a means to re-enable it, without
relying on interrupts ;-)

The only difference with a real critical clock is that you
> I still plan to support CLK_ENABLE_HAND_OFF somehow, but it's not
> at the top of my priority list right now.

Good, we can convert back later, perhaps when the GIC driver is ready to
support PM for non-secondary GICs...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
