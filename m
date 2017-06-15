Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXdYNTLCUfQ9rdj8Fffff5G6fGREcHs5-E5LbwPU9yyLw@mail.gmail.com>
References: <20170524082044.8473-1-linus.walleij@linaro.org>
 <20170601070208.GO20170@codeaurora.org> <CACRpkdZv8MzXVecEXVdJ+P0MxVscYSy=MxC-yQAR0S4yQ6-rwQ@mail.gmail.com>
 <20170605195812.GH20170@codeaurora.org> <CACRpkdbya9xaN-i7AkG0bTyuFYfZc59sSTYhWB43=9btSKfPpQ@mail.gmail.com>
 <CACRpkdapAgHix2vw-woDFi4sh+H3_EX7w-5q=opBGMyegFrXbA@mail.gmail.com>
 <20170612210248.GP20170@codeaurora.org> <CACRpkdaZJbzC0-xg_go=-o+0cQ-JOY3mUe27HUnwQ+DnZYbyMA@mail.gmail.com>
 <CAMuHMdXdYNTLCUfQ9rdj8Fffff5G6fGREcHs5-E5LbwPU9yyLw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Jun 2017 14:57:53 +0200
Message-ID: <CACRpkdY+aSyec9PZaoXErzsRefWg2zzw1xihQt_whmote-jBBw@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] clk: Add Gemini SoC clock controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>, Janos Laube <janos.dev@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 15, 2017 at 10:55 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> If clocks and resets are provided by the same hardware module, you can
> have a single (platform) driver registering both the clock and reset
> controllers.
> Cfr. drivers/clk/renesas/renesas-cpg-mssr.c.

That is indeed an option.

So I would say, clk & reset maintainers: would you prefer that I merge the
reset control into the clock driver as well, ask Philipp to drop the pending
reset control patches from his subsystem tree and have you manage the
combined driver and bindings?

It seems to me as very ugly from a divide & conquer subsystem and file
split point of view.

I seems elegant from the "make clocks a platform device" point of view.

I am happy with either approach as long as it works.

I guess it is up to the taste of the subsystem maintainers, especially
clk.

If I get some time I might just hack this up and send the patches so
it is on the table as an alternative to the current v5 patch. Certainly it is
better than going back and augmenting the DT bindings.

Yours,
Linus Walleij
