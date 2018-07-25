Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajan Vaja <rajan.vaja@xilinx.com>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531833420-27175-1-git-send-email-rajan.vaja@xilinx.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rajan Vaja <rajan.vaja@xilinx.com>
References: <1531833420-27175-1-git-send-email-rajan.vaja@xilinx.com>
Message-ID: <153253678426.48062.18003542444197103522@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: clk-fixed-factor: Clear OF_POPULATED flag in case of failure
Date: Wed, 25 Jul 2018 09:39:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajan Vaja (2018-07-17 06:17:00)
> Fixed factor clock has two initializations at of_clk_init() time
> and during platform driver probe. Before of_clk_init() call,
> node is marked as populated and so its probe never gets called.
> =

> During of_clk_init() fixed factor clock registration may fail if
> any of its parent clock is not registered. In this case, it doesn't
> get chance to retry registration from probe. Clear OF_POPULATED
> flag if fixed factor clock registration fails so that clock
> registration is attempted again from probe.
> =

> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> ---

Applied to clk-next
