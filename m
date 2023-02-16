Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9092BC636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 10:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjBPK2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBPK2E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 05:28:04 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0801C7D0
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:28:03 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id v16so300137vss.5
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aC0UZCTaZwODqWa60Uyhp4WnMR7OWFiD7msBoAVkJA4=;
        b=htrWahqkdR7BI3F8kB0NkYMgKTrwmwm96JkeJku5UN773iiC76dr1Vuj3h+k3wxLuJ
         mlVpcoxw28S9V9xkApmJxmAkvQREJCSwGQYT37ZrSVK2YtqP2fiqSDkcD6iOkLcYHRl9
         oNWuBqSjy5fEClLHgaynPefkng2WmdqVsXmMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aC0UZCTaZwODqWa60Uyhp4WnMR7OWFiD7msBoAVkJA4=;
        b=UyK+WDmqfqKQypxPLOuP9AYeLAgTVloMxA0OaEoawGnRDgAQlJjnmTQXSk3zJOZ/6Y
         L3gju4Q1s/+uwGhb64FKkVa32ozDeSrZWKMfe4b+u2OcSibWqW4Z/KqLACOt0LQA91OC
         Y4tJm7ArhtCtayPLjLbUuzbJ6zCaHqm7DtcciTKqPPWeVPPXa36idqgpynK+Y3wugez8
         +nfgKpRgB1gl0bdk8jubmJYaD4k2PaLYSHo8msCnWSvkdcSSW/3IBXpns59wpLauwYRo
         TJ0nKArtJ2U+Z7yQn5ZVKGKdav4hVTVL91JcUQsQ8cNO6iwyfN1VrQDaj3YUHBMp6+E4
         GGHA==
X-Gm-Message-State: AO0yUKUeCFGgqoRWv7vkMZReoY0bNOzcAhC7kizYyVGVjcnuXbDM1s5X
        Wq47B7clADdBqZn2lSoubddCbKYvJSU6L+TpTeQphg==
X-Google-Smtp-Source: AK7set9S1a9PnO5AlC0aIUcyuYB4GoqrIa5JQM3cAhXe6/vzdJZfyC8Ugb35qpq0pzDqN3S8b4loTS4XI5MfTKfgMT8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1001620vso.60.1676543282237; Thu, 16 Feb
 2023 02:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-22-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 18:27:51 +0800
Message-ID: <CAGXv+5GqF=PN_ZTLAHtpbOQG7VhsGJmVu8x8zVMWSn5X7uQ93g@mail.gmail.com>
Subject: Re: [PATCH v2 21/47] clk: mediatek: Consistently use GATE_MTK() macro
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
> All the various MediaTek clock drivers are, in a way or another,
> redefining the GATE_MTK() macro with different names: while some
> are doing that by actually using GATE_MTK(), others are copying
> it entirely (hence, entirely redefining it).
>
> Change all clock drivers to always and consistently use this macro.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
