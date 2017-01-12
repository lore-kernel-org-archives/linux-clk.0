Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V6 2/2] clk: vc5: Add support for IDT VersaClock 5P49V5923 and 5P49V5933
Date: Thu, 12 Jan 2017 03:35:24 +0200
Message-ID: <134945773.YyTahTmPIX@avalon>
In-Reply-To: <20170112010324.28068-2-marek.vasut@gmail.com>
References: <20170112010324.28068-1-marek.vasut@gmail.com> <20170112010324.28068-2-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

Thank you for the patch.

On Thursday 12 Jan 2017 02:03:24 Marek Vasut wrote:
> Add driver for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips. These
> chips have two clock inputs, XTAL or CLK, which are muxed into single
> PLL/VCO input. In case of 5P49V5923, the XTAL in built into the chip
> while the 5P49V5923 requires external XTAL.
> 
> The PLL feeds two fractional dividers. Each fractional divider feeds
> output mux, which allows selecting between clock from the fractional
> divider itself or from output mux on output N-1. In case of output
> mux 0, the output N-1 is instead connected to the output from the mux
> feeding the PLL.
> 
> The driver thus far supports only the 5P49V5923 and 5P49V5933, while
> it should be easily extensible to the whole 5P49V59xx family of chips
> as they are all pretty similar.
> 
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> V2: - Drop address-cells and size-cells from the binding
>     - Add clock-names to the binding
>     - Drop vc5_input_names
>     - Fix assortment of spelling mistakes
>     - Switch div_frc and div_int datatype to uXX
>     - Switch f_in to u32
>     - Add missing remove
>     - Define macros for handling XIN and CLKIN
>     - Rework the FOD fractional divider calculation, this was wrong
>       and made the output clock be off considerably under certain
>       circumstances (when the fractional part was large).
> V3: - Rework the MUX frequency recalculation and divider configration
>       so that it fits into the clock framework
>     - Add support for 5P49V5933 chip to lay groundwork for adding more
>       chips easily.
>     - Export the OUT0_SEL_I2CB output into the clock framework, so it
>       can be accessed from DT as well. WARNING: This does change the
>       bindings, clock0 is now the OUT0_SEL_I2CB, clock1 is OUT1 and
>       clock2 is OUT2 (or OUT4 on the 5P49V5933).
>     - Drop unnecessary caching of pin_*_name clock name and clk_hw
> structures in driver data.
>     - Add missing MAINTAINERS entry
> V4: - Support also 5P49V5923A by dropping the B from the bindings and
>       code. According to the update notice, the chips are identical
>       except for disabling the VCO monitoring, which is internal
>       factory-defined bit and has no impact on silicon performance.
> V5: - Make the CCF handle upstream clock enabling and disabling
>     - Drop test for unsigned value reg being less than zero
>     - Streamline vc5_map_index_to_output
> V6: - Drop the error message from vc5_of_clk_get(), this will be
>       reported by the core
> ---
>  MAINTAINERS                   |   5 +
>  drivers/clk/Kconfig           |  10 +
>  drivers/clk/Makefile          |   1 +
>  drivers/clk/clk-versaclock5.c | 793 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 809 insertions(+)
>  create mode 100644 drivers/clk/clk-versaclock5.c

-- 
Regards,

Laurent Pinchart
