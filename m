Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180704130103.31790-1-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180704130103.31790-1-geert+renesas@glider.be>
Message-ID: <153088993646.143105.11674939438681531758@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: Really show symbolic clock flags in debugfs
Date: Fri, 06 Jul 2018 08:12:16 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-07-04 06:01:03)
> The last-minute fold-in of the ENTRY() macro did change behavior:
> instead of printing the symbolic name (e.g. "CLK_IS_BASIC"), it prints
> the expansion of it (e.g. "(1UL << (5))").
> =

> Use "#" instead of  __stringify() to fix this.

Do we need the stringify.h include anymore then?
