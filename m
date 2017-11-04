Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:37089 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751548AbdKDIlw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Nov 2017 04:41:52 -0400
Subject: Re: [PATCH] clk: meson: gxbb: fix wrong clock for SARADC
To: Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <20171103181703.30434-1-yixun.lan@amlogic.com>
CC: <yixun.lan@amlogic.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
From: Yixun Lan <yixun.lan@amlogic.com>
Message-ID: <e8a5faa9-d3ca-e03e-3589-2685d6ada30a@amlogic.com>
Date: Sat, 4 Nov 2017 16:41:47 +0800
MIME-Version: 1.0
In-Reply-To: <20171103181703.30434-1-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 11/04/17 02:17, Yixun Lan wrote:
> According to the datasheet, the clock gate bit for
> SARADC is bit[22] in Meson-GXBB/GXL series.
> 
> Change-Id: Ic4fa58276d2a9ea273eef0a08541fc213ac5ac89
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  drivers/clk/meson/gxbb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index b2d1e8ed7152..4f5b535fcd12 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1139,7 +1139,6 @@ static MESON_GATE(gxbb_pl301, HHI_GCLK_MPEG0, 6);
>  static MESON_GATE(gxbb_periphs, HHI_GCLK_MPEG0, 7);
>  static MESON_GATE(gxbb_spicc, HHI_GCLK_MPEG0, 8);
>  static MESON_GATE(gxbb_i2c, HHI_GCLK_MPEG0, 9);
> -static MESON_GATE(gxbb_sar_adc, HHI_GCLK_MPEG0, 10);
>  static MESON_GATE(gxbb_smart_card, HHI_GCLK_MPEG0, 11);
>  static MESON_GATE(gxbb_rng0, HHI_GCLK_MPEG0, 12);
>  static MESON_GATE(gxbb_uart0, HHI_GCLK_MPEG0, 13);
> @@ -1149,6 +1148,7 @@ static MESON_GATE(gxbb_async_fifo, HHI_GCLK_MPEG0, 16);
>  static MESON_GATE(gxbb_sdio, HHI_GCLK_MPEG0, 17);
>  static MESON_GATE(gxbb_abuf, HHI_GCLK_MPEG0, 18);
>  static MESON_GATE(gxbb_hiu_iface, HHI_GCLK_MPEG0, 19);
> +static MESON_GATE(gxbb_sar_adc, HHI_GCLK_MPEG0, 22);
>  static MESON_GATE(gxbb_assist_misc, HHI_GCLK_MPEG0, 23);
>  static MESON_GATE(gxbb_emmc_a, HHI_GCLK_MPEG0, 24);
>  static MESON_GATE(gxbb_emmc_b, HHI_GCLK_MPEG0, 25);
> 
Hi Neil
 I assume you will take this via the clk-meson tree..
could you amend the commit msg and drop the 'Change-Id'?
(for other parts, please feel free to adjust if you see fit)
 thanks

Yixun

