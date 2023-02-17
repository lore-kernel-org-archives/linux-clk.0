Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25DBC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjBQEc6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjBQEc5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:32:57 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CAC16AE1
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:32:55 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id v16so3217015vss.5
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/MeUKjw33jpqilmmYXQEGFRb0OCD/4Vq8XY4qGuBOYE=;
        b=S3awRWKrbCT7SjUcPzd0fvwXvqP30sAmcHpK21MWzkpsEU2B2urrTaswMUoqohl8ga
         INOvkTG37BexzEthZigt9wfPn9w957TxMGKzEkEKfWRbUOA0LGE9fQ4hAEwSqECPuPkA
         MyRSsGcuD4OR3nHWt3NkGIuU3DUpogrjTdmVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MeUKjw33jpqilmmYXQEGFRb0OCD/4Vq8XY4qGuBOYE=;
        b=KbqOxt6EjvMMfeXZ9DUHQRQDU3DWpEvVHmI9OfwWQhu99Qd41XzLHNTj/6pNIEFJAo
         OQ/Vyv/AjBFdfQD1PWr+6bZFQ8ghM8/pUC5FgfJ5Q34hAv8z/ZyNrvAJhjx1l7oWAUbP
         tHy1ab0lqHWToh+Ay75NjW3vibH6pfSSQaHm77j+F/Ec8PTZTcwa4xfuZQr4nYfkaJbm
         9xk5KQ5vV0dpppF4m15v5bW1ddBmco1+OUV/6ibIaWd7rVHvCt984pFg4yHldo4nuWwz
         eSPXe+45GxkfB7G7mJrocVvrXGEHb2CRq+qSDwBwW0V5YkPbkBlrd7lyfdeSIf4s07w7
         2j+A==
X-Gm-Message-State: AO0yUKUAkUXvE9uhAmDyqW0iQGGNI97o+iy8+ccZt6w/kWagePnZa1Hi
        731CjKr+W6FNuRsNuAL5am3XMnsgBgYZjaD3l+iiAg==
X-Google-Smtp-Source: AK7set/cSGuBVDTCxSmRRGsS41MgtBnX0pHCKDtmZOdivWOY+N/IZzhla6F8qP11ESwesqemFfp/tlEhHshfqZsRNsc=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1532091vso.60.1676608374852; Thu, 16 Feb
 2023 20:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-40-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-40-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:32:44 +0800
Message-ID: <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
Subject: Re: [PATCH v2 39/47] clk: mediatek: Allow MT7622 clocks to be built
 as modules
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
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that all drivers are using the simple probe mechanism change the
> MT7622 clock drivers to tristate in Kconfig to allow module build.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index b5636b3225e8..55727889ebf5 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
>           This driver supports MediaTek MT6797 vencsys clocks.
>
>  config COMMON_CLK_MT7622
> -       bool "Clock driver for MediaTek MT7622"
> +       tristate "Clock driver for MediaTek MT7622"

Same as MT2712, mt7622-apmixedsys is builtin_platform_driver.

ChenYu
