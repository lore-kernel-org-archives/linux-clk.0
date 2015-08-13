Return-Path: <sboyd@codeaurora.org>
Date: Thu, 13 Aug 2015 11:29:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Olof Johansson <olof@lixom.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"arm@kernel.org" <arm@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk/ARM: move Ux500 PRCC bases to the device tree
Message-ID: <20150813182814.GR26614@codeaurora.org>
References: <1438262365-29164-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdZJKNph9cbJvBMQKdOCe0L8kKP=AEDaYqtBuc9vxxKPeg@mail.gmail.com>
 <20150813122831.GC23581@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150813122831.GC23581@localhost>
List-ID: <linux-clk.vger.kernel.org>

On 08/13, Olof Johansson wrote:
> On Wed, Aug 12, 2015 at 02:02:50PM +0200, Linus Walleij wrote:
> > On Thu, Jul 30, 2015 at 3:19 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> > 
> > > The base addresses for the Ux500 PRCC controllers are hardcoded,
> > > let's move them to the clock node in the device tree and delete
> > > the constants.
> > >
> > > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > > Ulf/Mike: please ACK this so I can take it through ARM SoC.
> > 
> > It appears this needs to go through the clk tree with the rest
> > (1/3, 3/3).
> > 
> > Can I have an ACK from the ARM SoC people so they know
> > this is happening?
> 
> Acked-by: Olof Johansson <olof@lixom.net>
> 
> I'm assuming you'll keep track of/avoid conflicts yourself, so I didn't
> double-check for it.
> 

Thanks. Applied to clk-next.
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
