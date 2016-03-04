Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160304051042.GB27942@verge.net.au>
References: <1456971486-13761-1-git-send-email-horms+renesas@verge.net.au>
	<CAMuHMdXfkV05AwaRtLqwA8Ko=BQaQ5y87AYgsU7O-Rd45JiNKA@mail.gmail.com>
	<20160303192617.GY24999@codeaurora.org>
	<20160303193050.GA24999@codeaurora.org>
	<CAMuHMdXsR1s8qT+VKG2+EA5wV0Vr6xjTkW1d9E=7NHju+4GpJw@mail.gmail.com>
	<20160304051042.GB27942@verge.net.au>
Date: Fri, 4 Mar 2016 13:55:45 +0100
Message-ID: <CAMuHMdWd=fg7Lw3FNn6BMVsXt8gTsZvCPteyd4nsbmk=KbPyaw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: move drivers to renesas directory
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Simon,

On Fri, Mar 4, 2016 at 6:10 AM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Mar 03, 2016 at 08:55:33PM +0100, Geert Uytterhoeven wrote:
>> On Thu, Mar 3, 2016 at 8:30 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> > On 03/03, Stephen Boyd wrote:
>> >> On 03/03, Geert Uytterhoeven wrote:
>> >> > On Thu, Mar 3, 2016 at 3:18 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
>> >> > > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
>> >> > > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
>> >> > > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>> >> > >
>> >> > > Along with the above mentioned Kconfig changes it seems appropriate
>> >> > > to also rename directories that only hold drivers for such SoCs.
>> >> > >
>> >> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> >> >
>> >> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> >> >
>> >>
>> >> Applied to clk-next.
>> >
>> > Also, did you want to rename the clk/shmobile.h header file?
>>
>> That would indeed make sense, but does require changes in both
>> arch/arm/mach-shmobile/ and drivers/clk/shmobile/.
>
> If there are no issues with conflicts, which I expect to be the case,
> I'd be happy for the arch/arm/mach-shmobile/ changes to go through the
> clk tree with an Ack or Sob from me. Geert, do you think that would fly?

Sure, no problem.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
