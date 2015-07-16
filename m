Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1436571223-10959-12-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-12-git-send-email-sboyd@codeaurora.org>
Date: Thu, 16 Jul 2015 15:28:16 +0200
Message-ID: <CACRpkdbzsA-8mdfK++THv1ibDE7yEt+zx++y5k+5HPf8MrMSdg@mail.gmail.com>
Subject: Re: [PATCH 11/45] clk: u300: Remove clk.h include
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 11, 2015 at 1:33 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver. Also add in slab.h because without clkdev.h
> compilation of this file would fail.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
