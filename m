Return-Path: <horms@verge.net.au>
Date: Thu, 1 Sep 2016 15:54:33 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add section for Renesas clock drivers
Message-ID: <20160901135432.GD14300@verge.net.au>
References: <1472636970-29817-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1472636970-29817-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 31, 2016 at 11:49:30AM +0200, Geert Uytterhoeven wrote:
> Add a section for Renesas clock drivers, as found on Renesas ARM SoCs,
> and list myself as the maintainer.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e220af2344e6233b..cabe74e526d4d305 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9963,6 +9963,12 @@ F:	drivers/rpmsg/
>  F:	Documentation/rpmsg.txt
>  F:	include/linux/rpmsg.h
>  
> +RENESAS CLOCK DRIVERS
> +M:	Geert Uytterhoeven <geert+renesas@glider.be>
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	drivers/clk/renesas/
> +
>  RENESAS ETHERNET DRIVERS
>  R:	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>  L:	netdev@vger.kernel.org
> -- 
> 1.9.1
> 
