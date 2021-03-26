Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9049FC433C1
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 01:57:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55434619FB
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 01:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhCZB44 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 21:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhCZB43 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 21:56:29 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F9DC061761
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 18:56:29 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id j2so4308770ybj.8
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 18:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hrB2LTPaVmnjj9DVoKtdE6xPWCuIJ5kDPF5kkoCFRTc=;
        b=JnpMerTMuvdTNr3jlTTTkhRSY71aQqnFp8O842+Bvp2NmhzWfvYc+uGEpNKJsdwnRM
         e1yOgfdB+lrlo+kBUD1j/mzMjn53F9cik3CYhSZDCKAZW5nAp5jb4I6AtpDMwctfjLG8
         5GhsCMKEfKscaztp1K6PellN2Eg/2nUM9QRb4u+2aLaE/ycCXjs6drgAhbkJHZhKuz2L
         zFbvp4v2Ao83LlrOm/mS/VXOBwPe4K4Ws6dW+1+vPun7VqiyhE4+4heQO25CxGzv/e+X
         Ia6Gs7vHxIjTM/2YrXaXm+n63tjtC9814owBgPYWw6jLS7kFDSiztEN/HZM/pGe333rJ
         ufKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hrB2LTPaVmnjj9DVoKtdE6xPWCuIJ5kDPF5kkoCFRTc=;
        b=TVDtTGrw3Js438vYstH/Img+JfQq/VtS66INU0wbpVln/ZCa0rk2HrSrAfZ4Hw/SVs
         S4oTCEtFM4MjlVY9/d+IcdgdxEtna1HuPRnKvk6fGZxE7YZpcZReKAVqh6j1oQ7PSWid
         UtEcqIhA8rlQ53UP1pgcH+n8Ypql/TW2q2xgR3KgdrAMHgBUJd4UIkkxSeVDQuHh8I3q
         XgCzR7yKqsu6TCV5xgt4DjzdDYUri8sOeydAbxyHk8i9GLop6NrDAHrrURJUz+goizeh
         rDRVZVLC0qAqacwKdZqzGZXpUkNJrHmR8z1fxcDdAowQYlUxKay4a64zPDQ12Y7A0RCR
         4A8Q==
X-Gm-Message-State: AOAM532nyfpBEJGTddu+qQ0jrGtZNDWLdhRhYCx3JblcNPLPVxChLiCz
        WK7fZD6tAdegzGJfQhacIkPHt6p7RGIAmphLP8QE0g==
X-Google-Smtp-Source: ABdhPJxB7xf3Rq3TkTdpnCGF1jh//fwqvy8Tw1KzgPM4FI1tQ/iWxL5DcuEXT+HJIN5Qz+6iVFT0wDINRX4gmrarveI=
X-Received: by 2002:a25:d3cf:: with SMTP id e198mr16063062ybf.228.1616723788120;
 Thu, 25 Mar 2021 18:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210316215123.GA3712408@robh.at.kernel.org> <20210318210318.144961-1-sebastian.reichel@collabora.com>
 <20210326012720.GA2113788@robh.at.kernel.org>
In-Reply-To: <20210326012720.GA2113788@robh.at.kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 25 Mar 2021 18:55:52 -0700
Message-ID: <CAGETcx9JmtbwAq_fpU5KfUzjcTw-uHPqKo3gAGjQwht=wxY8yg@mail.gmail.com>
Subject: Re: [RFC] clk: add boot clock support
To:     Rob Herring <robh@kernel.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 25, 2021 at 6:27 PM Rob Herring <robh@kernel.org> wrote:
>
> +Saravana
>
> On Thu, Mar 18, 2021 at 10:03:18PM +0100, Sebastian Reichel wrote:
> > On Congatec's QMX6 system on module one of the i.MX6 fixed clocks
> > is provided by an I2C RTC. Specifying this properly results in a
> > circular dependency, since the I2C RTC (and thus its clock) cannot
> > be initialized without the i.MX6 clock controller being initialized.
> >
> > With current code the following path is executed when i.MX6 clock
> > controller is probed (and ckil clock is specified to be the I2C RTC
> > via DT):
> >
> > 1. imx6q_obtain_fixed_clk_hw(ccm_node, "ckil", 0);
> > 2. of_clk_get_by_name(ccm_node, "ckil");
> > 3. __of_clk_get(ccm_node, 0, ccm_node->full_name, "ckil");
> > 4. of_clk_get_hw(ccm_node, 0, "ckil")
> > 5. spec = of_parse_clkspec(ccm_node, 0, "ckil"); // get phandle
> > 6. of_clk_get_hw_from_clkspec(&spec); // returns -EPROBE_DEFER
> > 7. error is propagated back, i.MX6q clock controller is probe deferred
> > 8. I2C controller is never initialized without clock controller
> >    I2C RTC is never initialized without I2C controller
> >    CKIL clock is never initialized without I2C RTC
> >    clock controller is never initialized without CKIL
> >
> > To fix the circular dependency this registers a dummy clock when
> > the RTC clock is tried to be acquired. The dummy clock will later
> > be unregistered when the proper clock is registered for the RTC
> > DT node. IIUIC clk_core_reparent_orphans() will take care of
> > fixing up the clock tree.
> >
> > NOTE: For now the patch is compile tested only. If this approach
> > is the correct one I will do some testing and properly submit this.
> > You can find all the details about the hardware in the following
> > patchset:
> >
> > https://lore.kernel.org/linux-devicetree/20210222171247.97609-1-sebastian.reichel@collabora.com/
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../bindings/clock/clock-bindings.txt         |   7 +
> >  drivers/clk/clk.c                             | 146 ++++++++++++++++++
> >  2 files changed, 153 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > index f2ea53832ac6..66d67ff4aa0f 100644
> > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > @@ -32,6 +32,13 @@ clock-output-names: Recommended to be a list of strings of clock output signal
> >                   Clock consumer nodes must never directly reference
> >                   the provider's clock-output-names property.
> >
> > +boot-clock-frequencies: This property is used to specify that a clock is enabled
> > +                     by default with the provided frequency at boot time. This
> > +                     is required to break circular clock dependencies. For clock
> > +                     providers with #clock-cells = 0 this is a single u32
> > +                     with the frequency in Hz. Otherwise it's a list of
> > +                     clock cell specifier + frequency in Hz.
>
> Seems alright to me. I hadn't thought about the aspect of needing to
> know the frequency. Other cases probably don't as you only need the
> clocks once both components have registered.
>
> Note this could be lost being threaded in the other series.

I read this thread and tried to understand it. But my head isn't right
today (lack of sleep) so I couldn't wrap my head around it. I'll look
at it again after the weekend. In the meantime, Sebastian can you
please point me to the DT file and the specific device nodes (names or
line number) where this cycle is present?

Keeping a clock on until all its consumers probe is part of my TODO
list (next item after fw_devlink=on lands). I already have it working
in AOSP, but need to clean it up for upstream. fw_devlink can also
break *some* cycles (not all). So I'm wondering if the kernel will
solve this automatically soon(ish). If it can solve it automatically,
I'd rather not add new DT bindings because it'll make it more work for
fw_devlink.

Thanks,
Saravana
