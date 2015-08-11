Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20150811164151.2416.33353@quantum>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
	<CAMuHMdXeaVUyDxnW5JoqpA-meLsFBp8HYYM=5ETY6goKwBQ=cQ@mail.gmail.com>
	<20150811164151.2416.33353@quantum>
Date: Tue, 11 Aug 2015 19:42:59 +0200
Message-ID: <CAMuHMdU59mzgDe+mpvtMG76yGsCQ3QhHsxuXif9+c9bwr_J1Yg@mail.gmail.com>
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

On Tue, Aug 11, 2015 at 6:41 PM, Michael Turquette
<mturquette@baylibre.com> wrote:
> Quoting Geert Uytterhoeven (2015-08-11 02:20:12)
>> On Fri, Aug 7, 2015 at 9:09 PM, Michael Turquette
>> <mturquette@baylibre.com> wrote:
>> > This is an alternative solution to Lee's "clk: Provide support for
>> > always-on clocks" series[0].

>> I gave it a try on r8a7791/koelsch, where I replaced the hack from
>> "[PATCH/RFC 1/5] clk: shmobile: mstp: Never disable INTC-SYS"
>> (http://www.spinics.net/lists/linux-sh/msg41107.html) by setting
>>
>>         init.flags |= CLK_ENABLE_HAND_OFF
>>
>> in cpg_mstp_clock_register() for "intc-sys".
>>
>> The end result is fine (the "intc-sys" clock is never disabled), but I get
>> a few annoying lockdep splats like below (one for the "intc-sys" clock,
>> and one more for each parent up to the root clock):
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 0 at drivers/clk/clk.c:745 clk_core_enable+0x6c/0xdc()

> Thanks much for testing! I forgot to hold the enable lock in __clk_init
> (we already hold the prepare lock). Can you tell me if this diff fixes
> it?

Yes it does. Thanks for the quick fix!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
