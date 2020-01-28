Return-Path: <SRS0=cvgE=3R=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EB4C2D0DB
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jan 2020 16:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E20E32173E
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jan 2020 16:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g7Y1ZJ7x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgA1QkX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jan 2020 11:40:23 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42554 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgA1QkV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jan 2020 11:40:21 -0500
Received: by mail-vs1-f65.google.com with SMTP id b79so8474417vsd.9
        for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2020 08:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZPnlKwuM4FAz94w/wTgs9ztHjlDWDu7abUtUf/0TNY=;
        b=g7Y1ZJ7xc9te/oiwLwAst1C/S6DT7qk70e9sQ2tkGD45oeiloTH8UFUxEbsmy5S9D+
         OUmrTYVC+RIsMWaP1pzTEPyHTVHVnHbUzZRtKqx3sNMLD9+6cBnlq+kVYdboPhlxpYRP
         fxVqUgqfYh30gHjir50S8jj9dVmigWcAkKgf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZPnlKwuM4FAz94w/wTgs9ztHjlDWDu7abUtUf/0TNY=;
        b=Kyg9Ojhco/XeSL4lk5OXLF1QyhXG8W3ygucjTaA0+VxqCNYuobGXCpA5Vb8VXBwiLC
         GTJtHmvHJ4cqW65xjqE/S81oKLBCjorhiaBD4m2iORyQpAqTG3hxbdQ9BnrYxePls+hn
         wVQUyfNaBdci9BcNXbX5PJG5ajLVAK85PDPUDfhtH9wP5cgEjf3bJU29UB3+nctayshT
         Ez+sEiA6783ouEw9gfvU5+2H8gHrzBU0iykAPb9aHwgk+IbaiN2VPZwdZgeeJ9chVLsj
         gYTrqdGI48bCpLDl+jts80mN6U1XJmLsMdP1NSL1QEVkGnD30jdOCoKvNS3l6OzQerdN
         4OvQ==
X-Gm-Message-State: APjAAAVwbuGeN5Fd/yg7ynfZ5gikft44YjeJ+FSAZBuR01KNxgkABRy4
        sDONeDCS/q2yv4xUqdAE8f4N0Cu/XCc=
X-Google-Smtp-Source: APXvYqxwqrq6Wo8T9BwliHb7ajkOq/s/UQT2XwLnKxDxoFC87mpgnVlXXEqPMkIUNPvmVfuKO9ZFlQ==
X-Received: by 2002:a67:f49a:: with SMTP id o26mr8281646vsn.124.1580229620065;
        Tue, 28 Jan 2020 08:40:20 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id w15sm3017798vsf.5.2020.01.28.08.40.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 08:40:19 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id f26so8484579vsk.10
        for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2020 08:40:18 -0800 (PST)
X-Received: by 2002:a67:fa1a:: with SMTP id i26mr1696397vsq.169.1580229618200;
 Tue, 28 Jan 2020 08:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20200124224225.22547-1-dianders@chromium.org> <20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid>
 <eeef68f4-127e-6d28-4a79-c1464a10c7db@codeaurora.org>
In-Reply-To: <eeef68f4-127e-6d28-4a79-c1464a10c7db@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Jan 2020 08:40:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WtkX0XFSKvzvGBBjoqRwWfJowJrowkp74vfXawgt3aKw@mail.gmail.com>
Message-ID: <CAD=FV=WtkX0XFSKvzvGBBjoqRwWfJowJrowkp74vfXawgt3aKw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: sc7180: Add clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 9:58 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Doug,
>
> Thanks for the patch.
>
> On 1/25/2020 4:12 AM, Douglas Anderson wrote:
> > From: Taniya Das <tdas@codeaurora.org>
> >
> > Add the display, video & graphics clock controller nodes supported on
> > SC7180.
> >
> > NOTE: the dispcc needs input clocks from various PHYs that aren't in
> > the device tree yet.  For now we'll leave these stubbed out with <0>,
> > which is apparently the magic way to do this.  These clocks aren't
> > really "optional" and this stubbing out method is apparently the best
> > way to handle it.
> >
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Added includes
> > - Changed various parent names to match bindings / driver
> >
> >   arch/arm64/boot/dts/qcom/sc7180.dtsi | 41 ++++++++++++++++++++++++++++
> >   1 file changed, 41 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 8011c5fe2a31..ee3b4bade66b 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -5,7 +5,9 @@
> >    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> >    */
> >
> > +#include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> >   #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> > +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
>
> My bad, but we are still missing the videocc header. I could send across
> the new patch.

Good point, thanks for noticing!  I won't spin with this right away as
we continue to discuss the driver / bindings patches.  If it turns out
that the rest of the series doesn't need to be spun I will be content
if Bjorn / Andy wants to make that fix when applying the patch, or I'm
happy to send a new patch.

-Doug
