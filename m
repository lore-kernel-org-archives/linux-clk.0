Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AB2C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 08:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB1E522C7E
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 08:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgLUIws (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 03:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgLUIws (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 03:52:48 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49E4C061282
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 00:52:07 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id h16so4105182qvu.8
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 00:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8qKCILQuPxtNGC0KokeuabRQiz8j0EzP8ss9vMtRJ/s=;
        b=ljMnF4kXTh+rlfgGGfOtBXETNoDO/OUEZZmp5uyi8291WY0rW5X2Oen/kUUr4FonP7
         ntvV2pPq1HzUSUbnefJsOk2xnzK+yBNgXyau02As3Tk+bBbhxgXHgL9L13ZMSJxQe26+
         u4fVxXjCyfDTO9isZhlZf9xDNsR4afKI+LqoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8qKCILQuPxtNGC0KokeuabRQiz8j0EzP8ss9vMtRJ/s=;
        b=Lw2A9Zgsm8DN6x6IKAxBcp+JiKEMAUW+W3hPlaeOstJu+BJobFKnDYHl8Ypp3qyae2
         XYfFKREOr1GZZYu4hbWdBYRp98mallu/xW0KAENxFHxF0Q+0cmMHFmu3tdxxcA1G6DDF
         BybLi1SlKfUWhEbUg7rcRCWWZ9hMNU1/3CErCffW1OANM4hn7Sy5U5RZGjW4Vv1UjIU9
         0P664/xQxqVTMi2UIkNZza5CZsK6QyIuJstQdl9voY+Jf+k4PdHKobQCB6H2acPffir0
         SrtVGW0vENve5u+3o7a5CQK3ih/exvVaItCyHFafFNxlmCAE/BtPz5tD4YzQxKGbHPAA
         oFUw==
X-Gm-Message-State: AOAM533TF5S+i4kmWRWKL7uKrw87e8YKnxjvObGjWply7qAZPL+3/Qg5
        5CQcUeox2ZJngdHRG4iVO1Y81539SR/6AcaBg1fPNg==
X-Google-Smtp-Source: ABdhPJwFYHrXu3pafECFOZGz6Ntg1TFkEIWytSpgCb6xGX2GhMePLZ019Ky+9cAPobzPPe22v51njYl9woYl9NI97KU=
X-Received: by 2002:a05:6214:140d:: with SMTP id n13mr16093482qvx.45.1608540727170;
 Mon, 21 Dec 2020 00:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20201114135044.724385-1-daniel@0x0f.com> <20201114135044.724385-3-daniel@0x0f.com>
 <160843556037.1580929.13575770228476494246@swboyd.mtv.corp.google.com>
 <CAFr9PX=f=HyHBk4s3e_vnMDC53R1X18m7sKFCLMMjitPm+8oEQ@mail.gmail.com> <160848984935.1580929.936824086681978646@swboyd.mtv.corp.google.com>
In-Reply-To: <160848984935.1580929.936824086681978646@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 21 Dec 2020 17:51:56 +0900
Message-ID: <CAFr9PX=oLqQqvykiwOGAGg1H2CG0BTEqn0TuSrijodjxY52LxQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clk: mstar msc313 mpll binding description
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Mon, 21 Dec 2020 at 03:44, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Daniel Palmer (2020-12-19 22:35:41)
> > Hi Stephen,
> >
> > On Sun, 20 Dec 2020 at 12:39, Stephen Boyd <sboyd@kernel.org> wrote:
> > > > +  clock-output-names:
> > > > +    minItems: 8
> > > > +    maxItems: 8
> > > > +    description: |
> > > > +      This should provide a name for the internal PLL clock and then
> > > > +      a name for each of the divided outputs.
> > >
> > > Is this necessary?
> >
> > I found without the names specified in the dt probing of muxes that
> > depend on the outputs but appear earlier didn't work.
> > Also this same PLL layout seems to be used in some other places so
> > eventually I was thinking this driver would get used for those PLLs
> > with different output names.
>
> Still seems like it could be auto-generated based on dev_name() +
> number.

At one point I had something similar to that where the output names
were generated at probe.
Without the clock outputs listed in the device tree clock muxes that
source clocks from the mpll couldn't probe properly as they couldn't
look up all of their parents if they probed before the mpll.
Maybe I'm doing something wrong there? I couldn't find a way to always
resolve all of the parents or defer the probe of the muxes until the
mpll clocks are registered.

Cheers,

Daniel
