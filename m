Return-Path: <sboyd@codeaurora.org>
Date: Tue, 15 Mar 2016 18:13:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: renesas: div6: use RENESAS for #define
Message-ID: <20160316011307.GN25972@codeaurora.org>
References: <1457398135-12320-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1457398135-12320-1-git-send-email-horms+renesas@verge.net.au>
List-ID: <linux-clk.vger.kernel.org>

On 03/08, Simon Horman wrote:
> Name the #define guarding compilation of this header
> __RENESAS_CLK_DIV6_H__ rather than __SHMOBILE_CLK_DIV6_H__.
> 
> This is a follow-up to renaming the directory in which this file lives from
> shmobile to renesas which is in turn part of an ongoing process to migrate
> from ARCH_SHMOBILE to ARCH_RENESAS the motivation for which being that
> RENESAS seems to be a more appropriate name than SHMOBILE for the majority
> of Renesas ARM based SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
