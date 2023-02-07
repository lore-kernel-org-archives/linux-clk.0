Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94235C636CD
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 06:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjBGGRA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjBGGRA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 01:17:00 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A69234020
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 22:16:58 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id g3so3838803vsr.10
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 22:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BL5RDYzyjIW0mBHFqtPQ+SR8w2nC8B8+flvI5fBxZgw=;
        b=IuIPBVpgZ08hpK4xFIoKrvp98G7sGXKJZSPnLTiDktVAWL9NFTimGFlEOvkINklzzR
         telGKhbhhmE+xk6vt37eV3miAfiOsAR+oVKDxq9wj992ZlhH444eFPLUIkkNrMwJJGaO
         DYdfR3VLzz74L2mKpy/3al2NNCiHwl02TdcHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BL5RDYzyjIW0mBHFqtPQ+SR8w2nC8B8+flvI5fBxZgw=;
        b=ryLkCKCsXhqeG+DrDCp4b4xV+MUadE4CXpF7fSfmO7LlVccTULdyIL7alOx7eeuh8+
         bsacfIKFsRNdfecPyZgxBVYTK6JvkFtIbHNu46RNcXSY8kEecChNfcPe8jgjw6l6/7IB
         ihSpHFvIOXTv9sEukry5xw7RM5iVmpM24EkwIvpTwQO1Up5yHBzpI9yevRbMRiryra4c
         aZOlZrt2RXkmvU3KnI1VUSPGG/VTEA6z1kHt8i4VzXg3z5ZQSpf17U3bHwNt3TBMGu6X
         z0b6NOxw0BXJL3ve0RlG6oulaLC35f9wGaFmO+D60u6ILQnk5VUTZ/cSWRHWEZ1VZ/ui
         9gLA==
X-Gm-Message-State: AO0yUKVJVdr1vR+nK0pDn4sqEv/2/9Y0Nsn+ZJqxl6wkUSWjmmjHlpMx
        hFbF3064fFDLDXssZMSzw4VYCAn/VjYEPOuXAjDaBQ==
X-Google-Smtp-Source: AK7set9i8K1ex1GvgvpZt6KGbhoq9sUGJc6ymsZdnVtxGQNh9dKmWUVTJu+n4uH1wjcaZNmg0kj24+MMLo54M70VIbY=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr549289vsv.85.1675750617274; Mon, 06 Feb
 2023 22:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-8-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 14:16:46 +0800
Message-ID: <CAGXv+5HVNSFyBncAepAhghHsjRdY=XyzsRY0Htm1KcRE7U9dfg@mail.gmail.com>
Subject: Re: [PATCH v1 07/45] clk: mediatek: mt2712: Add error handling to clk_mt2712_apmixed_probe()
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This function was completely missing error handling: add it.
>

Fixes tag?

Code looks OK. So once the tag is added,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2712.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index ce28ee47f5cf..8aa361f0fa13 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -1091,15 +1091,25 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>         struct device_node *node = pdev->dev.of_node;
>
>         clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
>
> -       mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +       r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +       if (r)
> +               goto free_clk_data;
>
>         r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +       if (r) {
> +               dev_err(&pdev->dev, "Cannot register clock provider: %d\n", r);
> +               goto unregister_plls;
> +       }
>
> -       if (r != 0)
> -               pr_err("%s(): could not register clock provider: %d\n",
> -                       __func__, r);
> +       return 0;
>
> +unregister_plls:
> +       mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
> +free_clk_data:
> +       mtk_free_clk_data(clk_data);
>         return r;
>  }
>
> --
> 2.39.1
>
