Return-Path: <narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20160704211220.5685-6-paul.gortmaker@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com> <20160704211220.5685-6-paul.gortmaker@windriver.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Date: Wed, 6 Jul 2016 15:11:41 +0200
Message-ID: <CAA3gFWsmHo0E=c15gsAWZxi03MCLiCtBQaZG4_rCZ_4jNzyhUg@mail.gmail.com>
Subject: Re: [PATCH 05/10] clk: oxnas: make it explicitly non-modular
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-07-04 23:12 GMT+02:00 Paul Gortmaker <paul.gortmaker@windriver.com>:
> The Kconfig currently controlling compilation of this code is:
>
> drivers/clk/Kconfig:config COMMON_CLK_OXNAS
> drivers/clk/Kconfig:    bool "Clock driver for the OXNAS SoC Family"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/clk/clk-oxnas.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
