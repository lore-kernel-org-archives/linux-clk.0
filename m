Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A324AC11F68
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 11:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B4206140F
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 11:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbhF3LMY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 07:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhF3LMX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 07:12:23 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF4FC061766
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 04:09:53 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id k8so2750790lja.4
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rm4+AwW3LWH2YQHGgTfNo9gJL+afdzfJtfRIoJfvAJc=;
        b=IE4nSEae0+ZNPzwJoKlwld0IYMdDWkixjHhLI3tUBqdFmS+a6KK5cYvjzyrNiwZmdF
         Z0m6eXqZtwFMVuQd3GrlSzs2UcjhKOZHgP0a2+UvPrLvGf6REbtdTFZU1RZeiK+YMpi+
         XfOkbN6NpLc+GUcqYnxdCqJta/t/pBzt1xKP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rm4+AwW3LWH2YQHGgTfNo9gJL+afdzfJtfRIoJfvAJc=;
        b=rGkpzwuK3PTlzBIchW1/AaCRJ5PHRMwG/TXJMcbQpUZ0fMm23hAui6axkzXIwJ4xvB
         B5oPs4p0J1it5pe/RHB7nLWhWGUQLaOiGisjVLqwWM3GYx6Vox+hAjCovO8aPc5JDqo3
         Xeqq8z2XFUw0oImuI6KWK8jAyGiXYslaswDGNLeC8ruiJIjy9soGlIctkwXztoKQvxwB
         aMAHh3q7dMC8vXQZm+i++dXPL0v0ucpFxD3l37xmDxJ0iW+puGh1aHNpvGbG6JKlVLaT
         fTHMYKuhjG2z1/lFw5+YC3piSNO8puBxd9mEqNEhVf12HL0bPR0ukbHMW9J9y4id7DTa
         OYXA==
X-Gm-Message-State: AOAM5327PPRVgxo3CCCLDNVytWDudeqCucgy0y7oDs7Kx7v3nj+9qUYj
        B5t1LC7KrfMsIe+C3v/NC7VQZHdY3OfUa33Tnz872g==
X-Google-Smtp-Source: ABdhPJzHKuADQa+MobKZ58Bk27asyyFyPDlClM32paRLGxROtq0/z4kqJ9wzvBtX+VJ0lDLBPbqJCGectO03IhUHOfg=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr7332089ljp.251.1625051391558;
 Wed, 30 Jun 2021 04:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-4-chun-jie.chen@mediatek.com> <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
 <ff6179e8-06f9-fbba-c704-a74381c2149a@gmail.com>
In-Reply-To: <ff6179e8-06f9-fbba-c704-a74381c2149a@gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 30 Jun 2021 19:09:40 +0800
Message-ID: <CAGXv+5FXuMnhsnytLYKKA9YE97bps7KnkDNADvv8f_wdTqnrfg@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 30, 2021 at 6:53 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 30/06/2021 09:31, Chen-Yu Tsai wrote:
> > On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
> > <chun-jie.chen@mediatek.com> wrote:
> >>
> >> On MT8195, tuner_en_reg is moved to register offest 0x0.
> >> If we only judge by tuner_en_reg, it may lead to wrong address.
> >> Add tuner_en_bit to the check condition. And it has been confirmed,
> >> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
> >> clock square control.
> >>
> >> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Though you might want to consider converting these types of checks into feature
> > flags.
> >
>
> Yes I think adding a feature flag is the way to go. Luckily there are only a few
> SoCs that will need updates at the same time.

I also see that the different clock modules are tied together using only clock
names written in the drivers, instead of clock references in the device tree.

Unfortunately reworking this would likely require a lot more work. I previously
did a bit of internal reworking for the sunxi drivers. While not the same, I
think the plumbing required is comparable.

ChenYu
