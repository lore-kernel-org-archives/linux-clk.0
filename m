Return-Path: <horms@verge.net.au>
Date: Mon, 9 Apr 2018 14:55:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a77980: Correct parent clock of PCIEC0
Message-ID: <20180409125549.5iwnenyhzil66lyn@verge.net.au>
References: <1523276962-5465-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1523276962-5465-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 09, 2018 at 02:29:22PM +0200, Geert Uytterhoeven wrote:
> According to the R-Car Gen3 Hardware Manual Errata for Rev 0.80 of
> December 22, 2017, the parent clock of the PCIe module clock on R-Car
> V3H is S2D2.
> 
> Fixes: ce15783c510a9905 ("clk: renesas: cpg-mssr: add R8A77980 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
