Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B404C636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjBQEUI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjBQET6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:19:58 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A6D3A0BD
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:19:56 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id p14so4387214vsn.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4sTtq7wFwfGuxLqDxyAbIt3LJdsd3KOuYS5ANkRiYHw=;
        b=IWaIjlWzGtsANAL7ZOY9G0Rlf7IIg1kBFaN6cS2/4Wfm4q1nVRLdAzybjw9kIFtWdC
         QuXTT8lfhSiRPRiYZNkQyHOMU+ziG8o3fw6NXxM/XgySm9IyIZGJheJIsm3gC3vkFK/H
         AZ1W/3GqLzmGhXO7wC4wThyN1L/P5FvnMxMtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sTtq7wFwfGuxLqDxyAbIt3LJdsd3KOuYS5ANkRiYHw=;
        b=5ywPXrO3pA92K7mR7b/AgUiju4W+83WJYreqFrVUmqqFu2jXxpVa1z0nTQR8U+8fLJ
         OnjfEZC4W8FDqaznMyebLTaaU3cLLSMBbB7b6pmG50WgWHnGz3mv7huGyfUnbUVa57N9
         HqPuOwlBDDqSuk2bqZtFRE3XbcRF+F/laq+azv+ytYdADMXYfuNxb39JQBEOlXbLgPXM
         uCuNAclPbehSrtQjLwAeq7bdO4++vFCAuwqXcbZjbCAe5R/9TEku/1xgCJBEQEMHE0z9
         VKhmsvJWDkAZdVSCTEZJlWcVxh3jhcRMmSwX4Y9swrxgrw586qnBI1LvECUiZGaqGZ2T
         Al/w==
X-Gm-Message-State: AO0yUKWIr2LPoxQ+y7M2iKBzrIs+1G4RYX4y8N5nmGaxIZhA1UewguNk
        zFP5UNKWYvlGqszQm2H7ArCaKpI6nYiM1RpWUHz9BA==
X-Google-Smtp-Source: AK7set+TWoZwk25NxtdG8DrZrA0ocSyVUePkzShg/KIelJ15xWrmFKfqafySgze6zE4nGexNOj4qAqkDHQsO0OWilTE=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1527880vso.60.1676607595777; Thu, 16 Feb
 2023 20:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-35-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-35-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:19:44 +0800
Message-ID: <CAGXv+5E3KCRyaRpkYab0XmT8XDZQO21RYBpKVgCcGtWmZ+dv3g@mail.gmail.com>
Subject: Re: [PATCH v2 34/47] clk: mediatek: Switch to module_platform_driver()
 where possible
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
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Lots of clock drivers have got both .probe() and a .remove() callbacks:
> switch from builtin_platform_driver() to module_platform_driver() so
> that we actually register the .remove() callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2701-aud.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-bdp.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-eth.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-g3d.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-hif.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2701-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt2701-vdec.c         | 3 +--
>  drivers/clk/mediatek/clk-mt2712-bdp.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2712-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2712-jpgdec.c       | 3 +--
>  drivers/clk/mediatek/clk-mt2712-mfg.c          | 3 +--
>  drivers/clk/mediatek/clk-mt2712-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt2712-vdec.c         | 3 +--
>  drivers/clk/mediatek/clk-mt2712-venc.c         | 3 +--
>  drivers/clk/mediatek/clk-mt6765-audio.c        | 3 +--
>  drivers/clk/mediatek/clk-mt6765-cam.c          | 3 +--
>  drivers/clk/mediatek/clk-mt6765-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt6765-mipi0a.c       | 3 +--
>  drivers/clk/mediatek/clk-mt6765-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt6765-vcodec.c       | 3 +--
>  drivers/clk/mediatek/clk-mt6797-img.c          | 3 +--
>  drivers/clk/mediatek/clk-mt6797-mm.c           | 3 +--
>  drivers/clk/mediatek/clk-mt6797-vdec.c         | 3 +--
>  drivers/clk/mediatek/clk-mt6797-venc.c         | 3 +--
>  drivers/clk/mediatek/clk-mt7622-aud.c          | 3 +--
>  drivers/clk/mediatek/clk-mt7622-eth.c          | 3 +--
>  drivers/clk/mediatek/clk-mt7622-hif.c          | 3 +--
>  drivers/clk/mediatek/clk-mt7629-eth.c          | 1 -

This one looks fishy. It wasn't converted to the simple probe library.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
