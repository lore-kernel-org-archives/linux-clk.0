Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20170202143417.3514875-1-arnd@arndb.de>
References: <20170202143417.3514875-1-arnd@arndb.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 6 Feb 2017 11:43:42 +0800
Message-ID: <CAGb2v66epL1kNwqAc-yyWzchZsMCbVNqoHAeYTZz1L3-hMhYwA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: select SUNXI_CCU_MULT for sun5i
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 2, 2017 at 10:33 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> We get a link error when CCU_MULT is not set with the
> newly added driver:
>
> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.17+0x4): undefined reference to `ccu_mult_ops'
> drivers/clk/sunxi-ng/ccu-sun5i.o:(.data.__compound_literal.5+0x4): undefined reference to `ccu_mult_ops'
>
> Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Chen-Yu Tsai <wens@csie.org>
