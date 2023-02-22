Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579C8C61DA4
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 18:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbjBVSD2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 13:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjBVSD2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 13:03:28 -0500
Received: from fudo.makrotopia.org (fudo.makrotopia.org [IPv6:2a07:2ec0:3002::71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A3229E2E;
        Wed, 22 Feb 2023 10:03:25 -0800 (PST)
Received: from local
        by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1pUtSW-0008EJ-1o;
        Wed, 22 Feb 2023 19:03:16 +0100
Date:   Wed, 22 Feb 2023 18:03:13 +0000
From:   Daniel Golle <daniel@makrotopia.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        wenst@chromium.org, johnson.wang@mediatek.com,
        miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 32/54] clk: mediatek: mt7986-apmixed: Use PLL_AO flag
 to set critical clock
Message-ID: <Y/ZY4QVnreMX9K9S@makrotopia.org>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
 <20230222092543.19187-33-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222092543.19187-33-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 22, 2023 at 10:25:21AM +0100, AngeloGioacchino Del Regno wrote:
> Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
> flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Tested-by: Daniel Golle <daniel@makrotopia.org>
(on BananaPi BPi-R3)

> ---
>  drivers/clk/mediatek/clk-mt7986-apmixed.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
> index 62080ee4dbe3..227ca572056e 100644
> --- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
> +++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
> @@ -42,7 +42,7 @@
>  		 "clkxtal")
>  
>  static const struct mtk_pll_data plls[] = {
> -	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, 0, 32,
> +	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, PLL_AO, 32,
>  	    0x0200, 4, 0, 0x0204, 0),
>  	PLL(CLK_APMIXED_NET2PLL, "net2pll", 0x0210, 0x021C, 0x0, 0, 32,
>  	    0x0210, 4, 0, 0x0214, 0),
> @@ -77,8 +77,6 @@ static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
>  
>  	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
>  
> -	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
> -
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r) {
>  		pr_err("%s(): could not register clock provider: %d\n",
> -- 
> 2.39.2
> 
> 
