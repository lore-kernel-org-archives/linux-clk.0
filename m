Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 9 Jun 2017 09:22:43 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Paul Burton <paul.burton@imgtec.com>,
	Maarten ter Huurne <maarten@treewalker.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/15] serial: 8250_ingenic: Add support for the JZ4770
 SoC
Message-ID: <20170609142243.wbt6gngfl3pmdnzr@rob-hp-laptop>
References: <20170607200439.24450-1-paul@crapouillou.net>
 <20170607200439.24450-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170607200439.24450-6-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 07, 2017 at 10:04:29PM +0200, Paul Cercueil wrote:
> The JZ4770 SoC's UART is no different from the other JZ SoCs, so this
> commit simply adds the ingenic,jz4770-uart compatible string.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/serial/ingenic,uart.txt | 3 ++-
>  drivers/tty/serial/8250/8250_ingenic.c                    | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.txt b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
> index 02cb7fe59cb7..75fd8b314af9 100644
> --- a/Documentation/devicetree/bindings/serial/ingenic,uart.txt
> +++ b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
> @@ -2,7 +2,8 @@
>  
>  Required properties:
>  - compatible : "ingenic,jz4740-uart", "ingenic,jz4760-uart",
> -	"ingenic,jz4775-uart" or "ingenic,jz4780-uart"
> +	"ingenic,jz4770-uart", "ingenic,jz4775-uart" or
> +	"ingenic,jz4780-uart"

If you respin, please reformat to 1 per line.

Acked-by: Rob Herring <robh@kernel.org>
