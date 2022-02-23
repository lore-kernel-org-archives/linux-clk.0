Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A695DC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 07:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbiBWHeG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 02:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235655AbiBWHeF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 02:34:05 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433354F9C9
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 23:33:37 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id d23so29425561lfv.13
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 23:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDlvFrajDqrQchn6w54uabpCbRnHwQwOc/C3bGmlO0U=;
        b=dPv5BYrzN39pPB63DQ2U4vLv0nOlr98gwht+Zo4QATaTg5q7prK52shXjsR/AXna6U
         k71RPBMDx5GsG8mV17b87tTN3iAWOTahxvggmsaI0oMlsVgEiZoXtDR87rqcGCLj6DI5
         Msk2/lY5YZo0wR4NNR2sUeLocDFc3Kpo8TpPo23Ye2kg3mFHuHr14max0+aI3TyZvlOF
         8/MHL9x9RtHFgI1bjFWYygEWBld8kk8y3weK7HbCIlbe9QeLYfl/cWhrdhEiwzJh2s+d
         gpokPBntHpV5rlru4h165pnoUlQhr32QsgOK4yvG8nWcE8dA1duH6MCTXNjLtpdQ1fOp
         IODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDlvFrajDqrQchn6w54uabpCbRnHwQwOc/C3bGmlO0U=;
        b=uqW7LTbCfwNsxBtjJmwgp4SiBhm6ziV2vXGouIru+PBA2rCNe1C1g+nuZOo5JwmrgY
         Y0QWtHOKIwh4lbwQ+jQcgxfz475j/sgvr6Kdpv59jYxAOjs4iIJyljvLRPuSLSnjlRwN
         gem8FhyuN2hGMdTaeDEZa/8U8SP89tm03BZ8zUU5Bgds5dBeRnvEkDsTlkhBw+Rbu9zB
         JygqdLwartGRKPfI7DdB49ZW4o/HYrtiSUxJzF6c1eoH7MTR6spOJocb8g6MSvDuDWus
         ezbnCsM15b/jvFQSmO7oWQewRw1l5WGBGMXlfOPGZnAcQJ/XHhpZFLM6FRm/8uxtkd+M
         nwYQ==
X-Gm-Message-State: AOAM530U/4yYpDmjASAl/aIHEr8oegJR9A5PXjur5EzrC2UYWa2t9t6t
        KtoLLPgzOJgbnDKV3XxLhbQlQY9JL6GIx6Z+SE1hGQ==
X-Google-Smtp-Source: ABdhPJw/GJqPBESH0NTsrjpQmSPMVgGSEkmdayQA8+Ukdar13GPBEALRgM9upMK7jU0EafwCI3f8KY3Ur+qVWLFe8VA=
X-Received: by 2002:a05:6512:710:b0:443:7fb6:5223 with SMTP id
 b16-20020a056512071000b004437fb65223mr19200205lfs.223.1645601615597; Tue, 22
 Feb 2022 23:33:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642582832.git.zong.li@sifive.com> <mhng-ffd770d4-8f8a-417a-a589-f14d09f55282@palmer-ri-x1c9>
 <CANXhq0pYHfsa4T1t=FK2=jM4OEfgXD=sDS5vVV4EKCpkwTz6og@mail.gmail.com> <20220218222339.9BF5CC340E9@smtp.kernel.org>
In-Reply-To: <20220218222339.9BF5CC340E9@smtp.kernel.org>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 23 Feb 2022 15:33:24 +0800
Message-ID: <CANXhq0qbjBpRPMP51cK9QsvQj-uvG_czPgLw+cjrWXhWEibcDw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Refactor the PRCI driver to reduce the complexity
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Feb 19, 2022 at 6:23 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2022-02-06 21:21:50)
> > On Sat, Feb 5, 2022 at 2:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > >
> > > On Wed, 19 Jan 2022 01:28:37 PST (-0800), zong.li@sifive.com wrote:
> > > > This patch set tries to improve the PRCI driver to reduce the
> > > > complexity, we remove the SoCs C files by putting putting all stuff in
> > > > each SoCs header file, and include these SoCs-specific header files in
> > > > core of PRCI. It can also avoid the W=1 kernel build warnings about
> > > > variable defined but not used [-Wunused-const-variable=], like 'commit
> > > > 487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
> > > > 'prci_clk_fu540' where it's used")' does.
> > > >
> > > > This patch set also contains the dt-bindings and dts change, because
> > > > we change the macro name for fu540 and fu740 by adding the prefix
> > > > respectively.
> > > >
> > > > Thanks all for your review and suggestions.
> > > >
> > > > Zong Li (4):
> > > >   dt-bindings: change the macro name of prci in header files and example
> > > >   riscv: dts: Change the macro name of prci in each device node
> > > >   clk: sifive: Add SoCs prefix in each SoCs-dependent data
> > >
> > > IIUC these there aren't bisectable: the bindings change will break
> > > builds of the DTs and drivers.  I'm not sure what's generally the way to
> > > go with these, but I always try to avoid broken builds in the middle of
> > > patch sets.
> > >
> > > Aside from that this generally looks good to me, but the DT and clock
> > > folks are probably a better bet for a proper review here.  Happy to take
> > > this through the RISC-V tree, but IMO it's a better candidate for the
> > > clock tree so
> > >
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from breaking bisect
> > >
> > > Thanks!
> > >
> >
> > Many thanks for your review and reminding, and yes, it seems a bit
> > hard there since the DT binding docs and includes need to be a
> > separate patch.
> >
>
> Why not add new defines with the same numbers in a different file? Then
> a cycle or two later the conflicting defines can be removed? The driver
> can include the new file with the new defines while the old defines can
> be changed in parallel?

Hi Stephon, many thanks for your tips. I'm afraid that I don't
completely understand, does it mean that I can create a new temporary
file to define these numbers for the driver, and add a patch to remove
this file in the same patch set. If I understand correctly, let me
prepare the next version for doing that. Thanks.
