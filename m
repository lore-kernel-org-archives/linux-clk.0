Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5544C636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 08:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjBPIW4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjBPIWw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 03:22:52 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08E33C09
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:22:49 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id g9so1122696vst.10
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 00:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t4Hmavd74pc9hNKbMy0OT4KjV0TBYqpmbiZ39L4sh4g=;
        b=U6ZdpCafQotK8qbTTSdk+96qUzTw9xQpMg+ZhUkq4h9bs64Ym3JcCYJK3QPFAo9RZs
         1Qrg104hDRL/7TryGDwRy+efxYYuXEjALAxLKnNFCtIrMIOYRKrYh4YmBiL4DCtLh0sT
         p8Vod9IfZzH9eiSRRtG0yWXXbWm3zWi39Ugf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4Hmavd74pc9hNKbMy0OT4KjV0TBYqpmbiZ39L4sh4g=;
        b=jCwO/ldN1RDWVFcUmq/harqNZWxU0eUz3/Ubqsa8OD3dwo9XyL7Q0NGMQWvTygfPqR
         Go9PM6bsXInx2HnsRko+IH6tDAr06UDMik4GqH6EZ44OctaNgr2N3DJWvlaKWp+p9yX4
         XyYoJ1d9GXShemkNUwkUQf/d6a9srNJ4v9DCQlDMqAkiHzSkcDnWJrNKOvDlVGYMe+cD
         Tbxseh85zG0KJ67Kx6FewwSdH7Q9CzvZdiGJCxJUEjqJeDUZciEvV89yajnDNKEUF6wK
         GRwENC3hw0mvrxjhGYY1f6P4PKTiCygg6FgI7ztMnYnp5sqOPWIMUvgVc64gZovETTj5
         v9Xg==
X-Gm-Message-State: AO0yUKX4DJ/A+M7h0VsdLpdzuVZbnRvprYYX3gSkEIQ9OFhlVGwbs0Yi
        N1tLMTwMXjz7QZpThssfMazPk7dj3TB0YNgaJIkeZA==
X-Google-Smtp-Source: AK7set/NiPdqGO4lax1hRZGi4C5xRM7rX75lwKlIcLeNUE7rasZWoOGb5+OT1/zHR5BKwnytbaZ5kCNjsC8Vf+ml7tM=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr953233vso.60.1676535768772; Thu, 16 Feb
 2023 00:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-20-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 16:22:37 +0800
Message-ID: <CAGXv+5Ft-dmvedRvyjXJwv7Cx+j=GPH6_j1s2oJFwPKYc_Qz_A@mail.gmail.com>
Subject: Re: [PATCH v2 19/47] clk: mediatek: mt8183: Compress clocks arrays
 entries where possible
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
> Increase human readability and decrease number of lines by compressing
> the clock array entries where possible, to a maximum of ~95 columns.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks better. Thanks!

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
