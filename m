Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:33:07 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Fix inverted debug check
Message-ID: <20161102003307.GJ16026@codeaurora.org>
References: <1475586658-13322-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475586658-13322-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 10/04, Geert Uytterhoeven wrote:
> The intention was to enable the checks if debugging is enabled, not
> disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
