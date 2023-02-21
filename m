Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEA6C61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbjBUDyL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbjBUDyL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:54:11 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0C32068F
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:54:09 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id f20so165890uam.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HqN3egQulWxDOUwNgXIKkCpD9Uq1nJcsXGny14J0gE=;
        b=nz9jUt8OFkg3LTE5XyHfvNLcLPEcdH+d2oKGyNiF8DBCPym8hQLkx8EO+jIyirTxLb
         JQ/SnkiLoxAq6+NSOFkr77vfbqJtU3e7UoUJHdb9pYYS6sLnoaQfv78wz24lauqjgpDN
         vC6tBvAmTrWYgtJYP8ZcLof3pEFpu2eH34PBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HqN3egQulWxDOUwNgXIKkCpD9Uq1nJcsXGny14J0gE=;
        b=7mocpR9dC9M3G2hYeEKhjjQe/1wEb4X8V3qJkDPGM5VOa53aLzdxv2mW/Npjq0jkOy
         ++aXdK5UZm3opCdLqOaM7ljzltY2DtUsVqshwzbu2BBKu/twGfv7yw+A3WCFMi0WikGJ
         y1XGIe0Ygwy2zEuvq6ZTTf+bSif88Z/gEnyO6kwRTJM/1AoXI8KFfiFrVRk5b/1myYEh
         MDYcpoga5GgLbZpfT+HM4o8beo7oMulqtl+J51KC4lCd2BcBwXWm9n1k1FM2af0CYNi+
         YXacBm3lH6+VhYkJOsrlXiFZcYBbe6wHa+R19XZaf+8VaGdiL+fvDWFd9tu3Kk+DSQkc
         fQmw==
X-Gm-Message-State: AO0yUKX0c4b3PzzmgHrdmmfNSHz3QEIde3YeSUpyqRtasabB5Jyp79Az
        qCxuBjIZNiBgK00/9cDkjjrYtseMrQ/A4963BRTsAQ==
X-Google-Smtp-Source: AK7set9VIEmauTPBD0SMjR0QxGvm+9nNLdQn9B6VZ+5eVqn4o4DG2LcQLdFEh2mEqFdkXQe+mLUs2kvbeIH7LU5AouI=
X-Received: by 2002:ab0:1014:0:b0:68b:90f4:1d8c with SMTP id
 f20-20020ab01014000000b0068b90f41d8cmr663799uab.1.1676951648551; Mon, 20 Feb
 2023 19:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-40-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-40-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:53:57 +0800
Message-ID: <CAGXv+5Eztv3RuXPXSYFd2qH_Wd18OcLNaqO+Lcp4hytjkBarfA@mail.gmail.com>
Subject: Re: [PATCH v3 39/55] clk: mediatek: Split MT8195 clock drivers and
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
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> option: there's no reason to do that, as it is totally unnecessary to
> build in all or none of them.
>
> Split them out: keep boot-critical clocks as bool and allow choosing
> non critical clocks as tristate.
>
> As a note, the dependencies of VDEC/VENCSYS and CAM/IMG/IPE/WPESYS
> are not for build-time but rather for runtime, as clocks registered
> by those have runtime dependencies on either or both VPP and IMGSYS.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig  | 100 ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/Makefile |  20 ++++---
>  2 files changed, 113 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 45b7aea7648d..49919da2be26 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -692,6 +692,106 @@ config COMMON_CLK_MT8195
>          help
>            This driver supports MediaTek MT8195 clocks.
>
> +config COMMON_CLK_MT8195_APUSYS
> +       tristate "Clock driver for MediaTek MT8195 apusys"
> +       depends on COMMON_CLK_MT8195
> +       default COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 AI Processor Unit System clocks.
> +
> +config COMMON_CLK_MT8195_AUDSYS
> +       tristate "Clock driver for MediaTek MT8195 audsys"
> +       depends on COMMON_CLK_MT8195
> +       default COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 audsys clocks.
> +
> +config COMMON_CLK_MT8195_IMP_IIC_WRAP
> +       tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8195
> +       default COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 I2C/I3C clocks.
> +
> +config COMMON_CLK_MT8195_IPESYS
> +       tristate "Clock driver for MediaTek MT8195 ipesys"
> +       depends on COMMON_CLK_MT8195_IMGSYS

This should also be moved to just after IMGSYS.
This is the only one that is not ordered right, so after it is fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
