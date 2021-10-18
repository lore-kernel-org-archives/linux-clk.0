Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B64C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 03:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BD2060174
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 03:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhJRDkz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Oct 2021 23:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhJRDku (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Oct 2021 23:40:50 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54097C061768
        for <linux-clk@vger.kernel.org>; Sun, 17 Oct 2021 20:38:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z11so63057689lfj.4
        for <linux-clk@vger.kernel.org>; Sun, 17 Oct 2021 20:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Viwd7ANX416+8/ScF5bPasbghx1RgTJkrR17d6lCqck=;
        b=cOss8UMjm8u5At7QCwBuCldQAuU81snSCUVfCFeWgKRMqSf0DCsQz7siTH0U1Ro1IT
         FIhT7D8sWKBuY3xAqgVXx8PvYWHmK1LT9Ad4iHeYSINobQbkGHRCTSat3nTnACQJHkHI
         z1biYPooBEMwIRTUxuhj/MLofDV280icyOCC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Viwd7ANX416+8/ScF5bPasbghx1RgTJkrR17d6lCqck=;
        b=OcCC5JSZD67ianY5m4dYW6G7PDq3foSxI4dNaeZfjQC0SJwOK5JtmUKEw2Ostq6HZN
         4a0zeccdZvNGaxf4G8w5CsW4EU/hv1w/3H/j2HUHsGviFS2jhs17yLkmb5b6JcJVE2JS
         vS1v9bCiTV0BqvrgTXcD/HEOs+xgpZtU9POCfn3uQfbZiSNTqGIE0r5OAQLiwyBMiTEC
         4azRM626CAO2vSBrcrthxmbfp4skCkV7lu03fIPsQC+52QteEFYsEsh29/4pklGHHzL7
         uJ5bd0Vy34zteNHNqJKXm42bNOK48CjH2VgiEfxNXlM0CGLRq94RSQbQqP1Gig4naQof
         a1JQ==
X-Gm-Message-State: AOAM532k4U24f+VV6ZczuwN4bPrORNtNw2Fkbefn9bLO80uB8+psIlIh
        KnHX4TAN9QQAd83465jsDYKp4gZGqr01ukF6mhmcORDTTSA=
X-Google-Smtp-Source: ABdhPJwbqTTbxycWuW5Xz1CaF6uHYs50lpEYQFXSNoEJO51YoQ1Hbke6gK1K0igAWLtI/xW+tGlUpkeJLW0OObOd3DI=
X-Received: by 2002:ac2:4c49:: with SMTP id o9mr28370086lfk.482.1634528317739;
 Sun, 17 Oct 2021 20:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211005065948.10092-1-mark-pk.tsai@mediatek.com> <163425869104.1688384.2477307279117424281@swboyd.mtv.corp.google.com>
In-Reply-To: <163425869104.1688384.2477307279117424281@swboyd.mtv.corp.google.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 18 Oct 2021 11:38:26 +0800
Message-ID: <CAGXv+5HM07is85SyBEQ07TbvpAsi72qYJXtFEsyFcK2WSO=SsA@mail.gmail.com>
Subject: Re: [PATCH] clk: make clk_core_lookup faster by using clk name hash
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        yj.chiang@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 15, 2021 at 8:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Mark-PK Tsai (2021-10-04 23:59:49)
> > Compare hash value before strcmp the full name to make
> > clk_core_lookup faster.
> >
> > It make clk driver probe 30 percent faster on the platform
> > have 1483 registered clks and average clock name length 20.
>
> Why is clk_core_lookup() a fast path for you?

Maybe because the Mediatek clock driver still does global clk name matching
to resolve parents?
