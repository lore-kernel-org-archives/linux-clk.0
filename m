Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B434C43460
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 09:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3784613CD
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 09:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349818AbhDGJAo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 05:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349823AbhDGJAe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Apr 2021 05:00:34 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263B8C061756
        for <linux-clk@vger.kernel.org>; Wed,  7 Apr 2021 02:00:23 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id j7so13200694qtx.5
        for <linux-clk@vger.kernel.org>; Wed, 07 Apr 2021 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
        b=kkQOW1FEjeAuK4pSRWDAdhG6BTn98oaYU5CXLmk5LoQRxwLgIFMtcfz+yNOUKcVezU
         wp5fJQIdGN4hXvwFGYOhgvrc5dNVPvNvgN1fNEnOZoQZwLIqWZ5UOfnnOHYkUeWkej++
         h+HuMRIFphgMWtV6QRs0aBrXTKqZCAPcEBXdxYmjPMruEDSC3P0K6D0eGjsHHmSmW5iT
         3eB0xKzkF0Iu7CWkfeuSj6Imeg9AdH5nW1g/6/voQLnt/FSWuit973ZZw9Q6Q9h9Uvg+
         pmiOFE5J6hAzTc2AguIoltt9XtP/o/ScTdlw9kCgacNjhDWxFf9gQVVgWLqTSPsa4Shb
         x5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
        b=aIjoskOmDx/4yNlq2OnQLQTTRpkJ1tEl3jfyRtCW8ib5qiDR624RsDjIbsIwP+yhVy
         pCnw6GSP1YEsB0MLKW8APz6/uZc3X0HPZhWi5T6NXxk5iNEZD+o/rnpGyvZNtJMH4p5H
         eXaGdqedRrr7pkTmMvH9VOSCKF4aW3F1sw4ZmvDHumoIYJdvrlno7yCekOnM82qU4ORc
         LRUCjMCLkFGyITJHmicLjrml9qNhVZ/UIcEcKbh0hLHbRuGn0/SpN1b3rKUlxAkdqhN1
         TDRoGI/i5/4vMNrAJAsQu25ooTT8ihJRZb9fXLXtb180LJMJEFagReYSLSpyichQoED2
         rJvw==
X-Gm-Message-State: AOAM533K4LlqUiFtCpY6wqFlckdWLAxj3Izh+7rFXzp8wQFSKLQXA7Wi
        EqSPpJRqJSvihLVKiIFjW4BaVfW4lXozpPBqOTmEnA==
X-Google-Smtp-Source: ABdhPJwpVpHl5AgfUWWZ7rFE+fTLLWSBLG47+bo0fY9bos4oOj4bPlOhokymeav3cksyRptLE/cPLlYDQRqm8B0+fp8=
X-Received: by 2002:a05:622a:1716:: with SMTP id h22mr1818569qtk.273.1617786022398;
 Wed, 07 Apr 2021 02:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 7 Apr 2021 12:00:11 +0300
Message-ID: <CAA8EJpr7MazgHfL0qQiqfXvRn8T+ExnGhn-QFa1Np-fBhXn53w@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
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

On Wed, 7 Apr 2021 at 02:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
>
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>

Forgot:

Fixes: 0b9266d295ce ("clk: fixed: add devm helper for
clk_hw_register_fixed_factor()")


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> getting it into 5.12, otherwise there will be a cross-dependency between
> msm-next and clk-next.
>
> ---
>  drivers/clk/clk-fixed-factor.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>


-- 
With best wishes
Dmitry
