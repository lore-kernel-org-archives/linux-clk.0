Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874F3C636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 07:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjBGHhL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 02:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbjBGHhF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 02:37:05 -0500
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35681554E
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 23:37:03 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id v189so2011681vkf.6
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 23:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Eq83+zfltzHzioahkJ/gN8eByDKiNqSvaMwpTmz0cc=;
        b=fofbZd8M7f/nElHNqP5oEVeOB93RlhdFD1P7vohrxMeScOqN8g0wdp9JUBQ3L4hX4y
         dRxmCMtI5Tlp7mRuh2CTRoXdFKlHZmkXiltfO6rRc4bz4Gd9nXS+pyp/gjE+/GBgT9Mx
         uKBGf9AXHgJWnckS66ksBT5JNGUnKjP2F/208=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Eq83+zfltzHzioahkJ/gN8eByDKiNqSvaMwpTmz0cc=;
        b=MYH826trYUKQ4oNmkxnyDChfETLXwcK5rVj/zp5homLgbMTCA+thfAPQjelpFczlDh
         h4r/XedoOkD8/3hCLl+6WPYs6OuXkI1kV3OFF1KgQE3uioUzjJHRB15wWkwR6bqd+Eb4
         9V/OKC3h2iGj+Ho1U52x5dnrOaKrVpjRnQMrsGsnzkEUFSca7y44k39efSlTiOvdyiwn
         6tCGwo8l4bPwabWTpLVHgd8MYVPz46fhZBQkIbXFkU9nMUaHy/0+rurUyWq3iM0qBU3h
         IcDwp2Hy7MvS45kufg3+e8G/4RaYQVwRrIi0Il/5IyyeLpV84csY9xk60VsA6iC1eHA/
         a3rQ==
X-Gm-Message-State: AO0yUKV3Eve1VLxMC0nXaeqmT05GH9sIlPPruUlvFGst/YTuoxWcwEiu
        zBLhyQbmhmQ1QYklgNnpNgcUFHRx4kHf6aCYRTPhQg==
X-Google-Smtp-Source: AK7set8+oe/35euhPGKOWNpwP1rIWDVm30YdB2iF9lTAcAZMzHT6Ovh83su0kOSRO015TReuBdiXOyyFb2V1TUCsJ0c=
X-Received: by 2002:a1f:1dd3:0:b0:3e8:8f:f3a7 with SMTP id d202-20020a1f1dd3000000b003e8008ff3a7mr266299vkd.30.1675755423013;
 Mon, 06 Feb 2023 23:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-15-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-15-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 15:36:51 +0800
Message-ID: <CAGXv+5FA3TzQc0L6AEi0O_gzDmRjJ=9gZdWhQZQ2wUnVm_T2Mw@mail.gmail.com>
Subject: Re: [PATCH v1 14/45] clk: mediatek: mt8167: Move apmixedsys as
 platform_driver in new file
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating all other MT8167 clocks to the common
> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> While at it, also migrate away from the legacy CLK_OF_DECLARE and
> convert this clock driver to be a platform_driver instead.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

`git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
agrees this is mostly code movement.

Same comment about clk-provider.h. Otherwise

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
