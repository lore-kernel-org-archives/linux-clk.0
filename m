Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DB4C46467
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 07:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiLZHHY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 02:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbiLZHHX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 02:07:23 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7992625
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 23:07:22 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id c26so2211503uak.5
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 23:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kc7UX5qQFKgxUp5GIPhkGqMn4OUOgloWMZmKzKsecYc=;
        b=F36ks6qgrclKiSq119LjQgu9DDYLk5CwlQlwTUbhE5kBes/fyuLFzf2adOZlVDDvZH
         4pwMnuHAkPHbxR/8o/VFR5Yswpv3I4g9VXlfbDbGA015CZQY333kwSZLDrNcrlzxfxCs
         oHpmv6xmktdygibJiDmwyOOUKvYzvkDEUmm1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kc7UX5qQFKgxUp5GIPhkGqMn4OUOgloWMZmKzKsecYc=;
        b=nITJEbu5fB/INqrxjLLtwxeTdyteldH75JKYY+48lKd3Psa9iMAbCI3YC90j5g3mZv
         1SG6uHZl4ZzGSpY3ewvR+CYZtXiE8oE4ahdsOTn67me/hWMXVQz+FYpue1B5u0KiU80Y
         2Mg1VU9HTQkAp/PZt6tsKtCR0OnoyCYg2GYuM3B/pb7zudAZQNkZbzK1bKXQ62sNUHBa
         PTlrz+915CS5ybi2v2HGTRnUBHreHIWCAZ5/5vP2G+YTdhMmiHVqPeBjc/g5j3si7U8T
         iyE9dQH6w3D+wTeULvFjJLw14Eh8o5ipufJnssaYB3nGXZ79Io2CLK0aVLOKJ+4NR9vV
         9qBA==
X-Gm-Message-State: AFqh2krxQct2s+pHbyYcoXSUPUh3zGe35BrAIkEYt2A+K9s7kLQSAnQ/
        AiiFEaURoRX1eVM3mIa9oQglLQimEwRcqF/9pxvdyg==
X-Google-Smtp-Source: AMrXdXv2VqQXGVz7UsmxIS87BTXQNUJ4d3yeAlvbMCKPSnAPa13HYbgf2LvkaebhY9B0OY4hysESqwW4AfdqoejLjw4=
X-Received: by 2002:ab0:7411:0:b0:418:b849:8187 with SMTP id
 r17-20020ab07411000000b00418b8498187mr1585399uap.43.1672038441665; Sun, 25
 Dec 2022 23:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-5-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Dec 2022 15:07:10 +0800
Message-ID: <CAGXv+5F8QZGc4oDKJAGbpvubqiewvngURpNhrenS3pcGQNrOYw@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] clk: mediatek: cpumux: Propagate struct device
 where possible
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
> Take a pointer to a struct device in mtk_clk_register_cpumuxes() and
> propagate the same to mtk_clk_register_cpumux() => clk_hw_register().
> Even though runtime pm is unlikely to be used with CPU muxes, this
> helps with code consistency and possibly opens to commonization of
> some mtk_clk_register_(x) functions.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

As with the gates patch, could we make the |struct device *| parameter the
first one? Also for this case I think we could even drop the
|struct device_node *| parameter.


Regards
ChenYu
