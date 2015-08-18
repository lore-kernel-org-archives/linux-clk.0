Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150818155203.GJ2547@lukather>
Cc: "Lee Jones" <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, sboyd@codeaurora.org, s.hauer@pengutronix.de,
 geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150810144811.GN3249@x1> <20150810185516.2416.32293@quantum>
 <20150811084329.GA13374@x1> <20150811170904.2416.43354@quantum>
 <20150811183317.GT18282@x1> <20150811185827.31346.68194@quantum>
 <20150818155203.GJ2547@lukather>
Message-ID: <20150818163356.31346.15075@quantum>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Date: Tue, 18 Aug 2015 09:33:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2015-08-18 08:52:03)
> On Tue, Aug 11, 2015 at 11:58:27AM -0700, Michael Turquette wrote:
> > For example the whole big messy fuss over the DT bindings for the
> > simple-fb driver could have been avoided if this feature had existed
> > then.
> =

> Not really, there was additional issues that would have prevented to
> use that in simplefb too. For example the fact that you wouldn't care
> about the clock at all if simplefb was not enabled in the kernel. Or
> that you would like to protect the pixel clock (or its parent) from
> having its rate changed.

You're right, there may be more issues involved here. But as I recall
there was interest in using simplefb to "hand-off" to a loadable module
later on, and that was really what I was referring to.

In that case we could "skip" simplefb having to claim and enable clocks.
The loadable module that is the "rich" driver could just claim them as
usual and the reference counts would be handed over at that time.

But I don't mean to dig up past flamebait ;-)

Regards,
Mike

> =

> Maxime
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
