Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0473C4167B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:10:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbiL3IKO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbiL3IKM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:10:12 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CED18682
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:10:10 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id 3so20601543vsq.7
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6m26YMbks5w9j7aA1kyB8fHaCoQJomo7rPAPrntLOog=;
        b=da0u9H3i2xBt3fWJah+Dv2qxTKOgSPA3AOzUFkMKqyZBIZZP1P0UGdJuaICzOxt4fH
         Mm1wEa0yAJTOmV4DWB4J14oTVDAi63M5Vz3MP/SaMgYICVkVtF/81mtEBJvcpGuYIkY9
         crEd8lqVWmWgaSLClDuFEAsKqpu5aflcbck8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m26YMbks5w9j7aA1kyB8fHaCoQJomo7rPAPrntLOog=;
        b=KPAdOQuazIPxkc8OhjnjNaLlHHMOol53k7vlS2vVFV1X7UXIypdC8WyQpZU0OyvIOB
         8KAyxw3kzPYChhTvvpb8MHx9T+kOWvMcC4+nBA6oQzyjUAVQsdJzKW0NBoNYS9yZHYrA
         Bq9147M5rVWJU6AqECuZfDurtqbeCDRoB2zlFt65t77pPwd9qo57GVmDfwlaFfWWFU6Q
         p8ycZfWd7dl/GR8IqJcT/CVcIruHAoU7SfBnPoODcuRif6e6IAXtw20wm523JuhtwjP7
         a19F7IBGBdCNqfkElRr9wfNIHy184Dt+pcAx9lEQ6kuuB/WO9N4jZ/h9Y7cjXyj1odLL
         Ua3Q==
X-Gm-Message-State: AFqh2kq+9kg9YyGLrFW0YRuC85G2tlFaV7u4CeEV8n87fSkKMPh8j/V2
        cfeBmt3D8RoAwxlgyKMKEf1HRKfmVsP0CuriXhDRZw==
X-Google-Smtp-Source: AMrXdXu42OIXcFU1BSE54ydAcv7zw3Gqh5WM+YiUnvG/dZqYgZpVZP5X5dL1GmIq2Knsf9WEE8McGyC3+t2WX/bbKjs=
X-Received: by 2002:a67:fbc2:0:b0:3cc:fb59:8c71 with SMTP id
 o2-20020a67fbc2000000b003ccfb598c71mr21878vsr.65.1672387810048; Fri, 30 Dec
 2022 00:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com> <20221228083123.15298-1-miles.chen@mediatek.com>
In-Reply-To: <20221228083123.15298-1-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:09:59 +0800
Message-ID: <CAGXv+5Hp3MFjLcP5z0t6QnYHN3VvVg_Og_HhvWNxm5o1q20B=g@mail.gmail.com>
Subject: Re: [PATCH v2 15/23] clk: mediatek: mt8192: Join top_adj_divs and top_muxes
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        devicetree@vger.kernel.org, fparent@baylibre.com,
        ikjn@chromium.org, johnson.wang@mediatek.com,
        jose.exposito89@gmail.com, kernel@collabora.com,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com,
        nfraprado@collabora.com, pablo.sun@mediatek.com,
        rex-bc.chen@mediatek.com, robh+dt@kernel.org, ryder.lee@kernel.org,
        sam.shih@mediatek.com, sboyd@kernel.org, weiyi.lu@mediatek.com,
        y.oudjana@protonmail.com, yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Dec 28, 2022 at 4:31 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> Hi,
>
> > These two are both mtk_composite arrays, one dependent on another, but
> > that's something that the clock framework is supposed to sort out and
> > anyway registering them separately isn't going to ease the framework's
> > job in checking dependencies.
> >
> > Put the contents of top_adj_divs in top_muxes to join them together
> > and register them in one shot.
> >
>
> In mt8192, we can join top_adj_divs and top_muxes:
>
> mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
>                 top_clk_data);
> mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
>                 top_clk_data);
>
> However, there are other top_adj_divs[] and top_muxes[] in different types so
> we cannot join them.
>
> For example:
> in drivers/clk/mediatek/clk-mt8167.c:mtk_topckgen_init():
>
> mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
>                 &mt8167_clk_lock, clk_data);
> mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
>                 base, &mt8167_clk_lock, clk_data);
>
> So we can join top_adj_divs and top_muxes in some platforms, but we
> cannot join top_adj_divs and top_muxes in some other platforms.
>
> I'm afraid that this will confuses people.

I think the confusion comes from the macro names. It's not exactly clear that
DIV_GATE is for composite clocks, while DIV_ADJ is for divider clocks.
Doubly so for the mux related types.

Either way, using the wrong macro or the wrong type will cause the compiler
to complain, so I think it's something we can live with. If it's still not
working out, maybe we should rethink the naming.

ChenYu
