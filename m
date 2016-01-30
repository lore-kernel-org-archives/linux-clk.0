Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH] clk: axi-clkgen: Remove sometimes impossible check
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
References: <1454116408-28866-1-git-send-email-sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <56ACCFD9.3080300@metafoo.de>
Date: Sat, 30 Jan 2016 15:59:37 +0100
MIME-Version: 1.0
In-Reply-To: <1454116408-28866-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 01/30/2016 02:13 AM, Stephen Boyd wrote:
> The size of unsigned long on 64-bit architectures is equal to the
> size of u64, so this check is impossible there. This throws off
> static checkers:
> 
> drivers/clk/clk-axi-clkgen.c:331 axi_clkgen_recalc_rate() warn:
> impossible condition '(tmp > (~0)) => (0-u64max > u64max)'
> 
> Let's change this code to use min_t() instead so that we
> get the same effect on architectures where sizeof(unsigned long)
> doesn't equal sizeof(u64).
> 
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Thanks.

Acked-by: Lars-Peter Clausen <lars@metafoo.de>
