Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180726152524.9393-1-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180726152524.9393-1-geert+renesas@glider.be>
Message-ID: <153262126901.48062.3465085338628890690@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Rename rint to .r
Date: Thu, 26 Jul 2018 09:07:49 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-07-26 08:25:24)
> All other internal clock names have a period prepended.
> =

> Hence rename the internal RCLK from "rint" to ".r", and move it to the
> section where all other internal clocks are defined.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
