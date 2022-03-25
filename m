Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1790CC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 22:45:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234115AbiCYWrZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 18:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234122AbiCYWrD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 18:47:03 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E357E214F9E
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 15:44:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id dr20so18007738ejc.6
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1sB3W5P7kfkX5Y6+wgKyaJsMVtca1i3NA1yidjhIyc=;
        b=M1AW+EKiR5QUfG4lC4tW1M1+VJglcIMEanycGJO9gfy0rY9dP40g8xffWcS5hQVs6l
         VuxoQP2Tuo9gnXfE7ApCTK0mHJzyEtRUInECdx1JfTUkj6Zjht2kI8RZ0lx8CI3g3DWa
         6W5r+5ZYDJEGeMtGz0xH5dnh7YquKnCLnKiARcqPEo2cBJ3m7mTg3gEL572VPbBGqTJJ
         2WmCk0qQ1VmMzdRWiWU0sKgvDhLM7guvuAQY87ziH4hAIiH9FaRun/k3FhzqbSu9FLQK
         px4Cf6jIWFaSuH0WnmNT9tECkjAcDGE7enjH1yzezxEo/07EE5fAx+JAsPyl7gj2hiZo
         uF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1sB3W5P7kfkX5Y6+wgKyaJsMVtca1i3NA1yidjhIyc=;
        b=bJzIVMEUW8yyswAOv9+S4oizqQ3+jns73kECA40R4I3KIN07C3hpbxGdf9lGI4F0aI
         Nx2RTvIzH2wqZH2s2PZ2yDT56lGerTqgCMJ5hclfZaT9rvjiPW0ojbUotlMqBnhptuw2
         GtOlNOQrp5vbMmfS5MUE1NCQ963D/Cobh2od6ylduOJQe1aCKUbzXFeve+oMMMUixhq8
         emvDhs4ubDRfbWBUHMj6OHNB7FF6bJGccNa9AGSPcH2pkDNXVO5p8BaLxBwX4qpoWaNM
         f+UbYJH+3UzmqmNIIrtfhA23yE/T5kqW8Vb7Bytq8LPnqFRnBGQX8ndjV3ek57PKPM5i
         G9tQ==
X-Gm-Message-State: AOAM530bBwfsJO6f3SMcewX6HP5gBmAPMF6zwdPvhkGbXvX779cr71AD
        mXstdGUCAlXyha6MjFVBDYKMNgMWXnXB+39p5yzZSw==
X-Google-Smtp-Source: ABdhPJxZOx7msGiBvM6UU3aV8NTwAHeYNWpylGCBVzOUf0ySSC/sM7uMMlfg/Ism4TemTQElCbwVMHiokV01PksPyUY=
X-Received: by 2002:a17:906:6a27:b0:6e0:3017:d3c2 with SMTP id
 qw39-20020a1709066a2700b006e03017d3c2mr14512163ejc.358.1648248298071; Fri, 25
 Mar 2022 15:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech> <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220224225422.98298C340E9@smtp.kernel.org> <CAGS_qxrDs5RYa4nxNR2ghsyBhgVyMHApi+GJKzGxF7FvNHe9dQ@mail.gmail.com>
 <20220325211949.77643C004DD@smtp.kernel.org>
In-Reply-To: <20220325211949.77643C004DD@smtp.kernel.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 25 Mar 2022 17:44:46 -0500
Message-ID: <CAGS_qxrtAMcTfkFDJFZryz5fvJ2o=FbXOg+cjL-SQFX+-ETZeA@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 25, 2022 at 4:19 PM Stephen Boyd <sboyd@kernel.org> wrote:
>

<snip>

> > >
> > > This is cool. Thanks! Is it possible to add some 'coverage' command to
> > > kunit so we don't have to recall this invocation?
> >
> > This is documented at
> > https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips.html#generating-code-coverage-reports-under-uml
> > It also includes pointers on how to use lcov to process the .gcda files.
> > I wrote it before --kconfig_add existed, so it just looks a bit different.
> >
> > The main blockers to directly supporting this in kunit.py are
> > 1.) this only works on UML
> > 2.) it needs gcc-6 or lower (and the kernel's min version is 5.1, iirc)...
> > 3.) in kernels older than 5.14, this requires some more hacks to get
> > working. So for the large portion of us stuck dealing with somewhat
> > older kernels, we'd have to do stuff manually anyway.
> >
> > For #1, we'd need different kconfig options and kunit.py's QEMU would
> > need some sort of userspace (busybox should be sufficient).
> > For #2, I don't recall what the precise issues were anymore. But I
> > think there were some more issues in gcc 8 or 9... :(
> >
> > >
> > > >
> > > > 3) intersected that with the total diff
> > >
> > > This would also be cool to do automatically with a revision range.
> >
> > Hmm, can you elaborate?
> > I assume you mean other revision ranges beyond this patch set?
>
> I mean somehow to tell kunit.py that I want incremental coverage
> information for a git revision range so that I can say something like
>
>         kunit.py incremental HEAD~3..HEAD
>
> and have it tell me the line coverage.

Yes, this is doable.

The steps I did were
1. generate coverage.info file per steps above
2. git diff HEAD~ > /tmp/inc.diff
3. <my personal script> --info=coverage.info --diff=/tmp/inc.diff

We'd just change step #2 to be `git diff HEAD~3..HEAD > /tmp/inc.diff`

As mentioned upthread, unfortunately my personal script in step #3
isn't open source or open sourceable atm.
I wrote it using some internal company code for parsing LCOV .info
files out of expediency, but there's nothing too complicated about it.
Just need to find what lines were "added" and intersect that w/ the
coverage data.
