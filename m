Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14E4C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 06:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiLZG4H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 01:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiLZG4F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 01:56:05 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8FDD64
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 22:56:04 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id 3so9636303vsq.7
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 22:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nKoRBsCZk8t5IRW6q7FXOzmG70vM+tRWxxCkDHcgI5s=;
        b=Gh5L7i4lMdFGdpQcVXbyK2egNp5Z1yUnv6IBSCJIVgNBy8xEcu7FXNb0L5gzT9eP8z
         C+nRl2MuAO3DcFB2eY31UCof7isEZbIuENKeIinzKjIcHW2xZR/p0Qt8ht2DLvLrlMdA
         NtcVKDhvzKfjPGz17B1xY5nsAyPsyGGHsbTwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKoRBsCZk8t5IRW6q7FXOzmG70vM+tRWxxCkDHcgI5s=;
        b=fOrlnsmzNNAVmmrD1zauF2IAgIa2c0UmhYVnTs/9lutCZtGsiTQKmmcwdXnxFF59xp
         sYvrrdaDNBTQb30Um9vz5JUotElGWHjzXeSGL4eOrSRWLLZ+leHUfmaolHaqO/Dp5CgD
         T8cynTrlU8dY8Th41fjfPb02EfVEpKIiUOMH1TdEeNPiPeMqtRb6qfCfvOJJ/tSGBAo7
         2x4492Rc4HMx8vx8xW085JxNZk1cuPk1H4iv9P8xoqMNTtCMLFHpxRrM+Q/JNjW+peI7
         G0ZON9E1JaDLQhd8ODQA4Az9repRq8uPBxrElR/+sI01Rlux0ezw8wJ/PLnx8rDV4DLP
         vBqA==
X-Gm-Message-State: AFqh2kom1Hi5WKtldxwvbiqipj4RNtuLmkBBO8BPD3O+6q8LDXsBCso6
        2Jfv8RZKxI+BPIa1TYmyy1ATSFgayrjbUnz4XYoqfQ==
X-Google-Smtp-Source: AMrXdXtihqlxHKqphDrGOCSc3OcIsPQPPIjiFqufrI1F9HDNZwbnCYgvr87cVSS4ITP2veDTDo3oR+pGal+18iKFQm8=
X-Received: by 2002:a05:6102:4427:b0:3b0:6da7:39ba with SMTP id
 df39-20020a056102442700b003b06da739bamr2383130vsb.26.1672037763548; Sun, 25
 Dec 2022 22:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-2-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Dec 2022 14:55:52 +0800
Message-ID: <CAGXv+5EQDzgT+1VL7MDNGzHXCa4WheemP6Ysn5=3sF6Gft=V0A@mail.gmail.com>
Subject: Re: [PATCH v2 01/23] clk: mediatek: mt8192: Correctly unregister and
 free clocks on failure
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
> If anything fails during probe of the clock controller(s), unregister
> (and kfree!) whatever we have previously registered to leave with a
> clean state and prevent leaks.
>
> Fixes: 710573dee31b ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
