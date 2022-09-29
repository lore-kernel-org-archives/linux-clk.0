Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109C1C04A95
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 04:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbiI2EYn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 00:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbiI2EYm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 00:24:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BC52642
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 21:24:36 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l14so290654eja.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 21:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oRUKiGGp9HtYjOe4fyj+Bgjh8QBWVByT3GW/OPGOEZo=;
        b=Bw1JDcGREbj17+/4/sFd+PMZLK8ZiDfPeKoHmvDF2GaNMMdXJbhvNsy9e1H9I4FsqD
         j5ZgLciRrvE801bdE6lwdlE7mynvwEHe1hejvDWZnzJSrzhPJoJHfcOoSuAa4+Xdm6fI
         XAsdKg884QdAoTERymBE0zqVpmYhYEb/hdQ7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oRUKiGGp9HtYjOe4fyj+Bgjh8QBWVByT3GW/OPGOEZo=;
        b=om0AbEAdH7XfUNs2F0bMQrgD6/QubpUEphK/W0EZNy73KdOc/v4fWGI19X9V3PtctV
         5N0UbRhyr2eKpuLh+7C5PvGLcNBfvAMS9GG0CT0LBNDktSCRClC+B0ADFfhNzodWtPK5
         H0e3K2EFQMJpAnS2ywj/LJa5U+dLovsCOpQtqIReI3zHnxbnXQulI3X8Isn4wMa2Z17K
         97ixgIl9zddBu1/jTkE05oNSeLYUZen0L/feyaQwNeFSqgmhkzyYu+AG8DdNh/2AhoRq
         RU/F6oh5jAmMBGNJ/Lkaxf19n90GhDfdDKDa7qHM+qdAUcgAIzu31UetIcjuUuDbIBGk
         eaIQ==
X-Gm-Message-State: ACrzQf0+zafVq7iZ8/w8Gz52ocPoovMWhadPltX381FM+pvlYGJ4cUxh
        RLrfPOwVvMthY5SgwfXGeveKbzvcJZNhBDwO51IT4w==
X-Google-Smtp-Source: AMsMyM6sJ8kAe/ae+WP7oeH7EoX6gvjCULwT3auEOOBJwoosQADkdiNj98RPfn1cGz3sRpqDYTIWOq8vAE3QtzCNzVQ=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr1006728ejc.323.1664425474991; Wed, 28
 Sep 2022 21:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 29 Sep 2022 12:24:23 +0800
Message-ID: <CAGXv+5Gwy-FTUTsE0HwzUvfHPJ4XOfiZrBcK9ToZ2S0PHHnHAA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] MediaTek SoC safe clock muxing and GPU clocks
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, miles.chen@mediatek.com,
        rex-bc.chen@mediatek.com, nfraprado@collabora.com,
        chun-jie.chen@mediatek.com, jose.exposito89@gmail.com,
        drinkcat@chromium.org, weiyi.lu@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 27, 2022 at 6:11 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series adds a clock notifier for MediaTek clock muxes, required
> in order to achieve stability for GPU DVFS.
>
> The GPU frequency scaling mechanism requires us to switch the GPU
> mux clock to a safe parent which frequency is always less or equal
> to the "current" GPU frequency before reprogramming its dedicated
> "MFG" PLL.
> This is needed because the PLL needs time to reconfigure for its
> output to stabilize (so, for the PLL to lock again): failing to do
> so will lead to instabilities such as glitches, GPU lockups and/or
> full system lockups.
>
> While at it, reparenting of some GPU clocks was also performed, as
> the clock tree was slightly incorrect.
>
> This series was tested, along with mtk-regulator-coupler [1], on
> Chromebooks with different SoCs (MT8183, MT8192, MT8195*), resulting
> in fully working GPU DVFS with the Panfrost driver.
>
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220628120224.81180-1-angelogioacchino.delregno@collabora.com/
>
> * MT8195 does not require mtk-regulator-coupler. This series, along
>   with [1], are required to perform GPU DVFS also on non-Chromebook SoCs.
>
> Changes in v3:
>  - Clarified commit description in patch [05/10]
>
> Changes in v2:
>  - Added comment in clk-mt8195-topckgen to keep the mfg parents
>    documented after removal, as suggested by Chen-Yu
>
> AngeloGioacchino Del Regno (6):
>   clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d and propagate rate
>     changes
>   clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as
>     generic mux
>   clk: mediatek: clk-mt8195-topckgen: Add GPU clock mux notifier
>   clk: mediatek: clk-mt8195-topckgen: Drop univplls from mfg mux parents
>   clk: mediatek: clk-mt8192-mfg: Propagate rate changes to parent
>   clk: mediatek: clk-mt8192: Add clock mux notifier for mfg_pll_sel
>
> Chen-Yu Tsai (4):
>   arm64: dts: mt8183: Fix Mali GPU clock
>   clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
>   clk: mediatek: mux: add clk notifier functions
>   clk: mediatek: mt8183: Add clk mux notifier for MFG mux


I've queued all the clk patches up here [1] and will send a pull request
to the clock maintainer later this week.

The dts patch needs to go through the soc tree.

ChenYu

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1
