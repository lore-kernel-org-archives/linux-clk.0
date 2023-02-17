Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C10C05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 05:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjBQFBU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 00:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBQFBT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 00:01:19 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFF75A3A8
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 21:01:18 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id d66so4378226vsd.9
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 21:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lmq1AX4l7BfT40HlVrRZjM9eenWjOvLvEux3RFmEoWg=;
        b=mzfynhcgrkOoplyuqlL2AI4eBdkAFhrskPqgnwuDnkU6xR9Fyn93xP2Mhe52MNdxeB
         YbOAgDZoZ5AnITUtUgQtg6cilK0KeJfJKi2P/7sN3sJAOfcaPCdJNQdAyJ/eRGWVsFcP
         Zngo++3RtvgTitafOGLblUpXpCW7gPqR4iyCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lmq1AX4l7BfT40HlVrRZjM9eenWjOvLvEux3RFmEoWg=;
        b=Tpf7iCMiH3gbG9xMb4xiz3KE5sjUiMXIbOcnFhassNfJbdIrZebKLRSp84EEQ4cGsS
         c9fahhohGqJKzH9f03NVZGIcq8+GxtkIosotI6FHGDAHQyfkjG5haoWmPzSE6DNtBT/T
         pHZd0Z/3Hq9mTjxzktFIlq47mERMDK5VBhrTgR/TXPE6CugzGn2GDwuDwlrU8KqCI2co
         3gyi3qLL9r70jGS+Z9UY+Tt8DfUS8jhZHPTIctT505jhU5guB/cMs6LpKmie0hKHy3u6
         26Lq/dgVBuwd9vGncKKzT/QfblNKqu14hx7u4b14z5Sub0+JUgE7pze+YxowavOE8QY/
         FsMw==
X-Gm-Message-State: AO0yUKWRV3VlyDQyo75D2y949IJLIpTW/7eElPDyQpt2neG2btcDHAN8
        jebcqKBegIntCU3Z+BzajN7rdyXnY00qeQdJrPmTUg==
X-Google-Smtp-Source: AK7set+rIxXTdLszssQwjrPl/zffBSJASXRC2NxpmWZXPFmaNCb2uW0LmSshMzR+1Jfc6cjYctj08T5+Ubbk9qYPm0g=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1542200vso.60.1676610077504; Thu, 16 Feb
 2023 21:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-37-angelogioacchino.delregno@collabora.com> <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
In-Reply-To: <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 13:01:06 +0800
Message-ID: <CAGXv+5E_kwn+9HLt0Y0BOyk-msXiU3W0N5woKenqVzK-GG_yQQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/47] clk: mediatek: mt2712: Change Kconfig options to
 allow module build
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

On Fri, Feb 17, 2023 at 12:24 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > All of the mt2712 drivers have been converted to platform drivers!
> > Change the Kconfig options for all MT2712 clocks to tristate to allow
> > building all clock drivers as modules.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/clk/mediatek/Kconfig | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> > index b9c0a9e21cf1..45b7aea7648d 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
> >           This driver supports MediaTek MT2701 g3dsys clocks.
> >
> >  config COMMON_CLK_MT2712
> > -       bool "Clock driver for MediaTek MT2712"
> > +       tristate "Clock driver for MediaTek MT2712"
>
> Hmm... How does that work out if mt2712-apmixedsys is a
> builtin_platform_driver?

Nevermind. I figured it out.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
