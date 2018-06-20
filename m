Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:45785 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932459AbeFTIbs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jun 2018 04:31:48 -0400
Received: by mail-wr0-f195.google.com with SMTP id o12-v6so2306532wrm.12
        for <linux-clk@vger.kernel.org>; Wed, 20 Jun 2018 01:31:47 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: audio-divider is one based
To: Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180619154753.12788-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <e8898e54-24b1-ec77-1b08-390607640747@baylibre.com>
Date: Wed, 20 Jun 2018 10:31:45 +0200
MIME-Version: 1.0
In-Reply-To: <20180619154753.12788-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 19/06/2018 17:47, Jerome Brunet wrote:
> The audio divider is one based. This offset was mistakenly dropped from
> recalc_rate() when migrating to clk_regmap.
> 
> Fixes: 88a4e1283681 ("clk: meson: migrate the audio divider clock to clk_regmap")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/clk-audio-divider.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/clk-audio-divider.c
> index 58f546e04807..e4cf96ba704e 100644
> --- a/drivers/clk/meson/clk-audio-divider.c
> +++ b/drivers/clk/meson/clk-audio-divider.c
> @@ -51,7 +51,7 @@ static unsigned long audio_divider_recalc_rate(struct clk_hw *hw,
>  	struct meson_clk_audio_div_data *adiv = meson_clk_audio_div_data(clk);
>  	unsigned long divider;
>  
> -	divider = meson_parm_read(clk->map, &adiv->div);
> +	divider = meson_parm_read(clk->map, &adiv->div) + 1;
>  
>  	return DIV_ROUND_UP_ULL((u64)parent_rate, divider);
>  }
> 
Acked-by: Neil Armstrong <narmstrong@baylibre.com>

