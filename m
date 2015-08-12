Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20150812012530.GJ26614@codeaurora.org>
References: <1438172615-11276-1-git-send-email-linus.walleij@linaro.org>
	<20150731065008.GU3159@codeaurora.org>
	<CACRpkdbaGU8jMQY=WpkV0ZF_KfFCq167kWCD_CropJM10RC9QQ@mail.gmail.com>
	<20150812012530.GJ26614@codeaurora.org>
Date: Wed, 12 Aug 2015 10:40:00 +0200
Message-ID: <CACRpkdZ-c=gmxu2G1Bv__gtpXTHBRe4NdDn5OOg7kcdFT5-3TQ@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile/impd1: switch order of CLCD clocks
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 12, 2015 at 3:25 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Ok. I'm still confused and concerned that putting the clocks into
> the list in a certain order fixes anything.

Oh maybe it doesn't I could've been mistaken here.
clk_find() should indeed find the right clock.

> If this fix is valid, did you want a fixes tag on this so it goes
> back to stable?

Nah you can drop it, sorry for the fuzz.

Yours,
Linus Walleij
