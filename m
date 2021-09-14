Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEF2C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC076610CC
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 03:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhINEBG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 00:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhINEBF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Sep 2021 00:01:05 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2DCC061762
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:59:48 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q21so21200415ljj.6
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5OlzavEWnufbwMW9A/eR0vP7IHNpTn//InG4QBRhEw=;
        b=kdFc8tUhNaNEhrjDOP4m70m5hJq0TXdnz0rnbOzc/ALBYlv6g7fMhlS0iOw5mps4Z7
         ItZH9GoCl/rufW5wf0ao/JmKP9qoFXhL30hH2UIGMLGgxz1UBWzLlcgU+FBz2FQa87nF
         fDmExZc8hr/dL1h/RSR1yAI8TWolCjG2LFBIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5OlzavEWnufbwMW9A/eR0vP7IHNpTn//InG4QBRhEw=;
        b=U2jzgIbLpxN011ttrP+4P8Ej8njZd2TteiNaIswjWj29QGtD5X0Iclv1wz12FOtFPB
         5oA7nFl2E41FnR57gqV7Gv4y5kTLDJ/WPQZDNAgF2kfiMVN8980rzfjSzXoqFDAAj/JU
         vvaq3d+l4NKDxp19+rW5pLqZJYe3pfxSjlMMH0v0Q5KM2QPpKvDbRX626/KPJbCT3RCI
         76CTUft6hivGa3hm/Trafc94GRWyrc9UTpZjpKchMj6mnvQ3DeuoEPt3/SF4Fda8i8xf
         CrG8pbp5qwcUDa4ny72KGiLbK674QFpE30bCenmjrfZQmtsBXKp2530T17c5SHHwdZ41
         PS1Q==
X-Gm-Message-State: AOAM531+23vq5O73On+2zO6Vl+44jm8Ri7VgCmlSCwBy1w1KrNGsIf5l
        GIEpQ78N9G+bTd/QDvFHKJqw7i0oCXgEMs6xB3Pr4Q==
X-Google-Smtp-Source: ABdhPJxz3tXcGotEGCpfsh/LNJdjDfZn+6Q7wCSUUy6z0nG1j2UL769wKfHW7P19kJeUhTBkHqpbx4AG7Tp9mwO3tE8=
X-Received: by 2002:a05:651c:1505:: with SMTP id e5mr13491184ljf.9.1631591987302;
 Mon, 13 Sep 2021 20:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-15-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-15-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 14 Sep 2021 11:59:36 +0800
Message-ID: <CAGXv+5ED0p4mgcB5sOwB3MQBy2+PYq-tcaqL7xW7FHRG07b_Yw@mail.gmail.com>
Subject: Re: [v3 14/24] clk: mediatek: Add MT8195 mfgcfg clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 14, 2021 at 10:17 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 mfg clock controller which provides clock gate
> control for GPU.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
