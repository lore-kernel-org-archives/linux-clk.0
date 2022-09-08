Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757A1C54EE9
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 19:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiIHT0A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 15:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiIHTZ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 15:25:59 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC1A9E0EC
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 12:25:58 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id c24so17653227pgg.11
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3S3TgS7iK2ozBJhM8YAZns0sUBBeIKf5Pkpn/yRLzAY=;
        b=SKPprRfmTseF3CsTo59H6bxctE0pyajXRQU3GYANwXMdu/9lBtYeyi/eJpx3z8lja/
         Ba/ttJlp4vrZ862EamZswK8DWSgZHQ6eKf0lzS2EYpFBfYMZlQlEzhRNqLg1MbCCw8uE
         TxRWyhXPs/9p+ZAceve/fKsfEUTozyOPNWVMEtstHPcYXCnU4EHQUv67kdxogNzzKvcz
         bi1zdWpxcB/13pHFBmHaq23lYJkeYPGsHCDZ50DAqWvLVefAjssqZcirOts8oikdTMSz
         d/xX6qFWGTYvfu9s9s/feCD7miZ/pJtKRUwwpgc7EKFlbHDYrhD7hcMsGF35qVO4v0E2
         fXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3S3TgS7iK2ozBJhM8YAZns0sUBBeIKf5Pkpn/yRLzAY=;
        b=UaRNKn7u4wkETc7Yx14psEmoU5dKD+Jo+5hla1fXqS4EUYqriXHumQkS9EMtDWuaU5
         ECzcWTmC6zYk6qxYHbYWvbycfiXhWx1WYGitjzbpQ5sZ1WbZATob5gSXM/5X5gU/Q4mP
         hyR8JQ/pN6YxUsywuMSqFrcy5EVaCCq3hT7qJxBrMIukjMqj3jmXizMjye00+ashtEuV
         h4DinNtZ4XtisrVkN56INXGNS4q6poLCpE2I8LmdZAXfHp371DwkQpJen4AApxYwUYGU
         FbVj+KCrB452Dk4IxvbqHxfS7oPVXsIrGT5Lv9mztEk9y3yKC4R2NHWENhS7vPZsiL8e
         1BZg==
X-Gm-Message-State: ACgBeo1WdeW9R7v4Qn2dJiKC0EQQ15301qEfKSNisOVqpOx7X5Bhg7si
        gg8CMF5nl2VpxmBQ52ONbBCGXN07V3HTmbT7iM3QxM1PWNW5NR/W
X-Google-Smtp-Source: AA6agR6vu+hiv2fosIx74neSLsNOYc1oSH3ZhEa4dBoKATsPyt8MRLxwstjq3AQ69BiM3JiLXaPJVWADzXpKhLGPg94=
X-Received: by 2002:a63:4c03:0:b0:431:58b8:cb91 with SMTP id
 z3-20020a634c03000000b0043158b8cb91mr8956475pga.440.1662665157887; Thu, 08
 Sep 2022 12:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1Za2CPGVX3q4HKufsxbL5zRrk1B5CWFpKritetrTs4dA@mail.gmail.com>
 <59b6dd0a-7cbb-5dbd-8da0-57baeba3327e@gmail.com> <CAJ+vNU2FVQRwCa3DnOwkFjaZg-ntFLZmetwDbSggDXDdwOOGTg@mail.gmail.com>
 <2ab24cc4-4aa2-d364-9b29-55f5d6b23626@denx.de>
In-Reply-To: <2ab24cc4-4aa2-d364-9b29-55f5d6b23626@denx.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 8 Sep 2022 12:25:46 -0700
Message-ID: <CAJ+vNU0voeMW06Je6nyrV1Ud3sT8Us+RACcQtsKUwKVaXF+dQw@mail.gmail.com>
Subject: Re: BD71847 clk driver disables clk-32k-out causing RTC/WDT failure
To:     Marek Vasut <marex@denx.de>, Stephen Boyd <sboyd@kernel.org>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 8, 2022 at 9:55 AM Marek Vasut <marex@denx.de> wrote:
>
> On 9/8/22 18:00, Tim Harvey wrote:
> > On Thu, Sep 1, 2022 at 9:14 PM Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> >>
> >> Hi Tim,
> >>
> >> On 9/2/22 01:23, Tim Harvey wrote:
> >>> Greetings,
> >>>
> >>> I've found that the bd71847 clk driver (CONFIG_COMMON_CLK_BD718XX
> >>> drivers/clk/clk-bd718x7.c) disables clk-32k-out (the BD71847 C32K_OUT
> >>> pin) which is connected IMX8MM RTC_XTALI which ends up disabling the
> >>> IMX RTC as well as the IMX WDOG functionality.
> >>
> >> //snip
> >>
> >>> This happens via clk_unprepare_unused() as nothing is flagging the
> >>> clk-32k-out as being used. What should be added to the device-tree to
> >>> signify that this clk is indeed necessary and should not be disabled?
> >>
> >> I have seen following proposal from Marek Vasut:
> >>
> >> https://lore.kernel.org/all/20220517235919.200375-1-marex@denx.de/T/#m52d6d0831bf43d5f293e35cb27f3021f278d0564
> >>
> >> I am not sure if the discussion is completed though. I guess it was
> >> agreed this was needed/usefull and maybe the remaining thing to decide
> >> was just the property naming.
> >>
> >> Best Regards
> >>          -- Matti
> >>
> >
> > Thanks Matti,
> >
> > Marek - has there been any progress on determining how best to keep
> > certain clocks from being disabled?
>
> No. You can read the discussion above.

Marek,

I wasn't on the linux-clk list at that time so can't respond to the
thread but the discussion seems to have died out a couple of months
ago with no agreement between you or Stephen on how to deal with it.

So where do we take this from here? It looks like there are about 18
boards with dt's using "rohm,bd718*" which would all have non working
RTC/WDOG with CONFIG_COMMON_CLK_BD718XX enabled (which it is in
arch/arm64/configs/defconfig) right?

$ git grep "rohm,bd718" arch/ | cut
-d: -f1
arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi
arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts
arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts

Best Regards,

Tim
