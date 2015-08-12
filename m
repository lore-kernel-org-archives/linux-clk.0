Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20150811234552.GP2839@codeaurora.org>
References: <1438262352-29118-1-git-send-email-linus.walleij@linaro.org>
	<20150803215129.GD21068@codeaurora.org>
	<CACRpkdYdFAjRGMfsG4Kx=xNBACofcjFR3U1+P4U3yBmgQcFATQ@mail.gmail.com>
	<20150811234552.GP2839@codeaurora.org>
Date: Wed, 12 Aug 2015 10:27:31 +0200
Message-ID: <CACRpkdbxyT=-w3jYEnRuhRWid2BRJ+ftSOTyZpbTVocN8Fj4MA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk/ARM: delete the non-DT U8500 clock implementation
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 12, 2015 at 1:45 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/10, Linus Walleij wrote:

>> No you can actually apply it in isolation. I was just collecting
>> them in one spot for testing.
>>
>> Can you please apply this directly to the clk tree and
>> fix any clashes?
>
> Sure. Do we need to apply patches 2 and 3 too? I'm mostly trying
> to avoid merge conflicts.

Nope these should be orthogonal, this patch only deletes stuff
that isn't used anywhere or in close proximity of anything else
that is being patched now.

Yours,
Linus Walleij
