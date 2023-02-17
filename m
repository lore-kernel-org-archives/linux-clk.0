Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECA9C6379F
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 15:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjBQPTc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 10:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjBQPTb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 10:19:31 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB526FF3B
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 07:19:20 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id n13so532922ioz.11
        for <linux-clk@vger.kernel.org>; Fri, 17 Feb 2023 07:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28m85WAnnpLbewBzTbhGeA+5WhnAGWrMfNOGOaniYvg=;
        b=iTru555DCJcpPNOjU2/mVZu3LtQWSUYUAdKx5txJDVaFEE+NyIgC/P/XwyueRf+4do
         7Yz+08J0QeVNBWxztiyYiioFfvMUrEuBB4AmC0Z3DpkFXaTd0jRfUUXDfymbuGl4ntV2
         JKwmE3iszmEVGb4VRciHCQmkRcgZoqezEIapM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28m85WAnnpLbewBzTbhGeA+5WhnAGWrMfNOGOaniYvg=;
        b=v57rc3m7X4SE9KFgzzeCG4hZ/n7m5ND7aBRCJ7LuOnYrrGjZYJ/WS9pZL92XTp+Wvx
         525TXwh2+HhswSwnudhseCtUkhOD50UCBjLWq44Qfj9j/W/j7ykfZBwdTyTfr+kHLYSL
         gMB2QDxyOytO8DXwW2DbH90Al2hNRIKzXvLWVllh2Loh+BHqR+mh5IH9+zE30H5twrnx
         xkv9ACPJGGLy7iv9wv/X8bE2tfuZTAkDvy/3K/LIN1qduCZV1wv0BE+5eg1zpLoEAzlq
         1kxIXfzBTRydF1oqCQ9qf0Km8qSICn8qoUCxN0X8h4alOfO1yC+C/4jS1m/momd7E6XL
         dTCA==
X-Gm-Message-State: AO0yUKUWQbxmWrU9otYyScZd0jwIc4twitUK9yooPRYFL4UpOeINq5yy
        7k5kXPbFcQ0G+ZfEnlK+6mj/WIduUAX14mb7ubZQrg==
X-Google-Smtp-Source: AK7set8yV0jmr30XFE4rM1GZt6qlKEkgdKldV2tS6LZdcI//mJo2pc20sn2fQPNhGqIKrveAS4/pZnYJaRxzTdtVSm4=
X-Received: by 2002:a6b:e70e:0:b0:740:66b5:12c1 with SMTP id
 b14-20020a6be70e000000b0074066b512c1mr3255468ioh.19.1676647159803; Fri, 17
 Feb 2023 07:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com> <37690521-4d24-ce55-f81e-30ad931dfe95@collabora.com>
In-Reply-To: <37690521-4d24-ce55-f81e-30ad931dfe95@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 23:19:08 +0800
Message-ID: <CAGXv+5FM_pxu4Ms1mbvpdJLxkOZe2ZXjNoiOCfANpdxLme+_Lg@mail.gmail.com>
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

On Fri, Feb 17, 2023 at 7:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/02/23 05:24, Chen-Yu Tsai ha scritto:
> > On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> All of the mt2712 drivers have been converted to platform drivers!
> >> Change the Kconfig options for all MT2712 clocks to tristate to allow
> >> building all clock drivers as modules.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   drivers/clk/mediatek/Kconfig | 16 ++++++++--------
> >>   1 file changed, 8 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> >> index b9c0a9e21cf1..45b7aea7648d 100644
> >> --- a/drivers/clk/mediatek/Kconfig
> >> +++ b/drivers/clk/mediatek/Kconfig
> >> @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
> >>            This driver supports MediaTek MT2701 g3dsys clocks.
> >>
> >>   config COMMON_CLK_MT2712
> >> -       bool "Clock driver for MediaTek MT2712"
> >> +       tristate "Clock driver for MediaTek MT2712"
> >
> > Hmm... How does that work out if mt2712-apmixedsys is a
> > builtin_platform_driver?
> >
> > ChenYu
>
> That doesn't. Thanks for catching that, I've added a .remove() callback
> and changed it to module_platform_driver() for v3!

Actually, I thought that if it were built as a module, then the
builtin_platform_driver would then expand to a module_init() without
module_exit(). So it would become a loadable module that cannot be
unloaded.

That was just looking at the header files, so I could be mistaken.

Side note: IIRC a missing .remove() driver callback doesn't actually
block driver removal or unbinding.

ChenYu
