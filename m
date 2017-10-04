Return-Path: <sboyd@codeaurora.org>
Date: Wed, 4 Oct 2017 14:21:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>, Sergej Sawazki <ce3a@gmx.de>,
	Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 1/2] clk: clk-gpio: Make GPIO clock provider use
 descriptors only
Message-ID: <20171004212150.GY457@codeaurora.org>
References: <20170924161919.24832-1-linus.walleij@linaro.org>
 <20170929225754.GO457@codeaurora.org>
 <CACRpkdZD9ApuYvatx9y4hVnHoRDBPFKrYvQnQemM8URZnVJ8NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdZD9ApuYvatx9y4hVnHoRDBPFKrYvQnQemM8URZnVJ8NA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/01, Linus Walleij wrote:
> On Sat, Sep 30, 2017 at 12:57 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 09/24, Linus Walleij wrote:
> 
> >> I don't have GPIO clocks in my setups so this will obviously
> >> need some testing.
> >>
> >> I guess the public APIs in clk-provider.h could actually be
> >> removed, but I'm not certain if that is proper. Maybe there
> >> are plans for this driver to be used by other providers than the
> >> device tree.
> >
> > If nobody is using them it's fine to remove them. This falls into
> > another "basic clk type" that Mike and I don't really like to
> > keep around.
> 
> I started to make a patch for it, removing the non-clk_hw* portions
> so that at least only the *hw* infix versions would be around.
> (I guess that is what you want to optimally keep around.)
> 
> It became a bit complex since this driver itself is using the
> non-hw calls, and with not being able to test it I chickened out.
> 
> But if you like the idea, I can make a second attempt (on top of
> these two patches), especially if someone volunteers to test it.

I don't know if anyone is going to test it. We have only a
handful of users in mainline. I'll just merge these patches and
you can remove the non-clk_hw portions later if you're
interested.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
