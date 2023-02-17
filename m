Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC6FC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 05:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjBQFCX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 00:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBQFCW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 00:02:22 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220E55A3A3
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 21:02:21 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id j5so4381357vsc.8
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 21:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i/LoJUyP6LIWBGDbBIfrVpo/ZcUi8rR5q545T8LMRsM=;
        b=QW9jmwdqQetQtJ4m+DAPg2UMM3M8eQrqOiUf2cFhGvdmRC1Q8IVxeWd3vvYTVM4Kg7
         4NG7rEiSnVe0bmqG1eg/qDu59Zl2rDcdmyFtTec1Amp2ZFCV1gA7bSSVafcsJiA00Plv
         FkF6BK54sGad4++sAH5L/X8W79Kx7/gg1Bmsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/LoJUyP6LIWBGDbBIfrVpo/ZcUi8rR5q545T8LMRsM=;
        b=5vRQ4If7rCwxMjCZBi/cTTk7Cy54tMaj9xHlF4mjulYzc/4RVQKsYME5Bzf5EFrBNr
         ChmpNK0Nyv1Hz59eHXAP6PT2/NOony3Y+OVgzAaO5DLrrGisfYcPFfSah4pkMfK/XhOO
         CQ+iOiqnP/UGrYYrjdtkd4B43w13QylWpf7qfwktWMEx2bGiCePBOHW0VikGPWtrckii
         ny/WLo1TIdXI0EPNg+8jQ3sJu6hZ6tuSGrGVEFSNQf+GdO1wWOT1vTX3f0eyt66o7Xe0
         HCxF8nGEzuE1efu8dVUA8rCfUuezTcc+S9g3Fgo/qxZUKbdjNMIC19hYNgYmcECiT+Nv
         oQIg==
X-Gm-Message-State: AO0yUKXemOmdbdZNAp9EinN8QZoa23faYYMad5jdFl1Po4Ow8IfIJBK2
        TEz1JGzoh2hsLkl9OGPIM88d2N+GOJNilmedVLWkVw==
X-Google-Smtp-Source: AK7set++VQifD1GEuW1izZhS6MZDE6Ea7vwpiMNICqDrdAHn1j+yeN310Pi4k4OdPcpmKFqoprypxB/1QcYFV1t/SH4=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1542797vso.60.1676610140223; Thu, 16 Feb
 2023 21:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-40-angelogioacchino.delregno@collabora.com> <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
In-Reply-To: <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 13:02:08 +0800
Message-ID: <CAGXv+5Hs+dB0dN6tCmLdQX+srcAzavk39fis0hMjf0ZC6UqX1w@mail.gmail.com>
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

On Fri, Feb 17, 2023 at 12:32 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Now that all drivers are using the simple probe mechanism change the
> > MT7622 clock drivers to tristate in Kconfig to allow module build.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/clk/mediatek/Kconfig | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> > index b5636b3225e8..55727889ebf5 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
> >           This driver supports MediaTek MT6797 vencsys clocks.
> >
> >  config COMMON_CLK_MT7622
> > -       bool "Clock driver for MediaTek MT7622"
> > +       tristate "Clock driver for MediaTek MT7622"
>
> Same as MT2712, mt7622-apmixedsys is builtin_platform_driver.

I figured it out, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
