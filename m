Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD8AC07E96
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jul 2021 08:53:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D2EE613C9
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jul 2021 08:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhGFIzz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Jul 2021 04:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhGFIzz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jul 2021 04:55:55 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B12C06175F
        for <linux-clk@vger.kernel.org>; Tue,  6 Jul 2021 01:53:16 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n14so37033576lfu.8
        for <linux-clk@vger.kernel.org>; Tue, 06 Jul 2021 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/E4OXQ1yUpcqpJdsE6nCWBhoSFlkIPmfOxX8aPkV7w=;
        b=DTYiCFTiGgpyS+RK6tZKJbgUa+7mHga1RvVfVrk1e4Ldm1sbFpIZhGm7tIjGiHqEBn
         H+WdoNqqVTu5IzizCAHi0g5LLOV97JSXDujw598jH/XTyT3VvYHCoQTQm9f18n/Vv80G
         C7r4OLiRmY0K+sUaaxK0lUtNlsNlneXYi41RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/E4OXQ1yUpcqpJdsE6nCWBhoSFlkIPmfOxX8aPkV7w=;
        b=fv/Vs0PHdndWbqdVKwWkUBqZA7wydYz7fk3i38sbvrVTBDrMsJO8zTq5HHVITjKK6G
         nliccbgci/fphxTmoxOuXqz7mwUhZLMLZExVAY7foAfoEyiNxXOGWCi8bU6sk4di5Knj
         LGJDelb+b4S2mQZAQdFl+75S3+Y0c0kesIKFaK+aYRZwmerCg0P5Cy/bL7CZWLYDh9wc
         VFrhziwWSUmln2pxXCYfY+hwxl5MguQuzf05ezFmdoL804HnNdS2Nf+mBi40kfmituG6
         KRD/bwZoKeAl9ZRlqIp+KRPhm00W6Z2ZWnkKScL79cE+QmPvgu/ougKwcepbLvjotmIh
         zl3g==
X-Gm-Message-State: AOAM531sfwSlaNgOEVHRxU4+z3yTMIafbTBFjJN9eNAmXys6/g1SmEUS
        Hk0VSnauBvPUgca+fm3ZGDTjEtWsdcsgIkuYSIu9Mw==
X-Google-Smtp-Source: ABdhPJyN89wCwWKtKG3ZEK4xjbWdeK9ZZ/vgy3TxGsAGRi1r3BmzHgL8UfUr/Cu2Yy+9OcrWcEyzkdPQuOSJqRgs2VM=
X-Received: by 2002:a05:6512:3f13:: with SMTP id y19mr13831825lfa.444.1625561595053;
 Tue, 06 Jul 2021 01:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com> <20210616224743.5109-8-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-8-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 6 Jul 2021 16:53:04 +0800
Message-ID: <CAGXv+5H9d48uZgQPNk6pnwgeduzq6Ov6aRXoNnmKpFDuPL1dew@mail.gmail.com>
Subject: Re: [PATCH 07/22] clk: mediatek: Add MT8195 camsys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 17, 2021 at 7:04 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 camsys clock providers
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
