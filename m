Return-Path: <SRS0=wiT5=RJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A58C43381
	for <linux-clk@archiver.kernel.org>; Wed,  6 Mar 2019 04:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6091020675
	for <linux-clk@archiver.kernel.org>; Wed,  6 Mar 2019 04:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PneuEQz/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfCFEMJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Mar 2019 23:12:09 -0500
Received: from mail-it1-f194.google.com ([209.85.166.194]:35465 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfCFEMJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Mar 2019 23:12:09 -0500
Received: by mail-it1-f194.google.com with SMTP id 188so8193883itb.0
        for <linux-clk@vger.kernel.org>; Tue, 05 Mar 2019 20:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=StaGLvBUS5TkIV4j1JexcDZXarlMywUEPr5FgW/yy0o=;
        b=PneuEQz/skP/WogMeUOW+UYsnaNE/hhVPn4Zv7tbSkwSNBVpHGZBTsOFMOlRXox3dq
         4gNhG4yWKXNgsToj0PufVCK0vKMTZvDZIRi2hR+xwSpsXhJRPx7feF3xe7PxoqQpj2xl
         a7ES/NWzqQ1YKpH0+LLop6IVIBGc213WPiNGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=StaGLvBUS5TkIV4j1JexcDZXarlMywUEPr5FgW/yy0o=;
        b=FKjZCV1rqwajZTeV8jrUPHUOZ5x9MAJYKSkWzSCD25DY4zs1eHEaQ33+W5DtC5EjvD
         FDHxvYXuaTajMRJeGoYDxDRMLybPDcIIiM4tuHqSMM1naswBBCjDnAlxUfO3E2Jodu1d
         70uUZzUJas8XwcOl2enHB44ELmttHG7TZfC/M4nBhyA79LtDz5BPcgGujNDUK0Ti1zux
         Skyi4ruGza6M7/EyNlLEwq8Jf1s3CRaRT3lA6PUpiEV8XHypRNXNNPAytS+L7YueEgjW
         iAyeCHPOJgMKL8ApMImb7yFOo2trkDC3rGGwiATOWe4HX4dq01pvO4JLimA2Ggn70xFm
         38MA==
X-Gm-Message-State: APjAAAV7oMhSd5FXXsEMPygPJAe42S69088BECFWo7e81z5tmgZH3M8V
        0ul14zBAN4RE9TFQqkAmKJjS+SRn00lGTtU4kOt3yA==
X-Google-Smtp-Source: APXvYqzzglElDR1D4t81plRiZtamMX56ugLYpYTHsVMIRqPBa76+GJwz3Vhuamnt3DPyIOFqzcF9CAFlAI2q+Jptzao=
X-Received: by 2002:a24:338a:: with SMTP id k132mr930699itk.123.1551845528178;
 Tue, 05 Mar 2019 20:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20190305044936.22267-1-dbasehore@chromium.org>
 <20190305044936.22267-2-dbasehore@chromium.org> <155181177527.20095.15680753964583935841@swboyd.mtv.corp.google.com>
 <CAGAzgso9-1j2XDsHQn+RbSTtV8Vqideu_nG=2qCJD94iyaxFFQ@mail.gmail.com>
In-Reply-To: <CAGAzgso9-1j2XDsHQn+RbSTtV8Vqideu_nG=2qCJD94iyaxFFQ@mail.gmail.com>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Tue, 5 Mar 2019 20:11:57 -0800
Message-ID: <CAGAzgsp0fWbH1f7gRKvhTotvdHMAL8gWw1bTKpVHfW9hJddXAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] clk: Remove recursion in clk_core_{prepare,enable}()
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, jbrunet@baylibre.com,
        Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 5, 2019 at 5:35 PM dbasehore . <dbasehore@chromium.org> wrote:
>
> On Tue, Mar 5, 2019 at 10:49 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Derek Basehore (2019-03-04 20:49:31)
> > > From: Stephen Boyd <sboyd@codeaurora.org>
> > >
> > > Enabling and preparing clocks can be written quite naturally with
> > > recursion. We start at some point in the tree and recurse up the
> > > tree to find the oldest parent clk that needs to be enabled or
> > > prepared. Then we enable/prepare and return to the caller, going
> > > back to the clk we started at and enabling/preparing along the
> > > way. This also unroll the recursion in unprepare,disable which can
> > > just be done in the order of walking up the clk tree.
> > >
> > > The problem is recursion isn't great for kernel code where we
> > > have a limited stack size. Furthermore, we may be calling this
> > > code inside clk_set_rate() which also has recursion in it, so
> > > we're really not looking good if we encounter a tall clk tree.
> > >
> > > Let's create a stack instead by looping over the parent chain and
> > > collecting clks of interest. Then the enable/prepare becomes as
> > > simple as iterating over that list and calling enable.
> > >
> > > Modified verison of https://lore.kernel.org/patchwork/patch/814369/
> > > -Fixed kernel warning
> > > -unrolled recursion in unprepare/disable too
> > >
> > > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > > ---
> >
> > From the original post:
> >
> > "I have some vague fear that this may not work if a clk op is framework
> > reentrant and attemps to call consumer clk APIs from within the clk ops.
> > If the reentrant call tries to add a clk that's already in the list then
> > we'll corrupt the list. Ugh."
> >
> > Do we have this sort of problem here? Or are you certain that we don't
> > have clks that prepare or enable something that is already in the
> > process of being prepared or enabled?
>
> I can look into whether anything's doing this and add a WARN_ON which
> returns an error if we ever hit that case. If this is happening on
> some platform, we'd want to correct that anyways.
>

Also, if we're ever able to move to another locking scheme (hopefully
soon...), we can make the prepare/enable locks non-reentrant. Then if
anyone recursively calls back into the framework for another
prepare/enable, they will deadlock. I guess that's one way of making
sure no one does that.

> >
