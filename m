Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FBBC433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 16:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239444AbiECQb7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 12:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239385AbiECQb5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 12:31:57 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726B93CFC5
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 09:28:24 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id g28so31954579ybj.10
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OioOkp+daVjcm8WittR1Tk/UQnINHvqB9L6l895CXcU=;
        b=f1y/Ry6FhhCoj1O6PNJ4u5oIsObhMzvEvN+EpK/DPgP920QWICa8XWxxM25XxlWXdv
         obO4g6HLcH9ipII7mEKHk9PRypuAKrviNfo558KwuHEF8fBitw+prwaFnLfwUa+1nhIH
         /P21JCHt8jb7Swm3CCCtQhFK7/V68tTG4IlpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OioOkp+daVjcm8WittR1Tk/UQnINHvqB9L6l895CXcU=;
        b=zRlGz1s10cV0LkNeTOxs1fgmIwf5rUgHPIIiaNhzgyMnluxtNiEolkxeNWAS7eSaQn
         0jpBBUj0qOUrRp+8BaN+flBd1+G0wmCwPdFRtfs0qF2YXInzk8PuyflLYwOfpJVk6q9+
         xLO3Y+FON4IcgZIwsASH0rXSTqCcAUZK4aydJ3yTBcqw3+CXjLjkDJkMLfpX0H/oUN89
         IN8fGooKzEDMVPwc2LnyXUu/+fpqVmqKVY962Mj5i6ddFAf3HlBhUTc8kr3NQ7l9yYp5
         IQSF6Iq4LE5McctbtLVksWEX2SnzOm1sEdsGdBskST8ghhLOnQqYgrBqrsyu6KZRrKo2
         Wquw==
X-Gm-Message-State: AOAM533wq2qMNxIto64AJMAgqG5a+42IWjI2xP+B6OSGatO0Z+3J7J+4
        6hJKTMHRBIoVHHkaM15wV8j+bKx2g8VNVgCtuV8b0A==
X-Google-Smtp-Source: ABdhPJxFCzQne8oT1CxNLdigS5RxYgArTKd3K7idnnn5ydcbSbJ7D8zB9paqLbN4J1UhMNtOHiclj9HdbDT1+FIkJcs=
X-Received: by 2002:a25:4c2:0:b0:648:6a77:5da0 with SMTP id
 185-20020a2504c2000000b006486a775da0mr13553377ybe.203.1651595303696; Tue, 03
 May 2022 09:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220419081246.2546159-1-wenst@chromium.org>
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 4 May 2022 00:28:12 +0800
Message-ID: <CAGXv+5FSscb0F2VBMbSOHRneksZi-WSFTeFATDkY_JHoY=my+A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] clk: mediatek: Move to struct clk_hw provider APIs
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Tue, Apr 19, 2022 at 4:12 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi everyone,
>
> This is part 2 of my proposed MediaTek clk driver cleanup work [1].
>
> Part 2 involves moving the whole MediaTek clk driver library from the
> old `struct clk` provider API to the new `struct clk_hw` provider API.
>
> Parts of this series were done with coccinelle scripts, while others
> were done by hand. To facilitate review, these parts are currently split
> into different patches. As a result however, this series is not fully
> bisectable. Later on, the related parts should be squashed together.
>
> Patch 1 and 2 are minor cleanups around code that is touched by later
> patches.

[...]

> Chen-Yu Tsai (7):
>   clk: mediatek: Make mtk_clk_register_composite() static
>   clk: mediatek: apmixed: Drop error message from clk_register() failure

Could you take a quick look at the first two patches and pick them up?
They are unrelated cleanups that touch the same code sections as the
other patches in this series, and thus were included.


Thanks
ChenYu
