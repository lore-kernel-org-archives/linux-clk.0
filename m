Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740A8C3DA7C
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234762AbiL3ITD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234740AbiL3ISl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:18:41 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0CA1A218
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:18:40 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id k4so16546365vsc.4
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=snPiKqnaiN1WiMwQdheLRI2dNEuAuVQ7rQXTqdJG2aY=;
        b=jOmRVnnt+xickPH2XkTJztkw4Zi3hvRDUW1Z/bNDeaX/KxiBpbg/w+OqC5eYwzEGWa
         GE5WlyusMhcZshXyAKDY7DRT0Pd+InIwgp6eJMxiod2gxMAlfrcoUF7AWQzxWmeD6q6F
         N8nbJ3Y/8TtDzxqluZWAuxAOvDuq2Q2Ov7lr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snPiKqnaiN1WiMwQdheLRI2dNEuAuVQ7rQXTqdJG2aY=;
        b=JkAPRE1EvTeB0GXvKs3ktr9sQH64P0pNVgnTc7BAfqVSjEqI3zrspvdGQLqc8H3LSj
         frJ1Vgyrn27Aki+xQM6ruPjZdi9VSMm8TNBdAU1gDvx9r9cW1H1g5E/LWpKZuZe63sUT
         M48uT27o/UtZAIQwFvtKNc85DXIfVV4GECjAzZ7s0nOZB6n6VyQ42rW4xcjuZnZX6ADh
         k2CCXpisvmJVA92xjWJWEDBrWXJ24svkS4c5ygQ762OJPx+IB/d3PmIICVjp6PsHNQ6x
         6Lb0RCutjPdSpO7wUV6/BFOpoWplZY5wgOs1nD0Cpe8xJBVkjlzFNd7h3PSzIwPKeXMm
         w7pQ==
X-Gm-Message-State: AFqh2krUjTFsKvh68fo8GU7ZLAblwrOlWSI3m+E6agZ18CgvNTANwtaG
        Kp1DFjvrMVZmEIQdA+AHt8KpjKWMIMAhzN8eJyioqQ==
X-Google-Smtp-Source: AMrXdXvbPrrXMd2o6CdhgGa4mWDoeuZQzpLJ9wWmLbJ6KNXxRcDvEAw+MTtWhDWsPccnaAgosvj2akWxnseLI2V4qJo=
X-Received: by 2002:a05:6102:4427:b0:3b0:6da7:39ba with SMTP id
 df39-20020a056102442700b003b06da739bamr4341845vsb.26.1672388319884; Fri, 30
 Dec 2022 00:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-20-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:18:28 +0800
Message-ID: <CAGXv+5FzMe_W-p2NW2DWtcPY4KVUVucpc9iL322GOB4bY=w8jQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/23] clk: mediatek: clk-mt8192: Migrate topckgen to mtk_clk_simple_probe()
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
> Since the common simple probe function for MediaTek clock drivers can
> now register the MFG MUX notifier, it's possible to migrate MT8192's
> topckgen to that, allowing for some code size reduction.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
