Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB3AC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 07:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjBQH0T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 02:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjBQH0S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 02:26:18 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D26A5D3DF
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:26:12 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id v16so3541727vss.5
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3U1y+OS8xHFze5wneiT44BoEGBfIqVLDOTwRPTeO1c=;
        b=RpDZkxWnIFU+udhEWSYKG0R2/2OZcswMbc0u1muUPD8ygE4T8QIXgMwnHqHmjZwtbT
         yrHtsBMAvp6Ahvo1ot9R/doPW91e7Cr5MLmZ6y+igi7H5sk0pJah6IH8MtEQGhIw9HY+
         ZMNrKNUERpnlfCE5U0NvB3Q6ZxFdZbAh/4Ve8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3U1y+OS8xHFze5wneiT44BoEGBfIqVLDOTwRPTeO1c=;
        b=XgjVYob0NxLQO3gg65h8DWztq4OFHFiwzDJzLLYM0p8prxxztMJzI2mZwK7S64p63h
         Hol5Waw7YOz9Cof3XjsqwuokvFm4gXMnQDDLxi7Y7RjVNdJySxvxpGseK/3cREjAQ9nH
         IFPCf2PGFWMS+IcFIhE31jrIb4z6btMiRlrN7h4BDOi4kcc+9/wKrM94DQqJkH8osR7U
         H7Ycpo/6zMtqOoTb87jM7rd5fJm+SM2JhcKLiywXgZ9uwACzA8CmH7PjJKmSfWyMpEWV
         /bOHBaP5MwGTjwunUdBpcvRhPhkoyE47X4ZP9Vy/4cWF60/mz5cyal/QloZlzQN6y/XB
         MDNQ==
X-Gm-Message-State: AO0yUKW1STajNNt1YvYgqJMhy8IBe2bKnP5nuHFt5u1DMRT3AcnMGUmV
        9gOTvqqOaKO/VXZ0ybi0kN4qNGIFFpgZ6is6lqluaw==
X-Google-Smtp-Source: AK7set/oYrpQGsELLVkMHCbstyKC7Vxeam0LT/Pg8NVkknGuitEFKcVtuuvscnIO+hmqQxJBaUY4SJSaIrtMIgipUcA=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1598974vso.60.1676618771782; Thu, 16 Feb
 2023 23:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-42-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-42-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 15:26:00 +0800
Message-ID: <CAGXv+5FUANGiDpim4_i7pnvcKokrG7E+ucbtmPQp3Pv_hfpEmQ@mail.gmail.com>
Subject: Re: [PATCH v2 41/47] clk: mediatek: Allow all MT8183 clocks to be
 built as modules
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
> All MT8183 clocks are platform drivers now! Allow module build for
> all of them.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
