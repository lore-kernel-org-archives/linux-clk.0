Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular2.263xmail.com ([211.157.152.3]:60788 "EHLO
	regular2.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbbLLDfu (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 11 Dec 2015 22:35:50 -0500
Received: from regular1.263xmail.com (unknown [192.168.165.182])
	by regular2.263xmail.com (Postfix) with ESMTP id 231B61E2BD
	for <linux-clk@vger.kernel.org>; Sat, 12 Dec 2015 11:35:43 +0800 (CST)
Subject: Re: [PATCH 3/3] clk: rockchip: include downstream muxes into
 fractional dividers
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
References: <1929669.AsgMSusdJb@phil> <4275248.XCb031JeuI@phil>
Cc: linux-rockchip@lists.infradead.org, sjoerd.simons@collabora.co.uk,
	sboyd@codeaurora.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
From: Caesar Wang <wxt@rock-chips.com>
Message-ID: <566B95FF.6090802@rock-chips.com>
Date: Sat, 12 Dec 2015 11:35:27 +0800
MIME-Version: 1.0
In-Reply-To: <4275248.XCb031JeuI@phil>
Content-Type: multipart/mixed;
 boundary="------------060203020009090504070404"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is a multi-part message in MIME format.
--------------060203020009090504070404
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Heiko,

There are any chance to add the RK3036 SoCs for muxes into fractional 
dividers?
As the attachment for my test patchs. (fetch from 
https://github.com/rockchip-linux/kernel -b develop-v4.1)

I have fetch this series pacthes for my Kylin board.

Anyway, I will send the patch for RK3036 if this patch has merged into 
mainline.

在 2015年08月22日 01:48, Heiko Stuebner 写道:
> Use the newly introduced possibility to combine the fractional dividers
> with their downstream muxes for all fractional dividers on currently
> supported Rockchip SoCs.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/clk/rockchip/clk-rk3188.c | 80 +++++++++++++++++++--------------------
>   drivers/clk/rockchip/clk-rk3288.c | 66 ++++++++++++++++----------------
>   2 files changed, 74 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
> index ed02bbc..faa6695 100644
> --- a/drivers/clk/rockchip/clk-rk3188.c
> +++ b/drivers/clk/rockchip/clk-rk3188.c
> @@ -335,11 +335,11 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
>   	COMPOSITE(0, "hsadc_src", mux_pll_src_gpll_cpll_p, 0,
>   			RK2928_CLKSEL_CON(22), 0, 1, MFLAGS, 8, 8, DFLAGS,
>   			RK2928_CLKGATE_CON(2), 6, GFLAGS),
> -	COMPOSITE_FRAC(0, "hsadc_frac", "hsadc_src", 0,
> +	COMPOSITE_FRACMUX(0, "hsadc_frac", "hsadc_src", 0,
>   			RK2928_CLKSEL_CON(23), 0,
> -			RK2928_CLKGATE_CON(2), 7, GFLAGS),
> -	MUX(0, "sclk_hsadc_out", mux_sclk_hsadc_p, 0,
> -			RK2928_CLKSEL_CON(22), 4, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(2), 7, GFLAGS,
> +		MUX(0, "sclk_hsadc_out", mux_sclk_hsadc_p, 0,
> +				RK2928_CLKSEL_CON(22), 4, 2, MFLAGS)),
>   	INVERTER(SCLK_HSADC, "sclk_hsadc", "sclk_hsadc_out",
>   			RK2928_CLKSEL_CON(22), 7, IFLAGS),
>   
> @@ -350,11 +350,11 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
>   	COMPOSITE_NOMUX(0, "spdif_pre", "i2s_src", 0,
>   			RK2928_CLKSEL_CON(5), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(0), 13, GFLAGS),
> -	COMPOSITE_FRAC(0, "spdif_frac", "spdif_pre", CLK_SET_RATE_PARENT,
> +	COMPOSITE_FRACMUX(0, "spdif_frac", "spdif_pll", CLK_SET_RATE_PARENT,
>   			RK2928_CLKSEL_CON(9), 0,
> -			RK2928_CLKGATE_CON(0), 14, GFLAGS),
> -	MUX(SCLK_SPDIF, "sclk_spdif", mux_sclk_spdif_p, CLK_SET_RATE_PARENT,
> -			RK2928_CLKSEL_CON(5), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(0), 14, GFLAGS,
> +		MUX(SCLK_SPDIF, "sclk_spdif", mux_sclk_spdif_p, CLK_SET_RATE_PARENT,
> +				RK2928_CLKSEL_CON(5), 8, 2, MFLAGS)),
>   
>   	/*
>   	 * Clock-Architecture Diagram 4
> @@ -385,35 +385,35 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
>   	COMPOSITE_NOMUX(0, "uart0_pre", "uart_src", 0,
>   			RK2928_CLKSEL_CON(13), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(1), 8, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart0_frac", "uart0_pre", 0,
> +	COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_pre", 0,
>   			RK2928_CLKSEL_CON(17), 0,
> -			RK2928_CLKGATE_CON(1), 9, GFLAGS),
> -	MUX(SCLK_UART0, "sclk_uart0", mux_sclk_uart0_p, 0,
> -			RK2928_CLKSEL_CON(13), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(1), 9, GFLAGS,
> +		MUX(SCLK_UART0, "sclk_uart0", mux_sclk_uart0_p, 0,
> +				RK2928_CLKSEL_CON(13), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "uart1_pre", "uart_src", 0,
>   			RK2928_CLKSEL_CON(14), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(1), 10, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart1_frac", "uart1_pre", 0,
> +	COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_pre", 0,
>   			RK2928_CLKSEL_CON(18), 0,
> -			RK2928_CLKGATE_CON(1), 11, GFLAGS),
> -	MUX(SCLK_UART1, "sclk_uart1", mux_sclk_uart1_p, 0,
> -			RK2928_CLKSEL_CON(14), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(1), 11, GFLAGS,
> +		MUX(SCLK_UART1, "sclk_uart1", mux_sclk_uart1_p, 0,
> +				RK2928_CLKSEL_CON(14), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "uart2_pre", "uart_src", 0,
>   			RK2928_CLKSEL_CON(15), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(1), 12, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart2_frac", "uart2_pre", 0,
> +	COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_pre", 0,
>   			RK2928_CLKSEL_CON(19), 0,
> -			RK2928_CLKGATE_CON(1), 13, GFLAGS),
> -	MUX(SCLK_UART2, "sclk_uart2", mux_sclk_uart2_p, 0,
> -			RK2928_CLKSEL_CON(15), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(1), 13, GFLAGS,
> +		MUX(SCLK_UART2, "sclk_uart2", mux_sclk_uart2_p, 0,
> +				RK2928_CLKSEL_CON(15), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "uart3_pre", "uart_src", 0,
>   			RK2928_CLKSEL_CON(16), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(1), 14, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart3_frac", "uart3_pre", 0,
> +	COMPOSITE_FRACMUX(0, "uart3_frac", "uart3_pre", 0,
>   			RK2928_CLKSEL_CON(20), 0,
> -			RK2928_CLKGATE_CON(1), 15, GFLAGS),
> -	MUX(SCLK_UART3, "sclk_uart3", mux_sclk_uart3_p, 0,
> -			RK2928_CLKSEL_CON(16), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(1), 15, GFLAGS,
> +		MUX(SCLK_UART3, "sclk_uart3", mux_sclk_uart3_p, 0,
> +				RK2928_CLKSEL_CON(16), 8, 2, MFLAGS)),
>   
>   	GATE(SCLK_JTAG, "jtag", "ext_jtag", 0, RK2928_CLKGATE_CON(1), 3, GFLAGS),
>   
> @@ -584,27 +584,27 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
>   	COMPOSITE_NOMUX(0, "i2s0_pre", "i2s_src", 0,
>   			RK2928_CLKSEL_CON(2), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(0), 7, GFLAGS),
> -	COMPOSITE_FRAC(0, "i2s0_frac", "i2s0_pre", 0,
> +	COMPOSITE_FRACMUX(0, "i2s0_frac", "i2s0_pre", 0,
>   			RK2928_CLKSEL_CON(6), 0,
> -			RK2928_CLKGATE_CON(0), 8, GFLAGS),
> -	MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> -			RK2928_CLKSEL_CON(2), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(0), 8, GFLAGS,
> +		MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> +				RK2928_CLKSEL_CON(2), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "i2s1_pre", "i2s_src", 0,
>   			RK2928_CLKSEL_CON(3), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(0), 9, GFLAGS),
> -	COMPOSITE_FRAC(0, "i2s1_frac", "i2s1_pre", 0,
> +	COMPOSITE_FRACMUX(0, "i2s1_frac", "i2s1_pre", 0,
>   			RK2928_CLKSEL_CON(7), 0,
> -			RK2928_CLKGATE_CON(0), 10, GFLAGS),
> -	MUX(SCLK_I2S1, "sclk_i2s1", mux_sclk_i2s1_p, 0,
> -			RK2928_CLKSEL_CON(3), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(0), 10, GFLAGS,
> +		MUX(SCLK_I2S1, "sclk_i2s1", mux_sclk_i2s1_p, 0,
> +				RK2928_CLKSEL_CON(3), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "i2s2_pre", "i2s_src", 0,
>   			RK2928_CLKSEL_CON(4), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(0), 11, GFLAGS),
> -	COMPOSITE_FRAC(0, "i2s2_frac", "i2s2_pre", 0,
> +	COMPOSITE_FRACMUX(0, "i2s2_frac", "i2s2_pre", 0,
>   			RK2928_CLKSEL_CON(8), 0,
> -			RK2928_CLKGATE_CON(0), 12, GFLAGS),
> -	MUX(SCLK_I2S2, "sclk_i2s2", mux_sclk_i2s2_p, 0,
> -			RK2928_CLKSEL_CON(4), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(0), 12, GFLAGS,
> +		MUX(SCLK_I2S2, "sclk_i2s2", mux_sclk_i2s2_p, 0,
> +				RK2928_CLKSEL_CON(4), 8, 2, MFLAGS)),
>   
>   	GATE(HCLK_I2S1, "hclk_i2s1", "hclk_cpu", 0, RK2928_CLKGATE_CON(7), 3, GFLAGS),
>   	GATE(HCLK_I2S2, "hclk_i2s2", "hclk_cpu", 0, RK2928_CLKGATE_CON(7), 4, GFLAGS),
> @@ -691,11 +691,11 @@ static struct rockchip_clk_branch rk3188_clk_branches[] __initdata = {
>   	COMPOSITE_NOMUX(0, "i2s0_pre", "i2s_src", 0,
>   			RK2928_CLKSEL_CON(3), 0, 7, DFLAGS,
>   			RK2928_CLKGATE_CON(0), 9, GFLAGS),
> -	COMPOSITE_FRAC(0, "i2s0_frac", "i2s0_pre", 0,
> +	COMPOSITE_FRACMUX(0, "i2s0_frac", "i2s0_pre", 0,
>   			RK2928_CLKSEL_CON(7), 0,
> -			RK2928_CLKGATE_CON(0), 10, GFLAGS),
> -	MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> -			RK2928_CLKSEL_CON(3), 8, 2, MFLAGS),
> +			RK2928_CLKGATE_CON(0), 10, GFLAGS,
> +		MUX(SCLK_I2S0, "sclk_i2s0", mux_sclk_i2s0_p, 0,
> +				RK2928_CLKSEL_CON(3), 8, 2, MFLAGS)),
>   
>   	GATE(0, "hclk_imem0", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 14, GFLAGS),
>   	GATE(0, "hclk_imem1", "hclk_cpu", 0, RK2928_CLKGATE_CON(4), 15, GFLAGS),
> diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
> index 0df5bae..18fcdb1 100644
> --- a/drivers/clk/rockchip/clk-rk3288.c
> +++ b/drivers/clk/rockchip/clk-rk3288.c
> @@ -304,11 +304,11 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
>   	COMPOSITE(0, "i2s_src", mux_pll_src_cpll_gpll_p, 0,
>   			RK3288_CLKSEL_CON(4), 15, 1, MFLAGS, 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(4), 1, GFLAGS),
> -	COMPOSITE_FRAC(0, "i2s_frac", "i2s_src", CLK_SET_RATE_PARENT,
> +	COMPOSITE_FRACMUX(0, "i2s_frac", "i2s_src", CLK_SET_RATE_PARENT,
>   			RK3288_CLKSEL_CON(8), 0,
> -			RK3288_CLKGATE_CON(4), 2, GFLAGS),
> -	MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
> -			RK3288_CLKSEL_CON(4), 8, 2, MFLAGS),
> +			RK3288_CLKGATE_CON(4), 2, GFLAGS,
> +		MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
> +				RK3288_CLKSEL_CON(4), 8, 2, MFLAGS)),
>   	COMPOSITE_NODIV(SCLK_I2S0_OUT, "i2s0_clkout", mux_i2s_clkout_p, 0,
>   			RK3288_CLKSEL_CON(4), 12, 1, MFLAGS,
>   			RK3288_CLKGATE_CON(4), 0, GFLAGS),
> @@ -320,20 +320,22 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
>   	COMPOSITE_NOMUX(0, "spdif_pre", "spdif_src", 0,
>   			RK3288_CLKSEL_CON(5), 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(4), 4, GFLAGS),
> -	COMPOSITE_FRAC(0, "spdif_frac", "spdif_src", 0,
> +	COMPOSITE_FRACMUX(0, "spdif_frac", "spdif_src", 0,
>   			RK3288_CLKSEL_CON(9), 0,
> -			RK3288_CLKGATE_CON(4), 5, GFLAGS),
> -	COMPOSITE_NODIV(SCLK_SPDIF, "sclk_spdif", mux_spdif_p, 0,
> -			RK3288_CLKSEL_CON(5), 8, 2, MFLAGS,
> +			RK3288_CLKGATE_CON(4), 5, GFLAGS,
> +		MUX(0, "spdif_mux", mux_spdif_p, 0,
> +				RK3288_CLKSEL_CON(5), 8, 2, MFLAGS)),
> +	GATE(SCLK_SPDIF, "sclk_spdif", "spdif_mux", 0,
>   			RK3288_CLKGATE_CON(4), 6, GFLAGS),
>   	COMPOSITE_NOMUX(0, "spdif_8ch_pre", "spdif_src", 0,
>   			RK3288_CLKSEL_CON(40), 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(4), 7, GFLAGS),
> -	COMPOSITE_FRAC(0, "spdif_8ch_frac", "spdif_8ch_pre", 0,
> +	COMPOSITE_FRACMUX(0, "spdif_8ch_frac", "spdif_8ch_pre", 0,
>   			RK3288_CLKSEL_CON(41), 0,
> -			RK3288_CLKGATE_CON(4), 8, GFLAGS),
> -	COMPOSITE_NODIV(SCLK_SPDIF8CH, "sclk_spdif_8ch", mux_spdif_8ch_p, 0,
> -			RK3288_CLKSEL_CON(40), 8, 2, MFLAGS,
> +			RK3288_CLKGATE_CON(4), 8, GFLAGS,
> +		MUX(0, "spdif_8ch_mux", mux_spdif_8ch_p, 0,
> +				RK3288_CLKSEL_CON(40), 8, 2, MFLAGS)),
> +	GATE(SCLK_SPDIF8CH, "sclk_spdif_8ch", "spdif_8ch_mux", 0,
>   			RK3288_CLKGATE_CON(4), 9, GFLAGS),
>   
>   	GATE(0, "sclk_acc_efuse", "xin24m", 0,
> @@ -536,45 +538,45 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
>   	COMPOSITE(0, "uart0_src", mux_pll_src_cpll_gll_usb_npll_p, 0,
>   			RK3288_CLKSEL_CON(13), 13, 2, MFLAGS, 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(1), 8, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart0_frac", "uart0_src", CLK_SET_RATE_PARENT,
> +	COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_src", CLK_SET_RATE_PARENT,
>   			RK3288_CLKSEL_CON(17), 0,
> -			RK3288_CLKGATE_CON(1), 9, GFLAGS),
> -	MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
> -			RK3288_CLKSEL_CON(13), 8, 2, MFLAGS),
> +			RK3288_CLKGATE_CON(1), 9, GFLAGS,
> +		MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
> +				RK3288_CLKSEL_CON(13), 8, 2, MFLAGS)),
>   	MUX(0, "uart_src", mux_pll_src_cpll_gpll_p, 0,
>   			RK3288_CLKSEL_CON(13), 15, 1, MFLAGS),
>   	COMPOSITE_NOMUX(0, "uart1_src", "uart_src", 0,
>   			RK3288_CLKSEL_CON(14), 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(1), 10, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart1_frac", "uart1_src", CLK_SET_RATE_PARENT,
> +	COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_src", CLK_SET_RATE_PARENT,
>   			RK3288_CLKSEL_CON(18), 0,
> -			RK3288_CLKGATE_CON(1), 11, GFLAGS),
> -	MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
> -			RK3288_CLKSEL_CON(14), 8, 2, MFLAGS),
> +			RK3288_CLKGATE_CON(1), 11, GFLAGS,
> +		MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
> +				RK3288_CLKSEL_CON(14), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "uart2_src", "uart_src", 0,
>   			RK3288_CLKSEL_CON(15), 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(1), 12, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart2_frac", "uart2_src", CLK_SET_RATE_PARENT,
> +	COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_src", CLK_SET_RATE_PARENT,
>   			RK3288_CLKSEL_CON(19), 0,
> -			RK3288_CLKGATE_CON(1), 13, GFLAGS),
> -	MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
> -			RK3288_CLKSEL_CON(15), 8, 2, MFLAGS),
> +			RK3288_CLKGATE_CON(1), 13, GFLAGS,
> +		MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
> +				RK3288_CLKSEL_CON(15), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "uart3_src", "uart_src", 0,
>   			RK3288_CLKSEL_CON(16), 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(1), 14, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart3_frac", "uart3_src", CLK_SET_RATE_PARENT,
> +	COMPOSITE_FRACMUX(0, "uart3_frac", "uart3_src", CLK_SET_RATE_PARENT,
>   			RK3288_CLKSEL_CON(20), 0,
> -			RK3288_CLKGATE_CON(1), 15, GFLAGS),
> -	MUX(SCLK_UART3, "sclk_uart3", mux_uart3_p, CLK_SET_RATE_PARENT,
> -			RK3288_CLKSEL_CON(16), 8, 2, MFLAGS),
> +			RK3288_CLKGATE_CON(1), 15, GFLAGS,
> +		MUX(SCLK_UART3, "sclk_uart3", mux_uart3_p, CLK_SET_RATE_PARENT,
> +				RK3288_CLKSEL_CON(16), 8, 2, MFLAGS)),
>   	COMPOSITE_NOMUX(0, "uart4_src", "uart_src", 0,
>   			RK3288_CLKSEL_CON(3), 0, 7, DFLAGS,
>   			RK3288_CLKGATE_CON(2), 12, GFLAGS),
> -	COMPOSITE_FRAC(0, "uart4_frac", "uart4_src", CLK_SET_RATE_PARENT,
> +	COMPOSITE_FRACMUX(0, "uart4_frac", "uart4_src", CLK_SET_RATE_PARENT,
>   			RK3288_CLKSEL_CON(7), 0,
> -			RK3288_CLKGATE_CON(2), 13, GFLAGS),
> -	MUX(SCLK_UART4, "sclk_uart4", mux_uart4_p, CLK_SET_RATE_PARENT,
> -			RK3288_CLKSEL_CON(3), 8, 2, MFLAGS),
> +			RK3288_CLKGATE_CON(2), 13, GFLAGS,
> +		MUX(SCLK_UART4, "sclk_uart4", mux_uart4_p, CLK_SET_RATE_PARENT,
> +				RK3288_CLKSEL_CON(3), 8, 2, MFLAGS)),
>   
>   	COMPOSITE(0, "mac_pll_src", mux_pll_src_npll_cpll_gpll_p, 0,
>   			RK3288_CLKSEL_CON(21), 0, 2, MFLAGS, 8, 5, DFLAGS,


-- 
caesar wang | software engineer | wxt@rock-chip.com


--------------060203020009090504070404
Content-Type: text/x-patch;
 name="0001-clk-rockchip-include-downstream-muxes-into-fractiona.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-clk-rockchip-include-downstream-muxes-into-fractiona.pa";
 filename*1="tch"

>From 390af4a7e1d35fd44b73124a397da90b6cdeb021 Mon Sep 17 00:00:00 2001
From: Caesar Wang <wxt@rock-chips.com>
Date: Sat, 12 Dec 2015 11:24:20 +0800
Subject: [PATCH] clk: rockchip: include downstream muxes into fractional
 dividers

Use the newly introduced possibility to combine the fractional dividers
with their downstream muxes for all fractional dividers on currently
supported RK3036 SoCs.

Change-Id: I03ad115ddb007dc7d15acd5647d2bd1a81d6f884
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3036.c | 60 ++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 77a9d75..5fb7171 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -154,6 +154,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	 * Clock-Architecture Diagram 1
 	 */
 
+	/* PD_CORE */
 	GATE(0, "gpll_armclk", "gpll", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(0), 6, GFLAGS),
 
@@ -161,6 +162,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	 * Clock-Architecture Diagram 2
 	 */
 
+	/* PD_DDR */
 	GATE(0, "dpll_ddr", "dpll", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(0), 2, GFLAGS),
 	GATE(0, "gpll_ddr", "gpll", CLK_IGNORE_UNUSED,
@@ -168,6 +170,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	COMPOSITE_NOGATE(0, "ddrphy2x", mux_ddrphy_p, CLK_IGNORE_UNUSED,
 			RK2928_CLKSEL_CON(26), 8, 1, MFLAGS, 0, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO),
 
+	/* PD_CORE */
 	COMPOSITE_NOMUX(0, "pclk_dbg", "armclk", CLK_IGNORE_UNUSED,
 			RK2928_CLKSEL_CON(1), 0, 4, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK2928_CLKGATE_CON(0), 7, GFLAGS),
@@ -175,6 +178,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(1), 4, 3, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK2928_CLKGATE_CON(0), 7, GFLAGS),
 
+	/* PD_CPU (BUS) */
 	GATE(0, "dpll_cpu", "dpll", 0, RK2928_CLKGATE_CON(10), 8, GFLAGS),
 	GATE(0, "gpll_cpu", "gpll", 0, RK2928_CLKGATE_CON(0), 1, GFLAGS),
 	COMPOSITE_NOGATE(0, "aclk_cpu_src", mux_busclk_p, 0,
@@ -188,21 +192,25 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(1), 8, 2, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK2928_CLKGATE_CON(0), 4, GFLAGS),
 
+	/* PD_PERI */
 	COMPOSITE(0, "aclk_peri_src", mux_pll_src_3plls_p, 0,
 			RK2928_CLKSEL_CON(10), 14, 2, MFLAGS, 0, 5, DFLAGS,
 			RK2928_CLKGATE_CON(2), 0, GFLAGS),
 
 	GATE(ACLK_PERI, "aclk_peri", "aclk_peri_src", 0,
 			RK2928_CLKGATE_CON(2), 1, GFLAGS),
+	/* pclk_peri_src is soure for timers */
 	DIV(0, "pclk_peri_src", "aclk_peri_src", CLK_IGNORE_UNUSED,
 			RK2928_CLKSEL_CON(10), 12, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO),
 	GATE(PCLK_PERI, "pclk_peri", "pclk_peri_src", 0,
 			RK2928_CLKGATE_CON(2), 3, GFLAGS),
+	/* hclk_peri_src is soure for sclk_macref_out */
 	DIV(0, "hclk_peri_src", "aclk_peri_src", CLK_IGNORE_UNUSED,
 			RK2928_CLKSEL_CON(10), 8, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO),
 	GATE(HCLK_PERI, "hclk_peri", "hclk_peri_src", 0,
 			RK2928_CLKGATE_CON(2), 2, GFLAGS),
 
+	/* PD_TIMER */
 	COMPOSITE_NODIV(SCLK_TIMER0, "sclk_timer0", mux_timer_p, CLK_IGNORE_UNUSED,
 			RK2928_CLKSEL_CON(2), 4, 1, DFLAGS,
 			RK2928_CLKGATE_CON(1), 0, GFLAGS),
@@ -216,6 +224,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(2), 7, 1, DFLAGS,
 			RK2928_CLKGATE_CON(2), 5, GFLAGS),
 
+	/* PD_UART */
 	MUX(0, "uart_pll_clk", mux_pll_src_apll_dpll_gpll_usb480m_p, 0,
 			RK2928_CLKSEL_CON(13), 10, 2, MFLAGS),
 	COMPOSITE_NOMUX(0, "uart0_src", "uart_pll_clk", 0,
@@ -227,22 +236,23 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "uart2_src", "uart_pll_clk", 0,
 			RK2928_CLKSEL_CON(13), 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(1), 8, GFLAGS),
-	COMPOSITE_FRAC(0, "uart0_frac", "uart0_src", CLK_SET_RATE_PARENT,
+	COMPOSITE_FRACMUX(0, "uart0_frac", "uart0_src", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(17), 0,
-			RK2928_CLKGATE_CON(1), 9, GFLAGS),
-	COMPOSITE_FRAC(0, "uart1_frac", "uart1_src", CLK_SET_RATE_PARENT,
+			RK2928_CLKGATE_CON(1), 9, GFLAGS,
+		MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
+				RK2928_CLKSEL_CON(13), 8, 2, MFLAGS)),
+	COMPOSITE_FRACMUX(0, "uart1_frac", "uart1_src", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(18), 0,
-			RK2928_CLKGATE_CON(1), 11, GFLAGS),
-	COMPOSITE_FRAC(0, "uart2_frac", "uart2_src", CLK_SET_RATE_PARENT,
+			RK2928_CLKGATE_CON(1), 11, GFLAGS,
+		MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
+				RK2928_CLKSEL_CON(14), 8, 2, MFLAGS)),
+	COMPOSITE_FRACMUX(0, "uart2_frac", "uart2_src", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(19), 0,
-			RK2928_CLKGATE_CON(1), 13, GFLAGS),
-	MUX(SCLK_UART0, "sclk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
-			RK2928_CLKSEL_CON(13), 8, 2, MFLAGS),
-	MUX(SCLK_UART1, "sclk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
-			RK2928_CLKSEL_CON(14), 8, 2, MFLAGS),
-	MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
-			RK2928_CLKSEL_CON(15), 8, 2, MFLAGS),
+			RK2928_CLKGATE_CON(1), 13, GFLAGS,
+		MUX(SCLK_UART2, "sclk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
+				RK2928_CLKSEL_CON(15), 8, 2, MFLAGS)),
 
+	/* PD_VIDEO */
 	COMPOSITE(0, "aclk_vcodec", mux_pll_src_3plls_p, 0,
 			RK2928_CLKSEL_CON(32), 14, 2, MFLAGS, 8, 5, DFLAGS,
 			RK2928_CLKGATE_CON(3), 11, GFLAGS),
@@ -251,6 +261,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(20), 0, 2, MFLAGS, 2, 5, DFLAGS,
 			RK2928_CLKGATE_CON(10), 6, GFLAGS),
 
