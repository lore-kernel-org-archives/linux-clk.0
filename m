Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FCAC636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 05:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBGF7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 00:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBGF7x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 00:59:53 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C46C29171
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 21:59:51 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id k6so15173548vsk.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 21:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYCBrgiptcIccQaoR1yFr00IgFPMzrEIhu4IjEnhkgg=;
        b=LlHXujmHCp9zs7IKT97LWrboG47EwQubQ7sfNVf5qAHR7BJ6WLHnXHsdYtwz5X0L7g
         JKjtaDMFiTLvm8F3kXA94FuvEwMrHWfDOvPBUchFS9xIqdKB3B9J2ioNQmzUkTsGCk6w
         UX9ughR6BhREXrhALLqD84j/T4ipl5ae+JCng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYCBrgiptcIccQaoR1yFr00IgFPMzrEIhu4IjEnhkgg=;
        b=TdFG6JUcN5Z2kDD53vQ31E5kiUS3PeyPi62thhu4yOGv31A4751KrQVKPQPMWBsikt
         V8pFIsVMDkTLvK7c6QQXitghbDJA8IiHrhkNxoYi0JCz8ixyDwqGntnRVIw29RtEhT2K
         +SnA3e3buyVk/ewkPZoSqLdf/bia7ZQ0J6EvNbCRnwFXnMaTHgLgYdAhYnBT9RdbPqht
         M4XE2gyDbxM+4ZbS4L9/cH7nJV3O3kvpATmXVIefj6kWtSC8PFL9dqrz2iwsCQnFlPiV
         tOlfJYYSWGLy0kmLer/HuWxEmaW+len4wVh0xp4PNto8I1iOaKdm+4YZuVoWtSzTMXJb
         Zdmw==
X-Gm-Message-State: AO0yUKU+pgfm4qAm+z3gDCQTVrgDhPW2OUhpHKT01nxW5Hl1PhHGM/0S
        cHAgl/tQG+vl1JgbJQxP+twxUh0ap6ATBUBLsOWAqw==
X-Google-Smtp-Source: AK7set/0KGVG7XttQqf4/FRIWSRB4YO2NnGxWgc+i+WRT7rd5XTR77t3wZBV9Di5qnEkjLhLnkylNIoCRLfCU28oxWw=
X-Received: by 2002:a67:1904:0:b0:3e8:d5a8:3fbe with SMTP id
 4-20020a671904000000b003e8d5a83fbemr441325vsz.9.1675749590556; Mon, 06 Feb
 2023 21:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-3-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 13:59:39 +0800
Message-ID: <CAGXv+5F3QqtjJ9n+OE0p+xT78Kau_KQ=dsU4=K3AEzCv_AEv7g@mail.gmail.com>
Subject: Re: [PATCH v1 02/45] clk: mediatek: clk-mtk: Introduce clk_mtk_pdev_{probe,remove}()
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
> Introduce functions clk_mtk_pdev_probe() and clk_mtk_pdev_remove():
> these will be useful to commonize the probe and remove handlers for
> multimedia (clk-mtxxxx-mm) drivers as these are registered by the
> mtk-mmsys driver instead of having their own devicetree compatible.
>
> In order to do this, the main logic of clk_mtk_simple{probe,remove}()
> was moved to new static __clk_mtk_simple_{probe,remove}() functions
> that take as parameter a pointer to struct device_node because when
> registering the clocks from mtk-mmsys we want to pass a pointer to
> the clock driver's parent (which is, obviously, mtk-mmsys) struct
> device_node instead.
>
> As for the clock driver's platform data: for the devicetree case, we
> keep using the standard match_data mechanism, else we retrieve it
> from an id_table.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
