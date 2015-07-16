Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1436571223-10959-7-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-7-git-send-email-sboyd@codeaurora.org>
Date: Thu, 16 Jul 2015 15:27:39 +0200
Message-ID: <CACRpkdZNJ+P=SzMpH945zjDjf9J7hPJqorroeTRpuerLqno2cQ@mail.gmail.com>
Subject: Re: [PATCH 06/45] clk: nomadik: Remove clk.h and clkdev.h includes
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 11, 2015 at 1:33 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver. This driver also includes clkdev.h even though
> it isn't used, so drop it too and add slab.h to make sure
> everything still compiles.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
