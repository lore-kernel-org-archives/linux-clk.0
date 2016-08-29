Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <SG2PR06MB1165182DE474D907F38694E98AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
 <CAMuHMdWiPfZq=VgWhFRaQBoazLGSDo3+AB_cUG5hMhPxzypLAA@mail.gmail.com> <SG2PR06MB1165182DE474D907F38694E98AE10@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 17:13:38 +0200
Message-ID: <CAMuHMdXtzSNo84hLDNg=nZpG3HB1YPC2JNk6tiFx5eoFtHZjdg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rz: Select EXTAL vs USB clock
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Mon, Aug 29, 2016 at 4:53 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Aug 29, 2016, Geert Uytterhoeven wrote:
>>> Instead of hard coding EXTAL only, check if EXTAL was specified. If
>>> not, then assume the USB clock is used as the main system clock.
>>>
>>> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>>
>> What's the rationale behind this change?
>
> I'm thinking about beyond Renesas boards. People are making RZ/A1 boards with just the USB clock to save on BOM costs since 384MHz vs 400MHz is not enough of a drop to care about.
> And of course, having someone make this kind of selection in the DT is better than forcing them to hack the clock file.

We really need to get the GPIO driver upstream, and add support for
reading the MD_* pins.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
