Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EA0C4338F
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 08:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39FF36120C
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 08:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243871AbhHFIPg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Aug 2021 04:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243559AbhHFIPO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Aug 2021 04:15:14 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01323C0617A5
        for <linux-clk@vger.kernel.org>; Fri,  6 Aug 2021 01:14:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bq29so16403427lfb.5
        for <linux-clk@vger.kernel.org>; Fri, 06 Aug 2021 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/jD/avfm2p41lo9b5VPwnKdxplJeoAf0dQTUMIW6jWE=;
        b=vEkPvb8W6TaWes4EedDII8c+Hoks3fgwjH5i3tESoywvbi7+98gqjT1/CM62CxTu7R
         sJjuz8NqygDBFUjysOc2cQi5CjhufOz7NFHxlO5F8FW1+zkPZXUNcOdvVStjyVxV4oEW
         PpQvWbCMnBbu2NCyjE0OjKNnhXTbQH9D6qkRVwb/bgGgaDcroZ66hT9C87pHwxmNUai8
         G+gGgr/lqFp8hodH48urk+xyPv7iGKaigPVe8DLDdA0cu1HdvhrEROjNGcwa8AQgzLqb
         +fDxpiywqEV62svQFJe06JHnjPD5X5q1qVn2db7DDTjsnXdoAEiMpQc2jajc61RpZ8HH
         5JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/jD/avfm2p41lo9b5VPwnKdxplJeoAf0dQTUMIW6jWE=;
        b=cElF0URQNNYO4H7TY22mQzVG6KN0/Ov90/dQj3Vmb+oTr+wtrc54MmDGeGdk/fYdCE
         aR6gP8LndCiv2cBKs+B/7uMkJV7HmACZC+43xHOjhhLecfgeE9uHIVJWLUlO4m4PMqoi
         Bv1WY5z+0IOX8XTi8VxqDvuhCcHSDmTd6Xl/TFtxan2adMojrufZwjRhlofKb4QAzvIV
         TDVO0pQsntMWmKixa8e4Bylyb/pcSd5WIWVcgjJyN7FsMAJUw6NR/7vX1YDDtrCevL5H
         2/WlmYR7B7UHvW6jMHVeXxolhLj+wvAO+LRW79YjuWPkRasFZDtVUXU+7BWte5Bx+bi2
         LtJw==
X-Gm-Message-State: AOAM530/3wj1s3dt3pCBZE6rEKd/K95u/C59+fNm2WUtu+DvSn9v6Jsd
        Kd04qVXju3pEU3TOIbK/JkOlHIB11kPXWHPpI8jIxHg2XkU=
X-Google-Smtp-Source: ABdhPJwoQQ/ih127w1+ABBOgpekbdUrfbMfwZAngBKpgvv00NTFv2YUzJVTJkvebBkmnU9fO3Kcjc0VMMqIjlV/IlNs=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr6912020lfd.529.1628237691324;
 Fri, 06 Aug 2021 01:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
 <20210801233314.3150754-2-linus.walleij@linaro.org> <YQejHNP1AzFHZ6gK@google.com>
 <CACRpkdaK0pBgmFSazjJ5NOj9rF9DzUyCfumxyi8PNaS_61_=Ww@mail.gmail.com>
 <YQuaiW/MSZY4bmok@google.com> <162820748053.19113.16240444817751473992@swboyd.mtv.corp.google.com>
In-Reply-To: <162820748053.19113.16240444817751473992@swboyd.mtv.corp.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Aug 2021 10:14:40 +0200
Message-ID: <CACRpkdZfb4szcERUynqOaGrV5A1LbDSo-gSebW8dYmFE_=P6XQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: db8500-prcmu: Handle missing FW variant
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 6, 2021 at 1:51 AM Stephen Boyd <sboyd@kernel.org> wrote:

> > I assume they will not require an immutable branch, as the turn-over
> > in this file is very low.
>
> Seems fine to go through mfd. Isn't there some other ux500 patch on the
> list though?

Not for clocking, maybe more MFD stuff so merging to MFD should be
the best option.

Yours,
Linus Walleij
