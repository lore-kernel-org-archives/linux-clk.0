Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D903EC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 07:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjBQHhv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 02:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjBQHhr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 02:37:47 -0500
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1C15DE0F
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:37:46 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id d6so2297148vsv.6
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7w2nsj+BPyzWeqVlSJ1h+PblPLRF+B8VDDNr9VLL6Y=;
        b=H5L2d+NhIswiKXwwkO0FV43AoayGluXrnMNLZcrQte38M8LVO/AwQYO11kryqQtguB
         zUMoULjT9e+/wPTmU7FPBZaJe9GTgVUE827NMb+dFosXL9Ca2pscyHXSCGQJTJAGGb8/
         EnRfF7yqrLFshOXJqWF3u8yC2dMP8Tg2E8DZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7w2nsj+BPyzWeqVlSJ1h+PblPLRF+B8VDDNr9VLL6Y=;
        b=5yNM7ExbyvbQM4nOlWFsGHVboQ+Aytc+KUvBKO4FTVrvCHF5Q25dbZ+rFBIfHaI06M
         lUC2mkFe6krNjxmS00TKNKwghqFNrLJCvwbMZGmracGEwHW9fiplfDA5OLbDYru805W7
         7tkWWVTQ8VGuJuOJYulpGta7Zzw7I/NM4EkD+YWXtTheMg5wdu5vu8GXDutEYflzdV+x
         MVqryY3RKPCCshCIrZsG0T+ZZdJWz/oTnO1rGjDbSJsQWUcPlOjExp8ftA+PFTLpZh/l
         l8W2eeE7FoRGBtLtUmM/Uoy8/rZ4wY2WxVQYtUKz57SyNLAOMZlIF93Uqn3KbOrf55vY
         eY7A==
X-Gm-Message-State: AO0yUKVuHMTgjmPAMY6lOMCdNNdZ4Es1D+0UOISxAgSIl0LmLzBoUSuW
        pxHYlU2MkTx7KrmbN2r5YYwN2LGPpqcRicpEscM1yQ==
X-Google-Smtp-Source: AK7set8j7+F3ZFMEJGFoWnVWh6MfPilnGHfz77xcGdvx1oI3rzUkBVSr7gZdqtonaWqySsWjv0S8Z1IeLYtIP/tTnL8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1603745vso.60.1676619465306; Thu, 16 Feb
 2023 23:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-38-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 15:37:34 +0800
Message-ID: <CAGXv+5Gf6idN3LMkei503cXnuxo7HNc8=8fG0jENVHDtxDg5jQ@mail.gmail.com>
Subject: Re: [PATCH v2 37/47] clk: mediatek: Split MT8195 clock drivers and
 allow module build
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Arnd Bergmann <arnd@kernel.org>
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
> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> option: there's no reason to do that, as it is totally unnecessary to
> build in all or none of them.
>
> Split them out: keep boot-critical clocks as bool and allow choosing
> non critical clocks as tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig  | 86 +++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/Makefile | 20 +++++---
>  2 files changed, 99 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 45b7aea7648d..88937d111e98 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -692,6 +692,92 @@ config COMMON_CLK_MT8195
>          help
>            This driver supports MediaTek MT8195 clocks.
>
> +config COMMON_CLK_MT8195_APUSYS
> +       tristate "Clock driver for MediaTek MT8195 apusys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 AI Processor Unit System clocks.
> +
> +config COMMON_CLK_MT8195_AUDSYS
> +       tristate "Clock driver for MediaTek MT8195 audsys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 audsys clocks.
> +
> +config COMMON_CLK_MT8195_CAMSYS
> +       tristate "Clock driver for MediaTek MT8195 camsys"
> +       depends on COMMON_CLK_MT8195_VPPSYS

One other thing. If a Kconfig option immediately follows its dependency,
then it gets indented nicely in menuconfig, but only if.
If other options are interspersed, then the indentation gets reset.

So could you reorder the options to follow the dependency graph?

Also how you chose the dependencies should be mentioned in the commit log.
These are pure run time dependencies, not compile time nor link/load ones.

Last, I think an argument could be made against the proliferation of
Kconfig options, as it dramatically increases the combinations of
allrandconfigs. Maybe Arnd (who IIRC frequently runs allrandconfig)
could chime in on whether this is actually a concern or not.

> +       help
> +         This driver supports MediaTek MT8195 camsys and camsys_raw clocks.
> +
> +config COMMON_CLK_MT8195_IMGSYS
> +       tristate "Clock driver for MediaTek MT8195 imgsys"
> +       depends on COMMON_CLK_MT8195_VPPSYS
> +       help
> +         This driver supports MediaTek MT8195 imgsys and imgsys2 clocks.
> +
> +config COMMON_CLK_MT8195_IMP_IIC_WRAP
> +       tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 I2C/I3C clocks.
> +
> +config COMMON_CLK_MT8195_IPESYS
> +       tristate "Clock driver for MediaTek MT8195 ipesys"
> +       depends on COMMON_CLK_MT8195_IMGSYS
> +       help
> +         This driver supports MediaTek MT8195 ipesys clocks.
> +
> +config COMMON_CLK_MT8195_MFGCFG
> +       tristate "Clock driver for MediaTek MT8195 mfgcfg"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 mfgcfg clocks.
> +
> +config COMMON_CLK_MT8195_VDOSYS
> +       tristate "Clock driver for MediaTek MT8195 vdosys"
> +       depends on COMMON_CLK_MT8195

Not sure why this option is here, out of order?

> +       help
> +         This driver supports MediaTek MT8195 vdosys0/1 (multimedia) clocks.

[...]

ChenYu
