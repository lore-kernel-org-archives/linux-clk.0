Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Subject: Re: [PATCH v3] clk: tango4: clkgen driver for Tango4 ARM platforms
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: clk <linux-clk@vger.kernel.org>, Mason <slash.tmp@free.fr>
References: <562A5506.2070402@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <56308F41.6030403@sigmadesigns.com>
Date: Wed, 28 Oct 2015 10:02:57 +0100
MIME-Version: 1.0
In-Reply-To: <562A5506.2070402@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-15"
List-ID: <linux-clk.vger.kernel.org>

Hello Michael & Stephen,

On 23/10/2015 17:40, Marc Gonzalez wrote:

> Add support for Sigma Designs Tango4 (ARM-based) clock generator.
> NOTE: This driver is incompatible with Tango3 clkgen.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
> Changes in v3:
> Provide binding documentation
> Don't unconditionally use hard-coded divider for sysclk
> 
> Changes in v2:
> Provide missing includes
> Use masks instead of bit-fields
> Error handling
> Style nits
> Model the clkgen block as a single node
> ---
>  .../devicetree/bindings/clock/tango4-clock.txt     | 27 ++++++++++
>  drivers/clk/Makefile                               |  1 +
>  drivers/clk/clk-tango4.c                           | 57 ++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/tango4-clock.txt
>  create mode 100644 drivers/clk/clk-tango4.c

Are there any remaining issues that have not been addressed?
(A cosmetic change: should I remove the double-spacing in the
"Required Properties" list of the binding document?)

I would need to send a v4, with a minor tweak of the commit message,
as I found out that there has existed one non-ARM Tango4 SoC.
(But it's not clear whether it ever went further than eval boards.)
I would bundle that change along with any additional required fixes.

How close/far is this driver from being accepted?

Regards.
