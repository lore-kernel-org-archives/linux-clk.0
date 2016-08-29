Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <SG2PR06MB116574538B09E83FAA4F73868AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
 <CAMuHMdWiPfZq=VgWhFRaQBoazLGSDo3+AB_cUG5hMhPxzypLAA@mail.gmail.com>
 <SG2PR06MB1165182DE474D907F38694E98AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXtzSNo84hLDNg=nZpG3HB1YPC2JNk6tiFx5eoFtHZjdg@mail.gmail.com> <SG2PR06MB116574538B09E83FAA4F73868AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 17:41:49 +0200
Message-ID: <CAMuHMdWhkz_coGhnN7qmrFEPwVCwFvenrVK4nMr7jkFu9YsL-g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rz: Select EXTAL vs USB clock
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Mon, Aug 29, 2016 at 5:32 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Aug 29, 2016, Geert Uytterhoeven wrote:
>> We really need to get the GPIO driver upstream, and add support for reading the MD_* pins.
>
> OK, we can just read the mode pin instead of looking at the DT.
>
> In setup-r8a7779.c, they use ioremap to read the mode and then pass the mode into r8a7779_clocks_init() in the clock file.
> Looks like setup-rcar-gen2.c does the same thing.
>
> So, can we do the same in setup-r7s72100.c and clk-rz.c? No GPIO driver is needed and it would match the other platforms are doing.

Please don't: we're trying to get rid of reading the mode pins (a) in setup-*.c
and passing them to the clock driver, (b) without a proper driver.

Until you have a proper GPIO driver, I think the best solution is to ioremap()
the hardcoded registers in clk-rz.c, and reading the mode pins.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
