Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2A6C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 22:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbiCYWiO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 18:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbiCYWiN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 18:38:13 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3330354FB7
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 15:36:38 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id yy13so18009788ejb.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 15:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qg7ujBMZYzhk0dMGhg+Hawnv+YTw2AKLqYpSrRHbwPE=;
        b=PQDwD/ugHFPWaTttlZ8eKSNFvL2JkGL+01nGsHdUmlVHQgdbTmZBthbsm41Bt3RPcL
         +l7YzpA9sdVgRBb1Pm3o/umL5Ob1jAuYRGuYRBmXYKSZ5Fhj3k9eDeUWSiAE+XwK4JUq
         f8WyOqylAfOF7waQOMiwSAzVb3TozGSwyLewq6kyi/HpSHqCdnuT0KazHsY5xqznVe1Q
         F8Y/cNtMHWF7IabNvGgeW+f1fb7lgBzFMQMFdk1qAW2taFCir13mdCX+SYZqR2DwMW30
         SopxvSQRoWfXUs117wru5Ts52g0I7geSkkQs+yEbXLo4cOeWa4F/BxdPTyZmSVkaFIe6
         ZeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qg7ujBMZYzhk0dMGhg+Hawnv+YTw2AKLqYpSrRHbwPE=;
        b=MTZ7JBwRPqrfI+zQKqANWQ5m2O9O4TLurEKfWMcqCB+PIsnP16PnOVlsmRULRztHVm
         eN7tVfaarHtDF09PX+kmqDqpibprECxswzaul7FV1KQygcr7+kpO4XXGYvROfCUsFUOG
         KghUJx4hALeheofBe8XRIVsvCO1Gqb1tH4fjeG8co3i+FJSof7KIyy6n6yDF8cG5lMAc
         C4KwV/P80nLFoz2AkSF6+GgwHwgA/x3Ep7mo5ND7PFPk4gHd5ablMWFL8AP0ukmMUqux
         eOYIPUociyyrUoVQ6L+En95qGAqhRAVKhSGkP9jjf0MfMOXNlsFdBraHC+THeSdn1tmi
         Jdpg==
X-Gm-Message-State: AOAM531usxv20M+sHmkPP5mATMt38GcU2uWQPz3wLP1Mqur0vbWvHUhu
        G0HAKzIBAKknmItv1lICluS6sEIPEKEPMUPB5vwXLg==
X-Google-Smtp-Source: ABdhPJzgbnKuhdw4bkORyFGwGg3q0RYoqg9heHRfftN+YkiyCldKAGW2fVqto01vl5pSJdaAp86bIEH2M5HLt8hQfKU=
X-Received: by 2002:a17:906:6a27:b0:6e0:3017:d3c2 with SMTP id
 qw39-20020a1709066a2700b006e03017d3c2mr14481204ejc.358.1648247796514; Fri, 25
 Mar 2022 15:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech> <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220225132258.55yh537iknxh72vw@houat> <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
 <20220228104718.yorlzq6264jtffak@houat>
In-Reply-To: <20220228104718.yorlzq6264jtffak@houat>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 25 Mar 2022 17:36:25 -0500
Message-ID: <CAGS_qxpu_OivRptp05gdSNhdSQzFUU_2bsdW1JSrs0c5bhGnrw@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 28, 2022 at 4:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Feb 25, 2022 at 01:29:03PM -0800, Daniel Latypov wrote:
> > On Fri, Feb 25, 2022 at 5:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Daniel,
> > >
> > > On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> > > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > Let's test various parts of the rate-related clock API with the kunit
> > > > > testing framework.
> > > > >
> > > > > Cc: kunit-dev@googlegroups.com
> > > > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > >
> > > > Tested-by: Daniel Latypov <dlatypov@google.com>
> > > >
> > > > Looks good to me on the KUnit side.
> > > > Two small nits below.
> > > >
> > > > FYI, I computed the incremental coverage for this series, i.e.:
> > > > 1) applied the full series
> > > > 2) computed the absolute coverage
> > > >
> > > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
> > > > --make_options=CC=/usr/bin/gcc-6 --kconfig_add=CONFIG_DEBUG_KERNEL=y
> > > > --kconfig_add=CONFIG_DEBUG_INFO=y --kconfig_add=CONFIG_GCOV=y
> > >
> > > I built a docker container based on ubuntu 18.04 to have gcc6 and
> > > python3.7, but this doesn't seem to be working, I'm not entirely sure why:
> > >
> > > [13:11:22] Configuring KUnit Kernel ...
> > > Regenerating .config ...
> > > Populating config with:
> > > $ make ARCH=um olddefconfig CC=/usr/bin/gcc-6 O=.kunit
> > > ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
> > > This is probably due to unsatisfied dependencies.
> > > Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
> > > Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".
> >
> > Did you perhaps drop CONFIG_DEBUG_KERNEL=y?
> > Need to add 3 config options in total for coverage.
> >
> > If I tweak the command I ran above but drop CONFIG_DEBUG_KERNEL=y, I
> > get the error message you get:
> >
> > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
> > --make_options=CC=/usr/bin/gcc-6  --kconfig_add=CONFIG_DEBUG_INFO=y
> > --kconfig_add=CONFIG_GCOV=y
> > ...
> > Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
> > Note: many Kconfig options aren't available on UML. You can try
> > running on a different architecture with something like
> > "--arch=x86_64".
>
> It looks to me that it's more that DEBUG_INFO isn't enabled.

Sorry for the very delayed response.
I was largely getting internet over mobile data around when this email
came in and didn't want to try and download docker images over that.

It looks like that there was another change that is now merged into
Linus' tree that causes this.

I found that adding this helped (thanks David Gow)
  --kconfig_add=DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT

Running against --kunitconfig=lib/kunit, my final coverage result is

Overall coverage rate:
  lines......: 13.6% (18004 of 132055 lines)
  functions..: 15.7% (1885 of 12010 functions)

Can you give that a shot and see if it works?

Daniel

>
> If I'm running
>
> ./tools/testing/kunit/kunit.py config --kunitconfig=drivers/clk
>     --make_options=CC=/usr/bin/gcc-6 --kconfig_add=CONFIG_DEBUG_KERNEL=y
>     --kconfig_add=CONFIG_DEBUG_INFO=y --kconfig_add=CONFIG_GCOV=y
>
> DEBUG_INFO isn't selected and I end up with DEBUG_INFO_NONE.
> DEBUG_KERNEL is enabled though.
>
> Maxime
