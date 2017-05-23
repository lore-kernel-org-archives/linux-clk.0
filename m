Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20170522202951.2896280-1-arnd@arndb.de>
References: <20170522202951.2896280-1-arnd@arndb.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 23 May 2017 15:31:13 +0800
Message-ID: <CAGb2v64-5d=G23NtZj2Kpx+kT9bxEfFEkfK9nRWh4Ab-8dX0-A@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: select SUNXI_CCU_MULT for sun8i-a83t
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Icenowy Zheng <icenowy@aosc.io>, Tobias Regnery <tobias.regnery@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 23, 2017 at 4:29 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> We get a link error when CCU_MULT is not set with the
> newly added driver:
>
> drivers/clk/sunxi-ng/ccu-sun8i-a83t.o:(.data.__compound_literal.1+0x4): undefined reference to `ccu_mult_ops'
> drivers/clk/sunxi-ng/ccu-sun8i-a83t.o:(.data.__compound_literal.3+0x4): undefined reference to `ccu_mult_ops'
>
> Fixes: 46b492116666 ("clk: sunxi-ng: Add driver for A83T CCU")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.

ChenYu
