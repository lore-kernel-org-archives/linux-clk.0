Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149B3C4361B
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 06:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3C0E2312A
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 06:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgLTGgm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Dec 2020 01:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgLTGgl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Dec 2020 01:36:41 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC79C061282
        for <linux-clk@vger.kernel.org>; Sat, 19 Dec 2020 22:35:52 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id a4so2767561qvd.12
        for <linux-clk@vger.kernel.org>; Sat, 19 Dec 2020 22:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KQzSwVhVPrMTFiKK5zcVnTGXaTdTl16gjC5nDFjrik=;
        b=Ukp1RMF/5A86WTY3wlgY8TbBHP+KrFbjj7VPpakT259+bzIGqLx+zb8RNhwwNCJJbd
         2N05RB14y3DufQkCs+S3+a7Q1/gtsg9UNurHFe0OLUpvbTtB8BQa2LA61jsJOKRoiF/W
         si6VDNnGAIKUizeoNM/KNIFYU5h5SdOBPlc4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KQzSwVhVPrMTFiKK5zcVnTGXaTdTl16gjC5nDFjrik=;
        b=Z49y6NlnfokHBsNtSXVVpJq8q6QerODXp45+IzvSCI3gqZpCkneMoTPSs39pbCK1ep
         5Bm4FkOYQIHJ2GroK+nsg+G0MQQFcTOtkZAtaR7ynCyuujWydJRkB8hyeyEWPLTsLacE
         V0v3Az2TPIggdUJfEWDV8Ybc0bPU/0lE7Sildj277l/ddCWqp/LabznD6Z1Hd0N2Vr+K
         MJcz8zpiExi4GdjSYPnLkc+Vj2qmFNzaG4W+lFmObmUNRqMgZ1UvhNOapPLuj91v6a6c
         TLGhToxXFhrmrgNdO0pBttZCykY6Nbl6YryFuESaOGClgoZc/YenH+zwmJzzIxRD2VPp
         nvvA==
X-Gm-Message-State: AOAM531IPphG5Dd0wj4RNYYxnGr3EvXusjHQmJnHudM5eSkhTEYFgvVs
        8UTYSQaSmxREIQpCUUp4NlvKHCDEyNJlY+MLlhVoiA==
X-Google-Smtp-Source: ABdhPJxdPhtXXaO5QG2qMf+7byySCoi8Od7JhDQ6s4ZtD71A+pcvqZBFderGkPMbt0Flapkt1yKBMoyrHutfFgIm+Yw=
X-Received: by 2002:ad4:5a50:: with SMTP id ej16mr12406191qvb.25.1608446152018;
 Sat, 19 Dec 2020 22:35:52 -0800 (PST)
MIME-Version: 1.0
References: <20201114135044.724385-1-daniel@0x0f.com> <20201114135044.724385-3-daniel@0x0f.com>
 <160843556037.1580929.13575770228476494246@swboyd.mtv.corp.google.com>
In-Reply-To: <160843556037.1580929.13575770228476494246@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sun, 20 Dec 2020 15:35:41 +0900
Message-ID: <CAFr9PX=f=HyHBk4s3e_vnMDC53R1X18m7sKFCLMMjitPm+8oEQ@mail.gmail.com>
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

On Sun, 20 Dec 2020 at 12:39, Stephen Boyd <sboyd@kernel.org> wrote:
> > +  clock-output-names:
> > +    minItems: 8
> > +    maxItems: 8
> > +    description: |
> > +      This should provide a name for the internal PLL clock and then
> > +      a name for each of the divided outputs.
>
> Is this necessary?

I found without the names specified in the dt probing of muxes that
depend on the outputs but appear earlier didn't work.
Also this same PLL layout seems to be used in some other places so
eventually I was thinking this driver would get used for those PLLs
with different output names.

Thanks,

Daniel
