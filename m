Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F99C4338F
	for <linux-clk@archiver.kernel.org>; Wed,  4 Aug 2021 08:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6E4A60E97
	for <linux-clk@archiver.kernel.org>; Wed,  4 Aug 2021 08:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbhHDIrc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Aug 2021 04:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235690AbhHDIrb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Aug 2021 04:47:31 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA86C061798
        for <linux-clk@vger.kernel.org>; Wed,  4 Aug 2021 01:47:19 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id e5so2263261pld.6
        for <linux-clk@vger.kernel.org>; Wed, 04 Aug 2021 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=InXh0ZewDnVE3/EXE/5G6vr9J7FYgjjlp8cmjVMqfuE=;
        b=Fz917nsuQs2+mXnhOwh0eg0lyWwiqrXaG43Ph5sz6S723Hee3bPd51BqJZTVBr+7yD
         UFUSEv2ukB7t3YueyEaPXTLQ+HTq/mQgTiNgXKGN+98w3deh4LnWEHIlFTk1Xr8WHkbc
         xGu24cNwKBD3nTRzTbWzqqTS0b+99HADJPeORXk8lY9jzk8DZo03lMsljcNID5eANEoz
         LXP0gglJDYae9YeM2cbxYByeJj1o6A3SPKaEc1YvARCCem8DffQv3QDNmBDDunTy6ci1
         p2OIqloqZfPSXpKZQxKPiPwAds/dnfVRYvBANfuSPtuWLpa7koNTKunilpbzv6mYvcD4
         wv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=InXh0ZewDnVE3/EXE/5G6vr9J7FYgjjlp8cmjVMqfuE=;
        b=KsUSN1B2nor0cw2UeA7Y61/NQRUYUTgwStgA+nfkhl21VdfA8jEuFt+7eVCEzh7djH
         E1/CXBt6XODfUimEpkYC4SzWXL7cxjknryTk3lQp3ileiaWbpwVyvpSnFNah798qKeGu
         JGdZqeY1lWOsPPzW+RC6tdfp59saBpPncYgtK5QrnnITkNukxwyP/5kyjxrsHe/MKgCg
         HjN+EAJDQc+D5pguO3Azi9Xd/2TmZKYMFXsJ8Vp9gPxuOh2eurmuWSmYX0z42O0AHQbj
         fnUvGi5SjaPyVnEo4XPqThjEbJHXrKSUKjDpyROL7ZA25OSKJtVelVirJksJaKPJD5kN
         M1XQ==
X-Gm-Message-State: AOAM533hjHIhTSLsf6dUFIn7zA0KLIGO0tuJ1BNjBKWLSkOwaxI4Nvxg
        Xn5cj9oE1JlqXWf6fSSXQwIIYQ==
X-Google-Smtp-Source: ABdhPJwEsFY1wRk2/RgSw7iviymykJUOEEzK4eAELGehCHzGMl7FI1bYiaYze6O0ALeZtuQCryLOig==
X-Received: by 2002:a65:5846:: with SMTP id s6mr211661pgr.162.1628066839309;
        Wed, 04 Aug 2021 01:47:19 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c2sm1242741pfi.80.2021.08.04.01.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Aug 2021 01:47:19 -0700 (PDT)
Date:   Wed, 4 Aug 2021 16:47:13 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add MSM8939 APCS/A53PLL clock support
Message-ID: <20210804084712.GA31145@dragon>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704024032.11559-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jul 04, 2021 at 10:40:28AM +0800, Shawn Guo wrote:
> This series adds MSM8939 APCS/A53PLL clock support.  Most outstanding
> thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
> (little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect)
> respectively.
> 
> Changes for v2:
> - Reword the commit log of first patch as suggested by Stephen.
> - Drop 'clock-output-names' bindings and use @unit-address to get unique
>   a53pll/mux clock names.
> - Use 'operating-points-v2' bindings to pass frequency table via OPP, so
>   that we can use one single compatible for all 3 MSM8939 a53pll.

Hi Stephen,

Any comments on this version?

Shawn
