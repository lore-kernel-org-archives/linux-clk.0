Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E332BC636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbjBUDm4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbjBUDmz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:42:55 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C71244B0
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:42:04 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id g12so4683999vsf.12
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676950922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2wvNe81rytZk90715HG2PCFmsyrxc7m5FnCYoyAF2fY=;
        b=gSgc21gqnxo+9Vtja7nTND1/RIBvEEnMHnGSZgMoyHlmJBIoboHUVtAcSe6xCZwf2Q
         snyU3Wyrrr8mxSbEhmlhvXNkQMzTR26RdOV8pZ58igo6ABEvNDcRU7RsEwUgICrxM8lT
         fWm++o8S2Ar+lAbv8CKcLdK9FvBzghYCXeU6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676950922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wvNe81rytZk90715HG2PCFmsyrxc7m5FnCYoyAF2fY=;
        b=4oNgXD1XqqTptaS6kAUCqy9Ve9CcmsIy0UHoRqa4u1Cb6nI504W9FitDHl7pum33H0
         T/GQdsnldzAaZ2ZASRt/nV+kPYlJmOAPPfR2/z/UB/wnESrmuzeUe92u2SPWpzBgug4z
         lB0sffsZ44PJVnSumGGi2cEW/v5OZ2RN4HjWiFrGowB5fNfN0vLGQFtRqgg3CGRjC44C
         Vn/daF2VxJrtTGXbixkXSIZZ1gRLZ535gZzDs8XSEKnza2Lme/CuWnI9XUuZY1mu3dZL
         hNL5nPbX7S5nh/vQhusndfOM2rPnMUZ5HTQO2NoAIhoeON6Bar5BtuPh+nVNOBjtE2XD
         yJ9Q==
X-Gm-Message-State: AO0yUKVKgkiBb1W+NdsVO2fYJ8N8516W223Fx0/MaEmCmMU8HTbRiDe4
        5j0pu+KVqdwYAUpMBZewhyNuFfvd0r3VyK+Io/TQ1w==
X-Google-Smtp-Source: AK7set9PgnBSccgq3Ct1gGwwBge0XfivA3QB+E6pPiBYxo7qYILxFZVZjtWeBwAiOZDIwlHlnxLPhZ0nRJ2hPyMS95U=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr829198vso.44.1676950922742; Mon, 20 Feb
 2023 19:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-25-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:41:51 +0800
Message-ID: <CAGXv+5H7osyeENN1un9+isBxwM=bzniSg2teBf7Gubm37_NzmQ@mail.gmail.com>
Subject: Re: [PATCH v3 24/55] clk: mediatek: mt7622: Move apmixedsys clock
 driver to its own file
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating mt7622 clocks to the common simple
> probe mechanism, move apmixedsys clocks to a different file.
> While at it, use the builtin_platform_driver() macro for it.
>
> During the conversion, error handling was added to the apmixedsys
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