+	/* PD_VIO */
 	COMPOSITE(0, "aclk_disp1_pre", mux_pll_src_3plls_p, 0,
 			RK2928_CLKSEL_CON(31), 14, 2, MFLAGS, 8, 5, DFLAGS,
 			RK2928_CLKGATE_CON(1), 4, GFLAGS),
@@ -261,6 +272,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(28), 0, 2, MFLAGS, 8, 8, DFLAGS,
 			RK2928_CLKGATE_CON(3), 2, GFLAGS),
 
+	/* MMC */
 	COMPOSITE_NODIV(0, "sclk_sdmmc_src", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(12), 8, 2, DFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
@@ -286,28 +298,30 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	MMC(SCLK_EMMC_DRV,     "emmc_drv",     "sclk_emmc",  RK3036_EMMC_CON0,  1),
 	MMC(SCLK_EMMC_SAMPLE,  "emmc_sample",  "sclk_emmc",  RK3036_EMMC_CON1,  0),
 
+	/* I2S */
 	COMPOSITE(0, "i2s_src", mux_pll_src_3plls_p, 0,
 			RK2928_CLKSEL_CON(3), 14, 2, MFLAGS, 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(0), 9, GFLAGS),
-	COMPOSITE_FRAC(0, "i2s_frac", "i2s_src", CLK_SET_RATE_PARENT,
+	COMPOSITE_FRACMUX(0, "i2s_frac", "i2s_src", CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(7), 0,
-			RK2928_CLKGATE_CON(0), 10, GFLAGS),
-	MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
-			RK2928_CLKSEL_CON(3), 8, 2, MFLAGS),
+			RK2928_CLKGATE_CON(0), 10, GFLAGS,
+		MUX(0, "i2s_pre", mux_i2s_pre_p, CLK_SET_RATE_PARENT,
+				RK2928_CLKSEL_CON(3), 8, 2, MFLAGS)),
 	COMPOSITE_NODIV(SCLK_I2S_OUT, "i2s_clkout", mux_i2s_clkout_p, 0,
 			RK2928_CLKSEL_CON(3), 12, 1, MFLAGS,
 			RK2928_CLKGATE_CON(0), 13, GFLAGS),
 	GATE(SCLK_I2S, "sclk_i2s", "i2s_pre", CLK_SET_RATE_PARENT,
 			RK2928_CLKGATE_CON(0), 14, GFLAGS),
 
