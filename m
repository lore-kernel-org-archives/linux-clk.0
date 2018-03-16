Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180220151531.3379003-1-arnd@arndb.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180220151531.3379003-1-arnd@arndb.de>
Message-ID: <152124105054.242365.69354305607503548@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: hisilicon: mark wdt_mux_p[] as const
Date: Fri, 16 Mar 2018 15:57:30 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Arnd Bergmann (2018-02-20 07:15:21)
> The symbol is in the __initconst section but not marked init, which
> caused a warning when building with LTO.
> =

> This makes it 'const' as was obviously intended.
> =

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
