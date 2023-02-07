Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ADEC636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 06:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjBGGLm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjBGGLk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 01:11:40 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AD1303F6
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 22:11:38 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id m1so13322939vst.7
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 22:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zP2ygbVdDON6yUIfexoROgjUPhLPhR3gUrJen46Rt4k=;
        b=njFbTgS2Fnz3eXZQG2IIJq44fTew4djBUK9I5vGRHno7jZJxYxJ1F+n/A6/9kRBU5+
         V5jzuzeDn1fRqBRoQ9ckiOYh3BaOU8U9oH1FdOkOana/r1CA4Db6gTTxjrwrr7JFCVWz
         CGBPbLeqbDDy2BWvEu3oUXn4Liaqav4bL4kdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zP2ygbVdDON6yUIfexoROgjUPhLPhR3gUrJen46Rt4k=;
        b=jXBHipByuG2/iARcXLjlRAtVhG/DXk31M6zVsrau7N5FTtiaqIPlMh/QrNIFxtY7NH
         iI/OijhQGxPFitzqQKts29YAsWZh0W4xJoe/QMOdN7MWjeknMvHOE9MtDo3MQYKhoqnv
         ktrmWgi6TY6VAW+PyvM7nUjWmAaXR73UE1Ts6qo4CUqn/UH1+oB2XEgo3mFGYv3xLVSi
         7CM/Mymr5FaYm4siYNJj+Kr50A7uXJVspX3SkBK9b/P0nh2wfMtaQrYJ0Yad/1updWvy
         znLtJ+zEGRI95EiudFusoLE0nqwl1nwZdI3LAzOgz5iQDOK6MfZiXOPhii406x9ZxOs2
         sk0A==
X-Gm-Message-State: AO0yUKVbVfl9wHZZ+vi1nAxlvwyqzufNLgAHhxTvaZjDsbMiMu9Rvj+C
        qTmjSbVyr1AcEFovFk2GAjV95qC2UsnvnjbHfCCjzA==
X-Google-Smtp-Source: AK7set/rPPS4UD3H+wPsyBdYQgSN6AGYtE3iy5mIdz5UsLRmTWNhHy9DVvsGzrlJ8515poglceCc81LaO1hE0/O0uFg=
X-Received: by 2002:a05:6102:3d18:b0:3f7:93c4:9e56 with SMTP id
 i24-20020a0561023d1800b003f793c49e56mr545453vsv.85.1675750297266; Mon, 06 Feb
 2023 22:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-5-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 14:11:26 +0800
Message-ID: <CAGXv+5FxX4tue8owuxbrA2NNxmQdCnYj7orbam8AUFismTA1jw@mail.gmail.com>
Subject: Re: [PATCH v1 04/45] clk: mediatek: Add divider clocks to mtk_clk_simple_{probe,remove}()
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
> Add support for divider clocks register/unregister in the common
> mtk_clk_simple_probe() and mtk_clk_simple_remove() functions.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
