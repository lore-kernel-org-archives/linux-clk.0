Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1436571223-10959-28-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
	<1436571223-10959-28-git-send-email-sboyd@codeaurora.org>
Date: Thu, 16 Jul 2015 15:29:39 +0200
Message-ID: <CACRpkdaA-CAON7Juv8ot5rcMvG9EnKR8xjHAH_VCPoh=FX=Mxg@mail.gmail.com>
Subject: Re: [PATCH 27/45] clk: ux500: Remove clk.h and clkdev.h includes
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jul 11, 2015 at 1:33 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver. Also remove clkdev.h in files that aren't using
> it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Ulf Hansson should also look at this preferably.

Yours,
Linus Walleij
