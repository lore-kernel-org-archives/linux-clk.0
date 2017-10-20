Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:56776 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752199AbdJTIDA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2017 04:03:00 -0400
Received: by mail-wr0-f193.google.com with SMTP id r79so10595024wrb.13
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2017 01:03:00 -0700 (PDT)
Message-ID: <1508486577.3616.11.camel@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson: gxbb: Add VPU and VAPB clocks data
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Oct 2017 10:02:57 +0200
In-Reply-To: <1508168085-19032-3-git-send-email-narmstrong@baylibre.com>
References: <1508168085-19032-1-git-send-email-narmstrong@baylibre.com>
         <1508168085-19032-3-git-send-email-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-10-16 at 17:34 +0200, Neil Armstrong wrote:
> The Amlogic Meson GX SoCs needs these two clocks to power up the
> VPU power domain.
> 
> These two clocks are similar to the MALI clocks by having a glitch-free
> mux and two similar clocks with gate, divider and muxes.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/gxbb.c | 292
> +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 292 insertions(+)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index b2d1e8e..a713744 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1131,6 +1131,253 @@ static struct clk_gate gxbb_sd_emmc_c_clk0 = {
>  	},
>  };
>  
> +/* VPU Clock */
> +
> +static u32 mux_table_vpu[] = {0, 1, 2, 3};
> +static const char * const gxbb_vpu_parent_names[] = {
> +	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
> +};
> +
> +static struct clk_mux gxbb_vpu_0_sel = {
> +	.reg = (void *)HHI_VPU_CLK_CNTL,
> +	.mask = 0x3,
> +	.shift = 9,
> +	.lock = &clk_lock,
> +	.table = mux_table_vpu,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_0_sel",
> +		.ops = &clk_mux_ops,
> +		/*
> +		 * bits 9:10 selects from 4 possible parents:
> +		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
> +		 */
> +		.parent_names = gxbb_vpu_parent_names,
> +		.num_parents = ARRAY_SIZE(gxbb_vpu_parent_names),
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED,

AFAIK, CLK_IGNORE_UNUSED is not useful for generic muxes and dividers since they
don't implement enable/disbale.

You can drop these.
With that changed:

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> +	},
> +};
> +
> +static struct clk_divider gxbb_vpu_0_div = {
> +	.reg = (void *)HHI_VPU_CLK_CNTL,
> +	.shift = 0,
> +	.width = 7,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_0_div",
> +		.ops = &clk_divider_ops,
> +		.parent_names = (const char *[]){ "vpu_0_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_gate gxbb_vpu_0 = {
> +	.reg = (void *)HHI_VPU_CLK_CNTL,
> +	.bit_idx = 8,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vpu_0",
> +		.ops = &clk_gate_ops,
> +		.parent_names = (const char *[]){ "vpu_0_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_mux gxbb_vpu_1_sel = {
> +	.reg = (void *)HHI_VPU_CLK_CNTL,
> +	.mask = 0x3,
> +	.shift = 25,
> +	.lock = &clk_lock,
> +	.table = mux_table_vpu,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_1_sel",
> +		.ops = &clk_mux_ops,
> +		/*
> +		 * bits 25:26 selects from 4 possible parents:
> +		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
> +		 */
> +		.parent_names = gxbb_vpu_parent_names,
> +		.num_parents = ARRAY_SIZE(gxbb_vpu_parent_names),
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_divider gxbb_vpu_1_div = {
> +	.reg = (void *)HHI_VPU_CLK_CNTL,
> +	.shift = 16,
> +	.width = 7,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu_1_div",
> +		.ops = &clk_divider_ops,
> +		.parent_names = (const char *[]){ "vpu_1_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_gate gxbb_vpu_1 = {
> +	.reg = (void *)HHI_VPU_CLK_CNTL,
> +	.bit_idx = 24,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vpu_1",
> +		.ops = &clk_gate_ops,
> +		.parent_names = (const char *[]){ "vpu_1_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_mux gxbb_vpu = {
> +	.reg = (void *)HHI_VPU_CLK_CNTL,
> +	.mask = 1,
> +	.shift = 31,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vpu",
> +		.ops = &clk_mux_ops,
> +		/*
> +		 * bit 31 selects from 2 possible parents:
> +		 * vpu_0 or vpu_1
> +		 */
> +		.parent_names = (const char *[]){ "vpu_0", "vpu_1" },
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +/* VAPB Clock */
> +
> +static u32 mux_table_vapb[] = {0, 1, 2, 3};
> +static const char * const gxbb_vapb_parent_names[] = {
> +	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
> +};
> +
> +static struct clk_mux gxbb_vapb_0_sel = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.mask = 0x3,
> +	.shift = 9,
> +	.lock = &clk_lock,
> +	.table = mux_table_vapb,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vapb_0_sel",
> +		.ops = &clk_mux_ops,
> +		/*
> +		 * bits 9:10 selects from 4 possible parents:
> +		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
> +		 */
> +		.parent_names = gxbb_vapb_parent_names,
> +		.num_parents = ARRAY_SIZE(gxbb_vapb_parent_names),
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_divider gxbb_vapb_0_div = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.shift = 0,
> +	.width = 7,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vapb_0_div",
> +		.ops = &clk_divider_ops,
> +		.parent_names = (const char *[]){ "vapb_0_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_gate gxbb_vapb_0 = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.bit_idx = 8,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vapb_0",
> +		.ops = &clk_gate_ops,
> +		.parent_names = (const char *[]){ "vapb_0_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_mux gxbb_vapb_1_sel = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.mask = 0x3,
> +	.shift = 25,
> +	.lock = &clk_lock,
> +	.table = mux_table_vapb,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vapb_1_sel",
> +		.ops = &clk_mux_ops,
> +		/*
> +		 * bits 25:26 selects from 4 possible parents:
> +		 * fclk_div4, fclk_div3, fclk_div5, fclk_div7,
> +		 */
> +		.parent_names = gxbb_vapb_parent_names,
> +		.num_parents = ARRAY_SIZE(gxbb_vapb_parent_names),
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_divider gxbb_vapb_1_div = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.shift = 16,
> +	.width = 7,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vapb_1_div",
> +		.ops = &clk_divider_ops,
> +		.parent_names = (const char *[]){ "vapb_1_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_gate gxbb_vapb_1 = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.bit_idx = 24,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vapb_1",
> +		.ops = &clk_gate_ops,
> +		.parent_names = (const char *[]){ "vapb_1_div" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_mux gxbb_vapb_sel = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.mask = 1,
> +	.shift = 31,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "vapb_sel",
> +		.ops = &clk_mux_ops,
> +		/*
> +		 * bit 31 selects from 2 possible parents:
> +		 * vapb_0 or vapb_1
> +		 */
> +		.parent_names = (const char *[]){ "vapb_0", "vapb_1" },
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
> +static struct clk_gate gxbb_vapb = {
> +	.reg = (void *)HHI_VAPBCLK_CNTL,
> +	.bit_idx = 30,
> +	.lock = &clk_lock,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "vapb",
> +		.ops = &clk_gate_ops,
> +		.parent_names = (const char *[]){ "vapb_sel" },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +	},
> +};
> +
>  /* Everything Else (EE) domain gates */
>  static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
>  static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
> @@ -1349,6 +1596,21 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data
> = {
>  		[CLKID_SD_EMMC_C_CLK0_SEL]  = &gxbb_sd_emmc_c_clk0_sel.hw,
>  		[CLKID_SD_EMMC_C_CLK0_DIV]  = &gxbb_sd_emmc_c_clk0_div.hw,
>  		[CLKID_SD_EMMC_C_CLK0]	    = &gxbb_sd_emmc_c_clk0.hw,
> +		[CLKID_VPU_0_SEL]	    = &gxbb_vpu_0_sel.hw,
> +		[CLKID_VPU_0_DIV]	    = &gxbb_vpu_0_div.hw,
> +		[CLKID_VPU_0]		    = &gxbb_vpu_0.hw,
> +		[CLKID_VPU_1_SEL]	    = &gxbb_vpu_1_sel.hw,
> +		[CLKID_VPU_1_DIV]	    = &gxbb_vpu_1_div.hw,
> +		[CLKID_VPU_1]		    = &gxbb_vpu_1.hw,
> +		[CLKID_VPU]		    = &gxbb_vpu.hw,
> +		[CLKID_VAPB_0_SEL]	    = &gxbb_vapb_0_sel.hw,
> +		[CLKID_VAPB_0_DIV]	    = &gxbb_vapb_0_div.hw,
> +		[CLKID_VAPB_0]		    = &gxbb_vapb_0.hw,
> +		[CLKID_VAPB_1_SEL]	    = &gxbb_vapb_1_sel.hw,
> +		[CLKID_VAPB_1_DIV]	    = &gxbb_vapb_1_div.hw,
> +		[CLKID_VAPB_1]		    = &gxbb_vapb_1.hw,
> +		[CLKID_VAPB_SEL]	    = &gxbb_vapb_sel.hw,
> +		[CLKID_VAPB]		    = &gxbb_vapb.hw,
>  		[NR_CLKS]		    = NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -1481,6 +1743,21 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data =
> {
>  		[CLKID_SD_EMMC_C_CLK0_SEL]  = &gxbb_sd_emmc_c_clk0_sel.hw,
>  		[CLKID_SD_EMMC_C_CLK0_DIV]  = &gxbb_sd_emmc_c_clk0_div.hw,
>  		[CLKID_SD_EMMC_C_CLK0]	    = &gxbb_sd_emmc_c_clk0.hw,
> +		[CLKID_VPU_0_SEL]	    = &gxbb_vpu_0_sel.hw,
> +		[CLKID_VPU_0_DIV]	    = &gxbb_vpu_0_div.hw,
> +		[CLKID_VPU_0]		    = &gxbb_vpu_0.hw,
> +		[CLKID_VPU_1_SEL]	    = &gxbb_vpu_1_sel.hw,
> +		[CLKID_VPU_1_DIV]	    = &gxbb_vpu_1_div.hw,
> +		[CLKID_VPU_1]		    = &gxbb_vpu_1.hw,
> +		[CLKID_VPU]		    = &gxbb_vpu.hw,
> +		[CLKID_VAPB_0_SEL]	    = &gxbb_vapb_0_sel.hw,
> +		[CLKID_VAPB_0_DIV]	    = &gxbb_vapb_0_div.hw,
> +		[CLKID_VAPB_0]		    = &gxbb_vapb_0.hw,
> +		[CLKID_VAPB_1_SEL]	    = &gxbb_vapb_1_sel.hw,
> +		[CLKID_VAPB_1_DIV]	    = &gxbb_vapb_1_div.hw,
> +		[CLKID_VAPB_1]		    = &gxbb_vapb_1.hw,
> +		[CLKID_VAPB_SEL]	    = &gxbb_vapb_sel.hw,
> +		[CLKID_VAPB]		    = &gxbb_vapb.hw,
>  		[NR_CLKS]		    = NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -1600,6 +1877,11 @@ static struct clk_gate *const gxbb_clk_gates[] = {
>  	&gxbb_sd_emmc_a_clk0,
>  	&gxbb_sd_emmc_b_clk0,
>  	&gxbb_sd_emmc_c_clk0,
> +	&gxbb_vpu_0,
> +	&gxbb_vpu_1,
> +	&gxbb_vapb_0,
> +	&gxbb_vapb_1,
> +	&gxbb_vapb,
>  };
>  
>  static struct clk_mux *const gxbb_clk_muxes[] = {
> @@ -1615,6 +1897,12 @@ static struct clk_mux *const gxbb_clk_muxes[] = {
>  	&gxbb_sd_emmc_a_clk0_sel,
>  	&gxbb_sd_emmc_b_clk0_sel,
>  	&gxbb_sd_emmc_c_clk0_sel,
> +	&gxbb_vpu_0_sel,
> +	&gxbb_vpu_1_sel,
> +	&gxbb_vpu,
> +	&gxbb_vapb_0_sel,
> +	&gxbb_vapb_1_sel,
> +	&gxbb_vapb_sel,
>  };
>  
>  static struct clk_divider *const gxbb_clk_dividers[] = {
> @@ -1627,6 +1915,10 @@ static struct clk_divider *const gxbb_clk_dividers[] =
> {
>  	&gxbb_sd_emmc_a_clk0_div,
>  	&gxbb_sd_emmc_b_clk0_div,
>  	&gxbb_sd_emmc_c_clk0_div,
> +	&gxbb_vpu_0_div,
> +	&gxbb_vpu_1_div,
> +	&gxbb_vapb_0_div,
> +	&gxbb_vapb_1_div,
>  };
>  
>  static struct meson_clk_audio_divider *const gxbb_audio_dividers[] = {

