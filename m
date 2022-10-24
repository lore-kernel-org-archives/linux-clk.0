Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62624C38A2D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiJXXsz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiJXXsV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:48:21 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3744E80F44
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:06:18 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id h4so9216671vsr.11
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRmMvviWEKka4D3lrnvrAAXXSnpPgxlIxCd5d8ajOxA=;
        b=A67982Iwiu+nKS3HmSgbb4omBV1yndzR+UlGQQ35HJQtbMRvvbqZPLw07SZkUDvOi1
         4k2oZtG80K4ZadZbBMhty3XVit5fXX2/UFyTf3fjwN5pN5HgaWMY1n858PDOJQ4gRb6N
         9rWxIK3MP9J44LaH+Xpz1sLYVE0LEw/ybcHPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRmMvviWEKka4D3lrnvrAAXXSnpPgxlIxCd5d8ajOxA=;
        b=ylLh6h+hhdKM3v6dtvFlHlmMExeyJQkSFQoTusPGp7WRB5ZT29M5zfI25dTeeb2EbZ
         YDH4Xn3IqD1xyF9aMLd7mSVU80+GelvX1Q5LyYORSvtiIkhIxov9nBcLNKLl4K/KUivt
         G8gMr1t2HVF92M2exrp3VlJgWkXt7MDMkFmyD3t0Q+ybt0uibQ3RJpTO75VQAYA9SaYt
         DmLETBvGDTxFHVUch5fjPon0fv4QgbS6hzQMJUl98jCOAQ9IXyyaZWuPrLcy5S2BXZ47
         7JuSlaEqAImv66+P1XUi+mWnx4xTQp94k/uqDGTUcCvWPsvN/IzRvaNIiBeaund2RAeS
         Z0vg==
X-Gm-Message-State: ACrzQf1cRUlvG+hEdQkphfEJiRjUYXUwgWF5YyLEWIhrgiykZ6Ts+vkS
        jBzmmmaJT7V8inyS87knZN08nD/6SDgvTcQ7wfHxsQ==
X-Google-Smtp-Source: AMsMyM4ejiEt/3Clzr0qB4Xhl44cniyZH8Auxb0kyU4oXVS18eKRuwJRA9eSGi8jRlUeVbBw8It9KcG5DdVKmgSgCT8=
X-Received: by 2002:a67:ac0c:0:b0:3a9:e899:3b9b with SMTP id
 v12-20020a67ac0c000000b003a9e8993b9bmr14117825vse.9.1666649142869; Mon, 24
 Oct 2022 15:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-5-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:05:31 -0700
Message-ID: <CAGXv+5Gx0PHQdfrtrUicioP1VxuRd4U24PZV2kFLus_OyrP7fw@mail.gmail.com>
Subject: Re: [PATCH 04/10] clk: mediatek: mt8183: Drop flags for sys/univpll
 fixed factors
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        msp@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The syspll and univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> sys/univpll divider clocks, used by MUX clocks to provide different
> rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also solving the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
