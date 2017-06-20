Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1497961950.7387.7.camel@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com> <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
 <1497955822.7387.3.camel@baylibre.com> <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
 <1497961950.7387.7.camel@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Jun 2017 17:29:09 +0200
Message-ID: <CACRpkdbQQv02t63ywH8HDMdooTVbQ9MPTHkqi7ufNGqxsD4pXQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] clk: implement clock rate protection mechanism
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
	Boris Brezillon <boris.brezillon@free-electrons.com>, Adriana Reus <adi.reus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 20, 2017 at 2:32 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> To build confidence that this won't be causing regression, I'd like to check
> that platform using this flag are no relying on the broken behavior.
>
> I've included the clock maintainers of at91, qcom, and ux500 (you) in this
> thread because they are the heaviest users of this flag, so the more likely to
> report a problem.

OK I'm pretty sure this will not impact the ux500 in a negative way,
we don't play around much with the clocks in that way.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

for the entire series.

Yours,
Linus Walleij
