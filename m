Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBE9C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 03:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbjBUD7J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Feb 2023 22:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233272AbjBUD7F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Feb 2023 22:59:05 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1FB25B99
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:58:37 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id b20so2755555vsu.5
        for <linux-clk@vger.kernel.org>; Mon, 20 Feb 2023 19:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L7Tcyr5dOvP+6P4gxGkarZtN6wcj1ZBVjR/UVVwdfS8=;
        b=IGCWsSkkutgh0okrfT7uNFy1RET6SsVtvhWs/LxdEJVE8B7tM6E3UEw//b+M/52lAZ
         l66CsyZgEsgVv0gZWtiop9xYWuA1CQw/7tUTKesUiToMpqgi57toBLVQOxWgj787HSjH
         MS6+Q7uiQAejEqu1bQJqsIfCOQQWiq1wvAvRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7Tcyr5dOvP+6P4gxGkarZtN6wcj1ZBVjR/UVVwdfS8=;
        b=xgFn175al3/Hn9DaNxQ7YYLI36v5TYU/7UZnD09WjNxdU7EpqGZ3Da7w8bHYq9Me05
         WwQUDSSfvxOT8qz+OlS9g6ZXlILGIYvtHfyx1F0Lcdi5bmg7lCoP2M03WT6K8EckGT6p
         UwNMk/3/O1AX6kGjiLambQDvtSN66li0AgVz1mjOdfkgKPDBygkegSjHP/IEguNjuJfF
         8NYzgPIEAiZDBImCAEJFncVe8I+S9VtjDylkCQrGoELyPBxqHaMX3qgxBFLUC+3ZbCrH
         4cKT0AL5Ij57ken4TGlWlps67QQHAOAHBs7EhHzVL2yxlQT4yBGbHDKKPvrht4GBa+Lj
         jLig==
X-Gm-Message-State: AO0yUKV4h6agP1OWc0FuH7+wvES5Va1NTvdglurKTclRFQkmPnjqpHNy
        TJLa/ceJIyxOTmgMNc7J92Q956g9W0qPEYheCsnyGA==
X-Google-Smtp-Source: AK7set/CV/ZM7hd/l3fjmImnECupChh8gWI0Feh0+HOI2S1BX5lITZZjvlZgjwhlppcpeUrVOzbCiYwLLNVX2ZFcm+U=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr834615vso.44.1676951912861; Mon, 20 Feb
 2023 19:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-54-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-54-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 21 Feb 2023 11:58:21 +0800
Message-ID: <CAGXv+5Ge2aLLTLHajzdwRYtWU3akcZuo8e8z2niVqKMhzR4x5Q@mail.gmail.com>
Subject: Re: [PATCH v3 53/55] clk: mediatek: mt8135: Join root_clk_alias and
 top_divs arrays
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
> In preparation for converting this driver to the common simple probe
> mechanism, join the root_clk_alias and top_divs mtk_fixed_factor
> arrays.
>
> This commit brings no functional change.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
