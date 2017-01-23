Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170120231243.GE8009@codeaurora.org>
References: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
 <1484657190-12838-3-git-send-email-geert+renesas@glider.be> <20170120231243.GE8009@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2017 10:50:36 +0100
Message-ID: <CAMuHMdWxmPr9B7QkrhXMbsis0UchdXf7p7TLky9QQNcz474iFw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: mstp: Make INTC-SYS a critical clock
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Sat, Jan 21, 2017 at 12:12 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 01/17, Geert Uytterhoeven wrote:
>> INTC-SYS is the module clock for the GIC.  Accessing the GIC while it is
>> disabled causes:
>>
>>     Unhandled fault: asynchronous external abort (0x1211) at 0x00000000
>>
>> Currently, the GIC-400 driver cannot enable its module clock for several
>> reasons:
>>   - It does not use a platform device, so Runtime PM is not an option,
>>   - gic_of_init() runs before any clocks are registered, so it cannot
>>     enable the clock explicitly,
>>   - gic_of_init() cannot return -EPROBE_DEFER, as IRQCHIP_DECLARE()
>>     doesn't support deferred probing.
>>
>> Hence we have to keep on relying on the boot loader for enabling the
>> module clock.
>>
>> To prevent the module clock from being disabled when the CCF core thinks
>> it is unused, and thus causing a system lock-up, add a check to the MSTP
>> clock driver and enable CLK_IS_CRITICAL. This will make sure the module
>> clock is never disabled.
>>
>> This is a hard dependency for describing the INTC-SYS clock in DT on
>> R-Mobile APE6 and R-Car Gen2.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Thanks!

>> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
>> index 9375777776d99407..c0319b8acf3521a2 100644
>> --- a/drivers/clk/renesas/clk-mstp.c
>> +++ b/drivers/clk/renesas/clk-mstp.c
>> @@ -144,6 +144,11 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
>
> Sad that git gets confused about which function this is in.

Indeed. Will send a patch to fix that...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
