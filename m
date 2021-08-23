Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AE2C4338F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 06:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DCFF61284
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 06:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbhHWGnh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 02:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234212AbhHWGnh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 02:43:37 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0BBC061575
        for <linux-clk@vger.kernel.org>; Sun, 22 Aug 2021 23:42:54 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id j12so15154482ljg.10
        for <linux-clk@vger.kernel.org>; Sun, 22 Aug 2021 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFJ5qArshzVHf3q7jRlOWQagxpfLOrv79VSjCdNEbCA=;
        b=Zf7g29E3w/mMGEQGTHke0IP1vIqXBP/xGjiHyLab7RfdnbLe9ZNKiyevv6kO2oi89n
         3wsWr3eIiIFkS8ODwd2HPqhiTr/XmNhM2RqeP8M7oo/E8+KI1mkd/dwW5x0YHqVVg7ii
         Gbc8dt9O4AM7OBaotSD53oVjK7yj0Ezk2OaJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFJ5qArshzVHf3q7jRlOWQagxpfLOrv79VSjCdNEbCA=;
        b=icmlt3P7ftKGl8iq/8YlUheGN9Lz2OLR3nI29fkWwGOTZhD8l03sjCbIDS5Wx21b5F
         hhYcP3Ygbd3LhMrjLmPGEx6LmBTLNaSO+Tt+B11X1DPTKgnXo1i7PJU8G9Gw8U+m8iNJ
         n2g2F7qUKl3MXguIG5msvf4jBWrKprNt9Jt5nCKGThW6KfBWvfqEZddkgeVL5zlVBQdn
         EgWljIwNmVxFEVwniTQu7r0BgsiZ/wOdvntcWxVnE9k5kL4/xPiznbRYM7/pA6hbiBuC
         ANfhybViRY8s+sLLbzR/42h3Wwk1cMPmnKXldjaenUtROiiyIWfJ77Jkt81LEHyBfH2W
         17oA==
X-Gm-Message-State: AOAM532gV32jGHHGEmh/ApGWi4gIxxjA7WsK6j/5/F819DlgWuXirR6a
        KStQzM/2ZapXV9+dNv+jmNxIwdLvX7R/j8/1EiNV6w==
X-Google-Smtp-Source: ABdhPJxTuOEDNkFKHBotXobJuIjH4Z7qG0KV3mS8Xf0E+WOygl2HTPZPkLpJ47L2eJAse8NeczQkwyQsSN8xFb81ERI=
X-Received: by 2002:a05:651c:211a:: with SMTP id a26mr12902308ljq.305.1629700973307;
 Sun, 22 Aug 2021 23:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-6-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-6-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 14:42:42 +0800
Message-ID: <CAGXv+5EReMTGS02SgVO_yrpChOiw++3rwfc0Jx66CBzuDHOXAQ@mail.gmail.com>
Subject: Re: [v2 05/24] clk: mediatek: Fix resource leak in mtk_clk_simple_probe
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 20, 2021 at 7:19 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Release clock data when clock driver probe fail to fix
> possible resource leak.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/clk/mediatek/clk-mtk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index c3d385c0cfcb..74890759e98c 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -314,7 +314,15 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>
>         r = mtk_clk_register_gates(node, mcd->clks, mcd->num_clks, clk_data);

Note for future reference: there is no unregister counterpart for
mtk_clk_register_*.


>         if (r)
> -               return r;
> +               goto free_data;
>
> -       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r)
> +               goto free_data;
> +
> +       return r;
> +
> +free_data:
> +       mtk_free_clk_data(clk_data);
> +       return r;
>  }
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
