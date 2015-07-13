Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55A3E0E4.3050104@opensource.altera.com>
Date: Mon, 13 Jul 2015 11:01:40 -0500
From: Dinh Nguyen <dinguyen@opensource.altera.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 24/45] clk: socfpga: Remove clk.h and clkdev.h includes
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org> <1436571223-10959-25-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-25-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/10/2015 06:33 PM, Stephen Boyd wrote:
> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver. The clkdev.h include isn't used either, remove
> it and add in slab.h to make sure things keep compiling.
> 
> Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/socfpga/clk-gate-a10.c   | 1 +
>  drivers/clk/socfpga/clk-gate.c       | 3 +--
>  drivers/clk/socfpga/clk-periph-a10.c | 1 +
>  drivers/clk/socfpga/clk-periph.c     | 3 +--
>  drivers/clk/socfpga/clk-pll-a10.c    | 1 +
>  drivers/clk/socfpga/clk-pll.c        | 3 +--
>  drivers/clk/socfpga/clk.h            | 1 -
>  7 files changed, 6 insertions(+), 7 deletions(-)
> 

Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Thanks,
Dinh

