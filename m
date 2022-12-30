Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B26C3DA7C
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbiL3IN4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbiL3IN4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:13:56 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40D418E25
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:13:54 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id 128so20596972vsz.12
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BW5cwmKaNCVLs9nRl+n6ibFBEWSsqnffbwe6y2wYCQ=;
        b=nGPjclbubWrpPTtxt8FKiL1BFgbol42KKil8hX/0VmVLK0i8/1yA/SP4ogoO1eSLpR
         OFPrEwUbyH9DylcRkRPvTa8+iLlXVqsLLYJ2/h0vxjUCsgedaM3/JW8hI8EkozA1MS2O
         UnOJedj+iKcCyGhpeAaF5RccFV3t/B7LWrrAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BW5cwmKaNCVLs9nRl+n6ibFBEWSsqnffbwe6y2wYCQ=;
        b=uGiQQ+1shJa9f/rxFmozS92gK/cXO0I+IwMOsZBc0AuX/YRWAl9eGqd2LotBLVBbSu
         Uc6TFJ3nOi2HxDr/nXUe9w4E4OKgrSG/dTY94vRobocpCP+hAJ8P/dV4Ki3W0XJ0c3p8
         p54tEBUxTmZKngHqt7EAnqt6o5fHnLq84kfreo0+4KSCJ8qW/0jnGpUYoGa6vrErhLjR
         u/fRxfh73G0cAcywSVovWdtUaKhSd46PqH7/v18GG2q013bGWtoTvzeDjK3d23ox6LXa
         IX2k4sgYGyPFcO3SViDyaiXb5Ag4iZkmu7uJGLBmbUWMPfp3T+rIb59lg+NL9icAKPPn
         kKgw==
X-Gm-Message-State: AFqh2krIuWw46p0xZM3Jhdu8ct6MOgZlTXuWipN9qo/yF/KSRFzx3LFM
        vMLmysP6dCeUlukvB5Fv5KnoXlymusfKG1A7i5mGCw==
X-Google-Smtp-Source: AMrXdXv7CHafuypiXlQL438o48Sf7M0d8IvDMBWqWekllpFk+gsVlFTfotR7uZXiHjjbfDtmSkoKdZZraclEPUo0lLw=
X-Received: by 2002:a05:6102:74b:b0:3ad:3d65:22b with SMTP id
 v11-20020a056102074b00b003ad3d65022bmr4419162vsg.65.1672388034106; Fri, 30
 Dec 2022 00:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-22-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:13:42 +0800
Message-ID: <CAGXv+5Eoiaf7RovpHeizYxpFO-xw2NHneig_CUc4cxL-i7Xhew@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] clk: mediatek: clk-mt6795-topckgen: Migrate to mtk_clk_simple_probe()
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
> Migrate away from custom probe functions and use the commonized
> mtk_clk_simple_{probe, remove}().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
