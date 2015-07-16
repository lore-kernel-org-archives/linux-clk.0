Return-Path: <t-kristo@ti.com>
Message-ID: <55A76E98.3050703@ti.com>
Date: Thu, 16 Jul 2015 11:43:04 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
        Mike Turquette
	<mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 0/4] TI clk driver cleanups
References: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/15/2015 11:08 PM, Stephen Boyd wrote:
> Some cleanups for the TI clk driver move.
>
> Stephen Boyd (4):
>    clk: ti: Check kzalloc() for failures
>    clk: ti: Mark ti_clk_features static
>    clk: ti: clk-3xxx: Remove unused structures
>    clk: ti: Force pointer to be __iomem
>
>   drivers/clk/ti/clk-3xxx.c | 10 ----------
>   drivers/clk/ti/clk.c      |  6 ++++--
>   2 files changed, 4 insertions(+), 12 deletions(-)
>

For the whole set:

Acked-by: Tero Kristo <t-kristo@ti.com>
