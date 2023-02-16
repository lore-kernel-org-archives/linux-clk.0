Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE14C61DA4
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 07:31:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjBPHbb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 02:31:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjBPHba (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 02:31:30 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D2C38EB0
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:31:29 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id s23so1055494vsj.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HUSv71/IGUnLZD3B7OqwypzfXMZ43qFnSxJzO/o+ZQY=;
        b=lAuAzQBc6RPfyQw1RL4QShGpRtE4xcMHq/2n0N2BFrMRgDJcfz6frJyd1Dwq+5oJga
         jEseA9/wlXPnu85ei+RhL3vdgtyuNftxH1PEJEjPP9ZeiI/4VmcexikDTe2M11f+pLp6
         09dy0cr/Hn2x+iSW5BoOJ6J6SeutIiZkPajig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUSv71/IGUnLZD3B7OqwypzfXMZ43qFnSxJzO/o+ZQY=;
        b=b4D6FGlI6ExL055nlCZODff24WqWOzKcbRRYN9ycdYapbDwMSeSnCobXud3ykI1WRw
         WlfJq7K4O0eRZ237pMzGBUk/81Zm9XK2jUHWmKsHhY41XsYIhEhe+ng083ADzXzf6GhV
         AVR+ShaEm5/J3wjp/C7aWyEKjLn8rLuPVquivJznpTZzIPLW+3s6pRI9GkEVsOjzksJl
         +6eI35cg6mTWXRX/Wb/jIpoYeV7epOlTC/kQUJsSWqSN4W+YbBxPDBHlj3eu7Yz+shTH
         eAitiozVU75Wdr47uDWq7C+/4Lq2XdzV1R5XIBUwxBkstrzXucUZIsu6qWFktgu5pF6a
         cQmw==
X-Gm-Message-State: AO0yUKU3ysxmWVjJlxCc0a2kmrTDrFyWaaKRtvVPZzqj7rlt60nwwns/
        Ztq6Wx2/Oph+tggKQfn4ndhHA+KmQ/BxP+C4d3v/4g==
X-Google-Smtp-Source: AK7set+rAe3Uideghnpky0Dpb6VVBSz9U/PEGIpuRQLl1kaAID4ZC3fanb6bymAJ5g+9JkkTYRedPB+bRUySXN1J9m8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr931762vso.60.1676532688934; Wed, 15 Feb
 2023 23:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-10-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 15:31:18 +0800
Message-ID: <CAGXv+5E7Ht4CJkGSK18Fc0Hwc4wbJx6m8Fyyg5KkLsEgfKYSug@mail.gmail.com>
Subject: Re: [PATCH v2 09/47] clk: mediatek: mt2712: Change to use
 module_platform_driver macro
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
> Now that all of the clocks in clk-mt2712.c are using the common
> mtk_clk_simple_{probe,remove}() callbacks we can safely migrate
> to module_platform_driver.
> While at it, also drop all references to `simple` in the specific
> context of mt2712 as that was used in the past only to allow us
> to have two platform_driver(s) in one file.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
