Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
Date: Tue, 11 Aug 2015 11:20:12 +0200
Message-ID: <CAMuHMdXeaVUyDxnW5JoqpA-meLsFBp8HYYM=5ETY6goKwBQ=cQ@mail.gmail.com>
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
	Lee Jones <lee.jones@linaro.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

On Fri, Aug 7, 2015 at 9:09 PM, Michael Turquette
<mturquette@baylibre.com> wrote:
> This is an alternative solution to Lee's "clk: Provide support for
> always-on clocks" series[0].
>
> The first two patches introduce run-time checks to ensure that clock
> consumer drivers are respecting the clk.h api. The former patch checks
> for prepare and enable imbalances. The latter checks for calls to
> clk_put without first disabling and unpreparing the clk.
>
> The third patch introduces a new flag, CLK_ENABLE_HAND_OFF, which
> prepares and enables a clk at registration-time. The reference counts
> (prepare & enable) are transferred to the first clock consumer driver
> that clk_get's the clk with this flag set AND calls clk_prepare or
> clk_enable.
>
> The net result is that a clock with this flag set will be enabled at
> boot and neither the clk_disable_unused garbage collector or the
> "sibling clock disables a shared parent" scenario will cause the flagged
> clock to be disabled. The first driver to come along and explicitly
> claim, prepare and enable this clock will inherit those reference
> counts. No change to clock consumer drivers is required for this to
> work. Please continue to use the clk.h api properly.
>
> In time this approach can probably replace the CLK_IGNORE_UNUSED flag
> and hopefully reduce the number of users of the clk_ignore_unused boot
> parameter.

Thanks for your series!

I gave it a try on r8a7791/koelsch, where I replaced the hack from
"[PATCH/RFC 1/5] clk: shmobile: mstp: Never disable INTC-SYS"
(http://www.spinics.net/lists/linux-sh/msg41107.html) by setting

        init.flags |= CLK_ENABLE_HAND_OFF

in cpg_mstp_clock_register() for "intc-sys".

The end result is fine (the "intc-sys" clock is never disabled), but I get
a few annoying lockdep splats like below (one for the "intc-sys" clock,
and one more for each parent up to the root clock):

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at drivers/clk/clk.c:745 clk_core_enable+0x6c/0xdc()
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted
4.2.0-rc6-koelsch-04462-g27bac5e25174da01-dirty #1507
Hardware name: Generic R8A7791 (Flattened Device Tree)
Backtrace:
[<c00138b4>] (dump_backtrace) from [<c0013aac>] (show_stack+0x18/0x1c)
 r6:c05c249d r5:00000009 r4:00000000 r3:00200000
[<c0013a94>] (show_stack) from [<c045fea4>] (dump_stack+0x78/0x94)
[<c045fe2c>] (dump_stack) from [<c002ba18>] (warn_slowpath_common+0x90/0xbc)
 r4:00000000 r3:00000000
[<c002b988>] (warn_slowpath_common) from [<c002bae8>]
(warn_slowpath_null+0x24/0x2c)
 r8:eec10d00 r7:00000001 r6:eec0f8c0 r5:00000000 r4:eec0f8c0
[<c002bac4>] (warn_slowpath_null) from [<c0344fbc>] (clk_core_enable+0x6c/0xdc)
[<c0344f50>] (clk_core_enable) from [<c0346e44>] (clk_register+0x504/0x62c)
 r5:00000000 r4:eec0f8c0
[<c0346940>] (clk_register) from [<c0625cd8>] (cpg_mstp_clocks_init+0x240/0x310)
 r10:c05c2f26 r9:00000008 r8:eec10d00 r7:c0ff3755 r6:eec0f7c0 r5:ef1df1cc
 r4:eec09080
[<c0625a98>] (cpg_mstp_clocks_init) from [<c0624f7c>] (of_clk_init+0xe0/0x188)
 r10:00000002 r9:eec09100 r8:eec09108 r7:00000001 r6:eec09140 r5:c0643f48
 r4:00000000
[<c0624e9c>] (of_clk_init) from [<c060ea20>] (rcar_gen2_timer_init+0x108/0x120)
 r10:c0633ae4 r9:c0644400 r8:ffffffff r7:00000000 r6:ef7fca00 r5:f0006000
 r4:00989680
[<c060e918>] (rcar_gen2_timer_init) from [<c0609334>] (time_init+0x24/0x38)
 r5:c067c000 r4:00000000
[<c0609310>] (time_init) from [<c0606bb0>] (start_kernel+0x268/0x378)
[<c0606948>] (start_kernel) from [<40008090>] (0x40008090)
 r10:00000000 r9:413fc0f2 r8:40007000 r7:c0647fe8 r6:c0633ae0 r5:c0644480
 r4:c067c394
---[ end trace cb88537fdc8fa200 ]---

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
