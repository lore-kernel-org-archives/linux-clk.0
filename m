Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28A3C61DA3
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbjBUDz4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbjBUDz4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:55:56 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008AD2068F
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:55:54 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id w126so1732913vkb.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yTTUfpY5FBze/ZdJsTMclUwYRTvL4mC8YWDC0HHBaDo=;
        b=LdWHnd2Swi3aDPIeLDYDnQy/SdWrk5WWezojEhx3GNTFL/Z3ampZ38AUjhpG7kOPLh
         a2zMHNXGNT59i9PFUvBYLBzBWZKMsmXxWEjLKmjLWdGY0KyrntMpaqMf/pB1xiF1gfwU
         Sjsi5pSdY2BAlMpDKBiPt/GxCIuqAPEGEqQZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTTUfpY5FBze/ZdJsTMclUwYRTvL4mC8YWDC0HHBaDo=;
        b=WngwfJYJqCUoZbbmxxfcmwHggHGVxnQ47zZIH6KtCt8GAHktQSx36geump7RBFLxjA
         Kx9ukshly0se5N7zko8gOzyUrjJvPpmVVPKBgQv3TPLzoSMIAeD+MA3T4fgLTQQeQLhh
         zPFgT2BCUKKE+HVWCF2f7D7A9GerxrC1fxTcsp33Eg6TGv/K6qtXXzNy7ni9KHpUxXYK
         Aoomadsp1pfn95C5K5X7dAJ815RjXe1EvS78kZ+D3pw8CnrOXPUqfCnpzBoJs4kZaocz
         kk21DWNTWyhL5JY0t1RD7+DPYFkpZX4746LaTOYokhA0aZYuEcj4alyidF08eaUVkcxC
         tTpQ==
X-Gm-Message-State: AO0yUKWMob95xfZx9kkEnkjQ82sce92E5T6kynq5rhB9TSmjZyL6xEnn
        J1iubsHI32z7fKVDDIIANvszjPrimZzC5+XsEr5j6Q==
X-Google-Smtp-Source: AK7set8Jj9rIJ0M1z0qzvgZyXsHbOHSifaxMAF2WDRHnciHO2wQ0GHx1+ow3JKQ1jckTrglgegfQO/AUz+jddSbN0Vw=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr813692vke.18.1676951754153;
 Mon, 20 Feb 2023 19:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-47-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-47-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:55:43 +0800
Message-ID: <CAGXv+5FHQG6CBcRVUYdNXdxRQVRpmnVN_EiQ=knm48B_7ugHqA@mail.gmail.com>
Subject: Re: [PATCH v3 46/55] clk: mediatek: Split configuration options for
 MT8186 clock drivers
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
> When building clock drivers for MT8186, some may want to build in only
> some of them to, for example, get CPUFreq up faster, and some may want
> to leave out some clock drivers entirely as a machine may not need the
> Warp Engine or the camera ISP (hence, their clock drivers).
>
> Split the various clock drivers in their own configuration options,
> keeping MT8186 configuration options consistent with other MediaTek
> SoCs.
>
> While at it, also allow building the remaining clock drivers as modules
> by switching COMMON_CLK_MT8186 to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
