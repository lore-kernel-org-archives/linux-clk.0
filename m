Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7574C64ED8
	for <linux-clk@archiver.kernel.org>; Fri, 24 Feb 2023 07:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjBXHxr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Feb 2023 02:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBXHxp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Feb 2023 02:53:45 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAFE136F4
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 23:53:43 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id j14so20279098vse.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Feb 2023 23:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vdmyGXqsuWEA5J1LKHJz/9OjkInX21YMvFtAnrWDjfY=;
        b=adA6qbq4MVAaO3KK3woJiwoMOuBmQNISBj+EVmRR/SNgcOzcS9d+nUzZPzfYwPYLmu
         ZbqTf2Zsdn/vl/g48cSS+4twwPXAG8NkA1nSxH04kVTlIC4X3i+Tz1cMxwGW2aci91j7
         pHI7rr/eT1IJedTRY6hTC+yNaAoPiwBhJHmTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdmyGXqsuWEA5J1LKHJz/9OjkInX21YMvFtAnrWDjfY=;
        b=UcU240+SrMoPIZIIgIJZ54FAzZZbpChskrCAKyo4KtURyXRwhCWE8IcxTXwxaf+c3o
         ZIgSdPqi8LbXZfI1D8D27ri+0vUz2aG7p7K9W65ASWEcx4JNWS9iA4Lk/0AUaxRaiOh/
         HcuNrj+bHDtzXtaobuTsWwxVTRmpQLFOetX1Jjf81KFDYCYmRzOCwcS5uDizih1og4jx
         j+8sNEjEBhMGXJH9G5CXqfTkitlzHJeYdP90jmYsy4SGE+teVIFpoo43xr0I5cEUxgMB
         wwz0UzDJ21DD9nsWhpHsng+Pn/jS1BIcFW9B8OP/OLbFe1Ood/C1px/3agTX6wd7EY2A
         F7pw==
X-Gm-Message-State: AO0yUKUKOvPVxvXRnzrflHyBerc6449ACMeYjiAmxhqSoz74QDZta3V5
        1CjLUnR+4RBqEd89HrjyG2iv6k7OIjFEDTw2/SwStQ==
X-Google-Smtp-Source: AK7set9ZAp9+Vs7DCN8gO7YWRVX7TWXuw4hHRRsssi+Iv2W0TTsgH88ywdYxCBLS54DFWC5u60r7qCR10D/MbBr9UZw=
X-Received: by 2002:a1f:4343:0:b0:400:ea69:7082 with SMTP id
 q64-20020a1f4343000000b00400ea697082mr1911875vka.0.1677225222656; Thu, 23 Feb
 2023 23:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com> <20230222092543.19187-54-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230222092543.19187-54-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 24 Feb 2023 15:53:31 +0800
Message-ID: <CAGXv+5F6U9VZaRR3TW_rkDQrROVBGarqZJC6+ntR0d-TxJZ_Lw@mail.gmail.com>
Subject: Re: [PATCH v5 53/54] clk: mediatek: mt8135: Join root_clk_alias and
 top_divs arrays
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 22, 2023 at 5:27 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for converting this driver to the common simple probe
> mechanism, join the root_clk_alias and top_divs mtk_fixed_factor
> arrays.
>
> This commit brings no functional change.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/mediatek/clk-mt8135.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
> index 1c76c0003f99..8785d58cb3a5 100644
> --- a/drivers/clk/mediatek/clk-mt8135.c
> +++ b/drivers/clk/mediatek/clk-mt8135.c
> @@ -2,8 +2,6 @@
>  /*
>   * Copyright (c) 2014 MediaTek Inc.
>   * Author: James Liao <jamesjj.liao@mediatek.com>
> - * Copyright (c) 2023 Collabora, Ltd.
> - *               AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Was this meant for some other patch?

Also this is the first patch where my MT8186 fails to boot, which makes
absolutely no sense, since the MT8135 driver isn't even built.

ChenYu

>   */
>
>  #include <linux/clk.h>
> @@ -19,14 +17,12 @@
>
>  static DEFINE_SPINLOCK(mt8135_clk_lock);
>
> -static const struct mtk_fixed_factor root_clk_alias[] __initconst = {
> +static const struct mtk_fixed_factor top_divs[] __initconst = {
>         FACTOR(CLK_TOP_DSI0_LNTC_DSICLK, "dsi0_lntc_dsiclk", "clk_null", 1, 1),
>         FACTOR(CLK_TOP_HDMITX_CLKDIG_CTS, "hdmitx_clkdig_cts", "clk_null", 1, 1),
>         FACTOR(CLK_TOP_CLKPH_MCK, "clkph_mck", "clk_null", 1, 1),
>         FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "clk_null", 1, 1),
> -};
>
> -static const struct mtk_fixed_factor top_divs[] __initconst = {
>         FACTOR(CLK_TOP_MAINPLL_806M, "mainpll_806m", "mainpll", 1, 2),
>         FACTOR(CLK_TOP_MAINPLL_537P3M, "mainpll_537p3m", "mainpll", 1, 3),
>         FACTOR(CLK_TOP_MAINPLL_322P4M, "mainpll_322p4m", "mainpll", 1, 5),
> @@ -534,7 +530,6 @@ static void __init mtk_topckgen_init(struct device_node *node)
>
>         clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
>
> -       mtk_clk_register_factors(root_clk_alias, ARRAY_SIZE(root_clk_alias), clk_data);
>         mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
>         mtk_clk_register_composites(NULL, top_muxes,
>                                     ARRAY_SIZE(top_muxes), base,
> --
> 2.39.2
>
