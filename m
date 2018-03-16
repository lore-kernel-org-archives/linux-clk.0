Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Fabio Estevam <fabio.estevam@nxp.com>, sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1516107034-6600-1-git-send-email-fabio.estevam@nxp.com>
Cc: mturquette@baylibre.com, geert@linux-m68k.org, festevam@gmail.com,
 linux-clk@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
References: <1516107034-6600-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <152124298994.242365.15138927083324261955@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] clk: Print the clock name and warning cause
Date: Fri, 16 Mar 2018 16:29:49 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Fabio Estevam (2018-01-16 04:50:34)
> When getting the clock related warnings, it is useful to know what
> is the clock name that is causing the problem and the cause of the
> problem.
> =

> Add the clock name and the the warning cause to the log, so that the
> output becomes clearer like this:
> =

> [    2.383969] ------------[ cut here ]------------
> [    2.388720] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:814 clk_core_d=
isable+0xd4/0xf8
> [    2.396658] uart4_ipg_gate already disabled
> =

> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-next
