Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264DEC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 21 Apr 2022 09:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387425AbiDUJR7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Apr 2022 05:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387479AbiDUJRp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 05:17:45 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80389EBF
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 02:14:55 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f16645872fso45359067b3.4
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V1uWVuZ6+A0BASrhtcS2ivTUwFpVOwbpQq4d16gjWgQ=;
        b=KfviBbNUxTMiBSnCXE3OrnaDK39G+p2hghIMD25j0KUp7ZLrh+Bw0OZCCeC1hIrSfM
         pTwQMys9R1SkEgZPN+U1YplF3DXwzr61jkkU3Mwwa78nUXpDeRMWrFKrBUAfDTLhyPsM
         ciErq4lfgYuxNGVDSG40Gj/QRvjJLmtgAGJLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1uWVuZ6+A0BASrhtcS2ivTUwFpVOwbpQq4d16gjWgQ=;
        b=H7wfya+3ZgmnLN9/lTTiPBRTpBhKLCP483KjzVTrz1FNLdxhBnYtrmyc3744n1oBwB
         hicFhv34mpcxo1ZH1Zt8RoF7tQYinOxM2M1nOYFAq8bvP31joyVqOLLfHrLvY+7lYEGC
         aiaUBBI0Sn247TcmOzRmSDcJELDe452e8rHwUoltWGEiUX5ak+rJhkGJj4vGK1RrVNqT
         vYui75QXKgMrQtUjg6rWxhbJ/YA3lKPBBQYX/8fP+WKl8S1q/dtL+0yRjONXN7SpzXDE
         7rpk2pCKpmaxN2XAuqqdAmbtRTBvxZ4QZFHOq4sRYl8j0Wahh+A3pHK0xhNDvehFT+/y
         Td+g==
X-Gm-Message-State: AOAM533dUWvrtHBtgtBgn+4sPefZM+imdW6WyLTbvqQqT++teiJqVmYF
        zwTabjMoJydJMLcBt1qt0sIPrQSvvnKkwGvMlaoxQQ==
X-Google-Smtp-Source: ABdhPJy9nYqH8i9c1NYzIrrrk2RUAbZ7bXTS0+WD7NPVL44tYER6HZDSPvwCms4t/XCM0TjMDZvIAjxJ9Py7xiUDcss=
X-Received: by 2002:a0d:eb46:0:b0:2ef:4946:544 with SMTP id
 u67-20020a0deb46000000b002ef49460544mr25008925ywe.286.1650532494832; Thu, 21
 Apr 2022 02:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-6-rex-bc.chen@mediatek.com> <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
In-Reply-To: <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 21 Apr 2022 17:14:43 +0800
Message-ID: <CAGXv+5FL=YdjonwBWV9ZkRf3jstCsxCEonmH02g2+1PAopObYg@mail.gmail.com>
Subject: Re: [PATCH V2 05/12] clk: mediatek: reset: Add reset.h
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
        chun-jie.chen@mediatek.com, runyang.chen@mediatek.com,
        linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 21, 2022 at 5:07 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > Add a new file "reset.h" to place some definitions for clock reset.
> >
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>
> Right now, you're adding the enum mtk_reset_version and *then* you're
> moving it to the new reset.h header, but does that really make sense?
>
> I think that this series would be cleaner if you add this header from
> the start, so that you place the aforementioned enumeration directly
> in here...
>
> ...so we would have a commit that moves the mtk_clk_register_rst_ctrl()
> function from clk-mtk.h to a newly created reset.h, mentioning in the
> commit description that it's all about preparing for a coming cleanup,
> then the addition of enum mtk_reset_version would be in
> `clk: mediatek: reset: Merge and revise reset register function` directly
> into reset.h.

And probably name it mtk-reset.h ? 'reset.h' is a bit too generic, and
I'm sure there are multiple files with the same name throughout the
kernel source tree.

ChenYu
