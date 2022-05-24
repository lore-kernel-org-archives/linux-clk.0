Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C251C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 24 May 2022 06:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbiEXGZw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 May 2022 02:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiEXGZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 May 2022 02:25:52 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE186CABA
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 23:25:51 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id f21so19534473ejh.11
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D6CrZTvd23rvlgUVmBlktvH0Lw16RsXxIKRFjL+U34c=;
        b=QXnt/DwtsuMT9HJBssgL3VJNo9GWJaQqQaVDMl+s0Hm2bPiuqcNnZn5lqx/D2ev8x1
         0nb13D8QWy4GI9MsPHyK3mU6aaMU8vWqc5TO1yb9nZahDepktJeY87rv784dh5+WqCmK
         lsJiDsyIY3gmrrz2qzfxCih9mP5ndvlImauw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D6CrZTvd23rvlgUVmBlktvH0Lw16RsXxIKRFjL+U34c=;
        b=sgF9obvmIXGNps530GAtkLHPLpMVEL/oV2QmR6Y32z4zTNOiH64hUl5aqkptNQjqC7
         mbh4LFakZeUPzxTA3mDAqDzOs0MKkoSymIMaIM2Xbbuky+iMufcZd37gNP1ogoLODTtp
         OfUi3zZkzToIFUamUaIyPWwJhJ7DZ3O8DEdbuGVVUmBoh8GLj8LbzS1hTQJzsbaBvtq4
         ks3fUOqWK2+S3udL/gqEkwRecfx7ajLR385F3zpVyP1+bNyg9mT4F8qF30tznjJfwN7H
         8XALnBPz9z1NagpaG3zLD+J0km6txQB+6dM+3pP6ig8FyU34IAfIxofVFerY9AYSWBkg
         08Dw==
X-Gm-Message-State: AOAM531SDPVopiVGsqGxsUhxIlkomXOGShSYAhkIxzTbNYN58aXRtzG3
        /XreEnmBN8/9eo1CtDLXRb30Bad7hYdDLX3QQ2sAfw==
X-Google-Smtp-Source: ABdhPJyJ4eZQIwLnHC81UPge6C/F40nOdAKPI+hfZ0h+dhfs8oDDZ0QMG8iJQXX0hFsf5XrQuRjqGuQCwPKXFrhXFIA=
X-Received: by 2002:a17:907:9717:b0:6fe:b4cd:e0a with SMTP id
 jg23-20020a170907971700b006feb4cd0e0amr16054099ejc.152.1653373549810; Mon, 23
 May 2022 23:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220523160053.1922-1-miles.chen@mediatek.com> <20220523160053.1922-9-miles.chen@mediatek.com>
In-Reply-To: <20220523160053.1922-9-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 24 May 2022 14:25:38 +0800
Message-ID: <CAGXv+5Gswa7UWD-P3SwMFOHpRbZ+d10z3Aerh=zMbNXzfyA0tg@mail.gmail.com>
Subject: Re: [PATCH 8/8] clk: mediatek: mt8192: add mtk_clk_simple_remove
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 24, 2022 at 12:01 AM Miles Chen <miles.chen@mediatek.com> wrote:
>
> mt8192 is already using mtk_clk_simple_probe,
> but not mtk_clk_simple_remove.
>
> Let's add mtk_clk_simple_remove for mt8192.
>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
