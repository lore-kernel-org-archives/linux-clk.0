Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E0136CE0D;
	Tue, 17 Feb 2026 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343852; cv=none; b=DE44x4zQq4omH7/3ZTS48yBGivFe2X55Wbqozgf5TVz0TlgPSPpsyQyADesUmCPWRGE4g4b2mUoenauV/ZNMX/i4JzEZfHPyuHiMavXpy7Di+6fUzCh2hgP/Q7TiAu6+CiZVkoA4AGtx9fQyvWk1U0Od4lU4nhMNDLkmiCmqT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343852; c=relaxed/simple;
	bh=9z0AWffWMfgG7AeCAqSdrYQ/bbUdPDRt9Ft3f449EbY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9pt/WL3YYCoDquc6RUf4wdgW7RXcei/HWwCwHSZEw7WUk6zFtO+3DUYOHnJWbW37AC78iFanjuK8kO+sKCNJntwwYppNUojtBLRBBjD/BpoT8pvleIFScuZY1cdjpTMYFWj89hR0emKZMTaMuVBFyy1HiRYMQWRnf6V55ySwy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 573231477;
	Tue, 17 Feb 2026 07:57:23 -0800 (PST)
Received: from orionap.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E55553F632;
	Tue, 17 Feb 2026 07:57:27 -0800 (PST)
Date: Tue, 17 Feb 2026 15:57:17 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland
 <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module
 clock
Message-ID: <20260217155717.0b99c310@orionap.fritz.box>
In-Reply-To: <20260217093004.3239051-1-wens@kernel.org>
References: <20260217093004.3239051-1-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Feb 2026 17:30:03 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> When the PRCM clk driver was added, somehow the r-spi module clock
> was skipped over.
> 
> Add it so that r-spi can actually work.

The patch itself looks fine, compared against the manual, so for that:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

But I noticed one thing below....

> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> index 0339c4af0fe5..db0e36d8838e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -83,9 +83,22 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "r-pwmctrl",
>  static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
>  			 &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
>  
> -/* SPI clock is /M/N (same as new MMC?) */

Ooops, looks like I saw that clock, but someone managed to dodge it :-(
Sorry about that.

> +static const struct clk_parent_data r_spi_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .fw_name = "pll-periph" },
> +	{ .name = "pll-periph0-300M" },
> +	{ .name = "pll-periph1-300M" },
> +	{ .name = "pll-audio" },

Looking a bit closer, all the PRCM PLL-AUDIO clocks in the manual refer to
AUDIO1PLL4X, which is provided by the MCU CCU, not AUDIO0PLL4X provided by
the main CCU. So we would need to change the DT? I wonder if that breaks
boots with kernels which didn't know the MCU CCU yet (v6.15-v6.17)?

Cheers,
Andre.

> +};
> +static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
> +				  0, 5,		/* M */
> +				  8, 5,		/* P */
> +				  24, 3,	/* mux */
> +				  BIT(31),	/* gate */
> +				  0);
>  static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
>  			 &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
> +
>  static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
>  			 &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
>  static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
> @@ -138,6 +151,7 @@ static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
>  	&bus_r_twd_clk.common,
>  	&r_pwmctrl_clk.common,
>  	&bus_r_pwmctrl_clk.common,
> +	&r_spi_clk.common,
>  	&bus_r_spi_clk.common,
>  	&bus_r_spinlock_clk.common,
>  	&bus_r_msgbox_clk.common,
> @@ -169,6 +183,7 @@ static struct clk_hw_onecell_data sun55i_a523_r_hw_clks = {
>  		[CLK_BUS_R_TWD]		= &bus_r_twd_clk.common.hw,
>  		[CLK_R_PWMCTRL]		= &r_pwmctrl_clk.common.hw,
>  		[CLK_BUS_R_PWMCTRL]	= &bus_r_pwmctrl_clk.common.hw,
> +		[CLK_R_SPI]		= &r_spi_clk.common.hw,
>  		[CLK_BUS_R_SPI]		= &bus_r_spi_clk.common.hw,
>  		[CLK_BUS_R_SPINLOCK]	= &bus_r_spinlock_clk.common.hw,
>  		[CLK_BUS_R_MSGBOX]	= &bus_r_msgbox_clk.common.hw,

