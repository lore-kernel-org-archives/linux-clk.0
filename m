Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2CEC636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 07:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjBPH4G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 02:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBPH4F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 02:56:05 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B079E42DCC
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:55:08 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id m65so774175vkh.10
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xONmYBw6JTvrmLO+BA4K5ITh/kiXRq2fHlncM+ovzGs=;
        b=hjpwgbhflizIPQ8Ei73NkCuu8TvOmmoAobeCoLPA8SxjBaAmOI0B61L5Vu8/4mGSHs
         Lpj/DzyA7JzX3tlFL+FZC60MNAFU2i+wAXx0StOQFyjZ7YFVlfidBhpRZM5ZzF2NeYcC
         aQYiYAUH7/8kxnBUvc40ECxmm13ILwd5m0ZCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xONmYBw6JTvrmLO+BA4K5ITh/kiXRq2fHlncM+ovzGs=;
        b=CwjqwVY+IIcNpS7N5pz9z6S7LQ3RL+KqGlEA4b/UqvBQ6EEAF2YMPdHUhRfxkUHxjL
         VVpVQb41U8x4ftn277fFzF2v+obX5dNdvUvqog+MmclgHK4be335F/RVG/fVPVUiCBIM
         dBL70RGjnf8Jw7/elhWN0SdOhhRnovT97wH/R6gnL6JY+HMSTp/nZ19pr/wGLoYWAvkQ
         D34BemEAjvYmHieY3V6Y0T/3WEt/0qUaXI1/PrNodGLems5Ysg0Z8UaWbL1P8+UxXPxm
         ltkRqtdB0GdKdi7y0YBaLwDPkPfNgQWeJFneh+QPPTDoDNMVSColOVYmbsnT95jZdEFM
         RoSA==
X-Gm-Message-State: AO0yUKXNUTfi1R0FabVkiinbfLCAWirGKWXneOFXVBBHd3jf74XjJnhi
        dzLIiDT3D5jISKHM30HsxhNe5nKGAQZoTC8acAHxjQ==
X-Google-Smtp-Source: AK7set/28STVRdRWXGf4bMCmP2aoX0xrfMB9bmkBz4FxvyVRel7OQwwriFZLqi7THD11no6OYGV4osSvAvDXEdCPURo=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr780129vke.2.1676534074560; Wed, 15 Feb
 2023 23:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-12-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 15:54:23 +0800
Message-ID: <CAGXv+5HpWTTqrFKhkUDoZWa4h1wm=OuDHgFyMQsL-C4xKVfqOg@mail.gmail.com>
Subject: Re: [PATCH v2 11/47] clk: mediatek: mt8365: Convert simple_gate to
 mtk_gate clocks
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On this SoC some clocks apparently don't have different offsets for
> set/clr/sta registers hence they can be set, cleared and status-read
> on one register: this means that it was possible to use simpler gate
> clocks instead of custom mtk_gate ones.
>
> In preparation for converting this clock driver to the common probe
> mechanism for MediaTek clocks, perform a conversion from simple_gate
> to mtk_gate clocks since the latter does provide implicit support
> for simple gate clocks as well.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
