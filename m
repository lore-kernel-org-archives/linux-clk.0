Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E62C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbjBUDpk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:45:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbjBUDpj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:45:39 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C80A23318
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:45:37 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id f36so150180uae.6
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cfuibyga3kBcPYS2RK8Q0rhkGtFXfRUtTm1VmlKCtmI=;
        b=MwOJMAu4C4BwoMTuljZj8PM7bIgbx+3783h0xl3r4CoGbA/Vm1iSJy+Q2khrV+7X45
         TH3CXPm06jtpwFkh08aND5340hknRrlKu/6XiaGgEW05/m6TbgyYIfMZULmKronFDec0
         NswtJhEXJOiuXqBK1DhvPkJmO7KNcHIPuchFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cfuibyga3kBcPYS2RK8Q0rhkGtFXfRUtTm1VmlKCtmI=;
        b=YoOJeXI5zY7z8wUZK+p+nwLTgLUd3vIyZZmcOciqMA6OuueLblVGW2teZdqi1HBj71
         aLGZfSM0GW9e//srZKcIK/gLg8xFBTLbL3+W/2PIiHKtX/z2Kd+8phURagDG4qA78+Fs
         EjWmN0N+tFXxnhP5nRpyBgIgWykNl2kj1XfJh+GcYngu2bpKYmH5NiSbRkr6P0JqARwC
         3tiLUrhzBfZdSOcfYbGORyzGvgzTuzBiIl5pJP6ebekiNOGf4dpzCGjaLr0hqJJtbsBt
         2jJ+D16ksTyFU06Y2txndG9s7oYx1Q+pdjmCUy051WsnkSyJdHNb5ulbbC9RYeBMQ/Wk
         n9/g==
X-Gm-Message-State: AO0yUKXMMatzX5cheacvg/QqwxSGof1+MZDw1uxnsaojsjZJtgZjfVE8
        LbtYaRr12tIiKDTr5NjZ+ip2hMW7px7pej34OKMPDQ==
X-Google-Smtp-Source: AK7set9sssRYKvNDSP4z192UFAq4Q6RMujJfk6fKp46gtcIEHXpa2JZkEjr830ufkrHiQa368xDo2jzjEb7Un/z/6pU=
X-Received: by 2002:a05:6130:3a7:b0:68d:10f8:b068 with SMTP id
 az39-20020a05613003a700b0068d10f8b068mr630828uab.1.1676951136616; Mon, 20 Feb
 2023 19:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-4-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:45:25 +0800
Message-ID: <CAGXv+5GC6nhgMpYA+Zrajxy8EYgkzL957AzpoCgu4+V6Z9PO9g@mail.gmail.com>
Subject: Re: [PATCH v3 03/55] clk: mediatek: Migrate to mtk_clk_pdev_probe()
 for multimedia clocks
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce duplication and simplify all MediaTek multimedia clock drivers
> by migrating away from defining custom probe functions for each driver
> and instead use mtk_clk_pdev_probe().
>
> While at it, also add a .remove() callback to all of the multimedia
> clock drivers where missing.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/mediatek/clk-mt2701-mm.c   | 31 +++++---------
>  drivers/clk/mediatek/clk-mt2712-mm.c   | 31 +++++---------
>  drivers/clk/mediatek/clk-mt6779-mm.c   | 24 +++++------
>  drivers/clk/mediatek/clk-mt6795-mm.c   | 55 +++++-------------------
>  drivers/clk/mediatek/clk-mt6797-mm.c   | 31 +++++---------
>  drivers/clk/mediatek/clk-mt8167-mm.c   | 47 +++++----------------
>  drivers/clk/mediatek/clk-mt8173-mm.c   | 58 +++++---------------------
>  drivers/clk/mediatek/clk-mt8183-mm.c   | 24 +++++------
>  drivers/clk/mediatek/clk-mt8186-mm.c   | 56 +++++--------------------
>  drivers/clk/mediatek/clk-mt8192-mm.c   | 29 +++++--------
>  drivers/clk/mediatek/clk-mt8195-vdo0.c | 55 +++++-------------------
>  drivers/clk/mediatek/clk-mt8195-vdo1.c | 57 ++++++-------------------

>  drivers/clk/mediatek/clk-mt8195-vpp0.c | 54 +++++-------------------
>  drivers/clk/mediatek/clk-mt8195-vpp1.c | 54 +++++-------------------

This doesn't apply for these two files. Can you rebase onto clk-next?
Stephen hand applied v6 and edited of the vpp patches, not the final v7
version, so the code is slightly different, even though the functionality
is the same.

ChenYu
