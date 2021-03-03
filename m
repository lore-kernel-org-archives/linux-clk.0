Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C775C4161F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 00:24:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2BA64EE6
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 00:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384022AbhCDAYZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352793AbhCCEPK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Mar 2021 23:15:10 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930C0C061788;
        Tue,  2 Mar 2021 20:14:25 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id o11so16335213iob.1;
        Tue, 02 Mar 2021 20:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zo3gUJWs9393wYgyXzymuxSeQ7dueyNuYkM5wpdwoFc=;
        b=MD552PY6y65xJrjhF29XV7iOg3/islIe+vIrmqoJmYDzIeMhb3J3GCX1PP6wiUYECp
         thgKt0/GztI/M5vFWL7FzGq3RdZ4kxnV5GgLZrUFzq1v3ykoCHipGjNHu1MOmLsLKRay
         P67sK1jFWaSZLQJ62O3l2GnlJz9k41+bF+4dEzsE2I7t3ocx/qE0v7D4miQrJOBOLS1E
         Z91retAEUT+LWCOV3+tq8p4Hl8UvhWMf1F/LkVKvwUQgjobj1axJFNfsec1vR15aXrLC
         PIZA1sAjI8xYS/9PIdqP6wtcLw1tUvI+r/RaA4hbMNLOPfXzgao3Ek4S9eKnLLqB2xCs
         ujTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zo3gUJWs9393wYgyXzymuxSeQ7dueyNuYkM5wpdwoFc=;
        b=dHw3CeoQxzKWW7rqt+NH5cJ19WTlhVu8CRp0irI1g4mOFBb9irmicXgyt7ejTmNVJH
         YuTW7gVJEd8ObMnLj7yVyqMh2CzRYhytOJ4udrFzGD2aelQfgVYkZOv9XYaWzix10Q9J
         PWCV5ZDBA9Op7LZAPOpLVe831FzdXTzzokBHDr1UodeavwtfiyU2FoIKs7/NClzeu+eP
         a4eZDWueE6JzImogZaGKAxi+3KIN17vlx6fH6PEzkH/Cjh98afGGMocFC56J3cFTkyXU
         S5i9sUQdi2QEvWDYngCh8YPaV6WSnZbZ3XAcs3rf8cqytt4wWSgIUUKtNhTtQmcUf5FW
         DPpw==
X-Gm-Message-State: AOAM53171sEV8Hs/jy3gSkLZryNozdADa4eUWFavxbgVDYVlMmvQJwBa
        D9k43cveFR9UKGHuqvCAFjnac0HyVjx+fG31pO8=
X-Google-Smtp-Source: ABdhPJzoKgmT7fYr2kid6o7rDtiDHt+lUnnHDYJTdjFjqvo6EX9gZlEDB1kVQp3jZgnUtq/0IqH1JIfqAQ/GqpxWl70=
X-Received: by 2002:a6b:be86:: with SMTP id o128mr20008278iof.111.1614744865089;
 Tue, 02 Mar 2021 20:14:25 -0800 (PST)
MIME-Version: 1.0
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1613623791-4598-2-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20210218092804.6c78c99c@xps13> <161369785558.1254594.14662342386099652001@swboyd.mtv.corp.google.com>
 <CAKfKVtH1rSc4d8MMZCegMNG8shNxgXfu6qTd9WxuaGGFMEJ6CA@mail.gmail.com> <161472644984.1478170.5535993198933302108@swboyd.mtv.corp.google.com>
In-Reply-To: <161472644984.1478170.5535993198933302108@swboyd.mtv.corp.google.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 3 Mar 2021 09:44:14 +0530
Message-ID: <CAKfKVtEvmMq6YB_0a-P-R2WcHYF3Ri80WYSYo_PFtG_Vxw+cUA@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] dt-bindings: add documentation of xilinx clocking wizard
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Wed, Mar 3, 2021 at 4:37 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Shubhrajyoti Datta (2021-02-24 06:10:08)
> > On Fri, Feb 19, 2021 at 6:54 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > > > +
> > > > > +  xlnx,speed-grade:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    enum: [1, 2, 3]
> > > > > +    description:
> > > > > +      Speed grade of the device.
> > > >
> > > > A bit of explanation of what this describes would be welcome.
> > > >
> > > > Don't forget that binding are not tied to any driver implementation,
> > > > these are supposed to be hardware description properties.
> > >
> > > Would opp tables work for this?
> > This is the parameter is for speed of the fabric.
>
> Ok. Yes or no? Is it configuring the speed of the fabric? Sounds like
> assigned-clock-rates or assigned-interconnect-bandwidth or something
> like that.

I do not think we could use opp tables.
Xilinx has products where we have partly FPGA and patrly PS(hardware
is not programmable) so the ip could be in PL
and the processor  in PS.

The speed grade influences a variety of timing parameters in the FPGA,
including fabric (slice), multiplier/DSP48x, BlockRAM, I/O, and other
resources parameters.

Basically the timing of the fabric is determined by it. Also we are
notifying the speed grade to the driver no configuration is done.
We are telling which speed-grade fabric we are running on.

 There is no correlation between these numbers. It is really a
relative metric of performance within a specific family.
