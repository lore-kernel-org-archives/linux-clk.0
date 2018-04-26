Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36420 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753256AbeDZIkH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Apr 2018 04:40:07 -0400
Received: by mail-wr0-f193.google.com with SMTP id u18-v6so28603465wrg.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Apr 2018 01:40:06 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: meson: axg: let mpll clocks round closest
To: Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180420095603.29964-1-jbrunet@baylibre.com>
 <20180420095603.29964-3-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <7c6068d6-299d-698f-dec7-13cdf6b85f6e@baylibre.com>
Date: Thu, 26 Apr 2018 10:40:04 +0200
MIME-Version: 1.0
In-Reply-To: <20180420095603.29964-3-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 20/04/2018 11:56, Jerome Brunet wrote:
> Let the mpll dividers achieve the closest rate possible, even if
> it means rounding the requested rate up.
> 
> This is done to improve the accuracy of the rates provided by these
> plls to the audio subsystem
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 5f5d468c1efe..bd4dbc696b88 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -461,6 +461,7 @@ static struct clk_regmap axg_mpll0_div = {
>  			.width	 = 1,
>  		},
>  		.lock = &meson_clk_lock,
> +		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mpll0_div",
> @@ -507,6 +508,7 @@ static struct clk_regmap axg_mpll1_div = {
>  			.width	 = 1,
>  		},
>  		.lock = &meson_clk_lock,
> +		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mpll1_div",
> @@ -553,6 +555,7 @@ static struct clk_regmap axg_mpll2_div = {
>  			.width	 = 1,
>  		},
>  		.lock = &meson_clk_lock,
> +		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mpll2_div",
> @@ -599,6 +602,7 @@ static struct clk_regmap axg_mpll3_div = {
>  			.width	 = 1,
>  		},
>  		.lock = &meson_clk_lock,
> +		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mpll3_div",
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
