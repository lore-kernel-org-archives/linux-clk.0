Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D13DC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 03:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35A976128B
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 03:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhJSDHU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 23:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbhJSDHU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 23:07:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93244C06161C
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 20:05:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i24so4095195lfj.13
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 20:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2RwHxSx3TiJnEJ/9dbX2TWefdd9wWbyowa5HQ0W9C7Q=;
        b=mNGO7s6puZSQ2VapweLJ0fNTY5XwkSE3LnLZo/QEeCE630qcjlF/cihEYJZW/EVF/5
         CbZj0rMMLs7/50AMBAyFCryuVy8QXuRza6IR2f/QIphmxiEqQtGKaJHDsLXqHxFYyWda
         ymrNT2gwMDK3w6Dnxva0EYDnEa8VwkywyW93o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2RwHxSx3TiJnEJ/9dbX2TWefdd9wWbyowa5HQ0W9C7Q=;
        b=lZb5NNmgHOkEMZaysXJNd45sXyryYFKX4CMF71Xj+oVhW1LtMB6TirFzY+FHCHM5IY
         5q2xysmn6vmq46jpKlY5h+xQSlYIWYGavTa14Pat9iQ26f/9aOFKCLzHe5xsJzoxalRs
         XF/cYA09GUzLk2Qw8upNJ0Qp/+oq2MCw+EZzjeS3j43znPaEzsLILVIVvV2NV2Ed4277
         SmbRsDfW0lawC7+8fpR5VtsP2Zz6B0RI4DWbhlExXBho/le1+EaVQMPBmU78k0S99zEj
         F/1aS0xG36ax/6IR6YWPmfGa4TUUv1KWpanYbvR2P6k4Aoma4jgUsSFMSzlq3ueqqTYe
         AaGA==
X-Gm-Message-State: AOAM530t/rYReQIrLYjac9kx5LMcTXUiFQ0hL6+8XZhaToIDNxRxTJ/Y
        uiiZJ+sz3eL8Xn/AEDzVGe/pnpQ5X3WpOFoW8F3prA==
X-Google-Smtp-Source: ABdhPJwD3DifPQ8LZU5dqzif2r7i/5I93Q/94pY/t9RnGIA9JJT3zvS/eJXVikSsp2wvgoZh14V0Jm3BISb9j6i55vs=
X-Received: by 2002:ac2:58ec:: with SMTP id v12mr3496440lfo.371.1634612706009;
 Mon, 18 Oct 2021 20:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211019013759.970600-1-ran.jianping@zte.com.cn>
In-Reply-To: <20211019013759.970600-1-ran.jianping@zte.com.cn>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 19 Oct 2021 11:04:55 +0800
Message-ID: <CAGXv+5G5JAOgvPatqto45daQsxL+OqTHboLXZwCc-nPY9saT6w@mail.gmail.com>
Subject: Re: [PATCH clk:mediatek] clk:mediatek: remove duplicate include in clk-mt8195-imp_iic_wrap.c
To:     cgel.zte@gmail.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        ran.jianping@zte.com.cn, linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 19, 2021 at 9:38 AM <cgel.zte@gmail.com> wrote:
>
> From: Ran Jianping <ran.jianping@zte.com.cn>
>
> 'dt-bindings/clock/mt8195-clk.h' included in
> '/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c' is duplicated.It is
> also included on the 13 line.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>
> ---
>  drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> index 0e2ac0a30aa0..1aa5afc05929 100644
> --- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> +++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> @@ -10,7 +10,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
>
> -#include <dt-bindings/clock/mt8195-clk.h>
> +

Just drop the line. Don't need the extra empty line.
