Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180102192320.GJ7997@codeaurora.org>
References: <1514906853-9364-1-git-send-email-geert+renesas@glider.be> <20180102192320.GJ7997@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2018 22:35:48 +0100
Message-ID: <CAMuHMdWHppy3hKia2Lyj957a01JrfwW4_q2n=YVP=1MLHRDD1A@mail.gmail.com>
Subject: Re: [PATCH] clk: Fix debugfs_create_*() usage
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Tue, Jan 2, 2018 at 8:23 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 01/02, Geert Uytterhoeven wrote:
>> When exposing data access through debugfs, the correct
>> debugfs_create_*() functions must be used, depending on data type.
>>
>> Remove all casts from data pointers passed to debugfs_create_*()
>> functions, as such casts prevent the compiler from flagging bugs.
>>
>> clk_core.rate, .accuracy, and .flags are "unsigned long", hence casting
>> to "u32 *" exposed the wrong halves on big-endian 64-bit systems.
>>
>> Fix .rate and .accuracy, by using debugfs_create_ulong() instead.
>>
>> Fix .flags by changing the field to "unsigned int", as a change to
>> debugfs_create_x64() on 64-bit systems would change the user-visible
>> formatting in debugfs.
>> Note that __clk_get_flags() and clk_hw_get_flags() are left unchanged
>> and still return "unsigned long", to avoid having to change all their
>> users.  Likewise, of_clk_detect_critical() still takes "unsigned long",
>> but the comment is updated as it is never passed a real pointer to
>> clk_core.flags.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Looks like none of the 64-bit architectures support common clock yet?
>
> arm64 does.

Sorry, I meant "64-bit big endian".

>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -58,7 +58,7 @@ struct clk_core {
>>       unsigned long           new_rate;
>>       struct clk_core         *new_parent;
>>       struct clk_core         *new_child;
>> -     unsigned long           flags;
>> +     unsigned int            flags;
>
> This doesn't look good.

Why not?
It's not like flags is used with bitops, which would  mandate unsigned long.
And you can't start using bits 32-63 without changing flags to u64, else
the extra bits are not available on 32-bit platforms.

>> @@ -2600,43 +2600,43 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
>>
>>       core->dentry = d;
>>
>> -     d = debugfs_create_u32("clk_rate", S_IRUGO, core->dentry,
>> -                     (u32 *)&core->rate);
>> +     d = debugfs_create_ulong("clk_rate", S_IRUGO, core->dentry,
>> +                              &core->rate);
>
> As you're changing these lines, can you also change S_IRUGO to
> the octal values. That's the preferred style now.

Yes, I can. That would be a separate patch, though.

>>       d = debugfs_create_x32("clk_flags", S_IRUGO, core->dentry,
>> -                     (u32 *)&core->flags);
>> +                            &core->flags);
>
> Maybe we need a new debugfs API like debugfs_create_ulong_hex()
> or something that prints out an unsigned long as a hex value?

That's possible.  I already have that locally (for another user which uses
u32 or u64 depending on platform).
My main worry was the change from 0xXXXXXXXX to 0xXXXXXXXXXXXXXXXX
on 64-bit platforms, which you don't seem to see as a blocker, as
debugfs isn't ABI?

> Probably we should change it to pretty print the values and what
> they correspond to, with words, because that's the least
> confusing thing to do with regards to endianness. So the

Endianness doesn't matter when printing u32. The hex values of
the flags are the same on big and little endian.

> clk_flags file would have something like
>
>         CLK_SET_RATE_PARENT
>         CLK_SET_RATE_GATE
>
> if those flags are set.

But some flags are internal to platform-specific drivers, right?

> We don't care about ABI here either. This is debugfs.

OK.

>> @@ -3927,7 +3927,7 @@ static int parent_ready(struct device_node *np)
>>   * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Device Tree
>>   * @np: Device node pointer associated with clock provider
>>   * @index: clock index
>> - * @flags: pointer to clk_core->flags
>> + * @flags: pointer to core clock flags
>
> Please split this off into another patch.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
