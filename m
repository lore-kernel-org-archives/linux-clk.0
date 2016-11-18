Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161118095938.GC22664@verge.net.au>
References: <1478532904-5604-1-git-send-email-geert+renesas@glider.be>
 <20161117230701.GR25626@codeaurora.org> <CAMuHMdU9TRVWyCFf=auH2qZdW0hDYJW-E2ukruNY8dkn9yarxA@mail.gmail.com>
 <20161118095938.GC22664@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Nov 2016 11:12:40 +0100
Message-ID: <CAMuHMdW4eSdXqheeDUjT98i+EHd4Nr1Dp0y0nEqThEZ+pwe6DA@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.10 (take two)
To: Simon Horman <horms@verge.net.au>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Simon,

On Fri, Nov 18, 2016 at 10:59 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Nov 18, 2016 at 10:55:00AM +0100, Geert Uytterhoeven wrote:
>> On Fri, Nov 18, 2016 at 12:07 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> > On 11/07, Geert Uytterhoeven wrote:
>> >> The following changes since commit dbdcc4f996df280eb2758095b4774ea62da8a2a7:
>> >>
>> >>   clk: renesas: r8a7796: Add DU and LVDS clocks (2016-11-02 20:40:08 +0100)
>> >>
>> >> are available in the git repository at:
>> >>
>> >>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.10-tag2
>> >>
>> >> for you to fetch changes up to 1936be95e013802291201c1ed193e04fd1ed3d13:
>> >
>> > Ok. Pulled into clk-next. I'm a little wary here as I haven't
>> > seen any indication from arm-soc maintainers (not Simon) that
>> > they'll take this cross tree merge. I guess we'll see how it
>> > goes.
>>
>> Thanks for pulling!
>>
>> Simon: while it's too late in the v4.10 cycle to queue additional cleanups in
>> the platform code on top of this, can you please still pull
>>
>>         git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>> rcar-rst
>>
>> to resolve the (trivial) merge conflicts between the conversion to the RST
>> driver in that branch, and the addition of PRR and RZ/G support in your tree?
>> This will prevent arm-soc and/or Linus from having to deal with these
>> conflicts.
>>
>> For reference, I've pushed the conflict resolution to branch
>
> Pull where? I've already sent pull-requests to the ARM SoC maintainers

What do you mean with "where"?

> so I fear this may be too late.

I know you've already sent pull requests.
Without a conflict resolution, the arm-soc maintainers and/or Linus will
face the conflicts, depending on merge order.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
