Return-Path: <horms@verge.net.au>
Date: Wed, 26 Apr 2017 09:09:28 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Do not build clk-div6 for R8A7792
Message-ID: <20170426070925.GA25517@verge.net.au>
References: <1493141161-28069-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1493141161-28069-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 25, 2017 at 07:26:01PM +0200, Geert Uytterhoeven wrote:
> R-Car V2H does not have "DIV6" programmable clocks, hence there is no
> need to build clk-div6.o.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued up in clk-renesas-for-v4.13.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
