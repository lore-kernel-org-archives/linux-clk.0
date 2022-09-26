Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715D2C32771
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 05:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbiIZFJm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 01:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbiIZFJk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 01:09:40 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1064A65BC
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 22:09:38 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id z13so11589149ejp.6
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 22:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vrb/QOBCOlwnil4xOu2RseRmD1KSKb1sCTEzWBoOr7A=;
        b=CjyMr8K5Wev1LqZH4hcWNR4hCa7hpv03fz6sO4CQoigIqQfzbByI+PeL62qb6OS5f6
         B6/UPRBG20hOIgzFCctOTxKGY7MWWmlbPU/fK1U2S6LaPHoAmR3Xm7v0Rx0GkuSc2vyE
         VrIRqSRv6Ih1HnvvylK+fBM5Zj+XYDUmwevzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vrb/QOBCOlwnil4xOu2RseRmD1KSKb1sCTEzWBoOr7A=;
        b=MEeGCtYzAe4b6CKfWgi6e7X2X68/g6IvfPl0tEDDN0lQj25jM+xS7pMJgJP7YWHhlc
         BWzRzvxQz2fysTdaGE8PefgGMumBT0Zxj9riZYAK9BkKsTWtiR7YzDwesVZz34Vv/Wop
         IycoPTX7eg5pWUO/vemkZKU4mBZGsbn4PN+t/K9KbdzS9y6wc3LML12W6/U+ytGTb5pH
         P6DBfW3mP4sYRaPD3lC80b4fiw1y+u3W0rGM13FrV93hDzW+aJHWQ62aZf27QL31/7Lo
         9kyL+njFUFgMCPZgan9f92pSTWw0gn3aFBQAkQL6rPfUEYYIihB11cF7QfJ6Q0tmub8I
         4K6Q==
X-Gm-Message-State: ACrzQf1wYiNT4Tw/oLZBmGLwjoB2DA4Mv46wClpj+FIOaCwdf0H8NI7a
        LRvgY3SoWVzS0I/8218kFvVkmAwjhp7CtxGWIg59jQ==
X-Google-Smtp-Source: AMsMyM7cfU1/JdOhkGvuQyhuRRKePnKXOOE9bin+YefFjefQP/PV7uR2GeazW9Tvxl2PgbNtWjbFZGX0+Elzhi37gGQ=
X-Received: by 2002:a17:906:8455:b0:773:c45b:d970 with SMTP id
 e21-20020a170906845500b00773c45bd970mr16504544ejy.46.1664168976587; Sun, 25
 Sep 2022 22:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-2-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-2-4844816c9808@baylibre.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 13:09:24 +0800
Message-ID: <CAGXv+5GJrjxG0pEGqseEacz_KFCRhWJSiLoiwuwwUTaSeO0RBg@mail.gmail.com>
Subject: Re: [PATCH v1 02/17] clk: mediatek: add VDOSYS1 clock
To:     Guillaume Ranquet <granquet@baylibre.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 20, 2022 at 12:59 AM Guillaume Ranquet
<granquet@baylibre.com> wrote:
>
> From: Pablo Sun <pablo.sun@mediatek.com>
>
> Add the clock gate definition for the DPI1 hardware
> in VDOSYS1.
>
> The parent clock "hdmi_txpll" is already defined in
> `mt8195.dtsi`.
>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