+	/* SPDIF */
 	COMPOSITE(0, "spdif_src", mux_pll_src_3plls_p, 0,
 			RK2928_CLKSEL_CON(5), 10, 2, MFLAGS, 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(2), 10, GFLAGS),
-	COMPOSITE_FRAC(0, "spdif_frac", "spdif_src", 0,
+	COMPOSITE_FRACMUX(0, "spdif_frac", "spdif_src", 0,
 			RK2928_CLKSEL_CON(9), 0,
-			RK2928_CLKGATE_CON(2), 12, GFLAGS),
-	MUX(SCLK_SPDIF, "sclk_spdif", mux_spdif_p, 0,
-			RK2928_CLKSEL_CON(5), 8, 2, MFLAGS),
+			RK2928_CLKGATE_CON(2), 12, GFLAGS,
+		MUX(SCLK_SPDIF, "sclk_spdif", mux_spdif_p, 0,
+				RK2928_CLKSEL_CON(5), 8, 2, MFLAGS)),
 
 	GATE(SCLK_OTGPHY0, "sclk_otgphy0", "xin12m", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(1), 5, GFLAGS),
@@ -332,7 +346,6 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(21), 0, 2, MFLAGS, 4, 5, DFLAGS),
 	MUX(SCLK_MACREF, "mac_clk_ref", mux_mac_p, CLK_SET_RATE_PARENT,
 			RK2928_CLKSEL_CON(21), 3, 1, MFLAGS),
