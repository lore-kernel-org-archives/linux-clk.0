Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 10 Oct 2016 16:37:43 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, mark.rutland@arm.com,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	horms+renesas@verge.net.au
Subject: Re: [PATCH v2 2/2] clk: renesas: cpg-mssr: add R8A7743 support
Message-ID: <20161010213743.GA12919@rob-hp-laptop>
References: <9246696.7P1aOyyQt4@wasted.cogentembedded.com>
 <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 07, 2016 at 11:47:49PM +0300, Sergei Shtylyov wrote:
> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
> 
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - documented the R8A7743 device tree binding;
> - fixed whitespace errors/warnings reported by checkpatch.pl;
> - used  tabs instead of spaces for indentation;
> - fixed the PLL3 column name in the PLL table.
> 
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt |    4 

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/renesas/Kconfig                                  |    1 
>  drivers/clk/renesas/Makefile                                 |    1 
>  drivers/clk/renesas/r8a7743-cpg-mssr.c                       |  268 +++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c                       |    6 
>  drivers/clk/renesas/renesas-cpg-mssr.h                       |    1 
>  6 files changed, 280 insertions(+), 1 deletion(-)
