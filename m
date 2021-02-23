Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A5EC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 01:45:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49ECD64E57
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 01:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhBWBpV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Feb 2021 20:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhBWBpP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Feb 2021 20:45:15 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757A1C061793
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 17:44:35 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id z128so10270367qkc.12
        for <linux-clk@vger.kernel.org>; Mon, 22 Feb 2021 17:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T2LlCCT6zt358q3HdAnMzHHVxdjb2JCGvdj5DHbQbFY=;
        b=enjeBWihK/qhVzZdUUZ1nTSacCyf4mFjGMHWHuea5iiyYT44dZoUS6Uo4FR0o9PMHY
         06msOISTL65F4REAtjvQHAAhGWHuH33jTFUohh++SuVZcGmKQWR891ZRiMk0b5kSl7An
         LwI5S5NldfBrK5BEtQJ6QJeB43dnB945gc8js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T2LlCCT6zt358q3HdAnMzHHVxdjb2JCGvdj5DHbQbFY=;
        b=ZH3yMLpHrsEB2v+RbpZq5T/wxg4VMlfS4FaXPkqgN49LNxcAefvbUgx/n1ExLGjbsx
         ILL/ljWUrRpLc5KvVBjRDpGm3+Tv1bRs9cIMcqIGDrXBZFBJqlFcf6wpjTcHsSDz/glM
         r7OQKallgBOpg1b6dpSTyTleQALcIuC9X3QoUro4uQXauaUawTi8dqAco8jm04aQRUvc
         I6edR849DG4u2kO0gprBOj973Q4JZhMBZz3vNasehPGlTCpRjHr/O4i+BlJTwPbJoI2Q
         GmxYB0h5LLe6YvokCAxluaVyKdf5YGR735XGVZGV6hx4wxOukKVPTJuYHhQiVG5jCpTq
         VhkQ==
X-Gm-Message-State: AOAM531S7JJ5OCWVeqi5DRpv3hpUOY6vkEgowHHe1uVMNQnLYy+xBgt6
        STYpHDpf9zamyAmJITbk8HUN5qGW7vBQHgkAmGo7nw==
X-Google-Smtp-Source: ABdhPJw858HVZIWbHL+u++qtIQfY42d7VcRXfkLZLkj6Q7cWPABWtwGIMWCbKgKSxuVAxQe1guSCEm0AFoSKjx10idg=
X-Received: by 2002:ae9:de85:: with SMTP id s127mr7564183qkf.468.1614044674272;
 Mon, 22 Feb 2021 17:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20210211052206.2955988-1-daniel@0x0f.com>
In-Reply-To: <20210211052206.2955988-1-daniel@0x0f.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 23 Feb 2021 10:44:23 +0900
Message-ID: <CAFr9PXkvJN2AwTFTXLoTFj988LD+53eW4Y28nJ2M+7YygBJ58g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] ARM: mstar: Basic MPLL support
To:     Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Cc:     Willy Tarreau <w@1wt.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Arnd and Olof,

On Thu, 11 Feb 2021 at 14:22, Daniel Palmer <daniel@0x0f.com> wrote:
> Daniel Palmer (7):
>   dt-bindings: clk: mstar msc313 mpll binding header
>   dt-bindings: clk: mstar msc313 mpll binding description
>   clk: fixed: add devm helper for clk_hw_register_fixed_factor()
>   clk: mstar: MStar/SigmaStar MPLL driver
>   ARM: mstar: Select MSTAR_MSC313_MPLL
>   ARM: mstar: Add the external clocks to the base dsti
>   ARM: mstar: Add mpll to base dtsi

The first four patches have now been merged.
I forgot to send these to the soc patchwork so I think the last 3
didn't show up on your radar..
What do I need to do to get the last 3 merged?

Thanks,

Daniel
