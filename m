Return-Path: <olof@lixom.net>
Return-Path: <olof@lixom.net>
Date: Thu, 13 Aug 2015 14:28:31 +0200
From: Olof Johansson <olof@lixom.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"arm@kernel.org" <arm@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk/ARM: move Ux500 PRCC bases to the device tree
Message-ID: <20150813122831.GC23581@localhost>
References: <1438262365-29164-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdZJKNph9cbJvBMQKdOCe0L8kKP=AEDaYqtBuc9vxxKPeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdZJKNph9cbJvBMQKdOCe0L8kKP=AEDaYqtBuc9vxxKPeg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 12, 2015 at 02:02:50PM +0200, Linus Walleij wrote:
> On Thu, Jul 30, 2015 at 3:19 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > The base addresses for the Ux500 PRCC controllers are hardcoded,
> > let's move them to the clock node in the device tree and delete
> > the constants.
> >
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Ulf/Mike: please ACK this so I can take it through ARM SoC.
> 
> It appears this needs to go through the clk tree with the rest
> (1/3, 3/3).
> 
> Can I have an ACK from the ARM SoC people so they know
> this is happening?

Acked-by: Olof Johansson <olof@lixom.net>

I'm assuming you'll keep track of/avoid conflicts yourself, so I didn't
double-check for it.


-Olof
