Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25E2C636CD
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 06:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjBGG6w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjBGG6v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 01:58:51 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0609125296
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 22:58:50 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id b11so2595101uae.4
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 22:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R5I8DVYK4b9McA/r3M/11XMbXDM1r/KOU7F9x3+nTK8=;
        b=i4IRGldyz7bsyO1yl+IwS+9uwH6TMyV3ZceFsE+hkKuyuOx0ipHR+mGOTj/7GGhHqg
         JEWMJKhl/Y0LbmgZVsPIr1PB5uzwtSDsxCwqa9Ay+JfcnsJnD4o7x8oQ/0RZZVdj7NGe
         /l4QjrMriXwrW86obfM26x68oowkuCTXt5VYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5I8DVYK4b9McA/r3M/11XMbXDM1r/KOU7F9x3+nTK8=;
        b=XeQM3f0OgUjEDkUGOM+pryZBmeLGStiA9fqEE3dcL+o0HGkXYLU9yA2KJ2vvkjp2i4
         8Pjy4jcJyY0T3mxFVpyMNMIapMbuRymgAk/mXGzKSXFSrUTTslHt0X1oOz8P4nrty1Az
         VwNQtgUAkOuHJgmr7zcDTdGVUKZ9h3TQGjhVtLldFXG68fKPmwywyIg50zlPLqbrKmuD
         2mgegz7PEBpy1GKbJZ0KzrO1sWoADfDg/DUoq61YZscbTAf9NeE/28hzarIPYTy8QaA5
         etepybrv/559XlLGFSVBlDI6po+RIZKtqWLH4a5xhb2SUyqlBO8MzDcxkhVgGvArYg7A
         bOAg==
X-Gm-Message-State: AO0yUKV7l1+6YHvwUPJPqpVGYGr2atXX5WnCkBDByyl/D7khRQBdPqcz
        XXdcICNCOsi7335knYHiVd+D201Q372MPxtrMgHCXw==
X-Google-Smtp-Source: AK7set+78b7Dxso6dKCLZowVq0wZELWdMYO62DUcepaqgTDKO3R5fnsrULG8pV1lDnlXoMYJn3L42i8V4EcTZgbjRSw=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr378300uar.55.1675753129141; Mon, 06 Feb
 2023 22:58:49 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-7-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 14:58:38 +0800
Message-ID: <CAGXv+5HiWU6MxSCqW8a_7xKA=-HKQSnC9EvT5eCtbpAqguq7tQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/45] clk: mediatek: mt2712: Compress clock arrays
 entries to 90 columns
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
> Compress the clock arrays entries to allow a maximum of 90 columns:
> this greatly increases readability and also generously reduces the
> amount of lines.
> While at it, also fix some indentation here and there.
>
> This is a cosmetic change. No functional changes.

wdiff agrees.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
