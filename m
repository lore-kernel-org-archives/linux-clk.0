Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB52C636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 06:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjBGGHL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjBGGHK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 01:07:10 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431DE1E9ED
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 22:07:09 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id m1so13315472vst.7
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 22:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Di8RlAFDXixiWPVVKjwmVmn+q3pmV1A/L5akLwyt7Nc=;
        b=L3HvVnbjZnijMz+CunEMzm/Ax4c+mMXjg3QtyAUys+a11FwAdOhoAPH6UfPlQgQIgh
         wpWsZQu3Bmn/ahQHtG4+RWaOXkKydro9IAQwKbNS2NVJxTus4x006vX3gxiqMtWQ7PQx
         FxaZM2NXbsla+cnc8M0ywf8TmQoaXN67AMlhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Di8RlAFDXixiWPVVKjwmVmn+q3pmV1A/L5akLwyt7Nc=;
        b=bwx+vc0/6uj3l3zo0hDBrx9XLH0QAKSW2IcuuyQObGZAizfXo7wHts3nGA71zuFaDo
         Zh7A/uKg8IM0LDVOPZXslXjOW+v4xSm8dHpgaVsPiLzyMP7Z3nwsxdXL6nc+m6uy7PKF
         eYqMId27jXr5vtqQLtfAl0q+hnh7cLk6j2osYfTjLPLXlcEWTMeFJf5eVsSNvhau0997
         4kcTllQVRbTXhQ4Htxz5KXRTAwvxaRTdJ+SKqtYAHwhrcp1QIzPlrZUZZTi9q2H48+UU
         LGMhVSus0HTrRkQj01+XDi2pJ0GW1de4TffkNg+5U1PnaTgCj1VoQliiYMOc59wJE5YS
         5cDQ==
X-Gm-Message-State: AO0yUKU5U3nU+N52NN1ZR4Zo8JHwvbyltwOUBV5U0tNlzP1XasWAANqX
        /naYlpVC4mFJuaeoeTCJhATNmRIR5pYQUiQv2jjjqg==
X-Google-Smtp-Source: AK7set8CXMGyMBuUrs9+E2OARHA5fk6GumDiWDSvfiq0b4is11veuHt+ijbXPvTl5cbTV+LKFMCtwDYVY2nWTdkUzUc=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr445813vsa.65.1675750028448; Mon, 06 Feb
 2023 22:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-4-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 14:06:57 +0800
Message-ID: <CAGXv+5HWpE+N8aFQkFB73_-L+O8JQGDczra0Gkmx173tH0EBqA@mail.gmail.com>
Subject: Re: [PATCH v1 03/45] clk: mediatek: Migrate to mtk_clk_pdev_probe()
 for multimedia clocks
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce duplication and simplify all MediaTek multimedia clock drivers
> by migrating away from defining custom probe functions for each driver
> and instead use mtk_clk_pdev_probe().
>
> While at it, also add a .remove() callback to all of the multimedia
> clock drivers where missing.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
