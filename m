Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180409105438.2402477-1-arnd@arndb.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Gaku Inami <gaku.inami.xw@bp.renesas.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20180409105438.2402477-1-arnd@arndb.de>
Message-ID: <152389486496.51482.1409018821443408273@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: cs2000: mark resume function as __maybe_unused
Date: Mon, 16 Apr 2018 09:07:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Arnd Bergmann (2018-04-09 03:54:34)
> When power management is disabled, we get a harmless warning:
> =

> drivers/clk/clk-cs2000-cp.c:544:12: error: 'cs2000_resume' defined but no=
t used [-Werror=3Dunused-function]
> =

> Marking the function as __maybe_unused lets the compiler silently
> drop it instead.
> =

> Fixes: eade4ccdb087 ("clk: cs2000: set pm_ops in hibernate-compatible way=
")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-fixes
