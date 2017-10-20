Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:55787 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752199AbdJTIOQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2017 04:14:16 -0400
Received: by mail-wr0-f196.google.com with SMTP id z99so8164604wrc.12
        for <linux-clk@vger.kernel.org>; Fri, 20 Oct 2017 01:14:16 -0700 (PDT)
Message-ID: <1508487254.3616.12.camel@baylibre.com>
Subject: Re: [PATCH 1/2] clk: meson: gxbb: Add VPU and VAPB clockids
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Oct 2017 10:14:14 +0200
In-Reply-To: <1508168085-19032-2-git-send-email-narmstrong@baylibre.com>
References: <1508168085-19032-1-git-send-email-narmstrong@baylibre.com>
         <1508168085-19032-2-git-send-email-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-10-16 at 17:34 +0200, Neil Armstrong wrote:
> Add the clkids for the clocks feeding the Video Processing Unit.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/gxbb.h              |  6 +++++-
>  include/dt-bindings/clock/gxbb-clkc.h | 11 +++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
> index 5b1d4b3..aee6fbb 100644
> --- a/drivers/clk/meson/gxbb.h
> +++ b/drivers/clk/meson/gxbb.h
> @@ -190,8 +190,12 @@
>  #define CLKID_SD_EMMC_B_CLK0_DIV  121
>  #define CLKID_SD_EMMC_C_CLK0_SEL  123
>  #define CLKID_SD_EMMC_C_CLK0_DIV  124
> +#define CLKID_VPU_0_DIV		  127
> +#define CLKID_VPU_1_DIV		  130
> +#define CLKID_VAPB_0_DIV	  134
> +#define CLKID_VAPB_1_DIV	  137
>  
> -#define NR_CLKS			  126
> +#define NR_CLKS			  141
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/gxbb-clkc.h>
> diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-
> bindings/clock/gxbb-clkc.h
> index c04a76d..7c5a6f3 100644
> --- a/include/dt-bindings/clock/gxbb-clkc.h
> +++ b/include/dt-bindings/clock/gxbb-clkc.h
> @@ -113,5 +113,16 @@
>  #define CLKID_SD_EMMC_A_CLK0	119
>  #define CLKID_SD_EMMC_B_CLK0	122
>  #define CLKID_SD_EMMC_C_CLK0	125
> +#define CLKID_VPU_0_SEL		126
> +#define CLKID_VPU_0		128
> +#define CLKID_VPU_1_SEL		129
> +#define CLKID_VPU_1		131
> +#define CLKID_VPU		132
> +#define CLKID_VAPB_0_SEL	133
> +#define CLKID_VAPB_0		135
> +#define CLKID_VAPB_1_SEL	136
> +#define CLKID_VAPB_1		138
> +#define CLKID_VAPB_SEL		139
> +#define CLKID_VAPB		140
>  
>  #endif /* __GXBB_CLKC_H */

