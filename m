Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6CFC433ED
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 11:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EBE76138B
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 11:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbhDGLhu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347001AbhDGLhs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 07:37:48 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8A7C061756
        for <linux-clk@vger.kernel.org>; Wed,  7 Apr 2021 04:37:38 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id g15so18263859qkl.4
        for <linux-clk@vger.kernel.org>; Wed, 07 Apr 2021 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
        b=oopYu+YQ42DBdZzN3yOYVkLE34+WNijKBfVjcKw6QPwW/mRKOs2n2G4L1YfBrga8cx
         220R9uTBCCRVSD1cy6bDEd7gA1lnF9TD+T4FpdSH5e6pDE7WFLCti3vaDYFyC2SgaM9z
         dzLQKaRLpCgPt311J8OYBUcFJAbeRxPMkE31g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
        b=p4LW4k5yDcgz/yTeLH4klCIH/ogINkgdVhvCg3XQjnH4Jl4gKStqD6lx0lRATqkMMK
         4wSwQmx9LmDhZp7UN9zxw8vgD6Iqlu+jvWRveleErxLhsNct8WPgV4ML356V2f5N3sLi
         mh8uMnE9sDO8SWLBi+fSDj4fWEsh4KvutQeRgN8uOGDAepAceYKASAUhaZKHyrJhRn9D
         dXJYku6fb+nt+IOjfVcluDvUprcwgsFkUj43KvZv2Pl1Kk9Wk3umPJTRwlw7jAgp6GpY
         yCNOXAVjLdS8cgzeT7PH6/FPxhw/y8cDCgft+JYedTjBxiUqihtwoXM3DQHp4YsUkxie
         8WXQ==
X-Gm-Message-State: AOAM531D1tLc0lDl+1mFlEI2b+GmcsqzZPHIWvdYamNT+QOztmeCFCza
        jEi14yDAZI1DcZDQCE+FPPuMO1lGwsTKgKVqd9rIiQ==
X-Google-Smtp-Source: ABdhPJyA5Hg5hcZK/lrBzsOg/7n5zpjnXNILiWuDcgO2g8kFHFN6fUKV9nWalWac9N9CBudJ/zH0+3dvbyRGFrd6m4Q=
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr2714172qkg.468.1617795457907;
 Wed, 07 Apr 2021 04:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 7 Apr 2021 20:38:56 +0900
Message-ID: <CAFr9PXm9oStJ4oKNaGCGi9sXBTc-6iDZJZTWvumWHiFwwcRPnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

On Wed, 7 Apr 2021 at 08:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.

Doh.
Sorry for not spotting this when I wrote the patch.
Thank you for cleaning up after me.

Cheers,

Daniel
