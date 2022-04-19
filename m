Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972D2C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 19 Apr 2022 07:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349388AbiDSH3Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 03:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349419AbiDSH3J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 03:29:09 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFC032EEA
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 00:26:22 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id s33so2071263ybi.12
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 00:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+By+13aHrceERiXA8GaEyKGJGM9u84eKKU6Y0YD6p8g=;
        b=fvkANo2FkoqNw6ZvlzaUVbW++TfLInC9ftwHPOqz4I98vSskQfWr3jt9O4B+Fwqpal
         E91c+rV32XQU5elL2iLzNVD+LhrE3Hewf/vgwbuc2y5ut8D9p8el96K5P6328Ghj/Jja
         c1pxvGN01z0hmxF8mDy+R2GBzvbjj+lCpqrfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+By+13aHrceERiXA8GaEyKGJGM9u84eKKU6Y0YD6p8g=;
        b=YYcvujC1tnmBMYNOIwF8raQc3rbvJZa6yjPFmqCSffbCkpRnEsomEy/5Lhgmrm0fgg
         FZG+UgSmyJfEMTXCj9myVnPYc5PnvRWGgFcB1sHkvcWddQwel9NVr0MEMbWa7Nnb/f6a
         l1quJ62ytl2b13ODzXPja+FXkYbH0+Fvi168OcZ47MQLjO2mSbpoCpXnSA+AqJ4HH0Un
         9kLbrCX92LQ93a1rrq6RHbYM60BznsfywVDAAyZvipECMRIYTN96k5rgK08pYYwCbHba
         z8DyC8hH8mN1BhZZv78nrUq9XMzaFapd121p1TX+VtDpR5tqUoTWGtE1kbisF5nK7FYK
         3Xjw==
X-Gm-Message-State: AOAM531Fzh5EbuHuclEp8pQ99Mu2tXgKmhtykdYzMcsk/K3nXk6vHLJ2
        0hQ1AJ4nGkNg53B0GeN7UzGp6UaNwm6M/hR7h0P6Bw==
X-Google-Smtp-Source: ABdhPJyd6mZNo4xSs1xhZ5G3ywreqo4IEKfjKNlDn371K9W2aVL1vr9zOwSMuV+fUn1XPgz0cHx6O3I15DkvyCvkyFU=
X-Received: by 2002:a25:c708:0:b0:641:6421:a183 with SMTP id
 w8-20020a25c708000000b006416421a183mr14895321ybe.164.1650353181704; Tue, 19
 Apr 2022 00:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com> <20220418132154.7401-4-rex-bc.chen@mediatek.com>
In-Reply-To: <20220418132154.7401-4-rex-bc.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 19 Apr 2022 15:26:10 +0800
Message-ID: <CAGXv+5GQR27+iomwHfwYb0gB_QVTZSy6TaZ+1qViMmNPka3Yjw@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: mediatek: reset: Merge and revise reset register function
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, yong.liang@mediatek.com,
        runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
        allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> Merge the reset register function of v1 and v2 into one function.
> - Input the version number to determine which version we will use.
> - Add return value of reset register function for error handling.

Please do this in a separate patch. Also you are adding error messages
for when of_clk_add_provider() fails, which is not mentioned either.

Most of these platform drivers require a good cleanup of their error
handling anyway. It might be a good idea to tackle them later. Or if
they look the same, you could try using coccinelle to do a bulk cleanup.


Thanks
ChenYu

> - Rename reset register function to "mtk_clk_register_rst_ctrl"
