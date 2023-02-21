Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56C5C61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 04:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjBUEE3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 23:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbjBUEE2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 23:04:28 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C15D13D6A
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 20:04:27 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id u14so2517764vsp.8
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 20:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676952266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GFPspBBy8xRufvz9CrVUPQBGieB+Oke55A7SPp7VcJM=;
        b=R5dfSm55zBS1tfl/U+ty43hb5qh/e8QSIHUYJq08Bvh2y7vb7a1Ab//RpRC8Bs/TI0
         6TQx07CRBlQ+YuqI2bdCR0+VTltSmArbpwH+x4ZDNSGynnZqKB4j7J/ynXHC82RxwKYv
         9NifwhJyspIjPHym9ORnrV0e5HPsxFjA7tYew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676952266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFPspBBy8xRufvz9CrVUPQBGieB+Oke55A7SPp7VcJM=;
        b=Spk+9g7sbaVW32kyVEfU/iuW+F8aL4VA8xau5BKk5/H6m2vY43KpsnofQ6OyEC7IO0
         7hWYynHe7MD7psgiFDo2r/bad5mkbLQ5THql61uqrAbh8TR4EzjQ4WP1DyA4j7EDUUID
         yauxwSZXFLWIl/xXcWvAJwAopyvYkQdSOiSfD5rZsf80a8ouPW/6FlmpSTJ7jnB6jChi
         geWSOhm7V5nZk74XGTeWL2/0yVakK+iJYof3hKJ6RywdYwHiujio/TLtoLsrhPbAiL1e
         VUne3it59Q4yVW/XV92YzKn7ouOGP+IRHG667D2fPcYaQK9F1Mp6zX2irQt1LlYa6hmf
         guTQ==
X-Gm-Message-State: AO0yUKW65glJJZGuh1y4pbGbsLQOQ6Cge/pnqPRlYEgoXbPX/KRZuW3o
        MgeFeSFp9+40ZFAR63QEJ9wRM6Qs6/Ogc52BrVPydw==
X-Google-Smtp-Source: AK7set9hjJHUXRV5a23fFX2CF7M2ZWALeU2SIlHI0oUS3F1iYlKirBG0RLvsqmYV+ZISRZOZozFJ+0+oYrW0V7+H900=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr836863vso.44.1676952266287; Mon, 20 Feb
 2023 20:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-56-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-56-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 12:04:15 +0800
Message-ID: <CAGXv+5EpnmBu8iAd9Ec0AAHvDUBRUUJx3uzv2MkaRLSRJfFD-w@mail.gmail.com>
Subject: Re: [PATCH v3 55/55] clk: mediatek: mt8135: Remove __initconst
 annotation from clock arrays
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

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Being this a platform driver, these arrays are not only used during
> init anymore, but also during runtime: remove the __initconst annotation
> from all of them.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I think this should be squashed into the previous patch. Otherwise with just
that one, and with modules disabled, the driver would break if unbound
and rebound after late init, when the __initconst data has been dropped.

ChenYu
