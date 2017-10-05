Return-Path: <horms@verge.net.au>
Date: Thu, 5 Oct 2017 11:10:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add git repository to Renesas clock driver
 section
Message-ID: <20171005091042.GG26369@verge.net.au>
References: <1507116864-17219-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1507116864-17219-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 04, 2017 at 01:34:24PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61d77c8037a1faf9..d23f4fba728d091a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11476,6 +11476,7 @@ F:	include/linux/rpmsg/
>  RENESAS CLOCK DRIVERS
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas
>  S:	Supported
>  F:	drivers/clk/renesas/
>  
> -- 
> 2.7.4
> 
