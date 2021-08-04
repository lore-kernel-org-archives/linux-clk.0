Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB33C432BE
	for <linux-clk@archiver.kernel.org>; Wed,  4 Aug 2021 22:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BB7B6109F
	for <linux-clk@archiver.kernel.org>; Wed,  4 Aug 2021 22:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235384AbhHDWw3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Aug 2021 18:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233072AbhHDWw3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Aug 2021 18:52:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182E2C0613D5
        for <linux-clk@vger.kernel.org>; Wed,  4 Aug 2021 15:52:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f42so7194002lfv.7
        for <linux-clk@vger.kernel.org>; Wed, 04 Aug 2021 15:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYdZtyj8pNJFHp1KzrJy5cVFfneYSipKoxottjQPwPY=;
        b=doSXqBlBbAIFWmKvVcXxT/K32bvtAZZBK2FEyHzxixpcjRxWFOx5udQqJpS6DdhtUe
         FL6OBkaguKCSYQAvHnzfiO0SLkhTRKxL7FoaP745lcIisR4UxslZW4xaAUoGk5sL254z
         dPbVtjCVGSnJOwY+ifIHr6gVFxZx7b/1x5vAzq/WvplArlpLcM6kpF3eLtdXYFOukoPW
         gFxu+uT5qKvWCWeKj/nDRJJTZ3rNCo9FZyWE3f2K4S4vtFaaxHDCQsNUbPoZIq4mPh34
         ykez7xP+bCu8oV26aiyBysa0HQ3f6MBXVuZnnK32yWUWEelmtGzNtyBhl5aIul9VHvEe
         kPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYdZtyj8pNJFHp1KzrJy5cVFfneYSipKoxottjQPwPY=;
        b=CAr+9Naz7sQidv6Qpi9ZI9eYyL/U2LTkVPJey5qzSBYpfmezv1DEeMcgDzD6GhTBMn
         NtKVXKZZZZ/0zWNVV4jz0vsXEVhfLrGY514zFkhjAcrbS6TQv5k089jbsOP7XQA7kQnb
         XYpTLIZoTFD5hYOPBcDrmR17OnwCXN7cu5m9wV3Vj2NUPWog0aqvX53pgfViymQ8p9PR
         kHFN+B7gpz+xbz//8o8PXh32ZTbSc8YUVrXvTv6vul9jnsH0frIlspQt7+6fGJ4L812O
         1VroPwc+FypBMAxLcctu5UHtvzHwBAVEMEBk1vP1QzTCsB+lvYWrmqF0PuOo/3gRTykb
         wHiw==
X-Gm-Message-State: AOAM531ml+zBoDmwMbA3vdAeK9zvyPi/L3/lLPkttfMI2Ee2OInNiI0s
        UWIRAeqzer6SnP7FbxKBCQMPOhGYjdrsFLuNn3lwzg==
X-Google-Smtp-Source: ABdhPJxilMlJha+CPg1BqDjtl7sd+Vy6Ff1gM+CV6JM+oj4VrZKGn4WYEmB51egRJoRDeYJ/4vNw3rBQtVbz5qFDYF8=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr1051247lfu.291.1628117533435;
 Wed, 04 Aug 2021 15:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
 <20210801233314.3150754-2-linus.walleij@linaro.org> <YQejHNP1AzFHZ6gK@google.com>
In-Reply-To: <YQejHNP1AzFHZ6gK@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Aug 2021 00:52:02 +0200
Message-ID: <CACRpkdaK0pBgmFSazjJ5NOj9rF9DzUyCfumxyi8PNaS_61_=Ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: db8500-prcmu: Handle missing FW variant
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 2, 2021 at 9:47 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 02 Aug 2021, Linus Walleij wrote:
>
> > There was an "unknown" firmware variant turning up in the wild
> > causing problems in the clock driver. Add this missing variant
> > and clarify that varian 11 and 15 are Samsung variants, as this
> > is now very well known from released products.
> >
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Cc: phone-devel@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Clock maintainers: could you please ACK this so Lee can take
> > this into the MFD tree? The chances of merge collisions are
> > zero, this code changes very seldom.
> > ---
> >  drivers/clk/ux500/u8500_of_clk.c | 3 ++-
>
> >  drivers/mfd/db8500-prcmu.c       | 6 ++++--
> >  include/linux/mfd/dbx500-prcmu.h | 3 ++-
>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Actually I intended for the clock people to ACK it for you
but since it is completely independent of 1/2 it actually works
either way, maybe they will rather pick it up, who knows? :D

Yours,
Linus Walleij
