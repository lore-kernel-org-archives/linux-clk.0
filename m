Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FB6C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 23:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F20C060F12
	for <linux-clk@archiver.kernel.org>; Thu, 16 Sep 2021 23:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235315AbhIPXDS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Sep 2021 19:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbhIPXDR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Sep 2021 19:03:17 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934E5C061574
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 16:01:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b15so6302373lfe.7
        for <linux-clk@vger.kernel.org>; Thu, 16 Sep 2021 16:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I88O2deracsP2nTJbAcwQpMBgM3SyRj1NZl/AuHPqak=;
        b=ZMSObsnM1clY/elkkkLTkonZpqSGvnAEgyzh69XBaV5Ytk1mHX/uuDdNobVlRjtQtL
         igL3USQ0VpnCXglBmOUzzykgidBULa9cD+WrE9HTNdJavsd9yp4HQJXOb5JaGVOM4ij3
         BNpBzyld9n2orw+o1n80yFnSI7TrblDwxmt8TLZdXflO5zDQdcdvRDrpsya+KNn+vy8Q
         FRUIWexMv/jIRL8Na+wnwLWC0FAwFozGT67mzLnwTDnVh3h4us6aBnvjHhtbCxnHFRcD
         hRWIM0YS0q5gR6n7CaaWSr180gMyhjdK3W61CjjjCxxcuysYi1ekb67d7ydiH23cW1DO
         AJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I88O2deracsP2nTJbAcwQpMBgM3SyRj1NZl/AuHPqak=;
        b=Zpp+dW26wU5KfeKIOXGPLQbZlOXvehfofQFuEgUofzGUm46AdbeN2drnDIBcCkgM5i
         JjvFq0AvWRwmK4ksPK1GZr312FRnQK9LT04AIXgn22cvjH/Bj+V1khbJv8Pmoenw+IOf
         OgMQJC4Xe3gIU8KNhYx7AJ6sbO8W6tRNP6YiiwahoCxAPZkY0/LALjymH6cqIfKCAX9U
         y2GXcZXpKdiNHHIleinIEXBkuCJZ8aYnXXbkPW3xV/XDZUIhiStJUFxG2238/kXkE4ZK
         /cEX7aMcyF+os7IQSG/z541VVUu+C5dlt5yYj2rcPFHnpOGQWWDC7VaWP3T5VldSkQP4
         eGdg==
X-Gm-Message-State: AOAM530TNbX9I07TrUoVf+CL0o1CFskLRcFHsOWgOy3lGkm5Yhk8AlPg
        j+cMxATcggAe4hyA5FmvxGt5IRFN0kekI2pm7jIrRkJAUgc=
X-Google-Smtp-Source: ABdhPJxaV33dFEr7zQd1FCcuaaBfT6tD0HqRUZETwVe6Ki/itQonTiG67ObxZiU3xUIoSq19Yk0dAZtf75buwai8fFQ=
X-Received: by 2002:a2e:b5a7:: with SMTP id f7mr6960198ljn.19.1631833315011;
 Thu, 16 Sep 2021 16:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210901180833.4558932d@endymion> <20210901180953.5bd2a994@endymion>
In-Reply-To: <20210901180953.5bd2a994@endymion>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 01:01:44 +0200
Message-ID: <CACRpkdbOxM9K-YCq82Rkqq7HSZkMAWb7ixT7ZR9CMtMrPHti6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: versatile: hide clock drivers from non-ARM users
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 1, 2021 at 6:09 PM Jean Delvare <jdelvare@suse.de> wrote:

> Commit 419b3ab6987f ("clk: versatile: remove dependency on ARCH_*")
> made the whole menu of ARM reference clock drivers visible on all
> architectures. I can't see how this is an improvement for non-ARM
> users. Unless build-testing, there is no point on presenting
> ARM-only clock drivers on other architectures.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Peter Collingbourne <pcc@google.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>

OK then:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
