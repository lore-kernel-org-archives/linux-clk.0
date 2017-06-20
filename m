Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1497955822.7387.3.camel@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com> <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
 <1497955822.7387.3.camel@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Jun 2017 13:54:51 +0200
Message-ID: <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] clk: implement clock rate protection mechanism
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
	Boris Brezillon <boris.brezillon@free-electrons.com>, Adriana Reus <adi.reus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 20, 2017 at 12:50 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Tue, 2017-06-20 at 11:07 +0200, Linus Walleij wrote:

> When the rate is critical to perform a particular task. My example is the audio
> and i2s output. You can't tolerate glitches during the playback, the end user
> would complain (longer description in the original RFC)

I see. Thanks for your detailed explanation!

> It also fixes the behavior of CLK_SET_RATE_GATE flag, which is why I put you in
> CC.
>
> ux500 uses this flag several time, I'd like make sure people are not relying on
> its broken implementation.

Ux500 audio is broken, but I'm fixing it a little at a time...

Yours,
Linus Walleij
