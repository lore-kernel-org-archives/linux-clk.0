Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2EAC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 20 Nov 2021 11:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbhKTLwX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 20 Nov 2021 06:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbhKTLwX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 20 Nov 2021 06:52:23 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16D0C061574
        for <linux-clk@vger.kernel.org>; Sat, 20 Nov 2021 03:48:49 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so20944953otl.3
        for <linux-clk@vger.kernel.org>; Sat, 20 Nov 2021 03:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7G6QcmEBO/4QvVoA6Ewcl2g2FfnDVaOiHxvOLRJdhE=;
        b=W6AtvQrc60Zk2yIWCuynOG6WiJbcMZdvyYToENTnkU3jiLhWDr+IDiwCnyebto1mZh
         G3GIuDNr9JgukT9owzZPS8xTzRPjEItpf+nVC+l7zAOz8Gxgv1tl2wH5C4iPzaFGPX9i
         Ga9mCjDju440xEnyGYdAAA8yMJ94ByXiZoYRi4BCLpzjltQQgMEjj6T+U8srpM+0OF8D
         VuwhhKePhiOknIhskdaafqA54GYgqaVeyGrCnAoIQn4D7vJZSQQi4MnTPBuyMpcEJWlo
         iGNfqgSiW2lmo6587N3Xya12AHn9DiIo35dXtnNnGEQe9m4eqYZU4ZgXsoSXwG63r4pX
         q0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7G6QcmEBO/4QvVoA6Ewcl2g2FfnDVaOiHxvOLRJdhE=;
        b=flJmuXMNkJ/TmvEpmLDG5JX22y6ciyYO5p9QoKLGSzFMGraenPPKSDUnCzAuZMvD53
         Eu1hIe/WPh3COQQyGZoImJNj63kcI639+DR6QdvhWbVNGdsM6cPxODqGWhkEv0rLY7gz
         wRuFLWnTOCtWpv5KED3fpXRS5AthdlkP4N6G/7wIeszlmSA0se0VxYBkGOD05XcmNZrs
         Rb0Xnws9CkP/ElFT7MG7JnxPveKsERJWrDsEDhnK1ZETwcD7vjdDsF3mFwgZgvxYQ1SZ
         eMbh7fkuEZvNaqwtLYvvI+aiqRSnPTIWg028wvUzfh4AIXu6enC/I1msDhxsAcnOne/c
         SIqQ==
X-Gm-Message-State: AOAM530KfH8MCiIcBI16VOp3mpyRELi36YWp+iWvwmsqCssuqcOsmbqN
        tG4+xnR4mcOHefly6FTxAsyrlbN0ThlxHBSsl/r+YA==
X-Google-Smtp-Source: ABdhPJw966guRO0zl7dus0LA76BJpT77ax03oHV1BIU93Hpr2+ZCLJuLo1QLMSj2nihDJfGDWdDGfl1w2ZOsUbqkS0o=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr11323428otg.179.1637408928971;
 Sat, 20 Nov 2021 03:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20211120062719.21395-1-rdunlap@infradead.org>
In-Reply-To: <20211120062719.21395-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Nov 2021 12:48:37 +0100
Message-ID: <CACRpkdbcQc=gEeZiM65tauNMZpw5BhLQY6Ez5F=WvbKmfL4xTg@mail.gmail.com>
Subject: Re: [PATCH] clk: Gemini: fix struct name in kernel-doc
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Nov 20, 2021 at 7:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix a typo in the struct name in the kernel-doc notation so that
> kernel-doc won't complain about it.
>
> Fixes this warning:
>
> drivers/clk/clk-gemini.c:64: warning: expecting prototype for struct gemini_data_data. Prototype was for struct gemini_gate_data instead
>
> Fixes: 846423f96721 ("clk: Add Gemini SoC clock controller")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: linux-clk@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
