Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Jun 2017 11:07:48 +0200
Message-ID: <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] clk: implement clock rate protection mechanism
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
	Boris Brezillon <boris.brezillon@free-electrons.com>, Adriana Reus <adi.reus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 12, 2017 at 9:44 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> The goal of this patchset is to provide a way for consumers to inform the
> system that they depend on the rate of the clock source and can't tolerate
> other consumers changing the rate or causing glitches.

Just for context: chat kind of consumers are these?

i.e. the consumers that can't tolerate a clock rate change?

I understand it if it is a hardware limitation (like the block would
crash if it glitches or changes rate).

On the other hand, in the kernel we have things like in
arch/arm/kernel/smp_twd.c we use a notifier to deal
with a changing clock rate.

Just want to be sure that you're not working around something that
can be dealt with using rate change notifiers.

(OK maybe a stupid question, I assume this is not the case, but anyways,
had to ask.)

Yours,
Linus Walleij
