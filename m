Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6443C11F65
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 02:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A861B61D09
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 02:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhF2Cj5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jun 2021 22:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbhF2Cjz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jun 2021 22:39:55 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5B5C061766
        for <linux-clk@vger.kernel.org>; Mon, 28 Jun 2021 19:37:28 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id l11so11460513pji.5
        for <linux-clk@vger.kernel.org>; Mon, 28 Jun 2021 19:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5NQV5GmiN8XNxzjVMrZ/U+rTnRKJBwok1zsUs0fd4AE=;
        b=J6s458LoOKK8MZLlLXkKW0yaKnk/D7Q7mfQmK1j2G7qTwWpLD5nrIAGm9+QxdOUzaL
         IBvN4avW6Z88e5EUXjl2QTStv5T2LHDgGfMhFbSBbtXxOq5rT62Z8yDWssTbvyirThB1
         ve2rzE/WJyz9aUo6rJ1SvOn3jcNxlRUZU2VK/PJSQ2Te5yEvwGIz93BiGbCOfZgNN7VX
         ZsPtnhXba5dJ+t4cohHdPF7gpYP5M3Ai/LwEBP6VEzFc9gPyz6SM+E4rOIezuLvAfHJr
         AwhmfeufuLXyBSqRpXWKIBRw5s2/kTgKnT+fijHPvVZBv0Km0X7ztpN14x7sYDA4CSgC
         xxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5NQV5GmiN8XNxzjVMrZ/U+rTnRKJBwok1zsUs0fd4AE=;
        b=hw6mrk/kzvImwtsIh7lEo9HWNzVMPNU9CcI6G2FpgHKhnWsCRFMtbbIqx8Ifbe5dE/
         ZN88454wqNNfyhyjAIkCURIkP1XuaKaOYHYLlx5/NRi+LevpvSyS/WNjGsCQ32QHWooc
         omnn/yWkJCMccsT1vrD2aR4/QyTu8xO5ZoBDrYRJn+/58fD5qKVhvlQgXaEnB/PXAVjJ
         HSH9eqYuweqYenlo+7EVKcxyno7u2iQU1CPtSIdMgti241SbM2K1HfyCEplQlr1DHSWf
         CcCot7D/xnDjW1Herkr2NlHh3S/WDgjSG9O4BQfVQgh1MqzX97Ld8APTYkHCcN0A2xxB
         SC1A==
X-Gm-Message-State: AOAM531KsOOlAggKHJpxUgXoTvT+gzIf1IgXs2bAC0YGPTe2KTqPQ+jm
        QPIsgJAf3qWzR/WBDG9rKKtAHA==
X-Google-Smtp-Source: ABdhPJzckqXfWKIjjHC5jsGkWkZCL75EPd2xB/vHq9DSJmoLYCN8oBY6YdwpNtwloIaVRZvfUAYhfQ==
X-Received: by 2002:a17:90a:c7d4:: with SMTP id gf20mr12059329pjb.54.1624934248034;
        Mon, 28 Jun 2021 19:37:28 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o6sm15599239pfu.25.2021.06.28.19.37.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 19:37:27 -0700 (PDT)
Date:   Tue, 29 Jun 2021 10:37:22 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: qcom: apcs-msm8916: Flag a53mux instead of
 a53pll as critical
Message-ID: <20210629023721.GA32336@dragon>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
 <20210504052844.21096-2-shawn.guo@linaro.org>
 <162484006132.3259633.9518693749627795895@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162484006132.3259633.9518693749627795895@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jun 27, 2021 at 05:27:41PM -0700, Stephen Boyd wrote:
> Quoting Shawn Guo (2021-05-03 22:28:40)
> > The clock source for MSM8916 cpu cores is like below.
> > 
> >                         |\
> >          a53pll --------| \ a53mux     +------+
> >                         | |------------| cpus |
> >      gpll0_vote --------| /            +------+
> >                         |/
> > 
> > So clock a53mux rather than a53pll is actually the clock source of cpu
> > cores.  It makes more sense to flag a53mux rather than a53pll as
> > critical, since a53pll could be irrelevant if a53mux switches its parent
> > clock to be gpll0_vote.
> 
> Can you add some more detail here? I think the idea is to mark the mux
> as critical so that either a53pll or gpll0_vote is kept enabled, but
> only if they're used by the CPU. That isn't very clear from the commit
> text. Otherwise it seems OK.

Sure.  I will rewrite the commit log.

Shawn
