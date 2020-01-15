Return-Path: <SRS0=l8GQ=3E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F715C33CB1
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 05:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23F832467D
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 05:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="h+DJfabl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgAOFnQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jan 2020 00:43:16 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44583 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOFnQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jan 2020 00:43:16 -0500
Received: by mail-qk1-f196.google.com with SMTP id w127so14591760qkb.11
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2020 21:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VV6aOYpoC2q2Em6EQrcwUhEq6b9Yl+28VpEwnLT0CsA=;
        b=h+DJfablG7916162OA00JdupY60BQAzyzEv95mMuZPj6EFv2tNxCR8FZf+peJo36b7
         pkWojonjP1i46YVBFo0pHRsrODOkUxsDxeo+Tcd1sMRbpiw1S/dHzRwKSEjGc2oHbyXf
         QXO43pQ4Y38n6Y0hJeK0Oi7H1i7q2/iFqFOn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VV6aOYpoC2q2Em6EQrcwUhEq6b9Yl+28VpEwnLT0CsA=;
        b=uZUnoEMAxY3anLsmpLyXnxCrZKrqjiXfjYCa+hzC/qOQxPU+ZqMOMwEeOYTMkK0Mqh
         vpO5/6duSGloqQFsyFk2RtxF46qsXSnkRcpwOcP4JmVwyG/Iz3+AtQBWdNIbv72hrlD5
         wUL/lSszk0r1p4c2ZfT1Kr3yGoAHCT+An9/giIGMamWDczgllIaPoVFhNPzUyHB6vWZY
         cdyUybXYuP8546RbdrhT5RK2S5juIF+23Q0hEMhimdE39qE1OMcuYPehBikuEmpJHPPH
         97ed8dG9DW4qmP830wo/N5ACKKqssvQDnZhfN/sYE9r+KnSkgETPyqltDnzujuuA/Z88
         RPEw==
X-Gm-Message-State: APjAAAUdhGiaJXuxNAQwxMuQjYDkpyB0o6DmnEtWDEDA+NTJrbs3KM4K
        OrdHApqLcZtVXPFY4BGmw5zC11HZTqjcEWqeZ+U=
X-Google-Smtp-Source: APXvYqwrOmTBUExJJT1fUGv0npZvc0tXC2tVGawXY0yYpOu8/dlawk5v470gu5OXo54xyHwuUXcwtRpVGMvlfZrhZdY=
X-Received: by 2002:ae9:e702:: with SMTP id m2mr20840949qka.208.1579066995074;
 Tue, 14 Jan 2020 21:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com> <255b53d2-d4b5-8bc0-393b-a2f531a98fc1@linux.intel.com>
In-Reply-To: <255b53d2-d4b5-8bc0-393b-a2f531a98fc1@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 15 Jan 2020 05:43:03 +0000
Message-ID: <CACPK8XfevBQxdAanN5QjiUv8KKevetjKP7cbr3tuL=mrULjttg@mail.gmail.com>
Subject: Re: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 14 Jan 2020 at 19:53, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel,
>
> On 1/13/2020 10:15 PM, Joel Stanley wrote:
> > On Mon, 13 Jan 2020 at 21:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>
> >> BCLK for PCI/PCIe bus should be enabled always with having the
> >> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
> >> initcall phase as an unused clock, and eventually it causes
> >> unexpected behavior on BMC features that are connected to the host
> >> through PCI/PCIe bus.
> >
> > This is true for systems that have PCIe connected. There are systems
> > that do not, and in that case we don't want to have the clock enabled.
> >
> > Are you doing this to support the case where the PCIe device not load
> > a BMC driver? (eg for host VGA use). If not, then you can have the
> > driver you're loading request the BCLK.
> >
> > If this is for the host VGA device, then you will need to come up with
> > a mechanism that makes the enabling of this clock depend on the device
> > tree.
>
> Is there any way to enable clock by just adding a node in device tree?
> Do you want me to add a simple driver module for host VGA just for
> enabling BCLK?

Okay, so this is for the case where we lack a BMC driver.

One option would be to do as you suggest, adding a simple driver that
claims essential clocks.

Another could be to add some extra properties that clock driver parses
and enables the clocks.
