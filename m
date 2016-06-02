Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20160601231533.9354-21-stephen.boyd@linaro.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
	<20160601231533.9354-21-stephen.boyd@linaro.org>
Date: Thu, 2 Jun 2016 14:06:11 +0200
Message-ID: <CACRpkdYa5JqZ0ge60C6rEZ_0_0+6TCmf49WcQYtMBgeJBr7FVg@mail.gmail.com>
Subject: Re: [PATCH 20/34] clk: nomadik: Migrate to clk_hw based OF and
 registration APIs
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 2, 2016 at 1:15 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:

> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
