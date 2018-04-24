Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1523365565-17124-1-git-send-email-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
References: <1523365565-17124-1-git-send-email-geert+renesas@glider.be>
Message-ID: <152458361660.46528.16887219181368039617@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: Remove clk_init_cb typedef
Date: Tue, 24 Apr 2018 08:26:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-04-10 06:06:05)
> Since commit c08ee14cc6634457 ("clk: ti: change clock init to use
> generic of_clk_init"), there is only a single (private) user left of the
> (public) clk_init_cb typedef.
> =

> Hence expand its single user in the core clock code, and remove the
> typedef.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Looks like Mike "Applied to clk-next".
