Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4B4C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 21:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbiBYV3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 16:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbiBYV3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 16:29:48 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1103F1BB710
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 13:29:16 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id z22so9182945edd.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 13:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bJMSJztcyvLoxtow0XyAeaQGFm481N5pIXgrowsUISw=;
        b=r7r3KX4u6nAR5PqV1oT+anywV15IdXHYSF4ra2WHVLAa4gjMvV/1SBu/yioOqjhjQc
         d0z9lwuywAwSKjKM7DSXKmaXKA72ydqiAY6yu3Inlo/Fkuwfz1dOmcBnOWXZSm8p+4jE
         pfZyuHpLvJWLISF5/SVwIz/X7NHi6vrhoks5fEJagF8gApffaoqMRv7Y0pSKGOq9RrcX
         qrpR/1GzEsqEBlqE5wEi4pwwnJ+kJlaeEN25aKDEkNiHMTr3jqH6VaghtvXP67FV3kuZ
         dRN9vmZSUSpWrHpUNr5RzV/f5xBxTv17PQHeDv+r+S4aQCnYbq8e5wGr3x5059Ac+J5W
         vofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bJMSJztcyvLoxtow0XyAeaQGFm481N5pIXgrowsUISw=;
        b=CL/38y/2YFtib+27CEW+PLtEG9h3qeFYbfPwibjV6S3+LoHfC3VmVAd4AVNex8GCiI
         D/JoJgscbKN/6/A7GGcBFN/iidRD/HP52fE0L/BjMplLt8YiMFm/pdbkMFz7KEsGefa5
         /l1gcIv/N+u+NYn0zg5/uYwZDY9brv6NQ+8LfI8b8ccNcqbVrPP9Swt45wUdkZCrGrVS
         Sa56DlOfjKnIt31+NpbPJ/ifjLBrtorJI6Uu/YuT8uivKxnLTcO3+Y14JJ1RECvz9Nqe
         qt2gM/Aki0JYiwIlRvTDLrM1MS6g8JOiLPVgNLEbh9Lga6ehZv2jZV09jmGWHTEPgPYx
         Hh3w==
X-Gm-Message-State: AOAM533YsXFKRlebd0idH9sJRJzxkelbybuv3UKRnPG0Q377dDckFJ10
        wCjk6Z167XaUG+40jroJvo/6q6FjYiaUxCEzs+iwgRbTufmq7A==
X-Google-Smtp-Source: ABdhPJzTpdDC2RGPYvZlxFpRJzPf3pwM1WZoJ1jMgBJfcs54l75bjiD63Gf63/FS8RLZzsrJgN67D4j+QYrIG5d/L/A=
X-Received: by 2002:a50:fd97:0:b0:410:c0be:f4c1 with SMTP id
 o23-20020a50fd97000000b00410c0bef4c1mr8788096edt.313.1645824554408; Fri, 25
 Feb 2022 13:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech> <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com> <20220225132258.55yh537iknxh72vw@houat>
In-Reply-To: <20220225132258.55yh537iknxh72vw@houat>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 25 Feb 2022 13:29:03 -0800
Message-ID: <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
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

On Fri, Feb 25, 2022 at 5:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Daniel,
>
> On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Let's test various parts of the rate-related clock API with the kunit
> > > testing framework.
> > >
> > > Cc: kunit-dev@googlegroups.com
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Tested-by: Daniel Latypov <dlatypov@google.com>
> >
> > Looks good to me on the KUnit side.
> > Two small nits below.
> >
> > FYI, I computed the incremental coverage for this series, i.e.:
> > 1) applied the full series
> > 2) computed the absolute coverage
> >
> > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
> > --make_options=CC=/usr/bin/gcc-6 --kconfig_add=CONFIG_DEBUG_KERNEL=y
> > --kconfig_add=CONFIG_DEBUG_INFO=y --kconfig_add=CONFIG_GCOV=y
>
> I built a docker container based on ubuntu 18.04 to have gcc6 and
> python3.7, but this doesn't seem to be working, I'm not entirely sure why:
>
> [13:11:22] Configuring KUnit Kernel ...
> Regenerating .config ...
> Populating config with:
> $ make ARCH=um olddefconfig CC=/usr/bin/gcc-6 O=.kunit
> ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
> This is probably due to unsatisfied dependencies.
> Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
> Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".

Did you perhaps drop CONFIG_DEBUG_KERNEL=y?
Need to add 3 config options in total for coverage.

If I tweak the command I ran above but drop CONFIG_DEBUG_KERNEL=y, I
get the error message you get:

$  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
--make_options=CC=/usr/bin/gcc-6  --kconfig_add=CONFIG_DEBUG_INFO=y
--kconfig_add=CONFIG_GCOV=y
...
Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
Note: many Kconfig options aren't available on UML. You can try
running on a different architecture with something like
"--arch=x86_64".

>
> Thanks,
> Maxime
