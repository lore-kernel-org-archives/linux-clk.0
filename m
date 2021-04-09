Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0504C433B4
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 18:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71F3F610E7
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 18:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbhDISZt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 14:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISZt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Apr 2021 14:25:49 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BBEC061762;
        Fri,  9 Apr 2021 11:25:35 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id d12so6655315oiw.12;
        Fri, 09 Apr 2021 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XUwBZUIdBCe74mKRCTmXiOFT82hGtbwtAggnZMTDalU=;
        b=QdE5rJL/Do6zGFoWPgKbYf6N+crihJyOfs67So29daQxVGUXrWLWdb0u0ZeYPbFxiN
         En8k5O17/O7V8BsQH767ggdzxXa8qp1mAbZxXK/S0vfIYSxtaqVML+xLp/Fo8LCnMv7I
         pihEgXn0Dv36IzeGtI7+wulpUWoQCNGhFYMXn8ZRw4zfoRnAg/Jyend9YuUqiB9AS9kl
         8SuYXBp6buUwNuqHIjd1LiGLh1nBVaJWBs2G6sMb9HoqLpYSXdVP/wcITuPs0zHmHjkj
         V6wH/gGNx9f+JtdQYLls/avqr9ZlOvvpxPr3XU8gEKgbsfsQRR8YY/K2sdQrHhewXek9
         RHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XUwBZUIdBCe74mKRCTmXiOFT82hGtbwtAggnZMTDalU=;
        b=TfdetAtwtE+1hZx+EKJcQlmc7Gj7nwYxz5M22Dh2+oWEMWfaMIgCjNiMF/mBqN7gWt
         n8oHgYcXMqoO59Lx94qArpNsqsTMlmXt7IKqR/egndWZFfgsGfRMdpaS6K3nyXAXyp7a
         482D1gjIiW9Xu1L233toMTieXfqhv6nRdveslzrynd1h/FB9Zb4HoYZGaC9oAtV1pq7W
         PfzfgwWMhngyOkANuE8n8xZURZuu3q26o7E05Skows/aQor2VDpIAtMc8YkuLJOSMdY1
         R+Su2oc844D/a3fV2g6rADM/n9cQosmYpsw40nejUc9FfTBqe9xfA/WIQ8qDhYmlT47Q
         3BfA==
X-Gm-Message-State: AOAM5324zsTsv/8sqIxSnfalFuVzB8HN3zmyo9hO8KBhUWONnL9E06dq
        GF2JgeR08N04H6pI8ODjmiTQdGJpdWP9cVRYcYpaPMdvBFE=
X-Google-Smtp-Source: ABdhPJx50B8qHN4UZH288IFG4pkAfPqaqPbgFC6d5jfFePzNb9mE5m9W1WnXUOJzVv4Uqo/2CVF79jwdI+G8Z7h579U=
X-Received: by 2002:aca:534c:: with SMTP id h73mr68804oib.158.1617992735402;
 Fri, 09 Apr 2021 11:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
 <CAMhs-H_zBqe_+dKV4KT3QyOaONErmnCKME4-7ey2CnWJfUVseg@mail.gmail.com> <161799224004.3790633.10957084716451758402@swboyd.mtv.corp.google.com>
In-Reply-To: <161799224004.3790633.10957084716451758402@swboyd.mtv.corp.google.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 9 Apr 2021 20:25:24 +0200
Message-ID: <CAMhs-H98xzfK4W9KGSKR0QPtm42_K6Y5PzWiA3c-Pugau7oxyQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] MIPS: ralink: add CPU clock detection and clock
 driver for MT7621
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        COMMON CLK FRAMEWORK <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, open list:MIPS
        <linux-mips@vger.kernel.org>, open list:STAGING SUBSYSTEM
        <devel@driverdev.osuosl.org>, NeilBrown <neil@brown.name>, linux-kernel" 
        <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Fri, Apr 9, 2021 at 8:17 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2021-03-23 01:13:22)
> > On Tue, Mar 9, 2021 at 6:22 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > Changes in v11:
> > >  - Collect Rob's Reviewed-by in bindings documentation patch.
> > >  - Fix MAINTAINERS patch using file 'mediatek,mt7621-sysc.yaml'
> > >    for documentation bindings.
> >
> > Something still missing or something that is needed to be fixed to get
> > this series applied through your tree?
> >
> > Thanks in advance for your time.
> >
>
> Sorry I missed this series. I thought it was going through another tree.
> It can merge through clk tree. Just a few nits on the clk driver patch
> but otherwise I've merged the first two patches. If you resend in the
> next few days it would be great. Thanks.

I will hopefully do during this weekend. Since you already merge the
first two patches, the remaining four should be sent as v12, right?