-
 	COMPOSITE_NOMUX(SCLK_MAC, "mac_clk", "mac_clk_ref", 0,
 			RK2928_CLKSEL_CON(21), 9, 5, DFLAGS,
 			RK2928_CLKGATE_CON(2), 6, GFLAGS),
@@ -364,7 +377,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(HCLK_VIO_BUS, "hclk_vio_bus", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(6), 12, GFLAGS),
 	GATE(HCLK_LCDC, "hclk_lcdc", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(9), 5, GFLAGS),
 
-	/* hclk_video gates */
+	/* aclk_video gates */
 	GATE(HCLK_VCODEC, "hclk_vcodec", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(3), 12, GFLAGS),
 
 	/* xin24m gates */
@@ -394,7 +407,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	/* pclk_peri gates */
 	GATE(0, "pclk_peri_matrix", "pclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(4), 1, GFLAGS),
 	GATE(0, "pclk_efuse", "pclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 2, GFLAGS),
-	GATE(PCLK_TIMER, "pclk_timer", "pclk_peri", 0, RK2928_CLKGATE_CON(7), 7, GFLAGS),
+	GATE(PCLK_TIMER, "pclk_timer0", "pclk_peri", 0, RK2928_CLKGATE_CON(7), 7, GFLAGS),
 	GATE(PCLK_PWM, "pclk_pwm", "pclk_peri", 0, RK2928_CLKGATE_CON(7), 10, GFLAGS),
 	GATE(PCLK_SPI, "pclk_spi", "pclk_peri", 0, RK2928_CLKGATE_CON(7), 12, GFLAGS),
 	GATE(PCLK_WDT, "pclk_wdt", "pclk_peri", 0, RK2928_CLKGATE_CON(7), 15, GFLAGS),
@@ -414,6 +427,7 @@ static const char *const rk3036_critical_clocks[] __initconst = {
 	"aclk_peri",
 	"hclk_peri",
 	"pclk_peri",
+	"uart_pll_clk",
 };
 
 static void __init rk3036_clk_init(struct device_node *np)
-- 
1.9.1


--------------060203020009090504070404--

