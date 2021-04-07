Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D010AC433B4
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 22:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A070E61184
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 22:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhDGW5Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 18:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhDGW5X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 18:57:23 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1988C061760
        for <linux-clk@vger.kernel.org>; Wed,  7 Apr 2021 15:57:13 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id l13so36102qtu.9
        for <linux-clk@vger.kernel.org>; Wed, 07 Apr 2021 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRs+CscktAAF86xhY4f4Gc+d+jTkYYtuzHlchmkbnGo=;
        b=DfQ8LfVYvhwJp3KWDRqYgmqB9J2punZRzzRcoTUoQjh3+MbEDBCELLIEcQYM8gDRxs
         2pLMt/ikmgNZjPORvJIzHWot8kz9+TBZSpXZc6dQQ18sj/XSWiYSSPQ13oXew7L4GVoR
         CEgfP0L86Z9Hho/7GGcm952dR4VN5jK7iDHAweRaOEnbuMvt2GICHE8X8lmcswsiAzdJ
         ykQj4d1u5EDW/WC4CBfUAUBa+IPmmYpet/uhQRZiOeFnOUxFDWAbi5Na/PyjSgoPup8L
         Goxqa5RSRF3R7m167JYmZGo1zEzkEBUDoJBUpD3kZwwCJIwetdzoGS1NiHaPoJL4vzbi
         RzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRs+CscktAAF86xhY4f4Gc+d+jTkYYtuzHlchmkbnGo=;
        b=nyz/17jo8GLuiTn9BAePo4qMIqkn/bE+AFETmHo0/D2cIfdPRbwSBtXmZH03z68Mtw
         EwcfqTSaZobsUejMcIQvX4dFhWE87ZIYQBZ2KHXUkUJkHRKQb3tKlZrXh8rqTQ0Wy7+F
         YHh98YDejvfgyFd59nGnADoRTGbf+VbCbQg7t+O1VA/7ZQZGacuTkzyM6vzKS/j3NMOT
         5Hc56ICaSmbSOwalgfxJLGwd/DZj0ZtkLhx42VNCdJnWZ505INdyZxPZalMjPKn8JNFk
         /cbgS9DHZy8HtX3mjDPQHfNk6FUtv6zk8uLeyu3XVEUdrX7FZXHJkFo+2wgsnHV/0ByF
         oMXg==
X-Gm-Message-State: AOAM530HNRxPOn6n+lW0w9z4eOZCnJbWgOx8jlmIAM2Ey4ndvITnpMwJ
        B7/r3W/axvsWnZgHg3J6jUPASROD5INbdU8AAdIbiQ==
X-Google-Smtp-Source: ABdhPJwL88K+C5x/fkGrHo0TqiM6J9CldMCEqdVeQBU6fBx7RyibSpm1pEKspE22YHyKc4R0qTegCJgblL8XYRbbO3I=
X-Received: by 2002:ac8:d4d:: with SMTP id r13mr364364qti.298.1617836232951;
 Wed, 07 Apr 2021 15:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org> <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
In-Reply-To: <161783530964.3790633.16412468884239960912@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Apr 2021 01:57:01 +0300
Message-ID: <CAA8EJppsM1sP=OTiMY8jsLLgU=+p3qgZDD7M+M5naJhfFEF_Zg@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 8 Apr 2021 at 01:41, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2021-04-06 16:06:06)
> > devm_clk_hw_register_fixed_factor_release(), the release function for
> > the devm_clk_hw_register_fixed_factor(), calls
> > clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> > after that the devres functions will also kfree the allocated data,
> > resulting in double free/memory corruption. Just call
> > clk_hw_unregister() instead, leaving kfree() to devres code.
> >
> > Reported-by: Rob Clark <robdclark@chromium.org>
> > Cc: Daniel Palmer <daniel@0x0f.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> > getting it into 5.12, otherwise there will be a cross-dependency between
> > msm-next and clk-next.
>
> Think I can get this into the last fixes PR. One question though, I
> think this follows the pattern that things like clk-divider.c use for
> devm. Are those also broken?

It looks so. See e.g. the devres_release() function. It calls
(*release) callback, then it will kfree the resource.
Also see Documentation/driver-api/driver-model/devres.rst, which does
not kfree() in release functions.

Do you wish for me to send all the fixes?



-- 
With best wishes
Dmitry
