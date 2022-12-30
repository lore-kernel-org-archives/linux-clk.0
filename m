Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6010BC3DA7C
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 05:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbiL3FTn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 00:19:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234455AbiL3FTd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 00:19:33 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF13018389
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 21:19:32 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id f184so5713242vkh.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 21:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=98nwyMJGkz5rxMgvlYxl5iF1bUd6Qz3cEnsFubCpd7U=;
        b=YfZO23V/h0aXw03yMDj/5UL15JsM8Ea8pnINQmUS7PKYtvHzs5g9MScuXj0TaYkiFz
         fb/E3Gp/YAjq7otO6pq7w341FTDWo9kEt1CFbmfrnF2+YhRBSOBDNoYBfpHD3Z5kdyij
         XgFe/XcxqH6LE0ButXKMFb7b2Grnq5wF3zcas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98nwyMJGkz5rxMgvlYxl5iF1bUd6Qz3cEnsFubCpd7U=;
        b=phMQUZ+RNqXgl8q6foPExJQsRO5eJCUo7vbiFeFWEtx6xg6woTQewoLW7jKHPouIX+
         OIEEIKx+/tgXT+F5VNZ4Vwsu0NcX6/VcyQICgVbE+LFirttbkHl3oyNyLhDm1orP6IqD
         UTXSLTgG988DDb39+uIHhZG7Lwa8tpFGbh6+QmCTs3FdIJsSmvymHKZ7NHxdVKeBZ3Ih
         cQk8+yecY8q6wTIHSVCqLI9jDYUvU6P1Q0Fsrn6JPbn73NPLYPcyE5xd6enTp+Nll+oP
         zXSsGKyP7jdGvFKlgS+5RCNPf1RoggmPbmylM/RDtlbRK219cFKQDkbuqGiItPRC+d0Z
         CWdw==
X-Gm-Message-State: AFqh2krp/ZVrW9Nb5230B/79+fL7Co/iGaMufdkN0VbG6Be/nML23FkB
        ibcQsn9AJiPW+a0xc/YXumQUTTqyo/km0o2788DsNg==
X-Google-Smtp-Source: AMrXdXv51QytqQDxSQHVkwx8oHyCKoFvryaKDWDehNjS8o17nSfNUfoL6Xj2kxDqdcOvxqkWF3KV3YlrtDXDV21F6wo=
X-Received: by 2002:a1f:940a:0:b0:3bd:e439:84e4 with SMTP id
 w10-20020a1f940a000000b003bde43984e4mr3166517vkd.11.1672377571944; Thu, 29
 Dec 2022 21:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-8-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 13:19:21 +0800
Message-ID: <CAGXv+5H=eq0WRc=vvjD-xEKuc1tkM_t4GCHVwe8EZzSJPdEDOQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/23] clk: mediatek: clk-mtk: Add dummy clock ops
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In order to migrate some (few) old clock drivers to the common
> mtk_clk_simple_probe() function, add dummy clock ops to be able
> to insert a dummy clock with ID 0 at the beginning of the list.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index a1ab34305b95..d05364e17e95 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -18,6 +18,21 @@
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
>
> +const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };

You could probably just use an empty { }, since the contents don't matter.
It would make any possible future changes to |struct mtk_gate_regs| touch
one less place.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +
> +static int mtk_clk_dummy_enable(struct clk_hw *hw)
> +{
> +       return 0;
> +}
> +
> +static void mtk_clk_dummy_disable(struct clk_hw *hw) { }
> +
> +const struct clk_ops mtk_clk_dummy_ops = {
> +       .enable         = mtk_clk_dummy_enable,
> +       .disable        = mtk_clk_dummy_disable,
> +};
> +EXPORT_SYMBOL_GPL(mtk_clk_dummy_ops);
> +
>  static void mtk_init_clk_data(struct clk_hw_onecell_data *clk_data,
>                               unsigned int clk_num)
>  {
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 15122504c02d..dd43235285db 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -22,6 +22,25 @@
>
>  struct platform_device;
>
> +/*
> + * We need the clock IDs to start from zero but to maintain devicetree
> + * backwards compatibility we can't change bindings to start from zero.
> + * Only a few platforms are affected, so we solve issues given by the
> + * commonized MTK clocks probe function(s) by adding a dummy clock at
> + * the beginning where needed.
> + */
> +#define CLK_DUMMY              0
> +
> +extern const struct clk_ops mtk_clk_dummy_ops;
> +extern const struct mtk_gate_regs cg_regs_dummy;
> +
> +#define GATE_DUMMY(_id, _name) {                               \
> +               .id = _id,                                      \
> +               .name = _name,                                  \
> +               .regs = &cg_regs_dummy,                         \
> +               .ops = &mtk_clk_dummy_ops,                      \
> +       }
> +
>  struct mtk_fixed_clk {
>         int id;
>         const char *name;
> --
> 2.39.0
>
