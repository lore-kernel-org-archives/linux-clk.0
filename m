Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 31 Oct 2016 00:36:57 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	horms+renesas@verge.net.au
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A7745 support
Message-ID: <20161031053657.65t33edbvc7ow3ha@rob-hp-laptop>
References: <13079532.zQoaX56ouR@wasted.cogentembedded.com>
 <5012234.NZmvoVqhq0@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5012234.NZmvoVqhq0@wasted.cogentembedded.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Oct 27, 2016 at 11:43:31PM +0300, Sergei Shtylyov wrote:
> Add RZ/G1E (R8A7745) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
> 
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt |    5 

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/renesas/Kconfig                                  |    1 
>  drivers/clk/renesas/Makefile                                 |    1 
>  drivers/clk/renesas/r8a7745-cpg-mssr.c                       |  261 +++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c                       |    6 
>  drivers/clk/renesas/renesas-cpg-mssr.h                       |    1 
>  6 files changed, 273 insertions(+), 2 deletions(-)
