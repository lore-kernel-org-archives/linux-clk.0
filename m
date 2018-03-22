Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Linus Walleij <linus.walleij@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180322101618.9655-1-linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
References: <20180322101618.9655-1-linus.walleij@linaro.org>
Message-ID: <152173749844.178046.3216641335872815943@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: ux500: Drop AB8540/9540 support
Date: Thu, 22 Mar 2018 09:51:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Linus Walleij (2018-03-22 03:16:18)
> The AB8540 was an evolved version of the AB8500, but it was never
> mass produced or put into products, only reference designs exist.
> The upstream support was never completed and it is unlikely that
> this will happen so drop the support for now to simplify
> maintenance of the AB8500.
> =

> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
