Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B5BC636D4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 07:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjBQH0a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 02:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjBQH03 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 02:26:29 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CD35970A
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:26:28 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id o136so511518vkc.12
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oid+aqBdw4K3Kog+gaRMquz6ngOAq47AZPlR5mwS954=;
        b=Wpiq1msOSALxHslmO5r4oAi5zGjFqDjan08pBLo60zasY1WA4ImnzmVgS32qHyY4LO
         FPqD22dSQlVp3GZnwcZx7aN5DffRJAYFAubMxsYv9B9vQYi+EC4vY9QfF8uomzhVj5I6
         Np6kJyIIsRiDL/deUDh45nl6oRFARfEIdEHpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oid+aqBdw4K3Kog+gaRMquz6ngOAq47AZPlR5mwS954=;
        b=cDCWHLwONTETaRTKq1kKJUnKaqUacDxfxuU1w2Aer13XSYK97awnKK8UN4Iz4L3Yk5
         e0zMyuy58zLWTBfU7qob7gpLme2jiSV9j9B60CSySFw9emnwTncKIVJc8IqaPnuhjpGe
         U1ldF0ccQtBRA08SLNpFIabxNA8o6xV4C9ZUWQEZsBzNQNMuNH0mZz4LWOko8MEdKpdO
         CIxdmdNO6JUW9F3e3002j0bFf3agb+FR3cTnzpDQfOjyUfy7tDzVPlmVirIXKSmRyXlA
         YJYJlO+oqdilw4EeyDChBRCM5wqT8SERcmS9rFJr0sH/aeIkIuV2I09BEzzgOiAEXWD6
         C/Xg==
X-Gm-Message-State: AO0yUKUDoyMG8iksmge5gdEMS0cITPMdHxNwsMKZGiy40lCUztAb2BhF
        Km4/wcyO+PYVXIXv1ELD9ui4WmG+iKteT67rWRI7WA==
X-Google-Smtp-Source: AK7set/dFOe+XmErTLWHyjvHjFKkrqaDezsomGj7d6EevRFgpJETrmfHwbshsqCN3BM9nIRDuhKixQ94pBVr0vBQtmo=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr1392918vke.2.1676618787321; Thu, 16 Feb
 2023 23:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-43-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-43-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 15:26:16 +0800
Message-ID: <CAGXv+5Eh_4RXN+uvG0Cwq+GkJ7mYdhtGz04MMNDnXVU13BRdMg@mail.gmail.com>
Subject: Re: [PATCH v2 42/47] clk: mediatek: Allow building most MT6765 clock
 drivers as modules
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
> Most of the MT6765 clock drivers can be built as modules: change them
> to tristate to allow that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
