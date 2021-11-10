Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D38CC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Nov 2021 13:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37AD46115A
	for <linux-clk@archiver.kernel.org>; Wed, 10 Nov 2021 13:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhKJNSP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Nov 2021 08:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbhKJNSH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Nov 2021 08:18:07 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCD8C061767
        for <linux-clk@vger.kernel.org>; Wed, 10 Nov 2021 05:15:19 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so1830053pja.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Nov 2021 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1yCHgjbyfVlE9NXxBH+wF0Mqhh6seG348lIJvipGlOA=;
        b=N6h2wrcPPFOSS6IWRK2dv6tAVz5v/j8iu2nbifO6aO2oDG4kVTex/fi7sVth7yhquL
         extanHsAjvvRRVuv+L4vlF+EuSY2YcTNxap7ZruDZKIE0pbhLHcs3eTU7W0kvffTJYAT
         YweAYoKP4yCn8ZC2Ndlef3ypIDaph4tb5du7aataTCiaTbcq8077pq1mz+/B3mDII9/P
         RymE67mMbIL0uZpDngyY7ECNQ3hlduuaoj/Rrd5pXu4S3JW2W6gZrX0RrhxPowG0RwAD
         axup6E3Mug324XJ0hHJH6QuMl8cQhkXlL6J7ZTdlqfiaimhh9wvXRCbhkqfd9dCP1AaV
         GvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1yCHgjbyfVlE9NXxBH+wF0Mqhh6seG348lIJvipGlOA=;
        b=Ywi3dWRs0nQmzfaSS+XXbBD5ZJR8FmnGKFRqpWe3TxuMMoCJriEHiNEu7mGXnmBV0V
         O/9zpv0CaE0hra64lAUnl8mBy7lSmb3Bq4vcVODqouWmIT/qok0USnQIVRs090yntAzh
         VEnRNgvEEYi39tV9vqyuCCJrpmwGtGWqWB/selzsvTvCuzIttV6m9bM9uphPOzHspH59
         bSUrr82yxq/PYaIiA0NdUTtidMYOq6yKEfwDjGJ+Y69aG4pYdk4Ip7sWiS1LhWbytswe
         dPnKZV0rgY9Xn0FewXUHUN53+FxqbqPDAYRhE9Z+iaRSo0xpulrn8j+Yx+xd0o3LPAkL
         FEqw==
X-Gm-Message-State: AOAM532CRuFzM47bHMY9wUwNjf6wTdsTXhUn3L/RaOrxkCcevHVQAKg9
        tz0eCiFiTY8OqbYFNyGqjbOatg==
X-Google-Smtp-Source: ABdhPJzQfRHy8Bof3ksBZq0H3GOzhBX8F3k9/A14gnSDUBFTiRa1dTMMFRd5W9HTmPnBXYlYjLutrg==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id v13mr16783750pjj.138.1636550118896;
        Wed, 10 Nov 2021 05:15:18 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k16sm18236804pfu.183.2021.11.10.05.15.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Nov 2021 05:15:18 -0800 (PST)
Date:   Wed, 10 Nov 2021 21:15:11 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Message-ID: <20211110131507.GJ7231@dragon>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
 <YYpMzau3CWRQYlkJ@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYpMzau3CWRQYlkJ@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephan,

On Tue, Nov 09, 2021 at 11:26:21AM +0100, Stephan Gerhold wrote:
> Hi Shawn,
> 
> On Tue, Nov 09, 2021 at 10:25:55AM +0800, Shawn Guo wrote:
> > Currently the enable state of smd-rpm clocks are not properly reported
> > back to framework due to missing .is_enabled and .is_prepared hooks.
> > This causes a couple of issues.
> > 
> > - All those unused clocks are not voted for off, because framework has
> >   no knowledge that they are unused.  It becomes a problem for vlow
> >   power mode support, as we do not have every single RPM clock claimed
> >   and voted for off by client devices, and rely on clock framework to
> >   disable those unused RPM clocks.
> > 
> 
> I posted a similar patch a bit more than a year ago [1].

Ouch, that's unfortunate!  If your patch landed, I wouldn't have had to
spend such a long time to figure out why my platform fails to reach vlow
power mode :(

> Back then one
> of the concerns was that we might disable critical clocks just because
> they have no driver using it actively. For example, not all of the
> platforms using clk-smd-rpm already have an interconnect driver.
> Disabling the interconnect related clocks will almost certainly make the
> device lock up completely. (I tried it back then, it definitely does...)
> 
> I proposed adding CLK_IGNORE_UNUSED for the interconnect related clocks
> back then [2] which would allow disabling most of the clocks at least.
> Stephen Boyd had an alternative proposal to instead move the
> interconnect related clocks completely out of clk-smd-rpm [3].
> But I'm still unsure how this would work in a backwards compatible way. [4]
> 
> Since your patches are more or less identical I'm afraid the same
> concerns still need to be solved somehow. :)

I do not really understand why smd-rpm clock driver needs to be a special
case.  This is a very common issue, mostly in device early support phase
where not all clock consumer drivers are ready.  Flag CLK_IGNORE_UNUSED
and kernel cmdline 'clk_ignore_unused' are created just for that.  Those
"broken" platforms should be booted with 'clk_ignore_unused' until they
have related consumer drivers in place.  IMHO, properly reporting enable
state to framework is definitely the right thing to do, and should have
been done from day one.

Shawn

> [1]: https://lore.kernel.org/linux-arm-msm/20200817140908.185976-1-stephan@gerhold.net/
> [2]: https://lore.kernel.org/linux-arm-msm/20200818080738.GA46574@gerhold.net/
> [3]: https://lore.kernel.org/linux-arm-msm/159796605593.334488.8355244657387381953@swboyd.mtv.corp.google.com/
> [4]: https://lore.kernel.org/linux-arm-msm/20200821064857.GA905@gerhold.net/
