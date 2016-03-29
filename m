Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36110 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352AbcC2Rw7 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2016 13:52:59 -0400
MIME-Version: 1.0
In-Reply-To: <20160329155439.GG1398@katana>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
	<1458824442-20279-4-git-send-email-wsa@the-dreams.de>
	<CAMuHMdW1zTwLbgEVZD+VOEy934yUEp90pEv-ju_1+dd5RjLp-A@mail.gmail.com>
	<20160329155439.GG1398@katana>
Date: Tue, 29 Mar 2016 19:52:58 +0200
Message-ID: <CAMuHMdXr9a0cKZc7DFDKiziPsT4z8s2VeDXds26zRqidHMSvWw@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: shmobile: r8a7795: add R clk
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram,

On Tue, Mar 29, 2016 at 5:54 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> > @@ -114,8 +117,11 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>> >         DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
>> >         DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
>> >
>> > -       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, 0x0240, 8),
>> > -       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, 0x0240, 32),
>> > +       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR, 8),
>> > +       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, CPG_RCKCR, 32),
>> > +
>> > +       /* must come after EXTALR because we need its rate */
>>
>> must come after r_int because we need that clock as a possible parent?
>
> Well, I added the comment because the dependency to EXTALR is not
> obvious. Unlike the dependency to RINT which is described in the same
> manner as the rest of the clocks.
>
> Maybe I should simply remove the comment if it creates only confusion?

That's indeed a viable option...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
